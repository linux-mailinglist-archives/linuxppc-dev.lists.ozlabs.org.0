Return-Path: <linuxppc-dev+bounces-3404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0589D0EE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 11:51:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsPYp042Gz2xxx;
	Mon, 18 Nov 2024 21:51:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731927069;
	cv=none; b=doInr6kamZ6QXBGeeTQYP0f1EhwpoJo+j48WAlZaBWaObXxoCIPvAWP9ISh0M8V8lXYSWshfuW6poyTyDcAG7ZiIF9BlKTcclOUMACIGyYUR3+prPmQErm44JkWvQC0Ddkx/EQN5NhLnTk1Mi//f5jwOSSE+Nm4hYGijgr+GjLpeL4AxQKqnCeD6DZl3EIdXfsO/RrYXzt5e4RBt62nqwWQZ0m0jkE08qMseW7hvE9rrw/RZkI1YiTS64F0OHr0juqhk81JQ3oUsgP3uaAYgkzGcB21QewBhSmLudQepjaNZ188B6sRIxB2SUvlLtM1nI/TOlFoIbj/Xykmd2dVfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731927069; c=relaxed/relaxed;
	bh=gVoiOz+ptsQX0d5eKLkXe2jJrI+SlOwx2zkIaFZsGnY=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=VZ7zXq8dibqVzb3O1Nu4MCN73Rp4ECEP10Hj4PgE8rkjo0a5zbiVwJYDuXPxtpLr8SJ4F0EzlZ0j0OEeyUNpXQoxdL6Z6unl7JsGLWyqeJLj1OM5LDnvDdjgkRL1YnwSDGPCFZ8TG97UFv7TlKVfsta/O61UnVl7+Mlhm6jc+cXuuGgpaP6qAQNd+nsJWSyKkjC95OHtVwziPv7FauS1Dt1Wj1ADnhM2Vi9R0rxXqT1z1vldtij6oE5Uyunzj6jCRKkdTKuHkhUo7VDBz8RpybNPfimHbVqmI1cwxW6gJYC4D2zVDGHdzzdrg9fCujiaCIAaEmMtHQWouNmvp+8t/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsPYk1g4xz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 21:51:03 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XsPVK4mdRz92JG;
	Mon, 18 Nov 2024 18:48:09 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 1CD971800CF;
	Mon, 18 Nov 2024 18:50:52 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 18 Nov 2024 18:50:50 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<dietmar.eggemann@arm.com>, <x86@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<mpe@ellerman.id.au>, <peterz@infradead.org>, <tglx@linutronix.de>,
	<sudeep.holla@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<dave.hansen@linux.intel.com>
