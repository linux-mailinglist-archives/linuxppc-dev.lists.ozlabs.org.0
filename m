Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DFF87EADD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 15:24:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NemGzvaQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NemGzvaQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TyxvB4z8lz3vbf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 01:24:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NemGzvaQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NemGzvaQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyxrH1cqHz3bp7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:22:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710771724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ez2QF5MYw9LVg300C2Oo4I1YSujmhzgBkyBgmFJgxw=;
	b=NemGzvaQz6x+9Tvmazy9vlvUIO21sLbjiOkcA5S13eU4fAPFVkHhSew531dQILq15ZDgvN
	yUM1bJpsBmEghjwOoxm7lAup5MIf+J1T3m8CPfs/LUed8h1MxzyB6j2CuelNA88+L7zdcl
	QwVAplpjhg/l1c9IZ6a9reVhfZ2hZqc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710771724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ez2QF5MYw9LVg300C2Oo4I1YSujmhzgBkyBgmFJgxw=;
	b=NemGzvaQz6x+9Tvmazy9vlvUIO21sLbjiOkcA5S13eU4fAPFVkHhSew531dQILq15ZDgvN
	yUM1bJpsBmEghjwOoxm7lAup5MIf+J1T3m8CPfs/LUed8h1MxzyB6j2CuelNA88+L7zdcl
	QwVAplpjhg/l1c9IZ6a9reVhfZ2hZqc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-Ksx67UdVPXy4bpjfV4ra_w-1; Mon, 18 Mar 2024 10:22:00 -0400
X-MC-Unique: Ksx67UdVPXy4bpjfV4ra_w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A2F4800269;
	Mon, 18 Mar 2024 14:22:00 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 510F6492BD4;
	Mon, 18 Mar 2024 14:21:57 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH 3/6] mm/mm_init.c: add new function calc_nr_kernel_pages()
Date: Mon, 18 Mar 2024 22:21:35 +0800
Message-ID: <20240318142138.783350-4-bhe@redhat.com>
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

