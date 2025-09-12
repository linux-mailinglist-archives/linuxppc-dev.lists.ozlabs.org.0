Return-Path: <linuxppc-dev+bounces-12077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92383B54E22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 14:38:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNYr272R5z3dBd;
	Fri, 12 Sep 2025 22:38:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757680706;
	cv=none; b=hkzSZxPXtGQ5EDNn5moJMj7rCxTtVM8ISeg8Rr3AhNn1rlfT8LTIJORZznMS9AMLZrEGS5b9tPScyOjDXR/C8Il82quW8Ivf8lYAjgFbhG46xR2WjhK/SM5WXjoqZhTlGtYTWDbYHTsK1r4AXcwb5Ipo9PhdgOYKAuCb/LoGFJvO4rzLsyJCTbcMqRmQbsIhMBcphmoeZqSxJ/2CjHE4N4YSZTch6pbrlXVCANrtPmXquanQ3mmw75nNBuD3BhjBa2wtA4Kp2tvvWSpvHCPohvqYqCEoyc/t7VRPat27ziBzIk9KmEzuO4GgoeaEfaL4ko23V+wB3fSS3Ne7LI7o/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757680706; c=relaxed/relaxed;
	bh=F/QMkXR0QmFDH2hSNcKmtWCaKqZWJp/K34Yf9Q/vV4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1edAYPEwpJZHyM0yjVj6RgU+LJLMrL1DTuP3qiPx1vJOhNMfG75KIaoNofk8SqV80dkAAZNSEROS8pCFzYrReL3JhUJOCZG7vC6flP3tPo0nEbC72NGH9uRxnoqWUWXkuCyLrCSKi/29Zd7d6ON1As+oxjDT+qnMQeDF05rqvSEDnNn28pO6y/RDUZ59/9NBxmkx8a3eucbcbOAzLxdhxtZjXqTLxh8VSjjv9cLsAqoZG6FFkb+237Dr/JZWjjc5cx8gm8SjyoWIYzxFSMg04nJ3hKE1DZjibFccCqfWtcYaHDDoDXh03x2wPxLxu4mDVjaxoA/8GLm5C7zK13e4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cj9ccOMz; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cj9ccOMz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNYr16xBYz3cyg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 22:38:25 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C4NGak023577;
	Fri, 12 Sep 2025 12:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=F/QMkXR0QmFDH2hSNcKmtWCaKqZWJp
	/K34Yf9Q/vV4o=; b=cj9ccOMz3g4C+PjNeaWiuuTaP4HNhRLpXSoNy8fDYBJ3tk
	7VmA5YJda8fjEnU3nV9LYEJ0vevAyi5kPStuOoThm2LttsPn7OqSUIv9hpgYHrDl
	VM/aZj0XTYswaLwEhX4chi7Xmx3veV2pPSKQE7Xpwhzl/TPEp2EAuPOeuv511Ow4
	GdjQgA67d2m8iwQ5Lwg5nwGJfFU1oEES3U34uXlfpBV2PZpk1btufFqXlMgXkSrh
	hrBnft6mO7kvHVsAtqgMa22uMd+6dFXCBNXIQ9bxYg5JQfOYQABNv/34YA++priZ
	YK5q9EfpN5W8w2jVpUGi5mI4pVFy6aKSSO89ulWA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmxbgbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:37:48 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58CCZk7V019437;
	Fri, 12 Sep 2025 12:37:47 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmxbgbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:37:47 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58CAHmfd007982;
	Fri, 12 Sep 2025 12:37:46 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49109q2yat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:37:46 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58CCbiaW43581748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 12:37:44 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F244B20043;
	Fri, 12 Sep 2025 12:37:43 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D0D220040;
	Fri, 12 Sep 2025 12:37:43 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 12 Sep 2025 12:37:43 +0000 (GMT)
Date: Fri, 12 Sep 2025 14:37:41 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        Mark Rutland <Mark.Rutland@arm.com>
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
Message-ID: <9ed5441f-cc03-472a-adc6-b9d3ad525664-agordeev@linux.ibm.com>
References: <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <29383ee2-d6d6-4435-9052-d75a263a5c45@redhat.com>
 <9de08024-adfc-421b-8799-62653468cf63@arm.com>
 <ef343405-c394-4763-a79f-21381f217b6c@redhat.com>
 <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
 <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
 <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
 <781a6450-1c0b-4603-91cf-49f16cd78c28@arm.com>
 <a17ab4e3-627a-4989-a5a5-d430eadabb86@redhat.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a17ab4e3-627a-4989-a5a5-d430eadabb86@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DzRH41cgO_SjjRs72WZBVybY8ExotUyL
