Return-Path: <linuxppc-dev+bounces-5591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 722F9A1D353
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 10:27:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhNP709tpz2yRd;
	Mon, 27 Jan 2025 20:27:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737970058;
	cv=none; b=Whrj61SrJkWYhV9uBj4Pi5qYsEdBnlYM7+1RfL1Dbmh9XpP9YYqYsBhp/n+2iDRfhlyV8sATnX4YY3C+4axe+ukP1HcTnCOO+b5l3V6L89rBeR6eaPza37L9Gjxav9QpN7NtJ5RbbiR5yfuC5lkq35s+tb8tYzs6crxELkJ2FGggWnwwIAJRxwskwtosQ7Ix/h2e9QrC2fqP2CNwr9i0dcAUGR8pvmS6fux4lOwfvJrtn/QDGX/AJ2gO0U8n1OmzupQ+Jbv2/4LcTX9GmJoze9exGvTo47XpDntQ9TaCddbq/rY3opHHQfH3aJ7+e8cBvdSq7E13C5aEUvQJVNF7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737970058; c=relaxed/relaxed;
	bh=WsVi+DYhSQd3Oo6q/oP1dOnPBdG+aIUhCcAg0RQ++DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYP4mdilY1RBsa4m9q/cJ+oSnxt6xk6zuA+rCAr+WK5z3up/i/BjE2fHAyEvzamcPf8QGqGooyWb0aiJ4XAQfxZLIdrOOjcHVwY6MJjeT5/gb0lDGXxjRjv1v7QngKOn6gZlamskBfTm91uSSusbm4brWVG+5BwG98XShBeRY/w3Pre+suk0ore4hf7ZnP58Ta2lxyhmHwY3V/h61cqeupMzNV6SbqIRz43TzZYR/+PcHXbA6FjsCR+HxscGNQwAEMVrZKZOxTLhDkE9mrCnpBxD8MQyIAIl6omrDegnJgpi6KppCP7LHQNBcryKBn8LE4XLtNROFRopan6XXqF92w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=axe3cv5B; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=axe3cv5B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhNP60mTWz2yNt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 20:27:37 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R5Nnah030642;
	Mon, 27 Jan 2025 09:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WsVi+D
	YhSQd3Oo6q/oP1dOnPBdG+aIUhCcAg0RQ++DE=; b=axe3cv5BpF5yjS+YJJYlMz
	JQ931phg0kSVqq95btp9/0PEsAwnWVaw37U8Yv1dxVyga9rPiZWwRiOguq1/FwSz
	19FSs5ucfPKC+XiJSLThEgn5P1k3XYlG17naPBqvrdX/KmRlWrT7zdNpuIkQBtTD
	tLsruoYnAC7T8aclN51TTz4gPfoIQ74LZ9ZcFE57k3XdTlvRuaYw2XYLtlu9MYRI
	6LxttkOqoj38gW6PJpWuKPUqxfPGcCj1YY+cLGLKgU22PB6QCxFJStSq8XgX7UBl
	lrXhAdx6iO/3j0fA5wcOasQkVhcTB32DkEY+ozTec/bEgxakGk1lJ/gUf1fzLLyg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44e3y7s189-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 09:27:26 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50R9DsPk022172;
	Mon, 27 Jan 2025 09:27:25 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44dcgjdb0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 09:27:25 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50R9RMxP47514030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 09:27:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E779120040;
	Mon, 27 Jan 2025 09:27:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 535542004B;
	Mon, 27 Jan 2025 09:27:16 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jan 2025 09:27:16 +0000 (GMT)
Message-ID: <9a77fd03-a638-45a5-b406-56972f3937a8@linux.ibm.com>
Date: Mon, 27 Jan 2025 14:57:15 +0530
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
Subject: Re: [PATCH v3] powerpc/hugetlb: Disable gigantic hugepages if fadump
 is active
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20250125104928.88881-1-sourabhjain@linux.ibm.com>
 <50d7c398-b043-478f-92ee-70d144126e4a@csgroup.eu>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <50d7c398-b043-478f-92ee-70d144126e4a@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RpI0q4f6S4T1VdEgQ_m6ECJjlXNRLS-2
X-Proofpoint-GUID: RpI0q4f6S4T1VdEgQ_m6ECJjlXNRLS-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270072
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Christophe,


On 27/01/25 13:23, Christophe Leroy wrote:
>
>
> Le 25/01/2025 à 11:49, Sourabh Jain a écrit :
>> The fadump kernel boots with limited memory solely to collect the kernel
>> core dump. Having gigantic hugepages in the fadump kernel is of no use.
>> Many times, the fadump kernel encounters OOM (Out of Memory) issues if
>> gigantic hugepages are allocated.
>>
>> To address this, disable gigantic hugepages if fadump is active by
>> returning early from arch_hugetlb_valid_size() using
>> hugepages_supported(). hugepages_supported() returns false if fadump is
>> active.
>
> Maybe you could explain how that's done. As far as I can see there is 
> no powerpc specific version of hugepages_supported(), so it relies on 
> hpage_shift being 0, but I was not able to quickly spot where that is 
> done.


hugepages_supported() is defined for powerpc in
arch/powerpc/include/asm/hugetlb.h

static inline bool hugepages_supported(void)
{
     if (hugetlb_disabled)
         return false;

     return HPAGE_SHIFT != 0;
}

Bu yes I will add a point about how it is disable for fadump kernel in
the commit message.


>
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
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


Thank you for the Review!

- Sourabh Jain


>
>> ---
>>
>> Changelog:
>>
>> v1:
>> https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/ 
>>
>>
>> v2:
>> https://lore.kernel.org/all/20250124103220.111303-1-sourabhjain@linux.ibm.com/ 
>>
>>   - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()
>>
>> v3:
>>   - Do not modify the initialization of the shift variable
>>
>> ---
>>   arch/powerpc/mm/hugetlbpage.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/powerpc/mm/hugetlbpage.c 
>> b/arch/powerpc/mm/hugetlbpage.c
>> index 6b043180220a..88cfd182db4e 100644
>> --- a/arch/powerpc/mm/hugetlbpage.c
>> +++ b/arch/powerpc/mm/hugetlbpage.c
>> @@ -138,6 +138,9 @@ bool __init arch_hugetlb_valid_size(unsigned long 
>> size)
>>       int shift = __ffs(size);
>>       int mmu_psize;
>>   +    if (!hugepages_supported())
>> +        return false;
>> +
>>       /* Check that it is a page size supported by the hardware and
>>        * that it fits within pagetable and slice limits. */
>>       if (size <= PAGE_SIZE || !is_power_of_2(size))
>


