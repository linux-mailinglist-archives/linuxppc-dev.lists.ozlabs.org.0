Return-Path: <linuxppc-dev+bounces-4470-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6E39FBD40
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2024 13:23:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YHYvt5pvXz2ypP;
	Tue, 24 Dec 2024 23:23:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735043018;
	cv=none; b=ZHbZkWvAUIqmZKGDz6uGZwYarAUZjFNc8ZQGkp7/j5cBRvRRu9GxYqXdZZr6Bv5wbHEPMSmhWmGEP3AniWCVsh05/JepqEDQEKzHFR2KCADSPt9hw5BWn/Jyz4vYUsGp1PFsuZTFfRePsUam4TuflZ+FS/VNgdd72kqFMvRdqQSsMvLc8+3ycOMLAl8NkvfL/Qnbqh5Wam1IXsW/RifksHDkraNwW8tOd9AU5k5Q8Rk+QzIXCd+sAUFL5X1Q8i45RH10kxAQHiDfxnyCgsjJbB0+R7AjginzNz3szaLVdliicaDC8mqTmu2058lTEVvIQa6kSnmD7qfU0b2M6zlpjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735043018; c=relaxed/relaxed;
	bh=n5qB36iFGgyHNZMBvVhMrj/rWUJh7CUB/Bcb2dnXah4=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=iR7J2GiLkFMah2tDTSFjquqakxSQkusMunn50dvugdd6N7efZJK8ji8sVj+IQ7OKkh5oYCo3YQrRmDQfq5Q3gv+HLW5gHlGToMfZjvSYyA+UHsBKeBJEErXSCniXeIC2xlkADhe8R6h9qu61XZC4hHZQn9OGuVAgxPcMM7p1EXDrGagAOy1C4BKHvJP6c8XiZvRvkUWlCvbM785IvL9+xQtsHp7DFX3B8NB2YzAZ8KjBMJl3H6QAzX9yTeEeP0KSyrC7Ldm0ykUaR0aOwlb24zQLzdqVgwyjgwLb7fQy/cAK8CzOD67pTx9ARvGmiM14Cwf0zfQ+68K1EsXRfd4xQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YHYvr34Ptz2xfW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 23:23:35 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YHYw121gjz20mf9;
	Tue, 24 Dec 2024 20:23:45 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 964531400F4;
	Tue, 24 Dec 2024 20:23:25 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 24 Dec 2024 20:23:24 +0800
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
Subject: Re: [PATCH v10 2/4] arch_topology: Support SMT control for OF based
 system
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
 <20241220075313.51502-3-yangyicong@huawei.com>
 <20241223163314.00006fed@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <935a29ae-7bf4-fcaa-061c-8ff77e53385d@huawei.com>
Date: Tue, 24 Dec 2024 20:23:23 +0800
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
In-Reply-To: <20241223163314.00006fed@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-4.9 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/12/24 0:33, Jonathan Cameron wrote:
> On Fri, 20 Dec 2024 15:53:11 +0800
> Yicong Yang <yangyicong@huawei.com> wrote:
> 
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> On building the topology from the devicetree, we've already
>> gotten the SMT thread number of each core. Update the largest
>> SMT thread number and enable the SMT control by the end of
>> topology parsing.
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
> Hi Yicong,
> 
> Apologies that I'm late to the game on this one.
> 
> A few comments inline.  Only important one is whether to bail out early
> on error from parse_cluster()
> 

thanks for the comments.

> Thanks,
> 
> Jonathan
> 
> 
>> ---
>>  drivers/base/arch_topology.c | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>> index 3ebe77566788..9e81060144c7 100644
>> --- a/drivers/base/arch_topology.c
>> +++ b/drivers/base/arch_topology.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/cleanup.h>
>>  #include <linux/cpu.h>
>>  #include <linux/cpufreq.h>
>> +#include <linux/cpu_smt.h>
>>  #include <linux/device.h>
>>  #include <linux/of.h>
>>  #include <linux/slab.h>
>> @@ -506,6 +507,10 @@ core_initcall(free_raw_capacity);
>>  #endif
>>  
>>  #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
>> +
>> +/* Maximum SMT thread number detected used to enable the SMT control */
>> +static unsigned int max_smt_thread_num;
>> +
>>  /*
>>   * This function returns the logic cpu number of the node.
>>   * There are basically three kinds of return values:
>> @@ -565,6 +570,17 @@ static int __init parse_core(struct device_node *core, int package_id,
>>  		i++;
>>  	} while (1);
>>  
>> +	/*
>> +	 * If max_smt_thread_num has been initialized and doesn't match
>> +	 * the thread number of this entry, then the system has
>> +	 * heterogeneous SMT topology.
>> +	 */
>> +	if (max_smt_thread_num && max_smt_thread_num != i)
>> +		pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
>> +
>> +	if (max_smt_thread_num < i)
>> +		max_smt_thread_num = i;
> 
> Maybe more self documenting if you use min()? I'm not sure...
> 	max_smt_thread_num = min(max_smt_thread_num, i);
> 

sure, will use max_t here (since we'd like to know the maximum thread number).

> 
>> +
>>  	cpu = get_cpu_for_node(core);
>>  	if (cpu >= 0) {
>>  		if (!leaf) {
>> @@ -677,6 +693,16 @@ static int __init parse_socket(struct device_node *socket)
>>  	if (!has_socket)
>>  		ret = parse_cluster(socket, 0, -1, 0);
> 
> Is it appropriate to check ret before setting num threads?
> 	if (!has_socket) {
> 		ret = parse_cluster(socket, 0, -1, 0);
> 		if (ret)
> 			return ret;
> 	}
> ...
> 
> 	return 0;
> 

thanks for catching this. since we always need to notify the framework of
the SMT thread number if HOTPLUG_SMT selected, we should make it to 1 if
topology parsing failed. Since on failure the topology information will
be reset, a thread_number of 1 will be handled as SMT not supported.

>>  
>> +	/*
>> +	 * Notify the CPU framework of the SMT support. Initialize the
>> +	 * max_smt_thread_num to 1 if no SMT support detected. A thread
>> +	 * number of 1 can be handled by the framework so we don't need
>> +	 * to check max_smt_thread_num to see we support SMT or not.
>> +	 */
>> +	if (!max_smt_thread_num)
>> +		max_smt_thread_num = 1;
>> +
>> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> 
> Trivial but I'd put a blank line here.
> 

ok.

Thanks.


