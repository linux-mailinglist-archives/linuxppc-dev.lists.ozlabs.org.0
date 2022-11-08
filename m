Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D7621B0F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 18:48:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6FvB631jz3f44
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 04:48:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E+MpEv9I;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TL2hFGur;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E+MpEv9I;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TL2hFGur;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Fst5TDqz3dwc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 04:47:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667929631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BQ7PDKfmtoPRA+bF4Km9GFm2Sx9d/OhosQnplgpAu2o=;
	b=E+MpEv9I4APiY3QydHByg76/+0F1VQWm4KUF9UN1Q3AYAHj+WuCu9tKtLjlC5bDqCDyjaO
	O1v1cfw37ZED14pyT5F5Vn5qIAgKebOzUR9OJ4j4l/QffOvN28+RfkWdaXJNppVEodQPB6
	EIzUdv+PM+FZiGERbGa43PksCfEAfaY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667929632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BQ7PDKfmtoPRA+bF4Km9GFm2Sx9d/OhosQnplgpAu2o=;
	b=TL2hFGurMruwwzlLQjnvk46mYZssIW1oepq2n4j7zPOGHnuaQB8ESwAh3Jdw4psMOXrjPJ
	dqMM0/WQKN1dHLYnT4Xyex8eRhVPyFJmp2rrY/HdFA9t5ewclHnJnpoAfdwcC1LQGRmC8J
	H1KItv7y2CHbu5yt76jQChIoqdqVmZo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-GTbBNtcrM_6NpAte7C8S-Q-1; Tue, 08 Nov 2022 12:47:06 -0500
X-MC-Unique: GTbBNtcrM_6NpAte7C8S-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC2DA3C0F7EA;
	Tue,  8 Nov 2022 17:47:04 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.194.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0672C15BB5;
	Tue,  8 Nov 2022 17:47:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] mm/mprotect: minor can_change_pte_writable() cleanups
Date: Tue,  8 Nov 2022 18:46:47 +0100
Message-Id: <20221108174652.198904-3-david@redhat.com>
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

We want to replicate this code for handling PMDs soon.

(1) No need to crash the kernel, warning and rejecting is good enough. As
    this will no longer get optimized out, drop the pte_write() check: no
    harm would be done.

(2) Add a comment why PROT_NONE mapped pages are excluded.

(3) Add a comment regarding MAP_SHARED handling and why we rely on the
    dirty bit in the PTE.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/mprotect.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 86a28c0e190f..72aabffb7871 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -44,8 +44,10 @@ static inline bool can_change_pte_writable(struct vm_area_struct *vma,
 {
 	struct page *page;
 
-	VM_BUG_ON(!(vma->vm_flags & VM_WRITE) || pte_write(pte));
+	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
+		return false;
 
+	/* Don't touch entries that are not even readable. */
 	if (pte_protnone(pte))
 		return false;
 
@@ -59,15 +61,22 @@ static inline bool can_change_pte_writable(struct vm_area_struct *vma,
 
 	if (!(vma->vm_flags & VM_SHARED)) {
 		/*
-		 * We can only special-case on exclusive anonymous pages,
-		 * because we know that our write-fault handler similarly would
-		 * map them writable without any additional checks while holding
-		 * the PT lock.
+		 * Writable MAP_PRIVATE mapping: We can only special-case on
+		 * exclusive anonymous pages, because we know that our
+		 * write-fault handler similarly would map them writable without
+		 * any additional checks while holding the PT lock.
 		 */
 		page = vm_normal_page(vma, addr, pte);
 		return page && PageAnon(page) && PageAnonExclusive(page);
 	}
 
+	/*
+	 * Writable MAP_SHARED mapping: "clean" might indicate that the FS still
+	 * needs a real write-fault for writenotify
+	 * (see vma_wants_writenotify()). If "dirty", the assumption is that the
+	 * FS was already notified and we can simply mark the PTE writable
+	 * just like the write-fault handler would do.
+	 */
 	return pte_dirty(pte);
 }
 
-- 
2.38.1

