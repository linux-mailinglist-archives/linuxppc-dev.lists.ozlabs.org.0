Return-Path: <linuxppc-dev+bounces-4481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 737A29FCAC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2024 12:50:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YJn540LPbz2xHY;
	Thu, 26 Dec 2024 22:50:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735213847;
	cv=none; b=UnST0DM82mE6i2E2z2NLpOhrY1l0DFzXK4646dXcLU4QurZeaUpYfQGZplI1aGVXcSdtjoirIKISPkhsSYhrOUshayr5/x2vbSqIFEWwQZzb2hEzReDfb85pgYnYCpUnFrPz0kTgTgjOAlhOwnz73rOzp5lv9m5VYhFgXvMHMnmZfie2yKrMdXvq9e2k2WCY9q62cQG7nH75TCUxqF/hran8MbZ9du6ivioNtOM+1AZB9ogoY33glh26lbor1hy8oRNeDc5sV4BXwvAXCSSzpH7Mr9yjMtEG2QfVHucEpBC0Rhh2D3DqX9Re6xkIgQwF9itUVZDtetDgBk1fBCCGjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735213847; c=relaxed/relaxed;
	bh=R5Qi0XbzRbCJCgyZuxmVNl2HCVdVWpWhdxaqL2KMtek=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bc5zMsLsbDLU+DZ2p/XXUSA6RuK2yD3grnEUcPYW10kgDZQNxw8lWMuHbnPpWk3f3jjE34gkuGL2aRs7KL2rlC+Ps+nSKo1QZ20TX40bG1Dn0/748t2AJ1Fh0sD3QqU+dOFHIipmlfbQwY7tO+uqACTRjLpf81FCljhTXAnfdkh+l9stpLSbPd04cYfoquk/cAqcoOOsPjbNv1y3EXRaADDfsNZT3M1qiL9QH0oOLqQ4CmJZzeunGQ4w50OwIIQLb4hL5RxulUem4M3CdL6n3T8w/yKfJUHHYfVmlKmfDGvuumS7ECmFREkmpWVdEGPoPU+3gCPNbNyR8cNfXhra9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJn523bHWz2xHQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2024 22:50:43 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4YJn2X6DSLzRk9r;
	Thu, 26 Dec 2024 19:48:36 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C4AD1802D2;
	Thu, 26 Dec 2024 19:50:38 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 26 Dec 2024 19:50:37 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
Subject: Re: [PATCH v10 0/4] Support SMT control on arm64
To: Shrikanth Hegde <sshegde@linux.ibm.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
 <d0e73e64-cdf7-443b-a8e3-7c1f25533000@linux.ibm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <a9e19d83-cfc4-910c-7bca-b2dd17647c5f@huawei.com>
Date: Thu, 26 Dec 2024 19:50:36 +0800
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
In-Reply-To: <d0e73e64-cdf7-443b-a8e3-7c1f25533000@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-4.9 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/12/26 17:23, Shrikanth Hegde wrote:
> 
> 
> On 12/20/24 13:23, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> The core CPU control framework supports runtime SMT control which
>> is not yet supported on arm64. Besides the general vulnerabilities
>> concerns we want this runtime control on our arm64 server for:
>>
>> - better single CPU performance in some cases
>> - saving overall power consumption
>>
> 
> EAS is disabled when SMT is present.
> I am curious to know how power saving happens here.

EAS shouldn't work on non-asymmetic systems, so it's not the case here.
System wide power consumption comes down from the CPU offlining here.

Thanks.

> 
>> This patchset implements it in the following aspects:
>>
>> - Provides a default topology_is_primary_thread()
>> - support retrieve SMT thread number on OF based system
>> - support retrieve SMT thread number on ACPI based system
>> - select HOTPLUG_SMT for arm64
>>
>> Tests has been done on our ACPI based arm64 server and on ACPI/OF\
>> based QEMU VMs.
>>
> .

