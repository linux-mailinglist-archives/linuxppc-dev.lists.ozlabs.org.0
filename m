Return-Path: <linuxppc-dev+bounces-6653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A23C3A4C3AB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 15:42:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z61kg2GWwz30Yb;
	Tue,  4 Mar 2025 01:42:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741012971;
	cv=none; b=BBtnW/6oO5kjZyCFZuzLsubiunfYUIL1urNLjGmO22G+x99mNkaPp2e5eQXNciCHN8uDKc/uiyHntzZb8UIZZlrjQq4425v334fcxIx04Z4pXRcvUN8+S1dV7J31W2588CxViFJvy+p7SdXSf7wfIkBZR1zlMWutPfySq7ie6P3+/JR1vmGCQAtb4eHPOG+qCqIFR+4TBRS9aXoGf9RS/jdl6nz7ZvFO0HNWIGeQD0HdflZKPJw/jM/Vwpr/CJ7wsK2fahvrxPy+yyhbSDNNUnuj/owqRnGbTz6V2+Ar8J1ldoNROjEMKKgrYA/Yku0kGabKuZmL7SWRfX6z5iX+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741012971; c=relaxed/relaxed;
	bh=3EZS2ejN/6IHQgzRU3+5eiINWlW/7ry7xdj6V0o4hnM=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kEvZv49H4X3LUHi5R+RoICnEHo2+fQV5RD15FVuLnd0vGvw3j/NArF3Jg6U7xCV0MAu9DshWSylm9vbVsUuCZhwS2XUwFmmpA0EuliHUQeEXccdzg3O6t1SnbtGoqeiL8S/joC19ryOlDGhvKqrmnEdtG7BpGbazJsz5jF0nINuN63J1V+S9Z0+EnBw4CsPASVzkJoIqXHam2QFt5I/RSLOX3B19108nNRI6gQOiNoN0pjuN0rsiJhx1gPUj6L4h5CmcPJLmDAUzslAFufh/l5zK0wM3n4X3WmQ+UAImVDd2Is25RlkrHFnIFRhxui7l7l5Yq/EyfhumGbDnk3BtEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z61kZ3XSKz30WS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 01:42:46 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Z61fM48jHzCs7q;
	Mon,  3 Mar 2025 22:39:07 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A0071401F0;
	Mon,  3 Mar 2025 22:42:36 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 3 Mar 2025 22:42:35 +0800
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, <yangyicong@hisilicon.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
To: Hanjun Guo <guohanjun@huawei.com>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com>
 <92193a09-271e-895e-f77f-d3952bdfdf49@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <5f56d0fc-7ca8-cc52-9747-aec981e42bdc@huawei.com>
Date: Mon, 3 Mar 2025 22:42:34 +0800
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
In-Reply-To: <92193a09-271e-895e-f77f-d3952bdfdf49@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-2.4 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025/2/25 14:08, Hanjun Guo wrote:
> On 2025/2/18 22:10, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> For ACPI we'll build the topology from PPTT and we cannot directly
>> get the SMT number of each core. Instead using a temporary xarray
>> to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
>> and SMT information of the first core in its heterogeneous CPU cluster
>> when building the topology. Then we can know the largest SMT number
>> in the system. If a homogeneous system's using ACPI 6.2 or later,
>> all the CPUs should be under the root node of PPTT. There'll be
>> only one entry in the xarray and all the CPUs in the system will
>> be assumed identical.
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
>>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   arch/arm64/kernel/topology.c | 66 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index 1a2c72f3e7f8..6eba1ac091ee 100644
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
>> @@ -37,17 +39,28 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>>       return !!is_threaded;
>>   }
>>   +struct cpu_smt_info {
>> +    unsigned int thread_num;
>> +    int core_id;
>> +};
>> +
>>   /*
>>    * Propagate the topology information of the processor_topology_node tree to the
>>    * cpu_topology array.
>>    */
>>   int __init parse_acpi_topology(void)
>>   {
>> +    unsigned int max_smt_thread_num = 0;
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
>> @@ -57,6 +70,34 @@ int __init parse_acpi_topology(void)
>>               cpu_topology[cpu].thread_id = topology_id;
>>               topology_id = find_acpi_cpu_topology(cpu, 1);
>>               cpu_topology[cpu].core_id   = topology_id;
>> +
>> +            /*
>> +             * In the PPTT, CPUs below a node with the 'identical
>> +             * implementation' flag have the same number of threads.
>> +             * Count the number of threads for only one CPU (i.e.
>> +             * one core_id) among those with the same hetero_id.
>> +             * See the comment of find_acpi_cpu_topology_hetero_id()
>> +             * for more details.
>> +             *
>> +             * One entry is created for each node having:
>> +             * - the 'identical implementation' flag
>> +             * - its parent not having the flag
>> +             */
>> +            hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
>> +            entry = xa_load(&hetero_cpu, hetero_id);
>> +            if (!entry) {
>> +                entry = kzalloc(sizeof(*entry), GFP_KERNEL);
>> +                WARN_ON_ONCE(!entry);
>> +
>> +                if (entry) {
>> +                    entry->core_id = topology_id;
>> +                    entry->thread_num = 1;
>> +                    xa_store(&hetero_cpu, hetero_id,
>> +                         entry, GFP_KERNEL);
>> +                }
>> +            } else if (entry->core_id == topology_id) {
>> +                entry->thread_num++;
>> +            }
>>           } else {
>>               cpu_topology[cpu].thread_id  = -1;
>>               cpu_topology[cpu].core_id    = topology_id;
>> @@ -67,6 +108,31 @@ int __init parse_acpi_topology(void)
>>           cpu_topology[cpu].package_id = topology_id;
>>       }
>>   +    /*
>> +     * This should be a short loop depending on the number of heterogeneous
>> +     * CPU clusters. Typically on a homogeneous system there's only one
>> +     * entry in the XArray.
>> +     */
>> +    xa_for_each(&hetero_cpu, hetero_id, entry) {
>> +        if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
>> +            pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
>> +
>> +        max_smt_thread_num = max(max_smt_thread_num, entry->thread_num);
>> +        xa_erase(&hetero_cpu, hetero_id);
>> +        kfree(entry);
>> +    }
>> +
>> +    /*
>> +     * Notify the CPU framework of the SMT support. Initialize the
>> +     * max_smt_thread_num to 1 if no SMT support detected. A thread
>> +     * number of 1 can be handled by the framework so we don't need
>> +     * to check max_smt_thread_num to see we support SMT or not.
>> +     */
>> +    if (!max_smt_thread_num)
>> +        max_smt_thread_num = 1;
>> +
>> +    cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>> +    xa_destroy(&hetero_cpu);
>>       return 0;
>>   }
>>   #endif
> 
> Looks good to me,
> 
> Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
> 

Thanks a lot for taking a look :)



