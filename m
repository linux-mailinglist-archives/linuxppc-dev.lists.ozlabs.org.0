Return-Path: <linuxppc-dev+bounces-3707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C149E1830
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 10:48:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2bRt1SwTz2xtp;
	Tue,  3 Dec 2024 20:47:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733219274;
	cv=none; b=XxWFs6ecUb8i2wOVkzutRu9m+yEmW3uuSySZdVPyhwKG6qWRwnU2EkcqAkVhkMbOUjejOmMLyHnHs4hPMXw2AcxoHolJiDAqrJjo4EtJm/WjFrTvDl5c/m0nE7ICmRC7bpClAXod4OhvsatCQyNn451w/iW8k1OrFWlwktCacMhITrf/sj73kt+NZFBUZ6ajcv6kTRVfcnukMFbKtdoB7lt+hBnst8vPascwgRo4wTcMhgg4BHVAppR2PgsNREsW+UoTamE7PMz8U83J1SkpcZZIDoDpDZE+KbF/rjpJ7MkiICZgboxZRWn0PBN+rZC+jxOdWlTfrSJOA0WvR2q8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733219274; c=relaxed/relaxed;
	bh=cjBW/vjYP3nNfvObrA09IpRDh5cADITJHgvHLWqOgrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ZiSEhFfGT49Q9nqhVeCt1hwzuQJuKJX9R17znjovWCw4nletgV5lPNCldcVzCRmLR/2v++oIyotfELzTlVTpoqST3/dNMOG7hVkM8pPKnwEAWtrZq2VAjrIhQw2Jr7fmcARo1CRbfvZ1CJfUiqSU5Jr2MBFMCMaaQbmfKsSJsS5LKuVEbvNiPZEMZM+uNtWS2rNSHmbqrtJgQzkZf5Cfiv2HPlAkC3SuJxok/U/4RhL5eGhEwUCNZdL/QQ+KtgDKCCpfs2mrn82wQxk07Rhkk0MRW+wrKbxNOaA6GJ9/OFgKag/UNJ+Y3YJr3AJV1oj5KeVefLRACZ8tzGsilwJ5IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T/s06dyG; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T/s06dyG; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T/s06dyG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T/s06dyG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2bRs0cyqz3094
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 20:47:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjBW/vjYP3nNfvObrA09IpRDh5cADITJHgvHLWqOgrU=;
	b=T/s06dyGUVVbBXE+46kpr70YdtnxqjXnAMcrwejFsAd4LxTmci5V45hblOADG1srmgtdH8
	4wUKMR6Zlmu+MiBxch28NApUv72v7RQmj5kGL/kJnmiXXUU3Q8gvbZEjBrFu2EO42HH73J
	UFZfEqbH5fPhgJawUy40JWavVGSFI6o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjBW/vjYP3nNfvObrA09IpRDh5cADITJHgvHLWqOgrU=;
	b=T/s06dyGUVVbBXE+46kpr70YdtnxqjXnAMcrwejFsAd4LxTmci5V45hblOADG1srmgtdH8
	4wUKMR6Zlmu+MiBxch28NApUv72v7RQmj5kGL/kJnmiXXUU3Q8gvbZEjBrFu2EO42HH73J
	UFZfEqbH5fPhgJawUy40JWavVGSFI6o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-ANjdhUS3M6a4rLQ79qUQJQ-1; Tue, 03 Dec 2024 04:47:48 -0500
