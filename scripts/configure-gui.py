#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
WriteTextAmp Workspace — GUI de Configuração Interativa

Interface gráfica amigável para configurar o workspace de marketing.
Permite selecionar MCPs, preencher API keys e instalar dependências.

Requisitos:
    pip install tkinter (geralmente já vem com Python)
    pip install pillow (para ícones, opcional)

Uso:
    python scripts/configure-gui.py
"""

import os
import sys
import subprocess
import tkinter as tk
from tkinter import ttk, messagebox, filedialog
from pathlib import Path
from typing import Dict, List, Optional
import json
import webbrowser


class MarketingWorkspaceGUI:
    """GUI para configuração do workspace de marketing."""
    
    def __init__(self, root):
        self.root = root
        self.root.title("WriteTextAmp Workspace — Configuração")
        self.root.geometry("900x700")
        self.root.resizable(True, True)
        
        # Workspace root
        self.workspace_root = Path(__file__).parent.parent
        self.env_path = self.workspace_root / '.env'
        
        # Configurações
        self.config = self.load_existing_config()
        self.mcp_selections = {}
        
        # Cria interface
        self.create_widgets()
        
    def load_existing_config(self) -> Dict[str, str]:
        """Carrega configuração existente do .env."""
        config = {}
        if self.env_path.exists():
            with open(self.env_path, 'r', encoding='utf-8') as f:
                for line in f:
                    line = line.strip()
                    if line and not line.startswith('#') and '=' in line:
                        key, value = line.split('=', 1)
                        config[key.strip()] = value.strip()
        return config
    
    def create_widgets(self):
        """Cria todos os widgets da interface."""
        # Notebook (abas)
        self.notebook = ttk.Notebook(self.root)
        self.notebook.pack(fill='both', expand=True, padx=10, pady=10)
        
        # Aba 1: Boas-vindas
        self.create_welcome_tab()
        
        # Aba 2: Seleção de MCPs
        self.create_mcp_selection_tab()
        
        # Aba 3: API Keys
        self.create_api_keys_tab()
        
        # Aba 4: Instalação
        self.create_installation_tab()
        
        # Aba 5: Conclusão
        self.create_completion_tab()
        
        # Botões de navegação
        self.create_navigation_buttons()
    
    def create_welcome_tab(self):
        """Cria aba de boas-vindas."""
        frame = ttk.Frame(self.notebook, padding="20")
        self.notebook.add(frame, text="1. Boas-vindas")
        
        # Título
        title_label = ttk.Label(
            frame,
            text="Bem-vindo ao WriteTextAmp Workspace!",
            font=('Arial', 18, 'bold')
        )
        title_label.pack(pady=20)
        
        # Descrição
        desc_text = """
Este assistente vai guiar você através da configuração do seu workspace de marketing.

Você vai:
  • Selecionar quais MCPs (ferramentas) deseja usar
  • Preencher API keys quando necessário
  • Instalar dependências automaticamente
  • Configurar o ambiente para uso imediato

Tempo estimado: 5-10 minutos

Clique em "Próximo" para começar.
        """
        desc_label = ttk.Label(frame, text=desc_text, font=('Arial', 11), justify='left')
        desc_label.pack(pady=10, fill='x')
        
        # Informações do workspace
        info_frame = ttk.LabelFrame(frame, text="Informações do Workspace", padding="10")
        info_frame.pack(fill='x', pady=20)
        
        info_text = f"""
