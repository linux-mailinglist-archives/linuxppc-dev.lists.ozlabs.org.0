Return-Path: <linuxppc-dev+bounces-6828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB4A58387
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Mar 2025 12:02:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z9cYg3gLVz2yhG;
	Sun,  9 Mar 2025 22:02:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741518151;
	cv=none; b=nZubq+8B22g6QChbKshdRghibJv8bSa9EJ7wMg3qzVfS54fdgmHu2n8Bs/vY8bOCIYV1IoGXOPrLG+DbDuKcXQ564rvOGDIA8wLreDvlKxnuF9uNmJkE0QMcnAowWRQ/P3Irlpff1xtW4F/XeZjIhKDwruBvC4nuSnPqyPjkJ1jccu1X4mNBc9vMSgHBfzieyMz6ApGjmGnogQcwh6Kb6Z0NDw4tPKt/CQkntloaZ1roBxmbqBDqZ7wiRbbPihU44RGhFnFOH5gnCq1CYb/rtbr5pXAAqNh8hyeDS33uIOwEqU+104RWBsWVJGbT5bRNWm9ghZtuOhZU2FC+dNLZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741518151; c=relaxed/relaxed;
	bh=LZDb+4jLNJAle1RgLjRwy8WEQGGDmIVIIzm3xVWly9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCokYQWnh7gKeNQHZYH+MJxPSC0MURQI90HzFzs7igQ7h85G8C3FSQlnYdl1nRO1zEBjNRmwM/50DAHeQSrRtxtabCbG5q864HXWO1cbCnLUSUbXEjfqgXYz/N76OFn7glkmJb8jnWZDgR4CqC1OYHEj4CTfVvB0ELvKIZ3GVOGPGerykG9/ggJZUY5phuOWQy0Kmm7EYpehFWqRuDVNS5ziHaQLkbkPfilGNAWfZ130t0m+sbX0wxIGKbikjJ2cSXtnNJsZOwWXetsJznZEOii+eMtOI566OLx/VCEq4LmLknQZtJCu75JM8ZTmDkKLNR+uMdM0daoDjQhGJ5/1OA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pI6dFHkH; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pI6dFHkH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z9cYf23tGz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Mar 2025 22:02:29 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5298eEPQ002841;
	Sun, 9 Mar 2025 11:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LZDb+4
	jLNJAle1RgLjRwy8WEQGGDmIVIIzm3xVWly9M=; b=pI6dFHkHjV+jXt+7u9EYBA
	TRKpLDqgO0d5CUMIAzBJJWMlqqAkUPgCQl4DXXeP0FcVU5g04iyQIq3KLfKeMWKA
	oTN7uozCVa02qY7HmQSlvJSYp1weI7ER78c2P5Bc3Bz7uG4DftgyiPY/g7/2eZ9s
	S3ppD5ZKqEbAvmdajzRLmIjLylVrENbWXM7juVMBPQlTfBPNJFS8P2UfUCSBEmLI
	KttiduArPYWAvfggG1ONAFsg2N1TLP5TpEXLGKu/lRsZHP0cwVvH1VHC7mv7jqci
	8J4efPsfZMcCPv6xAColpg6lTQSb857FhQXVQ/68IpYbAnb0hNMamEfruZBFkvaQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 458nx1bfh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 11:02:23 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 529B2NKd021516;
	Sun, 9 Mar 2025 11:02:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 458nx1bfh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 11:02:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5296RbBs027518;
	Sun, 9 Mar 2025 11:02:22 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4591qk9nt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 11:02:22 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 529B2LgE30278376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Mar 2025 11:02:21 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CBCE58060;
	Sun,  9 Mar 2025 11:02:21 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8737058052;
	Sun,  9 Mar 2025 11:02:19 +0000 (GMT)
Received: from [9.39.22.152] (unknown [9.39.22.152])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Mar 2025 11:02:19 +0000 (GMT)
Message-ID: <0878273a-4689-4cb1-a4ab-34746c38faec@linux.ibm.com>
Date: Sun, 9 Mar 2025 16:32:17 +0530
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
Subject: Re: [PATCH] book3s64/radix : Align section vmemmap start address to
 PAGE_SIZE
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>
References: <20250226043426.224494-1-donettom@linux.ibm.com>
 <yq5ajz90rxpa.fsf@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <yq5ajz90rxpa.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3KsEjvDLu7e_R5TP0We2PAVWZCMe-8Z_
