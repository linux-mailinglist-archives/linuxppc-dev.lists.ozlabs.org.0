Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2047418C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 21:18:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TuqE7X4K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrrwP4Y63z3bXh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 05:18:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TuqE7X4K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrrvS5QPfz2y3Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 05:17:56 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35SJC11t030309;
	Wed, 28 Jun 2023 19:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=+6AeCSUCUv+yG1gm0hgV/y90gX2HiRtJaO0/FqDrUic=;
 b=TuqE7X4K77xnwskOiMiVGE4LsXPkbSP5o0DX84P52/OMQgjLQ9m820ng9X5Cg1zV+900
 mjyEEnpjw3eHhMokrc6Y1/D55aM+uHd0JPzuVxeP77f8afIQ7IcXrsHZbvtdFrXQLjOx
 Ard0Alfu0hOZZTMydza0TcsVkgMIYS1yQAThxOWOpljScb64GJPSgPBmOtBjAbTiTnvF
 PNr/15qR4eSQ5+2rcrkVLy8+9Dh9UMFK+OICfhI16VMQA3zoOyC5/bavagbxR/JbOUDk
 XzIyvoWPXvYzzOFacWuY4Wt72ashvH3w78xIGbCOIfW1EjResi+teHvBO9vyd9T5QGaY zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rgttc83hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 19:16:36 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35SJEJIM005126;
	Wed, 28 Jun 2023 19:16:35 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rgttc83gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 19:16:35 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35SFxV5e001753;
	Wed, 28 Jun 2023 19:16:32 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3rdr4525bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 19:16:32 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35SJGT6a16515806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Jun 2023 19:16:29 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 215B520040;
	Wed, 28 Jun 2023 19:16:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5F5F20043;
	Wed, 28 Jun 2023 19:16:26 +0000 (GMT)
Received: from thinkpad-T15 (unknown [9.179.23.181])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 28 Jun 2023 19:16:26 +0000 (GMT)
Date: Wed, 28 Jun 2023 21:16:24 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables
 sharing page
Message-ID: <20230628211624.531cdc58@thinkpad-T15>
In-Reply-To: <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
	<a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 86OsqEDFvZG1BCDwjde60XEA7qLVwybC
X-Proofpoint-GUID: TBMvN-e7yOp90bNZ7UtNMOMiVqg5gMzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_14,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 mlxscore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306280169
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@sol
 een.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Jun 2023 00:51:19 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> Add s390-specific pte_free_defer(), to call pte_free() via call_rcu().
