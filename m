Return-Path: <linuxppc-dev+bounces-6646-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8823CA4C213
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 14:35:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z60FM6MVGz2xS6;
	Tue,  4 Mar 2025 00:35:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741008951;
	cv=none; b=DjFJyaYuI+bTMDL+WeCQ3UdPdG9GOnE4wnU7zfoVVUdQ/pCTQhV2hch+xcBbd00NuUCYydLZbj6Cygp5/IStuVuRviiuQ3uSsSWkdSDl6vddRTfUzBkfoYcktnUNupRzC2ZSKGa4Z/1frtuBeUjVIIdEnzXSiiLn2f1EUm8zFgJxDjhYrgLYFh3GMlCvXzZeh1ujWmXdzW5XEv1oJkXVvfMr6SbBLg8dN43gDQ0Tu81Xil7NIvVYKiotaqb/SAyf5DvJD9aKTavHNt4Qxcf71M00Cl3UczZkKrCbW5AHPStijzcoqXI9XPcdvQOQdc4hf3cdgFa6JOZM9gjOlt5aWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741008951; c=relaxed/relaxed;
	bh=+NvbYf7uxpFxnfAxigPzbutqxrbeU3zLcuZDwWkiTBE=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=J5xNItDczUIeQEef6kfJ7QsTdFk1eZKJlN21+FQ92BWFt015ZzJwfF+4WStKv9kpamcjozVR/IszV9Rc2hIYXb7bLJLcHO0hvXX9/l5d/esVQ1iqgby0klcXydlkxL9EnX1wINqwJe8XWIOS/7+s+NNCgGlAWWLnKxK4LFBvZ12JhXRqYFGdFgxVMMFqxl3NdvowoiqxNe75dbiQv9MT1hCoIMkr6iC/wkXRYkW9VUGfQ/TpAUvz1rF5R8bgaKv4BXjGRjOHKAEC61wMwKOPR9udtD+NCzA8e2PR4e+dXAmlRadZLjVOCRUZq+1un0i18c/VazryvTqwsYsy2+GfzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z60FL3MNDz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 00:35:47 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Z609V2G7zz9wF9;
	Mon,  3 Mar 2025 21:32:30 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A48E14037B;
	Mon,  3 Mar 2025 21:35:37 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 3 Mar 2025 21:35:36 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Dietmar Eggemann <dietmar.eggemann@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <sudeep.holla@arm.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-2-yangyicong@huawei.com>
 <e3607ed0-bdf5-4fef-8731-b81fae649312@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <af8d364e-a5e0-decb-4463-fd6b7c54a0d9@huawei.com>
Date: Mon, 3 Mar 2025 21:35:35 +0800
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
In-Reply-To: <e3607ed0-bdf5-4fef-8731-b81fae649312@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-2.4 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025/2/28 19:10, Dietmar Eggemann wrote:
> On 18/02/2025 15:10, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> [...]
> 
>> diff --git a/include/linux/topology.h b/include/linux/topology.h
>> index 52f5850730b3..b3aba443c4eb 100644
>> --- a/include/linux/topology.h
>> +++ b/include/linux/topology.h
>> @@ -240,6 +240,28 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>>  }
>>  #endif
>>  
>> +#ifndef topology_is_primary_thread
>> +
>> +#define topology_is_primary_thread topology_is_primary_thread
>> +
>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>> +{
>> +	/*
>> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
>> +	 * Architectures do have a special primary thread (e.g. x86) need
>> +	 * to override this function. Otherwise just make the first thread
>> +	 * in the SMT as the primary thread.
>> +	 *
>> +	 * The sibling cpumask of an offline CPU contains always the CPU
>> +	 * itself for architectures using CONFIG_GENERIC_ARCH_TOPOLOGY.
>> +	 * Other architectures should use this depend on their own
>> +	 * situation.
> 
> This sentence is hard to get. Do you want to say that other
> architectures (CONFIG_GENERIC_ARCH_TOPOLOGY or
> !CONFIG_GENERIC_ARCH_TOPOLOGY) have to check whether they can use this
> default implementation or have to override it?
> 

yes exactly, will improve the comments. thanks.


