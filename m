Return-Path: <linuxppc-dev+bounces-1763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA06699078A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2024 17:32:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKswh3SRrz3bcj;
	Sat,  5 Oct 2024 01:32:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728055924;
	cv=none; b=DKhZSfg6vSmyXJpMQHwvki/6EaS91TSU+3VkKYkPvF7qDLBNd3O+LO8yfugiQ4oYUdJlukdMFIsAn9RlWcKhzsUS4q9VW3Qds/PG2s6NqzHpu4VXJalUDCO/x4W1Y3LUO9uMHhHCHixIxRQeZ56m8WR2QLEAOpe41P+vgEZljRMwV8r+4QVSDXsk0INySMFb3uaBjlHUaArPhBfoND9vXLA1ew3dqOY4ud3kbHlPR1CnBs1gXug6HtBPKV+gi7UHj37CQNjiR0y7CrARjtSctdaolMe+gHHenGI1MHU04OSjji3u1jwNps0mjvB0V5gxdyCKYqeeyskF87ox+H2SeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728055924; c=relaxed/relaxed;
	bh=7VFtDtbJQMSdAimV4mrzPzM12OSRkmK3dBudwKeEPXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXhhHiucxKg90RknpNfOyFad2poK0EkeqDs+nydchru8X6hj5ZXxFTMksq7TSqJDMtmW8ebv7AQAHF/edgIz4KlaKbr3Oi9mL6TOUH2dqMAyKdsGCfl+porF4wcTQLvMaArct3BvYb9MQ9g/sJ0djHWnXrJ0lSc7P+dagNaEsTexIy9IdrEHvwsbKioXhpJPj7ZO4nfpEykK6/mqYPescBhvcXZ9+scr7/aqKVY1uJtLCXUJETSCg30PdStVqx3o50jW8P4KdpJnKp2FgngxSOw9RxAyG6yniXT2jC4fHI9gtqHZQmaXAZamwHsBC9eT0DEt+YG0dC5+3kbVCg3qiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKswg38Zxz3bbH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2024 01:32:02 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D07F150C;
	Fri,  4 Oct 2024 08:32:01 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7051D3F7C5;
	Fri,  4 Oct 2024 08:31:27 -0700 (PDT)
Date: Fri, 4 Oct 2024 16:31:25 +0100
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
Subject: Re: [PATCH v5 5/5] perf: Correct perf sampling with guest VMs
Message-ID: <ZwAKTUrwQH9Xk-ET@J2N7QTR9R3.cambridge.arm.com>
References: <20240920174740.781614-1-coltonlewis@google.com>
 <20240920174740.781614-6-coltonlewis@google.com>
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
In-Reply-To: <20240920174740.781614-6-coltonlewis@google.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Sep 20, 2024 at 05:47:40PM +0000, Colton Lewis wrote:
> Previously any PMU overflow interrupt that fired while a VCPU was
> loaded was recorded as a guest event whether it truly was or not. This
> resulted in nonsense perf recordings that did not honor
> perf_event_attr.exclude_guest and recorded guest IPs where it should
> have recorded host IPs.
> 
> Rework the sampling logic to only record guest samples for events with
> exclude_guest = 0. This way any host-only events with exclude_guest
> set will never see unexpected guest samples. The behaviour of events
> with exclude_guest = 0 is unchanged.
> 
> Note that events configured to sample both host and guest may still
> misattribute a PMI that arrived in the host as a guest event depending
> on KVM arch and vendor behavior.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

This looks good to me, though I wonder if we should handle all of the
exclude_* flags in one go and pick the right user/kernel/guest regs to
sample from...

