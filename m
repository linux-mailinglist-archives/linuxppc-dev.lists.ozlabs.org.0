Return-Path: <linuxppc-dev+bounces-9470-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B953ADF450
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:42:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcq1ZmXz3bnm;
	Thu, 19 Jun 2025 03:40:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268459;
	cv=none; b=ALwfOY9tNTV09+H03Gi49rSScqbNG7kYkxj7ETbK+gaHNlAdcXwdO1kg8SzK5eSjxEuQ916Fm40RM/H8RRyuzb4LS+OayrXNfkePrXCH0OYyYIAX3lyfDlx+WMMyPSvYTMH70Jz9UlKqInRr3dfvAeaJQADklgih11zzpnjX6cslJOByfJYz0AGwUFNrkH/LPpb6rboZQYe5yckj/SkTTpx+uNVlvlYMVJN1yuUr2oRQ9Cd1od/mWQj34+JpvW3eSTKFedLqH+e3Lr5518nGF/2z54ImdIh7c12WlTIfTbtzTK7dwoxHtQiPrw8HCnu3HuBXjyPzPOxc0L1vsJkzAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268459; c=relaxed/relaxed;
	bh=l6C8lbjEXu6LV6W+fOxtWyWYf418kuz/nIG8TPoHlVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=X9cbt8/JZyXLawWLk63gHa1p1OxEcDc43mU6ys5Quy/53O5a4v+zugrM0M41ASZWFeURyg5ATZ51KpcOaTeU4OpI2NwzYcTIh2TiP4znNIwU8Jjoum+cF82BxLWgGgWfsfNQ6FpaEsFSnnSp2vMYn6f7zPKAVJ67KiHYtLa6t2F7UNf0uCRbYCZV3wuYskaKkeGTyxuwNjZNT7zkv6Xhf3F30BXfih52wbvCw7QznMcF/S61vjb9IUtCVxeVF/AE3n3Lm99rS21XzoL+jRuGHrKwaIrcvivvLLnnsl2JgVQDl3Qmi+yBCrmEGZGb3ehbBmQznZ2u+ewKGBD0eAA3hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IACgsbmi; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GsuQ0WDe; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IACgsbmi;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GsuQ0WDe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcp2qnzz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l6C8lbjEXu6LV6W+fOxtWyWYf418kuz/nIG8TPoHlVI=;
	b=IACgsbmiSaQyXiqw3g6dfVpuOnupat2rUCUh2J8930E3tC8oJk7Tn55AqEnNP108ex/Fts
	X6VnTifqlf1dohS+f4yYdhhN1/fa14giqJJmQjiajRYxP7sWsZRcw/UrbOZtp1ZGkoI3MM
	qQJ/DYWB7ND06XN4T24jB2gt4qlwSr8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l6C8lbjEXu6LV6W+fOxtWyWYf418kuz/nIG8TPoHlVI=;
	b=GsuQ0WDetmv8Kryxp/8tReUwTaYmDd3xRwgc5Gau/fmyOZcJI6RlwJp7qIS49OjcQjkAVt
	jM0OkXEZ7vqhPrO2V+WCiFloLeRg4HlvkmVPYgUCHWV9AMadj/mVcMtuug2BcwuH15M4LT
	7SLdGVvqwGvpK3ZtW0H1bjD+txoOBuk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-JtiOrZ80OuOQsrn6Nv13vg-1; Wed, 18 Jun 2025 13:40:53 -0400
X-MC-Unique: JtiOrZ80OuOQsrn6Nv13vg-1
X-Mimecast-MFC-AGG-ID: JtiOrZ80OuOQsrn6Nv13vg_1750268452
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a52cb5684dso4142301f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268452; x=1750873252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6C8lbjEXu6LV6W+fOxtWyWYf418kuz/nIG8TPoHlVI=;
        b=kHLeTEz4xtq7Jb06AmFJAHrPCSqlccLqLhf5feQCwNdXUs3Unqq8O0mV+NhokKZOO+
         8hPMSph6DF66GetZnJSY0D0Sas5f4cB0jpXMz5p5vKaTpvZVbJtZxYaXdn2XSDAH/Jur
         hmHFV7bFohDFvcP67Qx1AfUAp1k0PN2MUZW55tqizAHUkot8XH8eYolo43B3vLflAcO2
         oSvrlcO1zj296EEKWI1h3v9UrCNZskP/Imzhf8IDATYZzXZScOmhFqJs3Rvdfti8IkUI
         uJ7QGsrJ6oathLRtDScS5DqYu3xZWXk60djCUj5CA6O4pTlsH+ht9diXxFzb0JMbR5g6
         /fcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/LmBWT2Jqw02k7nDaa3Z5yGlvoOt+uCsaIyraunpP8/n+BWmkf24rxHdP5gfaYBVfkzwK1hSl4zXwHwY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxga6wPyGg1zdx1/8z4iI/0STpy6woWb4vZEscFiw21vbx7538Q
	t4NZ4b9rUaQul68EFVhjtx7QN2HTLBnp5i3geBbioKwS+42jy4R7xHRGWGLMeiTSlh7KFr8ZROp
	BzmF6udyr46Na5LkMBpE6y0v+QGqB9PmOu3KBhiLJOT/75JVNDZETKDbGy5OjG7zpbs0=
X-Gm-Gg: ASbGncvCKaGKI85IHG9xhrzWyMY40ZCi8mYw0HL1oqF0JaE6EbMz0iKlxx6QMi7f7qe
	Zo+bIJZO18Qph0JeKNzWb+3+AeXjwWVAodZ86bdUgH/5SHAzjT62m7Rc3lBvslRLYGP0MR7kqSM
	Df9WvMOBycj0uNNi3gVXtWX9ydBQ26zNEEmYgnIQcenRyP5eq2zPwVnQcUoahxS6qKSb67NBF3q
	SEnPICea7mR7LxhMVtjr5o8aWGUHQOe1D3JEKZvuXQksJFFTE5PEIa8A72GlntVLSEFTOuXbJxH
	DDY7sQT+gC/fLTvUKpMlk5LX4hXvyQcSVIY4D4w8n/lqGzmBezImvImzkFjOJFSp2Gd6hIXUlmu
	3xsVAFg==
X-Received: by 2002:a5d:64ce:0:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a572e8bfb1mr13954297f8f.44.1750268452293;
        Wed, 18 Jun 2025 10:40:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4X4ziwIkhys2144e75SHEIZN/Ibpbo9aRHgWcvkByvBS3juQ4aklJtEd9sXicogG+MbEwPQ==
X-Received: by 2002:a5d:64ce:0:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a572e8bfb1mr13954276f8f.44.1750268451787;
        Wed, 18 Jun 2025 10:40:51 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b089c2sm17710418f8f.59.2025.06.18.10.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:51 -0700 (PDT)
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
Subject: [PATCH RFC 13/29] mm/balloon_compaction: stop using __ClearPageMovable()
Date: Wed, 18 Jun 2025 19:39:56 +0200
Message-ID: <20250618174014.1168640-14-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618174014.1168640-1-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: LWioLDyv7gyN6LMEbmQdtIwJ5nV4HyzM7rFzOY4VQjI_1750268452
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We can just look at the balloon device (stored in page->private), to see
of the page is still part of the balloon.

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


