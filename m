Return-Path: <linuxppc-dev+bounces-10289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C8DB08CE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 14:29:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjXKx4rlHz2yPd;
	Thu, 17 Jul 2025 22:29:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752755365;
	cv=none; b=A8cVH1uiCR067+5Arg6BAie1LZK8eCwCKB+bPVnST+j9kOHf2l47DCW6553+oRVU/JkL1kH3Xx96zDA2szP1eDeNBfKspk6sD+dDCM6uuABEKAvhZ4K4kO2jU8KP1n9lQaL9Ra9R6AtS8wzdJmYOd4GtjdYOfJnsudPShusVb7V7FDx+cMaStv5SPC2IiLNodHSHBwiaw6rO66tecISu93RPapWE3xekPTaXrkEuWDmwo0wKJnz25n65iqN0L+qokurt67BdclwwqyP2Ginb3y4lDkS+qajIeBcpu4ZMkPHuPbmkrcbKLTUEm0f1n3ywDTAGmtv32OCqfNjbu6AgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752755365; c=relaxed/relaxed;
	bh=eia7fK07LYJQ8RP5F49fC+XG63ZnbbkF8ta6ZjPtRTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P+PmMW8mB9OV3DxgN6syMkieKgg1VALWki2tFfsgQCIqAouDBiV3yUSHRWV33DnxZwcsMMzRlKCvAk/m+Y1swYLSLhCfRViJMH/x9GJIEcMjD/Vhx7/p2f0HPWeYf/Ui2Txf4/KIciE0RvB5hrxnSK8yz5tloxHzSgkrtofmycZbobVILjnrJwqCvoK1fQkmxVxjF0Sp5c83scztVWBVPNhpJfBC3SihfmCmxAsCqAdLVEwwCt49HGDQKupSrD2Om6vgsfgaYv8U28QIZDp+wyogkNiioVBd+SVOsPDzJSJ5jFNwoVfCUxDtw89X/2MEXtuG8YQJV+98JOvw90dkNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjXKt3tHHz2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 22:29:20 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bjXGT3dmMzZhwR;
	Thu, 17 Jul 2025 20:26:25 +0800 (CST)
Received: from kwepemg100016.china.huawei.com (unknown [7.202.181.57])
	by mail.maildlp.com (Postfix) with ESMTPS id D0B1D180B3F;
	Thu, 17 Jul 2025 20:29:14 +0800 (CST)
Received: from [10.67.110.48] (10.67.110.48) by kwepemg100016.china.huawei.com
 (7.202.181.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 17 Jul
 2025 20:29:13 +0800
Message-ID: <362b3e8a-0949-42d1-a1d0-90bd12d86b09@huawei.com>
Date: Thu, 17 Jul 2025 20:29:07 +0800
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] integrity: Extract secure boot enquiry function out of
 IMA
To: Nayna Jain <nayna@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin
	<dmitry.kasatkin@gmail.com>, Jarkko Sakkinen <jarkko@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>
CC: Eric Snowberg <eric.snowberg@oracle.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
	"Lee, Chun-Yi" <jlee@suse.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
	<linux-integrity@vger.kernel.org>, <keyrings@vger.kernel.org>, Lu Jialin
	<lujialin4@huawei.com>
References: <20250628063251.321370-1-gongruiqi1@huawei.com>
 <eb91dcf034db28e457a4482faa397dd7632f00fd.camel@linux.ibm.com>
 <4c59f417-86cc-4dec-ae45-8fcf8c7eb16a@huawei.com>
 <e8aa7f94-3e52-488d-a858-564d3d1edd4b@linux.ibm.com>
Content-Language: en-US
From: GONG Ruiqi <gongruiqi1@huawei.com>
In-Reply-To: <e8aa7f94-3e52-488d-a858-564d3d1edd4b@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.48]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemg100016.china.huawei.com (7.202.181.57)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 7/8/2025 4:35 AM, Nayna Jain wrote:
> 
> On 7/2/25 10:07 PM, GONG Ruiqi wrote:
>> 
>> ...
>>
>> "We encountered a boot failure issue in an in-house testing, where the
>> kernel refused to load its modules since it couldn't verify their
>> signature. The root cause turned out to be the early return of
>> load_uefi_certs(), where arch_ima_get_secureboot() returned false
>> unconditionally due to CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=n, even
>> though the secure boot was enabled.
> Thanks for sharing additional details.
> 
> From x86 Kconfig:
> 
> /For config x86:
> 
>     imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
> /
> And IMA_SECURE_AND_OR_TRUSTED_BOOT is dependent on IMA_ARCH_POLICY .
> 
> And from Linux Kernel Kbuild documentation( https://docs.kernel.org/
> kbuild/kconfig-language.html) :
> 
> /weak reverse dependencies: “imply” <symbol> [“if” <expr>]
> 
> This is similar to “select” as it enforces a lower limit on another
> symbol except that the “implied” symbol’s value may still be set to n
> from a direct dependency or with a visible prompt.
> 
> /Following the example from the documentation, if  it is EFI enabled and
> IMA_ARCH_POLICY is set to y then this config should be default enabled.
> 
> If it is EFI enabled and IMA_ARCH_POLICY is set to N, then the setting
> for IMA_SECURE_AND_OR_TRUSTED_BOOT should be prompted during the build.
> The default setting for prompt is N. So, the person doing the build
> should actually select Y to enable IMA_ARCH_POLICY.
> 
> Wondering what is the scenario for you? Unless you have IMA_ARCH_POLICY
> set to N, this config should have been ideally enabled. If you have
> explicitly set it to N, am curious any specific reason for that.

Hi Nayna. Sorry for the late reply. Super busy these days...

Yes, IMA_ARCH_POLICY was not set. The testing was conducted on
openEuler[1], a Linux distro mainly for arm64 & x86, and the kernel was
compiled based on its own openeuler_defconfig[2], which set
IMA_ARCH_POLICY to N.

-Ruiqi

[1]: https://www.openeuler.org/en/
[2]:
https://gitee.com/openeuler/kernel/blob/OLK-6.6/arch/arm64/configs/openeuler_defconfig


> 
> Thanks & Regards,
> 
>    - Nayna
>>
>> ...


