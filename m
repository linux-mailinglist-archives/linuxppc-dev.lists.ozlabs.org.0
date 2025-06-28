Return-Path: <linuxppc-dev+bounces-9855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC55AEC43E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jun 2025 04:37:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTc5h3hz4z2y0B;
	Sat, 28 Jun 2025 12:37:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751078248;
	cv=none; b=RSrMeQPOrf36PB9a/WgB1SRXpSCm9VuS+Z0Ctp7zp6Dmk4Mz3ipKP3g0TMPBe2pGqQkYRDktNRQTghygDDwgv7lpozIcasoxkTk0+5sGADBQYuSWtCxnSOjNqyY1tvLsXFi1KZsHmQAWlZfR2RHcZmn8zl654sw9qZc0NrzY7qN7VSxNHZkoKCCJj4KdyobCUYJG4Z60DC8kgoQKC3IR0FxNDLHDlG6O1XLFlqgf38F8n3FaKZx7470WNh/pTgHP1vQcUFEiw9X8fCBUkwggYyKZEluTtQqbS87vePrFbHtBOXz8V7gd2NOGnvB7xE4jOvbbnYhyPTI3yBzrEt8s/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751078248; c=relaxed/relaxed;
	bh=g0szdBiphlZgpCS8sOLMOSAUI9/QL9Pamtbd6ooOeh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oeUqzZl83apJ8ROyDRmL2Qhati1gorScoHrHf0NMygET+6+jcIZRDYT/WCVdnSAPlLYSiKudBitlWm3jyJaLhjQ6KiI5clOo8Vi39pQHi4p4m4NQdYnx57CZqzgB8GsqcxAuJ7OSi26efeAYY+WB0dtmAy1um1+cBbnUamVOqrpay9t3CFpYu2RO/qMvVWEr9S5FyIjeeSMjT6D+rCIz07Blzqwgyl1rEIVy+1V+Jhnk+diGD92/A9rbl0dH6+V58IR/S3PZmzYsZ5ubFwDTwWBrcpxx3e70OS0rqSWbuF9ffH7I1r3NJm8uOzrpHty5rE1dIQ7qn18+ztF9Ji1abQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bTc5g1jsVz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jun 2025 12:37:25 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bTc0x6GgWzdbgF;
	Sat, 28 Jun 2025 10:33:21 +0800 (CST)
Received: from kwepemg100016.china.huawei.com (unknown [7.202.181.57])
	by mail.maildlp.com (Postfix) with ESMTPS id D61BC180B3F;
	Sat, 28 Jun 2025 10:37:20 +0800 (CST)
Received: from [10.67.110.48] (10.67.110.48) by kwepemg100016.china.huawei.com
 (7.202.181.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Jun
 2025 10:37:19 +0800
Message-ID: <267d0e56-6040-426c-8b1e-a53b18829871@huawei.com>
Date: Sat, 28 Jun 2025 10:37:18 +0800
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
Subject: Re: [PATCH RESEND] integrity: Extract secure boot enquiry function
 out of IMA
To: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu
	<roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Heiko Carstens
	<hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Eric Snowberg
	<eric.snowberg@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, "Lee,
 Chun-Yi" <jlee@suse.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
	<linux-integrity@vger.kernel.org>, <keyrings@vger.kernel.org>, Lu Jialin
	<lujialin4@huawei.com>
References: <20250626023617.3885806-1-gongruiqi1@huawei.com>
 <aF6/ItTfd7oVN+Sn@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Language: en-US
From: GONG Ruiqi <gongruiqi1@huawei.com>
In-Reply-To: <aF6/ItTfd7oVN+Sn@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.48]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemg100016.china.huawei.com (7.202.181.57)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/06/27 23:56, Alexander Gordeev wrote:
> On Thu, Jun 26, 2025 at 10:36:17AM +0800, GONG Ruiqi wrote:
> 
> Hi GONG,
> 
> ...
>> Compile-tested for powerpc, s390 and x86, all with allmodconfig.
> 
> This breaks defconfig and debug_defconfig builds on s390
> since IMA_ARCH_POLICY=n in these configurations and thus
> CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=n as well:

Hi Alexander,

Thanks for the feedback! I'll fix it and send a V2 asap.

BR,
Ruiqi

> 
> s390x-15.1.0-ld: security/integrity/ima/ima_main.o: in function `ima_load_data':
> /home/agordeev/linux.c3/security/integrity/ima/ima_main.c:902:(.text+0x54e): undefined reference to `arch_integrity_get_secureboot'
> s390x-15.1.0-ld: security/integrity/ima/ima_appraise.o: in function `ima_appraise_parse_cmdline':
> /home/agordeev/linux.c3/security/integrity/ima/ima_appraise.c:30:(.init.text+0x44): undefined reference to `arch_integrity_get_secureboot'
> make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux.unstripped] Error 1
> make[1]: *** [/home/agordeev/linux.c3/Makefile:1236: vmlinux] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
>> Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>
> 
> Thanks!

