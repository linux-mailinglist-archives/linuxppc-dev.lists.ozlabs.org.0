Return-Path: <linuxppc-dev+bounces-9894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE77AEDDEE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:02:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5rJ6rsxz3bTf;
	Mon, 30 Jun 2025 23:01:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288464;
	cv=none; b=O3Q3yRgsscjV7JoiKCY1v1xPGycJ3CQISFYIos1LvH3VoN2YqAOGN6x+xzn2afT+a/GDs7uJ96rEE1hXYxqTt3/r97ti3hiDpFM5fHWfJ4gSkoTJWPQfnyVqXcZo/5nQVirtV8HXlbkZeViJYOU3/QcoYhDXH29kkusjzbA6bKKLB4Ky38a4L4fDObmfQNw8y2kT0DJuilzRvj8Lqh6/Ej9ypAwsyZeddtrWwE2l+3u5QbTJrdu6j81hFDIGl14LpjL/L1ES3PhDa7D/UnMrSATTiZMlYVElA8T2TYPhzoN/2hCY2LK5aRREDOZZHoCVfYpB2GBHu21onEMld3LLww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288464; c=relaxed/relaxed;
	bh=JRChIqxUOgPOieQj0YeNNw03RDlWoIXMOrbpFO40kH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=TUgtlmID/o8wda/l9ngUIFFMnI0S9aoQTmCyzyVsAddRvdEcht0tA+QJDjDV6gCqSSbR7/LfxLwFg/QcC1wxso+VgREsregCuakXb8HXM7c5n/zZyFVI576RdusAYmZNOSYSm7m0kRoRhG8JxW+7kRTvSpEtpCrh7f/zsnK4z0bDXLKdgSpcapqBKK3OjCNIWEfZqwbmnpVT506HT6y2H5JvDfMnYvNuAb47EMw5uxrmSSk6cV/kXvcPa/wopFXDXAvn+awVR56FEHGXfut+UgOgk6Pc0V1FGEbWJGb7a37ER/WIV6GUUtV7+KVCzE8nf2QhGz0uURCVok3bnH9RDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q8iWVvPC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q8iWVvPC; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q8iWVvPC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q8iWVvPC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5rJ0VNFz3bNt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRChIqxUOgPOieQj0YeNNw03RDlWoIXMOrbpFO40kH0=;
	b=Q8iWVvPCijUIhiOGgsxtvSCB4U+wsJv4KrwsA/+M24qfJHOKsZuMpCwamK2SssB5skGsSG
	d7iTnCbN3rjVvfR3SHzQ/jR0r1xvm0lgK1OEJqFK9tlC5sy5gEeHLkd9xrqZeCv7kOoAet
	+ziqlc6QUeyogPknD/XO7WrbWP0bH/E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRChIqxUOgPOieQj0YeNNw03RDlWoIXMOrbpFO40kH0=;
	b=Q8iWVvPCijUIhiOGgsxtvSCB4U+wsJv4KrwsA/+M24qfJHOKsZuMpCwamK2SssB5skGsSG
	d7iTnCbN3rjVvfR3SHzQ/jR0r1xvm0lgK1OEJqFK9tlC5sy5gEeHLkd9xrqZeCv7kOoAet
	+ziqlc6QUeyogPknD/XO7WrbWP0bH/E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-DpJlmmn3Ng-HJ5KboUqAHA-1; Mon, 30 Jun 2025 09:00:56 -0400
X-MC-Unique: DpJlmmn3Ng-HJ5KboUqAHA-1
X-Mimecast-MFC-AGG-ID: DpJlmmn3Ng-HJ5KboUqAHA_1751288455
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4537f56ab74so15321095e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288455; x=1751893255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRChIqxUOgPOieQj0YeNNw03RDlWoIXMOrbpFO40kH0=;
        b=DIViIs7nbB+t+ysI0MnwVboi6Oq31jISngC86OnC80pkM+R8fBXJaPAYFMZExyUYyQ
         Lcl16Jh9vJuWuYI0MfX5gsYGWXDsZT85+cDXQyvoMOl5iIWGgNplycNUAtxDGh1WC5Vy
         INKxTSHLRgn43ADsb3M6YBDv4uQio6r9jF3+h/o2YT4su1S2pS4V5DYB3/u1GL+hIjWM
         bjcjYNZjbawhF7p6EhJUwITKmLJGkWsqe50ZQ8IdpwEgld/EZkbRzL8My04dzTGnNMKj
         D8Lf3cbSjHu89lhy36JrVb5Ql9EWgGEkY6NKnAbdblV1YDDC/p9Z5XTreV1xKWxYwJ29
         tUGA==
