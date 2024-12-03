Return-Path: <linuxppc-dev+bounces-3699-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7A89E15F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 09:38:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Yvw14GFz308m;
	Tue,  3 Dec 2024 19:38:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733215116;
	cv=none; b=UjVlHihG71gYUjEtCKclYAnj3UCcy+7OeXQZAJUerEPxJrr3MOYSj2+myzxl6FLDd9K8H2OGTUIymOv1cn1fYU7+SaWmE318+i2Ya0QezWTC5K+1XNfGyiTc6b+5FdIyqnPKfFaiqVqFGwHHudw7JI5069zuHuO3KdsrA9eR83agdxGCy6OLoDRzwoWtFkvbDnpadTb6DEiHRolxr3Ncrtjdaj+U3oziXs53yibqfZKp1qGjYY8sRWwdGDYmuOkcUYTJxclTnNhoKsqnRU36gGqSLCh/QTp7IpW/UYZpLIVHipef9tFbu2kEadjT2v91sI/Z11TgGbfDueP0g/8RQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733215116; c=relaxed/relaxed;
	bh=0fQppTuvH7gihnzA0jS0S7Nrs9VtQXSbfqTsq5GHr48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GFLRJNT0oBKP+PkIK2bOVYmNjhjwEeY8E8mWegGy5+u/2Fc3/3TU2/mDNYy5J1Nl0WYZXo6S7cDsipC+Zg/mVjfDsEPE59bYlBUblZ9S508otMRcaQ4L+LVVnP1hknXzB2oYmbN5LH7nxUdz1ohB39mIljSu08tceigXbItXK0xQsZTrL24z2zrRpOW7nv5mrBd7QEofDHcRwveeC0fXRiommAHh6MhNxBG6pCJEB61yWnzmLsarNYBzbI5ZdrQaFshjfRUdwykMLIwLDe7Kbywp9+nULwG1IpS7Cd2wFqB+b4AMVhIloJg4IFsbAw/VWr36DcPSxSktbcb2ZGhy9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QHNhI4bo; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QHNhI4bo; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QHNhI4bo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QHNhI4bo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2Yvv0Bdmz302c
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 19:38:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733215112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fQppTuvH7gihnzA0jS0S7Nrs9VtQXSbfqTsq5GHr48=;
	b=QHNhI4boIQwyN6GZD0X8tZtTZG21NiHOsYhDPqDQSoC2kdvvLok1ey9+5MlysHHfW1VzMV
	hJ1reyaelb1Zk5dZ78u0XGvFQiC+Tc+RIINLNTamf4pr9NvoWBfjGNbVtki5D1jqguZnfs
	89GL4KrDrfHQnFjCwVjVKoXofSlIDjc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733215112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fQppTuvH7gihnzA0jS0S7Nrs9VtQXSbfqTsq5GHr48=;
	b=QHNhI4boIQwyN6GZD0X8tZtTZG21NiHOsYhDPqDQSoC2kdvvLok1ey9+5MlysHHfW1VzMV
	hJ1reyaelb1Zk5dZ78u0XGvFQiC+Tc+RIINLNTamf4pr9NvoWBfjGNbVtki5D1jqguZnfs
	89GL4KrDrfHQnFjCwVjVKoXofSlIDjc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-KHX7Pf0UPF6xnbXl4YXWTA-1; Tue,
 03 Dec 2024 03:38:30 -0500
X-MC-Unique: KHX7Pf0UPF6xnbXl4YXWTA-1
X-Mimecast-MFC-AGG-ID: KHX7Pf0UPF6xnbXl4YXWTA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4588B19560BF;
	Tue,  3 Dec 2024 08:38:29 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.22.88.109])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EAC8F30000DF;
	Tue,  3 Dec 2024 08:38:24 +0000 (UTC)
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
Subject: [PATCH v2 5/6] mm/page_alloc: forward the gfp flags from alloc_contig_range() to post_alloc_hook()
Date: Tue,  3 Dec 2024 09:37:55 +0100
Message-ID: <20241203083756.112975-6-david@redhat.com>
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

In the __GFP_COMP case, we already pass the gfp_flags to
prep_new_page()->post_alloc_hook(). However, in the !__GFP_COMP case, we
essentially pass only hardcoded __GFP_MOVABLE to post_alloc_hook(),
preventing some action modifiers from being effective..

Let's pass our now properly adjusted gfp flags there as well.

This way, we can now support __GFP_ZERO for alloc_contig_*().

As a side effect, we now also support __GFP_SKIP_ZERO and__GFP_ZEROTAGS;
but we'll keep the more special stuff (KASAN, NOLOCKDEP) disabled for
now.

It's worth noting that with __GFP_ZERO, we might unnecessarily zero pages
when we have to release part of our range using free_contig_range() again.
This can be optimized in the future, if ever required; the caller we'll
be converting (powernv/memtrace) next won't trigger this.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 54594cc4f650..71d70bc0ad79 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6364,7 +6364,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 	return (ret < 0) ? ret : 0;
 }
 
-static void split_free_pages(struct list_head *list)
+static void split_free_pages(struct list_head *list, gfp_t gfp_mask)
 {
 	int order;
 
@@ -6375,7 +6375,7 @@ static void split_free_pages(struct list_head *list)
 		list_for_each_entry_safe(page, next, &list[order], lru) {
 			int i;
 
-			post_alloc_hook(page, order, __GFP_MOVABLE);
+			post_alloc_hook(page, order, gfp_mask);
 			set_page_refcounted(page);
 			if (!order)
 				continue;
@@ -6393,7 +6393,8 @@ static void split_free_pages(struct list_head *list)
 static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
 {
 	const gfp_t reclaim_mask = __GFP_IO | __GFP_FS | __GFP_RECLAIM;
-	const gfp_t action_mask = __GFP_COMP | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+	const gfp_t action_mask = __GFP_COMP | __GFP_RETRY_MAYFAIL | __GFP_NOWARN |
+				  __GFP_ZERO | __GFP_ZEROTAGS | __GFP_SKIP_ZERO;
 	const gfp_t cc_action_mask = __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
 
 	/*
@@ -6541,7 +6542,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	}
 
 	if (!(gfp_mask & __GFP_COMP)) {
-		split_free_pages(cc.freepages);
+		split_free_pages(cc.freepages, gfp_mask);
 
 		/* Free head and tail (if any) */
 		if (start != outer_start)
-- 
2.47.1


