Return-Path: <linuxppc-dev+bounces-2923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3F79BF2CE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 17:09:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk9BH1XQmz3bcs;
	Thu,  7 Nov 2024 03:09:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730909351;
	cv=none; b=OIG4O5GUcG7F2ON3COzgo7zga486lWrQ0gVQmX7rtbZU9szc5kuQAzhW1YDsQ3+CBYjXZ2j/5NLEUqDIbYDKE2huXVKzyyD6jQIoHTyPmk8uGv58EiH5AqzBiN5Uo9CPYDvWa3MVSunlVtRFtQKQF4G9Sf4R5mqsCNEfhabV0YAF80I9JeMIF0r3oS59wpZXZchx+GwgyfPYTPjaBNTUwkBDNcukgflO7DIcR2fF6si0QYfIxvQZDLbDFq26S74anO+Q6phLUyApZBilOMmruR2rWoLCDxqEN7z2s8aaPc5VNx9eEFLU7G8RmvMaA1+xnXds/lT6yXFxciVufhf0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730909351; c=relaxed/relaxed;
	bh=2rfuOZvnAuj0nJQPp26kpH9tNbtyuod4jy7uet0uJOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfQNppBnRn4iW9ejI/ZHpc5hHHuMdsL6AvtFe/2F3c0wrs42rMD/D67CpkXUc0LthOqki9ZWOWCTVmXz2stobdHwdgT+mpPZE6nyuYAEmOIdZR7lyCm4bwV4r2+xByZjV/KP21l/F9cWUUmPeNSlJAOJX7XKmLc2aTG5Pl2gWeFtViWVrKIs4qag9Vdj6gvJo+YQNfyUjsaKYtXRIMYGTwIFeCvDrNcK4bjnRnBFLnV8sjI/qljYTdAVG43hFEhAto4fTTtRRJKpOYN/uzwjFxqV2yq3SUyVnn4xP7ZzgAN++O0OHZjLUcKxwQ497tAFVM2nlZEU1zt6IvDZ4HEK6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NxvF+P92; dkim-atps=neutral; spf=none (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NxvF+P92;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 07 Nov 2024 03:09:09 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk9BF6FLRz3bcp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 03:09:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730909350; x=1762445350;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YqxQs5N7780pZPl+viPzrqgEiiSjrsm9V2x3PaeBgBM=;
  b=NxvF+P928c5b9+BTkYDAvufOt9KKXA2ahL4IS95tCEjspFSFW6E4wh3d
   r9JT4Fduth9+2r6RQvDET78mTymwmiINjxcwFuZ2Evy0p9yMsdY+EBUaL
   dio/vzUTTUZP6YUc07jZwP3H8NR3b+YJsCLZO1wd7QhfhjEa8Q3QQ8hlP
   ptAXpu71BsAambfdhxMeSYrqVI98JRKFn7IRdlIjxNpW9NzfCxhfX2Kwh
   Eirsd0oJMPTTc0cidq95VLbT8397mgJ3haO8ie2BwnF9ytBgjx/Yy3Oss
   uF5qwimssaeXczB7yMWom5CaRohSgGpH0WqfhjCF8d4T/HmCeshEq108C
   w==;
X-CSE-ConnectionGUID: IUlsw/EFRgOY1qjjHwYGAQ==
X-CSE-MsgGUID: PR2K2sPuRl+Ne9njU4fL/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30932626"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="30932626"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 08:08:02 -0800
X-CSE-ConnectionGUID: 09YIEWwaQoulcZ9i16jkuA==
X-CSE-MsgGUID: iezak7uMSDC1ynrtqPQ/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89211010"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 08:07:58 -0800
Received: from [10.212.82.230] (kliang2-mobl1.ccr.corp.intel.com [10.212.82.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 2CB5920B5703;
	Wed,  6 Nov 2024 08:07:54 -0800 (PST)
Message-ID: <007cfed1-111d-45aa-b873-24cca9d4af01@linux.intel.com>
Date: Wed, 6 Nov 2024 11:07:53 -0500
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
Subject: Re: [PATCH v6 5/5] perf: Correct perf sampling with guest VMs
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
 linux-s390@vger.kernel.org
References: <20241105195603.2317483-1-coltonlewis@google.com>
 <20241105195603.2317483-6-coltonlewis@google.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20241105195603.2317483-6-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2024-11-05 2:56 p.m., Colton Lewis wrote:
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
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
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
> index 24910c625e3d..aae0c5eabf09 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -3005,9 +3005,6 @@ static unsigned long code_segment_base(struct pt_regs *regs)
>  
>  unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  {
> -	if (perf_guest_state())
> -		return perf_guest_get_ip();
> -
>  	return regs->ip + code_segment_base(regs);
>  }
>  
> @@ -3034,17 +3031,12 @@ unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
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
> index 772ad352856b..e207acdd9e73 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1655,8 +1655,9 @@ extern void perf_tp_event(u16 event_type, u64 count, void *record,
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
> @@ -1667,6 +1668,22 @@ extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
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

Is there by any chance to add a PERF_GUEST_KERNEL flag in KVM?

The PERF_GUEST_ACTIVE flag check looks really confusing.

Thanks,
Kan
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
> index 2c44ffd6f4d8..c62164a2ff23 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7022,13 +7022,26 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
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
> @@ -7849,7 +7862,7 @@ void perf_prepare_sample(struct perf_sample_data *data,
>  	__perf_event_header__init_id(data, event, filtered_sample_type);
>  
>  	if (filtered_sample_type & PERF_SAMPLE_IP) {
> -		data->ip = perf_instruction_pointer(regs);
> +		data->ip = perf_instruction_pointer(event, regs);
>  		data->sample_flags |= PERF_SAMPLE_IP;
>  	}
>  
> @@ -8013,7 +8026,7 @@ void perf_prepare_header(struct perf_event_header *header,
>  {
>  	header->type = PERF_RECORD_SAMPLE;
>  	header->size = perf_sample_data_size(data, event);
> -	header->misc = perf_misc_flags(regs);
> +	header->misc = perf_misc_flags(event, regs);
>  
>  	/*
>  	 * If you're adding more sample types here, you likely need to do


