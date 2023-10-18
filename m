Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5297CD8C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 12:01:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=beGJ6rVU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9RG56Rg1z3cbl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 21:01:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=beGJ6rVU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9RFB4Z1kz2xZG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 21:01:02 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39I9xNiO028168;
	Wed, 18 Oct 2023 10:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+NY2qdokqUMk7aLdUrFqxRCwnBKqkD6Oo5LgedWSieE=;
 b=beGJ6rVUM997twXgBvhhrwAvO5bATXBp6f9Bj+mSqv8icNFDGGrkwy0N0vg1R0Q7vnoz
 Kox5HKyJmGTURmy0bv9VbGDqBwvxGTgqFYs4DuAuWUHaPBJV7xIM3u2T6SVqaV15sHGc
 PNMtM98o7DiXGJ6QYsaqvM2WEsasmDEd/RO6CTdfb6s5jr1eq1YHyJsAqRXKKQpkO99U
 +enHF5ABhPZEk/ApJ05jrjI1rbFR+r+417jq0GPlm9kppw3TWzLgredbS8LrRRCoYtxt
 KHKErniA8sbbY43iDFQbvK/oYO7dNzONaKMcS6QdWCVLG+aGZLfiFMi9u5kAu4cCMl72 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttd0cgh9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 10:00:44 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39I9kY2b010439;
	Wed, 18 Oct 2023 10:00:44 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttd0cgh8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 10:00:44 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39I8SZrx027177;
	Wed, 18 Oct 2023 10:00:43 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr6tkf86u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 10:00:43 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39IA0hVu11666072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Oct 2023 10:00:43 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BA5B58062;
	Wed, 18 Oct 2023 10:00:43 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4CD05805C;
	Wed, 18 Oct 2023 10:00:40 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.81.129])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Oct 2023 10:00:40 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mm: Update set_ptes to call pte_filter for all
 the ptes
In-Reply-To: <85534337-d558-42ed-b042-115f3460d740@linux.ibm.com>
References: <20231018045523.776679-1-aneesh.kumar@linux.ibm.com>
 <9c598590-6911-3254-1560-62785fc325dc@csgroup.eu>
 <85534337-d558-42ed-b042-115f3460d740@linux.ibm.com>
Date: Wed, 18 Oct 2023 15:30:37 +0530
Message-ID: <8734y8z1ve.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _A7E9BIQ5Bi5e6qVpnL4qXSEbRhOpVgL
X-Proofpoint-GUID: FHtV3X49Bw7WLmoa94UyhoWiIbl8vF5n
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_08,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180083
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

Aneesh Kumar K V <aneesh.kumar@linux.ibm.com> writes:

