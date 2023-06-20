Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1868736EAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 16:31:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OqPL4qH1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlpwN62lyz3bXw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 00:31:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OqPL4qH1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlpvQ5g2fz30f7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 00:30:26 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35KEN0tI009766;
	Tue, 20 Jun 2023 14:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=n2xX6aO4xwN9RgYibyev+a+0/vVcwRyICxOAka2Y5dw=;
 b=OqPL4qH1h2I8Zeu8wMAaaOA3VD+GJDrM5cID1Sbynj5uaTJO/SZAbcIV37lrn0IXFjtt
 3oppf3RRYIkg+SMTr1F9lDEhfANFRH7LU2BVYxPJCDzTx0PFa5r15/2bJLgTbSk//iFh
 4D+yLgcfw3sKNqeLWHkkctzMrOtlPmrSEiQOmiOC94y3pwTCCI8+xQ77Gr+mveOF70RS
 SYhR1pJBXNdq0BQxkXoIl1lVNSurFGKUGkDOVxIgNm+/NMXZgYoel6j3OV9r9QqUqsx3
 Av++4xUnLuBtqwYppyahQCcCWqM92bWJRCO5KARHOv5dskbJ8tPZxQaPpNj0yYPS3kXh 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbdtt85fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2023 14:29:58 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35KEOJGX013769;
	Tue, 20 Jun 2023 14:29:57 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbdtt85ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2023 14:29:57 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35KC0noH031811;
	Tue, 20 Jun 2023 14:29:56 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3r94f68kje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2023 14:29:56 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35KETs2D64618820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 14:29:55 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCD2F58066;
	Tue, 20 Jun 2023 14:29:54 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 968375804B;
	Tue, 20 Jun 2023 14:29:49 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.83.124])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Jun 2023 14:29:49 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 08/16] mm/vmemmap: Improve vmemmap_can_optimize and
 allow architectures to override
In-Reply-To: <ed1057ce-2d8d-1053-9f54-2801cfed9de4@oracle.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
 <20230616110826.344417-9-aneesh.kumar@linux.ibm.com>
 <ed1057ce-2d8d-1053-9f54-2801cfed9de4@oracle.com>
Date: Tue, 20 Jun 2023 19:59:47 +0530
Message-ID: <87zg4ugqas.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zMp05J84sT5d4O-PDIFL4bBYOuqJcqxp
X-Proofpoint-GUID: OUrd2cVPyI1EklakWIrUYy3OfJ9ia0W5
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200127
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
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, npiggin@gmail.com, linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>, akpm@linux-foundation.org, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joao Martins <joao.m.martins@oracle.com> writes:

> On 16/06/2023 12:08, Aneesh Kumar K.V wrote:
>> dax vmemmap optimization requires a minimum of 2 PAGE_SIZE area within
>> vmemmap such that tail page mapping can point to the second PAGE_SIZE area.
>> Enforce that in vmemmap_can_optimize() function.
>> 
>> Architectures like powerpc also want to enable vmemmap optimization
>> conditionally (only with radix MMU translation). Hence allow architecture
>> override.
>> 
> This makes sense. The enforcing here is not just for correctness but because you
> want to use VMEMMAP_RESERVE_NR supposedly?
>
> I would suggest having two patches one for the refactor and another one for the
> override, but I don't feel particularly strongly about it.
>

I will wait for feedback from others. If we have others also suggesting
for the split patch I will do that.

>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  include/linux/mm.h | 30 ++++++++++++++++++++++++++----
>>  mm/mm_init.c       |  2 +-
>>  2 files changed, 27 insertions(+), 5 deletions(-)
>> 
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 27ce77080c79..9a45e61cd83f 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -31,6 +31,8 @@
>>  #include <linux/memremap.h>
>>  #include <linux/slab.h>
>>  
>> +#include <asm/page.h>
>> +
>
> Why is this include needed?

That was for PAGE_SHIFT. But then we do pull that through other include
dependencies. I will see if i can drop that.

>
>>  struct mempolicy;
>>  struct anon_vma;
>>  struct anon_vma_chain;
>> @@ -3550,13 +3552,33 @@ void vmemmap_free(unsigned long start, unsigned long end,
>>  		struct vmem_altmap *altmap);
>>  #endif
>>  
>> +#define VMEMMAP_RESERVE_NR	2
>
> see below
>
>>  #ifdef CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP
>> -static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
>> -					   struct dev_pagemap *pgmap)
>> +static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
>> +					  struct dev_pagemap *pgmap)
>>  {
>> -	return is_power_of_2(sizeof(struct page)) &&
>> -		pgmap && (pgmap_vmemmap_nr(pgmap) > 1) && !altmap;
>> +	if (pgmap) {
>> +		unsigned long nr_pages;
>> +		unsigned long nr_vmemmap_pages;
>> +
>> +		nr_pages = pgmap_vmemmap_nr(pgmap);
>> +		nr_vmemmap_pages = ((nr_pages * sizeof(struct page)) >> PAGE_SHIFT);
>> +		/*
>> +		 * For vmemmap optimization with DAX we need minimum 2 vmemmap
>
>
>
>> +		 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
>> +		 */
>> +		return is_power_of_2(sizeof(struct page)) &&
>> +			(nr_vmemmap_pages > VMEMMAP_RESERVE_NR) && !altmap;
>> +	}
>
> It would be more readable (i.e. less identation) if you just reverse this:
>
> 	unsigned long nr_vmemmap_pages;
>
> 	if (!pgmap || !is_power_of_2(sizeof(struct page))
> 		return false;
>
> 	nr_vmemmap_pages = ((pgmap_vmemmap_nr(pgmap) *
> 			     sizeof(struct page)) >> PAGE_SHIFT);
>
> 	/*
> 	 * For vmemmap optimization with DAX we need minimum 2 vmemmap
> 	 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
> 	 */
> 	return (nr_vmemmap_pages > VMEMMAP_RESERVE_NR) && !altmap;
>
>

Will update



>> +	return false;
>>  }
>> +/*
>> + * If we don't have an architecture override, use the generic rule
>> + */
>> +#ifndef vmemmap_can_optimize
>> +#define vmemmap_can_optimize __vmemmap_can_optimize
>> +#endif
>> +
>
> sparse-vmemmap code is trivial to change to use dedup a single vmemmap page
> (e.g. to align with hugetlb), hopefully the architecture override to do. this is
> to say whether VMEMMAP_RESERVE_NR should have similar to above?

VMEMMAP_RESERVE_NR was added to avoid the usage of `2` in the below code.
The reason we need the arch override was to add an additional check on
ppc64 as shown by patch

https://lore.kernel.org/linux-mm/20230616110826.344417-16-aneesh.kumar@linux.ibm.com/

bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
{
	if (radix_enabled())
		return __vmemmap_can_optimize(altmap, pgmap);

	return false;
}


>
>>  #else
>>  static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
>>  					   struct dev_pagemap *pgmap)
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index 7f7f9c677854..d1676afc94f1 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -1020,7 +1020,7 @@ static inline unsigned long compound_nr_pages(struct vmem_altmap *altmap,
>>  	if (!vmemmap_can_optimize(altmap, pgmap))
>>  		return pgmap_vmemmap_nr(pgmap);
>>  
>> -	return 2 * (PAGE_SIZE / sizeof(struct page));
>> +	return VMEMMAP_RESERVE_NR * (PAGE_SIZE / sizeof(struct page));
>>  }
>>  
>>  static void __ref memmap_init_compound(struct page *head,
