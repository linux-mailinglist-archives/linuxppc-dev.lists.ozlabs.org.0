Return-Path: <linuxppc-dev+bounces-3019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF10C9C0F16
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 20:39:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xksq05JGtz3br5;
	Fri,  8 Nov 2024 06:39:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731008396;
	cv=none; b=GoHYajNTQ8RWzWkf8z3NbBrTeBSm9zgegAfPG1ha1A3FW95IhzxoGZHgP3W+GKQEEZ82HpbXi/qKfWfJLPEtbDrBi4h+zYao/5SwjifsvZTqxoBlyoKgHTe7IPcxtfUGfB0jIOmErEbPh8C5gmD1YaoUkDQgqkIR72fHalPsuRh96PsfY2qH7wzn76MSe8BfK9Q+AqLFyU545mmYsRJ4H73xZ2v3FclUgBPmBy7GjwmuHriRzomufTpKX/0baUCidBZJdw9A2JdgIqYasIH6psNQtuOA4A6DTRu6cFoBtrH/Kb/P7mUmG3+Slr30GSiKpUw0vwPcVkda2PTtiIgcpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731008396; c=relaxed/relaxed;
	bh=Fw03J0ODGlZKS9WAoUi02JF81HXJPrLToCShkHhStps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSD3+8Z2c9KJhmiZ1/Yhvap/9a0S0zJlzUAeCqpZBLWI1pF+RIhkPKRer7w61EN/DIhVunqJkPDynT2yUsGDemCLB6Jx64F5v1omlLPGRJCP+YE8AYNHeK1KDAiVULBRt2qflp5euA5Ojk4TKfCxMaxSNn3MUhEb1mOlwxIgSyHcj2HHTM394wqke0TRTSzYXtaXE2RcC82oL0NBeAn32Q+uabD0bvjf5YPoUaa088CqrypQram2/85Vnrtq4lx60ViwZuoR7fg65JhIfT0VE5bv0eKJn5zag7cn39bGThmeTJcVn4Fnr4DYTwN+F5tQPTqhP1de1V0WBuBIhD82aA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I0e0MHen; dkim-atps=neutral; spf=none (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I0e0MHen;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkspx1PXDz3bqD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 06:39:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731008393; x=1762544393;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pw1O70pYQYq/IaKhMtsLExGrQlLR65b3Kvtf5Ot7s4g=;
  b=I0e0MHen1hfcr3qGbn1655/Tcj7vji48/foLQCNNRpIEbn4wuAVBBIx2
   +v/WJX70/c2fJ+EssYEvdKmUd/k13RpcuZUEWglsW/OmrzUKbti40BfwN
   xkEIdpeNhGyyrdwVTxBOGJuHWG5OK/xd5HP6r2sxi0EU4KKE+ugpMpIW/
   WZ82qrfR1LBKlLF2cY2sbFoHmf/igr8heoGoxRggcSDlv7xjO525WF6WG
   Oxn31EpzqPBWrziHNJYRo7OGZdZpNiNqdgMbqh5aw/ci7sI0EZGpwjCUh
   Ikaql70swotYU/gTUDBkdX4aMYDBPUH+dhyjCQ6r+Li6I1d6ORzA9neNS
   A==;
X-CSE-ConnectionGUID: ygDR/7ZZQaWyV1rS7HnuEQ==
X-CSE-MsgGUID: J1g887MhShCIvYppoA4S3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="56271208"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="56271208"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:39:47 -0800
X-CSE-ConnectionGUID: 9O+5h6WgRIijZ1NiK7WRZg==
X-CSE-MsgGUID: DOtHCMUjTeWKWpkZ5syFhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="116090006"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:39:47 -0800
Received: from [10.212.68.83] (kliang2-mobl1.ccr.corp.intel.com [10.212.68.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 52BAA20B5703;
	Thu,  7 Nov 2024 11:39:42 -0800 (PST)
Message-ID: <56855fb8-b220-4585-bc71-a189679546ab@linux.intel.com>
Date: Thu, 7 Nov 2024 14:39:41 -0500
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] perf: Hoist perf_instruction_pointer() and
 perf_misc_flags()
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: Oliver Upton <oliver.upton@linux.dev>,
 Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Thomas Richter <tmricht@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20241107190336.2963882-1-coltonlewis@google.com>
 <20241107190336.2963882-3-coltonlewis@google.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20241107190336.2963882-3-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2024-11-07 2:03 p.m., Colton Lewis wrote:
> For clarity, rename the arch-specific definitions of these functions
> to perf_arch_* to denote they are arch-specifc. Define the
> generic-named functions in one place where they can call the
> arch-specific ones as needed.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> Acked-by: Thomas Richter <tmricht@linux.ibm.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> ---

Acked-by: Kan Liang <kan.liang@linux.intel.com>

Thanks,
Kan

>  arch/arm64/include/asm/perf_event.h          |  6 +++---
>  arch/arm64/kernel/perf_callchain.c           |  4 ++--
>  arch/powerpc/include/asm/perf_event_server.h |  6 +++---
>  arch/powerpc/perf/core-book3s.c              |  4 ++--
>  arch/s390/include/asm/perf_event.h           |  6 +++---
>  arch/s390/kernel/perf_event.c                |  4 ++--
>  arch/x86/events/core.c                       |  4 ++--
>  arch/x86/include/asm/perf_event.h            | 10 +++++-----
>  include/linux/perf_event.h                   |  9 ++++++---
>  kernel/events/core.c                         | 10 ++++++++++
>  10 files changed, 38 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
> index eb7071c9eb34..31a5584ed423 100644
> --- a/arch/arm64/include/asm/perf_event.h
> +++ b/arch/arm64/include/asm/perf_event.h
> @@ -11,9 +11,9 @@
>  
>  #ifdef CONFIG_PERF_EVENTS
>  struct pt_regs;
> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
> -#define perf_misc_flags(regs)	perf_misc_flags(regs)
> +extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
> +extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
> +#define perf_arch_misc_flags(regs)	perf_misc_flags(regs)
>  #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
>  #endif
>  
> diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
> index e8ed5673f481..01a9d08fc009 100644
> --- a/arch/arm64/kernel/perf_callchain.c
> +++ b/arch/arm64/kernel/perf_callchain.c
> @@ -39,7 +39,7 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>  	arch_stack_walk(callchain_trace, entry, current, regs);
>  }
>  
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  {
>  	if (perf_guest_state())
>  		return perf_guest_get_ip();
> @@ -47,7 +47,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
>  	return instruction_pointer(regs);
>  }
>  
> -unsigned long perf_misc_flags(struct pt_regs *regs)
> +unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
>  	unsigned int guest_state = perf_guest_state();
>  	int misc = 0;
> diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
> index 5995614e9062..af0f46e2373b 100644
> --- a/arch/powerpc/include/asm/perf_event_server.h
> +++ b/arch/powerpc/include/asm/perf_event_server.h
> @@ -102,8 +102,8 @@ struct power_pmu {
>  int __init register_power_pmu(struct power_pmu *pmu);
>  
>  struct pt_regs;
> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> +extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
> +extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
>  extern unsigned long int read_bhrb(int n);
>  
>  /*
> @@ -111,7 +111,7 @@ extern unsigned long int read_bhrb(int n);
>   * if we have hardware PMU support.
>   */
>  #ifdef CONFIG_PPC_PERF_CTRS
> -#define perf_misc_flags(regs)	perf_misc_flags(regs)
> +#define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
>  #endif
>  
>  /*
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 42867469752d..dc01aa604cc1 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2332,7 +2332,7 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
>   * Called from generic code to get the misc flags (i.e. processor mode)
>   * for an event_id.
>   */
> -unsigned long perf_misc_flags(struct pt_regs *regs)
> +unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
>  	u32 flags = perf_get_misc_flags(regs);
>  
> @@ -2346,7 +2346,7 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
>   * Called from generic code to get the instruction pointer
>   * for an event_id.
>   */
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  {
>  	unsigned long siar = mfspr(SPRN_SIAR);
>  
> diff --git a/arch/s390/include/asm/perf_event.h b/arch/s390/include/asm/perf_event.h
> index 29ee289108c5..e53894cedf08 100644
> --- a/arch/s390/include/asm/perf_event.h
> +++ b/arch/s390/include/asm/perf_event.h
> @@ -37,9 +37,9 @@ extern ssize_t cpumf_events_sysfs_show(struct device *dev,
>  
>  /* Perf callbacks */
>  struct pt_regs;
> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
> -#define perf_misc_flags(regs) perf_misc_flags(regs)
> +extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
> +extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
> +#define perf_arch_misc_flags(regs) perf_arch_misc_flags(regs)
>  #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
>  
>  /* Perf pt_regs extension for sample-data-entry indicators */
> diff --git a/arch/s390/kernel/perf_event.c b/arch/s390/kernel/perf_event.c
> index 5fff629b1a89..f9000ab49f4a 100644
> --- a/arch/s390/kernel/perf_event.c
> +++ b/arch/s390/kernel/perf_event.c
> @@ -57,7 +57,7 @@ static unsigned long instruction_pointer_guest(struct pt_regs *regs)
>  	return sie_block(regs)->gpsw.addr;
>  }
>  
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  {
>  	return is_in_guest(regs) ? instruction_pointer_guest(regs)
>  				 : instruction_pointer(regs);
> @@ -84,7 +84,7 @@ static unsigned long perf_misc_flags_sf(struct pt_regs *regs)
>  	return flags;
>  }
>  
> -unsigned long perf_misc_flags(struct pt_regs *regs)
> +unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
>  	/* Check if the cpum_sf PMU has created the pt_regs structure.
>  	 * In this case, perf misc flags can be easily extracted.  Otherwise,
> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> index 65ab6460aed4..d19e939f3998 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -3003,7 +3003,7 @@ static unsigned long code_segment_base(struct pt_regs *regs)
>  	return 0;
>  }
>  
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  {
>  	if (perf_guest_state())
>  		return perf_guest_get_ip();
> @@ -3011,7 +3011,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
>  	return regs->ip + code_segment_base(regs);
>  }
>  
> -unsigned long perf_misc_flags(struct pt_regs *regs)
> +unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
>  	unsigned int guest_state = perf_guest_state();
>  	int misc = 0;
> diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
> index 91b73571412f..feb87bf3d2e9 100644
> --- a/arch/x86/include/asm/perf_event.h
> +++ b/arch/x86/include/asm/perf_event.h
> @@ -536,15 +536,15 @@ struct x86_perf_regs {
>  	u64		*xmm_regs;
>  };
>  
> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
> -#define perf_misc_flags(regs)	perf_misc_flags(regs)
> +extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
> +extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
> +#define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
>  
>  #include <asm/stacktrace.h>
>  
>  /*
> - * We abuse bit 3 from flags to pass exact information, see perf_misc_flags
> - * and the comment with PERF_EFLAGS_EXACT.
> + * We abuse bit 3 from flags to pass exact information, see
> + * perf_arch_misc_flags() and the comment with PERF_EFLAGS_EXACT.
>   */
>  #define perf_arch_fetch_caller_regs(regs, __ip)		{	\
>  	(regs)->ip = (__ip);					\
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index fb908843f209..772ad352856b 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1655,10 +1655,13 @@ extern void perf_tp_event(u16 event_type, u64 count, void *record,
>  			  struct task_struct *task);
>  extern void perf_bp_event(struct perf_event *event, void *data);
>  
> -#ifndef perf_misc_flags
> -# define perf_misc_flags(regs) \
> +extern unsigned long perf_misc_flags(struct pt_regs *regs);
> +extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> +
> +#ifndef perf_arch_misc_flags
> +# define perf_arch_misc_flags(regs) \
>  		(user_mode(regs) ? PERF_RECORD_MISC_USER : PERF_RECORD_MISC_KERNEL)
> -# define perf_instruction_pointer(regs)	instruction_pointer(regs)
> +# define perf_arch_instruction_pointer(regs)	instruction_pointer(regs)
>  #endif
>  #ifndef perf_arch_bpf_user_pt_regs
>  # define perf_arch_bpf_user_pt_regs(regs) regs
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index df27d08a7232..2c44ffd6f4d8 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7022,6 +7022,16 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>  EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
>  #endif
>  
> +unsigned long perf_misc_flags(struct pt_regs *regs)
> +{
> +	return perf_arch_misc_flags(regs);
> +}
> +
> +unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +{
> +	return perf_arch_instruction_pointer(regs);
> +}
> +
>  static void
>  perf_output_sample_regs(struct perf_output_handle *handle,
>  			struct pt_regs *regs, u64 mask)


