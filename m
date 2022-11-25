Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8676382A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 04:14:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJKhp59bPz3f3v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 14:14:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QsL/iXDW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QsL/iXDW;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJKgn5jwLz3057
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 14:13:25 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP2mn4Q020831;
	Fri, 25 Nov 2022 03:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=MuBcRnF9O+yIQHHqVI17wkT6uP+tguR/0JiAnMsv0LY=;
 b=QsL/iXDWpOSAJhWaaW7QP0ZNZUUw29HeESrGp1AlFzTDl8Nih7/vYPKrBXxJL8lnlPqC
 rB1hVsFS3Nfs6Q4bwUs8m2ltHY90WUy750R/lzQaUebNrrVK/BfKEjHUpwI6h7jj0bzC
 r6negSQjbIwt0gYkvl48ET5jnlqfZOYCUUYdCJ9j8oXdSe3RJcOb/SIFDpbF6ayWnA+M
 Ulsj7W4T3HDwldUjkCE6Ko4yvg6SJzEevIISnRX7LVqlKyDFFm2wpRll3x28QRJedqNV
 qZyaURP7HB7i4tFsaD16TGn1iFM7wbToC/LDA4wl8X7dxKAK5XTxG20n1r2fXCrUGTMi pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2n8j8en0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 03:13:13 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AP3DCOi012158;
	Fri, 25 Nov 2022 03:13:12 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2n8j8emn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 03:13:12 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AP35TQX005179;
	Fri, 25 Nov 2022 03:13:10 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3kxpdj0yn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 03:13:10 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AP3D89B4194880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Nov 2022 03:13:08 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 871A8AE053;
	Fri, 25 Nov 2022 03:13:08 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC614AE051;
	Fri, 25 Nov 2022 03:13:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 25 Nov 2022 03:13:07 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 339AC6038E;
	Fri, 25 Nov 2022 14:13:00 +1100 (AEDT)
Message-ID: <6f68606c4ff2eb94439eff22f41a7db8d438268c.camel@linux.ibm.com>
Subject: Re: [PATCH v10 3/9] powerpc/mm: Remove extern from function
 prototypes
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 25 Nov 2022 14:12:59 +1100
In-Reply-To: <20221109045112.187069-4-bgray@linux.ibm.com>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
	 <20221109045112.187069-4-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T0s50U2bDRpo3JC-zR1DdgxTuIDMvGdb
X-Proofpoint-ORIG-GUID: af2Ke05DqKt9jXGviA39Z4n5k2MBnFq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_14,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=658 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250022
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
Cc: jniethe5@gmail.com, cmr@bluescreens.de, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-11-09 at 15:51 +1100, Benjamin Gray wrote:
> Remove the extern keyword from function declarations. It is redundant
> and would cause inconsistent style when new functions are added
> without
> it.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> v10:=C2=A0=C2=A0=C2=A0=C2=A0* New in v10 for consistency with new functio=
ns
> ---
> =C2=A0.../include/asm/book3s/64/tlbflush-hash.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
 19 +++++++++--------
> -
> =C2=A0arch/powerpc/include/asm/nohash/tlbflush.h=C2=A0=C2=A0=C2=A0 | 20 +=
++++++++--------
> --
> =C2=A02 files changed, 18 insertions(+), 21 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index fab8332fe1ad..3c89e625e620 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -22,7 +22,7 @@ struct ppc64_tlb_batch {
> =C2=A0};
> =C2=A0DECLARE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
> =C2=A0
> -extern void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
> +void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
> =C2=A0
> =C2=A0#define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> =C2=A0
> @@ -51,14 +51,13 @@ static inline void arch_leave_lazy_mmu_mode(void)
> =C2=A0
> =C2=A0#define arch_flush_lazy_mmu_mode()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do=
 {} while (0)
