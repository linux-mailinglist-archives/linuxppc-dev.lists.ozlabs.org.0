Return-Path: <linuxppc-dev+bounces-5487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C4BA19D47
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 04:30:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdmgB57pzz2yGY;
	Thu, 23 Jan 2025 14:30:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737603046;
	cv=none; b=L+sMnbNRyL+ZyR3OnTgmusfc24P9kSZe7Ya85pEttU25fTq5p1UA8SocScxEovs21AMp7ofHFOr6pGt4Wdq1F+YaLntpPOidGCjZ2EQVgQCl7QoO+y1lchbzo+4UEtjsdk+VG/nwBOs2VRFT6bWhtCrGIptrm09VdEH2q7vellBnaup0IjNyC92LfzwEvjgd3tdYFD5wmITCOrXrA1CWM7TzA26ljpq53WJxaENybeiHBGrPpPZ1WbbtTbLSSApYhtLERNkNewnStQ1EgE8S8cbRTh86+XhOLMM/p7HCOX5C3IUZ9pd0GgOwnsM9gJA4yQllWf2P8W+nAiJtFqQgyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737603046; c=relaxed/relaxed;
	bh=/Gg28fZ6XTo4bzoa5SJH279/YT+vQs51tNDlVTdUiaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iUKXKPpviFpOaO1JCLEUiDd7mIGOEmxZ5erGNsme1+j0nZ+CZgX9VgJIOZsCiSJapODPtG1jdxu5KdWcLgXvxFHqa0dHUVuVm6LoP/7ZTcjq342nh3QwiwHqHphAh+QR8PYYwvddv5YjywP5ec1AYhjyKqadkdr/RPGfzIYfAv8kRhudtUiKSUy7uoQI6JWyRO6CoSbFQUqQ36X2xkkJVwTgwFvqxwUHtQHacMUmGgxeHnBLlU5tg16Zrg81vmQ+w4uIHHLL0CbrD9+sw/Qe219/sxnTkF1HkhRBYXyz22O/0AlW5PaC+x584FczUHAchg06k+Y5UghyStoY3BLw6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=skBEgtL1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=skBEgtL1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ydmg95V0Cz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 14:30:44 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N2mqbB016790;
	Thu, 23 Jan 2025 03:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/Gg28f
	Z6XTo4bzoa5SJH279/YT+vQs51tNDlVTdUiaQ=; b=skBEgtL1wwVl3bfROv/mc6
	rqEp4D4shwNI9OE2/7gHzYgCfcBKihw4fkAwunTeAQ4z0pSi/jOr7NgyMd80+OvK
	W5ATEFCjdOfZ7nFOUQEDnSes2PK/brxsQAdsAvGBYEeYN4GF8YA7tVdyZMJq7Drh
	USwapeTTMG32ukzmQxr35oJF5mBjCtP/3LfhXEORJaK8M8tksye3ak4aXNil1ouG
	lPkV+WO7UKxPRaDINJWyU4SVREI3Zpt2nwllCNrbu45W9OdAPrhNqYkuBVuqu2Ri
	JMwW0XuW4Ilw69FwoBbwiyi5+FrvPUGoxQQ01ZGizTfoQnyjZQ9X11pZ0YqekOyQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44b3gttqys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 03:30:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MNkiim021080;
	Thu, 23 Jan 2025 03:30:17 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1k7v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 03:30:17 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50N3UE4I34996722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 03:30:14 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20DCE2004B;
	Thu, 23 Jan 2025 03:30:14 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27CE620040;
	Thu, 23 Jan 2025 03:30:11 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 03:30:10 +0000 (GMT)
Message-ID: <f6576f1c-bba3-44cc-bcb4-95318d2ece5c@linux.ibm.com>
Date: Thu, 23 Jan 2025 09:00:10 +0530
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
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
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
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20250122150613.28a92438@thinkpad-T15>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: w2m3_3a-QB9cdFcKEir-4B9cCAZ8Nu9t
X-Proofpoint-GUID: w2m3_3a-QB9cdFcKEir-4B9cCAZ8Nu9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_01,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 mlxlogscore=828 phishscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230024
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Gerald,

On 22/01/25 19:36, Gerald Schaefer wrote:
> On Tue, 21 Jan 2025 20:34:19 +0530
> Sourabh Jain <sourabhjain@linux.ibm.com> wrote:
>
>> Despite having kernel arguments to enable gigantic hugepages, this
>> provides a way for the architecture to disable gigantic hugepages on the
>> fly, similar to what we do for hugepages.
>>
>> Components like fadump (PowerPC-specific) need this functionality to
>> disable gigantic hugepages when the kernel is booted solely to collect
>> the kernel core dump.
>>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: Heiko Carstens <hca@linux.ibm.com>
>> Cc: Vasily Gorbik <gor@linux.ibm.com>
>> Cc: Muchun Song <muchun.song@linux.dev>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>
>> To evaluate the impact of this change on architectures other than
>> PowerPC, I did the following analysis:
>>
>> For architectures where hugepages_supported() is not redefined, it
>> depends on HPAGE_SHIFT, which is found to be a constant. It is mostly
>> initialized to PMD_SHIFT.
>>
>> Architecture : HPAGE_SHIFT initialized with
>>
>> ARC: PMD_SHIFT (constant)
>> ARM: PMD_SHIFT (constant)
>> ARM64: PMD_SHIFT (constant)
>> Hexagon: 22 (constant)
>> LoongArch: (PAGE_SHIFT + PAGE_SHIFT - 3) (appears to be constant)
>> MIPS: (PAGE_SHIFT + PAGE_SHIFT - 3) (appears to be constant)
>> PARISC: PMD_SHIFT (appears to be constant)
>> RISC-V: PMD_SHIFT (constant)
>> SH: 16 | 18 | 20 | 22 | 26 (constant)
>> SPARC: 23 (constant)
>>
>> So seems like this change shouldn't have any impact on above
>> architectures.
>>
>> On the S390 and X86 architectures, hugepages_supported() is redefined,
>> and I am uncertain at what point it is safe to call
>> hugepages_supported().
> For s390, hugepages_supported() checks EDAT1 machine flag, which is
> initialized long before any initcalls. So it is safe to be called
> here.
Thanks for the info.
>
> My common code hugetlb skills got a little rusty, but shouldn't
> arch_hugetlb_valid_size() already prevent getting here for gigantic
> hugepages, in case they are not supported? And could you not use
> that for your purpose?

Yes, handling this in arch_hugetlb_valid_size is even better. That way,
we can avoid initializing data structures to hold hstate, which is not
required anyway.

Thanks for the review and suggestion. I will handle this in the
architecture-specific code.

- Sourabh Jain

