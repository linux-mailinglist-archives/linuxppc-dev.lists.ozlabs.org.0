Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE1887C6D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 01:47:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OFzXoeuX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwlvF0jMNz3vY5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 11:47:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OFzXoeuX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwltS3ccfz3cCt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 11:46:23 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42EKboGX005258;
	Fri, 15 Mar 2024 00:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=92UtFAcY0GTWHCTH+ctu4ttUTr3isdg6lfehUiExBWo=;
 b=OFzXoeuXXZca/NvVO7M2FSr3lnR3SjWlccG/a920MfreROrvtoqFi5EYQ0rkIuQGD0HP
 YPwfTpP6qhtczslZKJ1f42VkFgUqpdVsGExE9ds4QXsXZ2mYfWzgJHhYusR0SROd1OV5
 gI09MzZi/vX8hAr3zRC8AZ39xkNbemZG9chkGYGCxz507SP0ogShlfoKeKpflUUCDYRS
 xq5Sv6mTCJ0wU96GiQolYgI4IQMhB5qfln8Nb2bkPwpwlf2c9gT6iEONXPV93RwLZ9EL
 9RLbe870/YDzszyT4Is8PxaRthbtJsalj+kVO/dWjMfqQk54HeiHIHHZv98DHWnZ+//f DA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wv8ekjn7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 00:45:52 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42ENaevG018557;
	Fri, 15 Mar 2024 00:45:52 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ws4t2g5vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 00:45:52 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42F0jmFt44957964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Mar 2024 00:45:50 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F3B72004B;
	Fri, 15 Mar 2024 00:45:48 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7162A20040;
	Fri, 15 Mar 2024 00:45:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Mar 2024 00:45:47 +0000 (GMT)
Received: from [10.61.2.138] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EFEBD600F0;
	Fri, 15 Mar 2024 11:45:43 +1100 (AEDT)
Message-ID: <56dc0520a97178f3136d8cd94d858fafe6da2119.camel@linux.ibm.com>
Subject: Re: [PATCH v10 11/12] powerpc: mm: Use set_pte_at_unchecked() for
 early-boot / internal usages
From: LTC IMAP <rmclure@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Fri, 15 Mar 2024 11:45:43 +1100
In-Reply-To: <42bf1fb2-8a8e-4ded-97a6-da2617e89f5b@csgroup.eu>
References: <20240313042118.230397-1-rmclure@linux.ibm.com>
	 <20240313042118.230397-12-rmclure@linux.ibm.com>
	 <42bf1fb2-8a8e-4ded-97a6-da2617e89f5b@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YcZ4D1kQD3FDaLNp8bu1vpRS98zL7eit
X-Proofpoint-ORIG-GUID: YcZ4D1kQD3FDaLNp8bu1vpRS98zL7eit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403150000
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2024-03-13 at 11:30 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 13/03/2024 =C3=A0 05:21, Rohan McLure a =C3=A9crit=C2=A0:
> > In the new set_ptes() API, set_pte_at() (a special case of
> > set_ptes())
> > is intended to be instrumented by the page table check facility.
> > There
> > are however several other routines that constitute the API for
> > setting
> > page table entries, including set_pmd_at() among others. Such
> > routines
> > are themselves implemented in terms of set_ptes_at().
> >=20
> > A future patch providing support for page table checking on powerpc
> > must take care to avoid duplicate calls to
> > page_table_check_p{te,md,ud}_set(). Allow for assignment of pte
> > entries
> > without instrumentation through the set_pte_at_unchecked() routine
> > introduced in this patch.
> >=20
> > Cause API-facing routines that call set_pte_at() to instead call
> > set_pte_at_unchecked(), which will remain uninstrumented by page
> > table check. set_ptes() is itself implemented by calls to
> > __set_pte_at(), so this eliminates redundant code.
> >=20
> > Also prefer set_pte_at_unchecked() in early-boot usages which
> > should not be
> > instrumented.
> >=20
> > Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> > ---
> > v9: New patch
> > v10: don't reuse __set_pte_at(), as that will not apply filters.
> > Instead
> > use new set_pte_at_unchecked().
>=20
> Are filters needed at all in those usecases ?

I'm just retaining the original semantics of these calls. I think
another patch can replace this call with __set_pte_at() if filters are
deemed unnecessary.

