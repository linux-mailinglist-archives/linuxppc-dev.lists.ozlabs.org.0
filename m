Return-Path: <linuxppc-dev+bounces-5491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4538A1A0F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 10:41:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ydwtt1tPcz2yn2;
	Thu, 23 Jan 2025 20:41:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737625286;
	cv=none; b=klqan3FyouAPrPwf8p8tUIhYgcKNekj++g4bl5/OvsQpqrwtwdBePUD7yw/TrhwBojvlMwfwHW6Q+jDxkXNy8lEv9lDMUQzIritA+UvxGiFUWYi+IVCIpdqLMUNk0Mmd0e1dRk8Y6ZyijjdqNU8TCVwDVwg3jtUlv0nk1Qomh1gXf2jzTxMLI3eh05+7MvJcxA0TQ0K300d0R70m5j1OUy6gqhsIkxUzpKOI4TlE6Hu3ZcKKaDdDyiCDzujQRRtujYIOhKAtWfx/h83EhI57JG/vWxpSf6UbsLn8/imKXgEQfjPWGK1vNaaKGvTg+Ril273Xi5U0hsJLJb6H0I5DRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737625286; c=relaxed/relaxed;
	bh=BkAMvBka9lz7qA1vfG9q4Q/Fh4/ZUTAlk7oKlinox1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6mbmvzgM1+3YmEPEl6R9WXMWR8/uvemH65AlLqtQmAu3SkDslSgO47hBVlHthbKl9ui65gDl7ZPqAeWNhr3YRoUCOtMo2NNjsgQ+7pJDdiP/HWR/uOGSu3EHytd9VMkwA6LOGNXwrPxKHuwUVW8qYR3IFXtUYNmX0POj63HjlItHKWoovuuLcmcTcnXrfuyu+MgzR69OM4sgLTeiwH0MFVYdc3mIoloF5cwPT6o2DRVAguR6ojtcia5ypH6E2qZ6Gy4r6lhhe5KvBPFNTVJa77MRkftU0qo07vo3XoQRdJ5HtXqqFT5Gms5xMnO5GCpl1xB6FdA1DOntSP8d/gryQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TR8YmfOq; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TR8YmfOq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ydwts2m42z2yXY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 20:41:24 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N5O2qT026487;
	Thu, 23 Jan 2025 09:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BkAMvB
	ka9lz7qA1vfG9q4Q/Fh4/ZUTAlk7oKlinox1I=; b=TR8YmfOqwnRiuSaQD5JCC8
	iRhfBLl/6sDvkevMOl/a3M1jucZ9tRLXWb9pVFZ44CHcBGP3L+9stn+N1IL2ZG7t
	F+7IVbplzeIbftdPK6Iz3cRkMqW5ZP7uZfIuibww+rEUExGXmK1XDQnLGz0Fn/xZ
	uzAcjDP8vy5f2UyphRlln5O63OcHsI8Ygy9BdIw1jCrnI8BbPEUZ11Ud0uUm0zgZ
	aPOimWQbY0uk0FeWqK1iCZebJ4zvaejxIwuWOVFihr8DKNGpcgjJNH1bSTfZpQtc
	pKLYFna5GtxFEduzAFb91D6EoE0cJECqMvypjkvg7Fd113VG5R8Z+PVShw5cBh6A
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bfk7s3r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 09:40:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N5rm19024241;
	Thu, 23 Jan 2025 09:40:46 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448q0yd0qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 09:40:46 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50N9eg7F32768342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 09:40:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 647D02004B;
	Thu, 23 Jan 2025 09:40:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BC7D20043;
	Thu, 23 Jan 2025 09:40:39 +0000 (GMT)
