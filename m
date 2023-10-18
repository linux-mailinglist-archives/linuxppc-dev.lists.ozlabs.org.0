Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C32937CD46C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 08:24:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cmndNHBq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9LR74pLfz3cV4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 17:24:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cmndNHBq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9LQD0Lrgz30Nr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 17:23:31 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39I5drCh016116;
	Wed, 18 Oct 2023 06:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=rMW9qTdfdTQaa2D/IgDI/vD0Y5QaFcY2FyO0xWW+iKU=;
 b=cmndNHBqZLenLdq3GAxDL+O34/IJNClg6/KnIRt382SLox72m32Gg55gCfqa1dzgB07L
 3dn69Jaj4Ie8M3OLWk48J30sR+ZqTilPoiS3Iy5rH2h8LkjOBMCr3YzEC+OTYpD9UcNw
 PBMfNkAz1XqcOLIaIybuJFe/56IW4pNgSOj4NONAF1GvdielJATPxqVArHa9P1Vn2Z05
 AEiF6XU3XJRfgkGJc8YGwN+QGBA4op2puUSaG+uMKvCt81nC/socgcyPirmcJNgnlL6C
 qgUgFAyaprrIhtbAPSQGhZBrtVoj+UdUMiSQx0TwNIbD0tksVNaqHq7MGTW1q+l7cMWH 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tt9dk909w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 06:23:09 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39I6JZiV010298;
	Wed, 18 Oct 2023 06:23:09 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tt9dk909k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 06:23:08 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39I30Jlq019700;
	Wed, 18 Oct 2023 06:23:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr811nrtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 06:23:08 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39I6N6uK11731702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Oct 2023 06:23:06 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DACC20043;
	Wed, 18 Oct 2023 06:23:06 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2401620040;
	Wed, 18 Oct 2023 06:23:05 +0000 (GMT)
Received: from [9.43.81.129] (unknown [9.43.81.129])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Oct 2023 06:23:04 +0000 (GMT)
Message-ID: <85534337-d558-42ed-b042-115f3460d740@linux.ibm.com>
Date: Wed, 18 Oct 2023 11:53:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mm: Update set_ptes to call pte_filter for all
 the ptes
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "npiggin@gmail.com" <npiggin@gmail.com>
References: <20231018045523.776679-1-aneesh.kumar@linux.ibm.com>
 <9c598590-6911-3254-1560-62785fc325dc@csgroup.eu>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <9c598590-6911-3254-1560-62785fc325dc@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cTcUPYM2aNDOiQ7OGrzwceiSbmJJ9cWl
X-Proofpoint-ORIG-GUID: xXk0U4zN-95FlP3J5wWlUO-BlcK8d6Zi
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_03,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180052
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "willy@infradead.org" <willy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/18/23 11:25 AM, Christophe Leroy wrote:
> 
> 
> Le 18/10/2023 à 06:55, Aneesh Kumar K.V a écrit :
>> With commit 9fee28baa601 ("powerpc: implement the new page table range
>> API") we added set_ptes to powerpc architecture but the implementation
>> missed calling the pte filter for all the ptes we are setting in the
>> range. set_pte_filter can be used for filter pte values and on some
>> platforms which don't support coherent icache it clears the exec bit so
>> that we can flush the icache on exec fault
>>
>> The patch also removes the usage of arch_enter/leave_lazy_mmu() because
>> set_pte is not supposed to be used when updating a pte entry. Powerpc
>> architecture uses this rule to skip the expensive tlb invalidate which
>> is not needed when you are setting up the pte for the first time. See
>> commit 56eecdb912b5 ("mm: Use ptep/pmdp_set_numa() for updating
>> _PAGE_NUMA bit") for more details
>>
>> Fixes: 9fee28baa601 ("powerpc: implement the new page table range API")
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/mm/pgtable.c | 33 ++++++++++++++++++++-------------
>>   1 file changed, 20 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
>> index 3ba9fe411604..95ab20cca2da 100644
>> --- a/arch/powerpc/mm/pgtable.c
>> +++ b/arch/powerpc/mm/pgtable.c
>> @@ -191,28 +191,35 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>>   		pte_t pte, unsigned int nr)
>>   {
>>   	/*
>> -	 * Make sure hardware valid bit is not set. We don't do
>> -	 * tlb flush for this update.
>> +	 * We don't need to call arch_enter/leave_lazy_mmu_mode()
>> +	 * because we expect set_ptes to be only be used on not present
>> +	 * and not hw_valid ptes. Hence there is not translation cache flush
>> +	 * involved that need to be batched.
>>   	 */
>> -	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
>> +	for (;;) {
>>   
>> -	/* Note: mm->context.id might not yet have been assigned as
>> -	 * this context might not have been activated yet when this
>> -	 * is called.
>> -	 */
>> -	pte = set_pte_filter(pte);
>> +		/*
>> +		 * Make sure hardware valid bit is not set. We don't do
>> +		 * tlb flush for this update.
>> +		 */
>> +		VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
>>   
>> -	/* Perform the setting of the PTE */
>> -	arch_enter_lazy_mmu_mode();
>> -	for (;;) {
>> +		/* Note: mm->context.id might not yet have been assigned as
>> +		 * this context might not have been activated yet when this
>> +		 * is called.
>> +		 */
>> +		pte = set_pte_filter(pte);
> 
> Why do you need to call set_pte_filter() inside the loop ?
> The only difference between previous pte and next pte is the RPN, other 
> flags remain untouched so I can't see why you need to call 
> set_pte_filter() again.
> 

I missed the fact that we use the filtered pte in all the ptes in the range. One other details
that made me look at calling the filter in the loop was we clearing the struct page->flags.
The only flag right now we care about the PG_dcache_clean and that moved to folio. So we might be
good here. May be we add a comment in set_pte_filter saying can operate only on folio->flags ? 

>> +
>> +		/* Perform the setting of the PTE */
>>   		__set_pte_at(mm, addr, ptep, pte, 0);
>>   		if (--nr == 0)
>>   			break;
>>   		ptep++;
>> -		pte = __pte(pte_val(pte) + (1UL << PTE_RPN_SHIFT));
>>   		addr += PAGE_SIZE;
>> +		/* increment the pfn */
>> +		pte = __pte(pte_val(pte) + PAGE_SIZE);
> 
> PAGE_SIZE doesn't work on all platforms, see for instance e500.
> 
> see comment at 
> https://elixir.bootlin.com/linux/v6.3-rc2/source/arch/powerpc/include/asm/nohash/32/pgtable.h#L147
> 
> And then you see 
> https://elixir.bootlin.com/linux/v6.3-rc2/source/arch/powerpc/include/asm/nohash/pte-e500.h#L63
> 

Didn't know that. I actually wanted to do pfn_pte(pte_pfn(pte) + 1) . But that needs pgprot_t. I
can move it back to PTE_RPN_SHIFT with details of the above documented. 

>> +
>>   	}
>> -	arch_leave_lazy_mmu_mode();
>>   }
>>   
>>   void unmap_kernel_page(unsigned long va)
> 
> Christophe

-aneesh
