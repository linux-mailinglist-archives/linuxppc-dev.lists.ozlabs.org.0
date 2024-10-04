Return-Path: <linuxppc-dev+bounces-1762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC2D990743
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2024 17:16:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKsZz41dFz3bcW;
	Sat,  5 Oct 2024 01:16:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728055003;
	cv=none; b=PcLSxe6FJvZKktL5+QpOQoq5Is02SEcCFt27psmJBF8esg4gvK8trbxK5bj6uaacFj8EiNIqZg180icCTQvDX+q8EfhCK9Ws3bg8jQpADw20JOPJ8lvx+Kpszyb7O1cL9XdF5fDG1w1IF/rR0HE7hJX4SCYKoG9hoyzOqAu8UGgZEboLLFhXyXY4KjJCWy6q19WmNA1aGAOtafevjHANtxXI+NSFSLCvIQv8YiYkeekVK8ja4CzMx2qj6Zt6qFh63mIfyrQdIA+qK9SVdi60dh5F9i9CTmssImn1RLHBOvDXziXc58J0tkzlFOTj8pHI5w1ADKDLDyosU6XXmsjbcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728055003; c=relaxed/relaxed;
	bh=jEaDpcv0Yi5DM4HQJfhiSww8k+87lnkc5n//7szCLA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxoGcYvUU6RenLjW6otVntD26PRjBRJzMUBGNqryhF3RXwnnOhF54CNDvI+wNC/cu1EgqY21ywnyX60GH5sovZkQgBp4d9OgziGQR0N869cGd7Otfj4z6UjRyNEWE6Tyc+Tq88Sm5kn44TbIiANcUZztTgYjsmoZUd2zSJ8Aso13MtaEzDm2Ucdf2somSzEclNzERcN+/9ASO1b5y4kImqCzreDUfyv2J/BC/sJ2XXhdv8qifWJWGP+TEoE8W7XGTBDTRF5H5dSgy6uBzCToc3/UV96xzTRy0TA0eFYMJ7Ad+MrVVI/D/G7XK+H9yorrV16Vn2x4RrMDnsYiX5rdGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKsZy3y94z2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2024 01:16:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69B74339;
	Fri,  4 Oct 2024 08:16:40 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1C383F640;
	Fri,  4 Oct 2024 08:16:06 -0700 (PDT)
Date: Fri, 4 Oct 2024 16:16:04 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 2/5] perf: Hoist perf_instruction_pointer() and
 perf_misc_flags()
Message-ID: <ZwAGtORoV3C3FDgk@J2N7QTR9R3.cambridge.arm.com>
References: <20240920174740.781614-1-coltonlewis@google.com>
 <20240920174740.781614-3-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920174740.781614-3-coltonlewis@google.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Sep 20, 2024 at 05:47:37PM +0000, Colton Lewis wrote:
> For clarity, rename the arch-specific definitions of these functions
> to perf_arch_* to denote they are arch-specifc. Define the
> generic-named functions in one place where they can call the
> arch-specific ones as needed.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
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

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

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
> index 9917e2717b2b..f6c7b611a212 100644
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
> index be01823b1bb4..760ad067527c 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -2940,7 +2940,7 @@ static unsigned long code_segment_base(struct pt_regs *regs)
>  	return 0;
>  }
>  
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  {
>  	if (perf_guest_state())
>  		return perf_guest_get_ip();
> @@ -2948,7 +2948,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
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
> index 1a8942277dda..d061e327ad54 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1633,10 +1633,13 @@ extern void perf_tp_event(u16 event_type, u64 count, void *record,
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
> index 8a6c6bbcd658..eeabbf791a8c 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6921,6 +6921,16 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
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
> -- 
> 2.46.0.792.g87dc391469-goog
> 

