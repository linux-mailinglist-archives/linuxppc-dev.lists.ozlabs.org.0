Return-Path: <linuxppc-dev+bounces-2922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 425699BF27C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 17:04:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk94t1CnNz2xy8;
	Thu,  7 Nov 2024 03:04:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730909070;
	cv=none; b=cMmsJDXY9sZIxOON1N7EoDqNZ4OzGMGQNDckvra8XxT33PjfTOsl64iNnhaIpb1J3gzpkabHqwLB0FhfNtnVtWxgBVWVX3l8MIVjqQFZnc93QKS9s6I6wdFyXryKUCRTYFNfIucq2IsYRR03CCvLaybOdxJHiqoXzLCzT3x7+jGQGnF4YS5GFAZOXiJpyADEoBRbnnhM9n2D6MlOjcijpsaCeb6cNAOVO1d0AeV/IOpuXesb3mhbCaHb4G9CP3YgDi03o109I35YaEcnC2Z21Es47+cBTVYfD+5P72Qb8aa+0NuPGBYmxpOD5jTdRm3iSttBj7U83lieHqq6wuzFgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730909070; c=relaxed/relaxed;
	bh=JleaUPasr6t70wZaJk/wxLZq1vhjFjBAb+acJWYkRc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nl2sZXRG/3GYD8mchz67+BveXqRkwhDJfmcreh6aTMoAYMa9BInj6BauHsraEISMMPvmGpfP5XkUgDqRDGwIs9EUuq7P99QL58gl4U5NC3LJOpA/q/hw/RROEaqAvvqdNxPxA+UdEF31TUcWMzn45LxJuNT8I3Bn1JrNWuq61ETbuOZpa+Sb3HpfXYTYzMf9YO8SD4iHw6/fH9+Tt6YoRktFM0a3RZ59vhlmRi6SFj8CGZRtJp+WVpYofXz5SmzIW8rGkxnRaGPFhe01lbvqCZY23EbEFFzuvL+gR1SzrPWlzZ1Ajz93Mh+EB3+ZrNqPT29MkTJz3O3nr0klPC2u4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IhtnI9rE; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IhtnI9rE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 07 Nov 2024 03:04:26 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk94p3yNsz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 03:04:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730909067; x=1762445067;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eeEXuIJ2vlczIF22PZRVZhnTIMIbHqdB4rwbCI1c/Sg=;
  b=IhtnI9rENVYXIHCrVZa/aMwMRv2UpM65Kv7uNjzeluxFCPcDsu6TvigG
   FreZ7m3yWtkJ6Pvuhpzs3zk0Iqg4egUCYu6z1xVnCjvArkBSMHybTAQtm
   RfOTmIokc8UTi5llIXeQHk+DuYiQ2b2I1YTRB8sxWWtoqaAfCjcKB4OhQ
   4ARM4YCgAKns8sEiNWc2YbhmCz6X6Ce/SvvaXCskXfm61nf7aSQogyXcm
   QG6I4Rd1/yw+ZNxirt2TUhzNMyKgS8qM4LA+CwcMBonw92knhW1NSzqwV
   7J4hAFPFBq62zEtEPm10IB7LYumR5gtR5yEt8lqquncdIkYCBDEhT8eFw
   Q==;
X-CSE-ConnectionGUID: iHXNLZ7bTNSXE3j6EdCsMQ==
X-CSE-MsgGUID: 1yQyAUreRm6SEOmme32qJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48176914"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48176914"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 08:03:17 -0800
X-CSE-ConnectionGUID: a5M3gJ+/QYaSWgS/qH6ALg==
X-CSE-MsgGUID: phJVPBFJQuabQWlVho3xvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="84715253"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 08:03:17 -0800
Received: from [10.212.82.230] (kliang2-mobl1.ccr.corp.intel.com [10.212.82.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 2C51820B5703;
	Wed,  6 Nov 2024 08:03:12 -0800 (PST)
Message-ID: <65675ed8-e569-47f8-b1eb-40c853751bfb@linux.intel.com>
Date: Wed, 6 Nov 2024 11:03:10 -0500
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
Subject: Re: [PATCH v6 4/5] x86: perf: Refactor misc flag assignments
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
 <20241105195603.2317483-5-coltonlewis@google.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20241105195603.2317483-5-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2024-11-05 2:56 p.m., Colton Lewis wrote:
> Break the assignment logic for misc flags into their own respective
> functions to reduce the complexity of the nested logic.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  arch/x86/events/core.c            | 31 +++++++++++++++++++++++--------
>  arch/x86/include/asm/perf_event.h |  2 ++
>  2 files changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> index d19e939f3998..24910c625e3d 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -3011,16 +3011,34 @@ unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  	return regs->ip + code_segment_base(regs);
>  }
>  
> +static unsigned long common_misc_flags(struct pt_regs *regs)
> +{
> +	if (regs->flags & PERF_EFLAGS_EXACT)
> +		return PERF_RECORD_MISC_EXACT_IP;
> +
> +	return 0;
> +}
> +
> +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> +{
> +	unsigned long guest_state = perf_guest_state();
> +	unsigned long flags = common_misc_flags(regs);
> +
> +	if (guest_state & PERF_GUEST_USER)
> +		flags |= PERF_RECORD_MISC_GUEST_USER;
> +	else if (guest_state & PERF_GUEST_ACTIVE)
> +		flags |= PERF_RECORD_MISC_GUEST_KERNEL;
> +

The logic of setting the GUEST_KERNEL flag is implicitly changed here.

For the current code, the GUEST_KERNEL flag is set for !PERF_GUEST_USER,
which include both guest_in_kernel and guest_in_NMI.

With the above change, the GUEST_KERNEL flag should be only set for the
guest_in_kernel case.
IIUC, this is the series's target, right?

If so, could you please move the explanation into this patch?
For x86, the behavior has already been changed since this patch.

Thanks,
Kan

> +	return flags;
> +}
> +
>  unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
>  	unsigned int guest_state = perf_guest_state();
> -	int misc = 0;
> +	unsigned long misc = common_misc_flags(regs);
>  
>  	if (guest_state) {
> -		if (guest_state & PERF_GUEST_USER)
> -			misc |= PERF_RECORD_MISC_GUEST_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
> +		misc |= perf_arch_guest_misc_flags(regs);
>  	} else {
>  		if (user_mode(regs))
>  			misc |= PERF_RECORD_MISC_USER;
> @@ -3028,9 +3046,6 @@ unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  			misc |= PERF_RECORD_MISC_KERNEL;
>  	}
>  
> -	if (regs->flags & PERF_EFLAGS_EXACT)
> -		misc |= PERF_RECORD_MISC_EXACT_IP;
> -
>  	return misc;
>  }
>  
> diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
> index feb87bf3d2e9..d95f902acc52 100644
> --- a/arch/x86/include/asm/perf_event.h
> +++ b/arch/x86/include/asm/perf_event.h
> @@ -538,7 +538,9 @@ struct x86_perf_regs {
>  
>  extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
>  extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
> +extern unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs);
>  #define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
> +#define perf_arch_guest_misc_flags(regs)	perf_arch_guest_misc_flags(regs)
>  
>  #include <asm/stacktrace.h>
>  


