Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB29C64976
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:23:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kNHL5st7zDqkJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:23:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="FQ1YsnkL"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kMzx45QbzDqkk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:09:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45kMzq4HnSz9vBLM;
 Wed, 10 Jul 2019 17:09:43 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=FQ1YsnkL; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hR2xNT49vkz7; Wed, 10 Jul 2019 17:09:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45kMzq3CXcz9vBKx;
 Wed, 10 Jul 2019 17:09:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562771383; bh=ynyoyz2a8mhTxPuWg1JPhy/+QcneVYZY5CdOe1W9BSs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FQ1YsnkLmkXPi0eBgRQBEmmtQzM1ewj/PpR8hJx/Mf0pigCM/IqCCXOltWyIaYP3H
 DKDy8CCjNu1XIasaFnr26sfcRTmJY/uRki3/biFYanDbp4P2/7g4BvWlo0xMLCqzhh
 skOzNO9/NsLClo5WGensnYmteGCtMe8IRY/XCDp4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 465488B841;
 Wed, 10 Jul 2019 17:09:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DfteW-yXR2Ge; Wed, 10 Jul 2019 17:09:42 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B0A468B810;
 Wed, 10 Jul 2019 17:09:32 +0200 (CEST)
Subject: Re: [PATCH v3 5/7] kexec_elf: remove elf_addr_to_cpu macro
To: Sven Schnelle <svens@stackframe.org>, kexec@lists.infradead.org
References: <20190710142944.2774-1-svens@stackframe.org>
 <20190710142944.2774-6-svens@stackframe.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <49206784-009c-391b-5f9a-11e9b1de930b@c-s.fr>
Date: Wed, 10 Jul 2019 17:09:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710142944.2774-6-svens@stackframe.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: deller@gmx.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/07/2019 à 16:29, Sven Schnelle a écrit :
> It had only one definition, so just use the function directly.

It had only one definition because it was for ppc64 only.
But as far as I understand (at least from the name of the new file), you 
want it to be generic, don't you ? Therefore I get on 32 bits it would 
be elf32_to_cpu().

Christophe

> 
> Signed-off-by: Sven Schnelle <svens@stackframe.org>
> ---
>   kernel/kexec_elf.c | 20 +++++++++-----------
>   1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
> index 70d31b8feeae..99e6d63b5dfc 100644
> --- a/kernel/kexec_elf.c
> +++ b/kernel/kexec_elf.c
> @@ -8,8 +8,6 @@
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   
> -#define elf_addr_to_cpu	elf64_to_cpu
> -
>   #ifndef Elf_Rel
>   #define Elf_Rel		Elf64_Rel
>   #endif /* Elf_Rel */
> @@ -143,9 +141,9 @@ static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
>   	ehdr->e_type      = elf16_to_cpu(ehdr, buf_ehdr->e_type);
>   	ehdr->e_machine   = elf16_to_cpu(ehdr, buf_ehdr->e_machine);
>   	ehdr->e_version   = elf32_to_cpu(ehdr, buf_ehdr->e_version);
> -	ehdr->e_entry     = elf_addr_to_cpu(ehdr, buf_ehdr->e_entry);
> -	ehdr->e_phoff     = elf_addr_to_cpu(ehdr, buf_ehdr->e_phoff);
> -	ehdr->e_shoff     = elf_addr_to_cpu(ehdr, buf_ehdr->e_shoff);
> +	ehdr->e_entry     = elf64_to_cpu(ehdr, buf_ehdr->e_entry);
> +	ehdr->e_phoff     = elf64_to_cpu(ehdr, buf_ehdr->e_phoff);
> +	ehdr->e_shoff     = elf64_to_cpu(ehdr, buf_ehdr->e_shoff);
>   	ehdr->e_flags     = elf32_to_cpu(ehdr, buf_ehdr->e_flags);
>   	ehdr->e_phentsize = elf16_to_cpu(ehdr, buf_ehdr->e_phentsize);
>   	ehdr->e_phnum     = elf16_to_cpu(ehdr, buf_ehdr->e_phnum);
> @@ -190,18 +188,18 @@ static int elf_read_phdr(const char *buf, size_t len,
>   	buf_phdr = (struct elf_phdr *) pbuf;
>   
>   	phdr->p_type   = elf32_to_cpu(elf_info->ehdr, buf_phdr->p_type);
> -	phdr->p_offset = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_offset);
> -	phdr->p_paddr  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_paddr);
> -	phdr->p_vaddr  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_vaddr);
> +	phdr->p_offset = elf64_to_cpu(elf_info->ehdr, buf_phdr->p_offset);
> +	phdr->p_paddr  = elf64_to_cpu(elf_info->ehdr, buf_phdr->p_paddr);
> +	phdr->p_vaddr  = elf64_to_cpu(elf_info->ehdr, buf_phdr->p_vaddr);
>   	phdr->p_flags  = elf32_to_cpu(elf_info->ehdr, buf_phdr->p_flags);
>   
>   	/*
>   	 * The following fields have a type equivalent to Elf_Addr
>   	 * both in 32 bit and 64 bit ELF.
>   	 */
> -	phdr->p_filesz = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_filesz);
> -	phdr->p_memsz  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_memsz);
> -	phdr->p_align  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_align);
> +	phdr->p_filesz = elf64_to_cpu(elf_info->ehdr, buf_phdr->p_filesz);
> +	phdr->p_memsz  = elf64_to_cpu(elf_info->ehdr, buf_phdr->p_memsz);
> +	phdr->p_align  = elf64_to_cpu(elf_info->ehdr, buf_phdr->p_align);
>   
>   	return elf_is_phdr_sane(phdr, len) ? 0 : -ENOEXEC;
>   }
> 