X-MC-Unique: ANjdhUS3M6a4rLQ79qUQJQ-1
X-Mimecast-MFC-AGG-ID: ANjdhUS3M6a4rLQ79qUQJQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385d7611ad3so2684258f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 01:47:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219267; x=1733824067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjBW/vjYP3nNfvObrA09IpRDh5cADITJHgvHLWqOgrU=;
        b=k7l0T/RsFIFuMlOvSa1BEXKu+HaKqgpx5ZXhsYRhYUWivOxsvS7KFDd8GEI5Z09RDc
         VAQgc5MrRUfFfeZsKuN659Q7N9Y9ZB4PnpM7itEsYYfBIdBivkc6JNFAIvnFQ9UXtUvV
         CuCrWADCknlX+Ci0Zht3OTvK+DzDD+Fnfki8DnWCHvC/0rx0dDbPTJdJt5UEpRqVnMrL
         yeaffahwonegc6fl9V9lk9VlmjEtgTksysrAUN0QzbTKC//lcCX1zycj4QXKj+YAaopC
         7/ncj/q/1w9pC+exCWExNBE+Hn4Zo7ZtS9TiodKP9p/0vqhhczO7LnuG3sHi7o7pRRJo
         F/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3+8cu2Ta/4LhTFXDtl8o48MqWic+sef0qpVLa2FLebVXZQ3mMR3OfvaD0zWQoIDvPg3G51OQkcwAQBuw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwfiVnjFM5fOs+jEuYTL/9bLl2ZoAEXWjDBXXqISLXs0gekPnVx
	vSTe6QcsCtDqy0OykOjv+nbfAbOumkNZvEG1kPGa99bjaFbOC/IE1RX2IcIxBKyj774f+zJYo0o
	jvTzwik+NN+9IL2DgQOkzslYpdofmykKHIPUR0bi+s+D3Oi4gUa+Gw2092xC8LfM=
X-Gm-Gg: ASbGncvqZjA5l+6msMWEA8t6UxVBxFjd3rdlCeD18d+NyXzSkfJXMaa2khEhWB4Kiw0
	WG0ac80csz+a5PNeTfaX9LbHvP/2HoRaW49L88OB8rJfpQdOuAm7uWIQo/7i9Zaa4KkiYgAZj8V
	FD68OA0oncVYBLnvLq+CfNQtFuqzkp+kl3MF1iBA8uqrimd2CKNGpni0IsXfp56qgUYhyAP57V7
	U8vLn4uU7O+ERSxPm2sMVkaROd7vLrMBq2R+VB2m3mo67nT4SrgulcMqQ0IFk9cD9eeQe3tgcnq
	OCcZ8eHwTG38UTZwuKY5gdt861PyiaNAwUQ=
X-Received: by 2002:a05:6000:70c:b0:385:efc7:932d with SMTP id ffacd0b85a97d-385fd423ae4mr1564031f8f.46.1733219267476;
        Tue, 03 Dec 2024 01:47:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaOJ9gxKaUnP3CbsR1qXN6hxrElYasKjqPVFXIuPLpn506OYh8TYc8ohv1ITpz8dyfapfkFg==
X-Received: by 2002:a05:6000:70c:b0:385:efc7:932d with SMTP id ffacd0b85a97d-385fd423ae4mr1564014f8f.46.1733219267074;
        Tue, 03 Dec 2024 01:47:47 -0800 (PST)
Received: from localhost (p200300cbc7461b00fd9ec26cc5521de7.dip0.t-ipconnect.de. [2003:cb:c746:1b00:fd9e:c26c:c552:1de7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-385e4a54b71sm9361779f8f.79.2024.12.03.01.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 01:47:45 -0800 (PST)
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
Subject: [PATCH RESEND v2 4/6] mm/page_alloc: sort out the alloc_contig_range() gfp flags mess
Date: Tue,  3 Dec 2024 10:47:30 +0100
Message-ID: <20241203094732.200195-5-david@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203094732.200195-1-david@redhat.com>
References: <20241203094732.200195-1-david@redhat.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FqvN9MvCgkfwYgKmvdmqm1bLssELFOgDrcAQL1ekkLk_1733219267
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

It's all a bit complicated for alloc_contig_range(). For example, we don't
support many flags, so let's start bailing out on unsupported
ones -- ignoring the placement hints, as we are already given the range
to allocate.

While we currently set cc.gfp_mask, in __alloc_contig_migrate_range() we
simply create yet another GFP mask whereby we ignore the reclaim flags
specify by the caller. That looks very inconsistent.

Let's clean it up, constructing the gfp flags used for
compaction/migration exactly once. Update the documentation of the
gfp_mask parameter for alloc_contig_range() and alloc_contig_pages().

Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 48 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ce7589a4ec01..54594cc4f650 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6294,7 +6294,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 	int ret = 0;
 	struct migration_target_control mtc = {
 		.nid = zone_to_nid(cc->zone),
-		.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
+		.gfp_mask = cc->gfp_mask,
 		.reason = MR_CONTIG_RANGE,
 	};
 	struct page *page;
@@ -6390,6 +6390,39 @@ static void split_free_pages(struct list_head *list)
 	}
 }
 
