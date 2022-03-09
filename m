Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 932EE4D3A75
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 20:36:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDMr40b1bz3bdg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 06:36:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDMqc11Cpz3bM7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 06:35:36 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KDMqW0FPmz9sSh;
 Wed,  9 Mar 2022 20:35:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6gIBJ2CcNqp; Wed,  9 Mar 2022 20:35:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KDMqV5xT4z9sSd;
 Wed,  9 Mar 2022 20:35:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A8F638B780;
 Wed,  9 Mar 2022 20:35:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SxGIuyvOycF8; Wed,  9 Mar 2022 20:35:34 +0100 (CET)
Received: from [192.168.202.27] (unknown [192.168.202.27])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF4118B763;
 Wed,  9 Mar 2022 20:35:33 +0100 (CET)
Message-ID: <d83ff309-faf4-499c-7e97-4b3258ed5723@csgroup.eu>
Date: Wed, 9 Mar 2022 20:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] powerpc/32: Stop printing the virtual memory layout
Content-Language: fr-FR
To: Arvind Sankar <nivedita@alum.mit.edu>, Kees Cook <keescook@chromium.org>
References: <202003021038.8F0369D907@keescook>
 <20200305150837.835083-1-nivedita@alum.mit.edu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20200305150837.835083-1-nivedita@alum.mit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Tycho Andersen <tycho@tycho.ws>, kernel-hardening@lists.openwall.com,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/03/2020 à 16:08, Arvind Sankar a écrit :
> For security, don't display the kernel's virtual memory layout.
> 
> Kees Cook points out:
> "These have been entirely removed on other architectures, so let's
> just do the same for ia32 and remove it unconditionally."
> 
> 071929dbdd86 ("arm64: Stop printing the virtual memory layout")
> 1c31d4e96b8c ("ARM: 8820/1: mm: Stop printing the virtual memory layout")
> 31833332f798 ("m68k/mm: Stop printing the virtual memory layout")
> fd8d0ca25631 ("parisc: Hide virtual kernel memory layout")
> adb1fe9ae2ee ("mm/page_alloc: Remove kernel address exposure in free_reserved_area()")
> 
> Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>

This patch doesn't apply anymore.

This patch is referenced in https://github.com/linuxppc/issues/issues/390

> ---
>   arch/powerpc/mm/mem.c | 17 -----------------
>   1 file changed, 17 deletions(-)
> 
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index ef7b1119b2e2..df2c143b6bf7 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -331,23 +331,6 @@ void __init mem_init(void)
>   #endif
>   
>   	mem_init_print_info(NULL);
> -#ifdef CONFIG_PPC32
> -	pr_info("Kernel virtual memory layout:\n");
> -#ifdef CONFIG_KASAN
> -	pr_info("  * 0x%08lx..0x%08lx  : kasan shadow mem\n",
> -		KASAN_SHADOW_START, KASAN_SHADOW_END);
> -#endif
> -	pr_info("  * 0x%08lx..0x%08lx  : fixmap\n", FIXADDR_START, FIXADDR_TOP);
> -#ifdef CONFIG_HIGHMEM
> -	pr_info("  * 0x%08lx..0x%08lx  : highmem PTEs\n",
> -		PKMAP_BASE, PKMAP_ADDR(LAST_PKMAP));
> -#endif /* CONFIG_HIGHMEM */
> -	if (ioremap_bot != IOREMAP_TOP)
> -		pr_info("  * 0x%08lx..0x%08lx  : early ioremap\n",
> -			ioremap_bot, IOREMAP_TOP);
> -	pr_info("  * 0x%08lx..0x%08lx  : vmalloc & ioremap\n",
> -		VMALLOC_START, VMALLOC_END);
> -#endif /* CONFIG_PPC32 */
>   }
>   
>   void free_initmem(void)
