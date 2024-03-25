Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F60A88A5AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:03:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UAARgC5L;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UAARgC5L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3GQN0np7z3dWc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 02:03:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UAARgC5L;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UAARgC5L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3GHx0TlNz3vhj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 01:57:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wvoO9gMxnE/h+72mDdUoxwDkamBxujn5JY0mQMrkk8=;
	b=UAARgC5Lq9+648tqMb7yuqXxLB4mJ30U1QL8wqpXUssmUz6it4xMVXfK6dAoMR6JOJAK2A
	66BBS0TDcjNT8Hd2KScmB1trlAF1zE6Bo38iff7G54s5dZOtP325bduj4+mLs7G/p1+UeP
	kKvwzBUCF5hqWJZLS9nwaAU/0OoO0IQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wvoO9gMxnE/h+72mDdUoxwDkamBxujn5JY0mQMrkk8=;
	b=UAARgC5Lq9+648tqMb7yuqXxLB4mJ30U1QL8wqpXUssmUz6it4xMVXfK6dAoMR6JOJAK2A
	66BBS0TDcjNT8Hd2KScmB1trlAF1zE6Bo38iff7G54s5dZOtP325bduj4+mLs7G/p1+UeP
	kKvwzBUCF5hqWJZLS9nwaAU/0OoO0IQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-ioNvZiFePKuhU6aVg6cs7g-1; Mon, 25 Mar 2024 10:57:25 -0400
X-MC-Unique: ioNvZiFePKuhU6aVg6cs7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38444185A783;
	Mon, 25 Mar 2024 14:57:25 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E4133C22;
	Mon, 25 Mar 2024 14:57:20 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH v2 2/6] mm/mm_init.c: remove the useless dma_reserve
Date: Mon, 25 Mar 2024 22:56:42 +0800
Message-ID: <20240325145646.1044760-3-bhe@redhat.com>
In-Reply-To: <20240325145646.1044760-1-bhe@redhat.com>
References: <20240325145646.1044760-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
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
Cc: Baoquan He <bhe@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now nobody calls set_dma_reserve() to set value for dma_reserve, remove
set_dma_reserve(), global variable dma_reserve and the codes using it.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 include/linux/mm.h |  1 -
 mm/mm_init.c       | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0436b919f1c7..ad19350e1538 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3210,7 +3210,6 @@ static inline int early_pfn_to_nid(unsigned long pfn)
 extern int __meminit early_pfn_to_nid(unsigned long pfn);
 #endif
 
-extern void set_dma_reserve(unsigned long new_dma_reserve);
 extern void mem_init(void);
 extern void __init mmap_init(void);
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 549e76af8f82..153fb2dc666f 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -226,7 +226,6 @@ static unsigned long required_movablecore_percent __initdata;
 
 static unsigned long nr_kernel_pages __initdata;
 static unsigned long nr_all_pages __initdata;
-static unsigned long dma_reserve __initdata;
 
 static bool deferred_struct_pages __meminitdata;
 
@@ -1583,12 +1582,6 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
 					zone_names[j], memmap_pages, freesize);
 		}
 
-		/* Account for reserved pages */
-		if (j == 0 && freesize > dma_reserve) {
-			freesize -= dma_reserve;
-			pr_debug("  %s zone: %lu pages reserved\n", zone_names[0], dma_reserve);
-		}
-
 		if (!is_highmem_idx(j))
 			nr_kernel_pages += freesize;
 		/* Charge for highmem memmap if there are enough kernel pages */
@@ -2547,22 +2540,6 @@ void *__init alloc_large_system_hash(const char *tablename,
 	return table;
 }
 
-/**
- * set_dma_reserve - set the specified number of pages reserved in the first zone
- * @new_dma_reserve: The number of pages to mark reserved
- *
- * The per-cpu batchsize and zone watermarks are determined by managed_pages.
- * In the DMA zone, a significant percentage may be consumed by kernel image
- * and other unfreeable allocations which can skew the watermarks badly. This
- * function may optionally be used to account for unfreeable pages in the
- * first zone (e.g., ZONE_DMA). The effect will be lower watermarks and
- * smaller per-cpu batchsize.
- */
-void __init set_dma_reserve(unsigned long new_dma_reserve)
-{
-	dma_reserve = new_dma_reserve;
-}
-
 void __init memblock_free_pages(struct page *page, unsigned long pfn,
 							unsigned int order)
 {
-- 
2.41.0

