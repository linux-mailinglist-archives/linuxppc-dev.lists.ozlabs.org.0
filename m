Return-Path: <linuxppc-dev+bounces-9884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78666AEDDCB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:00:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5qh4s9Zz307q;
	Mon, 30 Jun 2025 23:00:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288432;
	cv=none; b=alrcOvqhJFJ3VtksVEVWfpJLXTUXBnyfjckstJArJBmk0P6xivl+QCTTGnp5CTD+jCBKjw3SaIawqMTuY2w3qiaX4Fgw7v71JYbzJnuuICKOeEV9RnSaD1F9H47TfzAGHq6DO9FRI0eHT/y9/4D9uvtznlI4UK21z5dM1kerGsiAQVUwxpZi8Egc8kp9YT03gRfaQ7nZ233/E80A3SiKwm8Zn5r4QJ2pSfTGM/ZVln9GYgDZ6x6rl58Tdn9cfR3ikMMqnCEM17Bnns1MOjxF2Xm4v5Mc1PsJF2j2FSEZUwikx2CoV38UIl/FYoAvlx+qXrftLqcHo1g2VwzyvIGEug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288432; c=relaxed/relaxed;
	bh=p0pHDGHZALCRdBpqrQ9hLtuju8zJ3QwGWTV045A4FRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=CVcX/1CYf9x2tjyet6sQ1ugkessnO7sdBMpfmtvdSi6eM0FZLoG9MFJhDuZRGWO/WEVcs3O/82qAgmaTYek6/d2gs5VtBOEdMj18m2YkN+YAWTFXIU0BpTK9UHtGR05X603TuaH6f9AMvHhakwz3oIrUzqIpNtzXiW/HHoFtdviGm8RKnOwr0CXW0RgUDXCf8+BrvkVde7gR8GiLbqpKzmp5dynwCkVprNz+o76vEs7CbS5QhuHpUPJFhsvnUkMilIClA7rUgJGl+zp9/YSostYwwkK5XQSa6B3XR5uax25wHk8Itt9NMoR6vtmW3liTQwXdXDaa+yvGAi0IHEezYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CrbGMhMh; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CrbGMhMh; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CrbGMhMh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CrbGMhMh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5qg5vlRz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:00:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p0pHDGHZALCRdBpqrQ9hLtuju8zJ3QwGWTV045A4FRg=;
	b=CrbGMhMhA3tZl8XwuxJZ2+aYNnwPvrS2hO7w1XKzz6rq79Wb484fPwCg6IuylLE2LwNpYs
	RyBT/JyR6MZqBGcXekoBWb5RDUZQ+EcPT72FZlOQTmscUoEymaGN46Pzkyaz0IrjLtl0ON
	jfq8g6QWbQNPT2vhNPUqvM3omxWG7BM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p0pHDGHZALCRdBpqrQ9hLtuju8zJ3QwGWTV045A4FRg=;
	b=CrbGMhMhA3tZl8XwuxJZ2+aYNnwPvrS2hO7w1XKzz6rq79Wb484fPwCg6IuylLE2LwNpYs
	RyBT/JyR6MZqBGcXekoBWb5RDUZQ+EcPT72FZlOQTmscUoEymaGN46Pzkyaz0IrjLtl0ON
	jfq8g6QWbQNPT2vhNPUqvM3omxWG7BM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-Fxa6GhJfOv-XgTEPk69Dig-1; Mon, 30 Jun 2025 09:00:27 -0400
X-MC-Unique: Fxa6GhJfOv-XgTEPk69Dig-1
X-Mimecast-MFC-AGG-ID: Fxa6GhJfOv-XgTEPk69Dig_1751288426
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a6d90929d6so769600f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288426; x=1751893226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0pHDGHZALCRdBpqrQ9hLtuju8zJ3QwGWTV045A4FRg=;
        b=v2bhSSiwPpWHYQm6U6N0ZaacGMnyoM8A3aSD57UinVpG4SB/iQ7ANAMRHnLM0d6WDG
         bgLb7Cpeqn6PxifJi6RhnCv4kvhHYJ5QNwR4UTsUQF2Qdnv/iIIW4e88hEaY45N6Zgux
         6LlJVklSCGuKjHxWdYrOV00WKFTelH74UqUBScThTxl59QuUO7jbOyvPcDqJFkakGfRF
         cx1VswMq2+7HY5+PYKFGg8xRdw3W8uR/ZAS6ZiqaOAbYvfQBffPKf+FUP2GH+uUFf/Hl
         xwWWp60SXPRhtLsbZAJsxlH3VoR5+s7c2L+aT0dp+7nhy0h308ej4Gauqe1sQdVj03Em
         jErA==
