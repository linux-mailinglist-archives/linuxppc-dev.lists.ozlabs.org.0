Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2715EAB00
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 17:27:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbmpf4rYdz3cg0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 01:27:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NiWap9Mg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gECoolek;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NiWap9Mg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gECoolek;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbmnR2gccz300V
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 01:26:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664205992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wUjpPVfNq3g+nZuxz52N7YaNroA0tr6QoNT1fN2tuhM=;
	b=NiWap9MgxNpg1echPVqsnU5KY1mgq5cS3mfSwVJjdUavRePaAgpgLMdHMS0PQ3AQpp+tWj
	KbNwsgAPommVpKquWQjWHh2FAiG4oJKllVaw5AcjZ1o4UeRzWoCI25S/tYryy26BtHrFrj
	6HQpnxkYayuhLSBkrcQ3SAfO7V5itZk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664205993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wUjpPVfNq3g+nZuxz52N7YaNroA0tr6QoNT1fN2tuhM=;
	b=gECoolekUcxUDeRb1r8E1DljEV7leR6Gg9j7D4VADe65KcsBz14E0PvBiaMpFTOGhHu+vR
	1HvR3obUWAyWsygwmW93pTrEqlfJ3Rall7KbVI3sIpvVTYZJXufKmynHd6BxVw8l+9nt2k
	TtoH9kuZmgVcdgd2z4iatdz73cPnyYw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-2yZt-JntMraBHgXMowr4YQ-1; Mon, 26 Sep 2022 11:26:29 -0400
X-MC-Unique: 2yZt-JntMraBHgXMowr4YQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FA4B3801F4C;
	Mon, 26 Sep 2022 15:26:27 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 280DEC15BA5;
	Mon, 26 Sep 2022 15:26:23 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 1/5] mm/mprotect: allow clean exclusive anon pages to be writable
Date: Mon, 26 Sep 2022 17:26:14 +0200
Message-Id: <20220926152618.194810-2-david@redhat.com>
In-Reply-To: <20220926152618.194810-1-david@redhat.com>
References: <20220926152618.194810-1-david@redhat.com>
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
[ comment for dirty/clean handling; return directly; update description ]
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/mprotect.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index ed013f836b4a..c6c13a0a4bcc 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -45,7 +45,7 @@ static inline bool can_change_pte_writable(struct vm_area_struct *vma,
 
 	VM_BUG_ON(!(vma->vm_flags & VM_WRITE) || pte_write(pte));
 
-	if (pte_protnone(pte) || !pte_dirty(pte))
+	if (pte_protnone(pte))
 		return false;
 
 	/* Do we need write faults for softdirty tracking? */
@@ -64,11 +64,15 @@ static inline bool can_change_pte_writable(struct vm_area_struct *vma,
 		 * the PT lock.
 		 */
 		page = vm_normal_page(vma, addr, pte);
-		if (!page || !PageAnon(page) || !PageAnonExclusive(page))
-			return false;
+		return page && PageAnon(page) && PageAnonExclusive(page);
 	}
 
-	return true;
+	/*
+	 * Shared mapping: "clean" might indicate that the FS still has to be
+	 * notified via a write fault once first -- see vma_wants_writenotify().
+	 * If "dirty", the assumtion is that there already was a write fault.
+	 */
+	return pte_dirty(pte);
 }
 
 static unsigned long change_pte_range(struct mmu_gather *tlb,
-- 
2.37.3

