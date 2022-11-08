Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B22621B16
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 18:49:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6FwC53lsz3f6X
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 04:49:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TNXNVGCM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TNXNVGCM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TNXNVGCM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TNXNVGCM;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Fst1s2qz3dvN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 04:47:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667929627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YPbVJPY8MtPnMTid4uTdi1CU5/wNXrXzoHJaI5QF0k=;
	b=TNXNVGCMHBVhDVVPdDG7gYUC1MuFNkrnNj4DfifWPZVaDf5oR3XrrLygYKPOR7wRuNHCAU
	d2TuR/WY+tYkrRpRutJZGZ68KtAvkZ1mAe9/euJOMt8XJYcfhVOMi8JLEa+UrvoX9sc0hk
	tiwBnbnEtwwzG6EUl1T9nKrcEWB/+RM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667929627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YPbVJPY8MtPnMTid4uTdi1CU5/wNXrXzoHJaI5QF0k=;
	b=TNXNVGCMHBVhDVVPdDG7gYUC1MuFNkrnNj4DfifWPZVaDf5oR3XrrLygYKPOR7wRuNHCAU
	d2TuR/WY+tYkrRpRutJZGZ68KtAvkZ1mAe9/euJOMt8XJYcfhVOMi8JLEa+UrvoX9sc0hk
	tiwBnbnEtwwzG6EUl1T9nKrcEWB/+RM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-5U-PXS9XOe-k_dUPBm89IA-1; Tue, 08 Nov 2022 12:47:02 -0500
X-MC-Unique: 5U-PXS9XOe-k_dUPBm89IA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FB033806738;
	Tue,  8 Nov 2022 17:47:01 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.194.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5E20C15BB5;
	Tue,  8 Nov 2022 17:46:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] mm/mprotect: allow clean exclusive anon pages to be writable
Date: Tue,  8 Nov 2022 18:46:46 +0100
Message-Id: <20221108174652.198904-2-david@redhat.com>
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

From: Nadav Amit <namit@vmware.com>

Anonymous pages might have the dirty bit clear, but this should not
prevent mprotect from making them writable if they are exclusive.
Therefore, skip the test whether the page is dirty in this case.

Note that there are already other ways to get a writable PTE mapping an
anonymous page that is clean: for example, via MADV_FREE. In an ideal
world, we'd have a different indication from the FS whether writenotify
is still required.

Signed-off-by: Nadav Amit <namit@vmware.com>
[ return directly; update description ]
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/mprotect.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 8d770855b591..86a28c0e190f 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -46,7 +46,7 @@ static inline bool can_change_pte_writable(struct vm_area_struct *vma,
 
 	VM_BUG_ON(!(vma->vm_flags & VM_WRITE) || pte_write(pte));
 
-	if (pte_protnone(pte) || !pte_dirty(pte))
+	if (pte_protnone(pte))
 		return false;
 
 	/* Do we need write faults for softdirty tracking? */
@@ -65,11 +65,10 @@ static inline bool can_change_pte_writable(struct vm_area_struct *vma,
 		 * the PT lock.
 		 */
 		page = vm_normal_page(vma, addr, pte);
-		if (!page || !PageAnon(page) || !PageAnonExclusive(page))
-			return false;
+		return page && PageAnon(page) && PageAnonExclusive(page);
 	}
 
-	return true;
+	return pte_dirty(pte);
 }
 
 static unsigned long change_pte_range(struct mmu_gather *tlb,
-- 
2.38.1

