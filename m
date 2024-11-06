Return-Path: <linuxppc-dev+bounces-2937-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E53369BF805
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 21:33:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkH3b4kRCz3bg1;
	Thu,  7 Nov 2024 07:33:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730925227;
	cv=none; b=DQEA2OavypyishO337iYwjf+8s9TDA0h7lnVZuvXYXMSm+MJMGkrllpWA+1klUrPtNXMXiHAls0Mi8FWJ7k579r5c/z0QId2ZJ+qz3oRvrUOdX6NQXtuGvGjR8yTBllphEyCosk5dfXXK/KjrjCNE4OPFqet5rRsEW0AjrFIPcQpyOVWJo3Scw0zcOV/ab5gOj7F0J8L/Ny9+8gqit11rY+qyPbRq60xgHIxMsfBeOYDYhCGePJB1fC6UnfSYeJmsgDQEWViz/+3SByOar1kf44YQ7SK5E4tQpFA4wnjvem3hsMrBqvM+xXTOBWoTJ7E5PdtmYD+befqHSAJ1gRJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730925227; c=relaxed/relaxed;
	bh=UO/fsunJcLHUv7ogKKQJZR3TGi/Dgpu/xOl2VgUzdS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3crkJrO8jRF2GMQUc1YTTo3zLpwPevEW3ZKi4iWF/DHjjt+YivCfLQTc31t2BST1xKONEmipnHLEQtvbNq7v4YaZRkjnZksNT2IuJ2W04AFXPBGD5fj9RYrikAjGOdIu9RQtG+J3C25Am1IAgZo9YW6mV5CPRXtiOGCB1+ivEpDFcsO+pEm7HP4nKLBG4QkInCzUOvXkNQoWJpWKgh2zzixbe7bobE/sX0ztB8HpNMQLYfWfHR38fNBBgZMX8ZsDzgi5Rmc5jai//xeBcSi2RzjAEvT3fjbnBNa+X3P6uxuHtQrt4Zn4ggzcNgUzVgoqLchYge79qIjd9HIQcYGpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nyFxnnSX; dkim-atps=neutral; spf=none (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nyFxnnSX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkH3W6w3cz3bd2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 07:33:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730925224; x=1762461224;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zoRLMKW55o98JRmgTawjT4yCHMdI37JhvZnILfOLqRQ=;
  b=nyFxnnSXa8QT/iHXLUU7R0Z36LnisVClGvQiFQmLv+Xp1ruKBOlhE4Rx
   M4qEhkCrsZq6bOrRJg4lr5rSZzBj1emExdnWiejWufOTmRPBEOUPAi0Hm
   u0QB5NcFDXuPqGfVzmkp7kzyYJuqZUUljIn52LflfzRDvh5Jn2ZHfDjZT
   f2aD1xIcksGtki3t8+qlZtzFpRajXZSczwZYxkN3zr/7uyZOSN5EYMdJC
   OqhQNMKjHNEb5SNXraRB7YBDGEbmhBxRqBvztgSVNGas9V71nTIDl+uX1
   ZiXz38APL0keNfn9yfZV21v8B0zuefHBV8gahwN+9Vs7DqBlBhQwE4lT6
   Q==;
X-CSE-ConnectionGUID: nhPetH2JT+iGnFxjUBYYrg==
X-CSE-MsgGUID: jxae4AxhR4ODDe4agcrtlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30705988"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30705988"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 12:33:37 -0800
X-CSE-ConnectionGUID: V8XizmLPQ5C6WPxTiJI6TA==
X-CSE-MsgGUID: oNVXimYpTpmteoMQVxNatg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="84355097"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 12:33:37 -0800
Received: from [10.212.82.230] (kliang2-mobl1.ccr.corp.intel.com [10.212.82.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 560D920B5703;
	Wed,  6 Nov 2024 12:33:32 -0800 (PST)
Message-ID: <597dbcf6-8169-4084-881c-8942ed363189@linux.intel.com>
Date: Wed, 6 Nov 2024 15:33:30 -0500
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
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org,
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
 <65675ed8-e569-47f8-b1eb-40c853751bfb@linux.intel.com>
 <ZyvLOjy8Vfvai5cG@linux.dev>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <ZyvLOjy8Vfvai5cG@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2024-11-06 3:02 p.m., Oliver Upton wrote:
> On Wed, Nov 06, 2024 at 11:03:10AM -0500, Liang, Kan wrote:
>>> +static unsigned long common_misc_flags(struct pt_regs *regs)
>>> +{
>>> +	if (regs->flags & PERF_EFLAGS_EXACT)
>>> +		return PERF_RECORD_MISC_EXACT_IP;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>>> +{
>>> +	unsigned long guest_state = perf_guest_state();
>>> +	unsigned long flags = common_misc_flags(regs);
>>> +
>>> +	if (guest_state & PERF_GUEST_USER)
>>> +		flags |= PERF_RECORD_MISC_GUEST_USER;
>>> +	else if (guest_state & PERF_GUEST_ACTIVE)
>>> +		flags |= PERF_RECORD_MISC_GUEST_KERNEL;
>>> +
>>
>> The logic of setting the GUEST_KERNEL flag is implicitly changed here.
>>
>> For the current code, the GUEST_KERNEL flag is set for !PERF_GUEST_USER,
>> which include both guest_in_kernel and guest_in_NMI.
> 
> Where is the "guest_in_NMI" state coming from? KVM only reports user v.
> kernel mode.

I may understand the kvm_arch_pmi_in_guest() wrong.
However, the kvm_guest_state() at least return 3 states.
0
PERF_GUEST_ACTIVE
PERF_GUEST_ACTIVE | PERF_GUEST_USER

The existing code indeed assumes two modes. If it's not user mode, it
must be kernel mode.
However, the proposed code behave differently, or at least implies there
are more modes.
If it's not user mode and sets PERF_GUEST_ACTIVE, it's kernel mode.

Thanks,
Kan



