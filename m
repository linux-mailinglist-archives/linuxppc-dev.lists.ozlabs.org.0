Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2339D87EAE4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 15:26:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h8t33Jdz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h8t33Jdz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tyxwv655dz3vb0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 01:26:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h8t33Jdz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h8t33Jdz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyxrS2ZzTz3dS8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:22:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710771733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/H22rgu+0Eg3oELZT1F8mB3L7t/pq1y95Fbs8e1Y/U=;
	b=h8t33JdzQNYI/XXXtkQogIv/XBZe0zqdlNRfCVfcYhsTs3Qv4tu2zfYAat65mwevz3rqbg
	dvNqVbSenuXhTrz6U+/hDpefijJbp8d1+bjDeWTriLR4HDahSoHY4hgx6UHT+v7BDzlsS/
	RiIEUpjqpTx0eUE4uxv7lAQwBSbmz6g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710771733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/H22rgu+0Eg3oELZT1F8mB3L7t/pq1y95Fbs8e1Y/U=;
	b=h8t33JdzQNYI/XXXtkQogIv/XBZe0zqdlNRfCVfcYhsTs3Qv4tu2zfYAat65mwevz3rqbg
	dvNqVbSenuXhTrz6U+/hDpefijJbp8d1+bjDeWTriLR4HDahSoHY4hgx6UHT+v7BDzlsS/
	RiIEUpjqpTx0eUE4uxv7lAQwBSbmz6g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-gnPigdkEN5yTi6k7RKI_9g-1; Mon, 18 Mar 2024 10:22:09 -0400
X-MC-Unique: gnPigdkEN5yTi6k7RKI_9g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F4BF800265;
	Mon, 18 Mar 2024 14:22:08 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65BA7492BD1;
	Mon, 18 Mar 2024 14:22:05 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH 5/6] mm/mm_init.c: remove unneeded calc_memmap_size()
Date: Mon, 18 Mar 2024 22:21:37 +0800
Message-ID: <20240318142138.783350-6-bhe@redhat.com>
In-Reply-To: <20240318142138.783350-1-bhe@redhat.com>
References: <20240318142138.783350-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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

Nobody calls calc_memmap_size() now.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/mm_init.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 55a2b886b7a6..9ed4b9e77c4a 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1331,26 +1331,6 @@ static void __init calculate_node_totalpages(struct pglist_data *pgdat,
 	pr_debug("On node %d totalpages: %lu\n", pgdat->node_id, realtotalpages);
 }
 
-static unsigned long __init calc_memmap_size(unsigned long spanned_pages,
-						unsigned long present_pages)
-{
-	unsigned long pages = spanned_pages;
-
-	/*
-	 * Provide a more accurate estimation if there are holes within
-	 * the zone and SPARSEMEM is in use. If there are holes within the
-	 * zone, each populated memory region may cost us one or two extra
-	 * memmap pages due to alignment because memmap pages for each
-	 * populated regions may not be naturally aligned on page boundary.
-	 * So the (present_pages >> 4) heuristic is a tradeoff for that.
-	 */
-	if (spanned_pages > present_pages + (present_pages >> 4) &&
-	    IS_ENABLED(CONFIG_SPARSEMEM))
-		pages = present_pages;
-
-	return PAGE_ALIGN(pages * sizeof(struct page)) >> PAGE_SHIFT;
-}
-
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void pgdat_init_split_queue(struct pglist_data *pgdat)
 {
-- 
2.41.0