> =C2=A0
> -extern void hash__tlbiel_all(unsigned int action);
> +void hash__tlbiel_all(unsigned int action);
> =C2=A0
> -extern void flush_hash_page(unsigned long vpn, real_pte_t pte, int
> psize,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 int ssize, unsigned long flags);
> -extern void flush_hash_range(unsigned long number, int local);
> -extern void flush_hash_hugepage(unsigned long vsid, unsigned long
> addr,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pmd_t *pmdp, unsigned int psize, int
> ssize,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long flags);
> +void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize,
> int ssize,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long flags);
> +void flush_hash_range(unsigned long number, int local);
> +void flush_hash_hugepage(unsigned long vsid, unsigned long addr,
> pmd_t *pmdp,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 int psize, int ssize, unsigned long
> flags);
> =C2=A0static inline void hash__local_flush_tlb_mm(struct mm_struct *mm)
> =C2=A0{
> =C2=A0}
> @@ -111,11 +110,11 @@ static inline void
> hash__flush_tlb_kernel_range(unsigned long start,
> =C2=A0
> =C2=A0
> =C2=A0struct mmu_gather;
> -extern void hash__tlb_flush(struct mmu_gather *tlb);
> +void hash__tlb_flush(struct mmu_gather *tlb);
> =C2=A0
> =C2=A0#ifdef CONFIG_PPC_64S_HASH_MMU
> =C2=A0/* Private function for use by PCI IO mapping code */
> -extern void __flush_hash_table_range(unsigned long start, unsigned
> long end);
> +void __flush_hash_table_range(unsigned long start, unsigned long
> end);
> =C2=A0void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd,
> unsigned long addr);
> =C2=A0#else
> =C2=A0static inline void __flush_hash_table_range(unsigned long start,
> unsigned long end) { }
> diff --git a/arch/powerpc/include/asm/nohash/tlbflush.h
> b/arch/powerpc/include/asm/nohash/tlbflush.h
> index bdaf34ad41ea..0cef5e4f8d92 100644
> --- a/arch/powerpc/include/asm/nohash/tlbflush.h
> +++ b/arch/powerpc/include/asm/nohash/tlbflush.h
> @@ -28,8 +28,7 @@ struct mm_struct;
> =C2=A0
> =C2=A0#define MMU_NO_CONTEXT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0((unsigned int)-1)
> =C2=A0
> -extern void flush_tlb_range(struct vm_area_struct *vma, unsigned
> long start,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long end);
> +void flush_tlb_range(struct vm_area_struct *vma, unsigned long
> start, unsigned long end);
> =C2=A0
> =C2=A0#ifdef CONFIG_PPC_8xx
> =C2=A0static inline void local_flush_tlb_mm(struct mm_struct *mm)
> @@ -55,19 +54,18 @@ static inline void
> flush_tlb_kernel_range(unsigned long start, unsigned long end
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0asm volatile ("sync; tlbia; isync" : : : "memory");
> =C2=A0}
> =C2=A0#else
> -extern void flush_tlb_kernel_range(unsigned long start, unsigned
> long end);
> -extern void local_flush_tlb_mm(struct mm_struct *mm);
> -extern void local_flush_tlb_page(struct vm_area_struct *vma,
> unsigned long vmaddr);
> +void flush_tlb_kernel_range(unsigned long start, unsigned long end);
> +void local_flush_tlb_mm(struct mm_struct *mm);
> +void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long
> vmaddr);
> =C2=A0
> -extern void __local_flush_tlb_page(struct mm_struct *mm, unsigned
> long vmaddr,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int tsize, int ind);
> +void __local_flush_tlb_page(struct mm_struct *mm, unsigned long
> vmaddr,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 int tsize, int ind);
> =C2=A0#endif
> =C2=A0
> =C2=A0#ifdef CONFIG_SMP
> -extern void flush_tlb_mm(struct mm_struct *mm);
> -extern void flush_tlb_page(struct vm_area_struct *vma, unsigned long
> vmaddr);
> -extern void __flush_tlb_page(struct mm_struct *mm, unsigned long
> vmaddr,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 int tsize, int ind);
> +void flush_tlb_mm(struct mm_struct *mm);
> +void flush_tlb_page(struct vm_area_struct *vma, unsigned long
> vmaddr);
> +void __flush_tlb_page(struct mm_struct *mm, unsigned long vmaddr,
> int tsize, int ind);
> =C2=A0#else
> =C2=A0#define flush_tlb_mm(mm)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0local_flush_tlb_mm(mm)
> =C2=A0#define
> flush_tlb_page(vma,addr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0local_f=
lush_tlb_page(vma,addr)

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
