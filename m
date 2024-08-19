Return-Path: <linuxppc-dev+bounces-165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DFA95643C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 09:18:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnP8q0D6vz2xs7;
	Mon, 19 Aug 2024 17:18:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnNqD3k1rz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 17:03:31 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WnNnG5bhFzpTMS;
	Mon, 19 Aug 2024 15:01:54 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id D883C180101;
	Mon, 19 Aug 2024 15:03:22 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 19 Aug 2024 15:03:21 +0800
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <yangyicong@hisilicon.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>
Subject: Re: [PATCH v5 3/4] arm64: topology: Support SMT control on ACPI based
 system
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
References: <20240806085320.63514-1-yangyicong@huawei.com>
 <20240806085320.63514-4-yangyicong@huawei.com>
 <ec8c46f2-d819-43d7-a866-d272169178d3@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <04ed0569-5026-9c4f-b09f-3e8798d5b551@huawei.com>
Date: Mon, 19 Aug 2024 15:03:21 +0800
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
In-Reply-To: <ec8c46f2-d819-43d7-a866-d272169178d3@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2024/8/16 23:55, Dietmar Eggemann wrote:
> On 06/08/2024 10:53, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> For ACPI we'll build the topology from PPTT and we cannot directly
>> get the SMT number of each core. Instead using a temporary xarray
>> to record the SMT number of each core when building the topology
>> and we can know the largest SMT number in the system. Then we can
>> enable the support of SMT control.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  arch/arm64/kernel/topology.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index 1a2c72f3e7f8..f72e1e55b05e 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -15,8 +15,10 @@
>>  #include <linux/arch_topology.h>
>>  #include <linux/cacheinfo.h>
>>  #include <linux/cpufreq.h>
>> +#include <linux/cpu_smt.h>
>>  #include <linux/init.h>
>>  #include <linux/percpu.h>
>> +#include <linux/xarray.h>
>>  
>>  #include <asm/cpu.h>
>>  #include <asm/cputype.h>
>> @@ -43,11 +45,16 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>>   */
>>  int __init parse_acpi_topology(void)
>>  {
>> +	int thread_num, max_smt_thread_num = 1;
>> +	struct xarray core_threads;
>>  	int cpu, topology_id;
>> +	void *entry;
>>  
>>  	if (acpi_disabled)
>>  		return 0;
>>  
>> +	xa_init(&core_threads);
>> +
>>  	for_each_possible_cpu(cpu) {
>>  		topology_id = find_acpi_cpu_topology(cpu, 0);
>>  		if (topology_id < 0)
>> @@ -57,6 +64,20 @@ int __init parse_acpi_topology(void)
>>  			cpu_topology[cpu].thread_id = topology_id;
>>  			topology_id = find_acpi_cpu_topology(cpu, 1);
>>  			cpu_topology[cpu].core_id   = topology_id;
>> +
>> +			entry = xa_load(&core_threads, topology_id);
>> +			if (!entry) {
>> +				xa_store(&core_threads, topology_id,
>> +					 xa_mk_value(1), GFP_KERNEL);
>> +			} else {
>> +				thread_num = xa_to_value(entry);
>> +				thread_num++;
>> +				xa_store(&core_threads, topology_id,
>> +					 xa_mk_value(thread_num), GFP_KERNEL);
>> +
>> +				if (thread_num > max_smt_thread_num)
>> +					max_smt_thread_num = thread_num;
>> +			}
> 
> So the xarray contains one element for each core_id with the information
> how often the core_id occurs? I assume you have to iterate over all
> possible CPUs since you don't know which logical CPUs belong to the same
> core_id.
> 

Each xarray element counts the thread number of a certain core id. so the logic is like below:
1. if the "core id" entry doesn't exists, then we're accessing this core for the 1st time. create
   one and make the thread number to 1
2. otherwise increment the thread number of "core id" this cpu belongs (PPTT already
   told us which core this CPU belongs to). Update the max_smt_thread_num if necessary.

Then we can know max_smt_thread_num by meanwhile iterating the PPTT table and
build the topology for all the possible CPUs.

Otherwise we need to do a second scan for the max thread number after built the
topology. This way is implemented in v1 and it's complained about the overhead on large
scale systems since we need to loop the CPUs twice.

>>  		} else {
>>  			cpu_topology[cpu].thread_id  = -1;
>>  			cpu_topology[cpu].core_id    = topology_id;
>> @@ -67,6 +88,9 @@ int __init parse_acpi_topology(void)
>>  		cpu_topology[cpu].package_id = topology_id;
>>  	}
>>  
>> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>> +
>> +	xa_destroy(&core_threads);
>>  	return 0;
>>  }
>>  #endif
> 
> Tested on ThunderX2:
> 
> $ cat /proc/schedstat | head -6 | tail -4 | awk '{ print $1, $2 }'
> cpu0 0
> domain0 00000000,00000000,00000000,00000000,00000001,00000001,00000001,00000001
>                                                    ^        ^        ^        ^
> domain1 00000000,00000000,00000000,00000000,ffffffff,ffffffff,ffffffff,ffffffff
> domain2 ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
> 
> detecting 'max_smt_thread_num = 4' correctly.
> 

Thanks for the testing. ok for a tag?

Thanks.