> pte_free_defer() will be called inside khugepaged's retract_page_tables()
> loop, where allocating extra memory cannot be relied upon.  This precedes
> the generic version to avoid build breakage from incompatible pgtable_t.
> 
> This version is more complicated than others: because s390 fits two 2K
> page tables into one 4K page (so page->rcu_head must be shared between
> both halves), and already uses page->lru (which page->rcu_head overlays)
> to list any free halves; with clever management by page->_refcount bits.
> 
> Build upon the existing management, adjusted to follow a new rule: that
> a page is not linked to mm_context_t::pgtable_list while either half is
> pending free, by either tlb_remove_table() or pte_free_defer(); but is
> afterwards either relinked to the list (if other half is allocated), or
> freed (if other half is free): by __tlb_remove_table() in both cases.
> 
> This rule ensures that page->lru is no longer in use while page->rcu_head
> may be needed for use by pte_free_defer().  And a fortuitous byproduct of
> following this rule is that page_table_free() no longer needs its curious
> two-step manipulation of _refcount - read commit c2c224932fd0 ("s390/mm:
> fix 2KB pgtable release race") for what to think of there.  But it does
> not solve the problem that two halves may need rcu_head at the same time.
> 
> For that, add HHead bits between s390's AAllocated and PPending bits in
> the upper byte of page->_refcount: then the second pte_free_defer() can
> see that rcu_head is already in use, and the RCU callee pte_free_half()
> can see that it needs to make a further call_rcu() for that other half.
> 
> page_table_alloc() set the page->pt_mm field, so __tlb_remove_table()
> knows where to link the freed half while its other half is allocated.
> But linking to the list needs mm->context.lock: and although AA bit set
> guarantees that pt_mm must still be valid, it does not guarantee that mm
> is still valid an instant later: so acquiring mm->context.lock would not
> be safe.  For now, use a static global mm_pgtable_list_lock instead:
> then a soon-to-follow commit will split it per-mm as before (probably by
> using a SLAB_TYPESAFE_BY_RCU structure for the list head and its lock);
> and update the commentary on the pgtable_list.
> 
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  arch/s390/include/asm/pgalloc.h |   4 +
>  arch/s390/mm/pgalloc.c          | 205 +++++++++++++++++++++++---------
>  include/linux/mm_types.h        |   2 +-
>  3 files changed, 154 insertions(+), 57 deletions(-)

As discussed in the other thread, we would rather go with less complexity,
possibly switching to an approach w/o the list and fragment re-use in the
future. For now, as a first step in that direction, we can try with not
adding fragments back only for pte_free_defer(). Here is an adjusted
version of your patch, copying most of your pte_free_defer() logic and
also description, tested with LTP and all three of your patch series applied:

Add s390-specific pte_free_defer(), to call pte_free() via call_rcu().
pte_free_defer() will be called inside khugepaged's retract_page_tables()
loop, where allocating extra memory cannot be relied upon.  This precedes
the generic version to avoid build breakage from incompatible pgtable_t.

This version is more complicated than others: because s390 fits two 2K
page tables into one 4K page (so page->rcu_head must be shared between
both halves), and already uses page->lru (which page->rcu_head overlays)
to list any free halves; with clever management by page->_refcount bits.

Build upon the existing management, adjusted to follow a new rule: that
a page is never added back to the list in pte_free_defer(). It is only
removed from the list, when currently listed because the other fragment
is not allocated. This introduces some asymmetry compared to the other
page table freeing paths, and in particular a list_del() for such pages
must be avoided there. Use page->pt_frag_refcount to keep track of the
list status, and check that before doing list_del() in any freeing path.

Other paths would also not add back such pages to the list, if the other
fragment happens to be freed in such a path at the same time, because
they would observe cleared AA bits.

This rule ensures that page->lru is no longer in use while page->rcu_head
may be needed for use by pte_free_defer(). But it does not solve the problem
that two halves may need rcu_head at the same time.

For that, add HHead bits between s390's AAllocated and PPending bits in
the upper byte of page->_refcount: then the second pte_free_defer() can
see that rcu_head is already in use, and the RCU callee pte_free_half()
can see that it needs to make a further call_rcu() for that other half.

Not adding back unallocated fragments to the list in pte_free_defer()
can result in wasting some amount of memory for pagetables, depending
on how long the allocated fragment will stay in use. In practice, this
effect is expected to be insignificant, and not justify a far more
complex approach, which might allow to add the fragments back later
in __tlb_remove_table(), where we might not have a stable mm any more.

Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
---
 arch/s390/include/asm/pgalloc.h |    4 +
 arch/s390/mm/pgalloc.c          |  136 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 132 insertions(+), 8 deletions(-)

--- a/arch/s390/include/asm/pgalloc.h
+++ b/arch/s390/include/asm/pgalloc.h
@@ -143,6 +143,10 @@ static inline void pmd_populate(struct m
 #define pte_free_kernel(mm, pte) page_table_free(mm, (unsigned long *) pte)
 #define pte_free(mm, pte) page_table_free(mm, (unsigned long *) pte)
 
+/* arch use pte_free_defer() implementation in arch/s390/mm/pgalloc.c */
+#define pte_free_defer pte_free_defer
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
+
 void vmem_map_init(void);
 void *vmem_crst_alloc(unsigned long val);
 pte_t *vmem_pte_alloc(void);
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -185,11 +185,13 @@ void page_table_free_pgste(struct page *
  * The upper byte (bits 24-31) of the parent page _refcount is used
  * for tracking contained 2KB-pgtables and has the following format:
  *
- *   PP  AA
+ *   PPHHAA
  * 01234567    upper byte (bits 24-31) of struct page::_refcount
- *   ||  ||
- *   ||  |+--- upper 2KB-pgtable is allocated
- *   ||  +---- lower 2KB-pgtable is allocated
+ *   ||||||
+ *   |||||+--- upper 2KB-pgtable is allocated
+ *   ||||+---- lower 2KB-pgtable is allocated
+ *   |||+----- upper 2KB-pgtable is pending free by page->rcu_head
+ *   ||+------ lower 2KB-pgtable is pending free by page->rcu_head
  *   |+------- upper 2KB-pgtable is pending for removal
  *   +-------- lower 2KB-pgtable is pending for removal
  *
@@ -229,6 +231,17 @@ void page_table_free_pgste(struct page *
  * logic described above. Both AA bits are set to 1 to denote a 4KB-pgtable
  * while the PP bits are never used, nor such a page is added to or removed
  * from mm_context_t::pgtable_list.
+ *
+ * The HH bits are used to prevent double use of page->rcu_head in
+ * pte_free_defer(), when both 2K pagetables inside a page happen to get
+ * freed by that path at the same time.
+ *
+ * pte_free_defer() also cannot add 2K fragments back to the list, because
+ * page->rcu_head overlays with page->lru. This introduces some asymmetry
+ * compared to the other pagetable freeing paths, and the missing list_add()
+ * in pte_free_defer() could result in incorrect list_del(). Therefore, track
+ * the the list status of a page with page->pt_frag_refcount, and check that
+ * before doing list_del() in any freeing path.
  */
 unsigned long *page_table_alloc(struct mm_struct *mm)
 {
@@ -262,6 +275,7 @@ unsigned long *page_table_alloc(struct m
 				atomic_xor_bits(&page->_refcount,
 							0x01U << (bit + 24));
 				list_del(&page->lru);
+				atomic_set(&page->pt_frag_refcount, 0);
 			}
 		}
 		spin_unlock_bh(&mm->context.lock);
@@ -290,6 +304,7 @@ unsigned long *page_table_alloc(struct m
 		memset64((u64 *)table, _PAGE_INVALID, 2 * PTRS_PER_PTE);
 		spin_lock_bh(&mm->context.lock);
 		list_add(&page->lru, &mm->context.pgtable_list);
+		atomic_set(&page->pt_frag_refcount, 1);
 		spin_unlock_bh(&mm->context.lock);
 	}
 	return table;
@@ -325,13 +340,24 @@ void page_table_free(struct mm_struct *m
 		 */
 		mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
 		mask >>= 24;
-		if (mask & 0x03U)
+		if (mask & 0x03U) {
+			/*
+			 * Other half is allocated, add to list
+			 */
 			list_add(&page->lru, &mm->context.pgtable_list);
-		else
+			atomic_set(&page->pt_frag_refcount, 1);
+		} else if (atomic_read(&page->pt_frag_refcount)) {
+			/*
+			 * Other half is not allocated, and page is on the list,
+			 * remove from list
+			 */
 			list_del(&page->lru);
+			atomic_set(&page->pt_frag_refcount, 0);
+		}
 		spin_unlock_bh(&mm->context.lock);
 		mask = atomic_xor_bits(&page->_refcount, 0x10U << (bit + 24));
 		mask >>= 24;
+		/* Return if other half is allocated, or delayed release pending */
 		if (mask != 0x00U)
 			return;
 		half = 0x01U << bit;
@@ -370,10 +396,22 @@ void page_table_free_rcu(struct mmu_gath
 	 */
 	mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
 	mask >>= 24;
-	if (mask & 0x03U)
+	if (mask & 0x03U) {
+		/*
+		 * Other half is allocated, add to end of list, as this
+		 * will not immediately be re-usable because it is marked
+		 * for delayed release
+		 */
 		list_add_tail(&page->lru, &mm->context.pgtable_list);
-	else
+		atomic_set(&page->pt_frag_refcount, 1);
+	} else if (atomic_read(&page->pt_frag_refcount)) {
+		/*
+		 * Other half is not allocated, and page is on the list,
+		 * remove from list
+		 */
 		list_del(&page->lru);
+		atomic_set(&page->pt_frag_refcount, 0);
+	}
 	spin_unlock_bh(&mm->context.lock);
 	table = (unsigned long *) ((unsigned long) table | (0x01U << bit));
 	tlb_remove_table(tlb, table);
@@ -407,6 +445,88 @@ void __tlb_remove_table(void *_table)
 	__free_page(page);
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static void pte_free_now0(struct rcu_head *head);
+static void pte_free_now1(struct rcu_head *head);
+
+static void pte_free_pgste(struct rcu_head *head)
+{
+	unsigned long *table;
+	struct page *page;
+
+	page = container_of(head, struct page, rcu_head);
+	table = (unsigned long *)page_to_virt(page);
+	table = (unsigned long *)((unsigned long)table | 0x03U);
+	__tlb_remove_table(table);
+}
+
+static void pte_free_half(struct rcu_head *head, unsigned int bit)
+{
+	unsigned long *table;
+	struct page *page;
+	unsigned int mask;
+
+	page = container_of(head, struct page, rcu_head);
+	mask = atomic_xor_bits(&page->_refcount, 0x04U << (bit + 24));
+
+	table = (unsigned long *)page_to_virt(page);
+	table += bit * PTRS_PER_PTE;
+	table = (unsigned long *)((unsigned long)table | (0x01U << bit));
+	__tlb_remove_table(table);
+
+	/* If pte_free_defer() of the other half came in, queue it now */
+	if (mask & 0x0CU)
+		call_rcu(&page->rcu_head, bit ? pte_free_now0 : pte_free_now1);
+}
+
+static void pte_free_now0(struct rcu_head *head)
+{
+	pte_free_half(head, 0);
+}
+
+static void pte_free_now1(struct rcu_head *head)
+{
+	pte_free_half(head, 1);
+}
+
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
+{
+	unsigned int bit, mask;
+	struct page *page;
+
+	page = virt_to_page(pgtable);
+	if (mm_alloc_pgste(mm)) {
+		/*
+		 * TODO: Do we need gmap_unlink(mm, pgtable, addr), like in
+		 * page_table_free_rcu()?
+		 * If yes -> need addr parameter here, like in pte_free_tlb().
+		 */
+		call_rcu(&page->rcu_head, pte_free_pgste);
+		return;
+}
+	bit = ((unsigned long)pgtable & ~PAGE_MASK) / (PTRS_PER_PTE * sizeof(pte_t));
+
+	spin_lock_bh(&mm->context.lock);
+	mask = atomic_xor_bits(&page->_refcount, 0x15U << (bit + 24));
+	mask >>= 24;
+	if ((mask & 0x03U) == 0x00U && atomic_read(&page->pt_frag_refcount)) {
+		/*
+		 * Other half is not allocated, page is on the list,
+		 * remove from list
+		 */
+		list_del(&page->lru);
+		atomic_set(&page->pt_frag_refcount, 0);
+	}
+	/* Page must not be on the list, so rcu_head can be used */
+	BUG_ON(atomic_read(&page->pt_frag_refcount));
+	spin_unlock_bh(&mm->context.lock);
+
+	/* Do not relink on rcu_head if other half already linked on rcu_head */
+	if ((mask & 0x0CU) != 0x0CU)
+		call_rcu(&page->rcu_head, bit ? pte_free_now1 : pte_free_now0);
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
 /*
  * Base infrastructure required to generate basic asces, region, segment,
  * and page tables that do not make use of enhanced features like EDAT1.
