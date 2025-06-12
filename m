Return-Path: <linuxppc-dev+bounces-9325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E458AAD7923
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 19:37:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ8pT5V4Xz2xHT;
	Fri, 13 Jun 2025 03:36:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749749793;
	cv=none; b=QGKakigk4IFtM71dOGGrdoh6zxHNKiI30N3Q3ixSX412D/pSLHvbmc6u2UG2AaiSlFbhuYdHwIgdoLUIfL4iwVimWRElLU5Lxb91NZiRfN/yI3Ico8Pf0Qk5q4bX2qp3B6TqTorcy2iqOpURYx6TxCk1dA3KCZyNlEsn8woZz2WD6y8pwGnyzVrmQK1Lq7Ix067oVJ/jat6DlGHi+L39+vxT0RaF5kAkR2lme6X6bOHMxtp4V3hUM1ncIsXdHp4oq9xKhpHdDyPDAf1atQWqTMw2Cv6DKVjRpsC+o3Q4uLpWEycsgM+iayfzyk9MOHuL3clYVvTibbgwSe8NqHXEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749749793; c=relaxed/relaxed;
	bh=lzDJpUIXBz/mvS0mbFYxHi8XUevGZ8hUcNGEGhasovg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZUjgCLatw+jlS/kl48sEmt6eaImbQWMNzvlGi/cm45oTTeu5CiVgoleYZES8SGhQ7YpXTMjqKUKiKJplupv72t/6m8QBolvGKbrr0g70PekV84aSe/kYavvsGDh6RVQBawG8UbZ8Xlzd9hpEr87PiuCGbr6APGM0KQjWJv1+HcR3+ntiyamuv28yrc7YcI55mtzO7PpRKImal5vFmJPjDUUK8PzEQR6W2QrNyPbg/GsQ7gGFIiwhxmJz7XRGAYdfuiLuk63SkuXWKo8NI7TcsqqUNoAKxYA/5jHxERuVx8J4jyVPYrZksfmUHOwtuq6WpB8MCKRyCFXFFkadLmTdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jqMrmg9P; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jqMrmg9P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ8pR2lqvz30HB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 03:36:30 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CDJP2V021059;
	Thu, 12 Jun 2025 17:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=lzDJpUIXBz/mvS0mb
	FYxHi8XUevGZ8hUcNGEGhasovg=; b=jqMrmg9P9k4as1yQGOTnccjGWG4WF7DEd
	kBXZ1I/97XSYVJbQ+zJBG+JgVx32TNUOqAFmET9+GHhIolrdsQYgYJ2idUI/YD4s
	/xUki5YiOsCOWB0+AVe6rTijtZk1rs6M50nDxRavBOMoS4SGnhy/c7sgJNTotjGi
	6sHMEPK/4npj5FfsZvDdx7jicu1aU5DQMLUhDTl2TpSTAMuwTZfKAnXRxT3UkPF3
	ZIbIMaHnARDwFnGT4yVd8DLscyKbq+WfXuWGn4G+cz7HIOzlYlL6g2UMRNBBQL+M
	8Zy82y8ly2Bvl1bgxesKbgKejydEi6fT68K8HNFyFta7GIJKlnKig==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474cxjmf0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:17 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55CHZKKa027345;
	Thu, 12 Jun 2025 17:36:16 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474cxjmf0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:16 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CF2fhL003405;
	Thu, 12 Jun 2025 17:36:15 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4751ykwr2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:15 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55CHaE2d23134776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 17:36:14 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01F1220040;
	Thu, 12 Jun 2025 17:36:14 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF1282004B;
	Thu, 12 Jun 2025 17:36:13 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Jun 2025 17:36:13 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id A01ECE1994; Thu, 12 Jun 2025 19:36:13 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>,
        Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU mode
Date: Thu, 12 Jun 2025 19:36:09 +0200
Message-ID: <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1749747752.git.agordeev@linux.ibm.com>
References: <cover.1749747752.git.agordeev@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Tb8VA6zUpjW5k1WLGI1WWxPCHUixj1UW
X-Proofpoint-GUID: EYQIsAXzx8ssoXkn44spur2V7kFJyFNc
X-Authority-Analysis: v=2.4 cv=fZWty1QF c=1 sm=1 tr=0 ts=684b1011 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=nMoVGufP4iL6dWhmM1oA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMiBTYWx0ZWRfX7wfxBioE0ali sfc9SNNLuo/uwJWDA3c2xkqqH6rfdv8VXDTQiKWPjoWwN5+YNEn8jTxawLHSc7kSvcbTRzlAEEL 6pE4EG7uVAXP0cTCdUVctrhAA4dPIy9K280bl6EZsHWeiac5dQkU3M23hors8FvuTbzgDf1h9Fp
 4/5hS9LAZnskUMvo6VVxjD1ejeCUnSJ9GDLuknHP+02KFBqLWFqJX4Uj1GH9ITY9ehAeYHg8CPo +NXj5bCNfgunV/T0oR4Y7LXv81qmzH4CP/fN90LYdPGDzAKY9KoFLxiARID9WfB4E8JGYFRMR8X KU0u1kTIIScAeHrSUf7iG+tUJ+YeiYm2VyY0+i/fL8MGK6FCaPHEVVMgFI0JFtKLssBxImKqXFF
 +8XQ7Gu5M/Tz5OkRu7P75cBzlchWZR0cnEVFWg54GBSdDJyxQ+nNXw3MOOvDg1EdtYnL8aNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=965
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120132
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

