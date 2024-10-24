Return-Path: <linuxppc-dev+bounces-2548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A63BF9AE9F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 17:10:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZ8Vp24dTz3bLS;
	Fri, 25 Oct 2024 02:10:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729782642;
	cv=none; b=CF7kiIEg/dcXdHj491oLbg6ZgwgXw4FvUX74xGvkvnN7olQ1vrhrNDs2gHL4P/CaDM4EpdtCWBeugDWijmZyzYBgyHRCnDR4zsmC8wT3JMihgfmQlBGx8IZnV9NeCGvH1ty9hjuUNJmnhVKO5ByjtvJcB/dFvKcMXYpNjHTLWrSTnYLbYSdvn9AarVM/59irYa0lkBMi17Hg/Rbdu2LSbtV6f8uUscjo3XRdhRjGC1Pd/Z1ijSvRuv5DtGFCpdxoVLOkLg0i/8XFYG3zEMgipwtdypzX3xmUQUNpaM083qF6wZvtTbyIF9DJIHUBTHUmY4e86u/Y0YJqoYQB+hhfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729782642; c=relaxed/relaxed;
	bh=0NEROD9SoptjaH6z4ZaBOxf64L1Sc5rI203o1wBOxJ8=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=i8yTco+8vaY9BOhs8vJ+2yFe0CVkRy1vGwlpndlANYA5dodkkz6XkttybhQOy3mWvh37VnJ3oiA3K7iRwh25F3zW+Xpg9PGOA13bS3ui5BHBv1l+Gf32O6TNHXCmZiZkIwyVFS4E9zcGNY/PElZglPKIV+MipJko0amJwcB1iLFS+JRVMcYHNuGQqvW7VR3x3CFRUaOvEd0+kG5bITidIyJE+2+dyMy35pVS4FdGMnhXRCe6s1vCnJELnx7/WsEjV50DjO8Ikh1SDaNrxGha0Ig0hIT69BtcaFKOcNT5JlcGjoqStuHM+klRLtoDyzmNzg1J80w1dbCFey8i3cOnbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZ8Vl4JpYz2yj3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 02:10:36 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XZ8Rf1Mv4z10N2T;
	Thu, 24 Oct 2024 23:07:58 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id A77E51401E9;
	Thu, 24 Oct 2024 23:10:01 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 24 Oct 2024 23:10:00 +0800
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <dietmar.eggemann@arm.com>,
	<yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v6 3/4] arm64: topology: Support SMT control on ACPI based
 system
To: Pierre Gondois <pierre.gondois@arm.com>
References: <20241015021841.35713-1-yangyicong@huawei.com>
 <20241015021841.35713-4-yangyicong@huawei.com>
 <896f9bb7-7053-4835-8db4-1ff063c268c1@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <3181577e-d6dd-fd91-f51f-ae6ca0413687@huawei.com>
Date: Thu, 24 Oct 2024 23:09:59 +0800
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
In-Reply-To: <896f9bb7-7053-4835-8db4-1ff063c268c1@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-3.0 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/10/24 16:44, Pierre Gondois wrote:
> Hello Yicong,
> 
> On 10/15/24 04:18, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> For ACPI we'll build the topology from PPTT and we cannot directly
>> get the SMT number of each core. Instead using a temporary xarray
>> to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
>> and SMT information of the first core in its heterogeneous CPU cluster
>> when building the topology. Then we can know the largest SMT number
>> in the system.
> 
> Is it possible to also state that the logic only work for PPTT versions
> prior to 6.2. Otherwise find_acpi_cpu_topology_hetero_id() will return
> the id of the root node of the PPTT, and all the CPUs of the platform
> will be assumed to be identical.
> 

sure. of course.

>>
>> The core's SMT control provides two interface to the users [1]:
>> 1) enable/disable SMT by writing on/off
>> 2) enable/disable SMT by writing thread number 1/max_thread_number
>>
>> If a system have more than one SMT thread number the 2) may
>> not handle it well, since there're multiple thread numbers in the
>> system and 2) only accept 1/max_thread_number. So issue a warning
>> to notify the users if such system detected.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   arch/arm64/kernel/topology.c | 61 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index 1a2c72f3e7f8..2fa584b932ee 100644
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
>>     #include <asm/cpu.h>
>>   #include <asm/cputype.h>
>> @@ -37,17 +39,29 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>>       return !!is_threaded;
>>   }
>>   +struct cpu_smt_info {
>> +    int thread_num;
>> +    int core_id;
>> +    int cpu;
> 
> It doesn't seem that the 'cpu' is used. Maybe this should be removed,
> or used in the error message (I think this could be removed).
> 

sure. will remove..

>> +};
>> +
>>   /*
>>    * Propagate the topology information of the processor_topology_node tree to the
>>    * cpu_topology array.
>>    */
>>   int __init parse_acpi_topology(void)
>>   {
>> +    int max_smt_thread_num = 0;
>> +    struct cpu_smt_info *entry;
>> +    struct xarray hetero_cpu;
>> +    unsigned long hetero_id;
>>       int cpu, topology_id;
>>         if (acpi_disabled)
>>           return 0;
>>   +    xa_init(&hetero_cpu);
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
> 
> A suggestion just in case:
> /*
>  * In the PPTT, CPUs below a node with the 'identical
>  * implementation' flag have the same number of threads.
>  * Count the number of threads for only one CPU (i.e.
>  * one core_id) among those with the same hetero_id.
>  *
>  * One entry is created for each node having:
>  * - the 'identical implementation' flag
>  * - its parent not having the flag
>  */
> 

ok maybe we can also refer to the comments of find_acpi_cpu_topology_hetero_id() [1] to lead
reader there if they want more details.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/acpi/pptt.c#n794

> 
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
>> @@ -67,6 +105,29 @@ int __init parse_acpi_topology(void)
>>           cpu_topology[cpu].package_id = topology_id;
>>       }
>>   +    /*
>> +     * This should be a short loop depending on the number of heterogeneous
>> +     * CPU clusters. Typically on a homogeneous system there's only one
>> +     * entry in the XArray.
>> +     */
> 
> I think it should be ok to remove the above/below comments
> 

I'd leave the above comment since this won't make people who are awared of the efficiency feel
nervous about the loop here...

will drop the below comment.

>> +    xa_for_each(&hetero_cpu, hetero_id, entry) {
>> +        /*
>> +         * If max_smt_thread_num has been initialized and doesn't match
>> +         * the thread number of this entry, then the system has
>> +         * heterogeneous SMT topology.
>> +         */
>> +        if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
>> +            pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
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
> Otherwise I tested the SMT detection and it worked well
> 

appreciated for the tests!

Thanks.




