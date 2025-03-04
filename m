Return-Path: <linuxppc-dev+bounces-6658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC11EA4D308
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 06:33:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6PVp04gLz2yy9;
	Tue,  4 Mar 2025 16:33:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741066433;
	cv=none; b=IG9eswmoSAzNANpa0LwuGNvLGyuWbOV4GtrVZIDcqi9JZUebH2dKEqGIY9Z+rV0RWuXRvfjb2huewUQZeH//xHIKYYtTDIrmRKB0zqIamcfsF2FJIeXUFlSs7xyp+dGBv08cw5bByP71josgkvCimZqkMY1s9Nns84xF69Bg8yaqvtzT9mlCtPQ37nmz44Ma3JxuCiG9Fyez4ztUkt4wEFKwLJR6OpCpamGtG6cIRPLFFNClxDa6rPgBRECRmwSK8CxLV+evhh/3BBpC2Y9XO4CmKpT12tcxKy5K3MBl4/wOPi8LO5wEooEIZuAkn0Tq9LiQfwpWGvmuRijZjhDGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741066433; c=relaxed/relaxed;
	bh=Kak97jxeFCsEI5n0EtRiTfMEbfiu5QO8EMfREFfi7Cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jz+yNH+hZjOlC2IcnOFgxh8/+mcaWzII8lO+3a8T/7jgeRVtUyZdh2dnAmRru1IzD05i54x54qp893tl5VMN8n1tRE1LkypD8c3PZU3j1csQCTivR5alUX2EufRllXaNflMjoLB62K47+rF0CqBMaFm3Ynrb0mTuzEMEdFPHIpxqomz3dGmvcltCkZx5r4FEaMhGP8dIrBDVuQZ+WjtQUrf7wPmVPNo9KtSKDzJlJoiqfS2zdJYCJt7aDpvZ5MIrpA9EhRcRB7XicakbOQlVOasAO2WSNK7NqbawAHDs6gxlwCjX/PrnnIPKH0SPKtCl9hQw9aN2Ofui4R9eodP9mQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cmzxXWnu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cmzxXWnu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6PVn1pFyz2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 16:33:52 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523Lf37b022696;
	Tue, 4 Mar 2025 05:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Kak97j
	xeFCsEI5n0EtRiTfMEbfiu5QO8EMfREFfi7Cc=; b=cmzxXWnu8DDlvaZxMU0tc9
	t4XWLcxv3Wn/d9iPiLomFwpLUhQbSquNw5O41TeqNFasqYl/lu28V0ZYIaIvTq5u
	RNT+LJ6aCfesRnLgwngZFDpmZoG8vFheeD3kmyJF7gS4rC/rXWtzaiiavKPbJwar
	dw+AEipb8pUR5kxRQqqODckNJpMltwPE2PiWJKWSofO58IfoeT4PlsXgyckfp+OG
	34EQRyBkiSlZMQTkI6y+UnUslMIgHFq/yTVCxak2WgJQicBF8ALlgshRfSNjMBZx
	Hmxjc8ddPQ1MB5oXkajaiUOi8lBB8lbgr7ilT1mJ5hUZlcNEQxbxfe6Zv1Ufw2bA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 455dunvn3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 05:33:41 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5245Tu9P030315;
	Tue, 4 Mar 2025 05:33:41 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 455dunvn3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 05:33:41 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5243FWwv009038;
	Tue, 4 Mar 2025 05:33:40 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454cxybxhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 05:33:39 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5245Xdp530409328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Mar 2025 05:33:39 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4441E58056;
	Tue,  4 Mar 2025 05:33:39 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4E2658052;
	Tue,  4 Mar 2025 05:33:37 +0000 (GMT)
Received: from [9.39.17.109] (unknown [9.39.17.109])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Mar 2025 05:33:37 +0000 (GMT)
Message-ID: <d4b3fdbc-645f-4a43-bd9c-d29f4e4dacbc@linux.ibm.com>
Date: Tue, 4 Mar 2025 11:03:35 +0530
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
 <yq5aeczexo5w.fsf@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <yq5aeczexo5w.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _Arnb8ArP1IDWJWCErMUeDDBo0Nx5wUy
X-Proofpoint-GUID: lxaNxDj0DJ9WZ4NG0IaXi78xL_7mhOo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_02,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040044
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 3/3/25 18:32, Aneesh Kumar K.V wrote:
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
>                              ^^^ this should be allocated in ram?
>

Yes, it should be allocated from RAM. However, in the current
implementation, an altmap page gets allocated. This is because the
NS2 vmemmap section's start address is unaligned. There is an
altmap_cross_boundary() check. Here, from the vmemmap section
start, we identify the namespace start and check if the namespace start
is within the boundary. Since it is within the boundary, it returns false,
causing an altmap page to be allocated. During the PTE update, the
vmemmap start address is aligned down to PAGE_SIZE, and the PTE is
updated. As a result, the altmap page is shared between the current
and previous namespaces.

If we had aligned the vmemmap start address, the
altmap_cross_boundary() function would return true because the
vmemmap section's start address belongs to the previous
namespace. Therefore normal page gets allocated. During the
PTE set operation, since the address is already aligned, the
PTE will updated.


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
>> +	start = ALIGN_DOWN(start, PAGE_SIZE);
>> +
>>   	for (addr = start; addr < end; addr = next) {
>>   		next = pmd_addr_end(addr, end);
>>   
>> -- 
>> 2.43.5

