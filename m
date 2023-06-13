Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F372E338
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 14:41:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T5i9ZjoL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgSpS5cQtz30M1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 22:41:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T5i9ZjoL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=imbrenda@linux.ibm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 3154 seconds by postgrey-1.37 at boromir; Tue, 13 Jun 2023 22:40:12 AEST
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgSnS3t1zz2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 22:40:11 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DBHqbe019547;
	Tue, 13 Jun 2023 11:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=YW8dFle4FwBo/xSGfxj/YlaloUxuRpkH0geiv0yOSDw=;
 b=T5i9ZjoLCtD5qW5i8NKsB6igZlD7dMJC6lq2OsnNDPy7oI/IJwCWRx4SPn5FJJpROxmM
 XGoOjoVssuM9/IjC8/J3XlUqvCz3C3iOZBKCzWeoF0IhoZ+avSBdbwNZr59eAY+Y/MwT
 m2mG+QlqXNAIO2Pu40I08q6zflwJsJOVsijb4rqfpucHx1YhsAfZE7071II3obN8oK0Q
 NnZiT60lRymQXLae3bIOY+/57zmLGsf/tJ23yvopK4qH2zkFEV55XJ0NU4UIbN/4AKyx
 fHREytSGkFNXaEKXdBvC+qFh/1F0GU1+NwGoF/v4zbQshn2s5Y75imb05ioVeOAk3wU9 uA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6qey0j7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 11:46:25 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DBbbht032708;
	Tue, 13 Jun 2023 11:46:24 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6qey0j6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 11:46:24 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35D3i4Ui022712;
	Tue, 13 Jun 2023 11:45:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3r4gt523ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 11:45:14 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DBjA1w19399178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 11:45:11 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC35620043;
	Tue, 13 Jun 2023 11:45:10 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6D1F20040;
	Tue, 13 Jun 2023 11:45:09 +0000 (GMT)
Received: from p-imbrenda (unknown [9.152.224.66])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 11:45:09 +0000 (GMT)
Date: Tue, 13 Jun 2023 13:45:08 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v2 15/23] s390: allow pte_offset_map_lock() to fail
Message-ID: <20230613134508.6018e70c@p-imbrenda>
In-Reply-To: <3ff29363-336a-9733-12a1-5c31a45c8aeb@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
	<3ff29363-336a-9733-12a1-5c31a45c8aeb@google.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NSzf1M38pnx2z8GhXfyd2zkrTyue7I-U
X-Proofpoint-ORIG-GUID: Jl-BWVCZvUKcympIO9JuW2YKR9vYO4UE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130102
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Sime
 k <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 8 Jun 2023 12:27:22 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> In rare transient cases, not yet made possible, pte_offset_map() and
