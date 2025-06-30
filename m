Return-Path: <linuxppc-dev+bounces-9911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9B6AEDE34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:07:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5zG1fBvz3byT;
	Mon, 30 Jun 2025 23:07:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288826;
	cv=none; b=j35CNxh/gAAL8uRUIGU+7S2vfJbd5mqSyIZpkwFZZ0mF/WUcOQi4xrTSTqSU1sx+8AyILJlieWr45kv9FYrt0uQb+fPt22u5YRcMcKoV2ybtbZ7MS3ylanjmDMxL4oEnqP/9wQmhLb3xl4oRMA48CfTv37MQDpaoRjs0l09Apxr3CTkmv28KAjr0yLXjSF6XHO312uSvSoJzPEfY60kOi03hemibIHqTtXqZAIEZZSvl6UGXGt+KRTOrmlyA9HYuaDLv/3XE8G35jUf/ZAlGPTCjZLRagpyd5kc/Mtcm6Q0JbS0aj7fVdTXYEa6ow1HrfCpJu2Bb0TrWgkuG+q7iVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288826; c=relaxed/relaxed;
	bh=rZbSryMy27xk/lWuJyIeQilPAEeTxdVw8qHGMwbITkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Z4bFmG4qnYhFnFBvKfi8Vjy7qDbZrmkXXMeh7u2DrB7bbn3Zgqv6GXUhXM4bsU9vkD39w31Di/WILqg91mXhKKBwWDCiPCZhMhzKShGqNZht9VpUaPI9yV7T6z7LOqGuFZfK6RoUqT25P4sZNykp/cN9SimbyDaNYQCmwOAQPwNaj/ejFiCvOcSrewik1y+XEYD+dLobnoUZo5gd9NznOkpmVYJiikatYPktBAFLq1+2tqAoF/D1iPhYtHTDj610oXPr5nkX3muHl3FS30J4z/0yvgu3RWZV88hNccJMWN5FuV9wejk+uv8yA4NgT9yZwc8fu4v+NzrnN05mbOPpog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xn3zWz91; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xn3zWz91; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xn3zWz91;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xn3zWz91;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5zF1xQsz3byF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:07:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rZbSryMy27xk/lWuJyIeQilPAEeTxdVw8qHGMwbITkw=;
	b=Xn3zWz91EoB2MHCmTiP8LIJ4vri/7xy8omL+YIp5lb0bZohjeac5WvL/bsoEVF694uqkWl
	8N+naYv78LI73CfifRZvwreCAbSwXfD9smQqZwelVQ6L03ek2yJsP52tl63ST0nZqid27Q
	7GfWuFsvc8a0QXrwg9ZM8A9gakwQHOQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rZbSryMy27xk/lWuJyIeQilPAEeTxdVw8qHGMwbITkw=;
	b=Xn3zWz91EoB2MHCmTiP8LIJ4vri/7xy8omL+YIp5lb0bZohjeac5WvL/bsoEVF694uqkWl
	8N+naYv78LI73CfifRZvwreCAbSwXfD9smQqZwelVQ6L03ek2yJsP52tl63ST0nZqid27Q
	7GfWuFsvc8a0QXrwg9ZM8A9gakwQHOQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-5QNisBlGONuW6B3_4wZ_ag-1; Mon, 30 Jun 2025 09:00:53 -0400
X-MC-Unique: 5QNisBlGONuW6B3_4wZ_ag-1
X-Mimecast-MFC-AGG-ID: 5QNisBlGONuW6B3_4wZ_ag_1751288452
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d290d542so28504225e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288452; x=1751893252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZbSryMy27xk/lWuJyIeQilPAEeTxdVw8qHGMwbITkw=;
        b=R2OntH2Fd1uGbsWvRRudCz/Iosmgh2tfmQzYUckudRjnZI+pd9LBNgJWxpx0swYZUK
         E1pJw5P9p+O0rGm5pUcuJTRrsi+w2tAxl4DGst/MhS6QqEDgtJbMqHrHyrlAJPLuC+ws
         Nwxfz20gN4XZCrrTwZiVwNQmCJbcmzqYBWO6UdS+9oCbPjn2CjEkR1jlTD6GP44cVNEd
         SLayt6p2sNxoOv6IgIApdVgh0l6m/NoW7V70II+77mMSc8MOR8VHQEYkaD1sRe5HUStR
         9/abQKI9GL6GrKJzCTX3NWjRcxJBkcJxrvEweUqjDYUhJAJNPTCxaPh2bf1JbGWvkw8U
         zKTw==
