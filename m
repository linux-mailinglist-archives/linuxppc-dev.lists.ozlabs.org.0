Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2C873498
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 11:43:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYLVYXF0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYLVYXF0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqTYW4sXRz3vjP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 21:43:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYLVYXF0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYLVYXF0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqTX475jPz3dXT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 21:42:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709721729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20nNimBrOEQv87l0vyMx8t0O66X6ZMzRQtOERvnhrUo=;
	b=OYLVYXF0Q3FH516eOTadMFuJ1FxoUjoGoN6h49kP8znMXzmUDfEiXVx+ryyoALMSfZukmw
	FPGGSwjjnWKTMNWJsg2Q5016DO7b/0AL07psN4DxKitcKg59xXmu8SDLdlNAPPACoDb2Xe
	KcZAt+FgGNXsRu7C8VTx7sMerukt7Zg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709721729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20nNimBrOEQv87l0vyMx8t0O66X6ZMzRQtOERvnhrUo=;
	b=OYLVYXF0Q3FH516eOTadMFuJ1FxoUjoGoN6h49kP8znMXzmUDfEiXVx+ryyoALMSfZukmw
	FPGGSwjjnWKTMNWJsg2Q5016DO7b/0AL07psN4DxKitcKg59xXmu8SDLdlNAPPACoDb2Xe
	KcZAt+FgGNXsRu7C8VTx7sMerukt7Zg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-oo52lPpuOsCDdbHCtpeneA-1; Wed,
 06 Mar 2024 05:42:04 -0500
X-MC-Unique: oo52lPpuOsCDdbHCtpeneA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7D471C05AF3;
	Wed,  6 Mar 2024 10:42:03 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C2C5112131D;
	Wed,  6 Mar 2024 10:41:56 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 01/13] mm/hmm: Process pud swap entry without pud_huge()
Date: Wed,  6 Mar 2024 18:41:35 +0800
Message-ID: <20240306104147.193052-2-peterx@redhat.com>
In-Reply-To: <20240306104147.193052-1-peterx@redhat.com>
References: <20240306104147.193052-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
Cc: linux-arm-kernel@lists.infradead.org, Alistair Popple <apopple@nvidia.com>, x86@kernel.org, Muchun Song <muchun.song@linux.dev>, peterx@redhat.com, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Swap pud entries do not always return true for pud_huge() for all archs.
x86 and sparc (so far) allow it, but all the rest do not accept a swap
entry to be reported as pud_huge().  So it's not safe to check swap entries
within pud_huge().  Check swap entries before pud_huge(), so it should be
always safe.

This is the only place in the kernel that (IMHO, wrongly) relies on
pud_huge() to return true on pud swap entries.  The plan is to cleanup
pXd_huge() to only report non-swap mappings for all archs.

Cc: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/hmm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 277ddcab4947..c44391a0246e 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -424,7 +424,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 	walk->action = ACTION_CONTINUE;
 
 	pud = READ_ONCE(*pudp);
-	if (pud_none(pud)) {
+	if (pud_none(pud) || !pud_present(pud)) {
 		spin_unlock(ptl);
 		return hmm_vma_walk_hole(start, end, -1, walk);
 	}
@@ -435,11 +435,6 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		unsigned long *hmm_pfns;
 		unsigned long cpu_flags;
 
-		if (!pud_present(pud)) {
-			spin_unlock(ptl);
-			return hmm_vma_walk_hole(start, end, -1, walk);
-		}
-
 		i = (addr - range->start) >> PAGE_SHIFT;
 		npages = (end - addr) >> PAGE_SHIFT;
 		hmm_pfns = &range->hmm_pfns[i];
-- 
2.44.0