X-Forwarded-Encrypted: i=1; AJvYcCXuynjah6GyeKFcqNAvKaniCveo0yVQudLvRh+5do0yiokTsbfZa1L0uYxVVQTmXx47GR132IT7ROOK/Lc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjRsbU+ki0J2eF7Oc+RMeLBkQIsOSb4dooU5lCRTCk2pjVBXw4
	5PSo49WE71NCuSJloIngEWX3Fr9mMw8rGrJCPA5eSOIB7knb1BDLb8fkToxotuRyaAsq65rrm8u
	XzRoG0oIrx3VpPxlKSdiKV/9O4CaO2nCT6CGxBUZoAMKsEiskO5TWq2g6DQeeqEGepv8=
X-Gm-Gg: ASbGncuAi/MaPJmWNsq6x2lNjA3WP65vgVZYfrXq/A67oEaqt4sMcBVPrvw8JqaSykw
	26ZdrY9VXmp7XucigIxeMcKKEHUb0HNxVKCZmRFECMZIM/fd7yyWYaRPUfpPqrSBdv5x6Q+Oqq1
	883CJY94qjDxYVRHzX5/H/KBbmLVsyOiJjpiVWHueQgKRrl4emegzE8+V4f0gu/WXAKSoUk2Uq+
	yBCcRa7ErQLUl1gOxVS6edbgFk/pqFNroxdlDZX9YvSyfpbkIESemxSn0yL51oDU+xG2aCmegW/
	rGecjrQsi6FzkT9MBp9bgHSGlt5zm7mCWiimVrjROpyN+Rcc/HM/rJdgu2/Uahp92aWToCEk6ub
	LA/0RKZ8=
X-Received: by 2002:a05:600c:3b8e:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-453913c5a63mr120798975e9.14.1751288454336;
        Mon, 30 Jun 2025 06:00:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZHtsc7XNjhOjxkvKCZ2uHLxZSkMRI4G1PqHHBjrp6rzXGUbjSQmg1iO1pCKPy78A7k9Rgqw==
X-Received: by 2002:a05:600c:3b8e:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-453913c5a63mr120797265e9.14.1751288453316;
        Mon, 30 Jun 2025 06:00:53 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e59ab5sm10144896f8f.82.2025.06.30.06.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:52 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH v1 14/29] mm/migrate: remove __ClearPageMovable()
Date: Mon, 30 Jun 2025 14:59:55 +0200
Message-ID: <20250630130011.330477-15-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130011.330477-1-david@redhat.com>
References: <20250630130011.330477-1-david@redhat.com>
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
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6drv_89jIalQtSS7K4cGwHo2VDEqTrtkhJzB2QtIPKE_1751288455
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Unused, let's remove it.

The Chinese docs in Documentation/translations/zh_CN/mm/page_migration.rst
still mention it, but that whole docs is destined to get outdated and
updated by somebody that actually speaks that language.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  8 ++------
 mm/compaction.c         | 11 -----------
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c99a00d4ca27d..6eeda8eb1e0d8 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -35,8 +35,8 @@ struct migration_target_control;
  * @src page.  The driver should copy the contents of the
  * @src page to the @dst page and set up the fields of @dst page.
  * Both pages are locked.
- * If page migration is successful, the driver should call
- * __ClearPageMovable(@src) and return MIGRATEPAGE_SUCCESS.
+ * If page migration is successful, the driver should
+ * return MIGRATEPAGE_SUCCESS.
  * If the driver cannot migrate the page at the moment, it can return
  * -EAGAIN.  The VM interprets this as a temporary migration failure and
  * will retry it later.  Any other error value is a permanent migration
@@ -106,16 +106,12 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 #ifdef CONFIG_COMPACTION
 bool PageMovable(struct page *page);
 void __SetPageMovable(struct page *page, const struct movable_operations *ops);
-void __ClearPageMovable(struct page *page);
 #else
 static inline bool PageMovable(struct page *page) { return false; }
 static inline void __SetPageMovable(struct page *page,
 		const struct movable_operations *ops)
 {
 }
-static inline void __ClearPageMovable(struct page *page)
-{
-}
 #endif
 
 static inline
diff --git a/mm/compaction.c b/mm/compaction.c
index 17455c5a4be05..889ec696ba96a 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -137,17 +137,6 @@ void __SetPageMovable(struct page *page, const struct movable_operations *mops)
 }
 EXPORT_SYMBOL(__SetPageMovable);
 
-void __ClearPageMovable(struct page *page)
-{
-	VM_BUG_ON_PAGE(!PageMovable(page), page);
-	/*
-	 * This page still has the type of a movable page, but it's
-	 * actually not movable any more.
-	 */
-	page->mapping = (void *)PAGE_MAPPING_MOVABLE;
-}
-EXPORT_SYMBOL(__ClearPageMovable);
-
 /* Do not skip compaction more than 64 times */
 #define COMPACT_MAX_DEFER_SHIFT 6
 
-- 
2.49.0


