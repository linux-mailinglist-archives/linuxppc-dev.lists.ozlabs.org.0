Return-Path: <linuxppc-dev+bounces-2999-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6231B9C0CBE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:21:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkpkt1qCXz3bpL;
	Fri,  8 Nov 2024 04:21:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731000070;
	cv=none; b=kVfAlu2AiSKDpPvNW+QtkeXLeme7r+70A6HsO2KRfXtZA9zZ/8SO1irnVhLP0fNQUxQWvt6XT9H1k2ZPemp1VnrBYHrGUDYoUjL+LdzzAjJOXGAOh94EWby/YdJOgmyImWwIDG0ZtptvVGE/EV79e/V+6bkSm0IujOJtxTVAatsDJmm7jLrzSrQUJlzVJbC/JkgeAtqAK45m/4weW0YUnclyrExvlvx5G166hgDWgo1ZUplvRJu8fMIUi/n9Z8YPIEm2y8VyvRAlTHifn++ciYNaJHp01nfOcoQTbQW6jJFmRV97k2IKsRnHOsxJ6PvAZ2ivAosgPlj4nj5kiefwng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731000070; c=relaxed/relaxed;
	bh=fLcLe1lppCElbSoTVeyvY8TiKkX0ea4jaUYFfrewuuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Obnlqzz0UKPKyk8oSSS2CslHvi1EmAc+RSuCkjW/9l4PcoPOiRDd+G3npFQd9lhXusCUwEEB9adWtHD+OLcPrBAXWn8THiSaWd9Xgty8p+U7xAdZkJfN5d4jnmIrgMP+8rBomnbZ0j3ArwH+zbzhy7ec9oAU/EDzuQAXLA1VgCk2vO9s9X+TaNMLxdTEyU0ULR/cv4vTttn0mrpXX5PUXQgChTEh/AdpuW79ReX32L5ATsqWdbMGjpp1Fbu4V46BtS70CA473defl60mGL4fIj2JOJafzhGk65YVZ53uRSSGH2qKk289O8dgQOBJVPVS7disinYNPthO8F6hTNGaog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkpkp4dkBz3bpJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:21:06 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98D0D1063;
	Thu,  7 Nov 2024 09:21:05 -0800 (PST)
Received: from [10.57.26.139] (unknown [10.57.26.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C7C13F6A8;
	Thu,  7 Nov 2024 09:20:30 -0800 (PST)
Message-ID: <a8a41066-e569-44c4-aa96-176d4788c7b6@arm.com>
Date: Thu, 7 Nov 2024 18:20:29 +0100
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
Subject: Re: [PATCH v7 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Yicong Yang <yangyicong@huawei.com>, Thomas Gleixner
 <tglx@linutronix.de>, catalin.marinas@arm.com, will@kernel.org,
 sudeep.holla@arm.com, peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, dietmar.eggemann@arm.com
Cc: yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, xuwei5@huawei.com,
 guohanjun@huawei.com
References: <20241030125415.18994-1-yangyicong@huawei.com>
 <20241030125415.18994-2-yangyicong@huawei.com> <87ttcty71m.ffs@tglx>
 <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/31/24 13:17, Yicong Yang wrote:
> On 2024/10/30 22:55, Thomas Gleixner wrote:
>> On Wed, Oct 30 2024 at 20:54, Yicong Yang wrote:
>>>   
>>> +#ifndef topology_is_primary_thread
>>> +#define topology_is_primary_thread topology_is_primary_thread
>>
>> Please do not glue defines and functions together w/o a newline in between.
>>
> 
> sure, will add a newline here.
> 
>>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>>> +{
>>> +	/*
>>> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
>>> +	 * Architectures do have a special primary thread (e.g. x86) need
>>> +	 * to override this function. Otherwise just make the first thread
>>> +	 * in the SMT as the primary thread.
>>> +	 */
>>> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));
>>
>> How is that supposed to work? Assume both siblings are offline, then the
>> sibling mask is empty and you can't boot the CPU anymore.
>>
> 
> For architectures' using arch_topology, topology_sibling_cpumask() will at least
> contain the tested CPU itself. This is initialized in
> drivers/base/arch_topology.c:reset_cpu_topology(). So it won't be empty here.
> 
> Besides we don't need to check topology_is_primary_thread() at boot time:
> -> cpu_up(cpu)
>       cpu_bootable()
>         if (cpu_smt_control == CPU_SMT_ENABLED &&
>             cpu_smt_thread_allowed(cpu)) // will always return true if !CONFIG_SMT_NUM_THREADS_DYNAMIC
>           return true; // we'll always return here and @cpu is always bootable
> 
> Also tested fine in practice.
> 
> Thanks.
> 
> 

FWIW, I also tested the case where:
- setting maxcpus=1 in the kernel cmdline to have CPUs that never booted
- setting smt to off:
   'echo off > /sys/devices/system/cpu/smt/control'
and effectively the primary CPUs can boot and secondary CPUs can't,
so it works as expected.

