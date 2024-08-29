Return-Path: <linuxppc-dev+bounces-719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDB6963BF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 08:50:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvX3j2Xt7z2yjR;
	Thu, 29 Aug 2024 16:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724914241;
	cv=none; b=FLkkfv/Cesim7zhI+DhoRwFLEqjwSEtWSyZUEns4ABok6vstoU7ZqNLlNxgCAvwQ/Pk0xRwik0D68ndlOFLyEE/reerkRBPTo0jkihdW7Jvqob6sO8N/XWGPITk2Uq6L9V2EDZBaldySU8NQ/nB1vXA3nXK5FNdeXoVRs7AQ9jbbLkgFHO0ZtXJfR/bqgLO+sJakF4kRHydkJXFol82yjrMB6LhNqQ/QGP4hIrLZMzELILsfaQSyOisrBEN0ej8DDb//0lEKt+nHHEnsXw8Lavl/0aPWbpJ2FexncMWBYvEN8ak4nIMY1f/nzMHXm4vVkdtcvxtwJLkBmBoH/w73ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724914241; c=relaxed/relaxed;
	bh=MFd8+rrd35HFot6Q/xa2WcMKrR1GNmyeA/qFDFIa6bk=;
	h=Received:Received:Received:CC:Subject:To:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy; b=UQ/3wFKDFPPMrbzZIB8rZxqPKowpsRONbCiadgTiugHgufn/FdlPlf5198X7BqLouWin6JikTQ8sofJv4utNCoRffOiHc+2hc5ftqZfBNRK8OiuMIwBC9bKkuifwoYTrG1yoYbHWU/k3fraqMkNHN0o8HTljd4jWS5gcVvEb/gW2L3CxL4rMHmOwI407+WdUmjxNLETeR4/5g9jjss4YFUiux89AlZJpRQaZYMBDN5QiqTYCjwzCSNyhQBI8iOzBl85aCsIKGAmmky0RgGmaQn7cvPjUgPIJE0vapaBDEHE/GvZP8TN2p5M3OOcbwjLHvjagFew7CSQ7y00VOokZAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvX3g3hwWz2yYK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 16:50:39 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WvX222nB8zyQkp;
	Thu, 29 Aug 2024 14:49:14 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id E8EC01401F2;
	Thu, 29 Aug 2024 14:50:03 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 29 Aug 2024 14:50:02 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<mingo@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<mpe@ellerman.id.au>, <peterz@infradead.org>, <tglx@linutronix.de>,
	<sudeep.holla@arm.com>, <will@kernel.org>, <catalin.marinas@arm.com>,
	<linux-kernel@vger.kernel.org>, <dietmar.eggemann@arm.com>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v5 4/4] arm64: Kconfig: Enable HOTPLUG_SMT
To: Pierre Gondois <pierre.gondois@arm.com>
References: <20240806085320.63514-1-yangyicong@huawei.com>
 <20240806085320.63514-5-yangyicong@huawei.com>
 <4024c9be-aae9-4248-ab73-813c3c5d790b@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <b53badc6-d020-9683-4365-fb49a269caa4@huawei.com>
Date: Thu, 29 Aug 2024 14:50:02 +0800
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
In-Reply-To: <4024c9be-aae9-4248-ab73-813c3c5d790b@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2024/8/27 23:40, Pierre Gondois wrote:
> Hello Yicong,
> 
> Is it necessary to have an explicit dependency over SMP for arm64 ? Cf.
>   commit 4b3dc9679cf7 ("arm64: force CONFIG_SMP=y and remove redundant #ifdefs")

Thanks for the information. Then it's redundant to depend on CONFIG_SMP. Will drop it.

> 
> Regards,
> Pierre
> 
> On 8/6/24 10:53, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Enable HOTPLUG_SMT for SMT control.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   arch/arm64/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index a2f8ff354ca6..bd3bc2f5e0ec 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -238,6 +238,7 @@ config ARM64
>>       select HAVE_KRETPROBES
>>       select HAVE_GENERIC_VDSO
>>       select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
>> +    select HOTPLUG_SMT if (SMP && HOTPLUG_CPU)
>>       select IRQ_DOMAIN
>>       select IRQ_FORCED_THREADING
>>       select KASAN_VMALLOC if KASAN
> 
> .