Diretório do Workspace: {self.workspace_root}
Arquivo de Configuração: {self.env_path}
Configuração Existente: {'Sim' if self.config else 'Não'}
        """
        info_label = ttk.Label(info_frame, text=info_text, font=('Arial', 10))
        info_label.pack(fill='x')
    
    def create_mcp_selection_tab(self):
        """Cria aba de seleção de MCPs."""
        frame = ttk.Frame(self.notebook, padding="20")
        self.notebook.add(frame, text="2. Seleção de MCPs")
        
        # Título
        title_label = ttk.Label(
            frame,
            text="Selecione os MCPs que Deseja Usar",
            font=('Arial', 16, 'bold')
        )
        title_label.pack(pady=10)
        
        # Descrição
        desc_label = ttk.Label(
            frame,
            text="Marque as ferramentas que você quer habilitar. Você pode alterar depois editando .env",
            font=('Arial', 10)
        )
        desc_label.pack(pady=5)
        
        # Canvas com scrollbar
        canvas = tk.Canvas(frame)
        scrollbar = ttk.Scrollbar(frame, orient="vertical", command=canvas.yview)
        scrollable_frame = ttk.Frame(canvas)
        
        scrollable_frame.bind(
            "<Configure>",
            lambda e: canvas.configure(scrollregion=canvas.bbox("all"))
        )
        
        canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)
        
        canvas.pack(side="left", fill="both", expand=True, pady=10)
        scrollbar.pack(side="right", fill="y")
        
        # Categorias de MCPs
        mcp_categories = {
            "🎨 Geração de Imagem": [
                ("FLUX_ENABLED", "FLUX (Black Forest Labs)", "Imagens AI de alta qualidade. Free tier em bfl.ai"),
                ("PICTIFY_ENABLED", "Pictify", "Templates HTML para imagens. Free tier em pictify.io"),
                ("OPEN_DESIGN_ENABLED", "Open Design", "Prototipagem visual local. Open source"),
            ],
            "✏️ Edição de Imagem": [
                ("CHANGEIMAGETO_ENABLED", "ChangeImageTo", "16 ferramentas de edição. Free tier"),
                ("CHOMPUTE_ENABLED", "Chompute BG Remover", "Remoção de fundo. Free tier"),
                ("NANO_BANANA_ENABLED", "Nano Banana", "Edição com Google Gemini. Free tier"),
            ],
            "📱 Redes Sociais": [
                ("LINKEDIN_ENABLED", "LinkedIn", "Postar e gerenciar conteúdo"),
                ("TWITTER_ENABLED", "Twitter/X", "Threads e posts"),
                ("INSTAGRAM_ENABLED", "Instagram", "Posts e stories"),
                ("FACEBOOK_ENABLED", "Facebook", "Posts e páginas"),
            ],
            "📋 Produtividade": [
                ("NOTION_ENABLED", "Notion", "Documentação e organização"),
                ("GOOGLE_DRIVE_ENABLED", "Google Drive", "Armazenamento"),
                ("SLACK_ENABLED", "Slack", "Comunicação e aprovações"),
            ],
            "🔍 Pesquisa e SEO": [
                ("BRAVE_SEARCH_ENABLED", "Brave Search", "Pesquisa web. Free tier"),
                ("SEOCRAWL_ENABLED", "SEOcrawl", "Análise SEO"),
                ("OPENSEO_ENABLED", "OpenSEO", "Dados de keywords. Free tier"),
            ],
        }
        
        # Cria checkboxes para cada MCP
        for category, mcps in mcp_categories.items():
            cat_frame = ttk.LabelFrame(scrollable_frame, text=category, padding="10")
            cat_frame.pack(fill='x', pady=5, padx=5)
            
            for key, name, description in mcps:
                mcp_frame = ttk.Frame(cat_frame)
                mcp_frame.pack(fill='x', pady=2)
                
                # Checkbox
                var = tk.BooleanVar(value=self.config.get(key, 'false').lower() == 'true')
                self.mcp_selections[key] = var
                
                cb = ttk.Checkbutton(mcp_frame, text=name, variable=var)
                cb.pack(side='left')
                
                # Descrição
                desc_label = ttk.Label(mcp_frame, text=f"  ({description})", font=('Arial', 9), foreground='gray')
                desc_label.pack(side='left', padx=10)
    
    def create_api_keys_tab(self):
        """Cria aba de API keys."""
        frame = ttk.Frame(self.notebook, padding="20")
        self.notebook.add(frame, text="3. API Keys")
        
        # Título
        title_label = ttk.Label(
            frame,
            text="Configure suas API Keys",
            font=('Arial', 16, 'bold')
        )
        title_label.pack(pady=10)
        
        # Descrição
        desc_label = ttk.Label(
            frame,
            text="Preencha as API keys para os serviços que você habilitou. Deixe em branco se não tiver.",
            font=('Arial', 10)
        )
        desc_label.pack(pady=5)
        
        # Canvas com scrollbar
        canvas = tk.Canvas(frame)
        scrollbar = ttk.Scrollbar(frame, orient="vertical", command=canvas.yview)
        scrollable_frame = ttk.Frame(canvas)
        
        scrollable_frame.bind(
            "<Configure>",
            lambda e: canvas.configure(scrollregion=canvas.bbox("all"))
        )
        
        canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)
        
        canvas.pack(side="left", fill="both", expand=True, pady=10)
        scrollbar.pack(side="right", fill="y")
        
        # API keys
        api_keys = [
            ("PICTIFY_API_KEY", "Pictify API Key", "https://pictify.io/dashboard/api-tokens"),
            ("TWITTER_API_KEY", "Twitter API Key", "https://developer.twitter.com/en/portal/dashboard"),
            ("NOTION_API_KEY", "Notion API Key", "https://www.notion.so/my-integrations"),
            ("BRAVE_SEARCH_API_KEY", "Brave Search API Key", "https://brave.com/search/api/"),
            ("SEOCRAWL_API_KEY", "SEOcrawl API Key", ""),
        ]
        
        self.api_key_entries = {}
        
        for key, name, url in api_keys:
            key_frame = ttk.LabelFrame(scrollable_frame, text=name, padding="10")
            key_frame.pack(fill='x', pady=5, padx=5)
            
            # Entry
            entry = ttk.Entry(key_frame, width=60)
            entry.insert(0, self.config.get(key, ''))
            entry.pack(fill='x', pady=5)
            self.api_key_entries[key] = entry
            
            # Link para obter key
            if url:
                link_label = ttk.Label(
                    key_frame,
                    text=f"🔗 Obter API Key",
                    foreground='blue',
                    cursor='hand2'
                )
                link_label.pack(anchor='w')
                link_label.bind("<Button-1>", lambda e, u=url: webbrowser.open(u))
    
    def create_installation_tab(self):
        """Cria aba de instalação."""
        frame = ttk.Frame(self.notebook, padding="20")
        self.notebook.add(frame, text="4. Instalação")
        
        # Título
        title_label = ttk.Label(
            frame,
            text="Instalação de Dependências",
            font=('Arial', 16, 'bold')
        )
        title_label.pack(pady=10)
        
        # Descrição
        desc_label = ttk.Label(
            frame,
            text="O sistema vai verificar e instalar dependências necessárias automaticamente.",
            font=('Arial', 10)
        )
        desc_label.pack(pady=5)
        
        # Verificações
        checks_frame = ttk.LabelFrame(frame, text="Verificações", padding="10")
        checks_frame.pack(fill='x', pady=10)
        
        self.check_results = {}
        
        checks = [
            ("node", "Node.js", "node --version"),
            ("npm", "npm", "npm --version"),
            ("python", "Python", "python --version"),
            ("git", "Git", "git --version"),
        ]
        
        for key, name, command in checks:
            check_frame = ttk.Frame(checks_frame)
            check_frame.pack(fill='x', pady=2)
            
            # Executa verificação
            try:
                result = subprocess.run(
                    command.split(),
                    capture_output=True,
                    text=True,
                    timeout=5
                )
                installed = result.returncode == 0
                version = result.stdout.strip() if installed else "Não instalado"
            except:
                installed = False
                version = "Não instalado"
            
            self.check_results[key] = installed
            
            # Ícone
            icon = "✅" if installed else "❌"
            icon_label = ttk.Label(check_frame, text=icon, font=('Arial', 14))
            icon_label.pack(side='left', padx=5)
            
            # Nome
            name_label = ttk.Label(check_frame, text=f"{name}:", font=('Arial', 10, 'bold'))
            name_label.pack(side='left', padx=5)
            
            # Versão
            version_label = ttk.Label(check_frame, text=version, font=('Arial', 10))
            version_label.pack(side='left', padx=5)
        
        # Open Design
        od_frame = ttk.LabelFrame(frame, text="Open Design", padding="10")
        od_frame.pack(fill='x', pady=10)
        
        self.install_od_var = tk.BooleanVar(value=False)
        od_cb = ttk.Checkbutton(
            od_frame,
            text="Instalar Open Design (requer Git)",
            variable=self.install_od_var
        )
        od_cb.pack(anchor='w')
        
        od_desc = ttk.Label(
            od_frame,
            text="Open Design é uma ferramenta de prototipagem visual local. Será clonado do GitHub.",
            font=('Arial', 9),
            foreground='gray'
        )
        od_desc.pack(anchor='w', pady=5)
    
    def create_completion_tab(self):
        """Cria aba de conclusão."""
        frame = ttk.Frame(self.notebook, padding="20")
        self.notebook.add(frame, text="5. Conclusão")
        
        # Título
        title_label = ttk.Label(
            frame,
            text="Configuração Completa!",
            font=('Arial', 18, 'bold'),
            foreground='green'
        )
        title_label.pack(pady=20)
        
        # Resumo
        summary_frame = ttk.LabelFrame(frame, text="Resumo da Configuração", padding="10")
        summary_frame.pack(fill='x', pady=10)
        
        self.summary_label = ttk.Label(summary_frame, text="", font=('Arial', 10), justify='left')
        self.summary_label.pack(fill='x')
        
        # Próximos passos
        next_frame = ttk.LabelFrame(frame, text="Próximos Passos", padding="10")
        next_frame.pack(fill='x', pady=10)
        
        next_text = """
