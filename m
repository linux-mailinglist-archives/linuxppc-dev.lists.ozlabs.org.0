Return-Path: <linuxppc-dev+bounces-168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 952D1956591
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 10:26:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnQg63PGBz2xwc;
	Mon, 19 Aug 2024 18:26:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnP8m5HxLz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 17:18:44 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WnP2q02Xfz1j6dL;
	Mon, 19 Aug 2024 15:13:39 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 1176114022E;
	Mon, 19 Aug 2024 15:18:37 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 19 Aug 2024 15:18:36 +0800
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <yangyicong@hisilicon.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>
Subject: Re: [PATCH v5 2/4] arch_topology: Support SMT control for OF based
 system
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
References: <20240806085320.63514-1-yangyicong@huawei.com>
 <20240806085320.63514-3-yangyicong@huawei.com>
 <a7636c4b-f449-4018-a890-08412e3ec779@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <85c1501c-f398-bf96-f8b9-383fbb32d12f@huawei.com>
Date: Mon, 19 Aug 2024 15:18:35 +0800
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
In-Reply-To: <a7636c4b-f449-4018-a890-08412e3ec779@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2024/8/16 23:55, Dietmar Eggemann wrote:
> On 06/08/2024 10:53, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> On building the topology from the devicetree, we've already
>> gotten the SMT thread number of each core. Update the largest
>> SMT thread number to enable the SMT control.
> 
> Do we have SMT Device Tree (DT) systems out there? But you right that DT
> at least supports SMT.
> 

My system's based on ACPI. For DT part it's emulated and tested on the QEMU VM.

>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  drivers/base/arch_topology.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>> index 75fcb75d5515..95513abd664f 100644
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
>> @@ -531,6 +532,16 @@ static int __init get_cpu_for_node(struct device_node *node)
>>  	return cpu;
>>  }
>>  
>> +static void __init update_smt_num_threads(unsigned int num_threads)
>> +{
>> +	static unsigned int max_smt_thread_num = 1;
>> +
>> +	if (num_threads > max_smt_thread_num) {
>> +		max_smt_thread_num = num_threads;
>> +		cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>> +	}
> 
> This could theoretically (unlikely though) call
> cpu_smt_set_num_threads() multiple times (on heterogeneous systems with
> different numbers of SMT threads).

Yes indeed. Was doing this purposely since I think this doing nothing unexpectedly but
only update the max threads recorded in the framework.

>> +}
>> +
>>  static int __init parse_core(struct device_node *core, int package_id,
>>  			     int cluster_id, int core_id)
>>  {
>> @@ -561,6 +572,8 @@ static int __init parse_core(struct device_node *core, int package_id,
>>  		i++;
>>  	} while (1);
>>  
>> +	update_smt_num_threads(i);
>> +
>>  	cpu = get_cpu_for_node(core);
>>  	if (cpu >= 0) {
>>  		if (!leaf) {
> 
> Why not simply do this:
> 
> -->8--
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 75fcb75d5515..806537419715 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -30,6 +30,7 @@ static struct cpumask scale_freq_counters_mask;
>  static bool scale_freq_invariant;
>  DEFINE_PER_CPU(unsigned long, capacity_freq_ref) = 1;
>  EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
> +static unsigned int max_smt_thread_num = 1;
>  

This fine with me and this avoid calling cpu_smt_set_num_threads() multiple
times. We can switch to this implementation.

Thanks.

>  static bool supports_scale_freq_counters(const struct cpumask *cpus)
>  {
> @@ -577,6 +578,9 @@ static int __init parse_core(struct device_node *core, int package_id,
>  		return -EINVAL;
>  	}
>  
> +	if (max_smt_thread_num < i)
> +		max_smt_thread_num = i;
> +
>  	return 0;
>  }
>  
> @@ -673,6 +677,9 @@ static int __init parse_socket(struct device_node *socket)
>  	if (!has_socket)
>  		ret = parse_cluster(socket, 0, -1, 0);
>  
> +	if (max_smt_thread_num > 1)
> +		cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> +
>  	return ret;
>  }
> 
> 
> .
> 

