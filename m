Return-Path: <linuxppc-dev+bounces-6651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A21BEA4C3A0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 15:41:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z61j815Pvz30WY;
	Tue,  4 Mar 2025 01:41:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741012892;
	cv=none; b=DiSTkjJ0fOCk19Le5JufkvlEWr+jDw4At7O3aiOEZAwJm82Upi6aAGp9xp2d5N0dKC+9I64v/X0mM8B94Xw1LCz2ilYfXCIjwNnSbq9uI3JrpOPSEUTGq9tfpBfbyU5pPQ/n5nYabAvy9Hr1tnOGnAMqX/KMVt/SpzfvYKsVzEt3SjccD/Qa2aHprtKeRW5DSdwsI1fRKg5Wk/CuhanzBhja2Yi3v6rRbWZZMGJ48c34k8LarDo3EI0DLpSedQEOsm8GskYnqgQklTjgKhBZkFO/vicax4mB5A16v9EWKAfzsLKpRj5uAFoBxbpc3c5G5zIZSLP3ECVrmVFvou4y8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741012892; c=relaxed/relaxed;
	bh=PyFmoPLxI3Bt/mKH+4GGVhiV4FqREb8L/Cp19+HR3OY=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=MK+J0n2ZKD41YxaDN61Y3c1/RYXZ/xD8dBn9UGgnbWm9tGXYhjmT/3gzW4YnBdZBeFcznlTi9ulBt8TbkmcN+6rYUjhTOrssIA5sjKsKLTGtiEDR7u8/cEzIV9AXwAgztDmKUrjeLHiFwaiwsSuYtpbDMLINN2aMZmAEYHtcWZTnc7+E6qywgLuFFHRoDpVJ6r4Q1QubienvJc9piWPc+BuqCvhVkSg59BDnQjcLawaQJE8g/RinC6WMWQ2PTTfxoTIrLqXI3Kcom7BJCwknzGlDHp5Or4v/LglBVL9mo0oz/2G8njaclGgHsrHfZHRscg5cVsJ5hJW445ejPF4e0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z61j641SKz30WS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 01:41:27 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Z61Zl13Y8zwW49;
	Mon,  3 Mar 2025 22:35:59 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 3682E1402C8;
	Mon,  3 Mar 2025 22:40:51 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 3 Mar 2025 22:40:50 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <dietmar.eggemann@arm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
To: Sudeep Holla <sudeep.holla@arm.com>, Pierre Gondois
	<pierre.gondois@arm.com>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com> <Z8HAkZiHYRjj97M7@bogus>
 <336e9c4e-cd9c-4449-ba7b-60ee8774115d@arm.com>
 <20250228190641.q23vd53aaw42tcdi@bogus>
 <a52972c7-aadd-4a77-a292-057fa5f8372d@arm.com> <Z8WPiOweOjFZqTwN@bogus>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <32e572d6-dedd-d8a3-13be-6de02303a64d@huawei.com>
Date: Mon, 3 Mar 2025 22:40:49 +0800
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
In-Reply-To: <Z8WPiOweOjFZqTwN@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-2.4 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025/3/3 19:16, Sudeep Holla wrote:
> On Mon, Mar 03, 2025 at 10:56:12AM +0100, Pierre Gondois wrote:
>> On 2/28/25 20:06, Sudeep Holla wrote:
>>>>>
>>>>> Ditto as previous patch, can get rid if it is default 1.
>>>>>
>>>>
>>>> On non-SMT platforms, not calling cpu_smt_set_num_threads() leaves
>>>> cpu_smt_num_threads uninitialized to UINT_MAX:
>>>>
>>>> smt/active:0
>>>> smt/control:-1
>>>>
>>>> If cpu_smt_set_num_threads() is called:
>>>> active:0
>>>> control:notsupported
>>>>
>>>> So it might be slightly better to still initialize max_smt_thread_num.
>>>>
>>>
>>> Sure, what I meant is to have max_smt_thread_num set to 1 by default is
>>> that is what needed anyways and the above code does that now.
>>>
>>> Why not start with initialised to 1 instead ?
>>> Of course some current logic needs to change around testing it for zero.
>>>
>>
>> I think there would still be a way to check against the default value.
>> If we have:
>> unsigned int max_smt_thread_num = 1;
>>
>> then on a platform with 2 threads, the detection condition would trigger:
>> xa_for_each(&hetero_cpu, hetero_id, entry) {
>>     if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)     <---- (entry->thread_num=2) and (max_smt_thread_num=1)
>>         pr_warn_once("Heterogeneous SMT topology is partly
>>                       supported by SMT control\n");
>>
>> so we would need an additional variable:
>> bool is_initialized = false;
> 
> Sure, we could do that or skip the check if max_smt_thread_num == 1 ?
> 
> I mean
> 	if (entry->thread_num != max_smt_thread_num && max_smt_thread_num != 1)
> 

this will work for me. will launch some tests.

Thanks.



