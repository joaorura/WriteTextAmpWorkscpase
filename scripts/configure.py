#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
WriteTextAmp Workspace — Configuração Interativa Completa

Este script configura todos os MCPs e serviços do workspace de marketing.
Pergunta ao usuário quais serviços deseja habilitar e coleta API keys quando necessário.

Uso:
    python scripts/configure.py
"""

import os
import sys
from pathlib import Path
from typing import Dict, Optional


def print_header():
    """Print welcome header."""
    print("\n" + "=" * 70)
    print("  WriteTextAmp Workspace — Configuração Completa")
    print("=" * 70 + "\n")
    print("Este script vai configurar todos os MCPs e serviços do seu workspace.")
    print("Responda as perguntas para habilitar/desabilitar cada serviço.\n")


def print_section(title: str):
    """Print section header."""
    print(f"\n{'─' * 70}")
    print(f"  {title}")
    print(f"{'─' * 70}\n")


def ask_yes_no(question: str, default: bool = False) -> bool:
    """Ask yes/no question with default."""
    suffix = " [Y/n]" if default else " [y/N]"
    answer = input(question + suffix + ": ").strip().lower()
    
    if not answer:
        return default
    
    return answer in ['y', 'yes', 's', 'sim', '1', 'true']


def ask_api_key(service: str, url: Optional[str] = None) -> str:
    """Ask for API key."""
    if url:
        print(f"  🔗 Obtenha sua API key em: {url}")
    
    key = input(f"  🔑 Digite sua {service} API key (ou Enter para pular): ").strip()
    return key


def load_existing_env(env_path: Path) -> Dict[str, str]:
    """Load existing .env file if it exists."""
    env_vars = {}
    
    if env_path.exists():
        with open(env_path, 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#') and '=' in line:
                    key, value = line.split('=', 1)
                    env_vars[key.strip()] = value.strip()
    
    return env_vars


def save_env(env_path: Path, env_vars: Dict[str, str]):
    """Save .env file."""
    with open(env_path, 'w', encoding='utf-8') as f:
        f.write("# ═══════════════════════════════════════════════════════════════\n")
        f.write("# WriteTextAmp Workspace — Configuração Completa\n")
        f.write("# Gerado por configure.py\n")
        f.write("# ═══════════════════════════════════════════════════════════════\n\n")
        
        for key, value in env_vars.items():
            f.write(f"{key}={value}\n")
    
    print(f"\n✅ Configuração salva em: {env_path}")


def configure_flux(env_vars: Dict[str, str]):
    """Configure FLUX MCP."""
    print_section("🎨 FLUX — Geração de Imagem AI (Black Forest Labs)")
    
    print("  FLUX gera imagens de alta qualidade usando AI.")
    print("  • Free tier disponível em bfl.ai")
    print("  • Usa OAuth (login via navegador, sem API key)")
    print("  • Processamento: 100% nuvem (não usa GPU local)")
    print()
    
    enabled = ask_yes_no("Habilitar FLUX?", default=env_vars.get('FLUX_ENABLED', 'false').lower() == 'true')
    env_vars['FLUX_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        print("\n  ✅ FLUX habilitado")
        print("  → Crie conta em: https://bfl.ai")
        print("  → Navegador abrirá para OAuth no primeiro uso")
    else:
        print("\n  ❌ FLUX desabilitado")


def configure_pictify(env_vars: Dict[str, str]):
    """Configure Pictify MCP."""
    print_section("🖼️  Pictify — Templates HTML para Imagens")
    
    print("  Pictify converte templates HTML em imagens, GIFs e PDFs.")
    print("  • Free tier disponível em pictify.io")
    print("  • Ideal para banners, social media cards, OG images")
    print("  • Processamento: API na nuvem")
    print()
    
    enabled = ask_yes_no("Habilitar Pictify?", default=env_vars.get('PICTIFY_ENABLED', 'false').lower() == 'true')
    env_vars['PICTIFY_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        api_key = ask_api_key(
            "Pictify",
            url="https://pictify.io/dashboard/api-tokens"
        )
        
        if api_key:
            env_vars['PICTIFY_API_KEY'] = api_key
            print("\n  ✅ Pictify habilitado com API key")
        else:
            print("\n  ⚠️  Pictify habilitado mas sem API key")
            print("  → Adicione PICTIFY_API_KEY ao .env depois")
    else:
        print("\n  ❌ Pictify desabilitado")


def configure_open_design(env_vars: Dict[str, str]):
    """Configure Open Design MCP."""
    print_section("🎭 Open Design — Prototipagem Visual Local")
    
    print("  Open Design é uma ferramenta open-source para prototipagem visual.")
    print("  • Roda localmente via Electron")
    print("  • Crie protótipos web, dashboards, apresentações")
    print("  • Exporte para HTML, PDF, imagens")
    print("  • Instale: git clone https://github.com/nexu-io/open-design")
    print()
    
    enabled = ask_yes_no("Habilitar Open Design?", default=env_vars.get('OPEN_DESIGN_ENABLED', 'false').lower() == 'true')
    env_vars['OPEN_DESIGN_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        port = input("  Porta do Open Design [3333]: ").strip() or '3333'
        env_vars['OPEN_DESIGN_PORT'] = port
        
        print(f"\n  ✅ Open Design habilitado na porta {port}")
        print("  → Instale: git clone https://github.com/nexu-io/open-design")
        print("  → Rode: cd open-design && npm install && npm start")
    else:
        print("\n  ❌ Open Design desabilitado")


def configure_image_editing(env_vars: Dict[str, str]):
    """Configure image editing MCPs."""
    print_section("✏️  Edição de Imagem")
    
    # ChangeImageTo
    print("  ChangeImageTo — 16 ferramentas de edição")
    print("  • Resize, crop, upscale, denoise, OCR, etc.")
    print("  • Free tier disponível")
    print()
    
    enabled = ask_yes_no("Habilitar ChangeImageTo?", default=env_vars.get('CHANGEIMAGETO_ENABLED', 'false').lower() == 'true')
    env_vars['CHANGEIMAGETO_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        print("  ✅ ChangeImageTo habilitado")
    else:
        print("  ❌ ChangeImageTo desabilitado")
    
    print()
    
    # Chompute BG Remover
    print("  Chompute BG Remover — Remoção de fundo")
    print("  • Remove fundo de imagens automaticamente")
    print("  • Free tier disponível")
    print()
    
    enabled = ask_yes_no("Habilitar Chompute BG Remover?", default=env_vars.get('CHOMPUTE_ENABLED', 'false').lower() == 'true')
    env_vars['CHOMPUTE_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        print("  ✅ Chompute BG Remover habilitado")
    else:
        print("  ❌ Chompute BG Remover desabilitado")
    
    print()
    
    # Nano Banana
    print("  Nano Banana — Edição com Google Gemini")
    print("  • Edição avançada de imagens usando AI")
    print("  • Free tier disponível")
    print()
    
    enabled = ask_yes_no("Habilitar Nano Banana?", default=env_vars.get('NANO_BANANA_ENABLED', 'false').lower() == 'true')
    env_vars['NANO_BANANA_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        print("  ✅ Nano Banana habilitado")
    else:
        print("  ❌ Nano Banana desabilitado")


def configure_social_media(env_vars: Dict[str, str]):
    """Configure social media MCPs."""
    print_section("📱 Redes Sociais")
    
    # LinkedIn
    print("  LinkedIn MCP — Postar e gerenciar conteúdo")
    print("  • Requer autenticação OAuth")
    print()
    
    enabled = ask_yes_no("Habilitar LinkedIn?", default=env_vars.get('LINKEDIN_ENABLED', 'false').lower() == 'true')
    env_vars['LINKEDIN_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        print("  ✅ LinkedIn habilitado")
        print("  → Autenticação OAuth será solicitada no primeiro uso")
    else:
        print("  ❌ LinkedIn desabilitado")
    
    print()
    
    # Twitter
    print("  Twitter/X MCP — Threads e posts")
    print("  • Requer API keys do Twitter Developer")
    print()
    
    enabled = ask_yes_no("Habilitar Twitter?", default=env_vars.get('TWITTER_ENABLED', 'false').lower() == 'true')
    env_vars['TWITTER_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        api_key = ask_api_key("Twitter API Key", url="https://developer.twitter.com/en/portal/dashboard")
        if api_key:
            env_vars['TWITTER_API_KEY'] = api_key
        print("  ✅ Twitter habilitado")
    else:
        print("  ❌ Twitter desabilitado")
    
    print()
    
    # Instagram
    print("  Instagram MCP — Posts e stories")
    print("  • Requer autenticação")
    print()
    
    enabled = ask_yes_no("Habilitar Instagram?", default=env_vars.get('INSTAGRAM_ENABLED', 'false').lower() == 'true')
    env_vars['INSTAGRAM_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        print("  ✅ Instagram habilitado")
    else:
        print("  ❌ Instagram desabilitado")
    
    print()
    
    # Facebook
    print("  Facebook MCP — Posts em páginas e grupos")
    print("  • Requer autenticação")
    print()
    
    enabled = ask_yes_no("Habilitar Facebook?", default=env_vars.get('FACEBOOK_ENABLED', 'false').lower() == 'true')
    env_vars['FACEBOOK_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        print("  ✅ Facebook habilitado")
    else:
        print("  ❌ Facebook desabilitado")


def configure_productivity(env_vars: Dict[str, str]):
    """Configure productivity MCPs."""
    print_section("📋 Produtividade e Organização")
    
    # Notion
    print("  Notion MCP — Documentação e gestão de projetos")
    print("  • Requer API key do Notion")
    print()
    
    enabled = ask_yes_no("Habilitar Notion?", default=env_vars.get('NOTION_ENABLED', 'false').lower() == 'true')
    env_vars['NOTION_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        api_key = ask_api_key("Notion", url="https://www.notion.so/my-integrations")
        if api_key:
            env_vars['NOTION_API_KEY'] = api_key
        print("  ✅ Notion habilitado")
    else:
        print("  ❌ Notion desabilitado")
    
    print()
    
    # Google Drive
    print("  Google Drive MCP — Armazenamento e compartilhamento")
    print("  • Requer autenticação OAuth")
    print()
    
    enabled = ask_yes_no("Habilitar Google Drive?", default=env_vars.get('GOOGLE_DRIVE_ENABLED', 'false').lower() == 'true')
    env_vars['GOOGLE_DRIVE_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        print("  ✅ Google Drive habilitado")
    else:
        print("  ❌ Google Drive desabilitado")
    
    print()
    
    # Slack
    print("  Slack MCP — Comunicação e aprovações")
    print("  • Requer autenticação")
    print()
    
    enabled = ask_yes_no("Habilitar Slack?", default=env_vars.get('SLACK_ENABLED', 'false').lower() == 'true')
    env_vars['SLACK_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        print("  ✅ Slack habilitado")
    else:
        print("  ❌ Slack desabilitado")


def configure_research_seo(env_vars: Dict[str, str]):
    """Configure research and SEO MCPs."""
    print_section("🔍 Pesquisa e SEO")
    
    # Brave Search
    print("  Brave Search MCP — Pesquisa web")
    print("  • Free tier disponível")
    print("  • Ideal para tendências e análise de concorrência")
    print()
    
    enabled = ask_yes_no("Habilitar Brave Search?", default=env_vars.get('BRAVE_SEARCH_ENABLED', 'false').lower() == 'true')
    env_vars['BRAVE_SEARCH_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        api_key = ask_api_key("Brave Search", url="https://brave.com/search/api/")
        if api_key:
            env_vars['BRAVE_SEARCH_API_KEY'] = api_key
        print("  ✅ Brave Search habilitado")
    else:
        print("  ❌ Brave Search desabilitado")
    
    print()
    
    # SEOcrawl
    print("  SEOcrawl MCP — Análise SEO")
    print("  • Requer API key")
    print()
    
    enabled = ask_yes_no("Habilitar SEOcrawl?", default=env_vars.get('SEOCRAWL_ENABLED', 'false').lower() == 'true')
    env_vars['SEOCRAWL_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        api_key = ask_api_key("SEOcrawl")
        if api_key:
            env_vars['SEOCRAWL_API_KEY'] = api_key
        print("  ✅ SEOcrawl habilitado")
    else:
        print("  ❌ SEOcrawl desabilitado")
    
    print()
    
    # OpenSEO
    print("  OpenSEO MCP — Dados de keywords")
    print("  • Free tier disponível")
    print()
    
    enabled = ask_yes_no("Habilitar OpenSEO?", default=env_vars.get('OPENSEO_ENABLED', 'false').lower() == 'true')
    env_vars['OPENSEO_ENABLED'] = 'true' if enabled else 'false'
    
    if enabled:
        print("  ✅ OpenSEO habilitado")
    else:
        print("  ❌ OpenSEO desabilitado")


def main():
    """Main configuration flow."""
    print_header()
    
    # Determine workspace root
    script_dir = Path(__file__).parent
    workspace_root = script_dir.parent
    env_path = workspace_root / '.env'
    
    print(f"📁 Workspace: {workspace_root}")
    print(f"⚙️  Arquivo de configuração: {env_path}")
    
    # Load existing config
    env_vars = load_existing_env(env_path)
    
    if env_vars:
        print("\n✅ Configuração existente encontrada")
        update = ask_yes_no("Atualizar configuração?", default=False)
        if not update:
            print("\nConfiguração mantida.")
            return
    
    # Configure all services
    configure_flux(env_vars)
    configure_pictify(env_vars)
    configure_open_design(env_vars)
    configure_image_editing(env_vars)
    configure_social_media(env_vars)
    configure_productivity(env_vars)
    configure_research_seo(env_vars)
    
    # Save configuration
    save_env(env_path, env_vars)
    
    # Summary
    print_section("📊 Resumo da Configuração")
    
    enabled_services = []
    
    if env_vars.get('FLUX_ENABLED') == 'true':
        enabled_services.append("FLUX (geração de imagem AI)")
    if env_vars.get('PICTIFY_ENABLED') == 'true':
        enabled_services.append("Pictify (templates para imagem)")
    if env_vars.get('OPEN_DESIGN_ENABLED') == 'true':
        enabled_services.append("Open Design (prototipagem visual)")
    if env_vars.get('CHANGEIMAGETO_ENABLED') == 'true':
        enabled_services.append("ChangeImageTo (edição de imagem)")
    if env_vars.get('CHOMPUTE_ENABLED') == 'true':
        enabled_services.append("Chompute BG Remover (remoção de fundo)")
    if env_vars.get('NANO_BANANA_ENABLED') == 'true':
        enabled_services.append("Nano Banana (edição com Gemini)")
    if env_vars.get('LINKEDIN_ENABLED') == 'true':
        enabled_services.append("LinkedIn")
    if env_vars.get('TWITTER_ENABLED') == 'true':
        enabled_services.append("Twitter/X")
    if env_vars.get('INSTAGRAM_ENABLED') == 'true':
        enabled_services.append("Instagram")
    if env_vars.get('FACEBOOK_ENABLED') == 'true':
        enabled_services.append("Facebook")
    if env_vars.get('NOTION_ENABLED') == 'true':
        enabled_services.append("Notion")
    if env_vars.get('GOOGLE_DRIVE_ENABLED') == 'true':
        enabled_services.append("Google Drive")
    if env_vars.get('SLACK_ENABLED') == 'true':
        enabled_services.append("Slack")
    if env_vars.get('BRAVE_SEARCH_ENABLED') == 'true':
        enabled_services.append("Brave Search")
    if env_vars.get('SEOCRAWL_ENABLED') == 'true':
        enabled_services.append("SEOcrawl")
    if env_vars.get('OPENSEO_ENABLED') == 'true':
        enabled_services.append("OpenSEO")
    
    if enabled_services:
        print("  ✅ Serviços habilitados:")
        for service in enabled_services:
            print(f"    • {service}")
    else:
        print("  ⚠️  Nenhum serviço opcional habilitado")
    
    print("\n  📦 Serviços base (sempre habilitados):")
    print("    • document-generator (Word + PDF)")
    print("    • pdf-toolkit (PDF avançado)")
    
    print("\n" + "=" * 70)
    print("  ✅ Configuração completa!")
    print("=" * 70 + "\n")
    
    print("Próximos passos:")
    print("  1. Revise o arquivo .env se necessário")
    print("  2. Execute: powershell -File scripts/setup.ps1")
    print("  3. Crie um projeto: Copy-Item projetos\\_modelo projetos\\meu-projeto -Recurse")
    print("  4. Inicie o OpenCode no diretório do projeto")
    print()


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n❌ Configuração cancelada.")
        sys.exit(1)
    except Exception as e:
        print(f"\n❌ Erro: {e}")
        sys.exit(1)
