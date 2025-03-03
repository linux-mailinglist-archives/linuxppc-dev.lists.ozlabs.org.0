Return-Path: <linuxppc-dev+bounces-6652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5502A4C3A6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 15:41:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z61jV4BmSz3bjb;
	Tue,  4 Mar 2025 01:41:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.255
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741012910;
	cv=none; b=OzMmEsczVwrW/8Cg7a7A2bLEmpOeY7FabcqWduUh1A4fXNdPYxURabSNM60Pwf+vz5kebXgHKzzKAmRKHErtj1jDAXme4xWa1ADO07yV6gWfLMVVswcZ2IhWCmdbZoJAPOme7jPeZ86zKcQywsheYUBJgqxdc3Kkpz59S4x4J28r+DE9f8aEbGTYu3wX/fV3SIm8xuh+Sbuk9LbR+aDVSKVRksM3Y6vMpwBMoCOLhQN5jpsZ3AeRautR1drK0g0nBAclbAP+NxGV3b/DLrZPSD1DrfmXozSLcxpiP7kLA7FoNLyErp20peTrFBYQeSl2yeQJBI0AtXQ5yYv5aB5VaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741012910; c=relaxed/relaxed;
	bh=RPO3faU0WM8oINILXvtTZEf79GJOXNtgXsPJpD8tQlM=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Uv51V23glIREepqqFScUyw54X2NwkbUlAArjrBuzXSDcVKkNTGe124vf1X82epvCigpeGJPdeuR11+yMPkyDQ7T+DQ+j0BCo3h8pQZcfPhK2bRxy8WVSeQOrkrk51JC4JbVxGXOc7a9PDCSYqIsUBYemF1W4NC3Ti0T3TX01+4WgzZaCjIT1hOYGv9kiIrBmG1O2Qsm8um014pPTWpo9BaKBmscnMulvQP+6vROQF+RLp7qQ1vVyM/WHDkrAK3L4Y66YDpn3Ezk/vxxGOi7IPpjxuga6jcbHkMbgqDORfhKCa42GSrklMDbsB+wxS4QPihIt65ZFDjkuRdDAxgIfEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z61jT4ZhJz30WS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 01:41:49 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Z61bk3JkQz1GDnG;
	Mon,  3 Mar 2025 22:36:50 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 3EEF7180216;
	Mon,  3 Mar 2025 22:41:42 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 3 Mar 2025 22:41:41 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 0/4] Support SMT control on arm64
To: Dietmar Eggemann <dietmar.eggemann@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <sudeep.holla@arm.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <df9784c3-c2ea-4bac-839a-2b7de0a81aac@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <6d83cc41-7759-c0a2-6695-01f98923ed5d@huawei.com>
Date: Mon, 3 Mar 2025 22:41:40 +0800
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
In-Reply-To: <df9784c3-c2ea-4bac-839a-2b7de0a81aac@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-2.4 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025/2/28 19:12, Dietmar Eggemann wrote:
> On 18/02/2025 15:10, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> The core CPU control framework supports runtime SMT control which
>> is not yet supported on arm64. Besides the general vulnerabilities
>> concerns we want this runtime control on our arm64 server for:
>>
>> - better single CPU performance in some cases
>> - saving overall power consumption
>>
>> This patchset implements it in the following aspects:
>>
>> - Provides a default topology_is_primary_thread()
>> - support retrieve SMT thread number on OF based system
>> - support retrieve SMT thread number on ACPI based system
>> - select HOTPLUG_SMT for arm64
>>
>> Tests has been done on our ACPI based arm64 server and on ACPI/OF
>> based QEMU VMs.
> 
> [...]
> 
>> Yicong Yang (4):
>>   cpu/SMT: Provide a default topology_is_primary_thread()
>>   arch_topology: Support SMT control for OF based system
>>   arm64: topology: Support SMT control on ACPI based system
>>   arm64: Kconfig: Enable HOTPLUG_SMT
>>
>>  arch/arm64/Kconfig                  |  1 +
>>  arch/arm64/kernel/topology.c        | 66 +++++++++++++++++++++++++++++
>>  arch/powerpc/include/asm/topology.h |  1 +
>>  arch/x86/include/asm/topology.h     |  2 +-
>>  drivers/base/arch_topology.c        | 27 ++++++++++++
>>  include/linux/topology.h            | 22 ++++++++++
>>  6 files changed, 118 insertions(+), 1 deletion(-)
> 
> With the review comments on the individual patches [0-3]/4:

will fix.

> 
> Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
> 

Thanks.


