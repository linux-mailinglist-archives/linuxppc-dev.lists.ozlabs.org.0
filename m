Return-Path: <linuxppc-dev+bounces-712-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF8196382B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 04:26:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvQBS33XPz2yK9;
	Thu, 29 Aug 2024 12:26:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724898368;
	cv=none; b=hGOjaEaiOIdZzz2bmXJQr5zklT33e9m/wnyvzaVKnq3IsAkaKYXTL34ksJvpAvJx8LNU9E8fVLhAF16umS5HAH5+egS/JvcNcIewURLd4y5KBCcXTx51lGZsBTJEp1f4MMwh7TR3cEDmZ1LJXivaIJBLOUGPR0yZzORknrtIXytmSw1SC75IJaetqt4v/1OK2VY9w/RjCSieLNrlVXKj+RJk1CbxL8BLLCiwu5E6NyKJ8kmPici1O30m/jsd3g/z5uXux278hpoFMg40yUF987b3dI/fdk+E9qeZNf1t57Fs4H9QG4LVRfg31K78aQUFaF4ghNIzXMOxeiN07cRxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724898368; c=relaxed/relaxed;
	bh=CEACD0d4Jp1McKomMo/UqFp89P6UQ3eCV24nUtC4TPc=;
	h=Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy; b=bMZvqKR38eFN+KbuNYLOdw4sE0fE+HZM3SCdyzmR9rykQaxtcykWXAlJ4LAmqiC3PM4qd6OeZYAW8ZUsQzAlFw1Vm58gaMaW2oUsxufa6VBUjVo/TVXsThS/aSw4Ow2XWANpkwp9M+Ok6zGHQZ50WGqRx8rA2v0M2MVc+XO1po+Skupww46CrdeJgaCtcbl4wrfmB8tpCOghPDe/S8hbuOGwjfa/aZuAWt6NalCYNvF6JTMvePqVveMSAkwcCmPMja/87JzC0XQNvsL8ncHTeqQgGbC5JJtpcgG1+Uj5HRu6j7mkdIVOENm0BL8Jc2AN6+k/nAK8Gks8oDIEY11nrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvQBR2yKXz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 12:26:01 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WvQ4c4D8YzQr2n;
	Thu, 29 Aug 2024 10:21:04 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 1966D1400FF;
	Thu, 29 Aug 2024 10:25:55 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 Aug 2024 10:25:54 +0800
Message-ID: <195dd9e0-ef42-bcf8-b71a-d9d548af014a@huawei.com>
Date: Thu, 29 Aug 2024 10:25:53 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 2/8] soc: fsl: cpm1: Simplify with dev_err_probe()
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <andrew@lunn.ch>,
	<sebastian.hesselbarth@gmail.com>, <gregory.clement@bootlin.com>,
	<herve.codina@bootlin.com>, <qiang.zhao@nxp.com>,
	<christophe.leroy@csgroup.eu>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <nm@ti.com>, <ssantosh@kernel.org>,
	<petlozup@nvidia.com>, <pshete@nvidia.com>, <christophe.jaillet@wanadoo.fr>,
	<ulf.hansson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-tegra@vger.kernel.org>, <jic23@kernel.org>
References: <20240827114607.4019972-1-ruanjinjie@huawei.com>
 <20240827114607.4019972-3-ruanjinjie@huawei.com>
 <87abe3f1-3cf2-4331-8dde-a422716dd94a@kernel.org>
 <97ff8c02-1a97-7974-06fa-edb35437707d@huawei.com>
 <32e8ef50-ae45-4001-92b6-1e9e0608b402@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <32e8ef50-ae45-4001-92b6-1e9e0608b402@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/8/28 21:08, Krzysztof Kozlowski wrote:
> On 28/08/2024 03:58, Jinjie Ruan wrote:
>>
>>
>> On 2024/8/27 21:50, Krzysztof Kozlowski wrote:
>>> On 27/08/2024 13:46, Jinjie Ruan wrote:
>>>> Use the dev_err_probe() helper to simplify error handling during probe.
>>>> This also handle scenario, when EDEFER is returned and useless error
>>>> is printed.
>>>
>>> ? Sorry, this cannot happen. Please point to below code which can defer.
>>>
>>
>> Thank you!
>>
>> This is not referring to a specific one, but rather the benefits it
>> offers，simplify code is the main purpose, if necessary, it will be
>> removed in next version.
> 
> It just feels like you are doing these in machine way without actually
> knowing concepts behind dev_err_probe().

Just try my best to make the code as clean as possible and do it by the way.

> 
> Best regards,
> Krzysztof
> 

