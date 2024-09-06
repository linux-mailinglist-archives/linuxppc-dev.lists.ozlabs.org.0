Return-Path: <linuxppc-dev+bounces-1087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B60F396EE45
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 10:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0V2P4yhjz302N;
	Fri,  6 Sep 2024 18:36:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725611805;
	cv=none; b=aadlh/FVU24bHAJGc7X2FP8NUXYjg4trotbP4SvODK6jywC6xl33KgzILuGSdRx3KB45XEsJJKGaYJ3l6q3mAiRHSIlfjgQ71/8IxnW7CmLBGUwEnHpD2dMpWefoFISMympZJEbS1Bv1kxe8mMbCAtgqSts/jbgBau1FIjx9i5rNgZek6HpKlZgk6FCrGDBw6hCFDcbwxhbKrIe8Pou2YUpHmLgoGhSYaR7MCR4uBbDJpaseIzcxg3pzRcABfXCI9axPM5HGsuuIQafdH/ikC7NMDSWvw27kuSiAdduZcxqPZCfxvqCTUdtxh/07D+vCLdAQYEu+Z4UtoIPNYa5xUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725611805; c=relaxed/relaxed;
	bh=aXqvLjVPoTQhJmGvUxOGP/2MDfOzTXaxgzK9UKEUYmU=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=OIJmIunncVVBIGgn+gNjsk7+0TzAGDi9Vzni5kKAx4lq8bDHYbC8jRlXJA8Z54FyE9iAYoLQxBZx4QrwRIxCUo1xTgOlwDIb3KBcAlgqaaGhuFWWsLsbLmzoasE3TGpe+7mVGewFQziFJ+y9w99SIQI+/ceIkOYPjo3mPvSm3DDT5cQ7Gr8zONm2ofyOaxFt2C6eSMwg437gb/OKtB5y+RHLuSX0EQpfJJrJXlFeeUrpfPk6QZxxM7VNTjKg8Q7zNCUH0OfdIXp6sFtVv69YhwlfRq4YyH+9n8H9NtM7kVGTalNlWxDuN1d/xJYDAm8nmp01VCio4N8P+Gqh3y1qlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0V2N1kmWz301n
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 18:36:38 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X0V1j5nCmz1j8Fj;
	Fri,  6 Sep 2024 16:36:09 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 679981402DE;
	Fri,  6 Sep 2024 16:36:32 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 6 Sep 2024 16:36:31 +0800
CC: <yangyicong@hisilicon.com>, Pierre Gondois <pierre.gondois@arm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <mingo@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <mpe@ellerman.id.au>,
	<peterz@infradead.org>, <tglx@linutronix.de>, <sudeep.holla@arm.com>,
	<will@kernel.org>, <catalin.marinas@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <dietmar.eggemann@arm.com>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v5 3/4] arm64: topology: Support SMT control on ACPI based
 system
To: Morten Rasmussen <morten.rasmussen@arm.com>
References: <20240806085320.63514-1-yangyicong@huawei.com>
 <20240806085320.63514-4-yangyicong@huawei.com>
 <a998c723-7451-439a-9c88-7c8b5c1b890b@arm.com>
 <00e6110a-462a-c117-0292-e88b57d27a05@huawei.com>
 <3947cb79-3199-4cd6-b784-51a245084581@arm.com>
 <1a7b5ac7-f040-672f-07a0-d7f3dc170c88@huawei.com>
 <6c05e39c-41f3-451c-b119-7b8662c1ceee@arm.com>
 <7f722af2-2969-aae5-1fb5-68d353eb95b9@huawei.com>
 <277bd093-422b-4301-92a3-d0a58eb41af5@arm.com>
 <10082e64-b00a-a30b-b9c5-1401a54f6717@huawei.com>
 <Ztqp-SUinu8C9a-P@R5WKVNH4JW>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <bb2bd7f4-e0ea-a771-7960-e35949ec9e03@huawei.com>
Date: Fri, 6 Sep 2024 16:36:30 +0800
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
In-Reply-To: <Ztqp-SUinu8C9a-P@R5WKVNH4JW>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2024/9/6 15:06, Morten Rasmussen wrote:
> Hi Yicong,
> 
> On Thu, Sep 05, 2024 at 08:02:20PM +0800, Yicong Yang wrote:
>> On 2024/9/5 16:34, Pierre Gondois wrote:
>>> Hello Yicong,
>>>
>>> If a platform has CPUs with:
>>> - 1 thread
>>> - X (!= 1) threads
>>> Then I think that the asymmetry is not detected
>>
>> Ah ok, I only handle the case where there are several thread numbers except no SMT CPUs in the
>> system. For this case I was thinking we don't need to handle this since there's only one kind
>> of SMT core in the system, control should works fine for the SMT CPU clusters and we may not
>> care about the CPUs with no SMT.
>>
>> Below code should handle the case if we initialize the max_smt_thread_num to 0. I also
>> reword the warning messages to match the fact. For heterogeneous SMT topology we still
>> support control SMT by on/off toggle but not fully support setting the thread number.
>>
>> 	int max_smt_thread_num = 0;
>> 	[...]
>> 	/*
>> 	 * This should be a short loop depending on the number of heterogeneous
>> 	 * CPU clusters. Typically on a homogeneous system there's only one
>> 	 * entry in the XArray.
>> 	 */
>> 	xa_for_each(&hetero_cpu, hetero_id, entry) {
>> 		/*
>> 		 * If max_smt_thread_num has been initialized and doesn't match
>> 		 * the thread number of this entry, then the system has
>> 		 * heterogeneous SMT topology.
>> 		 */
>> 		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
>> 			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
> 
> What does 'partly supported' mean here?
> 
> If the SMT control doesn't work as intended for this topology, I don't
> think it should be enabled for it.
> 

The /sys/devices/system/cpu/smt/control supports 2 kind of controls [1]
(a) enable/disable SMT entirely by writing on/off
(b) enable/disable SMT partially by writing a valid thread number (CONFIG_SMT_NUM_THREADS_DYNAMIC)

We assume 3 kind of SMT topology:
1. homogeneous SMT topology, all the CPUs support SMT or not
2.1 heterogeneous SMT topology, part of CPU clusters have SMT and others not. Clusters support SMT
    have the same SMT thread number
2.2 heterogeneous SMT topology, part of CPU clusters have SMT and the thread number may differs
    (e.g. cluster 1 is of SMT 2 and cluster 2 is of SMT 4. not sure there's such a real system)

For any of above SMT topology, control (a) should work as expected. When enabling SMT by writing "on"
the SMT is disabled for those CPU clusters who have SMT. Same for disabling SMT by writing "off".
But control (b) may not work for case 2.2 since the SMT thread number is not the same across
the system.

For this series alone we won't met this since CONFIG_SMT_NUM_THREADS_DYNAMIC is not enabled.
So control (b) only supports write 1/max_thread which behaves same as write off/on and will
work as intended for all the 3 cases. As discussed Pierre will add support for
 CONFIG_SMT_NUM_THREADS_DYNAMIC since thunderX2 is a symmetric SMT4 machine and
CONFIG_SMT_NUM_THREADS_DYNAMIC would be useful. We thought a warning should be useful
if running on a system of case 2.2.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542

Thanks.


