Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2B389541F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 14:58:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cGRH6mq0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qy8DJMsv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V87H72Wrlz3vZ6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 23:58:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cGRH6mq0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qy8DJMsv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V87D16YwHz3dWW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 23:56:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712062558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z7LWvvJr0ZLeVlbglQU3vOlFLqLTXjJjluvDd3mIpGc=;
	b=cGRH6mq00r9f6LfVObRH44dZjgDCqvJuDTJeoap7TYf0bKd+oYDqV3RIxlVS+Y442i9aih
	613/MpTtc/P4/PNXA2uFMqPSpCz8clMl8E3ZKqpp0e8o1Cehg4mYAxwUkA9TW+R/dVdBnh
	3tzMrCEUYou2LaJpCwv6KlW8/4Ae8OM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712062559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z7LWvvJr0ZLeVlbglQU3vOlFLqLTXjJjluvDd3mIpGc=;
	b=Qy8DJMsv1oj/169Nn7Z0Q1biW+RKbHp8OcovWMUYc2Of4XhhMDxMfQDpiZt5o6l55lXaiH
	cXdcFwb8SBx/J1t82dB34TPzLMVknEzKDbSwR+qkbqjYRj6Iu2ytGUSY/PHUheY7knBUYk
	RmoEefisEgI9PRLXc/AKdHKA8KkEz3A=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-410-rp9IQ797NSqx0sgO2R02KQ-1; Tue,
 02 Apr 2024 08:55:55 -0400
X-MC-Unique: rp9IQ797NSqx0sgO2R02KQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FBAA2823F33;
	Tue,  2 Apr 2024 12:55:54 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.194.247])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02C913C22;
	Tue,  2 Apr 2024 12:55:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] mm: use "GUP-fast" instead "fast GUP" in remaining comments
Date: Tue,  2 Apr 2024 14:55:16 +0200
Message-ID: <20240402125516.223131-4-david@redhat.com>
In-Reply-To: <20240402125516.223131-1-david@redhat.com>
References: <20240402125516.223131-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's fixup the remaining comments to consistently call that thing
"GUP-fast". With this change, we consistently call it "GUP-fast".

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/filemap.c    | 2 +-
 mm/khugepaged.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 387b394754fa..c668e11cd6ef 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1810,7 +1810,7 @@ EXPORT_SYMBOL(page_cache_prev_miss);
  * C. Return the page to the page allocator
  *
  * This means that any page may have its reference count temporarily
- * increased by a speculative page cache (or fast GUP) lookup as it can
+ * increased by a speculative page cache (or GUP-fast) lookup as it can
  * be allocated by another user before the RCU grace period expires.
  * Because the refcount temporarily acquired here may end up being the
  * last refcount on the page, any page allocation must be freeable by
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 38830174608f..6972fa05132e 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1169,7 +1169,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	 * huge and small TLB entries for the same virtual address to
 	 * avoid the risk of CPU bugs in that area.
 	 *
-	 * Parallel fast GUP is fine since fast GUP will back off when
+	 * Parallel GUP-fast is fine since GUP-fast will back off when
 	 * it detects PMD is changed.
 	 */
 	_pmd = pmdp_collapse_flush(vma, address, pmd);
-- 
2.44.0

