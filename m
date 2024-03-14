Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879DA87C109
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 17:13:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IIBgkL/9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwXVy2GYCz3vYB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 03:13:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IIBgkL/9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwXVB68ffz3bXk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 03:13:04 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e6c0098328so1028563b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 09:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710432782; x=1711037582; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NNT5KeqAV92Vo5ttm2M3Vsv7FvukLoVx50A9qFgKXzo=;
        b=IIBgkL/9i6kAxly8DXiyR7KkOPHq6vgOUdgLjeFaKpXSzVTxgUCIUOJ2DuVKX38P6I
         sO89ocG9QiyqFAj5DdtZxMbdqZ8Kb+otekq359uX3ru5NfODg9hXK8WX6kcAYn0JuTwm
         4mT6FjZ0HER+YGqqxwEFfnBVfcDA/numE1X9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710432782; x=1711037582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNT5KeqAV92Vo5ttm2M3Vsv7FvukLoVx50A9qFgKXzo=;
        b=SE/aZtxp9p12V/o507pghmd5i+dcyxFM7wzRzElg9oBKoAHPQ0Oo/8RSgTzffkOLhi
         daTXKdKI80CWHda2yCOVxJ1gwz6fHSdrh2ZecaWYNdfvjTgbxpNiJMk5MhOpEGHx8gan
         eBrp9A28ttbBEg8sgbHDMZhJbvh3RHjdr3Y0DW2V0u3WbbwDP+9y5iSJjXlnDAkUIiFF
         CQ0/BniUQTJDx9c9HofF3/hs5Iy9p7yUgi8gzKsa1sDlXAUbQUCyKKFiZ2GeXn6l6Tq7
         4jCaTtRBWE/TKsXhsRg82/c0h13w9bJ46j9TGIqLndxZ95DYO7w6IwrMiAbnYxA07G/o
         MVJw==
X-Forwarded-Encrypted: i=1; AJvYcCWu/+2v94w5nAJ8/jiue8QVcrpT02+OL+OT7CvtzI2NeUf3fgTC0inew9hs3DLB3flZ90SvUrh/DaaiSuzX5r9m+gw8M5uDsfR/3e/FnA==
X-Gm-Message-State: AOJu0Yy+Z5yE6WeFDpdaHXdVQjpZxOQFLjvc3eoqBGI1tUxHev4eY3gV
	zxuuDgh9wfSk5Ud57d2OLOMCdQ9143RTMRybficFTQKF1huPPYoIfc7opR9EMw==
X-Google-Smtp-Source: AGHT+IE/O6pHS1pZmi6EViuPOL/FfHus2QPDk6/PDxlis6XiF7Wo+Q7Gf92imFZIDKoMF5G/u+CmPw==
X-Received: by 2002:a05:6a20:8415:b0:1a3:378d:dc6 with SMTP id c21-20020a056a20841500b001a3378d0dc6mr2804292pzd.38.1710432781569;
        Thu, 14 Mar 2024 09:13:01 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b2-20020a056a00114200b006e6b7124b33sm1659371pfm.209.2024.03.14.09.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 09:13:01 -0700 (PDT)
Date: Thu, 14 Mar 2024 09:13:00 -0700
From: Kees Cook <keescook@chromium.org>
To: Vignesh Balasubramanian <vigbalas@amd.com>
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Message-ID: <202403140850.5659C0F4@keescook>
References: <20240314112359.50713-1-vigbalas@amd.com>
 <20240314112359.50713-2-vigbalas@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314112359.50713-2-vigbalas@amd.com>
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
Cc: matz@suse.de, felix.willgerodt@intel.com, jhb@freebsd.org, bpetkov@amd.com, binutils@sourceware.org, x86@kernel.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, linux-mm@kvack.org, npiggin@gmail.com, linux-toolchains@vger.kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 04:53:28PM +0530, Vignesh Balasubramanian wrote:
> Add a new .note section containing type, size, offset and flags of
> every xfeature that is present.
> 
> This information will be used by the debuggers to understand the XSAVE
> layout of the machine where the core file is dumped, and to read XSAVE
> registers, especially during cross-platform debugging.

I see binutils in CC. Can someone from gdb confirm that this solution
can be used?

