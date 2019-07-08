Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8C261D29
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 12:42:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45j28C1QPVzDqXW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 20:42:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="RKEi0GCE"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45j26c5zZczDq9F
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 20:40:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45j26S0h9Nz9tyfW;
 Mon,  8 Jul 2019 12:40:48 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=RKEi0GCE; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EyagA4G-sdlp; Mon,  8 Jul 2019 12:40:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45j26R6f5Nz9tyfT;
 Mon,  8 Jul 2019 12:40:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562582447; bh=ZqV/7ZEJOMnL7h1ceiT0PFI14kJH+6PjysoOgp0duzE=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=RKEi0GCE6Y9ns7LPPMj5P8jT9BnOYeoKYM7+LPbTYsi/BDD+DNqSo5Np/A+tbOiV8
 7UTVBaWyt3Ar+UVJSLmysV6EWsPohI/lw5DAXBKtJ0y9Y+82V8wZGmyTSoMguD+SZr
 Q2rltsfe5DN1FZPCN6UVHOmFaSwa+4qcWD4udYOg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BCD088B79B;
 Mon,  8 Jul 2019 12:40:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hk-8gR4csuYm; Mon,  8 Jul 2019 12:40:52 +0200 (CEST)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8A2B98B76F;
 Mon,  8 Jul 2019 12:40:52 +0200 (CEST)
Subject: Re: [PATCH using git format-patch -C] kexec: add generic support for
 elf kernel images
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: kexec@lists.infradead.org, Sven Schnelle <svens@stackframe.org>
References: <20190708100624.EBCDF68DB2@pc17473vm.idsi0.si.c-s.fr>
Message-ID: <e016c0bb-c857-b78c-a159-120e42d0db03@c-s.fr>
Date: Mon, 8 Jul 2019 12:40:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708100624.EBCDF68DB2@pc17473vm.idsi0.si.c-s.fr>
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

Hi Sven,

Le 08/07/2019 à 12:06, Christophe Leroy a écrit :
> From: Sven Schnelle <svens@stackframe.org>

Please describe you patch.

All the changes you are doing to the ppc64 version in order to make it 
generic should be described.

Those changes are also maybe worth splitting the patch in several parts, 
either preparing the ppc64 for generic then moving to kernel/kexec_elf.c 
or moving to kernel/kexec_elf.c without modifications, then modifying it 
to make it generic.

Note that your patch only applies on Linux 5.1, it doesn't apply on 
powerpc/next.

I think it also be worth taking the opportunity to fix the sparse 
warnings, see https://patchwork.ozlabs.org/patch/1128720/

checkpatch comments should also be fixed, see 
https://openpower.xyz/job/snowpatch/job/snowpatch-linux-checkpatch/8044//artifact/linux/checkpatch.log

Other comments below,

> 
> Signed-off-by: Sven Schnelle <svens@stackframe.org>
> ---
>   patch generated with 'git format-patch -C' in order to
>   see the modifications done in kexec_elf.c in addition to
>   copying it from arch/powerpc/kernel/kexec_elf_64.c
> 
>   arch/Kconfig                                       |   3 +
>   arch/powerpc/Kconfig                               |   1 +
>   arch/powerpc/kernel/kexec_elf_64.c                 | 547 +--------------------
>   include/linux/kexec.h                              |  35 ++
>   kernel/Makefile                                    |   1 +
>   .../kernel/kexec_elf_64.c => kernel/kexec_elf.c    | 264 +++-------
>   6 files changed, 118 insertions(+), 733 deletions(-)
>   copy arch/powerpc/kernel/kexec_elf_64.c => kernel/kexec_elf.c (64%)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 33687dddd86a..c7c75fbc0b79 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -18,6 +18,9 @@ config KEXEC_CORE
>   	select CRASH_CORE
>   	bool
>   
> +config KEXEC_ELF
> +	bool
> +
>   config HAVE_IMA_KEXEC
>   	bool
>   
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 2d0be82c3061..447b6e3ad999 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -501,6 +501,7 @@ config KEXEC_FILE
>   	select KEXEC_CORE
>   	select HAVE_IMA_KEXEC
>   	select BUILD_BIN2C
> +	select KEXEC_ELF
>   	depends on PPC64
>   	depends on CRYPTO=y
>   	depends on CRYPTO_SHA256=y
> diff --git a/arch/powerpc/kernel/kexec_elf_64.c b/arch/powerpc/kernel/kexec_elf_64.c
> index ba4f18a43ee8..d062c5991722 100644
> --- a/arch/powerpc/kernel/kexec_elf_64.c
> +++ b/arch/powerpc/kernel/kexec_elf_64.c
> @@ -31,539 +31,7 @@
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   
> -#define PURGATORY_STACK_SIZE	(16 * 1024)

