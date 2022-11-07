Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6D261E822
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 02:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5CmF59TGz3dsy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 12:08:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bApY2Q0M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bApY2Q0M;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5ClH0jc3z2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 12:07:54 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A6NeWJN031723;
	Mon, 7 Nov 2022 01:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=iD8X+BSvtXvGRluzKQRCzeVtQ/ivNYPbISJuoh1kzUU=;
 b=bApY2Q0MuSgFQPRJbJjWMw9E6ABAJ1StUCsRjtSzJLvzNSs5S46DwP3Cg3XgpjtPVv54
 NzmZPh6sKJpWjHdyuMNm+UHtE8MS6ylcsu/9vYSW3CXXLiwdMUE/4ZDDETPDqaCbtF2M
 rH+shBRB3oXbmKCSp33h0OKdbjhyYx3DDgc/RlnWAqVYW6H1iirExCSMjEP89kf1OOLu
 eol5Rwgtbg4QXWOGwbypwFfbwT8NCLepVvTi96WhjhESy36x+xCStjaiAmJf4IOXgcaf
 LCbrsvAYtRXO+I4NRJBWRZmQ4HEVb8SiIOghEtSMrJMB/Xh68bYDXqNig7yUdAswxteD pg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1gkhds5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 01:07:42 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A715Biq029140;
	Mon, 7 Nov 2022 01:07:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma02fra.de.ibm.com with ESMTP id 3kngpghanb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 01:07:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A717cVo65732912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Nov 2022 01:07:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 823A252050;
	Mon,  7 Nov 2022 01:07:38 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D793752051;
	Mon,  7 Nov 2022 01:07:37 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 224A460257;
	Mon,  7 Nov 2022 12:07:34 +1100 (AEDT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 1/4] powerpc: mm: Replace p{u,m,4}d_is_leaf with
 p{u,m,4}_leaf
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <20221106224958.1320664-1-rmclure@linux.ibm.com>
Date: Mon, 7 Nov 2022 12:07:21 +1100
Message-Id: <C06D6F65-5D88-4012-9CBA-1C7891F89F2E@linux.ibm.com>
References: <20221106224958.1320664-1-rmclure@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S306JRScIG92WVN-6Wn0nsOB8es0VMUW
X-Proofpoint-GUID: S306JRScIG92WVN-6Wn0nsOB8es0VMUW
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_16,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070006
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 7 Nov 2022, at 9:49 am, Rohan McLure <rmclure@linux.ibm.com> wrote:
>=20
> Replace occurrences of p{u,m,4}d_is_leaf with p{u,m,4}_leaf, as the
> latter is the name given to checking that a higher-level entry in
> multi-level paging contains a page translation entry (pte). This commit
> allows for p{u,m,4}d_leaf to be used on all powerpc platforms.
>=20
> Prior to this commit, the two names have both been present in the
> kernel, having as far as I can tell the same exact purpose. While the
> 'is' in the title may better indicate that the macro/function is a
> boolean returning check, the former naming scheme is standard through
> all other architectures.
>=20
> 32-bit systems import pgtable-nop4d.h which defines a default pud_leaf.
> Define pud_leaf preprocessor macro on both Book3E/S 32-bit to avoid
> including the default definition in asm/pgtable.h.
>=20
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V4: new patch.
> ---
> arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
> arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++++------
> arch/powerpc/include/asm/nohash/32/pgtable.h |  1 +
> arch/powerpc/include/asm/pgtable.h           | 18 +++++++++---------
> arch/powerpc/kvm/book3s_64_mmu_radix.c       | 12 ++++++------
> arch/powerpc/mm/book3s64/radix_pgtable.c     | 14 +++++++-------
> arch/powerpc/mm/pgtable.c                    |  6 +++---
> arch/powerpc/mm/pgtable_64.c                 |  6 +++---
> arch/powerpc/xmon/xmon.c                     |  6 +++---
> 9 files changed, 37 insertions(+), 38 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/=
include/asm/book3s/32/pgtable.h
> index 75823f39e042..f1b91ad8f3a5 100644
> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
> @@ -234,6 +234,7 @@ void unmap_kernel_page(unsigned long va);
> #define pte_clear(mm, addr, ptep) \
> do { pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, 0, 0); } while (0)
>=20
> +#define pud_leaf pud_leaf
> #define pmd_none(pmd) (!pmd_val(pmd))
> #define pmd_bad(pmd) (pmd_val(pmd) & _PMD_BAD)
> #define pmd_present(pmd) (pmd_val(pmd) & _PMD_PRESENT_MASK)
> @@ -242,7 +243,6 @@ static inline void pmd_clear(pmd_t *pmdp)
> *pmdp =3D __pmd(0);
> }
>=20
> -
> /*
>  * When flushing the tlb entry for a page, we also need to flush the hash
>  * table entry.  flush_hash_pages is assembler (for speed) in hashtable.S.
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/=
include/asm/book3s/64/pgtable.h
> index c436d8422654..3f51de24e4fc 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1426,16 +1426,14 @@ static inline bool is_pte_rw_upgrade(unsigned lon=
g old_val, unsigned long new_va
> /*
>  * Like pmd_huge() and pmd_large(), but works regardless of config options
>  */
> -#define pmd_is_leaf pmd_is_leaf
> -#define pmd_leaf pmd_is_leaf
> -static inline bool pmd_is_leaf(pmd_t pmd)
> +#define pmd_leaf pmd_leaf
> +static inline bool pmd_leaf(pmd_t pmd)
> {
> return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
> }
>=20
> -#define pud_is_leaf pud_is_leaf
> -#define pud_leaf pud_is_leaf
> -static inline bool pud_is_leaf(pud_t pud)
> +#define pud_leaf pud_leaf
> +static inline bool pud_leaf(pud_t pud)
> {
> return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
> }
> diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/=
include/asm/nohash/32/pgtable.h
> index 0d40b33184eb..04a3b0b128eb 100644
> --- a/arch/powerpc/include/asm/nohash/32/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
> @@ -201,6 +201,7 @@ static inline pte_t pte_mkexec(pte_t pte)
> }
> #endif
>=20
> +#define pud_leaf pud_leaf
> #define pmd_none(pmd) (!pmd_val(pmd))
> #define pmd_bad(pmd) (pmd_val(pmd) & _PMD_BAD)
> #define pmd_present(pmd) (pmd_val(pmd) & _PMD_PRESENT_MASK)
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/as=
m/pgtable.h
> index 283f40d05a4d..8e7625a89922 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -134,25 +134,25 @@ static inline void pte_frag_set(mm_context_t *ctx, =
void *p)
> }
> #endif
>=20
> -#ifndef pmd_is_leaf
> -#define pmd_is_leaf pmd_is_leaf
> -static inline bool pmd_is_leaf(pmd_t pmd)
> +#ifndef pmd_leaf
> +#define pmd_leaf pmd_leaf
> +static inline bool pmd_leaf(pmd_t pmd)
> {
> return false;
> }
> #endif
>=20
> -#ifndef pud_is_leaf
> -#define pud_is_leaf pud_is_leaf
> -static inline bool pud_is_leaf(pud_t pud)
> +#ifndef pud_leaf
> +#define pud_leaf pud_leaf
> +static inline bool pud_leaf(pud_t pud)
> {
> return false;
> }
> #endif
>=20
> -#ifndef p4d_is_leaf
> -#define p4d_is_leaf p4d_is_leaf
> -static inline bool p4d_is_leaf(p4d_t p4d)
> +#ifndef p4d_leaf
> +#define p4d_leaf p4d_leaf
> +static inline bool p4d_leaf(p4d_t p4d)
> {
> return false;
> }
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/bo=
ok3s_64_mmu_radix.c
> index 5d5e12f3bf86..d29f8d1d97a6 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -497,7 +497,7 @@ static void kvmppc_unmap_free_pmd(struct kvm *kvm, pm=
d_t *pmd, bool full,
> for (im =3D 0; im < PTRS_PER_PMD; ++im, ++p) {
> if (!pmd_present(*p))
> continue;
> - if (pmd_is_leaf(*p)) {
> + if (pmd_leaf(*p)) {
> if (full) {
> pmd_clear(p);
> } else {
> @@ -526,7 +526,7 @@ static void kvmppc_unmap_free_pud(struct kvm *kvm, pu=
d_t *pud,
> for (iu =3D 0; iu < PTRS_PER_PUD; ++iu, ++p) {
> if (!pud_present(*p))
> continue;
> - if (pud_is_leaf(*p)) {
> + if (pud_leaf(*p)) {
> pud_clear(p);
> } else {
> pmd_t *pmd;
> @@ -629,12 +629,12 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtab=
le, pte_t pte,
> new_pud =3D pud_alloc_one(kvm->mm, gpa);
>=20
> pmd =3D NULL;
> - if (pud && pud_present(*pud) && !pud_is_leaf(*pud))
> + if (pud && pud_present(*pud) && !pud_leaf(*pud))
> pmd =3D pmd_offset(pud, gpa);
> else if (level <=3D 1)
> new_pmd =3D kvmppc_pmd_alloc();
>=20
> - if (level =3D=3D 0 && !(pmd && pmd_present(*pmd) && !pmd_is_leaf(*pmd)))
> + if (level =3D=3D 0 && !(pmd && pmd_present(*pmd) && !pmd_leaf(*pmd)))
> new_ptep =3D kvmppc_pte_alloc();
>=20
> /* Check if we might have been invalidated; let the guest retry if so */
> @@ -652,7 +652,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable=
, pte_t pte,
> new_pud =3D NULL;
> }
> pud =3D pud_offset(p4d, gpa);
> - if (pud_is_leaf(*pud)) {
> + if (pud_leaf(*pud)) {
> unsigned long hgpa =3D gpa & PUD_MASK;
>=20
> /* Check if we raced and someone else has set the same thing */
> @@ -703,7 +703,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable=
, pte_t pte,
> new_pmd =3D NULL;
> }
> pmd =3D pmd_offset(pud, gpa);
> - if (pmd_is_leaf(*pmd)) {
> + if (pmd_leaf(*pmd)) {
> unsigned long lgpa =3D gpa & PMD_MASK;
>=20
> /* Check if we raced and someone else has set the same thing */
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/b=
ook3s64/radix_pgtable.c
> index cac727b01799..8ac27e031ff4 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -205,14 +205,14 @@ static void radix__change_memory_range(unsigned lon=
g start, unsigned long end,
> pudp =3D pud_alloc(&init_mm, p4dp, idx);
> if (!pudp)
> continue;
> - if (pud_is_leaf(*pudp)) {
> + if (pud_leaf(*pudp)) {
> ptep =3D (pte_t *)pudp;
> goto update_the_pte;
> }
> pmdp =3D pmd_alloc(&init_mm, pudp, idx);
> if (!pmdp)
> continue;
> - if (pmd_is_leaf(*pmdp)) {
> + if (pmd_leaf(*pmdp)) {
> ptep =3D pmdp_ptep(pmdp);
> goto update_the_pte;
> }
> @@ -762,7 +762,7 @@ static void __meminit remove_pmd_table(pmd_t *pmd_sta=
rt, unsigned long addr,
> if (!pmd_present(*pmd))
> continue;
>=20
> - if (pmd_is_leaf(*pmd)) {
> + if (pmd_leaf(*pmd)) {
> if (!IS_ALIGNED(addr, PMD_SIZE) ||
>    !IS_ALIGNED(next, PMD_SIZE)) {
> WARN_ONCE(1, "%s: unaligned range\n", __func__);
> @@ -792,7 +792,7 @@ static void __meminit remove_pud_table(pud_t *pud_sta=
rt, unsigned long addr,
> if (!pud_present(*pud))
> continue;
>=20
> - if (pud_is_leaf(*pud)) {
> + if (pud_leaf(*pud)) {
> if (!IS_ALIGNED(addr, PUD_SIZE) ||
>    !IS_ALIGNED(next, PUD_SIZE)) {
> WARN_ONCE(1, "%s: unaligned range\n", __func__);
> @@ -825,7 +825,7 @@ static void __meminit remove_pagetable(unsigned long =
start, unsigned long end)
> if (!p4d_present(*p4d))
> continue;
>=20
> - if (p4d_is_leaf(*p4d)) {
> + if (p4d_leaf(*p4d)) {
> if (!IS_ALIGNED(addr, P4D_SIZE) ||
>    !IS_ALIGNED(next, P4D_SIZE)) {
> WARN_ONCE(1, "%s: unaligned range\n", __func__);
> @@ -1088,7 +1088,7 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgpr=
ot_t prot)
>=20
> int pud_clear_huge(pud_t *pud)
> {
> - if (pud_is_leaf(*pud)) {
> + if (pud_leaf(*pud)) {
> pud_clear(pud);
> return 1;
> }
> @@ -1135,7 +1135,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgpr=
ot_t prot)
>=20
> int pmd_clear_huge(pmd_t *pmd)
> {
> - if (pmd_is_leaf(*pmd)) {
> + if (pmd_leaf(*pmd)) {
> pmd_clear(pmd);
> return 1;
> }
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index cb2dcdb18f8e..35b9677b9553 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -387,7 +387,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long e=
a,
> if (p4d_none(p4d))
> return NULL;
>=20
> - if (p4d_is_leaf(p4d)) {
> + if (p4d_leaf(p4d)) {
> ret_pte =3D (pte_t *)p4dp;
> goto out;
> }
> @@ -409,7 +409,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long e=
a,
> if (pud_none(pud))
> return NULL;
>=20
> - if (pud_is_leaf(pud)) {
> + if (pud_leaf(pud)) {
> ret_pte =3D (pte_t *)pudp;
> goto out;
> }
> @@ -448,7 +448,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long e=
a,
> goto out;
> }
>=20
> - if (pmd_is_leaf(pmd)) {
> + if (pmd_leaf(pmd)) {
> ret_pte =3D (pte_t *)pmdp;
> goto out;
> }
> diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
> index 5ac1fd30341b..0604c80dae66 100644
> --- a/arch/powerpc/mm/pgtable_64.c
> +++ b/arch/powerpc/mm/pgtable_64.c
> @@ -100,7 +100,7 @@ EXPORT_SYMBOL(__pte_frag_size_shift);
> /* 4 level page table */
> struct page *p4d_page(p4d_t p4d)
> {
> - if (p4d_is_leaf(p4d)) {
> + if (p4d_leaf(p4d)) {
> if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> VM_WARN_ON(!p4d_huge(p4d));
> return pte_page(p4d_pte(p4d));
> @@ -111,7 +111,7 @@ struct page *p4d_page(p4d_t p4d)
>=20
> struct page *pud_page(pud_t pud)
> {
> - if (pud_is_leaf(pud)) {
> + if (pud_leaf(pud)) {
> if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> VM_WARN_ON(!pud_huge(pud));
> return pte_page(pud_pte(pud));
> @@ -125,7 +125,7 @@ struct page *pud_page(pud_t pud)
>  */
> struct page *pmd_page(pmd_t pmd)
> {
> - if (pmd_is_leaf(pmd)) {
> + if (pmd_leaf(pmd)) {
> /*
> * vmalloc_to_page may be called on any vmap address (not only
> * vmalloc), and it uses pmd_page() etc., when huge vmap is
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index f51c882bf902..705c230dd4f5 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -3342,7 +3342,7 @@ static void show_pte(unsigned long addr)
> return;
> }
>=20
> - if (p4d_is_leaf(*p4dp)) {
> + if (p4d_leaf(*p4dp)) {
> format_pte(p4dp, p4d_val(*p4dp));
> return;
> }
> @@ -3356,7 +3356,7 @@ static void show_pte(unsigned long addr)
> return;
> }
>=20
> - if (pud_is_leaf(*pudp)) {
> + if (pud_leaf(*pudp)) {
> format_pte(pudp, pud_val(*pudp));
> return;
> }
> @@ -3370,7 +3370,7 @@ static void show_pte(unsigned long addr)
> return;
> }
>=20
> - if (pmd_is_leaf(*pmdp)) {
> + if (pmd_leaf(*pmdp)) {
> format_pte(pmdp, pmd_val(*pmdp));
> return;
> }
> --=20
> 2.34.1
>=20

This should in fact be a v4. v3 available here:
Link: https://lore.kernel.org/all/cf3cf708786602bef0aade511356420ee387e0f9.=
camel@russell.cc/t/=
