Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B71BD8BF7FD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 10:05:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HxlHGsnP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZ73z5lT8z3cVb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 18:05:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HxlHGsnP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZ73C6yX4z2xYY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 18:04:39 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3c7513a991cso2710312b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2024 01:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715155475; x=1715760275; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v6EJLX/g+mtUojj2Iv/MkNkp9Pc492RGZqRm8bYlqdU=;
        b=HxlHGsnPZAxTYfB1ttb9RHO4sfwIRRtK97Q3x/630k0PHCLuZg8FtGfquphhodIJk7
         Ng1UR1L6r1ZVXpoTlyCOa0TjyqEPXHPdjTQDYd+IxfMNyz5WWwSJz3/RyeAdAjPTeQe2
         mR+fxNjp2FzwCMwRzrrVzJPR7HGNdbH50TLPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715155475; x=1715760275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6EJLX/g+mtUojj2Iv/MkNkp9Pc492RGZqRm8bYlqdU=;
        b=hLxOspTWE1WcOZA0C+qy8SeZOLonCb/RmSAr+drSIgJ1x/da4pcrE3IVZdJ52hsobX
         /ZMxq5NrJ1bHh6bNu3NSXEKXf56GEglCidskq9SMAZW0M+Zbv3n48IUkzkBneY8f2IsH
         lM1nezo7cMUJUXpijn/kwd1YvPqEurSIi87e+xC/vdh6gU08TwKflSMwXL3bwCM63uqg
         W55tp0AOvoAnYVJ6BeMVTCgTOEXZkyP2wBYsq0UZfrcEYHdYMfnkhDCniLQ+Tpb4Moh6
         wGHvwzNMPjPz6UJMPyQ1FuwO0547mC+5lWWVij6H9Psm8EB3Lkb5gjeRHIugT7n0BFDG
         WFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1BDkga9ag/p+Oh2rtfJh3//gOtBjGSP2CrEo9kDw1GTQQEET+zLVJ+LuTAT+kPDBeA7V+n67HKRsR1ZrdI8TNsFlOIODgYPvrCl1FNQ==
X-Gm-Message-State: AOJu0YzAuX5Dy7LT8CM0AuHc6A2AYfABBUaQJUqKQkgwriVVs3OP/zDA
	R+vUk2qxBh+tHNOS8o6Dn5uOCpkncKS1UUXqRt1ThkYOiUv+X89hpjPhYKk3lg==
X-Google-Smtp-Source: AGHT+IFUmdDASdFHNuEcG9nOH4SDdUFpg4trPBVbjPrOf0+LaQdNF0jK/JNzlvznjX7HLZafo1ThYg==
X-Received: by 2002:a05:6808:7c9:b0:3c9:6d23:fdd7 with SMTP id 5614622812f47-3c9852b7240mr2014216b6e.24.1715155474512;
        Wed, 08 May 2024 01:04:34 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c6-20020a056a00008600b006e6fc52ecd0sm9580410pfj.123.2024.05.08.01.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 01:04:33 -0700 (PDT)
Date: Wed, 8 May 2024 01:04:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Vignesh Balasubramanian <vigbalas@amd.com>
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Message-ID: <202405080052.21E569F@keescook>
References: <20240507095330.2674-1-vigbalas@amd.com>
 <20240507095330.2674-2-vigbalas@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507095330.2674-2-vigbalas@amd.com>
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