[snip]

> +#define PURGATORY_STACK_SIZE (16 * 1024)

This line shouldn't be modified by your patch. I see a tab was replaced 
by space.

>   
>   static void *elf64_load(struct kimage *image, char *kernel_buf,
>   			unsigned long kernel_len, char *initrd,
> @@ -577,17 +45,17 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>   	void *fdt;
>   	const void *slave_code;
>   	struct elfhdr ehdr;
> -	struct elf_info elf_info;
> +	struct kexec_elf_info elf_info;
>   	struct kexec_buf kbuf = { .image = image, .buf_min = 0,
>   				  .buf_max = ppc64_rma_size };
>   	struct kexec_buf pbuf = { .image = image, .buf_min = 0,
>   				  .buf_max = ppc64_rma_size, .top_down = true };
>   
> -	ret = build_elf_exec_info(kernel_buf, kernel_len, &ehdr, &elf_info);
> +	ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
>   	if (ret)
>   		goto out;
>   
> -	ret = elf_exec_load(image, &ehdr, &elf_info, &kernel_load_addr);
> +	ret = kexec_elf_load(image, &ehdr, &elf_info, &kbuf, &kernel_load_addr);
>   	if (ret)
>   		goto out;
>   
> @@ -606,6 +74,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>   		kbuf.bufsz = kbuf.memsz = initrd_len;
>   		kbuf.buf_align = PAGE_SIZE;
>   		kbuf.top_down = false;
> +		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;

Is that correct ? I see:
- kbuf.mem is unsigned
- KEXEC_BUF_MEM_UNKNOWN is -1 on s390

>   		ret = kexec_add_buffer(&kbuf);
>   		if (ret)
>   			goto out;
> @@ -638,6 +107,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>   	kbuf.bufsz = kbuf.memsz = fdt_size;
>   	kbuf.buf_align = PAGE_SIZE;
>   	kbuf.top_down = true;
> +	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>   	ret = kexec_add_buffer(&kbuf);
>   	if (ret)
>   		goto out;
> @@ -652,13 +122,12 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>   		pr_err("Error setting up the purgatory.\n");
>   
>   out:
> -	elf_free_info(&elf_info);
> -
> +	kexec_free_elf_info(&elf_info);
>   	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
>   	return ret ? ERR_PTR(ret) : fdt;
>   }
>   
>   const struct kexec_file_ops kexec_elf64_ops = {
> -	.probe = elf64_probe,
> +	.probe = kexec_elf_probe,
>   	.load = elf64_load,
>   };
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index b9b1bc5f9669..72648b18b778 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -216,6 +216,41 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
>   				       void **addr, unsigned long *sz);
>   #endif /* CONFIG_KEXEC_FILE */
>   
> +#ifdef CONFIG_KEXEC_ELF
> +
> +struct kexec_elf_info {
> +	/*
> +	 * Where the ELF binary contents are kept.
> +	 * Memory managed by the user of the struct.
> +	 */
> +	const char *buffer;
> +
> +	const struct elfhdr *ehdr;
> +	const struct elf_phdr *proghdrs;
> +	struct elf_shdr *sechdrs;
> +};
> +
> +void kexec_free_elf_info(struct kexec_elf_info *elf_info);
> +
> +int kexec_build_elf_info(const char *buf, size_t len, struct elfhdr *ehdr,
> +			  struct kexec_elf_info *elf_info);
> +
> +int kexec_elf_kernel_load(struct kimage *image, struct kexec_buf *kbuf,
> +			  char *kernel_buf, unsigned long kernel_len,
> +			  unsigned long *kernel_load_addr);
> +
> +int kexec_elf_probe(const char *buf, unsigned long len);
> +
> +int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
> +			 struct kexec_elf_info *elf_info,
> +			 struct kexec_buf *kbuf,
> +			 unsigned long *lowest_load_addr);
> +
> +int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
> +			 struct kexec_elf_info *elf_info,
> +			 struct kexec_buf *kbuf,
> +			 unsigned long *lowest_load_addr);