X-Proofpoint-ORIG-GUID: NGbV-Qr3ne0MDzwTyQgWduIKhEW0v2wG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503090087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 3/8/25 9:16 AM, Aneesh Kumar K.V wrote:
> Donet Tom <donettom@linux.ibm.com> writes:
>
>> A vmemmap altmap is a device-provided region used to provide
>> backing storage for struct pages. For each namespace, the altmap
>> should belong to that same namespace. If the namespaces are
>> created unaligned, there is a chance that the section vmemmap
>> start address could also be unaligned. If the section vmemmap
>> start address is unaligned, the altmap page allocated from the
>> current namespace might be used by the previous namespace also.
>> During the free operation, since the altmap is shared between two
>> namespaces, the previous namespace may detect that the page does
>> not belong to its altmap and incorrectly assume that the page is a
>> normal page. It then attempts to free the normal page, which leads
>> to a kernel crash.
>>
>> In this patch, we are aligning the section vmemmap start address
>> to PAGE_SIZE. After alignment, the start address will not be
>> part of the current namespace, and a normal page will be allocated
>> for the vmemmap mapping of the current section. For the remaining
>> sections, altmaps will be allocated. During the free operation,
>> the normal page will be correctly freed.
>>
>> Without this patch
>> ==================
>> NS1 start               NS2 start
>>   _________________________________________________________
>> |         NS1               |            NS2              |
>>   ---------------------------------------------------------
>> | Altmap| Altmap | .....|Altmap| Altmap | ...........
>> |  NS1  |  NS1   |      | NS2  |  NS2   |
>>
>> In the above scenario, NS1 and NS2 are two namespaces. The vmemmap
>> for NS1 comes from Altmap NS1, which belongs to NS1, and the
>> vmemmap for NS2 comes from Altmap NS2, which belongs to NS2.
>>
>> The vmemmap start for NS2 is not aligned, so Altmap NS2 is shared
>> by both NS1 and NS2. During the free operation in NS1, Altmap NS2
>> is not part of NS1's altmap, causing it to attempt to free an
>> invalid page.
>>
>> With this patch
>> ===============
>> NS1 start               NS2 start
>>   _________________________________________________________
>> |         NS1               |            NS2              |
>>   ---------------------------------------------------------
>> | Altmap| Altmap | .....| Normal | Altmap | Altmap |.......
>> |  NS1  |  NS1   |      |  Page  |  NS2   |  NS2   |
>>
>> If the vmemmap start for NS2 is not aligned then we are allocating
>> a normal page. NS1 and NS2 vmemmap will be freed correctly.
>>
>> Fixes: 368a0590d954("powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function")
>> Co-developed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
>>   arch/powerpc/mm/book3s64/radix_pgtable.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> index 311e2112d782..b22d5f6147d2 100644
>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> @@ -1120,6 +1120,8 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
>>   	pmd_t *pmd;
>>   	pte_t *pte;
>>
>         /*
>          * Make sure we align the start vmemmap addr so that we calculate
>         the correct start_pfn in altmap boundary check to decided whether
>         we should use altmap or RAM based backing memory allocation. Also
>         the address need to be aligned for set_pte operation.
>
>         If the start addr is already PMD_SIZE aligned we will try to use
>         a pmd mapping. We don't want to be too aggressive here beacause
>         that will cause more allocations in RAM. So only if the namespace
>         vmemmap start addr is PMD_SIZE aligned we will use PMD mapping.
>
>         */
>
> May be with some comments as above?
>

Sure, I will update it and send a V3.


>
>> +	start = ALIGN_DOWN(start, PAGE_SIZE);
>> +
>>   	for (addr = start; addr < end; addr = next) {
>>   		next = pmd_addr_end(addr, end);
>>   
>> -- 
>> 2.43.5

