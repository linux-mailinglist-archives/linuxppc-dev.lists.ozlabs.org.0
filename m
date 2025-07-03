Return-Path: <linuxppc-dev+bounces-10072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3473DAF697F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 07:19:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXlSN2Mmnz2yhX;
	Thu,  3 Jul 2025 15:19:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751519972;
	cv=none; b=jyKgU9KkHzY8f4HdO3Z4WcAvNo03EPTgdC+r8k/bKRxjmQq/7jgQjVjP3E/rl8Z9XxpyYIIaBYrYQGyCmNxFupuPkPeheLDCZl09BEu5KDOptCFGmDP5kApPDMEBIWnPjOcetIfbvkuOYymUqicKF/loBosTLCu6dbWnv0a2tfoDsRzvuDNuU82aNYwVEkLeCAdKAImqopsoNMF7H6L9o1KcdCyRQHQUtSBlMY5RiH2RoiyPqhrMer6+vEtNeOVIQ0DsDDU1QTdupWeGAJ0VZgjMmQ73rIV8OnnsLKVjR46J6eYrirpeVYPHVaQ7jSX6zLg86RmEV4Ehm2ZiFhN6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751519972; c=relaxed/relaxed;
	bh=+vbZzDg/bigkVjCDdXuB0HpFf2TWQ4p0cYgervKvmKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZgLRFwkuft7PLOZWMy8Q9/ewwW8gbnxnXyS/HOka5PHf8JMUTrZ96CmhUuZsq3cB7/1yJYkYMJ6HA/VSSAjjveLZpNTUR9lBcSo/efMOfZJHweAIall4lSOlClvO7wybQgCOkwGdkkhHA9YCHjtVWnX6ySdtTxXLRpKHpUAMVpwJuGaVGT9FCNep7vvl1T52KqJNHSAQB0oLHdemuu5zeqeehBm5SifIzL8K9VDHvudeIW0juMF+2+aE6ny7/1iXYcelVMQic0aJcqUL1JNsPTNYpZgMwDZt3tBR+9RP7d+JAVR/sKMj1BGk+RUQLuYmJHiFy7YlbGfQojW2dXXuuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXlSM1ybdz2yf3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 15:19:28 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bXlPH5ymrz1R8bq;
	Thu,  3 Jul 2025 13:16:51 +0800 (CST)
Received: from kwepemg100016.china.huawei.com (unknown [7.202.181.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 387E51A0188;
	Thu,  3 Jul 2025 13:19:23 +0800 (CST)
Received: from [10.67.110.48] (10.67.110.48) by kwepemg100016.china.huawei.com
 (7.202.181.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 3 Jul
 2025 13:19:22 +0800
Message-ID: <a06d0bc2-e5e3-43e1-9bed-f7d370afeec1@huawei.com>
Date: Thu, 3 Jul 2025 13:19:21 +0800
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
 <4c59f417-86cc-4dec-ae45-8fcf8c7eb16a@huawei.com>
 <15ae451cf47f45a7b540200107ef1f5d1d1543f9.camel@linux.ibm.com>
Content-Language: en-US
From: GONG Ruiqi <gongruiqi1@huawei.com>
In-Reply-To: <15ae451cf47f45a7b540200107ef1f5d1d1543f9.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.48]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemg100016.china.huawei.com (7.202.181.57)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 7/3/2025 11:35 AM, Mimi Zohar wrote:
> ...
>>
>> You're right. I didn't realize it's arch-specific in the first place,
>> and moving and renaming arch_ima_get_secureboot() turned out to be a
>> real mess ...
>>
>> So the V3 keeps the prototype of arch_ima_get_secureboot(), and only
>> moves out its body, which I think can also better represent the
>> intention of the patch.
> 
> It's definitely much better.  To summarize, arch_ima_get_secureboot() becomes a
> wrapper for integrity_get_efi_secureboot().  Before loading the MOK/MOKx keys,
> load_uefi_certs() calls integrity_get_efi_secureboot() directly.

Exactly.

> 
> With load_uefi_certs() calling integrity_get_efi_secureboot() directly, please
> check to see whether an integrity_get_efi_secureboot() stub function needs to be
> defined.

For CONFIG_LOAD_UEFI_KEYS and CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT, the
former depends on CONFIG_EFI while the latter is implied by the same, so

  integrity-$(CONFIG_EFI) += secureboot.o

should be enough. I've compile-tested the V3 on x86/arm64/powerpc/s390,
with various config combinations as much as I can think of. Let's see if
the kernel test robot could find out some corner cases.

-Ruiqi

> 
> Mimi
> 
>>
>> As of the name of the new file, as V3 has been sent earlier and still
>> uses secureboot.c, I can't change it there. I can do it in V4.
>>
>> -Ruiqi
> 


