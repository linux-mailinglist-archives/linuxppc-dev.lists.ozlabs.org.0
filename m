Return-Path: <linuxppc-dev+bounces-3668-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9367E9E02A2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 13:59:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y23kX23h0z2ymg;
	Mon,  2 Dec 2024 23:58:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733144324;
	cv=none; b=BKD+5TeTSbCKDvK3mVGnITUSi2F8wi3VLO3PbaJt6QVJ2okgHHgOk8P4q5SVf98VaKBkRZ2XTxoRr5ATDjIvSKrEXpEhdgHHEwlNQKpg3ze7tFjFZjv0xo8fuxgPSs8R2/ZPdQyrnYrtlFykbhr1Ebsxk8tgaMTOvQ6rBYJ5D5rslqiqvfew6zVY1SrJl8B6WsFLIVNqmXEdNJy3+Ab4XnviEt7aCTFf7l6LEO+go7P1mXWuuMWoK2H4W5BwRfULN5HAERWhPcNb/ehYAQZFoKhVk5xDkGlYrJc9SxVPPkC158phjjqKa428WQ6mMRt/si2QqAOBzrD4pSHhrRe5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733144324; c=relaxed/relaxed;
	bh=JUyVMeCRN6dieaM+cMlV+AJS5EnHgADa23V603hh+n4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MB5gHy1b18vWXxMTzqdhllpwWs4MymT2WRZpxNyW+t8zYCybtC0SD3BbkRofuLc1zjEvs4H3AaykxHO1FhU6ENL2RQFDGRV3kwLBs9Fgs6wMorH0TOx2EaKngS19Ppoc0ZBY3dtXEvcMdSclTOcQHQwjmhZl4DTF3cPgt9Ze260PudzdlcXJrMfc08MdJ09m5QGz+dX4SjXcdfk+w49ITCyBdUAiOW1eKr781YlUpa93n+0vLjCgqrTvRNsSNhYNbre1eDeQKLeqzDyaTjZelN620kvzKO31qJ+OzhdceBmtl/kT3AddV5vEjrU/Fw9FnQ1SxPfs0GMElNC3Dl8luA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hl+ROWFr; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hl+ROWFr; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hl+ROWFr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hl+ROWFr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y23kW1bdzz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 23:58:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733144320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JUyVMeCRN6dieaM+cMlV+AJS5EnHgADa23V603hh+n4=;
	b=Hl+ROWFregJ9yrRJqkC3slc457lZu6pESU4WY63oq5Jz0f43xcJTVlfr3VUL22A7RrPpgQ
	PEMk0YiKXNFd2s0uJx4npw9ZFYqJaSdokEoRwbgwOopteBxSKtmwkbsUbeGLiiGs0QvG0E
	u2tLxkIWDYfNesL8/NFHUTCt66vLKZU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733144320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JUyVMeCRN6dieaM+cMlV+AJS5EnHgADa23V603hh+n4=;
	b=Hl+ROWFregJ9yrRJqkC3slc457lZu6pESU4WY63oq5Jz0f43xcJTVlfr3VUL22A7RrPpgQ
	PEMk0YiKXNFd2s0uJx4npw9ZFYqJaSdokEoRwbgwOopteBxSKtmwkbsUbeGLiiGs0QvG0E
	u2tLxkIWDYfNesL8/NFHUTCt66vLKZU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-223-IvBmzQ_7PqKMDv2FdB_o2Q-1; Mon,
 02 Dec 2024 07:58:37 -0500
X-MC-Unique: IvBmzQ_7PqKMDv2FdB_o2Q-1
X-Mimecast-MFC-AGG-ID: IvBmzQ_7PqKMDv2FdB_o2Q
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E6DB1954229;
	Mon,  2 Dec 2024 12:58:35 +0000 (UTC)
Received: from t14s.cit.tum.de (unknown [10.39.194.150])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 82C4E1955EA7;
	Mon,  2 Dec 2024 12:58:30 +0000 (UTC)
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
Subject: [PATCH v1 3/6] mm/page_alloc: make __alloc_contig_migrate_range() static
Date: Mon,  2 Dec 2024 13:58:09 +0100
Message-ID: <20241202125812.561028-4-david@redhat.com>
In-Reply-To: <20241202125812.561028-1-david@redhat.com>
References: <20241202125812.561028-1-david@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The single user is in page_alloc.c.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h   | 4 ----
 mm/page_alloc.c | 5 ++---
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 0d17095c2dee..5656089eea7c 100644
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