Duplication of kexec_elf_load()

> +#endif
>   struct kimage {
>   	kimage_entry_t head;
>   	kimage_entry_t *entry;
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 6c57e78817da..081b378050d0 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_CRASH_CORE) += crash_core.o
>   obj-$(CONFIG_KEXEC_CORE) += kexec_core.o
>   obj-$(CONFIG_KEXEC) += kexec.o
>   obj-$(CONFIG_KEXEC_FILE) += kexec_file.o
> +obj-$(CONFIG_KEXEC_ELF) += kexec_elf.o
>   obj-$(CONFIG_BACKTRACE_SELF_TEST) += backtracetest.o
>   obj-$(CONFIG_COMPAT) += compat.o
>   obj-$(CONFIG_CGROUPS) += cgroup/
> diff --git a/arch/powerpc/kernel/kexec_elf_64.c b/kernel/kexec_elf.c
> similarity index 64%
> copy from arch/powerpc/kernel/kexec_elf_64.c
> copy to kernel/kexec_elf.c
> index ba4f18a43ee8..07e5bcc79bba 100644
> --- a/arch/powerpc/kernel/kexec_elf_64.c
> +++ b/kernel/kexec_elf.c
> @@ -1,55 +1,13 @@
> -/*
> - * Load ELF vmlinux file for the kexec_file_load syscall.
> - *
> - * Copyright (C) 2004  Adam Litke (agl@us.ibm.com)
> - * Copyright (C) 2004  IBM Corp.
> - * Copyright (C) 2005  R Sharada (sharada@in.ibm.com)
> - * Copyright (C) 2006  Mohan Kumar M (mohan@in.ibm.com)
> - * Copyright (C) 2016  IBM Corporation
> - *
> - * Based on kexec-tools' kexec-elf-exec.c and kexec-elf-ppc64.c.
> - * Heavily modified for the kernel by
> - * Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation (version 2 of the License).
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - */
> +// SPDX-License-Identifier: GPL-2.0
>   
>   #define pr_fmt(fmt)	"kexec_elf: " fmt
>   
>   #include <linux/elf.h>
>   #include <linux/kexec.h>
> -#include <linux/libfdt.h>
>   #include <linux/module.h>
> -#include <linux/of_fdt.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   
> -#define PURGATORY_STACK_SIZE	(16 * 1024)
> -
> -#define elf_addr_to_cpu	elf64_to_cpu
> -
> -#ifndef Elf_Rel
> -#define Elf_Rel		Elf64_Rel
> -#endif /* Elf_Rel */
> -
> -struct elf_info {
> -	/*
> -	 * Where the ELF binary contents are kept.
> -	 * Memory managed by the user of the struct.
> -	 */
> -	const char *buffer;
> -
> -	const struct elfhdr *ehdr;
> -	const struct elf_phdr *proghdrs;
> -	struct elf_shdr *sechdrs;
> -};
>   
>   static inline bool elf_is_elf_file(const struct elfhdr *ehdr)
>   {
> @@ -66,22 +24,22 @@ static uint64_t elf64_to_cpu(const struct elfhdr *ehdr, uint64_t value)
>   	return value;
>   }
>   
> -static uint16_t elf16_to_cpu(const struct elfhdr *ehdr, uint16_t value)
> +static uint32_t elf32_to_cpu(const struct elfhdr *ehdr, uint32_t value)

