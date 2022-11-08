Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66850621B21
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 18:51:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6FyD1XXcz3f46
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 04:51:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f/qc6/LI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f/qc6/LI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f/qc6/LI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f/qc6/LI;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Fsw1nN3z3dv9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 04:47:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667929633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qF4AawT1CUSPT7cjLSeaKxf0IPbLFxKsvIIMhgx85ZA=;
	b=f/qc6/LIBCWEfPLJ1lo69/XQuKosAqCS1RtjYF7XVgt1X32pu2iyPtG2kLjEcovjbYiWqX
	NU/EeAZW5MWMAHgRUo5vSDluPcZpVL5e2N9+2XTCK96xh0qOkcfVbEaeBTWIkLRn6B4DCF
	Em2z90KNbyFpK6h8J+oMWSRmIHxdT/s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667929633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qF4AawT1CUSPT7cjLSeaKxf0IPbLFxKsvIIMhgx85ZA=;
	b=f/qc6/LIBCWEfPLJ1lo69/XQuKosAqCS1RtjYF7XVgt1X32pu2iyPtG2kLjEcovjbYiWqX
	NU/EeAZW5MWMAHgRUo5vSDluPcZpVL5e2N9+2XTCK96xh0qOkcfVbEaeBTWIkLRn6B4DCF
	Em2z90KNbyFpK6h8J+oMWSRmIHxdT/s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-fLpLc06yPnybKLVzRDVTAg-1; Tue, 08 Nov 2022 12:47:09 -0500
X-MC-Unique: fLpLc06yPnybKLVzRDVTAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85E9A3806738;
	Tue,  8 Nov 2022 17:47:08 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.194.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57D3FC15BB5;
	Tue,  8 Nov 2022 17:47:05 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] mm/huge_memory: try avoiding write faults when changing PMD protection
Date: Tue,  8 Nov 2022 18:46:48 +0100
Message-Id: <20221108174652.198904-4-david@redhat.com>
In-Reply-To: <20221108174652.198904-1-david@redhat.com>
References: <20221108174652.198904-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Anshuman Khandual <anshuman.khandual@arm.com>, Dave Chinner <david@fromorbit.com>, Mel Gorman <mgorman@techsingularity.net>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's replicate what we have for PTEs in can_change_pte_writable() also
for PMDs.

While this might look like a pure performance improvement, we'll us this to
get rid of savedwrite handling in do_huge_pmd_numa_page() next. Place
do_huge_pmd_numa_page() strategically good for that purpose.

Note that MM_CP_TRY_CHANGE_WRITABLE is currently only set when we come
via mprotect_fixup().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1d47b3f7b877..eeba9c00df62 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1344,6 +1344,36 @@ vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf)
 	return VM_FAULT_FALLBACK;
 }
 
+static inline bool can_change_pmd_writable(struct vm_area_struct *vma,
+					   unsigned long addr, pmd_t pmd)
+{
+	struct page *page;
+
+	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
+		return false;
+
+	/* Don't touch entries that are not even readable (NUMA hinting). */
+	if (pmd_protnone(pmd))
+		return false;
+
+	/* Do we need write faults for softdirty tracking? */
+	if (vma_soft_dirty_enabled(vma) && !pmd_soft_dirty(pmd))
+		return false;
+
+	/* Do we need write faults for uffd-wp tracking? */
+	if (userfaultfd_huge_pmd_wp(vma, pmd))
+		return false;
+
+	if (!(vma->vm_flags & VM_SHARED)) {
+		/* See can_change_pte_writable(). */
+		page = vm_normal_page_pmd(vma, addr, pmd);
+		return page && PageAnon(page) && PageAnonExclusive(page);
+	}
+
+	/* See can_change_pte_writable(). */
+	return pmd_dirty(pmd);
+}
+
 /* FOLL_FORCE can write to even unwritable PMDs in COW mappings. */
 static inline bool can_follow_write_pmd(pmd_t pmd, struct page *page,
 					struct vm_area_struct *vma,
@@ -1847,13 +1877,17 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		 */
 		entry = pmd_clear_uffd_wp(entry);
 	}
+
+	/* See change_pte_range(). */
+	if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) && !pmd_write(entry) &&
+	    can_change_pmd_writable(vma, addr, entry))
+		entry = pmd_mkwrite(entry);
+
 	ret = HPAGE_PMD_NR;
 	set_pmd_at(mm, addr, pmd, entry);
 
 	if (huge_pmd_needs_flush(oldpmd, entry))
 		tlb_flush_pmd_range(tlb, addr, HPAGE_PMD_SIZE);
-
-	BUG_ON(vma_is_anonymous(vma) && !preserve_write && pmd_write(entry));
 unlock:
 	spin_unlock(ptl);
 	return ret;
-- 
2.38.1

