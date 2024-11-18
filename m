Return-Path: <linuxppc-dev+bounces-3415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4390D9D13F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 16:05:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsWCY01k1z2yL0;
	Tue, 19 Nov 2024 02:05:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731942344;
	cv=none; b=g/dsOeaSz1SYQBqo7zVV+g0GBcDN+yGrNjf8tgJUuCqn6Rwb0wha8zNg92cW//SI01l8J1krJjPfUwXBxHYEosRRxQbBkVDFuOhSPVm9Ef8ECqthV5CM+lQQ/4JrvRjyoGEpXg18+fyZNRb4nqbAFrMAvW7EMekdE8CErsB0XYBTmhNNpgvGiAQCc534aqsCIOZK/NV+AmatlPXoTgTP+5PaotDyaHucNxzov7phnTCvsnHfl6opnoo5L1/7cjhIa2Biq7UT7gCyyRGF7F950rUwnlhj4J/BrcT3NfszJ9OtVedLQkNBR0u+z5uMnZL4An4cTMrP5O4O7UPqO51XAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731942344; c=relaxed/relaxed;
	bh=lhJz2n820RfIKKRXmPJ+olZDv6ZE74OuixOiG3FK7gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKNjISzBgzlTAMIfGOFoIn0/Wgnsc/dGfF2btvbToLGNNVWZJvzubtlQRvYSpwwUrQ92Oxd7YMn37fxqYuNI2v4MwiC2lbdALoLf8eprcYJl1y9U/WaGBwhjv3EFKr5Cuip8EHaqRglFjpvK48dmfe+La4TtgtiDug0FbDMZ3cnVp5hFN7AnNDo9mVfPyXkAq9BjuUsFYO+hvzL3K7A3yS9KDhm7oOAFXn3dAP4LUmU2Gz9KXm0EGN4WadrhTggvmOTo39miB8OLwupN4zGHaATLGBntwtINPBDXdFVhP0UyjrFlwlmBt0aNpRU0Hkfb77fPGbL0m3AHg2+GH2+09Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsWCT6pXLz2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 02:05:40 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 685B611FB;
	Mon, 18 Nov 2024 07:05:36 -0800 (PST)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B3183F5A1;
	Mon, 18 Nov 2024 07:05:01 -0800 (PST)
Message-ID: <ab5d70ad-d4a4-4116-82c6-908b9e641ee6@arm.com>
Date: Mon, 18 Nov 2024 16:04:53 +0100
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
Subject: Re: [PATCH v9 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Yicong Yang <yangyicong@huawei.com>,
 Pierre Gondois <pierre.gondois@arm.com>
Cc: yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 bp@alien8.de, mingo@redhat.com, linux-arm-kernel@lists.infradead.org,
 mpe@ellerman.id.au, peterz@infradead.org, tglx@linutronix.de,
 sudeep.holla@arm.com, catalin.marinas@arm.com, will@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, xuwei5@huawei.com,
 guohanjun@huawei.com, dave.hansen@linux.intel.com
References: <20241114141127.23232-1-yangyicong@huawei.com>
 <20241114141127.23232-2-yangyicong@huawei.com>
 <427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com>
 <3876e185-2fcc-25dd-e70d-93fdcbf8fc37@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <3876e185-2fcc-25dd-e70d-93fdcbf8fc37@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 18/11/2024 11:50, Yicong Yang wrote:
> On 2024/11/15 17:42, Pierre Gondois wrote:
>> Hello Yicong,
>>
>>
>> On 11/14/24 15:11, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>

[...]

>>>   diff --git a/include/linux/topology.h b/include/linux/topology.h
>>> index 52f5850730b3..b8e860276518 100644
>>> --- a/include/linux/topology.h
>>> +++ b/include/linux/topology.h
>>> @@ -240,6 +240,26 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>>>   }
>>>   #endif
>>>   +#ifndef topology_is_primary_thread
>>> +
>>> +#define topology_is_primary_thread topology_is_primary_thread
>>> +
>>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>>> +{
>>> +    /*
>>> +     * On SMT hotplug the primary thread of the SMT won't be disabled.
>>> +     * Architectures do have a special primary thread (e.g. x86) need
>>> +     * to override this function. Otherwise just make the first thread
>>> +     * in the SMT as the primary thread.
>>> +     *
>>> +     * The sibling cpumask of an offline CPU contains always the CPU
>>> +     * itself.
>>
>> As Thomas suggested, would it be possible to check it for other
>> architectures ?
>> For instance for loongarch at arch/loongarch/kernel/smp.c,
>> clear_cpu_sibling_map() seems to completely clear &cpu_sibling_map[cpu]
>> when a CPU is put offline. This would make topology_sibling_cpumask(cpu)
>> to be empty and cpu_bootable() return false if the CPU never booted before.
>>
> 
> cpu_bootable() only affects architectures select HOTPLUG_SMT, otherwise it'll always
> return true. Since x86 and powerpc have their own illustration of primary thread and
> have an override version of this funciton, arm64 is the only user now by this patchset.
> We have this guarantee for arm64 and also for other architectures using arch_topology.c
> (see clear_cpu_topology()). So if loogarch has a different implementation, they
> should implement a topology_is_primary_thread() variant to support HOTPLUG_SMT.

I also stumbled over this sentence.

drivers/base/arch_topology.c:

void clear_cpu_topology(int cpu)                   (2)

  ...
  cpumask_set_cpu(cpu, &cpu_topo->thread_sibling)  (4)

void __init reset_cpu_topology(void)               (1)

  for_each_possible_cpu(cpu)

    ...
    clear_cpu_topology(cpu)                        (2)

#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV) (3)
void __init init_cpu_topology(void)

  reset_cpu_topology()                             (1)
  ...

Does this mean the default implementation relies on (4), i.e. is only
valid for arm64 and riscv? (3)
Do all the other archs then have to overwrite the default implementation
 (like x86 and powerpc) if they want to implement CONFIG_HOTPLUG_SMT?

[...]

