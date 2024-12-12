Return-Path: <linuxppc-dev+bounces-4025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 454D69EDDC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 03:59:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7xyx0PRxz30TJ;
	Thu, 12 Dec 2024 13:59:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733972392;
	cv=none; b=THOe6dCEYIcGBcAz/BSASaAEvyV7xg54KtdsAoCv9N8uJLHguBIuGgg7yFZ1XSuz5p/4CdRx9jZZEye7L7Twcmqw6IQPzVjKY/QIu35duH3084zQ7Ulr1nlJLCAXPWv20qzqtgZRBZhjljJnMW/0ufZeNDOVkvQ2k37s6dEdkOlaODP3yyHQW4D9zmtm1mplX/hSY+QI0YQX1uokKVdbx2OVOO+xl4IJ0zAE5o9S0H0cuoxu3j3LzHDbdhuNoBpSE215dRBX+ejndDA5ljFg+Cl1Vg+e52HP9euA/6ewSdZjgv4a5xSbUggH1rMfrb6BU6Gramnkexm9CojbO9Zqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733972392; c=relaxed/relaxed;
	bh=sz2LwSl/boxagL/G99gMkSY83O4TLOki/0YjWQPvsig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCi/BLA715egeBWhSby5KRKeJQmqWAoczC+7oS+w/F4eyhnwo7Abb/8C8uDcPQ729coF0NA+CgtKcmhl4Z5xqhjVtDjHFtCnpiMzGkxwXHsRvM1pxpKZtwEEbYzRgLapvczBqhg9TEtUZ6PV2JfzulYMVslbQuUGAw0JuZ1QbTKTkKAEyQ9uUoPxeFkduJ3f9EZIysMtInLXBjcEDrkbPqSE7oj5g1Nn6rgJhSxUy1dE6iXRWr614rKn82a53aexx34C4nzVENGLty2Ry7T4/MeWpxEjDRjpEGxMFGC3HLpIWTqmkO/46xqBKRfspLAsyxtlp3nagQF5Uj27eWGu8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C0lAudPK; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C0lAudPK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7xyv5Whlz306S
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 13:59:51 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBK3o2w004130;
	Thu, 12 Dec 2024 02:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=sz2LwS
	l/boxagL/G99gMkSY83O4TLOki/0YjWQPvsig=; b=C0lAudPKZdA2B7LjkLQJPS
	1t8GnsFN9C5HYBNo5Lrkhyw0j2eFJiKA/Fer9DZdJjEqvFNddGU6nhPeT8LyDsaL
	Xu9fc+AFyGcUvwwvUbr6gOxBmgM8FOBKqEsU3CFsR4y6DeTuwVVhvHEYpLLOk0pn
	xosXuwVxoHVza6TPY3h08R/0U8E+PI665A8mnLqQIaR/p3J6xPPGr4ls2laUvmA5
	ybYoVcCnofGb6rfXGXqAMwsrKcOyZgM3tEN4E+YCqVn4KqlOn2OTrUCPio9ChKGH
	+BV5tNaqLjwkwdMcUKpOj1a6a3/an/RuBAgLi05eFj00PIlgvwISslQjnOkoF6zw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43cdv91hrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 02:59:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC0WNji016930;
	Thu, 12 Dec 2024 02:58:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43d12ydwj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 02:58:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BC2wp0k60555520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 02:58:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62D1E20043;
	Thu, 12 Dec 2024 02:58:51 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DB8F20040;
	Thu, 12 Dec 2024 02:58:49 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Dec 2024 02:58:49 +0000 (GMT)
Message-ID: <ed53108f-29e3-4d8a-bcf3-f602011918f3@linux.ibm.com>
Date: Thu, 12 Dec 2024 08:28:47 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec: Initialize ELF lowest address to ULONG_MAX
To: Baoquan he <bhe@redhat.com>
Cc: ebiederm@xmission.com, Hari Bathini <hbathini@linux.ibm.com>,
        akpm@linux-foundation.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20241210091314.185785-1-sourabhjain@linux.ibm.com>
 <Z1pQoh7IwtERIWe5@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <Z1pQoh7IwtERIWe5@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Yrx1KC4-pPj3pWd1OB3VrXvb-MrgZQKx
X-Proofpoint-ORIG-GUID: Yrx1KC4-pPj3pWd1OB3VrXvb-MrgZQKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120021
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 12/12/24 08:25, Baoquan he wrote:
> On 12/10/24 at 02:43pm, Sourabh Jain wrote:
>> kexec_elf_load() loads an ELF executable and sets the address of the
>> lowest PT_LOAD section to the address held by the lowest_load_addr
>> function argument.
>>
>> To determine the lowest PT_LOAD address, a local variable lowest_addr
>> (type unsigned long) is initialized to UINT_MAX. After loading each
>> PT_LOAD, its address is compared to lowest_addr. If a loaded PT_LOAD
>> address is lower, lowest_addr is updated. However, setting lowest_addr
>> to UINT_MAX won't work when the kernel image is loaded above 4G, as the
>> returned lowest PT_LOAD address would be invalid. This is resolved by
>> initializing lowest_addr to ULONG_MAX instead.
>>
>> This issue was discovered while implementing crashkernel high/low
>> reservation on the PowerPC architecture.
>>
>> Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: kexec@lists.infradead.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   kernel/kexec_elf.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
>> index d3689632e8b9..3a5c25b2adc9 100644
>> --- a/kernel/kexec_elf.c
>> +++ b/kernel/kexec_elf.c
>> @@ -390,7 +390,7 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
>>   			 struct kexec_buf *kbuf,
>>   			 unsigned long *lowest_load_addr)
>>   {
>> -	unsigned long lowest_addr = UINT_MAX;
>> +	unsigned long lowest_addr = ULONG_MAX;
> Great catch.
>
> Acked-by: Baoquan He <bhe@redhat.com>

Thanks for the Ack Baoquan.

- Sourabh Jain

