Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6114F53150B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 18:45:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6NVW2gC7z3bl7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 02:45:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g1CFD6qb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=g1CFD6qb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6NTg655Mz3brd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 02:44:39 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NG1QkF018111;
 Mon, 23 May 2022 16:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VJJEq7h+sMoHr6vU3hHM16ka9zwPWnb0qVoPNv2p87k=;
 b=g1CFD6qb9tgYrYwYu9Ge4hw3g/iVtLgIuetc0jpjF/hxOf5QTGiGq6SL1J6JP1OrYFXK
 sqi+FnGjlTO9DBAyiNGn+qy0Mf/m+hZz5gtKNpM9mijnRCMJ2sELo113lOfSR4mP4zUe
 bIv+rJ1g3v2AKsfX1sD1xIOd11Q+PiwJzUz0XErZlLUlkxmllHSfjHRrnTgiWhZBnuHM
 e7ar2vpXt3Ndab7gDpXTcqWeauMB/+bC/d8/5mvseTpXXdO59mD8H5sUNKgxVPRjoNjO
 VWoWKh6Nt9j0PbEot0F7R2PPhoFmdyQhsQSnlGA9Xkt9asDpfeCqHqitlZqVlFpO1peD LQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8de50yk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 16:44:30 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24NGgI2U003829;
 Mon, 23 May 2022 16:44:28 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3g6qq9b4ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 16:44:28 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24NGiQQu56885600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 16:44:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5B9F52050;
 Mon, 23 May 2022 16:44:25 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 92D9D5204E;
 Mon, 23 May 2022 16:44:25 +0000 (GMT)
Message-ID: <d33ac27a-ac7f-4ffb-c22c-08ff9a29bbd5@linux.ibm.com>
Date: Mon, 23 May 2022 18:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v10 10/13] powerpc/mm: Move get_unmapped_area functions to
 slice.c
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
References: <cover.1649523076.git.christophe.leroy@csgroup.eu>
 <b5d9c124e82889e0cb115c150915a0c0d84eb960.1649523076.git.christophe.leroy@csgroup.eu>
 <72ed4b46-866f-4468-d1de-e9d316bf47f4@linux.ibm.com>
 <78b3a7f4-56e2-e11f-005c-2a1dd563b5b3@csgroup.eu>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <78b3a7f4-56e2-e11f-005c-2a1dd563b5b3@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zh9SylZnRLV5Y4TXfWxmuTq8IeaQ6ySr
X-Proofpoint-GUID: zh9SylZnRLV5Y4TXfWxmuTq8IeaQ6ySr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_07,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205230093
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/05/2022, 17:18:10, Christophe Leroy wrote:
> 
> 
> Le 23/05/2022 à 14:27, Laurent Dufour a écrit :
>> On 09/04/2022, 19:17:34, Christophe Leroy wrote:
>>> hugetlb_get_unmapped_area() is now identical to the
>>> generic version if only RADIX is enabled, so move it
>>> to slice.c and let it fallback on the generic one
>>> when HASH MMU is not compiled in.
>>>
>>> Do the same with arch_get_unmapped_area() and
>>> arch_get_unmapped_area_topdown().
>>
>> This breaks the build when CONFIG_PPC_64S_HASH_MMU is not set.
>>
>> The root cause is that arch/powerpc/mm/book3s64/slice.c is not built if
>> !CONFIG_PPC_64S_HASH_MMU.
>> The commit f693d38d9468 (powerpc/mm: Remove CONFIG_PPC_MM_SLICES,
>> 2022-04-09) builds slice.c only if CONFIG_PPC_64S_HASH_MMU.
> 
> I think the root cause is slice.h is being included allthough 
> !CONFIG_PPC_64S_HASH_MMU, which leads to HAVE_ARCH_UNMAPPED_AREA and 
> HAVE_ARCH_UNMAPPED_AREA_TOPDOWN being defined while they shouldn't
> 
> Wondering why I didn't see that before.
> 
> slice.h gets included via asm/book3s/64/mmu-hash.h
> 
> I was able to build microwatt_defconfig with the following changes:

That works for me too.

