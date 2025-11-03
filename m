Return-Path: <linuxppc-dev+bounces-13694-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B7C2BD5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 13:52:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0WhM6l6qz2yrm;
	Mon,  3 Nov 2025 23:52:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1030"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762174355;
	cv=none; b=KZ156VarNLR/Y2MFjjvDbNKQN4H1A2LE1F+RXG6ZU+yV4+bnkGJHq3E7UVQkea2YmR0IErUhvAHOMNoP62PP1jThNls/dLN0iiPFf+oingyA9Ebo4Nxx03bRNHtAAZH0V7ptaj+u/9vYcPmt3f0YgRpt0RfXSZKkTZIBNSTnl75+jTs71mgCxQ+EZDPTc7m2ZsYgBia0qwd57Srgbmz8A9yyd8sAut7PilFfagcaNC3/HciNcjpCwTXf4h3SpnCuQQ9kEnH3UTX9YS83folKOVeZjr7UFD5TNOR+dimw9ct62MKebr3dinP+9mOfxoY8I/DG/HmJ3PYcYWhbA3HySw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762174355; c=relaxed/relaxed;
	bh=ZPuCVp19rwtajvK56KK/F0/OHsoUFzTB2npaMEA3thI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=TFgTv6gq3cqG1tOtB9/5z+/v9VF3jB2c7TzegQZHcEFy/s/lCk44PQLKzx97pS45xcV8M4trbmXX8xldlI+mrqHFMN8nf52ryZz27incdJ0Uutw4y2m5MUNdJbsGyJl4jxZF/eQ5le10yHhhX0xf5YZEqKFW82Dr/VRtvs/SN8KyEGhBG09arAEsDgVzRGKiMCWjTedLeTNQPmdf6WW+zg0RMOUvO/Paek651YTjzHDtNP6OaXvLfqFmxQRMJW0GwT4Cbui+oXIAuKbgnwk83IawiecylLGET1MIwipINVSS1H4Dv5gP6+1zXJXH9jPjzkc9T4EsKVtD9X9uGmdiKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SxLJeE4Q; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SxLJeE4Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0WhL6Gspz2xnx
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 23:52:33 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3410c86070dso747644a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Nov 2025 04:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762174352; x=1762779152; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZPuCVp19rwtajvK56KK/F0/OHsoUFzTB2npaMEA3thI=;
        b=SxLJeE4QwNdnaRdioniDKVntulmLdFI2eEyC3H86OPKt9YF0S2BZ8eHD/6IRfLqphU
         GnkUGOwXlDlzP8B65FMt6Q6RXNWr+Lh3vr1hoaJbbe1T5NNYd+fqOnmUh0vGwS92kfk9
         p4dqk3HQJG9K4ZmmJiscaVEOW1KcFH567uC15HeD6lZBDGZNNavPaBtyqbzL+lJEV8Bv
         CrZ6jVw8OHTDXzrVrly91w1I1mTQXJv6s8NzMVWs4lENrd8CTl0egBdFzJGINawbGEHC
         iQtcYfUGN7nMB3OxUA5FLeHY39Hi3Ya5XnygJv9GOsc60vb0A5B2qSblqAn+gelDYr0S
         HxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762174352; x=1762779152;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPuCVp19rwtajvK56KK/F0/OHsoUFzTB2npaMEA3thI=;
        b=KDPZjMnhvc0Z2CwtSmoRn6JuTL2tyIrzlIQaQh/R9+S94p/ZZpEzSHuB/tveybjuPo
         FPUFxIqX26oMrcS0r7DhU0YZ+DSwv7zSsBlgIyjFWvF8vn1BxywfjtYtKTsyK6qJ9mxw
         G2d1LTvV8ZaEIfxljwnWUxb1EQPikvgMzukIL/cY+XTyXrZ3RGZU2m5+UwGv9wOwsX+p
         5VirU7w2N6jq4YUcfWKgrCnq3ir6dFaGIe61kJsT0peWkY1RMwK4XulpnlmQx0VrR9eK
         nGfnuRfSrPCnpgQRpeDs8milyKV0tzmKURyv1jSwzvopx1+fVrwm5ddVei4CfqRnbJf4
         7Z+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0mULhgXUyqLYXCTcDtrdWDsw2LEqJ8K5eqtPSnUmmmDxaCZpv0eqRlUCe9ofkLZoSCmbUZevds7KoBRE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1a7JIieoyLiRhHpAxdUnK3krKUHYQUwrUUG17Hfg0dj0c1lDP
	qkaopuIfVCI/fdxaea/QZ8SM9JVxJl9kyxv1ZgWMJIIBhpcV12/jP2ew
