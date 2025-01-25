Return-Path: <linuxppc-dev+bounces-5555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F72A1C287
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2025 10:33:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yg8ch684lz2ykT;
	Sat, 25 Jan 2025 20:33:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737797604;
	cv=none; b=Lbnd14kGvX9OsXrYHyu0Jee9YRXwTKQD4/RsFnh+ZDWuoqhAfQ6i2k9OU0lHpk66tRtHjm11hg2s+IgS8wmsdVw7fEYlNckBaDBdeUocaACkNs40cnH/+B20ZTHLdsrE7ptU3AGiKauCo/DpQ6Rwbbo+jnr1inh50XVe4I2ASlJguxVz55BTbx94adCheTfqrxUnLimHbMbq+lfJCQwVp+CCZyZ8TOzSTN8Srh6ePhYsEF+yaQnJudBTl/h4DR1P+WUKc+1mLjGB7020sI6Oc2xyC1bnx0FkqgPynWY6vDH/KeMw16MDGIwOcnNP5V4eSPN58StMiYXs81tkmrytLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737797604; c=relaxed/relaxed;
	bh=q3ibNfQzXvKorUD4DK7Ma4wxuiCNlRieRCwurfXpwFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXUSQPwN3eHhbHCqJiUtyWNvhuRb+ozEma+HRgtot4SQ3SI4AiPOa65iMl2zNZsr17oY5pq3SXj1197Clld2miBh5Ei3SQkL3AYcUpDricVyd20Yc/fZ4+S0wB3BRzh8RjxP9IA58RDSm9k5YrsETdjhnnTy3rFznrw/ySuSNlaCkrF6di+zYTpgnK/Hg3uURJrc5F/dsYodQqp/6EQXdn4E6ybsH9g2lgoaiBVjeR/XnfYaz3GkxijoK0x+wNwLETAEgAZfQXfLZ1QWEGadahrDyxQgu787hjUgoFrEWdzu8+oYN+ZryGNBmrN7QydY0QuSaEYO3L3KYan1mXK5Jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n1CA1iCQ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n1CA1iCQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yg8cg6DWHz2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2025 20:33:23 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50P2lQrv014799;
	Sat, 25 Jan 2025 09:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=q3ibNf
	QzXvKorUD4DK7Ma4wxuiCNlRieRCwurfXpwFg=; b=n1CA1iCQghLp1SVd+KLsJU
	8wyZrDdHZBY9aqelKylqHvxbF65c6wbhp8zPKGJF35FKXHvGb3O8pMfskFFtKEwf
	au5w9WKeweIEYrzR9mKe44RMcbIBsmm7HrWuwEX0MxITv3uCrpxg6gU7czv+co5Z
	nxz3BL6XKWx+hqJgS7h6y5u9FuM3xT+CTF6zr1Jnh/qnyt8wrdwpp6VF3e+vwIHq
	7XAP4567vgmEsMbzA7RYfawKpsSa+Skjk0S3r7tIazQboYlDti1s5+mWQ9xEXmwh
	JVtCdlmpQp7gJtHTS5siuWPQ/v7KscF0WBVQhQkcROYn5EvvrxMbG+fnWhI+q1DA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44cqf7h39k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Jan 2025 09:33:10 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50P6K9AW032290;
	Sat, 25 Jan 2025 09:33:09 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 448ruk7cnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Jan 2025 09:33:09 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50P9X6Kb50397586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 25 Jan 2025 09:33:06 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5806C2006E;
	Sat, 25 Jan 2025 09:33:06 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A7682006A;
	Sat, 25 Jan 2025 09:32:54 +0000 (GMT)
Received: from [9.43.45.180] (unknown [9.43.45.180])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 25 Jan 2025 09:32:54 +0000 (GMT)
Message-ID: <dbd59336-5838-41fe-a795-f6bf0574732f@linux.ibm.com>
Date: Sat, 25 Jan 2025 15:02:53 +0530
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
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <147cd977-bfd0-4f9d-a9ae-748351ebaeab@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UnEuKNemB59wnbmY8vYwW-G_2J-mhnYq
X-Proofpoint-ORIG-GUID: UnEuKNemB59wnbmY8vYwW-G_2J-mhnYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-25_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501250066
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Christophe


On 24/01/25 19:44, Christophe Leroy wrote:
>
>
> Le 24/01/2025 à 11:32, Sourabh Jain a écrit :
>> The fadump kernel boots with limited memory solely to collect the kernel
>> core dump. Having gigantic hugepages in the fadump kernel is of no use.
>> Many times, the fadump kernel encounters OOM (Out of Memory) issues if
>> gigantic hugepages are allocated.
>>
>> To address this, disable gigantic hugepages if fadump is active by
>> returning early from arch_hugetlb_valid_size() using
>> hugepages_supported(). hugepages_supported() returns false if fadump is
>> active.
>>
>> Returning early from arch_hugetlb_valid_size() not only disables
>> gigantic hugepages but also avoids unnecessary hstate initialization for
>> every hugepage size supported by the platform.
>>
>> kernel logs related to hugepages with this patch included:
>> kernel argument passed: hugepagesz=1G hugepages=1
>>
>> First kernel: gigantic hugepage got allocated
>> ==============================================
>>
>> dmesg | grep -i "hugetlb"
>> -------------------------
>> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
>> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
>> HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
>> HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
>>
>> $ cat /proc/meminfo | grep -i "hugetlb"
>> -------------------------------------
>> Hugetlb:         1048576 kB
>>
>> Fadump kernel: gigantic hugepage not allocated
>> ===============================================
>>
>> dmesg | grep -i "hugetlb"
>> -------------------------
>> [    0.000000] HugeTLB: unsupported hugepagesz=1G
>> [    0.000000] HugeTLB: hugepages=1 does not follow a valid 
>> hugepagesz, ignoring
>> [    0.706375] HugeTLB support is disabled!
>> [    0.773530] hugetlbfs: disabling because there are no supported 
>> hugepage sizes
>>
>> $ cat /proc/meminfo | grep -i "hugetlb"
>> ----------------------------------
>> <Nothing>
>>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>
>> Changelog:
>>
>> v1:
>> https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/ 
>>
>>
>> v2:
>>   - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()
>>
>> ---
>>   arch/powerpc/mm/hugetlbpage.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/hugetlbpage.c 
>> b/arch/powerpc/mm/hugetlbpage.c
>> index 6b043180220a..087a8df32416 100644
>> --- a/arch/powerpc/mm/hugetlbpage.c
>> +++ b/arch/powerpc/mm/hugetlbpage.c
>> @@ -135,8 +135,12 @@ int __init alloc_bootmem_huge_page(struct hstate 
>> *h, int nid)
>>     bool __init arch_hugetlb_valid_size(unsigned long size)
>>   {
>> -    int shift = __ffs(size);
>> -    int mmu_psize;
>> +    int shift, mmu_psize;
>> +
>> +    if (!hugepages_supported())
>> +        return false;
>> +
>> +    shift = __ffs(size);
>
> Why change the declaration/init of shift ?

I did this to avoid running code that wasn't necessary.

>
> It should be enough to leave things as they are and just add
>
>     if (!hugepages_supported())
>         return false;

Sure.

>
>
>>         /* Check that it is a page size supported by the hardware and
>>        * that it fits within pagetable and slice limits. */
>

Thanks for the review.

- Sourabh Jain

