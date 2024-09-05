Return-Path: <linuxppc-dev+bounces-1051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9E196D7D2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 14:02:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzyfN3ryvz2ytd;
	Thu,  5 Sep 2024 22:02:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725537756;
	cv=none; b=VlvVcykh88fPz4l4jmhsnK0RHaLtkuv0evEYc+QajrmlaZDUKtS47eGdRghE5Bv9MLji37CxTOTWFW6sOaUkzBPGsVHOfqFWNHs+G1jDRDbkgAoXRa5+KUxCWHypQ5QumCReD3HSN6FJlp3MHEyJeABUGhLZYcljUhU/PRKebsG07r5dJALda4tj56nIIm8BioOAkaPFHcoQjL6HH5F4NKTILocAEf9uYr6Z5TQXHmhj9xgYdFEqE5cW7f+iw6I+DJzxEVAY9XEkLW77YEmlKW0DpDpuYz8ejDcjclFBn3ubE5bA1g98Ux1J976kDnOKZwlp6oew8EWGouUDBDCXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725537756; c=relaxed/relaxed;
	bh=rpxMd43XpALlSdcSVNh9jQ+pFUNeSUssn38kGdhURLU=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=F1zt8pyDOAqbfT5kE/Qp66bc/ITwB6N8J+PCbrDgMTtNEX6qMlJVAEJlOHYSMfTgIAtADptMzWe3NKtA9Jft8dixJsbPtgtGBQojeHS+hOZnbAiyd+zh594DCLVzWuyUopsJVDE+DHAPKZq3ItLV1bB2PUE2QOaYw9LzD7adC552SL+6oSPMmsH4ERbIZNLs4kv809eYBTTsXorZP5ADIvCcgaDw6WmcF4H1ryb+I04mvMd8oqH0Sv9usxg57VW5k/Xvs1lieY+Z8sFiK8EHZm34bOZ6gnvXLDwYt8nv4BFdmzMvHkzG0mSEtakohp1Qi8fb3ClGMf4fbSWd3jJlig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzyfM1gNCz2xTN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 22:02:32 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wzybf1DgwzfblP;
	Thu,  5 Sep 2024 20:00:14 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id DB95E18005F;
	Thu,  5 Sep 2024 20:02:21 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 5 Sep 2024 20:02:20 +0800
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
 <7f722af2-2969-aae5-1fb5-68d353eb95b9@huawei.com>
 <277bd093-422b-4301-92a3-d0a58eb41af5@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <10082e64-b00a-a30b-b9c5-1401a54f6717@huawei.com>
Date: Thu, 5 Sep 2024 20:02:20 +0800
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
In-Reply-To: <277bd093-422b-4301-92a3-d0a58eb41af5@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2024/9/5 16:34, Pierre Gondois wrote:
> Hello Yicong,
> 
>>>> Wondering if we can avoid this 2nd loop. Greg express the worries of looping twice on large scale
>>>> system in v1. Maybe we could use the hetero_id and get the necessary information in one loop, I need
>>>> further think.
>>>
>>> I found this comments (not sure this is what you are refering to):
>>> - https://lore.kernel.org/linux-arm-kernel/20231011103303.00002d8f@Huawei.com/
>>> - https://lore.kernel.org/all/20230921150333.c2zqigs3xxwcg4ln@bogus/T/#m406c4c16871ca7ae431beb20feccfb5e14498452
>>>
>>> I don't see another way to do it right now. Also, I thing the complexity is in
>>> O(2n), which should be better than the original O(n**2),
>>>
>>
>> yes it's less complex. I'm wondering build up the xarray in another way then we can avoid the
>> long loops. What about below:
> 
> I tried the patch on a ThunderX2 with 4 threads per CPU. PPTT topology describes
> 2 clusters of 128 cores each. Each cluster is described as independent (i.e. there
> is no root node in the PPTT). The PPTT is of revision 1, so the IDENTICAL
> flag is not available on the platform.
> 

I think the SMT detection should work on this case, does it? In this case there should be
2 entries for each cluster respectively in the hetero_cpu array. Since the thread number
are the same, we'll detect a symmetric SMT topology.