On Tue, May 07, 2024 at 03:23:31PM +0530, Vignesh Balasubramanian wrote:
> Add a new .note section containing type, size, offset and flags of
> every xfeature that is present.
> 
> This information will be used by the debuggers to understand the XSAVE
> layout of the machine where the core file is dumped, and to read XSAVE
> registers, especially during cross-platform debugging.
> 
> Some background:
> 
> The XSAVE layouts of modern AMD and Intel CPUs differ, especially since
> Memory Protection Keys and the AVX-512 features have been inculcated into
> the AMD CPUs.
> This is since AMD never adopted (and hence never left room in the XSAVE
> layout for) the Intel MPX feature. Tools like GDB had assumed a fixed XSAVE
> layout matching that of Intel (based on the XCR0 mask).
> Hence, the core dumps from AMD CPUs didn't match the known size for the
> XCR0 mask. This resulted in GDB and other tools not being able to access
> the values of the AVX-512 and PKRU registers on AMD CPUs.
> To solve this, an interim solution has been accepted into GDB, and is
> already a part of GDB 14, thanks to these series of patches
> [ https://sourceware.org/pipermail/gdb-patches/2023-March/198081.html ].
> But this patch series depends on heuristics based on the total XSAVE
> register set size and the XCR0 mask to infer the layouts of the various
> register blocks for core dumps, and hence, is not a foolproof mechanism to
> determine the layout of the XSAVE area.
> 
> Hence this new core dump note has been proposed as a more sturdy mechanism
> to allow GDB/LLDB and other relevant tools to determine the layout of the
> XSAVE area of the machine where the corefile was dumped.
> The new core dump note (which is being proposed as a per-process .note
> section), NT_X86_XSAVE_LAYOUT (0x205) contains an array of structures.
> Each structure describes an individual extended feature containing offset,
> size and flags (that is obtained through CPUID instruction) in a format
> roughly matching the follow C structure:
> 
> struct xfeat_component {
>        u32 xfeat_type;
>        u32 xfeat_sz;
>        u32 xfeat_off;
>        u32 xfeat_flags;
> };
> 
> Co-developed-by: Jini Susan George <jinisusan.george@amd.com>
> Signed-off-by: Jini Susan George <jinisusan.george@amd.com>
> Signed-off-by: Vignesh Balasubramanian <vigbalas@amd.com>
> ---
> v1->v2: Removed kernel internal defn dependency, code improvements
> 
>  arch/x86/Kconfig             |   1 +
>  arch/x86/include/asm/elf.h   |  34 +++++++++
>  arch/x86/kernel/fpu/xstate.c | 141 +++++++++++++++++++++++++++++++++++
>  fs/binfmt_elf.c              |   4 +-
>  include/uapi/linux/elf.h     |   1 +
>  5 files changed, 179 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 928820e61cb5..cc67daab3396 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -105,6 +105,7 @@ config X86
>  	select ARCH_HAS_DEBUG_WX
>  	select ARCH_HAS_ZONE_DMA_SET if EXPERT
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> +	select ARCH_HAVE_EXTRA_ELF_NOTES
>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>  	select ARCH_MIGHT_HAVE_ACPI_PDC		if ACPI
>  	select ARCH_MIGHT_HAVE_PC_PARPORT
> diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
> index 1fb83d47711f..5952574db64b 100644
> --- a/arch/x86/include/asm/elf.h
> +++ b/arch/x86/include/asm/elf.h
> @@ -13,6 +13,40 @@
>  #include <asm/auxvec.h>
>  #include <asm/fsgsbase.h>
>  
> +struct xfeat_component {
> +	u32 xfeat_type;
> +	u32 xfeat_sz;
> +	u32 xfeat_off;
> +	u32 xfeat_flags;
> +} __packed;
> +
> +_Static_assert(sizeof(struct xfeat_component)%4 == 0, "xfeat_component is not aligned");
> +
> +enum custom_feature {
> +	FEATURE_XSAVE_FP = 0,
> +	FEATURE_XSAVE_SSE = 1,
> +	FEATURE_XSAVE_YMM = 2,
> +	FEATURE_XSAVE_BNDREGS = 3,
> +	FEATURE_XSAVE_BNDCSR = 4,
> +	FEATURE_XSAVE_OPMASK = 5,
> +	FEATURE_XSAVE_ZMM_Hi256 = 6,
> +	FEATURE_XSAVE_Hi16_ZMM = 7,
> +	FEATURE_XSAVE_PT = 8,
> +	FEATURE_XSAVE_PKRU = 9,
> +	FEATURE_XSAVE_PASID = 10,
> +	FEATURE_XSAVE_CET_USER = 11,
> +	FEATURE_XSAVE_CET_SHADOW_STACK = 12,
> +	FEATURE_XSAVE_HDC = 13,
> +	FEATURE_XSAVE_UINTR = 14,
> +	FEATURE_XSAVE_LBR = 15,
> +	FEATURE_XSAVE_HWP = 16,
> +	FEATURE_XSAVE_XTILE_CFG = 17,
> +	FEATURE_XSAVE_XTILE_DATA = 18,
> +	FEATURE_MAX,
> +	FEATURE_XSAVE_EXTENDED_START = FEATURE_XSAVE_YMM,
> +	FEATURE_XSAVE_EXTENDED_END = FEATURE_XSAVE_XTILE_DATA,
> +};
> +
>  typedef unsigned long elf_greg_t;
>  
>  #define ELF_NGREG (sizeof(struct user_regs_struct) / sizeof(elf_greg_t))
> diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
> index 33a214b1a4ce..3d1c3c96e34d 100644
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
> @@ -87,6 +88,8 @@ static unsigned int xstate_flags[XFEATURE_MAX] __ro_after_init;
>  #define XSTATE_FLAG_SUPERVISOR	BIT(0)
>  #define XSTATE_FLAG_ALIGNED64	BIT(1)
>  
> +static const char owner_name[] = "LINUX";

This needs to move under the CONFIG_COREDUMP below (so says the build
bots).

> +
>  /*
>   * Return whether the system supports a given xfeature.
>   *
> @@ -1837,3 +1840,141 @@ int proc_pid_arch_status(struct seq_file *m, struct pid_namespace *ns,
>  	return 0;
>  }
>  #endif /* CONFIG_PROC_PID_ARCH_STATUS */
> +
> +#ifdef CONFIG_COREDUMP
> +static int get_sub_leaf(int custom_xfeat)

Why is this "int"? I don't imagine there are negative features?

> +{
> +	switch (custom_xfeat) {
> +	case FEATURE_XSAVE_YMM:			return XFEATURE_YMM;
> +	case FEATURE_XSAVE_BNDREGS:		return XFEATURE_BNDREGS;
> +	case FEATURE_XSAVE_BNDCSR:		return XFEATURE_BNDCSR;
> +	case FEATURE_XSAVE_OPMASK:		return XFEATURE_OPMASK;
> +	case FEATURE_XSAVE_ZMM_Hi256:		return XFEATURE_ZMM_Hi256;
> +	case FEATURE_XSAVE_Hi16_ZMM:		return XFEATURE_Hi16_ZMM;
> +	case FEATURE_XSAVE_PT:			return XFEATURE_PT_UNIMPLEMENTED_SO_FAR;
> +	case FEATURE_XSAVE_PKRU:		return XFEATURE_PKRU;
> +	case FEATURE_XSAVE_PASID:		return XFEATURE_PASID;
> +	case FEATURE_XSAVE_CET_USER:		return XFEATURE_CET_USER;
> +	case FEATURE_XSAVE_CET_SHADOW_STACK:	return XFEATURE_CET_KERNEL_UNUSED;
> +	case FEATURE_XSAVE_HDC:			return XFEATURE_RSRVD_COMP_13;
> +	case FEATURE_XSAVE_UINTR:		return XFEATURE_RSRVD_COMP_14;
> +	case FEATURE_XSAVE_LBR:			return XFEATURE_LBR;
> +	case FEATURE_XSAVE_HWP:			return XFEATURE_RSRVD_COMP_16;
> +	case FEATURE_XSAVE_XTILE_CFG:		return XFEATURE_XTILE_CFG;
> +	case FEATURE_XSAVE_XTILE_DATA:		return XFEATURE_XTILE_DATA;
> +	default:
> +		pr_warn_ratelimited("Not a valid XSAVE Feature.");

This isn't very friendly; it's keeping secrets about the unknown value. :)
Also it's missing a newline. How about:

		pr_warn_ratelimited("Not a known XSAVE Feature: %u\n",
				    custom_xfeat);

> +		return 0;
> +	}
> +}
> +
> +/*
> + * Dump type, size, offset and flag values for every xfeature that is present.
> + */
> +static int dump_xsave_layout_desc(struct coredump_params *cprm)
> +{
> +	u32 supported_features = 0;
> +	struct xfeat_component xc;
> +	u32 eax, ebx, ecx, edx;
> +	int num_records = 0;
> +	int sub_leaf = 0;
> +	int i;
> +
> +	/* Find supported extended features */
> +	cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
> +	supported_features = eax;
> +
> +	for (i = FEATURE_XSAVE_EXTENDED_START;
> +			i <= FEATURE_XSAVE_EXTENDED_END; i++) {
> +		sub_leaf = get_sub_leaf(i);
> +		if (!sub_leaf)
> +			continue;
> +		if (supported_features & (1U << sub_leaf)) {
> +			cpuid_count(XSTATE_CPUID, sub_leaf, &eax, &ebx, &ecx, &edx);
> +			xc.xfeat_type = i;
> +			xc.xfeat_sz = eax;
> +			xc.xfeat_off = ebx;
> +			/* Reserved for future use */
> +			xc.xfeat_flags = 0;
> +
> +			if (!dump_emit(cprm, &xc,
> +				       sizeof(struct xfeat_component)))
> +				return 0;
> +			num_records++;
> +		}
> +	}
> +
> +	return num_records;
> +}
> +
> +static int get_xsave_desc_size(void)

