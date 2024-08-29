Return-Path: <linuxppc-dev+bounces-730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6222E963D4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 09:41:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvY9y0QmSz2ysX;
	Thu, 29 Aug 2024 17:41:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.35
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724917270;
	cv=none; b=Xxrb9fvYXEdztI68jq6RJ7V7jsgVsZyULD7WPCyEOpPyFT+2MLjv8R3T4M5lozvTn34FucwXBRYroKP7k0uUW1AObL2qlv+oaV0/vLw18I9l54xEQNfOC51KhBPd7B0gh+myXzqRbIUUk0xMVw57lKtJ6DyQiwsgzGQ2AvFpQ/F5X+JzVYZRpNSuHnk+py0fEL98X3HHg59Vd2EiGn29PEig6pubMt6nTXpsqUzZi4FihhLkcKatVwbkWOuZ+EdXSCsqjChtC/yRdtirnojHsqU/J2FQVKkKjj4EbsxXHirSdQ2SOMg7XCKvH3EbsgWOqt7ZNGuSXOZnRTeBERA5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724917270; c=relaxed/relaxed;
	bh=3iFQa9kJ3PswvWVqK5tZxvoWbvx22/tV2OovzPmhG4o=;
	h=Received:Received:Received:CC:Subject:To:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy; b=VeXasYGL1G/quX1nJVG1UT+uSs4peYqWZfenN3u9JC3m/P5Ub24/VPC61WzaV3QBh5tuyrJPHPLQAryGgwFvCCGaPj7mnmVYzj7jonOnigH+4pSHNe3f+NlWeTwvz269z/yMawyWNpgnnINzj0hBasNPWObOiQMSOAcONTajTzdpg97IlSba6EUijwh1ar2rHcORAu4yIEZk9rAvV/Lm+Z7cSCccwaK7e96u3pSvEPpww54jSbOo8TfdS8TNRMMfsJ8TLBBY+ognWF7VYSdN9pzEidKQh2iaQTMK4dedwZXYqlh1C0DEC1z9Dt5F0Yqld1d7IXrZh5PQt/sNXRS7vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvY9w5jzyz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 17:41:05 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WvY9R35lhz1S9NC;
	Thu, 29 Aug 2024 15:40:43 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 6E2971A0188;
	Thu, 29 Aug 2024 15:40:56 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 29 Aug 2024 15:40:55 +0800
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
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <00e6110a-462a-c117-0292-e88b57d27a05@huawei.com>
Date: Thu, 29 Aug 2024 15:40:54 +0800
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
In-Reply-To: <a998c723-7451-439a-9c88-7c8b5c1b890b@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)

Hi Pierre,

On 2024/8/27 23:40, Pierre Gondois wrote:
> Hello Yicong,
> IIUC we are looking for the maximum number of threads a CPU can have
> in the platform. But is is actually possible to have a platform with
> CPUs not having the same number of threads ?
> 

I was thinking of the heterogenous platforms, for example part of the
cores have SMT and others don't (I don't have any though, but there
should be some such platforms for arm64).

> For instance kernel/cpu.c::cpu_smt_num_threads_valid() will check
> that the number of threads is either 1 or cpu_smt_max_threads (as
> CONFIG_SMT_NUM_THREADS_DYNAMIC is not enabled for arm64). However
> a (hypothetical) platform with:
> - CPU0: 2 threads
> - CPU1: 4 threads
> should not be able to set the number of threads to 2, as
> 1 < 2 < cpu_smt_max_threads (cf. cpu_smt_num_threads_valid()).
> 

It's a bit more complex. If we enable/disable the SMT using on/off control
then we won't have this problem. We'll online all the CPUs on enabling and
offline CPUs which is not primary thread and don't care about the thread
number of each core.

Control using thread number is introduced by CONFIG_SMT_NUM_THREADS_DYNAMIC
and only enabled on powerpc. I think this interface is not enough to handle
the hypothetical we assumed, since it assumes the homogenous platform that
all the CPUs have the same thread number. But this should be fine for
the platforms with SMT(with same thread number) and non-SMT cores, since it do
indicates the real thread number of the SMT cores.

> So if there is an assumption that all the CPUs have the same number of
> threads, it should be sufficient to count the number of threads for one
> CPU right ?
> 

Naturally and conveniently I may think use of the threads number of CPU0 (boot
cpu) in such a solution. But this will be wrong if CPU0 is non-SMT on a heterogenous
platform :(

> In the other (unlikely) case (i.e. CPUs can have various number of threads),
> I think we should either:
> - use your method and check that all the CPUs have the same number of threads
> - get the number of threads for one CPU and check that all the CPUs are
>    identical using the ACPI_PPTT_ACPI_IDENTICAL tag

I think this won't be simpler since we still need to iterate all the CPUs to see
if they have the same hetero_id (checked how we're using this ACPI tag in
arm_acpi_register_pmu_device()). We could already know if they're identical by
comparing the thread number and do the update if necessary.

> - have a per-cpu cpu_smt_max_threads value ?

This should be unnecessary in currently stage if there's no platforms
with several kind cores have different thread number like in your assumption
and enable CONFIG_SMT_NUM_THREADS_DYNAMIC on such platforms. Otherwise using
a global cpu_smt_max_threads to enable the SMT control should be enough.
Does it make sense?

Thanks,
Yicong

> 
> Same comment for the DT patch. If there is an assumption that all CPUs have
> the same number of threads, then update_smt_num_threads() could only be called
> once I suppose,
> 
> Regards,
> Pierre
> 
> 
> On 8/6/24 10:53, Yicong Yang wrote:
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
>>   arch/arm64/kernel/topology.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index 1a2c72f3e7f8..f72e1e55b05e 100644
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
>> @@ -43,11 +45,16 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>>    */
>>   int __init parse_acpi_topology(void)
>>   {
>> +    int thread_num, max_smt_thread_num = 1;
>> +    struct xarray core_threads;
>>       int cpu, topology_id;
>> +    void *entry;
>>         if (acpi_disabled)
>>           return 0;
>>   +    xa_init(&core_threads);
>> +
>>       for_each_possible_cpu(cpu) {
>>           topology_id = find_acpi_cpu_topology(cpu, 0);
>>           if (topology_id < 0)
>> @@ -57,6 +64,20 @@ int __init parse_acpi_topology(void)
>>               cpu_topology[cpu].thread_id = topology_id;
>>               topology_id = find_acpi_cpu_topology(cpu, 1);
>>               cpu_topology[cpu].core_id   = topology_id;
>> +
>> +            entry = xa_load(&core_threads, topology_id);
>> +            if (!entry) {
>> +                xa_store(&core_threads, topology_id,
>> +                     xa_mk_value(1), GFP_KERNEL);
>> +            } else {
>> +                thread_num = xa_to_value(entry);
>> +                thread_num++;
>> +                xa_store(&core_threads, topology_id,
>> +                     xa_mk_value(thread_num), GFP_KERNEL);
>> +
>> +                if (thread_num > max_smt_thread_num)
>> +                    max_smt_thread_num = thread_num;
>> +            }
>>           } else {
>>               cpu_topology[cpu].thread_id  = -1;
>>               cpu_topology[cpu].core_id    = topology_id;
>> @@ -67,6 +88,9 @@ int __init parse_acpi_topology(void)
>>           cpu_topology[cpu].package_id = topology_id;
>>       }
>>   +    cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>> +
>> +    xa_destroy(&core_threads);
>>       return 0;
>>   }
>>   #endif
> 
> .

