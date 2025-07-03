Return-Path: <linuxppc-dev+bounces-10067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A0CAF67B9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 04:08:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXgCG5X8Lz2yf3;
	Thu,  3 Jul 2025 12:07:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751508474;
	cv=none; b=YbVItNm0HUyXvRKx6T5rvH0NsqCAuzOrEmBpBrVFXYsjt4nIM37YsEmCI9vShUlziy7gGhCaG96Em7ZYZwJhJ/4Oqc6PH78ul/RFpGszzMW9L9jford1LOlAtjLD7co2QHNT9zqygqHYVjmpwBRKvTj58LQKINlsom1I8mdX5isnUe3YTdrBXBz1jI3nDkuLple/KNu5F3N3EJm7ob+bJqUVhY7v+OHqzTJuyHFrDMZ+00adcHIeubpXC0QYeIxS3/pWuJJzep2lUHIJFD9h97xxEE23WfUpgv566Yh065StDFmdlKvxzyX1IVEia5wfkTCxPPCO7a23vzYEKefhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751508474; c=relaxed/relaxed;
	bh=iYC2VGsK17c3Bsf4bA/t7sRrLYG+1BwPtMfBeEVZVv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eM+mGKHFM7jnJhIovSC54z2YRSTeKNA2hMJ5dtFqoUgJ4gKJ5OKLL9RCTobXVjl1jHuPUaS8PFv49s1CF/y8HjvUUFe/SIwVjKA+SdPTukVhtOqvD5Q5+albBqNUvGpsCb4FNfCkYW4rIklPkv/2lN78nZPU7tZxku+BZMHEF+R4Y02PqLh2O572YZ49gN1xuHnu8KoJkCOwPRHECYulhcZqbT835tVBFejbKBdRpVA25DuXegb89nhjGT4H4KVTOxEE8jcvCPNaEs917RjGUhhK85T/mC/yYguqok0p9tVrWRpSX73vp0br1UEGWLkb3I80Wem5nwwnL8Oyc3Gunw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXgCF39ppz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 12:07:51 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bXgDB3grfz16TK1;
	Thu,  3 Jul 2025 10:08:42 +0800 (CST)
Received: from kwepemg100016.china.huawei.com (unknown [7.202.181.57])
	by mail.maildlp.com (Postfix) with ESMTPS id E8D49140109;
	Thu,  3 Jul 2025 10:07:45 +0800 (CST)
Received: from [10.67.110.48] (10.67.110.48) by kwepemg100016.china.huawei.com
 (7.202.181.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 3 Jul
 2025 10:07:44 +0800
Message-ID: <4c59f417-86cc-4dec-ae45-8fcf8c7eb16a@huawei.com>
Date: Thu, 3 Jul 2025 10:07:39 +0800
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
To: Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu
	<roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Heiko Carstens
	<hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
	<agordeev@linux.ibm.com>
CC: Eric Snowberg <eric.snowberg@oracle.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
	"Lee, Chun-Yi" <jlee@suse.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
	<linux-integrity@vger.kernel.org>, <keyrings@vger.kernel.org>, Lu Jialin
	<lujialin4@huawei.com>, Nayna Jain <nayna@linux.ibm.com>
References: <20250628063251.321370-1-gongruiqi1@huawei.com>
 <eb91dcf034db28e457a4482faa397dd7632f00fd.camel@linux.ibm.com>
Content-Language: en-US
From: GONG Ruiqi <gongruiqi1@huawei.com>
In-Reply-To: <eb91dcf034db28e457a4482faa397dd7632f00fd.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.48]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemg100016.china.huawei.com (7.202.181.57)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Mimi,

On 7/3/2025 9:38 AM, Mimi Zohar wrote:
> [CC: Nayna Jain]
> 
> On Sat, 2025-06-28 at 14:32 +0800, GONG Ruiqi wrote:
>> ...
> 
> The original reason for querying the secure boot status of the system was in
> order to differentiate IMA policies.  Subsequently, the secure boot check was
> also added to safely allow loading of the certificates stored in MOK. So loading
> IMA policies and the MOK certificates ARE dependent on the secure boot mode.
>                                                                                 
> What is your real motivation for moving the secure boot checking out of IMA?    
>                                                                                 

Sorry for not stating that clearly in this patch. I think the cover
letter of V3 I just sent few minutes ago can answer your question, and I
quote:

"We encountered a boot failure issue in an in-house testing, where the
kernel refused to load its modules since it couldn't verify their
signature. The root cause turned out to be the early return of
load_uefi_certs(), where arch_ima_get_secureboot() returned false
unconditionally due to CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=n, even
though the secure boot was enabled.

This patch set attempts to remove this implicit dependency by shifting
the functionality of efi secure boot enquiry from IMA to the integrity
subsystem, so that both certificate loading and IMA can make use of it
independently."

Here's the link of V3, and please take a look:
https://lore.kernel.org/all/20250703014353.3366268-1-gongruiqi1@huawei.com/T/#mef6d5ea47a4ee19745c5292ab8948eba9e16628d

> FYI, there are a number of problems with the patch itself.  From a very high
> level:  
>                                                                                 
> - The EFI secure boot check is co-located with loading the architecture specific
> policies.  By co-locating the secure boot check with loading the architecture
> specific IMA policies, there aren't any ifdef's in C code.  Please refer to the
> "conditional compilation" section in the kernel coding-style documentation on
> avoiding ifdef's in C code.
>                                                                                 
> - Each architecture has it's own method of detecting secure boot. Originally the
> x86 code was in arch/x86, but to prevent code duplication it was moved to IMA. 
> The new file should at least be named efi_secureboot.c.  

You're right. I didn't realize it's arch-specific in the first place,
and moving and renaming arch_ima_get_secureboot() turned out to be a
real mess ...

So the V3 keeps the prototype of arch_ima_get_secureboot(), and only
moves out its body, which I think can also better represent the
intention of the patch.

As of the name of the new file, as V3 has been sent earlier and still
uses secureboot.c, I can't change it there. I can do it in V4.

-Ruiqi

>                                                                                 
> - The patch title should be about moving and renaming the secure boot check. 
> The patch description should include a valid reason for the change.
> 
> Mimi & Nayna


