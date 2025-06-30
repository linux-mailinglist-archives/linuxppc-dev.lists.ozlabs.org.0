Return-Path: <linuxppc-dev+bounces-9883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C5AEDDC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:00:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5qb39wLz2yFJ;
	Mon, 30 Jun 2025 23:00:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288427;
	cv=none; b=SeVDNig1tAVore15zpbuTiGBnQWbSBWN/3PVSIB32zJ73UKp4TLmEZmBWdL+8nc8Q/rdbeh9yziLHQ9qbSeDUwXyE04URbhn7PBPTC2MxFB+OAHrqnn9bEJ+W45fO3euhqMHviI/cN9D/Ehgv6vDNzaGhSefUhzhCUx1tjtEYyw6ShlYDsS5DPqtdyjG+M8R3o4dPCmlUpNZQlPLzMxKRYnNuq1n2IQrChposnnptUeTFl5iLD32n17DRjgTFE+33EXGJVZc/8MVzSksdve1BRnKMwkj/A2DXarRleFcK5w53rEyqRufXH5xDndxFg5e/9rF1dYdjKCbmLJuCZQniw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288427; c=relaxed/relaxed;
	bh=iLYHGg19bG0clXk7rQPjR4hvYWmeZvg7QKQ5c0snrQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=C/J0zBiGKV6WAgaZAEtQnI2bcyl+E+a1M6WrOn1GtJQjxbvgW/AAe+XQdd9Z0B+sRylr4T4LK1aA/ammgGezYI61Kpr7DZkCIM0i03uiGC4LN90kEcTbLkdrJWPS4Z/aZUq8vcmb6NGPt7B13pSqsqHTyqWVlRWJAGr6eorVS23QN5u1FGZq9Mxghp6xJeiarUe75rqHHgbfCVqZirZ1RZbAYnu508h04C4Snikgo5l3tBjLR8LxNPx8hgVv7D+b2jjfkSjzG9qwDNBAIyGQ8OgkdvxpQbqMGioLucOzYRu+2k7ouP8JL+4F74dzhO/QwuuS4LgBHsm+B41RekViCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dLhe8hoM; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dLhe8hoM; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dLhe8hoM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dLhe8hoM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5qZ3W5Pz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:00:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLYHGg19bG0clXk7rQPjR4hvYWmeZvg7QKQ5c0snrQE=;
	b=dLhe8hoM4R2naQTI+tl05dbihx0WLetxGloe9e0/LadX6vuthRIBEYxOpq/17gx38S+IH5
	3Mie5bcI23FWF/zivfIBcrvyyPH+mKAL6zjP6oMYYXj/SFjjwHT1GD0UUGIlkbTB/9CbFn
	VUPmYo8kyWw1DaloQjb0n6PGBpFB8Ow=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLYHGg19bG0clXk7rQPjR4hvYWmeZvg7QKQ5c0snrQE=;
	b=dLhe8hoM4R2naQTI+tl05dbihx0WLetxGloe9e0/LadX6vuthRIBEYxOpq/17gx38S+IH5
	3Mie5bcI23FWF/zivfIBcrvyyPH+mKAL6zjP6oMYYXj/SFjjwHT1GD0UUGIlkbTB/9CbFn
	VUPmYo8kyWw1DaloQjb0n6PGBpFB8Ow=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-rjWeCwXONXCrQI664fuIuA-1; Mon, 30 Jun 2025 09:00:19 -0400
X-MC-Unique: rjWeCwXONXCrQI664fuIuA-1
X-Mimecast-MFC-AGG-ID: rjWeCwXONXCrQI664fuIuA_1751288418
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-453a190819bso5681285e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288418; x=1751893218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLYHGg19bG0clXk7rQPjR4hvYWmeZvg7QKQ5c0snrQE=;
        b=oAhLieafdKZ3dYfsVYW1gQEsuL+sPrakRt4Shl7Tj/ecY7jSYD/akQad44zD1C0Y2r
         XzbHqOIYDvHL4u37+OEugGtEYqrsrmqq8kYhQd/oB84EzbeRrgFVhBhlJMj8fl7zg03/
         PdvU7oseJQ8qricArKPQeeybzst3nyKuiQJJbs0Q2JsXpAE00iwSEEqBnI16nR54ycXC
         B9MalnPin8kW0V2uKn7ajo5+JHMLthqQOhjyk3HGQZLbA0UbGtVosI2hCWeKdj1Ky/3V
         tAPw+b/7d1I0A8RQILrax13YheDyG+evqLzy9KXs/hSUrtNlG3Y82ncnUiDjQ2DlOadS
         gDfA==