>=20
> > ---
> > =C2=A0 arch/powerpc/include/asm/pgtable.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 ++
> > =C2=A0 arch/powerpc/mm/book3s64/hash_pgtable.c=C2=A0 | 2 +-
> > =C2=A0 arch/powerpc/mm/book3s64/pgtable.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 6 +++---
> > =C2=A0 arch/powerpc/mm/book3s64/radix_pgtable.c | 8 ++++----
> > =C2=A0 arch/powerpc/mm/nohash/book3e_pgtable.c=C2=A0 | 2 +-
> > =C2=A0 arch/powerpc/mm/pgtable.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++++
> > =C2=A0 arch/powerpc/mm/pgtable_32.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0 7 files changed, 19 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/pgtable.h
> > b/arch/powerpc/include/asm/pgtable.h
> > index 3741a63fb82e..6ff1d8cfa216 100644
> > --- a/arch/powerpc/include/asm/pgtable.h
> > +++ b/arch/powerpc/include/asm/pgtable.h
> > @@ -44,6 +44,8 @@ struct mm_struct;
> > =C2=A0 void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t
> > *ptep,
> > =C2=A0=C2=A0		pte_t pte, unsigned int nr);
> > =C2=A0 #define set_ptes set_ptes
> > +void set_pte_at_unchecked(struct mm_struct *mm, unsigned long
> > addr,
> > +			=C2=A0 pte_t *ptep, pte_t pte);
> > =C2=A0 #define update_mmu_cache(vma, addr, ptep) \
> > =C2=A0=C2=A0	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
> > =C2=A0=20
> > diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c
> > b/arch/powerpc/mm/book3s64/hash_pgtable.c
> > index 988948d69bc1..871472f99a01 100644
> > --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
> > @@ -165,7 +165,7 @@ int hash__map_kernel_page(unsigned long ea,
> > unsigned long pa, pgprot_t prot)
> > =C2=A0=C2=A0		ptep =3D pte_alloc_kernel(pmdp, ea);
> > =C2=A0=C2=A0		if (!ptep)
> > =C2=A0=C2=A0			return -ENOMEM;
> > -		set_pte_at(&init_mm, ea, ptep, pfn_pte(pa >>
> > PAGE_SHIFT, prot));
> > +		set_pte_at_unchecked(&init_mm, ea, ptep,
> > pfn_pte(pa >> PAGE_SHIFT, prot));
> > =C2=A0=C2=A0	} else {
> > =C2=A0=C2=A0		/*
> > =C2=A0=C2=A0		 * If the mm subsystem is not fully up, we cannot
> > create a
> > diff --git a/arch/powerpc/mm/book3s64/pgtable.c
> > b/arch/powerpc/mm/book3s64/pgtable.c
> > index 3438ab72c346..25082ab6018b 100644
> > --- a/arch/powerpc/mm/book3s64/pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/pgtable.c
> > @@ -116,7 +116,7 @@ void set_pmd_at(struct mm_struct *mm, unsigned
> > long addr,
> > =C2=A0=C2=A0	WARN_ON(!(pmd_large(pmd)));
> > =C2=A0 #endif
> > =C2=A0=C2=A0	trace_hugepage_set_pmd(addr, pmd_val(pmd));
> > -	return set_pte_at(mm, addr, pmdp_ptep(pmdp),
> > pmd_pte(pmd));
> > +	return set_pte_at_unchecked(mm, addr, pmdp_ptep(pmdp),
> > pmd_pte(pmd));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 void set_pud_at(struct mm_struct *mm, unsigned long addr,
> > @@ -133,7 +133,7 @@ void set_pud_at(struct mm_struct *mm, unsigned
> > long addr,
> > =C2=A0=C2=A0	WARN_ON(!(pud_large(pud)));
> > =C2=A0 #endif
> > =C2=A0=C2=A0	trace_hugepage_set_pud(addr, pud_val(pud));
> > -	return set_pte_at(mm, addr, pudp_ptep(pudp),
> > pud_pte(pud));
> > +	return set_pte_at_unchecked(mm, addr, pudp_ptep(pudp),
> > pud_pte(pud));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static void do_serialize(void *arg)
> > @@ -539,7 +539,7 @@ void ptep_modify_prot_commit(struct
> > vm_area_struct *vma, unsigned long addr,
> > =C2=A0=C2=A0	if (radix_enabled())
> > =C2=A0=C2=A0		return radix__ptep_modify_prot_commit(vma, addr,
> > =C2=A0=C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptep,
> > old_pte, pte);
> > -	set_pte_at(vma->vm_mm, addr, ptep, pte);
> > +	set_pte_at_unchecked(vma->vm_mm, addr, ptep, pte);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c
> > b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > index 46fa46ce6526..c661e42bb2f1 100644
> > --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > @@ -109,7 +109,7 @@ static int early_map_kernel_page(unsigned long
> > ea, unsigned long pa,
> > =C2=A0=C2=A0	ptep =3D pte_offset_kernel(pmdp, ea);
> > =C2=A0=20
> > =C2=A0 set_the_pte:
> > -	set_pte_at(&init_mm, ea, ptep, pfn_pte(pfn, flags));
> > +	set_pte_at_unchecked(&init_mm, ea, ptep, pfn_pte(pfn,
> > flags));
> > =C2=A0=C2=A0	asm volatile("ptesync": : :"memory");
> > =C2=A0=C2=A0	return 0;
> > =C2=A0 }
> > @@ -1522,7 +1522,7 @@ void radix__ptep_modify_prot_commit(struct
> > vm_area_struct *vma,
> > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0 (atomic_read(&mm->context.copros) > 0))
> > =C2=A0=C2=A0		radix__flush_tlb_page(vma, addr);
> > =C2=A0=20
> > -	set_pte_at(mm, addr, ptep, pte);
> > +	set_pte_at_unchecked(mm, addr, ptep, pte);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
> > @@ -1533,7 +1533,7 @@ int pud_set_huge(pud_t *pud, phys_addr_t
> > addr, pgprot_t prot)
> > =C2=A0=C2=A0	if (!radix_enabled())
> > =C2=A0=C2=A0		return 0;
> > =C2=A0=20
> > -	set_pte_at(&init_mm, 0 /* radix unused */, ptep, new_pud);
> > +	set_pte_at_unchecked(&init_mm, 0 /* radix unused */, ptep,
> > new_pud);
> > =C2=A0=20
> > =C2=A0=C2=A0	return 1;
> > =C2=A0 }
> > @@ -1580,7 +1580,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t
> > addr, pgprot_t prot)
> > =C2=A0=C2=A0	if (!radix_enabled())
> > =C2=A0=C2=A0		return 0;
> > =C2=A0=20
> > -	set_pte_at(&init_mm, 0 /* radix unused */, ptep, new_pmd);
> > +	set_pte_at_unchecked(&init_mm, 0 /* radix unused */, ptep,
> > new_pmd);
> > =C2=A0=20
> > =C2=A0=C2=A0	return 1;
> > =C2=A0 }
> > diff --git a/arch/powerpc/mm/nohash/book3e_pgtable.c
> > b/arch/powerpc/mm/nohash/book3e_pgtable.c
> > index 1c5e4ecbebeb..10d487b2b991 100644
> > --- a/arch/powerpc/mm/nohash/book3e_pgtable.c
> > +++ b/arch/powerpc/mm/nohash/book3e_pgtable.c
> > @@ -111,7 +111,7 @@ int __ref map_kernel_page(unsigned long ea,
> > phys_addr_t pa, pgprot_t prot)
> > =C2=A0=C2=A0		}
> > =C2=A0=C2=A0		ptep =3D pte_offset_kernel(pmdp, ea);
> > =C2=A0=C2=A0	}
> > -	set_pte_at(&init_mm, ea, ptep, pfn_pte(pa >> PAGE_SHIFT,
> > prot));
> > +	set_pte_at_unchecked(&init_mm, ea, ptep, pfn_pte(pa >>
> > PAGE_SHIFT, prot));
> > =C2=A0=20
> > =C2=A0=C2=A0	smp_wmb();
> > =C2=A0=C2=A0	return 0;
> > diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> > index e8e0289d7ab0..352679cf2684 100644
> > --- a/arch/powerpc/mm/pgtable.c
> > +++ b/arch/powerpc/mm/pgtable.c
> > @@ -227,6 +227,13 @@ void set_ptes(struct mm_struct *mm, unsigned
> > long addr, pte_t *ptep,
> > =C2=A0=C2=A0	}
> > =C2=A0 }
> > =C2=A0=20
> > +void set_pte_at_unchecked(struct mm_struct *mm, unsigned long
> > addr,
> > +			=C2=A0 pte_t *ptep, pte_t pte)
> > +{
>=20
> No need of the
>=20
> VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
>=20
> which is in set_ptes() ?

Good spot, I'll include that check in this routine.

>=20
> > +	pte =3D set_pte_filter(pte, addr);
> > +	__set_pte_at(mm, addr, ptep, pte, 0);
> > +}
> > +
> > =C2=A0 void unmap_kernel_page(unsigned long va)
> > =C2=A0 {
> > =C2=A0=C2=A0	pmd_t *pmdp =3D pmd_off_k(va);
> > diff --git a/arch/powerpc/mm/pgtable_32.c
> > b/arch/powerpc/mm/pgtable_32.c
> > index 4be97b4a44f9..a5a26faf91ec 100644
> > --- a/arch/powerpc/mm/pgtable_32.c
> > +++ b/arch/powerpc/mm/pgtable_32.c
> > @@ -89,7 +89,7 @@ int __ref map_kernel_page(unsigned long va,
> > phys_addr_t pa, pgprot_t prot)
> > =C2=A0=C2=A0		 * hash table
> > =C2=A0=C2=A0		 */
> > =C2=A0=C2=A0		BUG_ON((pte_present(*pg) | pte_hashpte(*pg)) &&
> > pgprot_val(prot));
> > -		set_pte_at(&init_mm, va, pg, pfn_pte(pa >>
> > PAGE_SHIFT, prot));
> > +		set_pte_at_unchecked(&init_mm, va, pg, pfn_pte(pa
> > >> PAGE_SHIFT, prot));
> > =C2=A0=C2=A0	}
> > =C2=A0=C2=A0	smp_wmb();
> > =C2=A0=C2=A0	return err;