X-Forwarded-Encrypted: i=1; AJvYcCW2sIgZ/Nr5IO2ZXUm/gRo5ZMkWdupoTEDVCzvyzUI072XzPxNT6IIAeLrmynhEXbQi6kNBGHt53lmFvc8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJvx4PVNI3GlPyZAfrrgnCb/84iDJhy3DtYCXgsFORz5Dt7vfA
	DYmKzOyPVBfTn2tF4+1cqphK7f8lFh3ExUKf+zSQt6mk/rVKlBh/DKjbcTPVyLDwLNYjParnPhA
	HLBFAk6ReypQgkd9hkUsDtO9HDRvF7V5z3YazKv+A+yw9sPJ3DRcX5j0Fx3I6ZgUvHGY=
X-Gm-Gg: ASbGncvkh/B5Lyiqw2y8XKSI8F0L13B1els4JINQ7fle0VyYWbAotsqqOvhW2sxJpU7
	aOo0+UV9lhnhLaTL573rZOJvE6HDQzyyhliP0ARMv/Av1ktSbfNICEZ1E/gM+0lAoDdv9NGvOKt
	mhJyNas4kPIMGfBodEkB6ZZroo1XNNJsKvvz+6iwq3MoKKGpLTXg1A4EVc9mO6jsJo+w8NzilBS
	8tvkKdIqAbfq0Pg6vawxH+qEEb18G7l0pvURtnuJpbv86MoLgNvakUsGcTDPAwP5Hwqx6w6OVXZ
	ONp7/0xTCZqUeqjOwDXALqTCmn2sra4ImlKjsIn/w6siVt18B0M1MZyRyYHsIgtiHPsnHGm9O6a
	1RyGcO38=
X-Received: by 2002:adf:a143:0:b0:3a5:8565:44d1 with SMTP id ffacd0b85a97d-3a8fe8917d5mr8134390f8f.25.1751288451260;
        Mon, 30 Jun 2025 06:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcHR74Vg3fOLDK1bhOkeMb0O7J5iWXrvKqq6qclu6yGGjB1xdv/xPEmRceAckepewzfNXHQQ==
X-Received: by 2002:adf:a143:0:b0:3a5:8565:44d1 with SMTP id ffacd0b85a97d-3a8fe8917d5mr8134296f8f.25.1751288450453;
        Mon, 30 Jun 2025 06:00:50 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823b6d50sm167133055e9.30.2025.06.30.06.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:49 -0700 (PDT)
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
Subject: [PATCH v1 13/29] mm/balloon_compaction: stop using __ClearPageMovable()
Date: Mon, 30 Jun 2025 14:59:54 +0200
Message-ID: <20250630130011.330477-14-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: FhJxuxHu_Ib_qmZYMR53-NGpf1SxJnNfhXZ0ZQ-FSBc_1751288452
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We can just look at the balloon device (stored in page->private), to see
if the page is still part of the balloon.

As isolated balloon pages cannot get released (they are taken off the
balloon list while isolated), we don't have to worry about this case in
the putback and migration callback. Add a WARN_ON_ONCE for now.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h |  4 +---
 mm/balloon_compaction.c            | 11 +++++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index bfc6e50bd004b..9bce8e9f5018c 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -136,10 +136,8 @@ static inline gfp_t balloon_mapping_gfp_mask(void)
  */
 static inline void balloon_page_finalize(struct page *page)
 {
-	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
-		__ClearPageMovable(page);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
 		set_page_private(page, 0);
-	}
 	/* PageOffline is sticky until the page is freed to the buddy. */
 }
 
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index ec176bdb8a78b..e4f1a122d786b 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -206,6 +206,9 @@ static bool balloon_page_isolate(struct page *page, isolate_mode_t mode)
 	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
 	unsigned long flags;
 
+	if (!b_dev_info)
+		return false;
+
 	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 	list_del(&page->lru);
 	b_dev_info->isolated_pages++;
@@ -219,6 +222,10 @@ static void balloon_page_putback(struct page *page)
 	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
 	unsigned long flags;
 
+	/* Isolated balloon pages cannot get deflated. */
+	if (WARN_ON_ONCE(!b_dev_info))
+		return;
+
 	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 	list_add(&page->lru, &b_dev_info->pages);
 	b_dev_info->isolated_pages--;
@@ -234,6 +241,10 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
 
+	/* Isolated balloon pages cannot get deflated. */
+	if (WARN_ON_ONCE(!balloon))
+		return -EAGAIN;
+
 	return balloon->migratepage(balloon, newpage, page, mode);
 }
 
-- 
2.49.0


