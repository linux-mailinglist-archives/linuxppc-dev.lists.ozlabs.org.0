Return-Path: <linuxppc-dev+bounces-3666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE449E029E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 13:58:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y23kQ4PKXz2yFK;
	Mon,  2 Dec 2024 23:58:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733144318;
	cv=none; b=Vd5Rx+kG0+CXwezneVEMyVCgJMg+CoQMDq+iuFb97n3EwhSphpbSXNZMRjdYp7rbFqNuwE3brRtqqo4kslibDkQs96n4RyvyRDVyZMOBRV6ke+TYV2ATw8H1L8TbHmoSjpGxKSaeO8GuWVlwQay83tD2ctEcJ7msEQTVDu+hAYRY3ooHZ9BsZzvV5shahHCP4DHckvdaIRuS3GPwIr6ziwG1PmtaBVf+5N/KWDYy2V6Z8PlektMRKuU2Cv2H2qbecmCkVcw6r2+/UVM+OPjRpAvK+iAR6dsmZjWBnTPsCbFgzAWKZ3Jv/v3NfmjdFQL4peJ8WN3AsUKJevckCZ1e/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733144318; c=relaxed/relaxed;
	bh=PXUMaNNR7Vq6MIOYC8hJbP2dJElyfdgC2J/3Ji8PmA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMpeIKeiASDcQ1YAmpr4atEzEpxUlNaH9KttOFMAtOrkTCjOl9ZmsqRCI0MFsodW9yCttTj0QZYeZpLKlntAYF4/UN7UBIPTG70lJFcYsLCkS2R14tXL+AZl4uEH2DDwDTFeI4JOoY3A4hlfO2WLW8mCOl4AXAw8qk83mOFZR33bX/87p/C+UKxPudDDROcPHTzHbcdeKoF6gWmKEw6agXY3dYvCViXCOABB2roUJfDssZJrQMgmZqpIndgFqFDVea2QLp4aEXNcKNeFVB5S+q+lkmOb4CobpXD2eBfazMy3WfhJPkx5fWbJUWSrEJ2LrG19LwG7er+98oInhrfGxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dU9OuixG; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dU9OuixG; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dU9OuixG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dU9OuixG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y23kP56dfz2yLr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 23:58:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733144314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXUMaNNR7Vq6MIOYC8hJbP2dJElyfdgC2J/3Ji8PmA0=;
	b=dU9OuixGlD079rWwehHIc7PpNzYNwsxe+Fi/kQAAjiigTJ1qp7hq5yg4xlrmurqs/5vUll
	RZf+tbkWtjGcSF4FgvZKwdXypui31dU5MvX/n7l7qUG1WjyBQUsK98ppgbb183H39XnHZ7
	smnj/PgI8o0YsrkXL742piT2rky3Y/A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733144314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXUMaNNR7Vq6MIOYC8hJbP2dJElyfdgC2J/3Ji8PmA0=;
	b=dU9OuixGlD079rWwehHIc7PpNzYNwsxe+Fi/kQAAjiigTJ1qp7hq5yg4xlrmurqs/5vUll
	RZf+tbkWtjGcSF4FgvZKwdXypui31dU5MvX/n7l7qUG1WjyBQUsK98ppgbb183H39XnHZ7
	smnj/PgI8o0YsrkXL742piT2rky3Y/A=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-628-OSMYzBRLMp-I564LqkqeBg-1; Mon,
 02 Dec 2024 07:58:32 -0500
X-MC-Unique: OSMYzBRLMp-I564LqkqeBg-1
X-Mimecast-MFC-AGG-ID: OSMYzBRLMp-I564LqkqeBg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E680A18DA5D1;
	Mon,  2 Dec 2024 12:58:29 +0000 (UTC)
Received: from t14s.cit.tum.de (unknown [10.39.194.150])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C1BDE195605A;
	Mon,  2 Dec 2024 12:58:24 +0000 (UTC)
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
Subject: [PATCH v1 2/6] mm/page_isolation: don't pass gfp flags to start_isolate_page_range()
Date: Mon,  2 Dec 2024 13:58:08 +0100
Message-ID: <20241202125812.561028-3-david@redhat.com>
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
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The parameter is unused, so let's stop passing it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-isolation.h | 2 +-
 mm/memory_hotplug.c            | 3 +--
 mm/page_alloc.c                | 2 +-
 mm/page_isolation.c            | 4 +---
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 73dc2c1841ec..898bb788243b 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -31,7 +31,7 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 				  int migratetype);
 
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags, gfp_t gfp_flags);
+			     int migratetype, int flags);
 
 void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 			     int migratetype);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index c43b4e7fb298..9b184ba064a0 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1992,8 +1992,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 	/* set above range as isolated */
 	ret = start_isolate_page_range(start_pfn, end_pfn,
 				       MIGRATE_MOVABLE,
-				       MEMORY_OFFLINE | REPORT_FAILURE,
-				       GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL);
+				       MEMORY_OFFLINE | REPORT_FAILURE);
 	if (ret) {
 		reason = "failure to isolate range";
 		goto failed_removal_pcplists_disabled;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index cc3296cf8c95..f371fbf2145b 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6451,7 +6451,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */
 
-	ret = start_isolate_page_range(start, end, migratetype, 0, gfp_mask);
+	ret = start_isolate_page_range(start, end, migratetype, 0);
 	if (ret)
 		goto done;
 
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index e680d40d96de..c608e9d72865 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -442,8 +442,6 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  *					 and PageOffline() pages.
  *			REPORT_FAILURE - report details about the failure to
  *			isolate the range
- * @gfp_flags:		GFP flags used for migrating pages that sit across the
- *			range boundaries.
  *
  * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
  * the range will never be allocated. Any free pages and pages freed in the
@@ -476,7 +474,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
  */
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags, gfp_t gfp_flags)
+			     int migratetype, int flags)
 {
 	unsigned long pfn;
 	struct page *page;
-- 
2.47.1


