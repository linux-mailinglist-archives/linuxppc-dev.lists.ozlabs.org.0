Return-Path: <linuxppc-dev+bounces-4488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4209B9FD0EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2024 08:17:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKGym6M0dz2yVG;
	Fri, 27 Dec 2024 18:17:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.35
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735283824;
	cv=none; b=aEREr4Rim6anLtCXBS3XCyfaMuehU28dMOze4vFXYgRIlk0QAR/fty75kgpugiih0DPNDBno6rU3R3F+Vr1Mtv2W1CfV9ca5KjNdI49l2C17/ECXggjiVjvbHBOqwnD9ZbaFexZNeT+I9kfhTfgWW0MZ8ywny810L2v/Wg8A5osAJUCVND/i8trZ0wE3McrqFo3tPXWXz+dd3bR3eM1dYSQUYNkAjq2VxRigrvv5kGqtr016XVCAbcQl5RK3HzmUHafkNSVZXzsH7vS1t9g9VF7rd4ksEOeRaaJAe5Eh2dwBFykUktyD0pgcSxx8fRfsbtKwz1toEtThTfTVJU9IAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735283824; c=relaxed/relaxed;
	bh=peNV1/narB+N1OxtD8fDB5flsO2+vGuoHsNfdEP2yM0=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=NdhpdkdVpJJqj5u21fEJhcmXw7LTexcQmzqy8L4HwfA0P44WYvljBNx8JV9qafJk+DmLoxLD0CeS6cLL1F3C3JBAexVntRYle0BUqnxGgDfCH5BnFukWVdW3e5YtBuUKUvlvN6m5vKKMh8RUiEtQZCXDCAuV525SwDGewfD59zTYdetZcrKQoQsvVsmG48NJXDtsmXmOY3WE8vSPkvpcq0yM+FXAQ1Oqtrxgbx8UC5QOKD4BMIT99ymOrNqbcAloiP/ANWtNbvcUuk3RsqPlsFNoyFNhvxqDR4ipH4uq4JDe1JIqM3EfSkO8X3ECmNgPtkyq45F6l0pqi2mwVS2ifA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKGyk6hL2z2xYr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2024 18:16:59 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4YKGvG3K8mz1T7Vc;
	Fri, 27 Dec 2024 15:14:02 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 0058A1A016C;
	Fri, 27 Dec 2024 15:16:49 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 27 Dec 2024 15:16:47 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, Nysal Jan K.A. <nysal@linux.ibm.com>
Subject: Re: [PATCH v10 0/4] Support SMT control on arm64
To: Shrikanth Hegde <sshegde@linux.ibm.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
 <d0e73e64-cdf7-443b-a8e3-7c1f25533000@linux.ibm.com>
 <a9e19d83-cfc4-910c-7bca-b2dd17647c5f@huawei.com>
 <04c9757c-98e9-4c5d-9759-8a9ac9d6a803@linux.ibm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <ec04a084-0e01-afe3-6836-ed33615926ab@huawei.com>
Date: Fri, 27 Dec 2024 15:16:47 +0800
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
In-Reply-To: <04c9757c-98e9-4c5d-9759-8a9ac9d6a803@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-3.3 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/12/26 20:28, Shrikanth Hegde wrote:
> 
> 
> On 12/26/24 17:20, Yicong Yang wrote:
>> On 2024/12/26 17:23, Shrikanth Hegde wrote:
>>>
>>>
>>> On 12/20/24 13:23, Yicong Yang wrote:
>>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>>
>>>> The core CPU control framework supports runtime SMT control which
>>>> is not yet supported on arm64. Besides the general vulnerabilities
>>>> concerns we want this runtime control on our arm64 server for:
>>>>
>>>> - better single CPU performance in some cases
>>>> - saving overall power consumption
>>>>
>>>
>>> EAS is disabled when SMT is present.
>>> I am curious to know how power saving happens here.
>>
>> EAS shouldn't work on non-asymmetic systems, so it's not the case here.
> 
> Ok. so this is a symmetric system then?

yes, symmetric.

> 
>> System wide power consumption comes down from the CPU offlining here.
>>
> 
> Ok. So SMT is enabled by default and then at runtime disable it to save power by off-lining the sibling threads?
> 

yes.

> 
> Note: When enabling SMT, current behavior differs when a core is fully offline on different archs. You may want to see which is behavior you need in that case. i.e either online or skip.
> 
> PowerPC change where we are skipping a fully offline core.
> https://lore.kernel.org/all/20240731030126.956210-1-nysal@linux.ibm.com/
> 

Thanks for the information! Currently it's implemented as online and no special need for skip. We may need further
support if skip is required in the future, currently for GENERIC_ARCH_TOPOLOGY an offline CPU's thread sibling
only contains itself so there's no information for checking whether the whole core is offline or not.

Thanks.

>> Thanks.
>>
>>>
>>>> This patchset implements it in the following aspects:
>>>>
>>>> - Provides a default topology_is_primary_thread()
>>>> - support retrieve SMT thread number on OF based system
>>>> - support retrieve SMT thread number on ACPI based system
>>>> - select HOTPLUG_SMT for arm64
>>>>
>>>> Tests has been done on our ACPI based arm64 server and on ACPI/OF\
>>>> based QEMU VMs.
>>>>
>>> .
> 
> .

