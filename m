Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B03AE7CBA88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 08:05:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=abM+XMbl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8k3w4L8Rz3cF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 17:05:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=abM+XMbl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8k2z0rxWz2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 17:04:42 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39H64Qn9014565;
	Tue, 17 Oct 2023 06:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=omYkSqC8VDjSbMbRVlhkhkaKoZUrM0gq5bjZn0HR/3A=;
 b=abM+XMblr3M2AeWp46eqtdXEKO8yfBcNnrcetmEP3A46J9tKzmQhvCMC+1YRG3XUYdg+
 jBjcpL2D+ZpEeq7gHa212ReevCBtYNHfnh/3dVllOg5mLCnxU1W/Mh4Jb+zsdQH4yENZ
 c2e9xTuSlhJvjcn2ZbAmdbAxzzMlK+9uyfaZW+r6sXP4M444ZBFUNjWDsHGAhXQn0pHl
 AclJzUpbIUTU/b6RYA3GrcT6QPGF3AYEf/AyN1r8hMRFV3faJLwB/NiF/Du8wJPbyQJN
 a5HE7Yg8x1yKkPRP+jHJnX6IPHkMeI0y66vVR6ADbfAYal7Vvs1DfFHmVSsQIFcNm14y vQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsmp7g06m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 06:04:29 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39H4v8t6019672;
	Tue, 17 Oct 2023 06:04:28 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr811dj2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 06:04:28 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39H64RYL8979084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Oct 2023 06:04:28 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D46D658058;
	Tue, 17 Oct 2023 06:04:27 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8268658066;
	Tue, 17 Oct 2023 06:04:25 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.109.212.144])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Oct 2023 06:04:25 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Erhard Furtner <erhard_f@mailbox.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH 0/2] Allow nesting of lazy MMU mode
In-Reply-To: <20231013154220.02fb2e6d@yea>
References: <20231012195415.282357-1-willy@infradead.org>
 <20231013154220.02fb2e6d@yea>
Date: Tue, 17 Oct 2023 11:34:23 +0530
Message-ID: <875y35zswo.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3ef2F9UqU74NAkjCIImOuTF4hWOOEc3A
X-Proofpoint-ORIG-GUID: 3ef2F9UqU74NAkjCIImOuTF4hWOOEc3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_13,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310170049
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
Cc: Juergen Gross <jgross@suse.com>, linux-sparc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Erhard Furtner <erhard_f@mailbox.org> writes:

> On Thu, 12 Oct 2023 20:54:13 +0100
> "Matthew Wilcox (Oracle)" <willy@infradead.org> wrote:
>
>> Dave Woodhouse reported that we now nest calls to
>> arch_enter_lazy_mmu_mode().  That was inadvertent, but in principle we
>> should allow it.  On further investigation, Juergen already fixed it
>> for Xen, but didn't tell anyone.  Fix it for Sparc & PowerPC too.
>> This may or may not help fix the problem that Erhard reported.
>> 
>> Matthew Wilcox (Oracle) (2):
>>   powerpc: Allow nesting of lazy MMU mode
>>   sparc: Allow nesting of lazy MMU mode
>> 
>>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 5 ++---
>>  arch/sparc/mm/tlb.c                                | 5 ++---
>>  2 files changed, 4 insertions(+), 6 deletions(-)
>> 
>> -- 
>> 2.40.1
>
> Applied the patch on top of v6.6-rc5 but unfortunately it did not fix my reported issue.
>
> Regards,
> Erhard
> 

With the problem reported I guess we are finding the page->compound_head
wrong and hence folio->flags PG_dcache_clean check crashing. I still
don't know why we find page->compound_head wrong. Michael noted we are
using FLAT_MEM. That implies we are suppose to inialize struct page correctly
via init_unavailable_range because we are hitting this on an ioremap
address. We need to instrument the kernel to track the initialization of
the struct page backing these pfns which we know is crashing.

W.r.t arch_enter_lazy_mmu_mode() we can skip that completely on powerpc
because we don't allow the usage of set_pte on a valid pte entries. pte
updates are not done via set_pte interface and hence there is no TLB
invalidate required while using set_pte(). 

ie, we can do something like below. The change also make sure we call
set_pte_filter on all the ptes we are setting via set_ptes(). I haven't
sent this as a proper patch because we still are not able to fix the
issue Erhard reported. 

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 3ba9fe411604..95ab20cca2da 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -191,28 +191,35 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 		pte_t pte, unsigned int nr)
 {
 	/*
-	 * Make sure hardware valid bit is not set. We don't do
-	 * tlb flush for this update.
+	 * We don't need to call arch_enter/leave_lazy_mmu_mode()
+	 * because we expect set_ptes to be only be used on not present
+	 * and not hw_valid ptes. Hence there is not translation cache flush
+	 * involved that need to be batched.
 	 */
-	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+	for (;;) {
 
-	/* Note: mm->context.id might not yet have been assigned as
-	 * this context might not have been activated yet when this
-	 * is called.
-	 */
-	pte = set_pte_filter(pte);
+		/*
+		 * Make sure hardware valid bit is not set. We don't do
+		 * tlb flush for this update.
+		 */
+		VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
 
-	/* Perform the setting of the PTE */
-	arch_enter_lazy_mmu_mode();
-	for (;;) {
+		/* Note: mm->context.id might not yet have been assigned as
+		 * this context might not have been activated yet when this
+		 * is called.
+		 */
+		pte = set_pte_filter(pte);
+
+		/* Perform the setting of the PTE */
 		__set_pte_at(mm, addr, ptep, pte, 0);
 		if (--nr == 0)
 			break;
 		ptep++;
-		pte = __pte(pte_val(pte) + (1UL << PTE_RPN_SHIFT));
 		addr += PAGE_SIZE;
+		/* increment the pfn */
+		pte = __pte(pte_val(pte) + PAGE_SIZE);
+
 	}
-	arch_leave_lazy_mmu_mode();
 }
 
 void unmap_kernel_page(unsigned long va)