As a follow-up to commit 691ee97e1a9d ("mm: fix lazy mmu docs and
usage") take a step forward and protect with a lock not only user,
but also kernel mappings before entering the lazy MMU mode. With
that the semantics of arch_enter|leave_lazy_mmu_mode() callbacks
is consolidated, which allows further simplifications.

The effect of this consolidation is not fully preemptible (Real-Time)
kernels can not enter the context switch while the lazy MMU mode is
active - which is easier to comprehend.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 include/linux/pgtable.h | 12 ++++++------
 mm/kasan/shadow.c       |  5 -----
 mm/memory.c             |  5 ++++-
 mm/vmalloc.c            |  6 ++++++
 4 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 0b6e1f781d86..33bf2b13c219 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -224,12 +224,12 @@ static inline int pmd_dirty(pmd_t pmd)
  * a raw PTE pointer after it has been modified are not guaranteed to be
  * up to date.
  *
- * In the general case, no lock is guaranteed to be held between entry and exit
- * of the lazy mode. So the implementation must assume preemption may be enabled
- * and cpu migration is possible; it must take steps to be robust against this.
- * (In practice, for user PTE updates, the appropriate page table lock(s) are
- * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
- * and the mode cannot be used in interrupt context.
+ * For PREEMPT_RT kernels implementation must assume that preemption may
+ * be enabled and cpu migration is possible between entry and exit of the
+ * lazy MMU mode; it must take steps to be robust against this. There is
+ * no such assumption for non-PREEMPT_RT kernels, since both kernel and
+ * user page tables are protected with a spinlock while in lazy MMU mode.
+ * Nesting is not permitted and the mode cannot be used in interrupt context.
  */
 #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 #define arch_enter_lazy_mmu_mode()	do {} while (0)
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index d2c70cd2afb1..45115bd770a9 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -313,12 +313,10 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	__memset(page_to_virt(page), KASAN_VMALLOC_INVALID, PAGE_SIZE);
 	pte = pfn_pte(page_to_pfn(page), PAGE_KERNEL);
 
-	spin_lock(&init_mm.page_table_lock);
 	if (likely(pte_none(ptep_get(ptep)))) {
 		set_pte_at(&init_mm, addr, ptep, pte);
 		data->pages[index] = NULL;
 	}
-	spin_unlock(&init_mm.page_table_lock);
 
 	return 0;
 }
@@ -465,13 +463,10 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 
 	page = (unsigned long)__va(pte_pfn(ptep_get(ptep)) << PAGE_SHIFT);
 
-	spin_lock(&init_mm.page_table_lock);
-
 	if (likely(!pte_none(ptep_get(ptep)))) {
 		pte_clear(&init_mm, addr, ptep);
 		free_page(page);
 	}
-	spin_unlock(&init_mm.page_table_lock);
 
 	return 0;
 }
diff --git a/mm/memory.c b/mm/memory.c
index 71b3d3f98999..1ddc532b1f13 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3017,6 +3017,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 			pte = pte_offset_kernel(pmd, addr);
 		if (!pte)
 			return err;
+		spin_lock(&init_mm.page_table_lock);
 	} else {
 		if (create)
 			pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
@@ -3042,7 +3043,9 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 
 	arch_leave_lazy_mmu_mode();
 
-	if (mm != &init_mm)
+	if (mm == &init_mm)
+		spin_unlock(&init_mm.page_table_lock);
+	else
 		pte_unmap_unlock(mapped_pte, ptl);
 
 	*mask |= PGTBL_PTE_MODIFIED;
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ab986dd09b6a..57b11000ae36 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -105,6 +105,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	if (!pte)
 		return -ENOMEM;
 
+	spin_lock(&init_mm.page_table_lock);
 	arch_enter_lazy_mmu_mode();
 
 	do {
@@ -132,6 +133,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
 
 	arch_leave_lazy_mmu_mode();
+	spin_unlock(&init_mm.page_table_lock);
 	*mask |= PGTBL_PTE_MODIFIED;
 	return 0;
 }
@@ -359,6 +361,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	unsigned long size = PAGE_SIZE;
 
 	pte = pte_offset_kernel(pmd, addr);
+	spin_lock(&init_mm.page_table_lock);
 	arch_enter_lazy_mmu_mode();
 
 	do {
@@ -379,6 +382,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
 
 	arch_leave_lazy_mmu_mode();
+	spin_unlock(&init_mm.page_table_lock);
 	*mask |= PGTBL_PTE_MODIFIED;
 }
 
@@ -525,6 +529,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 	if (!pte)
 		return -ENOMEM;
 
+	spin_lock(&init_mm.page_table_lock);
 	arch_enter_lazy_mmu_mode();
 
 	do {
@@ -542,6 +547,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 	} while (pte++, addr += PAGE_SIZE, addr != end);
 
 	arch_leave_lazy_mmu_mode();
+	spin_unlock(&init_mm.page_table_lock);
 	*mask |= PGTBL_PTE_MODIFIED;
 	return 0;
 }
-- 
2.48.1