Received: from [9.203.114.244] (unknown [9.203.114.244])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 09:40:39 +0000 (GMT)
Message-ID: <02f48a21-2dc6-457d-b8a5-bafb9dbb64c2@linux.ibm.com>
Date: Thu, 23 Jan 2025 15:10:37 +0530
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
Subject: Re: [PATCH] mm/hugetlb: bring gigantic page allocation under
 hugepages_supported()
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: akpm@linux-foundation.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Muchun Song <muchun.song@linux.dev>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org
References: <20250121150419.1342794-1-sourabhjain@linux.ibm.com>
 <20250122150613.28a92438@thinkpad-T15>
 <f6576f1c-bba3-44cc-bcb4-95318d2ece5c@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <f6576f1c-bba3-44cc-bcb4-95318d2ece5c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AO_UvKkwcxoYsdky9iPtWgvMAHp3_3YT
X-Proofpoint-ORIG-GUID: AO_UvKkwcxoYsdky9iPtWgvMAHp3_3YT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=938
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230072
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 23/01/25 9:00 am, Sourabh Jain wrote:
> Hello Gerald,
> 
> On 22/01/25 19:36, Gerald Schaefer wrote:
>> On Tue, 21 Jan 2025 20:34:19 +0530
>> Sourabh Jain <sourabhjain@linux.ibm.com> wrote:
>>
>>> Despite having kernel arguments to enable gigantic hugepages, this
>>> provides a way for the architecture to disable gigantic hugepages on the
>>> fly, similar to what we do for hugepages.
>>>
>>> Components like fadump (PowerPC-specific) need this functionality to
>>> disable gigantic hugepages when the kernel is booted solely to collect
>>> the kernel core dump.
>>>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>> Cc: Ingo Molnar <mingo@redhat.com>
>>> Cc: Borislav Petkov <bp@alien8.de>
>>> Cc: Heiko Carstens <hca@linux.ibm.com>
>>> Cc: Vasily Gorbik <gor@linux.ibm.com>
>>> Cc: Muchun Song <muchun.song@linux.dev>
>>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: linux-mm@kvack.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> ---
>>>
>>> To evaluate the impact of this change on architectures other than
>>> PowerPC, I did the following analysis:
>>>
>>> For architectures where hugepages_supported() is not redefined, it
>>> depends on HPAGE_SHIFT, which is found to be a constant. It is mostly
>>> initialized to PMD_SHIFT.
>>>
>>> Architecture : HPAGE_SHIFT initialized with
>>>
>>> ARC: PMD_SHIFT (constant)
>>> ARM: PMD_SHIFT (constant)
>>> ARM64: PMD_SHIFT (constant)
>>> Hexagon: 22 (constant)
>>> LoongArch: (PAGE_SHIFT + PAGE_SHIFT - 3) (appears to be constant)
>>> MIPS: (PAGE_SHIFT + PAGE_SHIFT - 3) (appears to be constant)
>>> PARISC: PMD_SHIFT (appears to be constant)
>>> RISC-V: PMD_SHIFT (constant)
>>> SH: 16 | 18 | 20 | 22 | 26 (constant)
>>> SPARC: 23 (constant)
>>>
>>> So seems like this change shouldn't have any impact on above
>>> architectures.
>>>
>>> On the S390 and X86 architectures, hugepages_supported() is redefined,
>>> and I am uncertain at what point it is safe to call
>>> hugepages_supported().
>> For s390, hugepages_supported() checks EDAT1 machine flag, which is
>> initialized long before any initcalls. So it is safe to be called
>> here.
> Thanks for the info.
>>
>> My common code hugetlb skills got a little rusty, but shouldn't
>> arch_hugetlb_valid_size() already prevent getting here for gigantic
>> hugepages, in case they are not supported? And could you not use
>> that for your purpose?
> 
> Yes, handling this in arch_hugetlb_valid_size is even better. That way,
> we can avoid initializing data structures to hold hstate, which is not
> required anyway.
> 
> Thanks for the review and suggestion. I will handle this in the
> architecture-specific code.

Yeah, adding a check for hugetlb_disabled in arch_hugetlb_valid_size()
should take care of things?

- Hari

