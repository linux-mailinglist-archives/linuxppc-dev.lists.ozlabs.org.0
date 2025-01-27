Return-Path: <linuxppc-dev+bounces-5590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9237A1D30C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 10:08:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhMyX3GFbz2yNP;
	Mon, 27 Jan 2025 20:08:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737968884;
	cv=none; b=ZFVQV7uKToX1nGgyYa4GI0GiJfcQBIrOYImA3cYKd9hknp1gQ5ZS4iHj2bd8gxIGthGj9P4MpI/SqjbHahBJXeXob57vWLOZj0nLo0J/Qly6sfGjQhF+Dq04M1ZOiH6vzb9ovcqql+OtghHB6YaeKtV1a2nDpv9SVZpJ0S63IsipI+A/eaNOI+gmQqoa8ptND4vtGvp83NB16crRpJzVJm5PfLxhKoAlqqy4hKGUQs+01ojNjgEpDI3I5T1TSflR5v3H3suOhWETrsa96yXcDUfy9vzE0NhnKXaq/VYtTG2CmwUhRxVFVSt/GAQUYPn1MvFzqinaVQHQiEIwBM9n2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737968884; c=relaxed/relaxed;
	bh=7QzWXaI5zyeHOUTA75qYBXJYYH7fedkmNcjEubme9sU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7etREYDxibVsZH/rX7UT2Zi5qEIffyjhOUvdWlzjGBM0ClOeez9hZnShON/kVa2B3ZIA/Mf+bkP1FH3Xxep7MxkuqEnM3j5C62iwvcpWLrZcgGm8p+uJUsgg/2ilLwywAwKGlaVsA2h3BaIEFYDUCzODlACpBjI8MPHYqSVLeszkNDU7zU7HYD9tN5ap1ut3YMkNij08GBYSgKYCobR73Y7NySvXwlXFye5KUkH7AmVsyZEiVYlmpU+27ziWwjSP6vRAFkuDvCCQ5ESyzE108nGZP2NhXWDBrl2TMUAKfc5jK0HVK0br6bWlr+MwTC7R2qbl3ZjSU/NBDVLdAHPBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVknbETk; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVknbETk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhMyW3T2sz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 20:08:02 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R7WvOV029713;
	Mon, 27 Jan 2025 09:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7QzWXa
	I5zyeHOUTA75qYBXJYYH7fedkmNcjEubme9sU=; b=TVknbETkVIYz278YInrEf8
	bl0ig1wVx7TKDms7dtbVnrzKryaxs9+oHSZjlZ83m2SgyZtS048v+Ml3G7ZyGs0e
	qjIwxNKp8o335jaPdXh/c7a3WxTlRIdSaXOkuENYdPkHmMOqPCpcRUK9HSI18H8N
	IqZP8vcMmBgaFB/1nwvJlJV+S2B1S1Eru8xjFOKQ0/ftY1BDieFwTGAQxanBqzRq
	c80CmjQAvY0fbp1EFg/HMzrMALTssBs9UjAAuSriwHYSY/2LMdiQpIJOUUIcThNL
	453JL3Vj3F2+lEyQ9bfZszi5gVjfLk+izntWxRhnf9G+un2YJMbYW5n0Xunlc22A
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44e5un8cq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 09:07:50 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50R7OuNZ019348;
	Mon, 27 Jan 2025 09:07:50 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44db9mngur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 09:07:50 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50R97kNi64356728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 09:07:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 039712019A;
	Mon, 27 Jan 2025 09:07:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BB9D20199;
	Mon, 27 Jan 2025 09:07:44 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jan 2025 09:07:44 +0000 (GMT)
Message-ID: <1f1d7ec2-0a2c-4df3-bc8f-f34cb62e9630@linux.ibm.com>
Date: Mon, 27 Jan 2025 14:37:43 +0530
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
Subject: Re: [PATCH v2] powerpc/hugetlb: Disable gigantic hugepages if fadump
 is active
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20250124103220.111303-1-sourabhjain@linux.ibm.com>
 <147cd977-bfd0-4f9d-a9ae-748351ebaeab@csgroup.eu>
 <dbd59336-5838-41fe-a795-f6bf0574732f@linux.ibm.com>
 <e1af96e7-a021-4473-8c2b-6a16b20374bb@csgroup.eu>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <e1af96e7-a021-4473-8c2b-6a16b20374bb@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xc4V8RpJn5Tq4lHOkoCXAVly6zyHO2Uo