> 
> Co-developed-by: Jini Susan George <jinisusan.george@amd.com>
> Signed-off-by: Jini Susan George <jinisusan.george@amd.com>
> Signed-off-by: Vignesh Balasubramanian <vigbalas@amd.com>
> ---
>  arch/Kconfig                   |   9 +++
>  arch/powerpc/Kconfig           |   1 +
>  arch/powerpc/include/asm/elf.h |   2 -
>  arch/x86/Kconfig               |   1 +
>  arch/x86/include/asm/elf.h     |   7 +++
>  arch/x86/kernel/fpu/xstate.c   | 101 +++++++++++++++++++++++++++++++++
>  include/linux/elf.h            |   2 +-
>  include/uapi/linux/elf.h       |   1 +
>  8 files changed, 121 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index fd18b7db2c77..3bd8a0b2bba1 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -502,6 +502,15 @@ config MMU_LAZY_TLB_SHOOTDOWN
>  config ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	bool
>  
> +config ARCH_HAVE_EXTRA_ELF_NOTES
> +	bool
> +	help
> +	  An architecture should select this in order to enable adding an
> +	  arch-specific ELF note section to core files. It must provide two
> +	  functions: elf_coredump_extra_notes_size() and
> +	  elf_coredump_extra_notes_write() which are invoked by the ELF core
> +	  dumper.
> +
>  config ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>  	bool
>  
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index a91cb070ca4a..3b31bd7490e2 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -156,6 +156,7 @@ config PPC
>  	select ARCH_HAS_UACCESS_FLUSHCACHE
>  	select ARCH_HAS_UBSAN
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> +	select ARCH_HAVE_EXTRA_ELF_NOTES        if SPU_BASE
>  	select ARCH_KEEP_MEMBLOCK
>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
>  	select ARCH_MIGHT_HAVE_PC_PARPORT
> diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/elf.h
> index 79f1c480b5eb..bb4b94444d3e 100644
> --- a/arch/powerpc/include/asm/elf.h
> +++ b/arch/powerpc/include/asm/elf.h
> @@ -127,8 +127,6 @@ extern int arch_setup_additional_pages(struct linux_binprm *bprm,
>  /* Notes used in ET_CORE. Note name is "SPU/<fd>/<filename>". */
>  #define NT_SPU		1
>  
> -#define ARCH_HAVE_EXTRA_ELF_NOTES
> -
>  #endif /* CONFIG_SPU_BASE */
>  
>  #ifdef CONFIG_PPC64
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 78050d5d7fac..35e8d1201099 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -104,6 +104,7 @@ config X86
>  	select ARCH_HAS_DEBUG_WX
>  	select ARCH_HAS_ZONE_DMA_SET if EXPERT
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> +	select ARCH_HAVE_EXTRA_ELF_NOTES
>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>  	select ARCH_MIGHT_HAVE_ACPI_PDC		if ACPI
>  	select ARCH_MIGHT_HAVE_PC_PARPORT
> diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
> index 1fb83d47711f..1b9f0b4bf6bc 100644
> --- a/arch/x86/include/asm/elf.h
> +++ b/arch/x86/include/asm/elf.h
> @@ -13,6 +13,13 @@
>  #include <asm/auxvec.h>
>  #include <asm/fsgsbase.h>
>  
> +struct xfeat_component {
> +	u32 xfeat_type;
> +	u32 xfeat_sz;
> +	u32 xfeat_off;
> +	u32 xfeat_flags;
> +} __packed;

While it is currently true, just for robustness, can you add
a _Static_assert that sizeof(struct xfeat_component) % 4 == 0 ?
Notes must be 4-byte aligned.

> +
>  typedef unsigned long elf_greg_t;
>  
>  #define ELF_NGREG (sizeof(struct user_regs_struct) / sizeof(elf_greg_t))
> diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
> index 117e74c44e75..6e5ea483ec1d 100644
> --- a/arch/x86/kernel/fpu/xstate.c
> +++ b/arch/x86/kernel/fpu/xstate.c
> @@ -13,6 +13,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/proc_fs.h>
>  #include <linux/vmalloc.h>
> +#include <linux/coredump.h>
>  
>  #include <asm/fpu/api.h>
>  #include <asm/fpu/regset.h>
> @@ -1836,3 +1837,103 @@ int proc_pid_arch_status(struct seq_file *m, struct pid_namespace *ns,
>  	return 0;
>  }
>  #endif /* CONFIG_PROC_PID_ARCH_STATUS */
> +
> +/*
> + * Dump type, size, offset and flag values for every xfeature that is present.
> + */
> +static int dump_xsave_layout_desc(struct coredump_params *cprm)
> +{
> +
> +	struct xfeat_component xc;
> +	int num_records = 0;
> +	int i;
> +
> +	/* XFEATURE_FPU and XFEATURE_SSE, both are fixed legacy states. */
> +	for (i = 0; i < FIRST_EXTENDED_XFEATURE; i++) {
> +		xc.xfeat_type = i;
> +		xc.xfeat_sz = xstate_sizes[i];
> +		xc.xfeat_off = xstate_offsets[i];
> +		xc.xfeat_flags = xstate_flags[i];
> +
> +		if (!dump_emit(cprm, &xc, sizeof(struct xfeat_component)))
> +			return 0;
> +		num_records++;
> +	}
> +
> +	for_each_extended_xfeature(i, fpu_user_cfg.max_features) {
> +		xc.xfeat_type = i;
> +		xc.xfeat_sz = xstate_sizes[i];
> +		xc.xfeat_off = xstate_offsets[i];
> +		xc.xfeat_flags = xstate_flags[i];
> +
> +		if (!dump_emit(cprm, &xc, sizeof(struct xfeat_component)))
> +			return 0;
> +		num_records++;
> +	}
> +
> +	return num_records;
> +}
> +
> +static int get_xsave_desc_size(void)
> +{
> +	/* XFEATURE_FP and XFEATURE_SSE, both are fixed legacy states */
> +	int xfeatures_count = 2;
> +	int i;
> +
> +	for_each_extended_xfeature(i, fpu_user_cfg.max_features)
> +		xfeatures_count++;
> +
> +	return xfeatures_count * (sizeof(struct xfeat_component));
> +}
> +
> +int elf_coredump_extra_notes_write(struct coredump_params *cprm)
> +{
> +	const char *owner_name = "LINUX";

If you use an array instead of a pointer, there's no need for strlen(),
and you can make it a static outside of the function to refer to it
later.

static const char owner_name[] = "LINUX";

> +	int num_records = 0;
> +	struct elf_note en;
> +
> +	en.n_namesz = strlen(owner_name) + 1;

en.n_namesz = sizeof(owner_name);

> +	en.n_descsz = get_xsave_desc_size();
> +	en.n_type = NT_X86_XSAVE_LAYOUT;
> +
> +	if (!dump_emit(cprm, &en, sizeof(en)))
> +		return 1;
> +	if (!dump_emit(cprm, owner_name, en.n_namesz))
> +		return 1;
> +	if (!dump_align(cprm, 4))
> +		return 1;
> +
> +	num_records = dump_xsave_layout_desc(cprm);
> +	if (!num_records) {
> +		pr_warn("Error adding XSTATE layout ELF note. XSTATE buffer in the core file will be unparseable.");

Can you make this pr_warn_ratelimited() (and below)?

> +		return 1;
> +	}
> +
> +	/* Total size should be equal to the number of records */
> +	if ((sizeof(struct xfeat_component) * num_records) != en.n_descsz) {
> +		pr_warn("Error adding XSTATE layout ELF note. The size of the .note section does not match with the total size of the records.");
> +		return 1;
> +	}
> +
> +	if (!dump_align(cprm, 4))
> +		return 1;

I don't think this call is needed?

> +
> +	return 0;
> +}
> +
> +/*
> + * Return the size of new note.
> + */
> +int elf_coredump_extra_notes_size(void)
> +{
> +	const char *fullname = "LINUX";

Now this can be dropped.

> +	int size = 0;
> +
> +	/* NOTE Header */
> +	size += sizeof(struct elf_note);
> +	/* name + align */
> +	size += roundup(strlen(fullname) + 1, 4);

	size += roundup(sizeof(owner_name), 4);

> +	size += get_xsave_desc_size();
> +
> +	return size;
> +}
> diff --git a/include/linux/elf.h b/include/linux/elf.h
> index c9a46c4e183b..5c402788da19 100644
> --- a/include/linux/elf.h
> +++ b/include/linux/elf.h
> @@ -65,7 +65,7 @@ extern Elf64_Dyn _DYNAMIC [];
>  struct file;
>  struct coredump_params;
>  
> -#ifndef ARCH_HAVE_EXTRA_ELF_NOTES
> +#ifndef CONFIG_ARCH_HAVE_EXTRA_ELF_NOTES
>  static inline int elf_coredump_extra_notes_size(void) { return 0; }
>  static inline int elf_coredump_extra_notes_write(struct coredump_params *cprm) { return 0; }
>  #else
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index 9417309b7230..3325488cb39b 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -411,6 +411,7 @@ typedef struct elf64_shdr {
>  #define NT_X86_XSTATE	0x202		/* x86 extended state using xsave */
>  /* Old binutils treats 0x203 as a CET state */
>  #define NT_X86_SHSTK	0x204		/* x86 SHSTK state */
> +#define NT_X86_XSAVE_LAYOUT	0x205	/* XSAVE layout description */
>  #define NT_S390_HIGH_GPRS	0x300	/* s390 upper register halves */
>  #define NT_S390_TIMER	0x301		/* s390 timer register */
>  #define NT_S390_TODCMP	0x302		/* s390 TOD clock comparator register */
> -- 
> 2.43.0
> 

Otherwise looks reasonable, though I see Dave has feedback to address
too. :)

Thanks for working on this!

-Kees

-- 
Kees Cook
