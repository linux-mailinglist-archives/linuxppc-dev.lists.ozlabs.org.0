Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B6088A5B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:03:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XSzRQsE5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hw+Qp2dM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3GRD2RSMz3vwQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 02:03:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XSzRQsE5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hw+Qp2dM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3GJ05WQHz3vYW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 01:57:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ez2QF5MYw9LVg300C2Oo4I1YSujmhzgBkyBgmFJgxw=;
	b=XSzRQsE5Feh4jAVAAfl3RLb/I9opzIlvA6wSxLY1kj2IK4jUNatWIgDOX3BeorCvReHJxR
	SIkzrOchvEQ3mDMKsatk2HL57wLAgNG/1AUmpAdSbBBqd4sO/8RjAGw8yexEFITiVR4KwP
	J+J8MaaCV1DECdSZGpBOGuPU3ya0rQ4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ez2QF5MYw9LVg300C2Oo4I1YSujmhzgBkyBgmFJgxw=;
	b=hw+Qp2dMi7HmOojomJZsRKBA9DhnmnPQA+9V2E1lx7xabFlm1bzATin5QAR4IIoTT/kNYJ
	fpx4NCW2hP6Wsw5+fDwdbvZDOUOUNtxS4B8JPW8la+H8f+yqQJW68ytu7cpbxAQOYYmhBh
	iRYzzkRfpI2WJ/BVF1yjZt2rGRsR1zY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-UPy8WchcPpKKNZJqlR81mg-1; Mon, 25 Mar 2024 10:57:29 -0400
X-MC-Unique: UPy8WchcPpKKNZJqlR81mg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BBCA800267;
	Mon, 25 Mar 2024 14:57:29 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D78C43C22;
	Mon, 25 Mar 2024 14:57:25 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH v2 3/6] mm/mm_init.c: add new function calc_nr_all_pages()
Date: Mon, 25 Mar 2024 22:56:43 +0800
Message-ID: <20240325145646.1044760-4-bhe@redhat.com>
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

This is a preparation to calculate nr_kernel_pages and nr_all_pages,
both of which will be used later in alloc_large_system_hash().

nr_all_pages counts up all free but not reserved memory in memblock
allocator, including HIGHMEM memory. While nr_kernel_pages counts up
all free but not reserved low memory in memblock allocator, excluding
HIGHMEM memory.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/mm_init.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 153fb2dc666f..c57a7fc97a16 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1264,6 +1264,30 @@ static void __init reset_memoryless_node_totalpages(struct pglist_data *pgdat)
 	pr_debug("On node %d totalpages: 0\n", pgdat->node_id);
 }
 
+static void __init calc_nr_kernel_pages(void)
+{
+	unsigned long start_pfn, end_pfn;
+	phys_addr_t start_addr, end_addr;
+	u64 u;
+#ifdef CONFIG_HIGHMEM
+	unsigned long high_zone_low = arch_zone_lowest_possible_pfn[ZONE_HIGHMEM];
+#endif
+
+	for_each_free_mem_range(u, NUMA_NO_NODE, MEMBLOCK_NONE, &start_addr, &end_addr, NULL) {
+		start_pfn = PFN_UP(start_addr);
+		end_pfn   = PFN_DOWN(end_addr);
+
+		if (start_pfn < end_pfn) {
+			nr_all_pages += end_pfn - start_pfn;
+#ifdef CONFIG_HIGHMEM
+			start_pfn = clamp(start_pfn, 0, high_zone_low);
+			end_pfn = clamp(end_pfn, 0, high_zone_low);
+#endif
+			nr_kernel_pages += end_pfn - start_pfn;
+		}
+	}
+}
+
 static void __init calculate_node_totalpages(struct pglist_data *pgdat,
 						unsigned long node_start_pfn,
 						unsigned long node_end_pfn)
-- 
2.41.0