X-Gm-Gg: ASbGncsTm0oKXxYIQGwFXvJm5jUAXByUKqhSmhqR5855hTm3hzpDa3xYmc4gR8zuWq5
	xSs249fagzIRiUKHBAQJ0tIA1duA+OfVM79SzycDVWQFnTktZB7W2JbLSrmsPC1UXS2XNT6bWgO
	vET6o805sWq2paKiUgvUGt25LakooQBxqzayraEveK5PeUm7HIYDPYx5VF3s9Ozwxi5TUdeDBcQ
	zqbTZdPMfAZACOJ9J5Fd7PpLhl5vVnAka+onzmNZoFUgA2xfF7FKVD8V0U8GXW6tqkNQvCPPRkw
	tyWEjr2pGHur7ZnsznMCGQKNIruCHq1OzjtiLWZyDtslxBSxRSIzpwhx5yvnJ9GqtvXM3wcZDK6
	SSxk2UHnkPoW82w2dkjjuGChQZ+YMa7K77jw6nB7a0gmxb6GazrDckNTtR/vo1Qv7E8HaWA==
X-Google-Smtp-Source: AGHT+IFnm5vVQ4LL2FiBxK5wjOxArExyZSlTVpwK9caPgGksac55Zj0+jJbxQegqTQKm1Vaw8fvuYA==
X-Received: by 2002:a17:90b:50:b0:340:9d52:44c1 with SMTP id 98e67ed59e1d1-3409d524557mr13145643a91.35.1762174351724;
        Mon, 03 Nov 2025 04:52:31 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341599f13f2sm1007160a91.11.2025.11.03.04.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:52:30 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
Subject: Re: [PATCH v5] powerpc/kdump: Add support for crashkernel CMA reservation
In-Reply-To: <20251103043747.1298065-1-sourabhjain@linux.ibm.com>
Date: Mon, 03 Nov 2025 15:40:10 +0530
Message-ID: <87y0on4ebh.ritesh.list@gmail.com>
References: <20251103043747.1298065-1-sourabhjain@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> crashkernel= command line option") and commit ab475510e042 ("kdump:
> implement reserve_crashkernel_cma") added CMA support for kdump
> crashkernel reservation.
>
> Extend crashkernel CMA reservation support to powerpc.
>
> The following changes are made to enable CMA reservation on powerpc:
>
> - Parse and obtain the CMA reservation size along with other crashkernel
>   parameters
> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump
> - Include the CMA-reserved ranges in the usable memory ranges for the
>   kdump kernel to use.
> - Exclude the CMA-reserved ranges from the crash kernel memory to
>   prevent them from being exported through /proc/vmcore.
>
> With the introduction of the CMA crashkernel regions,
> crash_exclude_mem_range() needs to be called multiple times to exclude
> both crashk_res and crashk_cma_ranges from the crash memory ranges. To
> avoid repetitive logic for validating mem_ranges size and handling
> reallocation when required, this functionality is moved to a new wrapper
> function crash_exclude_mem_range_guarded().
>
> To ensure proper CMA reservation, reserve_crashkernel_cma() is called
> after pageblock_order is initialized.
>
> Update kernel-parameters.txt to document CMA support for crashkernel on
> powerpc architecture.
>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Jiri Bohac <jbohac@suse.cz>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: kexec@lists.infradead.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> Changlog:
>
> v3 -> v4
>  - Removed repeated initialization to tmem in
>    crash_exclude_mem_range_guarded()
>  - Call crash_exclude_mem_range() with right crashk ranges
>
> v4 -> v5:
>  - Document CMA-based crashkernel support for ppc64 in kernel-parameters.txt
> ---
>  .../admin-guide/kernel-parameters.txt         |  2 +-
>  arch/powerpc/include/asm/kexec.h              |  2 +
>  arch/powerpc/kernel/setup-common.c            |  4 +-
>  arch/powerpc/kexec/core.c                     | 10 ++++-
>  arch/powerpc/kexec/ranges.c                   | 43 ++++++++++++++-----
>  5 files changed, 47 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 6c42061ca20e..0f386b546cec 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1013,7 +1013,7 @@
>  			It will be ignored when crashkernel=X,high is not used
>  			or memory reserved is below 4G.
>  	crashkernel=size[KMG],cma
> -			[KNL, X86] Reserve additional crash kernel memory from
> +			[KNL, X86, ppc64] Reserve additional crash kernel memory from

Shouldn't this be PPC and not ppc64?

If I see the crash_dump support... 

config ARCH_SUPPORTS_CRASH_DUMP
	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)

The changes below aren't specific to ppc64 correct? 

