Return-Path: <linuxppc-dev+bounces-4469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 056C09FBD2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2024 13:16:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YHYl00sWJz2y92;
	Tue, 24 Dec 2024 23:15:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735042556;
	cv=none; b=bC6sS8siBpC8KUNWJXRdX0AHY/TnIM5/A7LLo9SFjPBfyDSK6MX276Akcf9tBgTKXNzoPSEu8OdLAECfxa/oamEFsBStpbf+uBsXnJA1MTmf2lKtkhxEmCZxwFXRoLjt58x/uCpztq8F7ADliiMBx5DZVco2FauB75l2a/ejGg4hSPjdocCoBn9mbYyXiFBZVbFeFgZGu+awJIUBrNMEbfCCumHRAiKl9tvxFd2ViPr7ixXNel69/R5YX3aiLwofROBvptrXBTH+d6/f8hb5VZtt6crCJMeFCuoiVsFT016jOFgOtELkeR5Is7f9YZKVX1NaUYrYahXXJdiA7zgotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735042556; c=relaxed/relaxed;
	bh=ExatVwjz/cALIX/NY3zMC3cZmTKBL1fAABq9aj/0jns=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=SJBejobAAsVnuKiUruYpLR/uuYqZ2n+b2hUScwlpXiyFbJI8iqvj91vFUTATuTzEZ6RznyD9MgxAIOKa4S7b2WCdIzd3Kmjz7tq24OWgoiq9HBRVe7xoMpXAwxta50k8a2EgNFiwe0E+a+2tHr3ZMyDYaCCt8PwT1qITdrcNJGt4A5imV9tFXORmuZxWfdfG3CAYaKg7fpk27gukop+T02OMcgwiTa1V5/r21berm+IeqWi4Xf92z4tDT2C5kpNrlspsB84nllT70UkFdogFviX4/tPc3feguBmWeuVMYfY8qbufUv9Y/OWpiNF7tJe5pmaObuVDtgw2WRTnSbST2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YHYkx08jzz2x9W
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 23:15:49 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YHYhR3MgXz22jdR;
	Tue, 24 Dec 2024 20:13:43 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 65F061A0188;
	Tue, 24 Dec 2024 20:15:42 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 24 Dec 2024 20:15:41 +0800
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
Subject: Re: [PATCH v10 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
 <20241220075313.51502-2-yangyicong@huawei.com>
 <a5690fee-3019-f26c-8bad-1d95e388e877@huawei.com>
 <20241223163448.00004354@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <0f487c7e-0a03-e0b8-8bf6-0eebfe582bad@huawei.com>
Date: Tue, 24 Dec 2024 20:15:40 +0800
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
In-Reply-To: <20241223163448.00004354@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-4.9 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/12/24 0:34, Jonathan Cameron wrote:
> On Fri, 20 Dec 2024 15:59:27 +0800
> Yicong Yang <yangyicong@huawei.com> wrote:
> 
>> On 2024/12/20 15:53, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>
>>> Currently if architectures want to support HOTPLUG_SMT they need to
>>> provide a topology_is_primary_thread() telling the framework which
>>> thread in the SMT cannot offline. However arm64 doesn't have a
>>> restriction on which thread in the SMT cannot offline, a simplest
>>> choice is that just make 1st thread as the "primary" thread. So
>>> just make this as the default implementation in the framework and
>>> let architectures like x86 that have special primary thread to
>>> override this function (which they've already done).
>>>
>>> There's no need to provide a stub function if !CONFIG_SMP or
>>> !CONFIG_HOTPLUG_SMP. In such case the testing CPU is already
>>> the 1st CPU in the SMT so it's always the primary thread.
>>>
>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>> ---
>>> As questioned in v9 [1] whether this works on architectures not using
>>> CONFIG_GENERIC_ARCH_TOPOLOGY, hacked on LoongArch VM and this also works.
>>> Architectures should use this on their own situation.
>>> [1] https://lore.kernel.org/linux-arm-kernel/427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com/
>>>
>>> [root@localhost smt]# uname -m
>>> loongarch64
>>> [root@localhost smt]# pwd
>>> /sys/devices/system/cpu/smt
>>> [root@localhost smt]# cat ../possible 
>>> 0-3
>>> [root@localhost smt]# cat ../online 
>>> 0-3
>>> [root@localhost smt]# cat control 
>>> on
>>> [root@localhost smt]# echo off > control 
>>> [root@localhost smt]# cat control 
>>> off
>>> [root@localhost smt]# cat ../online 
>>> 0,2
>>> [root@localhost smt]# echo on > control 
>>> [root@localhost smt]# cat control 
>>> on
>>> [root@localhost smt]# cat ../online 
>>> 0-3  
>>
>> Tested with below code using the topology_is_primary_thread() introduced
>> in this patch. Tested on an ACPI-based QEMU VM emulating SMT2.
> Nice bit of testing.
> 
> Given it all seems fine. FWIW
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> (for original patch, not the longarch one!)

thanks. certainly :)

> 
>>
>> Subject: [PATCH] LoongArch: Support HOTPLUG_SMT on ACPI-based system
>>
>> Support HOTPLUG_SMT on ACPI-based system using generic
>> topology_is_primary_thread().
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  arch/loongarch/Kconfig       |  1 +
>>  arch/loongarch/kernel/acpi.c | 26 ++++++++++++++++++++++++--
>>  2 files changed, 25 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index dae3a9104ca6..bed1b0640b97 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -172,6 +172,7 @@ config LOONGARCH
>>  	select HAVE_SYSCALL_TRACEPOINTS
>>  	select HAVE_TIF_NOHZ
>>  	select HAVE_VIRT_CPU_ACCOUNTING_GEN if !SMP
>> +	select HOTPLUG_SMT if HOTPLUG_CPU
>>  	select IRQ_FORCED_THREADING
>>  	select IRQ_LOONGARCH_CPU
>>  	select LOCK_MM_AND_FIND_VMA
>> diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
>> index 382a09a7152c..e642b0de57e7 100644
>> --- a/arch/loongarch/kernel/acpi.c
>> +++ b/arch/loongarch/kernel/acpi.c
>> @@ -15,9 +15,11 @@
>>  #include <linux/memblock.h>
>>  #include <linux/of_fdt.h>
>>  #include <linux/serial_core.h>
>> +#include <linux/xarray.h>
>>  #include <asm/io.h>
>>  #include <asm/numa.h>
>>  #include <asm/loongson.h>
>> +#include <linux/cpu_smt.h>
>>
>>  int acpi_disabled;
>>  EXPORT_SYMBOL(acpi_disabled);
>> @@ -175,8 +177,12 @@ int pptt_enabled;
>>
>>  int __init parse_acpi_topology(void)
>>  {
>> +	int thread_num, max_smt_thread_num = 1;
>> +	struct xarray core_threads;
>>  	int cpu, topology_id;
>> +	void *entry;
>>
>> +	xa_init(&core_threads);
>>  	for_each_possible_cpu(cpu) {
>>  		topology_id = find_acpi_cpu_topology(cpu, 0);
>>  		if (topology_id < 0) {
>> @@ -184,19 +190,35 @@ int __init parse_acpi_topology(void)
>>  			return -ENOENT;
>>  		}
>>
>> -		if (acpi_pptt_cpu_is_thread(cpu) <= 0)
>> +		if (acpi_pptt_cpu_is_thread(cpu) <= 0) {
>>  			cpu_data[cpu].core = topology_id;
>> -		else {
>> +		} else {
>>  			topology_id = find_acpi_cpu_topology(cpu, 1);
>>  			if (topology_id < 0)
>>  				return -ENOENT;
>>
>>  			cpu_data[cpu].core = topology_id;
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
>>  		}
>>  	}
>>
>>  	pptt_enabled = 1;
>>
>> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>> +	xa_destroy(&core_threads);
>>  	return 0;
>>  }
>>
> 
> .
> 

