Return-Path: <linuxppc-dev+bounces-3031-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4189C1771
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 09:07:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlBP426xsz3brr;
	Fri,  8 Nov 2024 19:07:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.255
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731053224;
	cv=none; b=ohCVSfIlqww4QvSyuSaY7L4xsOObLvzCam5XgULMA9tiZcMBIyLxoeeqwX21V6JjlZCWuK8anp8A8TvQ1HRVULwDo11o830smVrvwV0NIiqCTbsCI4ZeMJiFIHmrpnLzEfTpOwNEGDM5p74LlGfbU5oMtT35i7qANnWh4/OIS477a0796DRAQdriBij4BtghKMGwsAWiyakCMRoIVNYNLdHlhfz2hdBnmoXXc3kdENYqAnoozuARdnNCojwIsnUV+TI4P7ZMaldSQnAESsd7f1WxDD+6QPQ5at+ByMuoRi4eOoLmBMO8co/UvBPmAVHtWXFo2LD+C+GpyhYOI1QRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731053224; c=relaxed/relaxed;
	bh=syaFfjwerqR8utu0oNjnVZRq4peXobeHGKBHeZI/wa8=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DnVk8chmhJ3qEXVYXd6asa2Y88uUz1G+hhloEOJUTPXm/BQYttaDbMW9xDcVtdb282OCx0YevIj4UJjAZpbiEbW5h8H9TPavuAweg+b9VMu0JoWRAIhKHXuS9XvHQW44cedvNcUjJwtvs8UsqBGQn2iLCAHFQFdGo9JXd6rr7Eep2Nt77PHBT2Xv67hZjV43AGeFptfCabL3vnzYYIu0X2IHTeX4a+FJ5TwZ+yLvDS5JsoL8rxCpTzOhj2ThGWIS5EOi6/PO3uwMtDge1JaUoOwyTUbrfwpOz5tq+sA+0ytk1Im/it8BFCaAbgyKtjE/NoNdWNFiC4oUBquXWtwmwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlBP20Ry9z3brZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 19:06:58 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XlBL52N1bz1T9sv;
	Fri,  8 Nov 2024 16:04:29 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id BB09B1800D9;
	Fri,  8 Nov 2024 16:06:51 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 8 Nov 2024 16:06:50 +0800
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <dietmar.eggemann@arm.com>,
	<yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v7 3/4] arm64: topology: Support SMT control on ACPI based
 system
To: Pierre Gondois <pierre.gondois@arm.com>
References: <20241030125415.18994-1-yangyicong@huawei.com>
 <20241030125415.18994-4-yangyicong@huawei.com>
 <63792865-46ad-44a5-a1f2-9a17da5b4bfc@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <93a8b799-dfd9-5ffa-37ca-e7cd4a82e70e@huawei.com>
Date: Fri, 8 Nov 2024 16:06:50 +0800
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
In-Reply-To: <63792865-46ad-44a5-a1f2-9a17da5b4bfc@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-3.0 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/11/8 1:20, Pierre Gondois wrote:
> 
> 
> On 10/30/24 13:54, Yicong Yang wrote:
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
>> ---
>>   arch/arm64/kernel/topology.c | 57 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>

[...]

>> @@ -67,6 +106,24 @@ int __init parse_acpi_topology(void)
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
>> +        if (entry->thread_num > max_smt_thread_num)
>> +            max_smt_thread_num = entry->thread_num;
>> +
>> +        xa_erase(&hetero_cpu, hetero_id);
>> +        kfree(entry);
>> +    }
> 
> I think you need to check that max_smt_thread_num !=0,
> like in the DT path. Otherwise on a platform with no SMT,
> max_smt_thread_num = 0 and I hit:
> 
> kernel/cpu::cpu_smt_set_num_threads()
> WARN_ON(!num_threads || (num_threads > max_threads));
> 
> 
> ->
> if (max_smt_thread_num)
>     cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> 

sorry for this silly mistake. yes we should do the same like in the DT path.
I'll get this fixed. thanks for testing.

>> +
>> +    cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>> +    xa_destroy(&hetero_cpu);
>>       return 0;
>>   }
>>   #endif
> 
> .