> I also tried it on a faked SMT asymmetric platform and there might be a small
> correction required.
> 
>>
>>  From 5ff5d0100435982764cd85566a6fe006e60ee98e Mon Sep 17 00:00:00 2001
>> From: Yicong Yang <yangyicong@hisilicon.com>
>> Date: Fri, 20 Oct 2023 15:38:38 +0800
>> Subject: [PATCH] arm64: topology: Support SMT control on ACPI based system
>>
>> For ACPI we'll build the topology from PPTT and we cannot directly
>> get the SMT number of each core. Instead using a temporary xarray
>> to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
>> and SMT information of the first core in its heterogeneous CPU cluster
>> when building the topology. Then we can know the largest SMT number
>> in the system. Warn if heterogeneous SMT topology exists (multiple
>> heterogeneous CPU clusters with different SMT thread number) since the
>> SMT control cannot handle this well. Then enable the support of SMT
>> control.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   arch/arm64/kernel/topology.c | 60 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 60 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index 1a2c72f3e7f8..f6ec30fae70e 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -15,8 +15,10 @@
>>   #include <linux/arch_topology.h>
>>   #include <linux/cacheinfo.h>
>>   #include <linux/cpufreq.h>
>> +#include <linux/cpu_smt.h>
>>   #include <linux/init.h>
>>   #include <linux/percpu.h>
>> +#include <linux/xarray.h>
>>
>>   #include <asm/cpu.h>
>>   #include <asm/cputype.h>
>> @@ -37,17 +39,29 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>>       return !!is_threaded;
>>   }
>>
>> +struct cpu_smt_info {
>> +    int thread_num;
>> +    int core_id;
>> +    int cpu;
>> +};
>> +
>>   /*
>>    * Propagate the topology information of the processor_topology_node tree to the
>>    * cpu_topology array.
>>    */
>>   int __init parse_acpi_topology(void)
>>   {
>> +    int max_smt_thread_num = 1;
>> +    struct cpu_smt_info *entry;
>> +    struct xarray hetero_cpu;
>> +    unsigned long hetero_id;
>>       int cpu, topology_id;
>>
>>       if (acpi_disabled)
>>           return 0;
>>
>> +    xa_init(&hetero_cpu);
>> +
>>       for_each_possible_cpu(cpu) {
>>           topology_id = find_acpi_cpu_topology(cpu, 0);
>>           if (topology_id < 0)
>> @@ -57,6 +71,30 @@ int __init parse_acpi_topology(void)
>>               cpu_topology[cpu].thread_id = topology_id;
>>               topology_id = find_acpi_cpu_topology(cpu, 1);
>>               cpu_topology[cpu].core_id   = topology_id;
>> +
>> +            /*
>> +             * Build up the XArray using the heterogeneous ID of
>> +             * the CPU cluster. Store the CPU and SMT information
>> +             * of the first appeared CPU in the CPU cluster of this
>> +             * heterogeneous ID since the SMT information should be
>> +             * the same in this CPU cluster. Then we can know the
>> +             * SMT information of each heterogeneous CPUs in the
>> +             * system.
>> +             */
>> +            hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
>> +            entry = (struct cpu_smt_info *)xa_load(&hetero_cpu, hetero_id);
>> +            if (!entry) {
>> +                entry = kzalloc(sizeof(*entry), GFP_KERNEL);
>> +                WARN_ON(!entry);
>> +
>> +                entry->cpu = cpu;
>> +                entry->core_id = topology_id;
>> +                entry->thread_num = 1;
>> +                xa_store(&hetero_cpu, hetero_id,
>> +                     entry, GFP_KERNEL);
>> +            } else if (entry->core_id == topology_id) {
>> +                entry->thread_num++;
>> +            }
>>           } else {
>>               cpu_topology[cpu].thread_id  = -1;
>>               cpu_topology[cpu].core_id    = topology_id;
>> @@ -67,6 +105,28 @@ int __init parse_acpi_topology(void)
>>           cpu_topology[cpu].package_id = topology_id;
>>       }
>>
>> +    /*
>> +     * This should be a short loop depending on the number of heterogeneous
>> +     * CPU clusters. Typically on a homogeneous system there's only one
>> +     * entry in the XArray.
>> +     */
>> +    xa_for_each(&hetero_cpu, hetero_id, entry) {
>> +        if (entry->thread_num == 1)
>> +            continue;
> 
> If a platform has CPUs with:
> - 1 thread
> - X (!= 1) threads
> Then I think that the asymmetry is not detected

Ah ok, I only handle the case where there are several thread numbers except no SMT CPUs in the
system. For this case I was thinking we don't need to handle this since there's only one kind
of SMT core in the system, control should works fine for the SMT CPU clusters and we may not
care about the CPUs with no SMT.

Below code should handle the case if we initialize the max_smt_thread_num to 0. I also
reword the warning messages to match the fact. For heterogeneous SMT topology we still
support control SMT by on/off toggle but not fully support setting the thread number.

	int max_smt_thread_num = 0;
	[...]
	/*
	 * This should be a short loop depending on the number of heterogeneous
	 * CPU clusters. Typically on a homogeneous system there's only one
	 * entry in the XArray.
	 */
	xa_for_each(&hetero_cpu, hetero_id, entry) {
		/*
		 * If max_smt_thread_num has been initialized and doesn't match
		 * the thread number of this entry, then the system has
		 * heterogeneous SMT topology.
		 */
		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");

		if (entry->thread_num > max_smt_thread_num)
			max_smt_thread_num = entry->thread_num;

		xa_erase(&hetero_cpu, hetero_id);
		kfree(entry);
	}

Thanks.

> 
>> +
>> +        if (entry->thread_num != max_smt_thread_num &&
>> +            max_smt_thread_num != 1)
>> +            pr_warn("Heterogeneous SMT topology not handled");
>> +
>> +        if (entry->thread_num > max_smt_thread_num)
>> +            max_smt_thread_num = entry->thread_num;
>> +
>> +        xa_erase(&hetero_cpu, hetero_id);
>> +        kfree(entry);
>> +    }
>> +
>> +    cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>> +    xa_destroy(&hetero_cpu);
>>       return 0;
>>   }
>>   #endif
> 
> .