>  			CMA. This reservation is usable by the first system's
>  			userspace memory and kernel movable allocations (memory
>  			balloon, zswap). Pages allocated from this memory range
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index 4bbf9f699aaa..bd4a6c42a5f3 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -115,9 +115,11 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt, struct crash_mem
>  #ifdef CONFIG_CRASH_RESERVE
>  int __init overlaps_crashkernel(unsigned long start, unsigned long size);
>  extern void arch_reserve_crashkernel(void);
> +extern void kdump_cma_reserve(void);
>  #else
>  static inline void arch_reserve_crashkernel(void) {}
>  static inline int overlaps_crashkernel(unsigned long start, unsigned long size) { return 0; }
> +static inline void kdump_cma_reserve(void) { }
>  #endif
>  
>  #if defined(CONFIG_CRASH_DUMP)
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 68d47c53876c..c8c42b419742 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -35,6 +35,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/hugetlb.h>
>  #include <linux/pgtable.h>
> +#include <asm/kexec.h>
>  #include <asm/io.h>
>  #include <asm/paca.h>
>  #include <asm/processor.h>
> @@ -995,11 +996,12 @@ void __init setup_arch(char **cmdline_p)
>  	initmem_init();
>  
>  	/*
> -	 * Reserve large chunks of memory for use by CMA for fadump, KVM and
> +	 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM and
>  	 * hugetlb. These must be called after initmem_init(), so that
>  	 * pageblock_order is initialised.
>  	 */
>  	fadump_cma_init();
> +	kdump_cma_reserve();
>  	kvm_cma_reserve();
>  	gigantic_hugetlb_cma_reserve();
>  
> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
> index d1a2d755381c..25744737eff5 100644
> --- a/arch/powerpc/kexec/core.c
> +++ b/arch/powerpc/kexec/core.c
> @@ -33,6 +33,8 @@ void machine_kexec_cleanup(struct kimage *image)
>  {
>  }
>  
> +unsigned long long cma_size;
> +

nit:
Since this is a gloabal powerpc variable you are defining, then can we
keep it's name to crashk_cma_size?

>  /*
>   * Do not allocate memory (or fail in any way) in machine_kexec().
>   * We are past the point of no return, committed to rebooting now.
> @@ -110,7 +112,7 @@ void __init arch_reserve_crashkernel(void)
>  
>  	/* use common parsing */
>  	ret = parse_crashkernel(boot_command_line, total_mem_sz, &crash_size,
> -				&crash_base, NULL, NULL, NULL);
> +				&crash_base, NULL, &cma_size, NULL);
>  
>  	if (ret)
>  		return;
> @@ -130,6 +132,12 @@ void __init arch_reserve_crashkernel(void)
>  	reserve_crashkernel_generic(crash_size, crash_base, 0, false);
>  }
>  
> +void __init kdump_cma_reserve(void)
> +{
> +	if (cma_size)
> +		reserve_crashkernel_cma(cma_size);
> +}
> +

nit:
cma_size is already checked for null within reserve_crashkernel_cma(),
so we don't really need kdump_cma_reserve() function call as such.

Also kdump_cma_reserve() only make sense with #ifdef CRASHKERNEL_CMA..
so instead do you think we can directly call reserve_crashkernel_cma(cma_size)?

-ritesh

>  int __init overlaps_crashkernel(unsigned long start, unsigned long size)
>  {
>  	return (start + size) > crashk_res.start && start <= crashk_res.end;
> diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
> index 3702b0bdab14..3bd27c38726b 100644
> --- a/arch/powerpc/kexec/ranges.c
> +++ b/arch/powerpc/kexec/ranges.c
> @@ -515,7 +515,7 @@ int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
>   */
>  int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>  {
> -	int ret;
> +	int ret, i;
>  
>  	/*
>  	 * Early boot failure observed on guests when low memory (first memory
> @@ -528,6 +528,13 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>  	if (ret)
>  		goto out;
>  
> +	for (i = 0; i < crashk_cma_cnt; i++) {
> +		ret = add_mem_range(mem_ranges, crashk_cma_ranges[i].start,
> +				    crashk_cma_ranges[i].end - crashk_cma_ranges[i].start + 1);
> +		if (ret)
> +			goto out;
> +	}
> +
>  	ret = add_rtas_mem_range(mem_ranges);
>  	if (ret)
>  		goto out;
> @@ -546,6 +553,22 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>  #endif /* CONFIG_KEXEC_FILE */
>  
>  #ifdef CONFIG_CRASH_DUMP
> +static int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
> +					   unsigned long long mstart,
> +					   unsigned long long mend)
> +{
> +	struct crash_mem *tmem = *mem_ranges;
> +
> +	/* Reallocate memory ranges if there is no space to split ranges */
> +	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
> +		tmem = realloc_mem_ranges(mem_ranges);
> +		if (!tmem)
> +			return -ENOMEM;
> +	}
> +
> +	return crash_exclude_mem_range(tmem, mstart, mend);
> +}
> +
>  /**
>   * get_crash_memory_ranges - Get crash memory ranges. This list includes
>   *                           first/crashing kernel's memory regions that
> @@ -557,7 +580,6 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>  int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>  {
>  	phys_addr_t base, end;
> -	struct crash_mem *tmem;
>  	u64 i;
>  	int ret;
>  
> @@ -582,19 +604,18 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>  			sort_memory_ranges(*mem_ranges, true);
>  	}
>  
> -	/* Reallocate memory ranges if there is no space to split ranges */
> -	tmem = *mem_ranges;
> -	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
> -		tmem = realloc_mem_ranges(mem_ranges);
> -		if (!tmem)
> -			goto out;
> -	}
> -
>  	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
> +	ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_res.start, crashk_res.end);
>  	if (ret)
>  		goto out;
>  
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_cma_ranges[i].start,
> +					      crashk_cma_ranges[i].end);
> +		if (ret)
> +			goto out;
> +	}
> +
>  	/*
>  	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
>  	 *        regions are exported to save their context at the time of
> -- 
> 2.51.0

