Return-Path: <linuxppc-dev+bounces-4471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5546D9FBD54
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2024 13:31:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YHZ4M6nDjz2ypx;
	Tue, 24 Dec 2024 23:30:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735043459;
	cv=none; b=BsKN53YrTZCVzbSrvIrowvccs0Tl0Ef4oQi7/tXIE9t1cCSTZE2pABCzodSYdg4bHZzrZYp8vy0ghVlXZn2S5GjZKLQIMo8a95THo/7fT0a1jE8uJxdJ+SzhSdl2t4j8254Vns6Ruboh+utvZpPX9VaEcmdh6on/ndzYqNiMC6Mgay5Jb4mQLKbf+2YB8D3j6LWhxFgkAAm6vMqPGQ93lf1nlHbuIMdXgZj+B5ZTYVlKsku7qQVTxP1chvJhrg9c8eqG3qcf8s9e0W8ssH3dePluM1uFppZ4g19sKGoxJjIK8euoCOAsXu+5B/qyPGF15HwrlCtU74bAwFX3FAHf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735043459; c=relaxed/relaxed;
	bh=pyK847Wmcv0U9Ps0Ng/KwN1Jh+uUmUj7eSKq0lmRd6c=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=MdEKrgbzZqKq8KyunfuZAAcqNLfXAv3CryPm21q986rCSDnCzIq9QVBocK/ehInRAlUevaBuQG3L7rEDcipOoUmVPFsKaIHFm91y3jRG38Zrl/owZixxyfukvFaHR6Qa8kmZTJTJEb0PckDcuJAdQEABtBJvvbFeyytcuCEy3qzm0VVaso6BEUqBrKnp56tFwFcpPPxILkwijJ5c4F2k1OMFMZsJXGVCtq6gTfQysQq1YBfKmHaxypWpLt/5KIpw4GTmdLt/p/uZvEibXSpKEJ7Oo90kgci5A63DVXULJmRGqk5XehznPU/nRYa2s6+jK+TsCVEVGHZQii4yyGM01g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YHZ4K2lwZz2xfW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 23:30:52 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YHYzc5zfhz11N9f;
	Tue, 24 Dec 2024 20:26:52 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 9BFD81402C1;
	Tue, 24 Dec 2024 20:30:15 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 24 Dec 2024 20:30:14 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<sudeep.holla@arm.com>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<mpe@ellerman.id.au>, <linux-arm-kernel@lists.infradead.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<pierre.gondois@arm.com>, <dietmar.eggemann@arm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>
Subject: Re: [PATCH v10 3/4] arm64: topology: Support SMT control on ACPI
 based system
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
 <20241220075313.51502-4-yangyicong@huawei.com>
 <20241223164014.000032cc@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <a5dfbe0a-43aa-ee0d-fdb4-af2e2a2cc854@huawei.com>
Date: Tue, 24 Dec 2024 20:30:14 +0800
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
In-Reply-To: <20241223164014.000032cc@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-4.9 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/12/24 0:40, Jonathan Cameron wrote:
> On Fri, 20 Dec 2024 15:53:12 +0800
> Yicong Yang <yangyicong@huawei.com> wrote:
> 
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
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> 
> A few trivial things inline.  Either way it's fine as really just my style
> preferences
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
>> ---
>>  arch/arm64/kernel/topology.c | 66 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index 1a2c72f3e7f8..85cb18d72a29 100644
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
>> @@ -37,17 +39,28 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>>  	return !!is_threaded;
>>  }
>>  
>> +struct cpu_smt_info {
>> +	int thread_num;
>> +	int core_id;
>> +};
>> +
>>  /*
>>   * Propagate the topology information of the processor_topology_node tree to the
>>   * cpu_topology array.
>>   */
>>  int __init parse_acpi_topology(void)
>>  {
>> +	int max_smt_thread_num = 0;
>> +	struct cpu_smt_info *entry;
>> +	struct xarray hetero_cpu;
>> +	unsigned long hetero_id;
>>  	int cpu, topology_id;
>>  
>>  	if (acpi_disabled)
>>  		return 0;
>>  
>> +	xa_init(&hetero_cpu);
>> +
>>  	for_each_possible_cpu(cpu) {
>>  		topology_id = find_acpi_cpu_topology(cpu, 0);
>>  		if (topology_id < 0)
>> @@ -57,6 +70,32 @@ int __init parse_acpi_topology(void)
>>  			cpu_topology[cpu].thread_id = topology_id;
>>  			topology_id = find_acpi_cpu_topology(cpu, 1);
>>  			cpu_topology[cpu].core_id   = topology_id;
>> +
>> +			/*
>> +			 * In the PPTT, CPUs below a node with the 'identical
>> +			 * implementation' flag have the same number of threads.
>> +			 * Count the number of threads for only one CPU (i.e.
>> +			 * one core_id) among those with the same hetero_id.
>> +			 * See the comment of find_acpi_cpu_topology_hetero_id()
>> +			 * for more details.
>> +			 *
>> +			 * One entry is created for each node having:
>> +			 * - the 'identical implementation' flag
>> +			 * - its parent not having the flag
>> +			 */
>> +			hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
>> +			entry = (struct cpu_smt_info *)xa_load(&hetero_cpu, hetero_id);
> 
> Given xa_load returns a void *,
> 
> 			entry = xa_load(&hetero_cpu, hetero_id);
> 
> should be fine (I haven't checked local style, so feel free to ignore if
> local style is to cast anyway).  Maybe drag the definition of entry into
> a more local scope as well.
> 

sure. will get rid of the cast and checked it won't violate the local style.

> 
>> +			if (!entry) {
>> +				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
>> +				WARN_ON(!entry);
>> +
>> +				entry->core_id = topology_id;
>> +				entry->thread_num = 1;
>> +				xa_store(&hetero_cpu, hetero_id,
>> +					 entry, GFP_KERNEL);
>> +			} else if (entry->core_id == topology_id) {
>> +				entry->thread_num++;
>> +			}
>>  		} else {
>>  			cpu_topology[cpu].thread_id  = -1;
>>  			cpu_topology[cpu].core_id    = topology_id;
>> @@ -67,6 +106,33 @@ int __init parse_acpi_topology(void)
>>  		cpu_topology[cpu].package_id = topology_id;
>>  	}
>>  
>> +	/*
>> +	 * This should be a short loop depending on the number of heterogeneous
>> +	 * CPU clusters. Typically on a homogeneous system there's only one
>> +	 * entry in the XArray.
>> +	 */
>> +	xa_for_each(&hetero_cpu, hetero_id, entry) {
>> +		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
>> +			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
>> +
>> +		if (entry->thread_num > max_smt_thread_num)
>> +			max_smt_thread_num = entry->thread_num;
> 
> As with DT, maybe min is more informative?
> 
> 		max_smt_thread_num = min(max_smt_thread_num, entry->thread_num);
> 
> I don't care strongly about it though.

either's ok with me, will keep it consistent with DT.

Thanks.


