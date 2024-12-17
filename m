Return-Path: <linuxppc-dev+bounces-4256-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 346089F457A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 08:49:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC88g0xqSz3bSh;
	Tue, 17 Dec 2024 18:49:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734421763;
	cv=none; b=AdqufEFmGW85eRh85+sq9UC8opI4KKXal+nQNbVNXFQINafy1dTaJqQ9IKYdi0UlkTmv5qYadc/Lj0QHq5gHHdS8sj5WdwD58AZVYMTlhrxwH60uAphAAg+DHGdtkmcEzYRBX4e3KzyRSNEgRWfWgZifZrAeP4F5MAyYcHHDfZ/EVudI5jFLaposnupEj3XaF0qh50r0NxGP0xJkLPDYWjG9pxMVT2POIGqLP26gGIxVywl7TYm10Prfw/7q9tVKC+wQPQLoKSV/LLvCGrDP5ISexA/6ff966s5t1Aei7/ccFinAsx7q3wxTw8oO6Z8DdV0AzFwTzetRO+mIQJuZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734421763; c=relaxed/relaxed;
	bh=hdcfVvJFaG1srvh2k6b2oooyaPK9NySwGV7Y1UPCo9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEgfNUBFIaNbjzbSjXodk1obJQjAB6tHAcDZGMruVkcf6+CP0T47luIJKjGd2ifJr/4xiBgH249b+xPt1hQ0AeZGU6FJWNhtmYrUtWUFkfh41XmgxWO/8xqMZJLcDTfo+yGeSfOhFQQCsimwWoBO/feg9/VDVMHbWmgOZIcgDqqTnop5wxgs9szki+FMji8jIN1ZoquMFPGYLuzmj7pr3tSvVneBkc6AcNBuou4Q2/sSyIolT0JRYmcWC9jm4vlxBKh2EDUWiLMREN0KJReY6D8PZHAg+nLqgQCLazUnDoBl9uOJ5QgtyqmNbcnV1Z5dCSLgIISFGP5ApHQAI4v4Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sjx03mFd; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sjx03mFd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC88f0Zykz3bTN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 18:49:21 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6BsNY027059;
	Tue, 17 Dec 2024 07:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hdcfVv
	JFaG1srvh2k6b2oooyaPK9NySwGV7Y1UPCo9U=; b=sjx03mFdD3SsLTYqP/nL1w
	ivRdwlvJzgw3X+L0xRox37EoPiW2Q7682p4qOiCMK284OgoZ/uBEA8HStVyHNYKM
	zH/27BV+OAXguMHW8ZRsu3NR3Ca1B8c3G3DzvpQrwgvS0WWboEjKguUQ0liqDlPk
	LZRBpP5m5Cnjh1R7TTypt8dZkhMrLOnjRkY/jutjZG2J5NF3bTimORGbZ6EVZf3v
	9GEqIEFPm0rN60unwLnzdUqKt1RG3Fs5FbCUwSx1DA2jZUl7I/agOvuViLwsQVhh
	yJ/Pq4gB/o89XgjVWIKp1YsOkg/bqE1JutqL9i1eU/GE/GAa1Fcyqo3O/StfIjRA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd2dmjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:49:08 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BH7fm5p012359;
	Tue, 17 Dec 2024 07:49:08 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd2dmjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:49:08 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH4n0JX014391;
	Tue, 17 Dec 2024 07:49:07 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq21hehv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:49:07 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH7n31M48038374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 07:49:03 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B279C20049;
	Tue, 17 Dec 2024 07:49:03 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AB2120040;
	Tue, 17 Dec 2024 07:49:01 +0000 (GMT)
Received: from [9.43.29.128] (unknown [9.43.29.128])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 07:49:01 +0000 (GMT)
Message-ID: <96e92c6d-8d09-43e0-b279-8f6eb1d093fa@linux.ibm.com>
Date: Tue, 17 Dec 2024 13:18:59 +0530
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
Subject: Re: [PATCH] powerpc/book3s64/hugetlb: Fix disabling hugetlb when
 fadump is active
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20241202054310.928610-1-sourabhjain@linux.ibm.com>
 <87h6734gp8.fsf@gmail.com> <87frmn4alk.fsf@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87frmn4alk.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ze414kLfMrgzOU-eqztwF6oJ6HVz7OuM
X-Proofpoint-GUID: TeDlMPaHYS8JsLghNyuCayFfQO3XYgAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170060
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Ritesh,


On 17/12/24 02:19, Ritesh Harjani (IBM) wrote:
> Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:
>
>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>
>>> Commit 8597538712eb ("powerpc/fadump: Do not use hugepages when fadump
>>> is active") disabled hugetlb support when fadump is active by returning
>>> early from hugetlbpage_init():arch/powerpc/mm/hugetlbpage.c and not
>>> populating hpage_shift/HPAGE_SHIFT.
>>>
>>> Later, commit 2354ad252b66 ("powerpc/mm: Update default hugetlb size
>>> early") moved the allocation of hpage_shift/HPAGE_SHIFT to early boot,
>>> which inadvertently re-enabled hugetlb support when fadump is active.
>>>
>>> Fix this by implementing hugepages_supported() on powerpc. This ensures
>>> that disabling hugetlb for the fadump kernel is independent of
>>> hpage_shift/HPAGE_SHIFT.
>>>
>> Thanks for describing the history of the changes clearly.
>>
>>> Fixes: 2354ad252b66 ("powerpc/mm: Update default hugetlb size early")
>>> CC: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>>> CC: Hari Bathini <hbathini@linux.ibm.com>
>>> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> CC: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> ---
>>>
>>> Note: Even with this fix included, it is possible to enable gigantic
>>> pages in the fadump kernel. IIUC, gigantic pages were never disabled
>>> for the fadump kernel.
>>>
>>> Currently, gigantic pages are allocated during early boot as long as
>>> the respective hstate is supported by the architecture.
>>>
>>> I will introduce some changes in the generic hugetlb code to allow the
>>> architecture to decide on supporting gigantic pages on the go. Bringing
>>> gigantic page allocation under hugepages_supported() does work for
>>> powerpc but I need verify the impact on other architectures.
>>>
>>> Regarding the Fixes tag: This patch fixes a bug inadvertently introduced
>>> by the commit mentioned under Fixes tag in the commit message. Feel free
>>> to remove the tag if it is unnecessary.
>>>
>>> ---
>>>   arch/powerpc/include/asm/hugetlb.h | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
>>> index 18a3028ac3b6..f294e57663b0 100644
>>> --- a/arch/powerpc/include/asm/hugetlb.h
>>> +++ b/arch/powerpc/include/asm/hugetlb.h
>>> @@ -15,6 +15,15 @@
>>>   
>>>   extern bool hugetlb_disabled;
>>>   
>>> +static inline int hugepages_supported(void)
> I guess we may as well make it's return type as bool.
Yes, fixed in v2:
https://lore.kernel.org/all/20241217074640.1064510-1-sourabhjain@linux.ibm.com/

Thanks again.

- Sourabh Jain