> On 10/18/23 11:25 AM, Christophe Leroy wrote:
>>=20
>>=20
>> Le 18/10/2023 =C3=A0 06:55, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>>> With commit 9fee28baa601 ("powerpc: implement the new page table range
>>> API") we added set_ptes to powerpc architecture but the implementation
>>> missed calling the pte filter for all the ptes we are setting in the
>>> range. set_pte_filter can be used for filter pte values and on some
>>> platforms which don't support coherent icache it clears the exec bit so
>>> that we can flush the icache on exec fault
>>>
>>> The patch also removes the usage of arch_enter/leave_lazy_mmu() because
>>> set_pte is not supposed to be used when updating a pte entry. Powerpc
>>> architecture uses this rule to skip the expensive tlb invalidate which
>>> is not needed when you are setting up the pte for the first time. See
>>> commit 56eecdb912b5 ("mm: Use ptep/pmdp_set_numa() for updating
>>> _PAGE_NUMA bit") for more details
>>>
>>> Fixes: 9fee28baa601 ("powerpc: implement the new page table range API")
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>   arch/powerpc/mm/pgtable.c | 33 ++++++++++++++++++++-------------
>>>   1 file changed, 20 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
>>> index 3ba9fe411604..95ab20cca2da 100644
>>> --- a/arch/powerpc/mm/pgtable.c
>>> +++ b/arch/powerpc/mm/pgtable.c
>>> @@ -191,28 +191,35 @@ void set_ptes(struct mm_struct *mm, unsigned long=
 addr, pte_t *ptep,
>>>   		pte_t pte, unsigned int nr)
>>>   {
>>>   	/*
>>> -	 * Make sure hardware valid bit is not set. We don't do
>>> -	 * tlb flush for this update.
>>> +	 * We don't need to call arch_enter/leave_lazy_mmu_mode()
>>> +	 * because we expect set_ptes to be only be used on not present
>>> +	 * and not hw_valid ptes. Hence there is not translation cache flush
>>> +	 * involved that need to be batched.
>>>   	 */
>>> -	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
>>> +	for (;;) {
>>>=20=20=20
>>> -	/* Note: mm->context.id might not yet have been assigned as
>>> -	 * this context might not have been activated yet when this
>>> -	 * is called.
>>> -	 */
>>> -	pte =3D set_pte_filter(pte);
>>> +		/*
>>> +		 * Make sure hardware valid bit is not set. We don't do
>>> +		 * tlb flush for this update.
>>> +		 */
>>> +		VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
>>>=20=20=20
>>> -	/* Perform the setting of the PTE */
>>> -	arch_enter_lazy_mmu_mode();
>>> -	for (;;) {
>>> +		/* Note: mm->context.id might not yet have been assigned as
>>> +		 * this context might not have been activated yet when this
>>> +		 * is called.
>>> +		 */
>>> +		pte =3D set_pte_filter(pte);
>>=20
>> Why do you need to call set_pte_filter() inside the loop ?
>> The only difference between previous pte and next pte is the RPN, other=
=20
>> flags remain untouched so I can't see why you need to call=20
>> set_pte_filter() again.
>>=20
>
> I missed the fact that we use the filtered pte in all the ptes in the ran=
ge. One other details
> that made me look at calling the filter in the loop was we clearing the s=
truct page->flags.
> The only flag right now we care about the PG_dcache_clean and that moved =
to folio. So we might be
> good here. May be we add a comment in set_pte_filter saying can operate o=
nly on folio->flags ?=20
>
>>> +
>>> +		/* Perform the setting of the PTE */
>>>   		__set_pte_at(mm, addr, ptep, pte, 0);
>>>   		if (--nr =3D=3D 0)
>>>   			break;
>>>   		ptep++;
>>> -		pte =3D __pte(pte_val(pte) + (1UL << PTE_RPN_SHIFT));
>>>   		addr +=3D PAGE_SIZE;
>>> +		/* increment the pfn */
>>> +		pte =3D __pte(pte_val(pte) + PAGE_SIZE);
>>=20
>> PAGE_SIZE doesn't work on all platforms, see for instance e500.
>>=20
>> see comment at=20
>> https://elixir.bootlin.com/linux/v6.3-rc2/source/arch/powerpc/include/as=
m/nohash/32/pgtable.h#L147
>>=20
>> And then you see=20
>> https://elixir.bootlin.com/linux/v6.3-rc2/source/arch/powerpc/include/as=
m/nohash/pte-e500.h#L63
>>=20
>
> Didn't know that. I actually wanted to do pfn_pte(pte_pfn(pte) + 1) . But=
 that needs pgprot_t. I
> can move it back to PTE_RPN_SHIFT with details of the above documented.=20
>

something like this ?

From 62825870d4b48ffb53e9837dfb4cf7c0422732ec Mon Sep 17 00:00:00 2001
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Fri, 6 Oct 2023 22:47:00 +0530
Subject: [PATCH] powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in
 set_ptes

With commit 9fee28baa601 ("powerpc: implement the new page table range
API") we added set_ptes to powerpc architecture. The implementation
included calling arch_enter/leave_lazy_mmu() calls.

The patch removes the usage of arch_enter/leave_lazy_mmu() because
set_pte is not supposed to be used when updating a pte entry. Powerpc
architecture uses this rule to skip the expensive tlb invalidate which
is not needed when you are setting up the pte for the first time. See
commit 56eecdb912b5 ("mm: Use ptep/pmdp_set_numa() for updating
_PAGE_NUMA bit") for more details

The patch also makes sure we are not using the interface to update a
valid/present pte entry by adding VM_WARN_ON check all the ptes we
are setting up. Furthermore, we add a comment to set_pte_filter to
clarify it can only update folio-related flags and cannot filter
pfn specific details in pte filtering.

Removal of arch_enter/leave_lazy_mmu() also will avoid nesting of
these functions that are not supported. For ex:

remap_pte_range()
  -> arch_enter_lazy_mmu()
  -> set_ptes()
      -> arch_enter_lazy_mmu()
      -> arch_leave_lazy_mmu()
  -> arch_leave_lazy_mmu()

Fixes: 9fee28baa601 ("powerpc: implement the new page table range API")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/pgtable.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 3ba9fe411604..4d69bfb9bc11 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -104,6 +104,8 @@ static pte_t set_pte_filter_hash(pte_t pte) { return pt=
e; }
 /* Embedded type MMU with HW exec support. This is a bit more complicated
  * as we don't have two bits to spare for _PAGE_EXEC and _PAGE_HWEXEC so
  * instead we "filter out" the exec permission for non clean pages.
+ *
+ * This is also called once for the folio. So only work with folio->flags =
here.
  */
 static inline pte_t set_pte_filter(pte_t pte)
 {
@@ -190,29 +192,39 @@ static pte_t set_access_flags_filter(pte_t pte, struc=
t vm_area_struct *vma,
 void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 		pte_t pte, unsigned int nr)
 {
-	/*
-	 * Make sure hardware valid bit is not set. We don't do
-	 * tlb flush for this update.
-	 */
-	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
=20
 	/* Note: mm->context.id might not yet have been assigned as
 	 * this context might not have been activated yet when this
-	 * is called.
+	 * is called. Filter the pte value and use the filtered value
+	 * to setup all the ptes in the range.
 	 */
 	pte =3D set_pte_filter(pte);
=20
-	/* Perform the setting of the PTE */
-	arch_enter_lazy_mmu_mode();
+	/*
+	 * We don't need to call arch_enter/leave_lazy_mmu_mode()
+	 * because we expect set_ptes to be only be used on not present
+	 * and not hw_valid ptes. Hence there is no translation cache flush
+	 * involved that need to be batched.
+	 */
 	for (;;) {
+
+		/*
+		 * Make sure hardware valid bit is not set. We don't do
+		 * tlb flush for this update.
+		 */
+		VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+
+		/* Perform the setting of the PTE */
 		__set_pte_at(mm, addr, ptep, pte, 0);
 		if (--nr =3D=3D 0)
 			break;
 		ptep++;
-		pte =3D __pte(pte_val(pte) + (1UL << PTE_RPN_SHIFT));
 		addr +=3D PAGE_SIZE;
+		/*
+		 * increment the pfn.
+		 */
+		pte =3D pfn_pte(pte_pfn(pte) + 1, pte_pgprot((pte)));
 	}
-	arch_leave_lazy_mmu_mode();
 }
=20
 void unmap_kernel_page(unsigned long va)
--=20
2.41.0

