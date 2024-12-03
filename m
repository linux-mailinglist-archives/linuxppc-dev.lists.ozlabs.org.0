Return-Path: <linuxppc-dev+bounces-3697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ADC9E15F3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 09:38:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Yvk5qYQz2yMX;
	Tue,  3 Dec 2024 19:38:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733215106;
	cv=none; b=EztOII41RrEhRHGG5kzftO4pVQKxNMhwBEaY86/so257KCRv10UrcGnEkqUr0URtwTLUY6s6cBjshcJzIN1dc2QWxfXn9KsAeObibu4jSkKqdT8my3GR7FYosmDRUXExXCYLuhOdyfHnzlUoLRls13mphc1zVlQqJ9yx95d7PBjSBZdhDGP2MiykXxSfsM4zxuGiBpa44kuk9X007NCx0n5XfOQ9wnnB2ijWf1HT3YiNCoSkkUyA3ismosg4TMf0LJZ3wky118rdySomFSDL5e8PsXvSDYuB8JTq2JFRqYBAfYJ4mICfXPqymHr7d7VHr8G2StZmDRGt3ubNHDco0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733215106; c=relaxed/relaxed;
	bh=LU3Y8BABokL9EuVXZz3YTSIe3emDP78aZncO4AsTCRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScGMecGyjIWUhehD3CyG5X+LYy6VzmqBqhm1q/7xiB2HI4l9bwYum6Sz9yqxIlpOQ4ND+B2jSJbcYB7Fi+OHfk4Y671zJKqngxn97J8kHbuwYUYk3bNv/V4ZEQCtr/2QybM+Moc1P1+6xWkfQOo0VBA+IzUuwyzhYduM6hoq1tz76RSOQuTY9kqT3HE+2jGxrogvD4A8GDyIKn9TAJHHWihL7DbElmVKxSvadzqaAakDT33uFLpE1FQBIGHxWyMZh0QNNEIwPlLV2OWdWu7/HSez4tU4CQIEv55P8u0yfyz4QAQMrGjjbBI4dK/UIWH09NUZs1RzYNzj2loydUzFZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G5iOVqTe; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y6QVVcN9; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G5iOVqTe;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y6QVVcN9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2Yvj5K9Kz302c
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 19:38:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733215102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LU3Y8BABokL9EuVXZz3YTSIe3emDP78aZncO4AsTCRE=;
	b=G5iOVqTe6CqMY6xx3sp/1TVr3gpbySI6LC34m2Bsmd8E91bojesxLokdI0mLRNSzIwpAxh
	QzrnTzzF1kmM0ECXsjSZfCWkIezr46qVtUZWdRC4jWWufMc3+K7bOjSbW+k+YQ7X+neNdW
	XBX7S2+E4A4awMj9hcaXXAFQ/WB0uKk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733215103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LU3Y8BABokL9EuVXZz3YTSIe3emDP78aZncO4AsTCRE=;
	b=Y6QVVcN9F/XwtenUsppNX4Y+EsLqWotMdp8IGMWo0Wbk6Gi3YU/rktlnZUtWEgztTqHBP7
	OVOBzQeQ5s+xt5uz5TpHWh3YZymcjfsoSrIs33HVLRsFpk0217TckEqWT8CfNAPE5hy/fX
	kvZ2zNA8WkKPaKHpFJDsadLJX8cEn5g=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-KsYeB2QvPViavZaAQQOzig-1; Tue,
 03 Dec 2024 03:38:21 -0500
X-MC-Unique: KsYeB2QvPViavZaAQQOzig-1
X-Mimecast-MFC-AGG-ID: KsYeB2QvPViavZaAQQOzig
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D7EA1955DC2;
	Tue,  3 Dec 2024 08:38:19 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.22.88.109])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B1C8F30001A0;
	Tue,  3 Dec 2024 08:38:14 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v2 3/6] mm/page_alloc: make __alloc_contig_migrate_range() static
Date: Tue,  3 Dec 2024 09:37:53 +0100
Message-ID: <20241203083756.112975-4-david@redhat.com>
In-Reply-To: <20241203083756.112975-1-david@redhat.com>
References: <20241203083756.112975-1-david@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The single user is in page_alloc.c.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h   | 4 ----
 mm/page_alloc.c | 5 ++---
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 74713b44bedb..4bd3685c33ef 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -839,10 +839,6 @@ int
 isolate_migratepages_range(struct compact_control *cc,
 			   unsigned long low_pfn, unsigned long end_pfn);
 
-int __alloc_contig_migrate_range(struct compact_control *cc,
-					unsigned long start, unsigned long end,
-					int migratetype);
-
 /* Free whole pageblock and set its migration type to MIGRATE_CMA. */
 void init_cma_reserved_pageblock(struct page *page);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index f371fbf2145b..ce7589a4ec01 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6284,9 +6284,8 @@ static void alloc_contig_dump_pages(struct list_head *page_list)
  * @migratetype: using migratetype to filter the type of migration in
  *		trace_mm_alloc_contig_migrate_range_info.
  */
-int __alloc_contig_migrate_range(struct compact_control *cc,
-					unsigned long start, unsigned long end,
-					int migratetype)
+static int __alloc_contig_migrate_range(struct compact_control *cc,
+		unsigned long start, unsigned long end, int migratetype)
 {
 	/* This function is based on compact_zone() from compaction.c. */
 	unsigned int nr_reclaimed;
-- 
2.47.1


