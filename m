Return-Path: <linuxppc-dev+bounces-2546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F559AE93F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 16:48:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZ80k5DYVz2yst;
	Fri, 25 Oct 2024 01:48:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729781286;
	cv=none; b=Zj4NfMN2wzRD86ru7uQjUyKDH5Kp+F4qV6os4JNDlHRYCWVi5uvWZLwVpCSF+oV9q6rI4iwJzTAZNT/jmfViG0Yzr4Ifrf6+w0AGN109mND6JAQ1bXf3DhSg+Ogr8AOVEaLTlxsvPscAH8mvbV28kQeTlMNgd+wUb7KgS08sLYivhTs8cvfaTMgGU85GVnLaXXa+1zlXud+m5doL03oFAXj8PKuRWBRpoECOXYXjH3F6sxHKb0gZDEFY/bIHr3l8CR3h+7N9zlb1KUK9yF06CApglK4GnJxXCdttI1Vr+IAGwa9z9fVbCKMa1gi4XGaKqiLzdnqfzEuOni/9q988QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729781286; c=relaxed/relaxed;
	bh=dPMxLwUJByd18TzmUZrSBV36tIVKjbp0uOcWUHD+LJ8=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=cfIks0YxAKX9A4oUfj8+GQ/kws34cShOJnKctWi7JkJrR8TnrPy41LwZd8WmfHi/V2ER6/qAeQJ+plm1srJdR/smtkwAaZ6OkXm714G3NbTDa2/F36JA5J/Tufr/WfeRG5CECMx4I/jXh3B4a7XSL2LqNFyvx6ALVhUofLt+aAdRjUSIXVDee4Nk2R0hRxpiHqpk6LK5f36AIrwxQe+HUYUrcmzfM+/gmmOkxbAk4MeGBjFZmtiL+MikSF2bqb7FIL5RXAzyZlj7boBKHq8FHVQLN5bxZtxP2WnbskWK7985LopTNGwm41ZBBd9mDUC/WzkXeXHmSFCsuaYyyR7iUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZ80h5Dcyz2xyG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 01:48:01 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XZ7yr1dRZz2FbTS;
	Thu, 24 Oct 2024 22:46:28 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id DA6B914037C;
	Thu, 24 Oct 2024 22:47:52 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 24 Oct 2024 22:47:51 +0800
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <dietmar.eggemann@arm.com>,
	<yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v6 2/4] arch_topology: Support SMT control for OF based
 system
To: Pierre Gondois <pierre.gondois@arm.com>
References: <20241015021841.35713-1-yangyicong@huawei.com>
 <20241015021841.35713-3-yangyicong@huawei.com>
 <eb7ec4c3-5995-4040-8992-bb95f4b9f923@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <988be709-f2f5-9dbb-3f17-1fc45f665e58@huawei.com>
Date: Thu, 24 Oct 2024 22:47:51 +0800
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
In-Reply-To: <eb7ec4c3-5995-4040-8992-bb95f4b9f923@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-3.0 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/10/23 23:43, Pierre Gondois wrote:
> Hello Yicong,
> 
> On 10/15/24 04:18, Yicong Yang wrote:
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
>> ---
>>   drivers/base/arch_topology.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>> index 75fcb75d5515..5eed864df5e6 100644
>> --- a/drivers/base/arch_topology.c
>> +++ b/drivers/base/arch_topology.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/cleanup.h>
>>   #include <linux/cpu.h>
>>   #include <linux/cpufreq.h>
>> +#include <linux/cpu_smt.h>
>>   #include <linux/device.h>
>>   #include <linux/of.h>
>>   #include <linux/slab.h>
>> @@ -28,6 +29,7 @@
>>   static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
>>   static struct cpumask scale_freq_counters_mask;
>>   static bool scale_freq_invariant;
>> +static unsigned int max_smt_thread_num;
>>   DEFINE_PER_CPU(unsigned long, capacity_freq_ref) = 1;
>>   EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
>>   @@ -561,6 +563,17 @@ static int __init parse_core(struct device_node *core, int package_id,
>>           i++;
>>       } while (1);
>>   +    if (max_smt_thread_num < i)
>> +        max_smt_thread_num = i;
> 
> Shouldn't the conditions above/below be inverted ?
> I.e. (max_smt_thread_num != i) should never be true if there is
>   max_smt_thread_num = i;
> just before
> 

you're right. will get this fixed. thanks for catching this.

Thanks.

>> +
>> +    /*
>> +     * If max_smt_thread_num has been initialized and doesn't match
>> +     * the thread number of this entry, then the system has
>> +     * heterogeneous SMT topology.
>> +     */
>> +    if (max_smt_thread_num && max_smt_thread_num != i)
>> +        pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
>> +
>>       cpu = get_cpu_for_node(core);
>>       if (cpu >= 0) {
>>           if (!leaf) {
>> @@ -673,6 +686,14 @@ static int __init parse_socket(struct device_node *socket)
>>       if (!has_socket)
>>           ret = parse_cluster(socket, 0, -1, 0);
>>   +    /*
>> +     * Notify the CPU framework of the SMT support. A thread number of 1
>> +     * can be handled by the framework so we don't need to check
>> +     * max_smt_thread_num to see we support SMT or not.
>> +     */
>> +    if (max_smt_thread_num)
>> +        cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>> +
>>       return ret;
>>   }
>>   
> 
> .