This can return u32: never negative.

> +{
> +	int supported_features = 0;
> +	int xfeatures_count = 0;
> +	u32 eax, ebx, ecx, edx;
> +	int sub_leaf = 0;
> +	int i;

"i" can be u32 and then we can fix the get_sub_leaf() arg type.

> +
> +	/* Find supported extended features */
> +	cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
> +	supported_features = eax;
> +
> +	for (i = FEATURE_XSAVE_EXTENDED_START;
> +			i <= FEATURE_XSAVE_EXTENDED_END; i++) {
> +		sub_leaf = get_sub_leaf(i);
> +		if (!sub_leaf)
> +			continue;
> +		if (supported_features & (1U << sub_leaf))
> +			xfeatures_count++;
> +	}
> +
> +	return xfeatures_count * (sizeof(struct xfeat_component));
> +}
> +
> +int elf_coredump_extra_notes_write(struct coredump_params *cprm)
> +{
> +	int num_records = 0;
> +	struct elf_note en;
> +
> +	en.n_namesz = sizeof(owner_name);
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
> +		pr_warn_ratelimited("Error adding XSTATE layout ELF note. XSTATE buffer in the core file will be unparseable.");

Missing trailing newline.

> +		return 1;
> +	}
> +
> +	/* Total size should be equal to the number of records */
> +	if ((sizeof(struct xfeat_component) * num_records) != en.n_descsz) {
> +		pr_warn_ratelimited("Error adding XSTATE layout ELF note. The size of the .note section does not match with the total size of the records.");

Same.

> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Return the size of new note.
> + */
> +int elf_coredump_extra_notes_size(void)
> +{
> +	int size = 0;
> +
> +	/* NOTE Header */
> +	size += sizeof(struct elf_note);
> +	/* name + align */
> +	size += roundup(sizeof(owner_name), 4);
> +	size += get_xsave_desc_size();
> +
> +	return size;
> +}
> +#endif

Since it's a long if/endif, add: /* CONFIG_COREDUMP */ after the endif
here.

> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index 5397b552fbeb..833bcb7e957b 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -2000,7 +2000,7 @@ static int elf_core_dump(struct coredump_params *cprm)
>  	{
>  		size_t sz = info.size;
>  
> -		/* For cell spufs */
> +		/* For cell spufs and x86 xstate */
>  		sz += elf_coredump_extra_notes_size();
>  
>  		phdr4note = kmalloc(sizeof(*phdr4note), GFP_KERNEL);
> @@ -2064,7 +2064,7 @@ static int elf_core_dump(struct coredump_params *cprm)
>  	if (!write_note_info(&info, cprm))
>  		goto end_coredump;
>  
> -	/* For cell spufs */
> +	/* For cell spufs and x86 xstate */
>  	if (elf_coredump_extra_notes_write(cprm))
>  		goto end_coredump;
>  
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index b54b313bcf07..e30a9b47dc87 100644
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
> 2.34.1
> 

Otherwise looks good. I'd like to see feedback from Intel folks too.

Thanks for working on this!

-Kees

-- 
Kees Cook