X-Forwarded-Encrypted: i=1; AJvYcCXtawHvD5zGM06++WY4bSCL6bXFwJWmHZfNlvfH4NdhT55rcas037cHBTEc92eLRvde+jIXKHXmYHRpj8c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzXH+avy6ODAVZhInCRIszPEi3+Got4V/7y1/IblyMnHY9rVa1k
	1gduBwShIOs9uLBIyE7NvftEReTE5JIbiNcbBC676ggropPnKcAlkvW9M9vZMxobWCBlkT5z8c+
	P2wQA4vTKJRtTaxTAXzDUBwMGKxRibvkOSv8Mg/wE6n9VWp2E6E9TDMtUeqz55a1FN+k=
X-Gm-Gg: ASbGncv674lOgomE1G9gWhuAl1DtnPrBNa3MwXJ2U/j/yoWtcun5lES2I2dHqqKsZEJ
	DGHfNxt7BVxvySgHzE5IaMa6HnOM6y/Zzzh4ERRQCi8vE3x507KAtF1E0ATCic2QOMnGB6rJCpp
	8GS3zVph0LGpjMgQsmMxhySJwZlXXqPns3e7vy5iTjP7EOKmE56/cLIBCkfXQUxRln8oFO6bS5Q
	bmN8XAtPaexqah+/KT7T9vgMlt+jOPblt5mfAjgXCvTbP4rNUj0+75FRsWE3QTDvzP1jPDyLcxz
	O0lvN6K3mKK8nO/4EpNZos0yT3Ruj3IYvZnZmYmD4CvrCNqiQDq/Wy4BwyVWDvF/eGqMDbsHlut
	adJQZayk=
X-Received: by 2002:a5d:64e1:0:b0:3a6:d579:ec21 with SMTP id ffacd0b85a97d-3a8f577fd35mr10177741f8f.12.1751288426250;
        Mon, 30 Jun 2025 06:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwLhkxvJD2R8UoqRuajbGlVqpEQolWc/VBvsc1ZeiLSR5gPzKHixn/vDhyoe1JVlLg6TEErg==
X-Received: by 2002:a5d:64e1:0:b0:3a6:d579:ec21 with SMTP id ffacd0b85a97d-3a8f577fd35mr10177695f8f.12.1751288425713;
        Mon, 30 Jun 2025 06:00:25 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7e76e1sm10574554f8f.16.2025.06.30.06.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:25 -0700 (PDT)
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
Subject: [PATCH v1 04/29] mm/page_alloc: let page freeing clear any set page type
Date: Mon, 30 Jun 2025 14:59:45 +0200
Message-ID: <20250630130011.330477-5-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: k4y60NCkPkBnVkbmcW9n_iPcz6Uaqg0D7gyodskVG4I_1751288426
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently, any user of page types must clear that type before freeing
a page back to the buddy, otherwise we'll run into mapcount related
sanity checks (because the page type currently overlays the page
mapcount).

Let's allow for not clearing the page type by page type users by letting
the buddy handle it instead.

We'll focus on having a page type set on the first page of a larger
allocation only.

With this change, we can reliably identify typed folios even though
they might be in the process of getting freed, which will come in handy
in migration code (at least in the transition phase).

In the future we might want to warn on some page types. Instead of
having an "allow list", let's rather wait until we know about once that
should go on such a "disallow list".

Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 858bc17653af9..44e56d31cfeb1 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1380,6 +1380,9 @@ __always_inline bool free_pages_prepare(struct page *page,
 			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
 		page->mapping = NULL;
 	}
+	if (unlikely(page_has_type(page)))
+		page->page_type = UINT_MAX;
+
 	if (is_check_pages_enabled()) {
 		if (free_page_is_bad(page))
 			bad++;
-- 
2.49.0


