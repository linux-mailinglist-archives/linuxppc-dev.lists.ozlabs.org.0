Return-Path: <linuxppc-dev+bounces-2938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6232C9BF813
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 21:38:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkH980Dbrz3bhC;
	Thu,  7 Nov 2024 07:38:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730925515;
	cv=none; b=Lnc+Hl+6FK70ektZDxliL98abgaam2M6VPdn1Rp+xrcyqZGc99NVf+Voco67GGv8VcrcNiJMNruEmV6O0kgnWDfR4mr8JSuL0GrI+N86UbisQUVWTaT7iaIq5UiNbveJ8dWjIBviRYrFtDqjgz6d45oQ5SSvD6/m2EVz09HRPq6IanxLqntftg0oYpuQdUI/+E6ieBkEPUuaNmwY0k3moFzTwiarRAbNpZxwWCNqj1QZ0Q0MEneOWhSolCRA4AGU8gkOCee1bzErLYzuri5rWr+Em91/lsxRSVczd8UsFqcP9AzQsy6db01d6n/1IKPQH2MBVsRuL/ZBaQ6YoGWz+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730925515; c=relaxed/relaxed;
	bh=lPXU/jAhw5ILwR4cL55fdDUpTzROl+P71oX17biKcy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=miEbeuFa7ArGJKyY+gvh+Eu0Of5UiNpfEqmA3Mlxd8ixuxGweNClfePxm8lc1NxB38PnJsUTFfYh+RBR+odMczxAIhNBggSJchCvdJiWjxF31LcWu0koevdVGMLEJpbr7pM5gH7/rt/aY1WishCmc+8bRmdoS3/8jHWcSjAsXOcmPi4JQiAXLzy6CfGT4AhsxINcWCRDZiVyURCQg9Nen0Ur6avdLtmgqlPPBsnope2A8fmgCRjGuSjVNbzaXlXUpN4TtF2v7cR7GEhIvy284y3ZJsI9SeuWVV5haA7fyv4RX4YSkhM/Of5HUIOGGcMAUNiGAjDFazXjGYST85F9Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hz2HZAtb; dkim-atps=neutral; spf=none (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hz2HZAtb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkH965cFLz3bh7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 07:38:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730925515; x=1762461515;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=t1T0JqltTt1br9rO+URcAmslVziWyZeSdcV2iKnx4V4=;
  b=Hz2HZAtbkAi0xKZ4SNg/r1CiJ2nGjAVavpcqOqRl7X04176UBaaog+0l
   C4CNsM0it+tFapM/PxDMPI4X+g3q18k88w3Qh9071lOO/NqqlNphxHvJ/
   DSpIiY8mhpyf0zf/2/4zeAWAID+xGhMxkXFAWIoE8o+UMAUp+6kE+hSUt
   CFSdu7oMXFhsNfaJcDhWmId7gdsTaBaLuW+V6altdm5ifmBBY2dsIwEIt
   Qvh59+i6lDw4vEa0C+BChLJRD9rhU0bnAT7HGMD5ICjkoeuIcN8jwdcVO
   3MIm4N95Sm21E1DdibDVP/+I7wkNYcX5s/v4tjWBGxUoF95E7qkhGPphi
   g==;
X-CSE-ConnectionGUID: 91Hz8KTWQau98Vc62K67Nw==
X-CSE-MsgGUID: OHG6P9qtT3aGVZY1dW6qfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41340850"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="41340850"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 12:38:31 -0800
X-CSE-ConnectionGUID: d6sAQXYbTuCw0s8JjLqdMw==
X-CSE-MsgGUID: 0q6Tkfi4S2Wgas+639rTLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="108044520"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 12:38:30 -0800
Received: from [10.212.82.230] (kliang2-mobl1.ccr.corp.intel.com [10.212.82.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 2880520B5703;
	Wed,  6 Nov 2024 12:38:26 -0800 (PST)
Message-ID: <89b46b99-e9fc-4ce4-84b2-b24f565db8d5@linux.intel.com>
Date: Wed, 6 Nov 2024 15:38:25 -0500
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
 <20241105195603.2317483-6-coltonlewis@google.com>
 <007cfed1-111d-45aa-b873-24cca9d4af01@linux.intel.com>
 <ZyvJIx-UHXawnUYs@linux.dev>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <ZyvJIx-UHXawnUYs@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2024-11-06 2:53 p.m., Oliver Upton wrote:
> On Wed, Nov 06, 2024 at 11:07:53AM -0500, Liang, Kan wrote:
>>> +#ifndef perf_arch_guest_misc_flags
>>> +static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>>> +{
>>> +	unsigned long guest_state = perf_guest_state();
>>> +
>>> +	if (guest_state & PERF_GUEST_USER)
>>> +		return PERF_RECORD_MISC_GUEST_USER;
>>> +
>>> +	if (guest_state & PERF_GUEST_ACTIVE)
>>> +		return PERF_RECORD_MISC_GUEST_KERNEL;
>>
>> Is there by any chance to add a PERF_GUEST_KERNEL flag in KVM?
> 
> Why do we need another flag? As it stands today, the vCPU is either in
> user mode or kernel mode.
> 
>> The PERF_GUEST_ACTIVE flag check looks really confusing.
> 
> Perhaps instead:
> 
> static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> {
> 	unsigned long guest_state = perf_guest_state();
> 
> 	if (!(guest_state & PERF_GUEST_ACTIVE))
> 		return 0;
> 
> 	return (guest_state & PERF_GUEST_USER) ? PERF_RECORD_MISC_GUEST_USER :
> 						 PERF_RECORD_MISC_GUEST_KERNEL;
> }

Yes, this one is much clear.

Can a similar change be done for the x86 perf_arch_guest_misc_flags() in
the previous patch?

Thanks,
Kan