+static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
+{
+	const gfp_t reclaim_mask = __GFP_IO | __GFP_FS | __GFP_RECLAIM;
+	const gfp_t action_mask = __GFP_COMP | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+	const gfp_t cc_action_mask = __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+
+	/*
+	 * We are given the range to allocate; node, mobility and placement
+	 * hints are irrelevant at this point. We'll simply ignore them.
+	 */
+	gfp_mask &= ~(GFP_ZONEMASK | __GFP_RECLAIMABLE | __GFP_WRITE |
+		      __GFP_HARDWALL | __GFP_THISNODE | __GFP_MOVABLE);
+
+	/*
+	 * We only support most reclaim flags (but not NOFAIL/NORETRY), and
+	 * selected action flags.
+	 */
+	if (gfp_mask & ~(reclaim_mask | action_mask))
+		return -EINVAL;
+
+	/*
+	 * Flags to control page compaction/migration/reclaim, to free up our
+	 * page range. Migratable pages are movable, __GFP_MOVABLE is implied
+	 * for them.
+	 *
+	 * Traditionally we always had __GFP_HARDWALL|__GFP_RETRY_MAYFAIL set,
+	 * keep doing that to not degrade callers.
+	 */
+	*gfp_cc_mask = (gfp_mask & (reclaim_mask | cc_action_mask)) |
+			__GFP_HARDWALL | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL;
+	return 0;
+}
+
 /**
  * alloc_contig_range() -- tries to allocate given range of pages
  * @start:	start PFN to allocate
@@ -6398,7 +6431,9 @@ static void split_free_pages(struct list_head *list)
  *			#MIGRATE_MOVABLE or #MIGRATE_CMA).  All pageblocks
  *			in range must have the same migratetype and it must
  *			be either of the two.
- * @gfp_mask:	GFP mask to use during compaction
+ * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some
+ *		action and reclaim modifiers are supported. Reclaim modifiers
+ *		control allocation behavior during compaction/migration/reclaim.
  *
  * The PFN range does not have to be pageblock aligned. The PFN range must
  * belong to a single zone.
@@ -6424,11 +6459,14 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 		.mode = MIGRATE_SYNC,
 		.ignore_skip_hint = true,
 		.no_set_skip_hint = true,
-		.gfp_mask = current_gfp_context(gfp_mask),
 		.alloc_contig = true,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
 
+	gfp_mask = current_gfp_context(gfp_mask);
+	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
+		return -EINVAL;
+
 	/*
 	 * What we do here is we mark all pageblocks in range as
 	 * MIGRATE_ISOLATE.  Because pageblock and max order pages may
@@ -6571,7 +6609,9 @@ static bool zone_spans_last_pfn(const struct zone *zone,
 /**
  * alloc_contig_pages() -- tries to find and allocate contiguous range of pages
  * @nr_pages:	Number of contiguous pages to allocate
- * @gfp_mask:	GFP mask to limit search and used during compaction
+ * @gfp_mask:	GFP mask. Node/zone/placement hints limit the search; only some
+ *		action and reclaim modifiers are supported. Reclaim modifiers
+ *		control allocation behavior during compaction/migration/reclaim.
  * @nid:	Target node
  * @nodemask:	Mask for other possible nodes
  *
-- 
2.47.1