> 
> diff --git a/arch/powerpc/include/asm/book3s/64/slice.h 
> b/arch/powerpc/include/asm/book3s/64/slice.h
> index b8eb4ad271b9..5fbe18544cbd 100644
> --- a/arch/powerpc/include/asm/book3s/64/slice.h
> +++ b/arch/powerpc/include/asm/book3s/64/slice.h
> @@ -4,11 +4,13 @@
> 
>   #ifndef __ASSEMBLY__
> 
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   #ifdef CONFIG_HUGETLB_PAGE
>   #define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
>   #endif
>   #define HAVE_ARCH_UNMAPPED_AREA
>   #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
> +#endif
> 
>   #define SLICE_LOW_SHIFT		28
>   #define SLICE_LOW_TOP		(0x100000000ul)
> diff --git a/arch/powerpc/sysdev/xics/ics-native.c 
> b/arch/powerpc/sysdev/xics/ics-native.c
> index e33b77da861e..112c8a1e8159 100644
> --- a/arch/powerpc/sysdev/xics/ics-native.c
> +++ b/arch/powerpc/sysdev/xics/ics-native.c
> @@ -15,6 +15,7 @@
>   #include <linux/init.h>
>   #include <linux/cpu.h>
>   #include <linux/of.h>
> +#include <linux/of_address.h>
>   #include <linux/spinlock.h>
>   #include <linux/msi.h>
>   #include <linux/list.h>
> 
> 
>>
>> I'm wondering if these functions have to be moved in slice.c
>>
>> Attached is the config file I used.
>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   arch/powerpc/include/asm/book3s/64/mmu.h   |  6 ----
>>>   arch/powerpc/include/asm/book3s/64/slice.h |  6 ++++
>>>   arch/powerpc/mm/book3s64/slice.c           | 42 ++++++++++++++++++++++
>>>   arch/powerpc/mm/hugetlbpage.c              | 21 -----------
>>>   arch/powerpc/mm/mmap.c                     | 36 -------------------
>>>   5 files changed, 48 insertions(+), 63 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
>>> index 006cbec70ffe..570a4960cf17 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>>> @@ -4,12 +4,6 @@
>>>   
>>>   #include <asm/page.h>
>>>   
>>> -#ifdef CONFIG_HUGETLB_PAGE
>>> -#define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
>>> -#endif
>>> -#define HAVE_ARCH_UNMAPPED_AREA
>>> -#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
>>> -
>>>   #ifndef __ASSEMBLY__
>>>   /*
>>>    * Page size definition
>>> diff --git a/arch/powerpc/include/asm/book3s/64/slice.h b/arch/powerpc/include/asm/book3s/64/slice.h
>>> index 5b0f7105bc8b..b8eb4ad271b9 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/slice.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/slice.h
>>> @@ -4,6 +4,12 @@
>>>   
>>>   #ifndef __ASSEMBLY__
>>>   
>>> +#ifdef CONFIG_HUGETLB_PAGE
>>> +#define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
>>> +#endif
>>> +#define HAVE_ARCH_UNMAPPED_AREA
>>> +#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
>>> +
>>>   #define SLICE_LOW_SHIFT		28
>>>   #define SLICE_LOW_TOP		(0x100000000ul)
>>>   #define SLICE_NUM_LOW		(SLICE_LOW_TOP >> SLICE_LOW_SHIFT)
>>> diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
>>> index e4382713746d..03681042b807 100644
>>> --- a/arch/powerpc/mm/book3s64/slice.c
>>> +++ b/arch/powerpc/mm/book3s64/slice.c
>>> @@ -639,6 +639,32 @@ unsigned long slice_get_unmapped_area(unsigned long addr, unsigned long len,
>>>   }
>>>   EXPORT_SYMBOL_GPL(slice_get_unmapped_area);
>>>   
>>> +unsigned long arch_get_unmapped_area(struct file *filp,
>>> +				     unsigned long addr,
>>> +				     unsigned long len,
>>> +				     unsigned long pgoff,
>>> +				     unsigned long flags)
>>> +{
>>> +	if (radix_enabled())
>>> +		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
>>> +
>>> +	return slice_get_unmapped_area(addr, len, flags,
>>> +				       mm_ctx_user_psize(&current->mm->context), 0);
>>> +}
>>> +
>>> +unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>>> +					     const unsigned long addr0,
>>> +					     const unsigned long len,
>>> +					     const unsigned long pgoff,
>>> +					     const unsigned long flags)
>>> +{
>>> +	if (radix_enabled())
>>> +		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags);
>>> +
>>> +	return slice_get_unmapped_area(addr0, len, flags,
>>> +				       mm_ctx_user_psize(&current->mm->context), 1);
>>> +}
>>> +
>>>   unsigned int notrace get_slice_psize(struct mm_struct *mm, unsigned long addr)
>>>   {
>>>   	unsigned char *psizes;
>>> @@ -766,4 +792,20 @@ unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
>>>   
>>>   	return 1UL << mmu_psize_to_shift(get_slice_psize(vma->vm_mm, vma->vm_start));
>>>   }
>>> +
>>> +static int file_to_psize(struct file *file)
>>> +{
>>> +	struct hstate *hstate = hstate_file(file);
>>> +	return shift_to_mmu_psize(huge_page_shift(hstate));
>>> +}
>>> +
>>> +unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
>>> +					unsigned long len, unsigned long pgoff,
>>> +					unsigned long flags)
>>> +{
>>> +	if (radix_enabled())
>>> +		return generic_hugetlb_get_unmapped_area(file, addr, len, pgoff, flags);
>>> +
>>> +	return slice_get_unmapped_area(addr, len, flags, file_to_psize(file), 1);
>>> +}
>>>   #endif
>>> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
>>> index a87c886042e9..b282af39fcf6 100644
>>> --- a/arch/powerpc/mm/hugetlbpage.c
>>> +++ b/arch/powerpc/mm/hugetlbpage.c
>>> @@ -542,27 +542,6 @@ struct page *follow_huge_pd(struct vm_area_struct *vma,
>>>   	return page;
>>>   }
>>>   
>>> -#ifdef HAVE_ARCH_HUGETLB_UNMAPPED_AREA
>>> -static inline int file_to_psize(struct file *file)
>>> -{
>>> -	struct hstate *hstate = hstate_file(file);
>>> -	return shift_to_mmu_psize(huge_page_shift(hstate));
>>> -}
>>> -
>>> -unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
>>> -					unsigned long len, unsigned long pgoff,
>>> -					unsigned long flags)
>>> -{
>>> -	if (radix_enabled())
>>> -		return generic_hugetlb_get_unmapped_area(file, addr, len,
>>> -						       pgoff, flags);
>>> -#ifdef CONFIG_PPC_64S_HASH_MMU
>>> -	return slice_get_unmapped_area(addr, len, flags, file_to_psize(file), 1);
>>> -#endif
>>> -	BUG();
>>> -}
>>> -#endif
>>> -
>>>   bool __init arch_hugetlb_valid_size(unsigned long size)
>>>   {
>>>   	int shift = __ffs(size);
>>> diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
>>> index 46781d0103d1..5972d619d274 100644
>>> --- a/arch/powerpc/mm/mmap.c
>>> +++ b/arch/powerpc/mm/mmap.c
>>> @@ -80,42 +80,6 @@ static inline unsigned long mmap_base(unsigned long rnd,
>>>   	return PAGE_ALIGN(DEFAULT_MAP_WINDOW - gap - rnd);
>>>   }
>>>   
>>> -#ifdef HAVE_ARCH_UNMAPPED_AREA
>>> -unsigned long arch_get_unmapped_area(struct file *filp,
>>> -				     unsigned long addr,
>>> -				     unsigned long len,
>>> -				     unsigned long pgoff,
>>> -				     unsigned long flags)
>>> -{
>>> -	if (radix_enabled())
>>> -		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
>>> -
>>> -#ifdef CONFIG_PPC_64S_HASH_MMU
>>> -	return slice_get_unmapped_area(addr, len, flags,
>>> -				       mm_ctx_user_psize(&current->mm->context), 0);
>>> -#else
>>> -	BUG();
>>> -#endif
>>> -}
>>> -
>>> -unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>>> -					     const unsigned long addr0,
>>> -					     const unsigned long len,
>>> -					     const unsigned long pgoff,
>>> -					     const unsigned long flags)
>>> -{
>>> -	if (radix_enabled())
>>> -		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags);
>>> -
>>> -#ifdef CONFIG_PPC_64S_HASH_MMU
>>> -	return slice_get_unmapped_area(addr0, len, flags,
>>> -				       mm_ctx_user_psize(&current->mm->context), 1);
>>> -#else
>>> -	BUG();
>>> -#endif
>>> -}
>>> -#endif /* HAVE_ARCH_UNMAPPED_AREA */
>>> -
>>>   /*
>>>    * This function, called very early during the creation of a new
>>>    * process VM image, sets up which VM layout function to use:

