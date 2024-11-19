Return-Path: <linuxppc-dev+bounces-3437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C169D25B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 13:27:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xt3fy0TF3z2xGH;
	Tue, 19 Nov 2024 23:27:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732019274;
	cv=none; b=QtVM68hLoG748xAJISWWIrRaUB8DXLU4rSL8rh8gGVGSgr5pPG/LPGtG2N3mplpJC9IhraUbJvFiTecb9SzsqNXfsG5RZn7Q6RmGRnjFetAjpp1Qchb99jhiy4hfNF4w4/ZCJnOQECCm78lL0M5+9wNWaxBu/9sg9Rq+BjDNt603NI0A/ZJrnzLjGBKtufdXW+L3vpjpOzn0J49z9q9f9CsUZZk9rhHYaAm2j/+S6rIt2iTMynJwLJN/GGYSvW135MeA0FoAP2fBrU99EJQV6gM/rcxtkHNO6oeUkxeNB2MTy1CaLx0zL9k/4aNWL9/zxlxx5hxV5KXs/W/OoN/ZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732019274; c=relaxed/relaxed;
	bh=NzY5TtQm6Ue6u4zoUA9OEnl0DUpLjxzz4KUu1sghaI4=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=U+fseL8XwTARRGZZseQaFKUVZZxh1df90IbRBTlr1UEttY5ERf1il0q3PF9Pqcgq6xK3i1OHaI7G9jZ2WxcMP45KI409w00EXqvxZKujTnEanh7K36OAvVVqCr/B5nMDxZJ/p9hCNHgdC5YEaUyqAfXwWMPNiMsHQzI1XDGFkqnk4C1m+stvdZsk724urfeYPOeEaL6Vh/YPnZTIGrDhnKRjTPtEEacIPbWEyKP1RPPIR/02boCL/mgovZtBz8lo8iZ2TePc295Iran6Fr9tUNmGEsEAP+jn4zRGqIBLbBPLh0lD3bq9sChU3yOMigb1CLkibeEpy/OPPkfBzSBQvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xt3fv2q2wz2y8c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 23:27:45 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xt3d26qkHz21kWm;
	Tue, 19 Nov 2024 20:26:14 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 17D7014010C;
	Tue, 19 Nov 2024 20:27:36 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 19 Nov 2024 20:27:35 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <mpe@ellerman.id.au>,
	<peterz@infradead.org>, <tglx@linutronix.de>, <sudeep.holla@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <linux-kernel@vger.kernel.org>,
	<morten.rasmussen@arm.com>, <msuchanek@suse.de>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<dave.hansen@linux.intel.com>
Subject: Re: [PATCH v9 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Dietmar Eggemann <dietmar.eggemann@arm.com>, Pierre Gondois
	<pierre.gondois@arm.com>
References: <20241114141127.23232-1-yangyicong@huawei.com>
 <20241114141127.23232-2-yangyicong@huawei.com>
 <427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com>
 <3876e185-2fcc-25dd-e70d-93fdcbf8fc37@huawei.com>
 <ab5d70ad-d4a4-4116-82c6-908b9e641ee6@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <6d732b89-d3d4-7bd6-d60e-e8bea05d05cf@huawei.com>
Date: Tue, 19 Nov 2024 20:27:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
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
In-Reply-To: <ab5d70ad-d4a4-4116-82c6-908b9e641ee6@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-4.9 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/11/18 23:04, Dietmar Eggemann wrote:
> On 18/11/2024 11:50, Yicong Yang wrote:
>> On 2024/11/15 17:42, Pierre Gondois wrote:
>>> Hello Yicong,
>>>
>>>
>>> On 11/14/24 15:11, Yicong Yang wrote:
>>>> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> [...]
> 
>>>>   diff --git a/include/linux/topology.h b/include/linux/topology.h
>>>> index 52f5850730b3..b8e860276518 100644
>>>> --- a/include/linux/topology.h
>>>> +++ b/include/linux/topology.h
>>>> @@ -240,6 +240,26 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>>>>   }
>>>>   #endif
>>>>   +#ifndef topology_is_primary_thread
>>>> +
>>>> +#define topology_is_primary_thread topology_is_primary_thread
>>>> +
>>>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>>>> +{
>>>> +    /*
>>>> +     * On SMT hotplug the primary thread of the SMT won't be disabled.
>>>> +     * Architectures do have a special primary thread (e.g. x86) need
>>>> +     * to override this function. Otherwise just make the first thread
>>>> +     * in the SMT as the primary thread.
>>>> +     *
>>>> +     * The sibling cpumask of an offline CPU contains always the CPU
>>>> +     * itself.
>>>
>>> As Thomas suggested, would it be possible to check it for other
>>> architectures ?
>>> For instance for loongarch at arch/loongarch/kernel/smp.c,
>>> clear_cpu_sibling_map() seems to completely clear &cpu_sibling_map[cpu]
>>> when a CPU is put offline. This would make topology_sibling_cpumask(cpu)
>>> to be empty and cpu_bootable() return false if the CPU never booted before.
>>>
>>
>> cpu_bootable() only affects architectures select HOTPLUG_SMT, otherwise it'll always
>> return true. Since x86 and powerpc have their own illustration of primary thread and
>> have an override version of this funciton, arm64 is the only user now by this patchset.
>> We have this guarantee for arm64 and also for other architectures using arch_topology.c
>> (see clear_cpu_topology()). So if loogarch has a different implementation, they
>> should implement a topology_is_primary_thread() variant to support HOTPLUG_SMT.
> 
> I also stumbled over this sentence.
> 
> drivers/base/arch_topology.c:
> 
> void clear_cpu_topology(int cpu)                   (2)
> 
>   ...
>   cpumask_set_cpu(cpu, &cpu_topo->thread_sibling)  (4)
> 
> void __init reset_cpu_topology(void)               (1)
> 
>   for_each_possible_cpu(cpu)
> 
>     ...
>     clear_cpu_topology(cpu)                        (2)
> 
> #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV) (3)
> void __init init_cpu_topology(void)
> 
>   reset_cpu_topology()                             (1)
>   ...
> 
> Does this mean the default implementation relies on (4), i.e. is only
> valid for arm64 and riscv? (3)
> Do all the other archs then have to overwrite the default implementation
>  (like x86 and powerpc) if they want to implement CONFIG_HOTPLUG_SMT?
> 

I think yes if they have problems with the default implementation. That's
what used to be to support HOTPLUG_SMT before this, each arthitecture
provides their own variant of topology_is_primary_thread.

The current approach may also work since cpu_bootable() will make all the
CPUs boot at least once:
static inline bool cpu_bootable(unsigned int cpu) {
[...]
	if (topology_is_primary_thread(cpu))
		return true;

	return !cpumask_test_cpu(cpu, &cpus_booted_once_mask); // True if not booted
}

The boot process will be like below. cpu_bootable() is checked twice:
-> cpu_up()
     cpu_bootable() (1)
     [...]
     cpuhp_bringup_ap()
       [ archs usually update the sibling_mask in start_secondary() here ]
       bringup_wait_for_ap_online()
         if (!cpu_bootable(cpu)) (2)
           return -ECANCELED // roll back and offline this CPU

So an empty mask in (1) won't block the CPU going online. And the default
topology_is_primary_thread() should work if sibling mask updated before
the checking in (2). I hacked x86 to use the default topology_is_primary_thread
and tested on a qemu vm and it seems also work (just for test since the
primary thread should not always be the 1st thread in the core on x86,
not quite sure).

Thanks.