X-Forwarded-Encrypted: i=1; AJvYcCV1bcGZumWNTQKfey93Hc4vu6Y5v46FNeJYLapF+ZHP2rZMEASlWTqPgEaxIoeFexAdbuswKvOw6jvkL0c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyxSq9gsX3SxtnLMFURO6TlO280KoG1NM97hyvg/XfOlNROrHhi
	04F933rxnZehvQpgoqO4/HuVVGMQalOyi0kzq6hRBPZAAaN3Om0oDKjkpHf65E1DN3G1Etd/vc/
	jw4J0lZlcFp9CjcbEinnaN+KxyhNLJ0K4Qw3b5BxeyY+suGWFZa9ZYFOHusGSS59qJs0=
X-Gm-Gg: ASbGncsqi4GFmYCx5ZVznSGet612WxwOHWo6spGdvGzxLqEZc4FCYGNXF9gamPwVc8/
	Uswy/8wikSnNcOBzAV/Ca6AUIr3J4x6CJFTZ2r6WyNa6uPfVfOktKHiAQRfkIVSYNlONUTA3Z9u
	6Pe2wK59VqZJY9GqtwB4fdO8tuDmCgV/wLcX1mK73Xid3TwNL7Mxt8QERN1AHm7B7n1+LxYE/Lb
	37PxFbe2Qy9Xs+MdBWa4Lzq+QQL6LyxyOaV0zPdqZYq1AIDBi4Zy+BknqXA2OsXbuJnLH1euXtK
	3QCoYhRuIV2+/IwxtmtDrLKhB6nr308ZKlOcG6t749ZkmSPFeg/vlP+AQsGdMBcUah1db5bXLGe
	y9ZeMuek=
X-Received: by 2002:a05:600c:35c9:b0:453:608:a18b with SMTP id 5b1f17b1804b1-453947d8ff2mr103853335e9.9.1751288417730;
        Mon, 30 Jun 2025 06:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb/NAxjgNou29rgmmNKmV3zZO0Mb6cYoPiX5R9Zf8/khrmrYWUc/XyFqJpcvry+rGAxO8smA==
X-Received: by 2002:a05:600c:35c9:b0:453:608:a18b with SMTP id 5b1f17b1804b1-453947d8ff2mr103852575e9.9.1751288417169;
        Mon, 30 Jun 2025 06:00:17 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e59659sm10376420f8f.77.2025.06.30.06.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:16 -0700 (PDT)
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
Subject: [PATCH v1 01/29] mm/balloon_compaction: we cannot have isolated pages in the balloon list
Date: Mon, 30 Jun 2025 14:59:42 +0200
Message-ID: <20250630130011.330477-2-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Xm2DwAIvUsPA1dy57L9rwl15rOm58bjEZ43-DZfggUs_1751288418
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The core will set PG_isolated only after mops->isolate_page() was
called. In case of the balloon, that is where we will remove it from
the balloon list. So we cannot have isolated pages in the balloon list.

Let's drop this unnecessary check.

Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/balloon_compaction.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index d3e00731e2628..fcb60233aa35d 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -94,12 +94,6 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 		if (!trylock_page(page))
 			continue;
 
-		if (IS_ENABLED(CONFIG_BALLOON_COMPACTION) &&
-		    PageIsolated(page)) {
-			/* raced with isolation */
-			unlock_page(page);
-			continue;
-		}
 		balloon_page_delete(page);
 		__count_vm_event(BALLOON_DEFLATE);
 		list_add(&page->lru, pages);
-- 
2.49.0