Subject: Re: [PATCH v9 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Pierre Gondois <pierre.gondois@arm.com>
References: <20241114141127.23232-1-yangyicong@huawei.com>
 <20241114141127.23232-2-yangyicong@huawei.com>
 <427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <3876e185-2fcc-25dd-e70d-93fdcbf8fc37@huawei.com>
Date: Mon, 18 Nov 2024 18:50:50 +0800
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
In-Reply-To: <427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-4.9 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/11/15 17:42, Pierre Gondois wrote:
> Hello Yicong,
> 
> 
> On 11/14/24 15:11, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Currently if architectures want to support HOTPLUG_SMT they need to
>> provide a topology_is_primary_thread() telling the framework which
>> thread in the SMT cannot offline. However arm64 doesn't have a
>> restriction on which thread in the SMT cannot offline, a simplest
>> choice is that just make 1st thread as the "primary" thread. So
>> just make this as the default implementation in the framework and
>> let architectures like x86 that have special primary thread to
>> override this function (which they've already done).
>>
>> There's no need to provide a stub function if !CONFIG_SMP or
>> !CONFIG_HOTPLUG_SMP. In such case the testing CPU is already
>> the 1st CPU in the SMT so it's always the primary thread.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   arch/powerpc/include/asm/topology.h |  1 +
>>   arch/x86/include/asm/topology.h     |  2 +-
>>   include/linux/topology.h            | 20 ++++++++++++++++++++
>>   3 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
>> index 16bacfe8c7a2..da15b5efe807 100644
>> --- a/arch/powerpc/include/asm/topology.h
>> +++ b/arch/powerpc/include/asm/topology.h
>> @@ -152,6 +152,7 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>>   {
>>       return cpu == cpu_first_thread_sibling(cpu);
>>   }
>> +#define topology_is_primary_thread topology_is_primary_thread
>>     static inline bool topology_smt_thread_allowed(unsigned int cpu)
>>   {
>> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
>> index 92f3664dd933..d84d9b6d8678 100644
>> --- a/arch/x86/include/asm/topology.h
>> +++ b/arch/x86/include/asm/topology.h
>> @@ -219,11 +219,11 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>>   {
>>       return cpumask_test_cpu(cpu, cpu_primary_thread_mask);
>>   }
>> +#define topology_is_primary_thread topology_is_primary_thread
>>     #else /* CONFIG_SMP */
>>   static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
>>   static inline int topology_max_smt_threads(void) { return 1; }
>> -static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
>>   static inline unsigned int topology_amd_nodes_per_pkg(void) { return 1; }
>>   #endif /* !CONFIG_SMP */
>>   diff --git a/include/linux/topology.h b/include/linux/topology.h
>> index 52f5850730b3..b8e860276518 100644
>> --- a/include/linux/topology.h
>> +++ b/include/linux/topology.h
>> @@ -240,6 +240,26 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>>   }
>>   #endif
>>   +#ifndef topology_is_primary_thread
>> +
>> +#define topology_is_primary_thread topology_is_primary_thread
>> +
>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>> +{
>> +    /*
>> +     * On SMT hotplug the primary thread of the SMT won't be disabled.
>> +     * Architectures do have a special primary thread (e.g. x86) need
>> +     * to override this function. Otherwise just make the first thread
>> +     * in the SMT as the primary thread.
>> +     *
>> +     * The sibling cpumask of an offline CPU contains always the CPU
>> +     * itself.
> 
> As Thomas suggested, would it be possible to check it for other
> architectures ?
> For instance for loongarch at arch/loongarch/kernel/smp.c,
> clear_cpu_sibling_map() seems to completely clear &cpu_sibling_map[cpu]
> when a CPU is put offline. This would make topology_sibling_cpumask(cpu)
> to be empty and cpu_bootable() return false if the CPU never booted before.
> 

cpu_bootable() only affects architectures select HOTPLUG_SMT, otherwise it'll always
return true. Since x86 and powerpc have their own illustration of primary thread and
have an override version of this funciton, arm64 is the only user now by this patchset.
We have this guarantee for arm64 and also for other architectures using arch_topology.c
(see clear_cpu_topology()). So if loogarch has a different implementation, they
should implement a topology_is_primary_thread() variant to support HOTPLUG_SMT.

> Personal note:
> cpu_bootable() is called from an already online CPU:
> cpu_bootable (kernel/cpu.c:678)
> cpu_up (kernel/cpu.c:1722 kernel/cpu.c:1702)
> bringup_nonboot_cpus (kernel/cpu.c:1793 kernel/cpu.c:1901)
> smp_init (./include/linux/bitmap.h:445 ./include/linux/nodemask.h:241 ./include/linux/nodemask.h:438 kernel/smp.c:1011)
> kernel_init_freeable (init/main.c:1573)
> kernel_init (init/main.c:1473)
> ret_from_fork (arch/arm64/kernel/entry.S:861)
> 
> store_cpu_topology() for arm64 is called from the booting CPU:
> store_cpu_topology (drivers/base/arch_topology.c:921)
> secondary_start_kernel (arch/arm64/kernel/smp.c:251)
> __secondary_switched (arch/arm64/kernel/head.S:418)
> 
>> +     */
>> +    return cpu == cpumask_first(topology_sibling_cpumask(cpu));
>> +}
>> +
>> +#endif
>> +
>>   static inline const struct cpumask *cpu_cpu_mask(int cpu)
>>   {
>>       return cpumask_of_node(cpu_to_node(cpu));
> 
> .