As this stands, it's definitely an improvement on what we have, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/perf_event.h |  4 ----
>  arch/arm64/kernel/perf_callchain.c  | 28 ----------------------------
>  arch/x86/events/core.c              | 16 ++++------------
>  include/linux/perf_event.h          | 21 +++++++++++++++++++--
>  kernel/events/core.c                | 21 +++++++++++++++++----
>  5 files changed, 40 insertions(+), 50 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
> index 31a5584ed423..ee45b4e77347 100644
> --- a/arch/arm64/include/asm/perf_event.h
> +++ b/arch/arm64/include/asm/perf_event.h
> @@ -10,10 +10,6 @@
>  #include <asm/ptrace.h>
>  
>  #ifdef CONFIG_PERF_EVENTS
> -struct pt_regs;
> -extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
> -extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
> -#define perf_arch_misc_flags(regs)	perf_misc_flags(regs)
>  #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
>  #endif
>  
> diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
> index 01a9d08fc009..9b7f26b128b5 100644
> --- a/arch/arm64/kernel/perf_callchain.c
> +++ b/arch/arm64/kernel/perf_callchain.c
> @@ -38,31 +38,3 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>  
>  	arch_stack_walk(callchain_trace, entry, current, regs);
>  }
> -
> -unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
> -{
> -	if (perf_guest_state())
> -		return perf_guest_get_ip();
> -
> -	return instruction_pointer(regs);
> -}
> -
> -unsigned long perf_arch_misc_flags(struct pt_regs *regs)
> -{
> -	unsigned int guest_state = perf_guest_state();
> -	int misc = 0;
> -
> -	if (guest_state) {
> -		if (guest_state & PERF_GUEST_USER)
> -			misc |= PERF_RECORD_MISC_GUEST_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
> -	} else {
> -		if (user_mode(regs))
> -			misc |= PERF_RECORD_MISC_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_KERNEL;
> -	}
> -
> -	return misc;
> -}
> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> index d51e5d24802b..3c5f512d2bcf 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -2942,9 +2942,6 @@ static unsigned long code_segment_base(struct pt_regs *regs)
>  
>  unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  {
> -	if (perf_guest_state())
> -		return perf_guest_get_ip();
> -
>  	return regs->ip + code_segment_base(regs);
>  }
>  
> @@ -2971,17 +2968,12 @@ unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>  
>  unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
> -	unsigned int guest_state = perf_guest_state();
>  	unsigned long misc = common_misc_flags(regs);
>  
> -	if (guest_state) {
> -		misc |= perf_arch_guest_misc_flags(regs);
> -	} else {
> -		if (user_mode(regs))
> -			misc |= PERF_RECORD_MISC_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_KERNEL;
> -	}
> +	if (user_mode(regs))
> +		misc |= PERF_RECORD_MISC_USER;
> +	else
> +		misc |= PERF_RECORD_MISC_KERNEL;
>  
>  	return misc;
>  }
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index d061e327ad54..968f3edd95e4 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1633,8 +1633,9 @@ extern void perf_tp_event(u16 event_type, u64 count, void *record,
>  			  struct task_struct *task);
>  extern void perf_bp_event(struct perf_event *event, void *data);
>  
> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> +extern unsigned long perf_misc_flags(struct perf_event *event, struct pt_regs *regs);
> +extern unsigned long perf_instruction_pointer(struct perf_event *event,
> +					      struct pt_regs *regs);
>  
>  #ifndef perf_arch_misc_flags
>  # define perf_arch_misc_flags(regs) \
> @@ -1645,6 +1646,22 @@ extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
>  # define perf_arch_bpf_user_pt_regs(regs) regs
>  #endif
>  
> +#ifndef perf_arch_guest_misc_flags
> +static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> +{
> +	unsigned long guest_state = perf_guest_state();
> +
> +	if (guest_state & PERF_GUEST_USER)
> +		return PERF_RECORD_MISC_GUEST_USER;
> +
> +	if (guest_state & PERF_GUEST_ACTIVE)
> +		return PERF_RECORD_MISC_GUEST_KERNEL;
> +
> +	return 0;
> +}
> +# define perf_arch_guest_misc_flags(regs)	perf_arch_guest_misc_flags(regs)
> +#endif
> +
>  static inline bool has_branch_stack(struct perf_event *event)
>  {
>  	return event->attr.sample_type & PERF_SAMPLE_BRANCH_STACK;
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index eeabbf791a8c..c5e57c024d9a 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6921,13 +6921,26 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>  EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
>  #endif
>  
> -unsigned long perf_misc_flags(struct pt_regs *regs)
> +static bool should_sample_guest(struct perf_event *event)
>  {
> +	return !event->attr.exclude_guest && perf_guest_state();
> +}
> +
> +unsigned long perf_misc_flags(struct perf_event *event,
> +			      struct pt_regs *regs)
> +{
> +	if (should_sample_guest(event))
> +		return perf_arch_guest_misc_flags(regs);
> +
>  	return perf_arch_misc_flags(regs);
>  }
>  
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +unsigned long perf_instruction_pointer(struct perf_event *event,
> +				       struct pt_regs *regs)
>  {
> +	if (should_sample_guest(event))
> +		return perf_guest_get_ip();
> +
>  	return perf_arch_instruction_pointer(regs);
>  }
>  
> @@ -7743,7 +7756,7 @@ void perf_prepare_sample(struct perf_sample_data *data,
>  	__perf_event_header__init_id(data, event, filtered_sample_type);
>  
>  	if (filtered_sample_type & PERF_SAMPLE_IP) {
> -		data->ip = perf_instruction_pointer(regs);
> +		data->ip = perf_instruction_pointer(event, regs);
>  		data->sample_flags |= PERF_SAMPLE_IP;
>  	}
>  
> @@ -7907,7 +7920,7 @@ void perf_prepare_header(struct perf_event_header *header,
>  {
>  	header->type = PERF_RECORD_SAMPLE;
>  	header->size = perf_sample_data_size(data, event);
> -	header->misc = perf_misc_flags(regs);
> +	header->misc = perf_misc_flags(event, regs);
>  
>  	/*
>  	 * If you're adding more sample types here, you likely need to do
> -- 
> 2.46.0.792.g87dc391469-goog
> 

