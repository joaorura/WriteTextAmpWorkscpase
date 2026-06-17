#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Docling HTTP Server - Inicia o Docling como serviço HTTP

Este script inicia o Docling como um servidor HTTP local,
permitindo que o OpenCode e outras ferramentas acessem
os recursos de processamento de documentos via API.

Uso:
    python start-docling-server.py [--port 8000] [--host localhost]
"""

import argparse
import sys
import os
from pathlib import Path

try:
    from docling_serve import create_app
except ImportError:
    print("❌ Erro: docling-serve não está instalado")
    print("\nPara instalar, execute:")
    print("  pip install docling-serve")
    print("\nOu use o requirements.txt:")
    print("  pip install -r requirements.txt")
    sys.exit(1)


def main():
    parser = argparse.ArgumentParser(
        description='Inicia o servidor HTTP do Docling'
    )
    parser.add_argument(
        '--port',
        type=int,
        default=8000,
        help='Porta do servidor (padrão: 8000)'
    )
    parser.add_argument(
        '--host',
        type=str,
        default='localhost',
        help='Host do servidor (padrão: localhost)'
    )
    parser.add_argument(
        '--reload',
        action='store_true',
        help='Habilita auto-reload para desenvolvimento'
    )
    
    args = parser.parse_args()
    
    print("=" * 70)
    print("🚀 Docling HTTP Server")
    print("=" * 70)
    print(f"\n📡 Host: {args.host}")
    print(f"🔌 Porta: {args.port}")
    print(f"🔄 Auto-reload: {'Sim' if args.reload else 'Não'}")
    print("\n" + "=" * 70)
    print("✅ Servidor iniciando...")
    print(f"🌐 Acesse: http://{args.host}:{args.port}")
    print("📚 Documentação: http://{0}:{1}/docs".format(args.host, args.port))
    print("=" * 70)
    print("\nPressione Ctrl+C para parar o servidor\n")
    
    try:
        app = create_app()
        
        import uvicorn
        uvicorn.run(
            app,
            host=args.host,
            port=args.port,
            reload=args.reload,
            log_level="info"
        )
    except KeyboardInterrupt:
        print("\n\n⏹️  Servidor parado pelo usuário")
        sys.exit(0)
    except Exception as e:
        print(f"\n❌ Erro ao iniciar servidor: {e}")
        sys.exit(1)


if __name__ == '__main__':
    main()