Any reason to switch position of elf16_to_cpu() with elf32_to_cpu() ?

>   {
>   	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
> -		value = le16_to_cpu(value);
> +		value = le32_to_cpu(value);
>   	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
> -		value = be16_to_cpu(value);
> +		value = be32_to_cpu(value);
>   
>   	return value;
>   }
>   
> -static uint32_t elf32_to_cpu(const struct elfhdr *ehdr, uint32_t value)
> +static uint16_t elf16_to_cpu(const struct elfhdr *ehdr, uint16_t value)
>   {
>   	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
> -		value = le32_to_cpu(value);
> +		value = le16_to_cpu(value);
>   	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
> -		value = be32_to_cpu(value);
> +		value = be16_to_cpu(value);
>   
>   	return value;
>   }
> @@ -180,9 +138,9 @@ static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
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
> @@ -214,7 +172,7 @@ static bool elf_is_phdr_sane(const struct elf_phdr *phdr, size_t buf_len)
>   	return true;
>   }
>   
> -static int elf_read_phdr(const char *buf, size_t len, struct elf_info *elf_info,
> +static int elf_read_phdr(const char *buf, size_t len, struct kexec_elf_info *elf_info,
>   			 int idx)
>   {
>   	/* Override the const in proghdrs, we are the ones doing the loading. */
> @@ -226,18 +184,18 @@ static int elf_read_phdr(const char *buf, size_t len, struct elf_info *elf_info,
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
> @@ -249,7 +207,7 @@ static int elf_read_phdr(const char *buf, size_t len, struct elf_info *elf_info,
>    * Use elf_is_ehdr_sane() if it wasn't.
>    */
>   static int elf_read_phdrs(const char *buf, size_t len,
> -			  struct elf_info *elf_info)
> +			  struct kexec_elf_info *elf_info)
>   {
>   	size_t phdr_size, i;
>   	const struct elfhdr *ehdr = elf_info->ehdr;
> @@ -296,13 +254,13 @@ static bool elf_is_shdr_sane(const struct elf_shdr *shdr, size_t buf_len)
>   		size_ok = shdr->sh_entsize == sizeof(Elf_Sym);
>   		break;
>   	case SHT_RELA:
> -		size_ok = shdr->sh_entsize == sizeof(Elf_Rela);
> +		size_ok = shdr->sh_entsize == sizeof(Elf64_Rela);
>   		break;
>   	case SHT_DYNAMIC:
>   		size_ok = shdr->sh_entsize == sizeof(Elf_Dyn);
>   		break;
>   	case SHT_REL:
> -		size_ok = shdr->sh_entsize == sizeof(Elf_Rel);
> +		size_ok = shdr->sh_entsize == sizeof(Elf64_Rel);
>   		break;
>   	case SHT_NOTE:
>   	case SHT_PROGBITS:
> @@ -340,7 +298,7 @@ static bool elf_is_shdr_sane(const struct elf_shdr *shdr, size_t buf_len)
>   	return true;
>   }
>   
> -static int elf_read_shdr(const char *buf, size_t len, struct elf_info *elf_info,
> +static int elf_read_shdr(const char *buf, size_t len, struct kexec_elf_info *elf_info,
>   			 int idx)
>   {
>   	struct elf_shdr *shdr = &elf_info->sechdrs[idx];
> @@ -353,8 +311,8 @@ static int elf_read_shdr(const char *buf, size_t len, struct elf_info *elf_info,
>   
>   	shdr->sh_name      = elf32_to_cpu(ehdr, buf_shdr->sh_name);
>   	shdr->sh_type      = elf32_to_cpu(ehdr, buf_shdr->sh_type);
> -	shdr->sh_addr      = elf_addr_to_cpu(ehdr, buf_shdr->sh_addr);
> -	shdr->sh_offset    = elf_addr_to_cpu(ehdr, buf_shdr->sh_offset);
> +	shdr->sh_addr      = elf64_to_cpu(ehdr, buf_shdr->sh_addr);
> +	shdr->sh_offset    = elf64_to_cpu(ehdr, buf_shdr->sh_offset);
>   	shdr->sh_link      = elf32_to_cpu(ehdr, buf_shdr->sh_link);
>   	shdr->sh_info      = elf32_to_cpu(ehdr, buf_shdr->sh_info);
>   
> @@ -362,10 +320,10 @@ static int elf_read_shdr(const char *buf, size_t len, struct elf_info *elf_info,
>   	 * The following fields have a type equivalent to Elf_Addr
>   	 * both in 32 bit and 64 bit ELF.
>   	 */
> -	shdr->sh_flags     = elf_addr_to_cpu(ehdr, buf_shdr->sh_flags);
> -	shdr->sh_size      = elf_addr_to_cpu(ehdr, buf_shdr->sh_size);
> -	shdr->sh_addralign = elf_addr_to_cpu(ehdr, buf_shdr->sh_addralign);
> -	shdr->sh_entsize   = elf_addr_to_cpu(ehdr, buf_shdr->sh_entsize);
> +	shdr->sh_flags     = elf64_to_cpu(ehdr, buf_shdr->sh_flags);
> +	shdr->sh_size      = elf64_to_cpu(ehdr, buf_shdr->sh_size);
> +	shdr->sh_addralign = elf64_to_cpu(ehdr, buf_shdr->sh_addralign);
> +	shdr->sh_entsize   = elf64_to_cpu(ehdr, buf_shdr->sh_entsize);
>   
>   	return elf_is_shdr_sane(shdr, len) ? 0 : -ENOEXEC;
>   }
> @@ -377,7 +335,7 @@ static int elf_read_shdr(const char *buf, size_t len, struct elf_info *elf_info,
>    * Use elf_is_ehdr_sane() if it wasn't.
>    */
>   static int elf_read_shdrs(const char *buf, size_t len,
> -			  struct elf_info *elf_info)
> +			  struct kexec_elf_info *elf_info)
>   {
>   	size_t shdr_size, i;
>   
> @@ -416,11 +374,11 @@ static int elf_read_shdrs(const char *buf, size_t len,
>    * the kernel, byte-swapping the fields as needed.
>    *
>    * Return:
> - * On success returns 0, and the caller should call elf_free_info(elf_info) to
> + * On success returns 0, and the caller should call kexec_free_elf_info(elf_info) to
>    * free the memory allocated for the section and program headers.
>    */
>   int elf_read_from_buffer(const char *buf, size_t len, struct elfhdr *ehdr,
> -			 struct elf_info *elf_info)
> +			 struct kexec_elf_info *elf_info)
>   {
>   	int ret;
>   
> @@ -447,19 +405,19 @@ int elf_read_from_buffer(const char *buf, size_t len, struct elfhdr *ehdr,
>   }
>   
>   /**
> - * elf_free_info - free memory allocated by elf_read_from_buffer
> + * kexec_free_elf_info - free memory allocated by elf_read_from_buffer
>    */
> -void elf_free_info(struct elf_info *elf_info)
> +void kexec_free_elf_info(struct kexec_elf_info *elf_info)
>   {
>   	kfree(elf_info->proghdrs);
> -	kfree(elf_info->sechdrs);

Why is the above kfree() removed ?

>   	memset(elf_info, 0, sizeof(*elf_info));
>   }
> +
>   /**
> - * build_elf_exec_info - read ELF executable and check that we can use it
> + * kexec_build_elf_info - read ELF executable and check that we can use it
>    */
> -static int build_elf_exec_info(const char *buf, size_t len, struct elfhdr *ehdr,
> -			       struct elf_info *elf_info)
> +int kexec_build_elf_info(const char *buf, size_t len, struct elfhdr *ehdr,
> +			  struct kexec_elf_info *elf_info)
>   {
>   	int i;
>   	int ret;
> @@ -491,25 +449,10 @@ static int build_elf_exec_info(const char *buf, size_t len, struct elfhdr *ehdr,
>   
>   	return 0;
>   error:
> -	elf_free_info(elf_info);
> +	kexec_free_elf_info(elf_info);
>   	return -ENOEXEC;
>   }
>   
> -static int elf64_probe(const char *buf, unsigned long len)
> -{
> -	struct elfhdr ehdr;
> -	struct elf_info elf_info;
> -	int ret;
> -
> -	ret = build_elf_exec_info(buf, len, &ehdr, &elf_info);
> -	if (ret)
> -		return ret;
> -
> -	elf_free_info(&elf_info);
> -
> -	return elf_check_arch(&ehdr) ? 0 : -ENOEXEC;
> -}
> -
>   /**
>    * elf_exec_load - load ELF executable image
>    * @lowest_load_addr:	On return, will be the address where the first PT_LOAD
> @@ -518,16 +461,14 @@ static int elf64_probe(const char *buf, unsigned long len)
>    * Return:
>    * 0 on success, negative value on failure.
>    */
> -static int elf_exec_load(struct kimage *image, struct elfhdr *ehdr,
> -			 struct elf_info *elf_info,
> -			 unsigned long *lowest_load_addr)
> +int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
> +		   struct kexec_elf_info *elf_info,
> +		   struct kexec_buf *kbuf,
> +		   unsigned long *lowest_load_addr)
>   {
> -	unsigned long base = 0, lowest_addr = UINT_MAX;
> +	unsigned long lowest_addr = UINT_MAX;
>   	int ret;
>   	size_t i;
> -	struct kexec_buf kbuf = { .image = image, .buf_max = ppc64_rma_size,
> -				  .top_down = false };
> -
>   	/* Read in the PT_LOAD segments. */
>   	for (i = 0; i < ehdr->e_phnum; i++) {
>   		unsigned long load_addr;
> @@ -542,123 +483,58 @@ static int elf_exec_load(struct kimage *image, struct elfhdr *ehdr,
>   		if (size > phdr->p_memsz)
>   			size = phdr->p_memsz;
>   
> -		kbuf.buffer = (void *) elf_info->buffer + phdr->p_offset;
> -		kbuf.bufsz = size;
> -		kbuf.memsz = phdr->p_memsz;
> -		kbuf.buf_align = phdr->p_align;
> -		kbuf.buf_min = phdr->p_paddr + base;
> -		ret = kexec_add_buffer(&kbuf);
> +		kbuf->buffer = (void *) elf_info->buffer + phdr->p_offset;
> +		kbuf->bufsz = size;
> +		kbuf->memsz = phdr->p_memsz;
> +		kbuf->buf_align = phdr->p_align;
> +		kbuf->buf_min = phdr->p_paddr;
> +		kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
> +		ret = kexec_add_buffer(kbuf);
>   		if (ret)
>   			goto out;
> -		load_addr = kbuf.mem;
> +		load_addr = kbuf->mem;
>   
>   		if (load_addr < lowest_addr)
>   			lowest_addr = load_addr;
>   	}
>   
> -	/* Update entry point to reflect new load address. */
> -	ehdr->e_entry += base;
> -
> +	image->start = ehdr->e_entry;
>   	*lowest_load_addr = lowest_addr;
>   	ret = 0;
>    out:
>   	return ret;
>   }
>   
> -static void *elf64_load(struct kimage *image, char *kernel_buf,
> -			unsigned long kernel_len, char *initrd,
> -			unsigned long initrd_len, char *cmdline,
> -			unsigned long cmdline_len)
> +int kexec_elf_kernel_load(struct kimage *image, struct kexec_buf *kbuf,
> +			char *kernel_buf, unsigned long kernel_len,
> +			unsigned long *kernel_load_addr)
>   {
>   	int ret;
> -	unsigned int fdt_size;
> -	unsigned long kernel_load_addr;
> -	unsigned long initrd_load_addr = 0, fdt_load_addr;
> -	void *fdt;
> -	const void *slave_code;
>   	struct elfhdr ehdr;
> -	struct elf_info elf_info;
> -	struct kexec_buf kbuf = { .image = image, .buf_min = 0,
> -				  .buf_max = ppc64_rma_size };
> -	struct kexec_buf pbuf = { .image = image, .buf_min = 0,
> -				  .buf_max = ppc64_rma_size, .top_down = true };
> -
> -	ret = build_elf_exec_info(kernel_buf, kernel_len, &ehdr, &elf_info);
> -	if (ret)
> -		goto out;
> +	struct kexec_elf_info elf_info;
>   
> -	ret = elf_exec_load(image, &ehdr, &elf_info, &kernel_load_addr);
> +	ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
>   	if (ret)
>   		goto out;
>   
> -	pr_debug("Loaded the kernel at 0x%lx\n", kernel_load_addr);
> -
> -	ret = kexec_load_purgatory(image, &pbuf);
> -	if (ret) {
> -		pr_err("Loading purgatory failed.\n");
> -		goto out;
> -	}
> -
> -	pr_debug("Loaded purgatory at 0x%lx\n", pbuf.mem);
> -
> -	if (initrd != NULL) {
> -		kbuf.buffer = initrd;
> -		kbuf.bufsz = kbuf.memsz = initrd_len;
> -		kbuf.buf_align = PAGE_SIZE;
> -		kbuf.top_down = false;
> -		ret = kexec_add_buffer(&kbuf);
> -		if (ret)
> -			goto out;
> -		initrd_load_addr = kbuf.mem;
> -
> -		pr_debug("Loaded initrd at 0x%lx\n", initrd_load_addr);
> -	}
> -
> -	fdt_size = fdt_totalsize(initial_boot_params) * 2;
> -	fdt = kmalloc(fdt_size, GFP_KERNEL);
> -	if (!fdt) {
> -		pr_err("Not enough memory for the device tree.\n");
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> -	ret = fdt_open_into(initial_boot_params, fdt, fdt_size);
> -	if (ret < 0) {
> -		pr_err("Error setting up the new device tree.\n");
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -
> -	ret = setup_new_fdt(image, fdt, initrd_load_addr, initrd_len, cmdline);
> -	if (ret)
> -		goto out;
> -
> -	fdt_pack(fdt);
> +	ret = kexec_elf_load(image, &ehdr, &elf_info, kbuf, kernel_load_addr);
> +out:
> +	kexec_free_elf_info(&elf_info);
> +	return ret;
>   
> -	kbuf.buffer = fdt;
> -	kbuf.bufsz = kbuf.memsz = fdt_size;
> -	kbuf.buf_align = PAGE_SIZE;
> -	kbuf.top_down = true;
> -	ret = kexec_add_buffer(&kbuf);
> -	if (ret)
> -		goto out;
> -	fdt_load_addr = kbuf.mem;
> +}
>   
> -	pr_debug("Loaded device tree at 0x%lx\n", fdt_load_addr);
> +int kexec_elf_probe(const char *buf, unsigned long len)
> +{
> +	struct elfhdr ehdr;
> +	struct kexec_elf_info elf_info;
> +	int ret;
>   
> -	slave_code = elf_info.buffer + elf_info.proghdrs[0].p_offset;
> -	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
> -			      fdt_load_addr);
> +	ret = kexec_build_elf_info(buf, len, &ehdr, &elf_info);
>   	if (ret)
> -		pr_err("Error setting up the purgatory.\n");
> +		return ret;
>   
> -out:
> -	elf_free_info(&elf_info);
> +	kexec_free_elf_info(&elf_info);
>   
> -	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
> -	return ret ? ERR_PTR(ret) : fdt;
> +	return elf_check_arch(&ehdr) ? 0 : -ENOEXEC;
>   }
> -
> -const struct kexec_file_ops kexec_elf64_ops = {
> -	.probe = elf64_probe,
> -	.load = elf64_load,
> -};
> 


Christophe
