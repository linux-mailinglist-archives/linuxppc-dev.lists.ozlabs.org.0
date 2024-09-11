Return-Path: <linuxppc-dev+bounces-1257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 528DF975737
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 17:34:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3l404cWvz2xWt;
	Thu, 12 Sep 2024 01:34:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726068864;
	cv=none; b=ZPRSc+IHb8lo3VzFsKuB582MghAAeKUnuOU6M8b5kWxvK+/3zUEuQ1p5X18kBwZn8AL1e4SqDLvVx78UmTtV/QryV5gaI7RtnpUM/a0Ci8Zoim1MkdEQBkuZxdUZxuRalg8juPAFnvJD8c8yRP9SBRlYnI9uBXpwqBjzai5OHdqx167gw5YhPpVlZUk5zolgJTDg1AAv3Zg3p7UpFXOF9EzSCuo0TNOL54DUQyewFXzyh3t6ZvJTRsOycgaFmtOQPwC9jpOwPsmDWTOUh6aOYjDx7kAu6Ls4u83tlBb2Qd/cXPIH0ro9qjUuW48BZwPLI9frRoI2I2hjLIqVEWbFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726068864; c=relaxed/relaxed;
	bh=6JN/I4bL6s6dgRFkY0IpiNaKCd9PQLmGhSRS4MrzIzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hplmwQAiLQm3GCBVkZFbwhpoMvphHC/qExdltt7HQhhYI/se86xURf/PI2tConMN+H/bAp/4JR5Scc2IwQChr/TQzvCNXaih4hTcYzBrp4EJYbFWVQVgWKeBSRvbARKfApw362FQmaOWhVyYF6J+BEO+FyVhgewx/EwxRXYaTuQ3kuPARUZzc+SWSLKd5x3Z1utu2+zseHMgTI1kHAvjj5GbsdkJe3KPSSI2cPv2eEuIXJNTw5W7vu7p5I65dOELesIRMhUz8Yvxcg5f0YOJxjchGm/Rv08CRFH+IC3ldFXsKf+uih+WBDyi6n0I858rIC6srBNymX2FW0IpEfqPMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WWmDja4A; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WWmDja4A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3l3y6XGwz2xWb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 01:34:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726068863; x=1757604863;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=U5gkwqWSbp1sFQyghj837wzL9/RMU5SpmsvBvs4bWic=;
  b=WWmDja4AC/zH3onyUwrGkggleEZyMgQdk0XuASBTSm5p293an0UO/CE+
   rvdnVLL53Y9l84Sia22j6YkWlAZ2okINqul0IKRgoqfjmhtDhSVGC+f81
   hfI1rApcYkBZdTZTpuJBGTaD1YCI3/QQj4d7Zf7/2A2uO62aKqQDDRltq
   tYedegW8EetzkqEjXrOTNDEpQF1BPxt6IMWaM4L7r2b81x17mudVAoEfL
   91YaKoxmYm1OFY4nmQ3x854GgJKvT/2aTtO+UzAPCd6Qk4a4qzx0hAmS0
   CCrB77Ri7MkykFUtBQEyLLV4ro8yIpYjd9GJFhdHoLYek/Z44a0zQ6C8V
   Q==;
X-CSE-ConnectionGUID: +4CKBJkATyuojJNzRhvKWg==
X-CSE-MsgGUID: U4aC1ZktTO+/rQsoVmVVWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="50292824"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="50292824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:34:15 -0700
X-CSE-ConnectionGUID: xtMlID7QSvGxgDWBJblWeA==
X-CSE-MsgGUID: yGu1fCIvQ3i5mupTuAQdXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67023420"
Received: from dgramcko-desk.amr.corp.intel.com (HELO [10.124.223.221]) ([10.124.223.221])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:34:14 -0700
Message-ID: <6c8ad091-a56b-41ba-b403-2e3c2e578100@intel.com>
Date: Wed, 11 Sep 2024 08:33:54 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
To: Kevin Brodsky <kevin.brodsky@arm.com>, Joey Gouly <joey.gouly@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
 aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
 broonie@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, maz@kernel.org,
 mingo@redhat.com, mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com,
 npiggin@gmail.com, oliver.upton@linux.dev, shuah@kernel.org,
 skhan@linuxfoundation.org, szabolcs.nagy@arm.com, tglx@linutronix.de,
 will@kernel.org, x86@kernel.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
 <425b8f8c-b6b5-422a-b5f4-41dd2d1ae3bb@arm.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <425b8f8c-b6b5-422a-b5f4-41dd2d1ae3bb@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/24 08:01, Kevin Brodsky wrote:
> On 22/08/2024 17:10, Joey Gouly wrote:
>> @@ -371,6 +382,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>>  		if (system_supports_tpidr2())
>>  			p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
>>  
>> +		if (system_supports_poe())
>> +			p->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> Here we are only reloading POR_EL0's value if the target is a user
> thread. However, as this series stands, POR_EL0 is also relevant to
> kthreads, because any uaccess or GUP done from a kthread will also be
> checked against POR_EL0. This is especially important in cases like the
> io_uring kthread, which accesses the memory of the user process that
> spawned it. To prevent such a kthread from inheriting a stale value of
> POR_EL0, it seems that we should reload POR_EL0's value in all cases
> (user and kernel thread).

The problem with this is trying to figure out which POR_EL0 to use.  The
kthread could have been spawned ages ago and might not have a POR_EL0
which is very different from the current value of any of the threads in
the process right now.

There's also no great way for a kthread to reach out and grab an updated
value.  It's all completely inherently racy.

> Other approaches could also be considered (e.g. resetting POR_EL0 to
> unrestricted when creating a kthread), see my reply on v4 [1].

I kinda think this is the only way to go.  It's the only sensible,
predictable way.  I _think_ it's what x86 will end up doing with PKRU,
but there's been enough churn there that I'd need to go double check
what happens in practice.

Either way, it would be nice to get an io_uring test in here that
actually spawns kthreads:

	tools/testing/selftests/mm/protection_keys.c