> pte_offset_map_lock() may not find a page table: handle appropriately.
> 
> Add comment on mm's contract with s390 above __zap_zero_pages(),
> and fix old comment there: must be called after THP was disabled.
> 
> Signed-off-by: Hugh Dickins <hughd@google.com>

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  arch/s390/kernel/uv.c  |  2 ++
>  arch/s390/mm/gmap.c    |  9 ++++++++-
>  arch/s390/mm/pgtable.c | 12 +++++++++---
>  3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/s390/kernel/uv.c b/arch/s390/kernel/uv.c
> index cb2ee06df286..3c62d1b218b1 100644
> --- a/arch/s390/kernel/uv.c
> +++ b/arch/s390/kernel/uv.c
> @@ -294,6 +294,8 @@ int gmap_make_secure(struct gmap *gmap, unsigned long gaddr, void *uvcb)
>  
>  	rc = -ENXIO;
>  	ptep = get_locked_pte(gmap->mm, uaddr, &ptelock);
> +	if (!ptep)
> +		goto out;
>  	if (pte_present(*ptep) && !(pte_val(*ptep) & _PAGE_INVALID) && pte_write(*ptep)) {
>  		page = pte_page(*ptep);
>  		rc = -EAGAIN;
> diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
> index dc90d1eb0d55..3a2a31a15ea8 100644
> --- a/arch/s390/mm/gmap.c
> +++ b/arch/s390/mm/gmap.c
> @@ -2537,7 +2537,12 @@ static inline void thp_split_mm(struct mm_struct *mm)
>   * Remove all empty zero pages from the mapping for lazy refaulting
>   * - This must be called after mm->context.has_pgste is set, to avoid
>   *   future creation of zero pages
> - * - This must be called after THP was enabled
> + * - This must be called after THP was disabled.
> + *
> + * mm contracts with s390, that even if mm were to remove a page table,
> + * racing with the loop below and so causing pte_offset_map_lock() to fail,
> + * it will never insert a page table containing empty zero pages once
> + * mm_forbids_zeropage(mm) i.e. mm->context.has_pgste is set.
>   */
>  static int __zap_zero_pages(pmd_t *pmd, unsigned long start,
>  			   unsigned long end, struct mm_walk *walk)
> @@ -2549,6 +2554,8 @@ static int __zap_zero_pages(pmd_t *pmd, unsigned long start,
>  		spinlock_t *ptl;
>  
>  		ptep = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
> +		if (!ptep)
> +			break;
>  		if (is_zero_pfn(pte_pfn(*ptep)))
>  			ptep_xchg_direct(walk->mm, addr, ptep, __pte(_PAGE_INVALID));
>  		pte_unmap_unlock(ptep, ptl);
> diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
> index 6effb24de6d9..3bd2ab2a9a34 100644
> --- a/arch/s390/mm/pgtable.c
> +++ b/arch/s390/mm/pgtable.c
> @@ -829,7 +829,7 @@ int set_guest_storage_key(struct mm_struct *mm, unsigned long addr,
>  	default:
>  		return -EFAULT;
>  	}
> -
> +again:
>  	ptl = pmd_lock(mm, pmdp);
>  	if (!pmd_present(*pmdp)) {
>  		spin_unlock(ptl);
> @@ -850,6 +850,8 @@ int set_guest_storage_key(struct mm_struct *mm, unsigned long addr,
>  	spin_unlock(ptl);
>  
>  	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +	if (!ptep)
> +		goto again;
>  	new = old = pgste_get_lock(ptep);
>  	pgste_val(new) &= ~(PGSTE_GR_BIT | PGSTE_GC_BIT |
>  			    PGSTE_ACC_BITS | PGSTE_FP_BIT);
> @@ -938,7 +940,7 @@ int reset_guest_reference_bit(struct mm_struct *mm, unsigned long addr)
>  	default:
>  		return -EFAULT;
>  	}
> -
> +again:
>  	ptl = pmd_lock(mm, pmdp);
>  	if (!pmd_present(*pmdp)) {
>  		spin_unlock(ptl);
> @@ -955,6 +957,8 @@ int reset_guest_reference_bit(struct mm_struct *mm, unsigned long addr)
>  	spin_unlock(ptl);
>  
>  	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +	if (!ptep)
> +		goto again;
>  	new = old = pgste_get_lock(ptep);
>  	/* Reset guest reference bit only */
>  	pgste_val(new) &= ~PGSTE_GR_BIT;
> @@ -1000,7 +1004,7 @@ int get_guest_storage_key(struct mm_struct *mm, unsigned long addr,
>  	default:
>  		return -EFAULT;
>  	}
> -
> +again:
>  	ptl = pmd_lock(mm, pmdp);
>  	if (!pmd_present(*pmdp)) {
>  		spin_unlock(ptl);
> @@ -1017,6 +1021,8 @@ int get_guest_storage_key(struct mm_struct *mm, unsigned long addr,
>  	spin_unlock(ptl);
>  
>  	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +	if (!ptep)
> +		goto again;
>  	pgste = pgste_get_lock(ptep);
>  	*key = (pgste_val(pgste) & (PGSTE_ACC_BITS | PGSTE_FP_BIT)) >> 56;
>  	paddr = pte_val(*ptep) & PAGE_MASK;

