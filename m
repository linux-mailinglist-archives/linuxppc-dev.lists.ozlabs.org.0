Return-Path: <linuxppc-dev+bounces-916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 217EA969E07
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 14:44:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wylgp5dNVz2xxt;
	Tue,  3 Sep 2024 22:44:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725367478;
	cv=none; b=AgZlQj1/4CORmmOizRCXTo80ZLtqpUHAJJX1r7dmgl+MYJKQcxb2PjS3sj5jBESgVgYkme3+h5mQ9pcs240B+s9mmrgluSaUh2LcfWuEt11AMmLafkBJ5mmor0UlR6UIwJWq2hjnwnxddgPGDcqln3B65HPWQawXRPaqEVO+jVoXSGwYKl2Fi44tXSJYmHXlJmrj6G7BqOqxV4ea9b4I6arCwNar9LSn+o7C3L6psjf7OuEZL3gf1iCTNjoIruaJeBvcABC7mPZsqHZDylu7vhbXGrb4pZ2K7YSOknUVF4yCHemqLfqEYHIkDKLF/Kx4zS7a1+VmjYLG2NlgfUeWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725367478; c=relaxed/relaxed;
	bh=jzPjq5bV0yGaXyK6M52jk3h5GSYo/pcJhJotq7TIvCk=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Lscw73AoVCur6qiiamuBik+qnrW7jS7Q2w6FZrUdGAI4ZuygsRytwuyB7liIueuJprCAkEBPpicqf9zM6AbNPGnVIeX5W+Pc8t9zJK1c1qZoKpU1OhFDZj1qvHGxm4J11bHk+PdhiMnsiEL+HM3nNSsJfSmdmyxbz6ziatOX/5D9LWzj/QjDjdxVcwYThb28ituNKz11PMd/do6LLHbOL6Prr20O5GOG5v1xpEaevpA8qFISzWdorlfb4MQd0uV4w13LZGD0iOdDNEj+PWIhZ3KbfnH2STDorZYsezdCCguQhXjzKORWxpf4ZepBpWfu0XCl+PmD2XrEcVz1XEmx3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wylgn2dS4z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 22:44:32 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WyldB0szDz1xwyv;
	Tue,  3 Sep 2024 20:42:22 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 74BE91A0188;
	Tue,  3 Sep 2024 20:44:22 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 3 Sep 2024 20:44:21 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <mingo@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <mpe@ellerman.id.au>,
	<peterz@infradead.org>, <tglx@linutronix.de>, <sudeep.holla@arm.com>,
	<will@kernel.org>, <catalin.marinas@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <dietmar.eggemann@arm.com>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v5 3/4] arm64: topology: Support SMT control on ACPI based
 system
To: Pierre Gondois <pierre.gondois@arm.com>
References: <20240806085320.63514-1-yangyicong@huawei.com>
 <20240806085320.63514-4-yangyicong@huawei.com>
 <a998c723-7451-439a-9c88-7c8b5c1b890b@arm.com>
 <00e6110a-462a-c117-0292-e88b57d27a05@huawei.com>
 <3947cb79-3199-4cd6-b784-51a245084581@arm.com>
 <1a7b5ac7-f040-672f-07a0-d7f3dc170c88@huawei.com>
 <6c05e39c-41f3-451c-b119-7b8662c1ceee@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <7f722af2-2969-aae5-1fb5-68d353eb95b9@huawei.com>
Date: Tue, 3 Sep 2024 20:44:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
In-Reply-To: <6c05e39c-41f3-451c-b119-7b8662c1ceee@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2024/9/2 15:43, Pierre Gondois wrote:
> Hello Yicong
> 
> On 8/30/24 11:35, Yicong Yang wrote:
>> On 2024/8/29 20:46, Pierre Gondois wrote:
>>> Hello Yicong,
>>>
>>> On 8/29/24 09:40, Yicong Yang wrote:
>>>> Hi Pierre,
>>>>
>>>> On 2024/8/27 23:40, Pierre Gondois wrote:
>>>>> Hello Yicong,
>>>>> IIUC we are looking for the maximum number of threads a CPU can have
>>>>> in the platform. But is is actually possible to have a platform with
>>>>> CPUs not having the same number of threads ?
>>>>>
>>>>
>>>> I was thinking of the heterogenous platforms, for example part of the
>>>> cores have SMT and others don't (I don't have any though, but there
>>>> should be some such platforms for arm64).
>>>>
>>>>> For instance kernel/cpu.c::cpu_smt_num_threads_valid() will check
>>>>> that the number of threads is either 1 or cpu_smt_max_threads (as
>>>>> CONFIG_SMT_NUM_THREADS_DYNAMIC is not enabled for arm64). However
>>>>> a (hypothetical) platform with:
>>>>> - CPU0: 2 threads
>>>>> - CPU1: 4 threads
>>>>> should not be able to set the number of threads to 2, as
>>>>> 1 < 2 < cpu_smt_max_threads (cf. cpu_smt_num_threads_valid()).
>>>>>
>>>>
>>>> It's a bit more complex. If we enable/disable the SMT using on/off control
>>>> then we won't have this problem. We'll online all the CPUs on enabling and
>>>> offline CPUs which is not primary thread and don't care about the thread
>>>> number of each core.
>>>>
>>>> Control using thread number is introduced by CONFIG_SMT_NUM_THREADS_DYNAMIC
>>>> and only enabled on powerpc. I think this interface is not enough to handle
>>>> the hypothetical we assumed, since it assumes the homogenous platform that
>>>> all the CPUs have the same thread number. But this should be fine for
>>>> the platforms with SMT(with same thread number) and non-SMT cores, since it do
>>>> indicates the real thread number of the SMT cores.
>>>>
>>>>> So if there is an assumption that all the CPUs have the same number of
>>>>> threads, it should be sufficient to count the number of threads for one
>>>>> CPU right ?
>>>>>
>>>>
>>>> Naturally and conveniently I may think use of the threads number of CPU0 (boot
>>>> cpu) in such a solution. But this will be wrong if CPU0 is non-SMT on a heterogenous
>>>> platform :(
>>>>
>>>>> In the other (unlikely) case (i.e. CPUs can have various number of threads),
>>>>> I think we should either:
>>>>> - use your method and check that all the CPUs have the same number of threads
>>>>> - get the number of threads for one CPU and check that all the CPUs are
>>>>>      identical using the ACPI_PPTT_ACPI_IDENTICAL tag
>>>>
>>>> I think this won't be simpler since we still need to iterate all the CPUs to see
>>>> if they have the same hetero_id (checked how we're using this ACPI tag in
>>>> arm_acpi_register_pmu_device()). We could already know if they're identical by
>>>> comparing the thread number and do the update if necessary.
>>>>
>>>>> - have a per-cpu cpu_smt_max_threads value ?
>>>>
>>>> This should be unnecessary in currently stage if there's no platforms
>>>> with several kind cores have different thread number like in your assumption
>>>> and enable CONFIG_SMT_NUM_THREADS_DYNAMIC on such platforms. Otherwise using
>>>> a global cpu_smt_max_threads to enable the SMT control should be enough.
>>>> Does it make sense?
>>>
>>> Yes, I agree with all the things you said:
>>> - the current smt/control interface cannot handle asymmetric SMT platforms
>>> - I am not aware if such platform exist so far
>>>
>>> I think it would still be good to check all the CPUs have the same number of
>>> threads. I tried to enable the SMT_NUM_THREADS_DYNAMIC Kconfig with the
>>> patch attached (and to check CPUs have the same number of threads). Feel free
>>> to take what you like/ignore what is inside the attached patch, or let me know
>>> if I should submit a part in a separate patchset,
>>>
>>
>> Checked the changes, we can make this series as the basic support and a separate
>> series of yours as a further support of SMT control on arm64:
>> - support thread_id on ACPI based arm64 platform
>> - support partial SMT control by enable CONFIG_SMT_NUM_THREADS_DYNAMIC
> 
> I'm not sure I fully understand what you mean. I can send patches to
> enable SMT_NUM_THREADS_DYNAMIC on top of a v6 of yours IIUC. I let you pick
> the changes that you estimate to make more sense in your serie (if that makes
> sense) ? Please let met know if that works for you (or not).
> 

yes it works for me :)

>>
>> some minor comments below.
>>
>>> ----------------------------
>>>
>>>      [RFC] arm64: topology: Enable CONFIG_SMT_NUM_THREADS_DYNAMIC
>>>          - On arm64 ACPI systems, change the thread_id assignment to have
>>>        increasing values starting from 0. This is already the case for DT
>>>        based systems. Doing so allows to uniformly identify the n-th
>>>        thread of a given CPU.
>>>      - Check that all CPUs have the same number of threads (for DT/ACPI)
>>>      - Enable CONFIG_SMT_NUM_THREADS_DYNAMIC
>>>          On a Tx2, with 256 CPUs, threads siblings being 0,32,64,96
>>>      for socket0 and 128 + (0,32,64,96) for socket1:
>>>      $ cd /sys/devices/system/cpu/smt/
>>>      $ cat ../online
>>>      0-255
>>>      $ echo 2 > control
>>>      $ cat ../online
>>>      0-63,128-191
>>>      $ echo 3 > control
>>>      $ cat ../online
>>>      0-95,128-223
>>>      $ echo on > control
>>>      $ cat ../online
>>>      0-255
>>>
>>
>> So it's a real SMT4 system, it does make sense to have this partial SMT control
>> support.
> 
> Yes right
> 
>>
>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>> index bd3bc2f5e0ec..1d8521483065 100644
>>> --- a/arch/arm64/Kconfig
>>> +++ b/arch/arm64/Kconfig
>>> @@ -239,6 +239,7 @@ config ARM64
>>>          select HAVE_GENERIC_VDSO
>>>          select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
>>>          select HOTPLUG_SMT if (SMP && HOTPLUG_CPU)
>>> +       select SMT_NUM_THREADS_DYNAMIC if HOTPLUG_SMT
>>>          select IRQ_DOMAIN
>>>          select IRQ_FORCED_THREADING
>>>          select KASAN_VMALLOC if KASAN
>>> diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
>>> index 0f6ef432fb84..7dd211f81687 100644
>>> --- a/arch/arm64/include/asm/topology.h
>>> +++ b/arch/arm64/include/asm/topology.h
>>> @@ -39,6 +39,14 @@ void update_freq_counters_refs(void);
>>>   #define arch_scale_hw_pressure topology_get_hw_pressure
>>>   #define arch_update_hw_pressure        topology_update_hw_pressure
>>>   +#ifdef CONFIG_SMT_NUM_THREADS_DYNAMIC
>>> +#include <linux/cpu_smt.h>
>>> +static inline bool topology_smt_thread_allowed(unsigned int cpu)
>>> +{
>>> +       return topology_thread_id(cpu) < cpu_smt_num_threads;
>>> +}
>>> +#endif
>>> +
>>>   #include <asm-generic/topology.h>
>>>     #endif /* _ASM_ARM_TOPOLOGY_H */
>>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>>> index f72e1e55b05e..a83babe19972 100644
>>> --- a/arch/arm64/kernel/topology.c
>>> +++ b/arch/arm64/kernel/topology.c
>>> @@ -47,7 +47,9 @@ int __init parse_acpi_topology(void)
>>>   {
>>>          int thread_num, max_smt_thread_num = 1;
>>>          struct xarray core_threads;
>>> +       bool have_thread = false;
>>>          int cpu, topology_id;
>>> +       unsigned long i;
>>>          void *entry;
>>>            if (acpi_disabled)
>>> @@ -61,6 +63,8 @@ int __init parse_acpi_topology(void)
>>>                          return topology_id;
>>>                    if (acpi_cpu_is_threaded(cpu)) {
>>> +                       have_thread = true;
>>> +
>>>                          cpu_topology[cpu].thread_id = topology_id;
>>>                          topology_id = find_acpi_cpu_topology(cpu, 1);
>>>                          cpu_topology[cpu].core_id   = topology_id;
>>> @@ -69,9 +73,10 @@ int __init parse_acpi_topology(void)
>>>                          if (!entry) {
>>>                                  xa_store(&core_threads, topology_id,
>>>                                           xa_mk_value(1), GFP_KERNEL);
>>> +                               cpu_topology[cpu].thread_id = 0;
>>>                          } else {
>>>                                  thread_num = xa_to_value(entry);
>>> -                               thread_num++;
>>> +                               cpu_topology[cpu].thread_id = thread_num++;
>>>                                  xa_store(&core_threads, topology_id,
>>>                                           xa_mk_value(thread_num), GFP_KERNEL);
>>>   @@ -86,8 +91,17 @@ int __init parse_acpi_topology(void)
>>>                  cpu_topology[cpu].cluster_id = topology_id;
>>>                  topology_id = find_acpi_cpu_topology_package(cpu);
>>>                  cpu_topology[cpu].package_id = topology_id;
>>> +
>>> +               pr_debug("CPU%u: package=0x%x cluster=0x%x core=0x%x thread=0x%x\n",
>>> +                       cpu, cpu_topology[cpu].package_id, cpu_topology[cpu].cluster_id,
>>> +                       cpu_topology[cpu].core_id, cpu_topology[cpu].thread_id);
>>>          }
>>>   +       if (have_thread)
>>
>> we could know this from max_smt_thread_num so have_thread maybe unnecessary.
> 
> Yes right, I will change that.
> 
>>
>>> +               xa_for_each(&core_threads, i, entry)
>>> +                       if (xa_to_value(entry) != max_smt_thread_num)
>>> +                               pr_warn("Heterogeneous SMT topology not handled");\
>>
>> Wondering if we can avoid this 2nd loop. Greg express the worries of looping twice on large scale
>> system in v1. Maybe we could use the hetero_id and get the necessary information in one loop, I need
>> further think.
> 
> I found this comments (not sure this is what you are refering to):
> - https://lore.kernel.org/linux-arm-kernel/20231011103303.00002d8f@Huawei.com/
> - https://lore.kernel.org/all/20230921150333.c2zqigs3xxwcg4ln@bogus/T/#m406c4c16871ca7ae431beb20feccfb5e14498452
> 
> I don't see another way to do it right now. Also, I thing the complexity is in
> O(2n), which should be better than the original O(n**2),
> 

yes it's less complex. I'm wondering build up the xarray in another way then we can avoid the
long loops. What about below:

From 5ff5d0100435982764cd85566a6fe006e60ee98e Mon Sep 17 00:00:00 2001
From: Yicong Yang <yangyicong@hisilicon.com>
Date: Fri, 20 Oct 2023 15:38:38 +0800
Subject: [PATCH] arm64: topology: Support SMT control on ACPI based system

For ACPI we'll build the topology from PPTT and we cannot directly
get the SMT number of each core. Instead using a temporary xarray
to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
and SMT information of the first core in its heterogeneous CPU cluster
when building the topology. Then we can know the largest SMT number
in the system. Warn if heterogeneous SMT topology exists (multiple
heterogeneous CPU clusters with different SMT thread number) since the
SMT control cannot handle this well. Then enable the support of SMT
control.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/kernel/topology.c | 60 ++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 1a2c72f3e7f8..f6ec30fae70e 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -15,8 +15,10 @@
 #include <linux/arch_topology.h>
 #include <linux/cacheinfo.h>
 #include <linux/cpufreq.h>
+#include <linux/cpu_smt.h>
 #include <linux/init.h>
 #include <linux/percpu.h>
+#include <linux/xarray.h>

 #include <asm/cpu.h>
 #include <asm/cputype.h>
@@ -37,17 +39,29 @@ static bool __init acpi_cpu_is_threaded(int cpu)
 	return !!is_threaded;
 }

+struct cpu_smt_info {
+	int thread_num;
+	int core_id;
+	int cpu;
+};
+
 /*
  * Propagate the topology information of the processor_topology_node tree to the
  * cpu_topology array.
  */
 int __init parse_acpi_topology(void)
 {
+	int max_smt_thread_num = 1;
+	struct cpu_smt_info *entry;
+	struct xarray hetero_cpu;
+	unsigned long hetero_id;
 	int cpu, topology_id;

 	if (acpi_disabled)
 		return 0;

+	xa_init(&hetero_cpu);
+
 	for_each_possible_cpu(cpu) {
 		topology_id = find_acpi_cpu_topology(cpu, 0);
 		if (topology_id < 0)
@@ -57,6 +71,30 @@ int __init parse_acpi_topology(void)
 			cpu_topology[cpu].thread_id = topology_id;
 			topology_id = find_acpi_cpu_topology(cpu, 1);
 			cpu_topology[cpu].core_id   = topology_id;
+
+			/*
+			 * Build up the XArray using the heterogeneous ID of
+			 * the CPU cluster. Store the CPU and SMT information
+			 * of the first appeared CPU in the CPU cluster of this
+			 * heterogeneous ID since the SMT information should be
+			 * the same in this CPU cluster. Then we can know the
+			 * SMT information of each heterogeneous CPUs in the
+			 * system.
+			 */
+			hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
+			entry = (struct cpu_smt_info *)xa_load(&hetero_cpu, hetero_id);
+			if (!entry) {
+				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+				WARN_ON(!entry);
+
+				entry->cpu = cpu;
+				entry->core_id = topology_id;
+				entry->thread_num = 1;
+				xa_store(&hetero_cpu, hetero_id,
+					 entry, GFP_KERNEL);
+			} else if (entry->core_id == topology_id) {
+				entry->thread_num++;
+			}
 		} else {
 			cpu_topology[cpu].thread_id  = -1;
 			cpu_topology[cpu].core_id    = topology_id;
@@ -67,6 +105,28 @@ int __init parse_acpi_topology(void)
 		cpu_topology[cpu].package_id = topology_id;
 	}

+	/*
+	 * This should be a short loop depending on the number of heterogeneous
+	 * CPU clusters. Typically on a homogeneous system there's only one
+	 * entry in the XArray.
+	 */
+	xa_for_each(&hetero_cpu, hetero_id, entry) {
+		if (entry->thread_num == 1)
+			continue;
+
+		if (entry->thread_num != max_smt_thread_num &&
+		    max_smt_thread_num != 1)
+			pr_warn("Heterogeneous SMT topology not handled");
+
+		if (entry->thread_num > max_smt_thread_num)
+			max_smt_thread_num = entry->thread_num;
+
+		xa_erase(&hetero_cpu, hetero_id);
+		kfree(entry);
+	}
+
+	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+	xa_destroy(&hetero_cpu);
 	return 0;
 }
 #endif
-- 
2.24.0


> Regards,
> Pierre
> 
>>
>> Thanks.
>>
>>> +
>>>          cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>>>            xa_destroy(&core_threads);
>>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>>> index 95513abd664f..20d7f5b72ddd 100644
>>> --- a/drivers/base/arch_topology.c
>>> +++ b/drivers/base/arch_topology.c
>>> @@ -532,13 +532,15 @@ static int __init get_cpu_for_node(struct device_node *node)
>>>          return cpu;
>>>   }
>>>   -static void __init update_smt_num_threads(unsigned int num_threads)
>>> +static void __init update_smt_num_threads(int num_threads)
>>>   {
>>> -       static unsigned int max_smt_thread_num = 1;
>>> +       static int max_smt_thread_num = -1;
>>>   -       if (num_threads > max_smt_thread_num) {
>>> +       if (max_smt_thread_num < 0) {
>>>                  max_smt_thread_num = num_threads;
>>>                  cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>>> +       } else if (num_threads != max_smt_thread_num) {
>>> +               pr_warn("Heterogeneous SMT topology not handled");
>>>          }
>>>   }
>>>   diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
>>> index b721f360d759..afdfdc64a0a1 100644
>>> --- a/include/linux/arch_topology.h
>>> +++ b/include/linux/arch_topology.h
>>> @@ -87,6 +87,7 @@ extern struct cpu_topology cpu_topology[NR_CPUS];
>>>   #define topology_physical_package_id(cpu)      (cpu_topology[cpu].package_id)
>>>   #define topology_cluster_id(cpu)       (cpu_topology[cpu].cluster_id)
>>>   #define topology_core_id(cpu)          (cpu_topology[cpu].core_id)
>>> +#define topology_thread_id(cpu)                (cpu_topology[cpu].thread_id)
>>>   #define topology_core_cpumask(cpu)     (&cpu_topology[cpu].core_sibling)
>>>   #define topology_sibling_cpumask(cpu)  (&cpu_topology[cpu].thread_sibling)
>>>   #define topology_cluster_cpumask(cpu)  (&cpu_topology[cpu].cluster_sibling)
>>>
>>> ----------------------------
>>>
>>>
>>> Regards,
>>> Pierre
>>>
>>>>
>>>> Thanks,
>>>> Yicong
>>>>
>>>>>
>>>>> Same comment for the DT patch. If there is an assumption that all CPUs have
>>>>> the same number of threads, then update_smt_num_threads() could only be called
>>>>> once I suppose,
>>>>>
>>>>> Regards,
>>>>> Pierre
>>>>>
>>>>>
>>>>> On 8/6/24 10:53, Yicong Yang wrote:
>>>>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>>>>
>>>>>> For ACPI we'll build the topology from PPTT and we cannot directly
>>>>>> get the SMT number of each core. Instead using a temporary xarray
>>>>>> to record the SMT number of each core when building the topology
>>>>>> and we can know the largest SMT number in the system. Then we can
>>>>>> enable the support of SMT control.
>>>>>>
>>>>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>>>>> ---
>>>>>>     arch/arm64/kernel/topology.c | 24 ++++++++++++++++++++++++
>>>>>>     1 file changed, 24 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>>>>>> index 1a2c72f3e7f8..f72e1e55b05e 100644
>>>>>> --- a/arch/arm64/kernel/topology.c
>>>>>> +++ b/arch/arm64/kernel/topology.c
>>>>>> @@ -15,8 +15,10 @@
>>>>>>     #include <linux/arch_topology.h>
>>>>>>     #include <linux/cacheinfo.h>
>>>>>>     #include <linux/cpufreq.h>
>>>>>> +#include <linux/cpu_smt.h>
>>>>>>     #include <linux/init.h>
>>>>>>     #include <linux/percpu.h>
>>>>>> +#include <linux/xarray.h>
>>>>>>       #include <asm/cpu.h>
>>>>>>     #include <asm/cputype.h>
>>>>>> @@ -43,11 +45,16 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>>>>>>      */
>>>>>>     int __init parse_acpi_topology(void)
>>>>>>     {
>>>>>> +    int thread_num, max_smt_thread_num = 1;
>>>>>> +    struct xarray core_threads;
>>>>>>         int cpu, topology_id;
>>>>>> +    void *entry;
>>>>>>           if (acpi_disabled)
>>>>>>             return 0;
>>>>>>     +    xa_init(&core_threads);
>>>>>> +
>>>>>>         for_each_possible_cpu(cpu) {
>>>>>>             topology_id = find_acpi_cpu_topology(cpu, 0);
>>>>>>             if (topology_id < 0)
>>>>>> @@ -57,6 +64,20 @@ int __init parse_acpi_topology(void)
>>>>>>                 cpu_topology[cpu].thread_id = topology_id;
>>>>>>                 topology_id = find_acpi_cpu_topology(cpu, 1);
>>>>>>                 cpu_topology[cpu].core_id   = topology_id;
>>>>>> +
>>>>>> +            entry = xa_load(&core_threads, topology_id);
>>>>>> +            if (!entry) {
>>>>>> +                xa_store(&core_threads, topology_id,
>>>>>> +                     xa_mk_value(1), GFP_KERNEL);
>>>>>> +            } else {
>>>>>> +                thread_num = xa_to_value(entry);
>>>>>> +                thread_num++;
>>>>>> +                xa_store(&core_threads, topology_id,
>>>>>> +                     xa_mk_value(thread_num), GFP_KERNEL);
>>>>>> +
>>>>>> +                if (thread_num > max_smt_thread_num)
>>>>>> +                    max_smt_thread_num = thread_num;
>>>>>> +            }
>>>>>>             } else {
>>>>>>                 cpu_topology[cpu].thread_id  = -1;
>>>>>>                 cpu_topology[cpu].core_id    = topology_id;
>>>>>> @@ -67,6 +88,9 @@ int __init parse_acpi_topology(void)
>>>>>>             cpu_topology[cpu].package_id = topology_id;
>>>>>>         }
>>>>>>     +    cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>>>>>> +
>>>>>> +    xa_destroy(&core_threads);
>>>>>>         return 0;
>>>>>>     }
>>>>>>     #endif
>>>>>
>>>>> .
> 
> .