X-Proofpoint-ORIG-GUID: 5szjY0KVwgiaHLPdjEz_BJ9YvOIOK4Xh
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68c4141c cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=nv4XAxrWCHwsSIOw55kA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfX86gaOQ1LrR1y
 +AynjQ4AgALVhtZYKnZDDT8c+j9DRk8HERAKDNNp36tCtsrKRRJnQfrOFLxyYdnAr8hyqmeGA1f
 1prxUpnPJ5rXvIAgmJzbfZjhxXBnmxRp2iqjJgJ3i90OwHrL2TrKP54cHw5M3qK3XhAF0n2TpPW
 RsnjxBxBdvNnEesXLpwgkw7dWSF2rosg2AqDmw/wB76gRXWMNRK5mr5x7N99pH4pGAXXTiU4uVS
 i159bhlfOwCXD+7CDYya0yNVx3NBZFrGp9nJP7w5HEd4jjYX/OX0RgcnOvpZcS7CewzKLkB5WKW
 CUaIccrW4ap26mcSEi1Rt8r0K+KbR+7MT6HbSo+gGNNB0kqns8XawW6Wq5nSDOWHRsM/E9JdJ0e
 dqDgxgLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 12, 2025 at 10:55:50AM +0200, David Hildenbrand wrote:

Hi David, Kevin,

> Great, looking forward to seeing this all getting cleaned up and done
> properly for good.

I am currently working on lazy mmu for s390 and this nesting
initiative kind of interferres. Well, in fact it looks like
it does not, but I am bit lost in last couple of iterations ;)

The prerequisite for s390 would be something like the change
below. With that change I can store the context in a per-cpu
structure and use it later in arch-specific ptep_* primitives.

Moreover, with a further (experimental) rework we could use
a custom kasan sanitizer to spot false directly compiled
PTE accesses, as opposed to set_pte()/ptep_get() accessors.

I am not quite sure see whether this could be derailed by
the new lazy mmu API. At least I do not immediately see any
obvious problem. But may be you do?


[PATCH] mm: Make lazy MMU mode context-aware

The lazy MMU mode is assumed to be context-independent in a
sense the MMU does not need any additional data in lazy mode.
Yet, s390 architecture may benefit strongly if it knows the
exact page table entries being changed while in lazy mode.

Introduce arch_enter_lazy_mmu_mode_pte() that is provided
with the process memory space and the page table being
operated on as the prerequisite for s390 optimization.
It is expected to be called only against PTE page tables
and never cross the page table boundary.

There is no change for architectures that do not need any
context.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 fs/proc/task_mmu.c      | 2 +-
 include/linux/pgtable.h | 8 ++++++++
 mm/madvise.c            | 8 ++++----
 mm/memory.c             | 8 ++++----
 mm/mprotect.c           | 2 +-
 mm/mremap.c             | 2 +-
 mm/vmalloc.c            | 6 +++---
 7 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 751479eb128f..02fcd2771b2a 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2493,7 +2493,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
 		return 0;
 	}
 
