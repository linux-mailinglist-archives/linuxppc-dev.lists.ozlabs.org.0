Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40272616DA3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 20:15:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2c6t1Hr5z3dvc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 06:15:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dnSNZPPn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dnSNZPPn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dnSNZPPn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dnSNZPPn;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2c3716tpz3cBX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 06:12:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667416352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i9Nj+zQyYQBG4f2go77/+locGEKtFGKyiVQKINILkQE=;
	b=dnSNZPPnTF8XW+k+dI9KZIyfjE4/BkZEjozup0AC7C5Zb9rsvV0n9mTgsnm9HL/8WfUVbZ
	+YlS8KfeYcIaHmAEtS1TLWlx2uSDwJSjJuQGaIgMy/ce2MFzngY7qUiChKWrMkw9/xrgSr
	rgsV4828DhxJwdCBvM/pgM6pzKgVNnQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667416352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i9Nj+zQyYQBG4f2go77/+locGEKtFGKyiVQKINILkQE=;
	b=dnSNZPPnTF8XW+k+dI9KZIyfjE4/BkZEjozup0AC7C5Zb9rsvV0n9mTgsnm9HL/8WfUVbZ
	+YlS8KfeYcIaHmAEtS1TLWlx2uSDwJSjJuQGaIgMy/ce2MFzngY7qUiChKWrMkw9/xrgSr
	rgsV4828DhxJwdCBvM/pgM6pzKgVNnQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-4sbLYF5wNae3WnuTYxnu6w-1; Wed, 02 Nov 2022 15:12:27 -0400
X-MC-Unique: 4sbLYF5wNae3WnuTYxnu6w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AF952A59555;
	Wed,  2 Nov 2022 19:12:26 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.192.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 294A649BB60;
	Wed,  2 Nov 2022 19:12:22 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/6] mm/huge_memory: try avoiding write faults when changing PMD protection
Date: Wed,  2 Nov 2022 20:12:06 +0100
Message-Id: <20221102191209.289237-4-david@redhat.com>
In-Reply-To: <20221102191209.289237-1-david@redhat.com>
References: <20221102191209.289237-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
index a524db74e9e6..2ad68e91896a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1341,6 +1341,36 @@ vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf)
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
@@ -1844,13 +1874,17 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
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