X-Proofpoint-ORIG-GUID: Xc4V8RpJn5Tq4lHOkoCXAVly6zyHO2Uo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270067
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org




On 27/01/25 13:18, Christophe Leroy wrote:
>
>
> Le 25/01/2025 à 10:32, Sourabh Jain a écrit :
>> Hello Christophe
>>
>>
>> On 24/01/25 19:44, Christophe Leroy wrote:
>>>
>>>
>>> Le 24/01/2025 à 11:32, Sourabh Jain a écrit :
>>>> The fadump kernel boots with limited memory solely to collect the 
>>>> kernel
>>>> core dump. Having gigantic hugepages in the fadump kernel is of no 
>>>> use.
>>>> Many times, the fadump kernel encounters OOM (Out of Memory) issues if
>>>> gigantic hugepages are allocated.
>>>>
>>>> To address this, disable gigantic hugepages if fadump is active by
>>>> returning early from arch_hugetlb_valid_size() using
>>>> hugepages_supported(). hugepages_supported() returns false if 
>>>> fadump is
>>>> active.
>>>>
>>>> Returning early from arch_hugetlb_valid_size() not only disables
>>>> gigantic hugepages but also avoids unnecessary hstate 
>>>> initialization for
>>>> every hugepage size supported by the platform.
>>>>
>>>> kernel logs related to hugepages with this patch included:
>>>> kernel argument passed: hugepagesz=1G hugepages=1
>>>>
>>>> First kernel: gigantic hugepage got allocated
>>>> ==============================================
>>>>
>>>> dmesg | grep -i "hugetlb"
>>>> -------------------------
>>>> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
>>>> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
>>>> HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
>>>> HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
>>>>
>>>> $ cat /proc/meminfo | grep -i "hugetlb"
>>>> -------------------------------------
>>>> Hugetlb:         1048576 kB
>>>>
>>>> Fadump kernel: gigantic hugepage not allocated
>>>> ===============================================
>>>>
>>>> dmesg | grep -i "hugetlb"
>>>> -------------------------
>>>> [    0.000000] HugeTLB: unsupported hugepagesz=1G
>>>> [    0.000000] HugeTLB: hugepages=1 does not follow a valid 
>>>> hugepagesz, ignoring
>>>> [    0.706375] HugeTLB support is disabled!
>>>> [    0.773530] hugetlbfs: disabling because there are no supported 
>>>> hugepage sizes
>>>>
>>>> $ cat /proc/meminfo | grep -i "hugetlb"
>>>> ----------------------------------
>>>> <Nothing>
>>>>
>>>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>>>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>> Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
>>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>> ---
>>>>
>>>> Changelog:
>>>>
>>>> v1:
>>>> https://eur01.safelinks.protection.outlook.com/? 
>>>> url=https%3A%2F%2Flore.kernel.org%2Fall%2F20250121150419.1342794-1- 
>>>> sourabhjain%40linux.ibm.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C747d8db131e44ea472cf08dd3d234a0f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638733943957107236%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=wArHG9ozTqBJWRbp850rkU7ioemZjai3TEf7nZGm4h0%3D&reserved=0 
>>>>
>>>>
>>>> v2:
>>>>   - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()
>>>>
>>>> ---
>>>>   arch/powerpc/mm/hugetlbpage.c | 8 ++++++--
>>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/ 
>>>> hugetlbpage.c
>>>> index 6b043180220a..087a8df32416 100644
>>>> --- a/arch/powerpc/mm/hugetlbpage.c
>>>> +++ b/arch/powerpc/mm/hugetlbpage.c
>>>> @@ -135,8 +135,12 @@ int __init alloc_bootmem_huge_page(struct 
>>>> hstate *h, int nid)
>>>>     bool __init arch_hugetlb_valid_size(unsigned long size)
>>>>   {
>>>> -    int shift = __ffs(size);
>>>> -    int mmu_psize;
>>>> +    int shift, mmu_psize;
>>>> +
>>>> +    if (!hugepages_supported())
>>>> +        return false;
>>>> +
>>>> +    shift = __ffs(size);
>>>
>>> Why change the declaration/init of shift ?
>>
>> I did this to avoid running code that wasn't necessary.
>
> The compiler does it for you, when you look at the assembly you see 
> the calculation is done only when needed.

Yeah I didn't consider that. Thanks.

- Sourabh Jain