-	arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode_pte(vma->vm_mm, start, end, start_pte);
 
 	if ((p->arg.flags & PM_SCAN_WP_MATCHING) && !p->vec_out) {
 		/* Fast path for performing exclusive WP */
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 0b6e1f781d86..16235c198bcb 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -235,6 +235,14 @@ static inline int pmd_dirty(pmd_t pmd)
 #define arch_enter_lazy_mmu_mode()	do {} while (0)
 #define arch_leave_lazy_mmu_mode()	do {} while (0)
 #define arch_flush_lazy_mmu_mode()	do {} while (0)
+
+static inline void arch_enter_lazy_mmu_mode_pte(struct mm_struct *mm,
+						unsigned long addr,
+						unsigned long end,
+						pte_t *ptep)
+{
+	arch_enter_lazy_mmu_mode(); 
+}
 #endif
 
 #ifndef pte_batch_hint
diff --git a/mm/madvise.c b/mm/madvise.c
index 1d44a35ae85c..d36d4dc42378 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -448,7 +448,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 	if (!start_pte)
 		return 0;
 	flush_tlb_batched_pending(mm);
-	arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode_pte(mm, addr, end, start_pte);
 	for (; addr < end; pte += nr, addr += nr * PAGE_SIZE) {
 		nr = 1;
 		ptent = ptep_get(pte);
@@ -509,7 +509,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 				if (!start_pte)
 					break;
 				flush_tlb_batched_pending(mm);
-				arch_enter_lazy_mmu_mode();
+				arch_enter_lazy_mmu_mode_pte(mm, addr, end, start_pte);
 				if (!err)
 					nr = 0;
 				continue;
@@ -678,7 +678,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 	if (!start_pte)
 		return 0;
 	flush_tlb_batched_pending(mm);
-	arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode_pte(mm, addr, end, start_pte);
 	for (; addr != end; pte += nr, addr += PAGE_SIZE * nr) {
 		nr = 1;
 		ptent = ptep_get(pte);
@@ -743,7 +743,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 				if (!start_pte)
 					break;
 				flush_tlb_batched_pending(mm);
-				arch_enter_lazy_mmu_mode();
+				arch_enter_lazy_mmu_mode_pte(mm, addr, end, pte);
 				if (!err)
 					nr = 0;
 				continue;
diff --git a/mm/memory.c b/mm/memory.c
index b0cda5aab398..93c0b8457eb0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1131,7 +1131,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
 	orig_src_pte = src_pte;
 	orig_dst_pte = dst_pte;
-	arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode_pte(src_mm, addr, end, src_pte);
 
 	do {
 		nr = 1;
@@ -1723,7 +1723,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 		return addr;
 
 	flush_tlb_batched_pending(mm);
-	arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode_pte(mm, addr, end, start_pte);
 	do {
 		bool any_skipped = false;
 
@@ -2707,7 +2707,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
 	mapped_pte = pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
 	if (!pte)
 		return -ENOMEM;
-	arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode_pte(mm, addr, end, mapped_pte);
 	do {
 		BUG_ON(!pte_none(ptep_get(pte)));
 		if (!pfn_modify_allowed(pfn, prot)) {
@@ -3024,7 +3024,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 			return -EINVAL;
 	}
 
-	arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode_pte(mm, addr, end, mapped_pte);
 
 	if (fn) {
 		do {
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 88608d0dc2c2..919c1dedff87 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -106,7 +106,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 		target_node = numa_node_id();
 
 	flush_tlb_batched_pending(vma->vm_mm);
-	arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode_pte(vma->vm_mm, addr, end, pte);
 	do {
 		oldpte = ptep_get(pte);
 		if (pte_present(oldpte)) {
diff --git a/mm/mremap.c b/mm/mremap.c
index 60f6b8d0d5f0..08b9cb3bb9ef 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -233,7 +233,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	if (new_ptl != old_ptl)
 		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
 	flush_tlb_batched_pending(vma->vm_mm);
-	arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode_pte(mm, old_addr, old_end, old_pte);
 
 	for (; old_addr < old_end; old_pte++, old_addr += PAGE_SIZE,
 				   new_pte++, new_addr += PAGE_SIZE) {
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6dbcdceecae1..29cfc64970a5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -105,7 +105,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	if (!pte)
 		return -ENOMEM;
 
-	arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode_pte(&init_mm, addr, end, pte);
 
 	do {
 		if (unlikely(!pte_none(ptep_get(pte)))) {
@@ -359,7 +359,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	unsigned long size = PAGE_SIZE;
 
 	pte = pte_offset_kernel(pmd, addr);
-	arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode_pte(&init_mm, addr, end, pte);
 
 	do {
 #ifdef CONFIG_HUGETLB_PAGE
@@ -526,7 +526,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 	if (!pte)
 		return -ENOMEM;
 
-	arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode_pte(&init_mm, addr, end, pte);
 
 	do {
 		struct page *page = pages[*nr];

> David / dhildenb

Thanks!