1. Revise a configuração no arquivo .env

2. Crie seu primeiro projeto:
   Copy-Item -Path "projetos\\_modelo" -Destination "projetos\\meu-projeto" -Recurse

3. Entre no diretório do projeto:
   cd projetos\\meu-projeto

4. Inicie o OpenCode:
   opencode

5. Comece a criar conteúdo:
   @marketing-orchestrator "Preciso de uma campanha de lançamento"
        """
        next_label = ttk.Label(next_frame, text=next_text, font=('Arial', 10), justify='left')
        next_label.pack(fill='x')
    
    def create_navigation_buttons(self):
        """Cria botões de navegação."""
        button_frame = ttk.Frame(self.root)
        button_frame.pack(fill='x', padx=10, pady=10)
        
        # Botão Anterior
        self.prev_button = ttk.Button(
            button_frame,
            text="← Anterior",
            command=self.prev_tab
        )
        self.prev_button.pack(side='left', padx=5)
        
        # Botão Salvar
        self.save_button = ttk.Button(
            button_frame,
            text="💾 Salvar Configuração",
            command=self.save_config
        )
        self.save_button.pack(side='right', padx=5)
        
        # Botão Próximo
        self.next_button = ttk.Button(
            button_frame,
            text="Próximo →",
            command=self.next_tab
        )
        self.next_button.pack(side='right', padx=5)
        
        # Botão Instalar
        self.install_button = ttk.Button(
            button_frame,
            text="🚀 Instalar e Finalizar",
            command=self.install_and_finish
        )
        self.install_button.pack(side='right', padx=5)
    
    def prev_tab(self):
        """Vai para aba anterior."""
        current = self.notebook.index(self.notebook.select())
        if current > 0:
            self.notebook.select(current - 1)
    
    def next_tab(self):
        """Vai para próxima aba."""
        current = self.notebook.index(self.notebook.select())
        if current < self.notebook.index('end') - 1:
            self.notebook.select(current + 1)
            
            # Atualiza resumo na última aba
            if current + 1 == 4:
                self.update_summary()
    
    def save_config(self):
        """Salva configuração no .env."""
        try:
            # Coleta configurações
            config = {}
            
            # MCPs
            for key, var in self.mcp_selections.items():
                config[key] = 'true' if var.get() else 'false'
            
            # API Keys
            for key, entry in self.api_key_entries.items():
                value = entry.get().strip()
                if value:
                    config[key] = value
            
            # Salva no .env
            with open(self.env_path, 'w', encoding='utf-8') as f:
                f.write("# ═══════════════════════════════════════════════════════════════\n")
                f.write("# WriteTextAmp Workspace — Configuração\n")
                f.write("# Gerado pela GUI de configuração\n")
                f.write("# ═══════════════════════════════════════════════════════════════\n\n")
                
                for key, value in config.items():
                    f.write(f"{key}={value}\n")
            
            messagebox.showinfo("Sucesso", f"Configuração salva em:\n{self.env_path}")
            
        except Exception as e:
            messagebox.showerror("Erro", f"Erro ao salvar configuração:\n{str(e)}")
    
    def update_summary(self):
        """Atualiza resumo na aba de conclusão."""
        enabled_mcps = []
        
        for key, var in self.mcp_selections.items():
            if var.get():
                name = key.replace('_ENABLED', '').replace('_', ' ').title()
                enabled_mcps.append(name)
        
        if enabled_mcps:
            summary = f"MCPs Habilitados ({len(enabled_mcps)}):\n"
            for mcp in enabled_mcps:
                summary += f"  • {mcp}\n"
        else:
            summary = "Nenhum MCP opcional habilitado.\n\nServiços base (sempre habilitados):\n  • document-generator\n  • pdf-toolkit"
        
        self.summary_label.config(text=summary)
    
    def install_and_finish(self):
        """Instala dependências e finaliza."""
        # Salva configuração primeiro
        self.save_config()
        
        # Instala Open Design se solicitado
        if self.install_od_var.get():
            try:
                messagebox.showinfo("Instalação", "Instalando Open Design...\nIsso pode levar alguns minutos.")
                
                # Executa setup
                setup_script = self.workspace_root / 'scripts' / 'setup.ps1'
                subprocess.run(
                    ['powershell', '-File', str(setup_script)],
                    cwd=self.workspace_root,
                    check=True
                )
                
                messagebox.showinfo("Sucesso", "Open Design instalado com sucesso!")
                
            except Exception as e:
                messagebox.showerror("Erro", f"Erro ao instalar Open Design:\n{str(e)}")
        
        # Finaliza
        messagebox.showinfo(
            "Concluído",
            "Configuração completa!\n\n"
            "Próximos passos:\n"
            "1. Crie um projeto: Copy-Item projetos\\_modelo projetos\\meu-projeto -Recurse\n"
            "2. Entre no projeto: cd projetos\\meu-projeto\n"
            "3. Inicie o OpenCode: opencode\n\n"
            "Bom trabalho! 🚀"
        )
        
        self.root.quit()


def main():
    """Função principal."""
    root = tk.Tk()
    app = MarketingWorkspaceGUI(root)
    root.mainloop()


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("\nConfiguração cancelada.")
        sys.exit(1)
    except Exception as e:
        print(f"\nErro: {e}")
        sys.exit(1)
