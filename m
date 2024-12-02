Return-Path: <linuxppc-dev+bounces-3665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4E09E029C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 13:58:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y23kQ0dmgz2yMk;
	Mon,  2 Dec 2024 23:58:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733144318;
	cv=none; b=mEfpJdQNWtSWvOb9KEZh5x2Dg27gypStxGxrcTF3oaeP8kVbSKEiymmZT+LVYHokE1tp2ZqVeKXoW1Dm0Y1xIK5JnyOtlTeHUwghGXBaVjMT9OucQaMA1zpNHV6btXCsgpvkLvX4Hsya7Vy9OLNYjMFqVCdU3THK43EPAh4+e1B6sOsxOeCRVrc3a6Fd816VcNCpIkaZj9L+GZrs9jEN+ASCXRNgunrFjsB+VdkscPJP0XxSR3qfWKAJrqgpKmaHZIvYA6YIbCT+ju3XtWjNiLcnXMc3XrcNaIvFms+7ABbKU61loHKGtYMNRg972DIuE13a7hJHdJ60yGLJsOl0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733144318; c=relaxed/relaxed;
	bh=KtMsmFE9pgvd9dqP+bKnl486+ttvAdvq1JTdJU/oyis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U3Qvh+qWhhfCBAZcweixBBGfdfjACz+Yq3UwRG1b2WPW8zyi+1ahTcSlQrP4uutAJeODZxb7SBXV4rP7fWxVpgTe5TApJlJa6ze2+KifN0y57ySCUlVtn3cyk/g7ZPMUOmg5bybtzsHsAD9MdyZiGlpPPVL9sdGH3uLAQ0fzP8PWTPbEeh14AtztENK3HU6gvtRoCxcW5VGtR9AifabCKe2Q6oCcSjuTXs4itT1pGjJrF2l9JEGCwJ76/Vh6fEKmR2ftpUsHWiHDblPrIgw3EeOq0frg6kKPwHh9bk8Z3FR1pdkth0U7PLiB1qTdmyvAZfTx4y+KwHiqf4wqe5Jc9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SV+HN8jX; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SV+HN8jX; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SV+HN8jX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SV+HN8jX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y23kN1JTgz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 23:58:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733144311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KtMsmFE9pgvd9dqP+bKnl486+ttvAdvq1JTdJU/oyis=;
	b=SV+HN8jXK19rx0jVzjCpguPzCQLYePiBZfyszNKVKVkDxsFE9fluzcQf2bHx5oiA191OM8
	AWTsamKEoYM8ZeE00nyXsmpn2+T4+Yww8Ck6wGpci3zKUjtAvwtr5b/IsAG0Qh8HzOppfb
	lDW5rPmiYtz9fURDV54QMhEAujzLZDg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733144311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KtMsmFE9pgvd9dqP+bKnl486+ttvAdvq1JTdJU/oyis=;
	b=SV+HN8jXK19rx0jVzjCpguPzCQLYePiBZfyszNKVKVkDxsFE9fluzcQf2bHx5oiA191OM8
	AWTsamKEoYM8ZeE00nyXsmpn2+T4+Yww8Ck6wGpci3zKUjtAvwtr5b/IsAG0Qh8HzOppfb
	lDW5rPmiYtz9fURDV54QMhEAujzLZDg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-215-W0vdIfGOP66mWzIFy1nl9w-1; Mon,
 02 Dec 2024 07:58:27 -0500
X-MC-Unique: W0vdIfGOP66mWzIFy1nl9w-1
X-Mimecast-MFC-AGG-ID: W0vdIfGOP66mWzIFy1nl9w
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 32501195FCDD;
	Mon,  2 Dec 2024 12:58:24 +0000 (UTC)
Received: from t14s.cit.tum.de (unknown [10.39.194.150])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF7E1195605A;
	Mon,  2 Dec 2024 12:58:19 +0000 (UTC)
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
Subject: [PATCH v1 1/6] mm/page_isolation: don't pass gfp flags to isolate_single_pageblock()
Date: Mon,  2 Dec 2024 13:58:07 +0100
Message-ID: <20241202125812.561028-2-david@redhat.com>
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

The flags are no longer used, we can stop passing them to
isolate_single_pageblock().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 7e04047977cf..e680d40d96de 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -286,7 +286,6 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * within a free or in-use page.
  * @boundary_pfn:		pageblock-aligned pfn that a page might cross
  * @flags:			isolation flags
- * @gfp_flags:			GFP flags used for migrating pages
  * @isolate_before:	isolate the pageblock before the boundary_pfn
  * @skip_isolation:	the flag to skip the pageblock isolation in second
  *			isolate_single_pageblock()
@@ -306,8 +305,7 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * the in-use page then splitting the free page.
  */
 static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
-			gfp_t gfp_flags, bool isolate_before, bool skip_isolation,
-			int migratetype)
+		bool isolate_before, bool skip_isolation, int migratetype)
 {
 	unsigned long start_pfn;
 	unsigned long isolate_pageblock;
@@ -489,7 +487,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	bool skip_isolation = false;
 
 	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
-	ret = isolate_single_pageblock(isolate_start, flags, gfp_flags, false,
+	ret = isolate_single_pageblock(isolate_start, flags, false,
 			skip_isolation, migratetype);
 	if (ret)
 		return ret;
@@ -498,7 +496,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		skip_isolation = true;
 
 	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
-	ret = isolate_single_pageblock(isolate_end, flags, gfp_flags, true,
+	ret = isolate_single_pageblock(isolate_end, flags, true,
 			skip_isolation, migratetype);
 	if (ret) {
 		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
-- 
2.47.1


