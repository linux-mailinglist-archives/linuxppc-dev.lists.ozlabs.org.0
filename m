Return-Path: <linuxppc-dev+bounces-10094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F6FAF9008
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCM0kSzz3bNt;
	Fri,  4 Jul 2025 20:25:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624751;
	cv=none; b=Q/vUy/G8ODM5cR6ZrQpNzd0vQtU4qQdSxcyH7AxL8hwzQISBHCmJuSqDINJbDfu4K+nntoT5KdhxRaxHUD5fXOBxZRh45kXZ6VJvfkTA2YxjSGX5usbrULnjBfHqZYE90OIwnngJKwL5wm3Xk9RjTq2wGd9b1KzhpD5OBhRaJz6xt+/ksXiHkAL0JlKb6nb1qRkrk04YRU3EnOFZA/g8rgCgCrGoTOf61R8C6W3RwjNwFac9Ca4F3sJsQue+IgXl2mjNsIV4blcKxYwxkdrOKkUvNZjmSdxuAPw6cJoXm3+Fb2JG8JxxKZmWbklUk6AiU6IS15sxRcicfoVO2anE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624751; c=relaxed/relaxed;
	bh=ONGts7/hBJv/SI9LHH6S4PEHXTtUzsYSWsi4Xmz5Gpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=DnRvdOAKdCCH6odsuM8190+JZK+ycjvh+xfLzgImJJU4q3jwJcK1Hpx4+c0NR8chocKeOEJ6TqeBBt/hw0WrFcduTq5Gl9h3pJwRW6k4lb+jv4VtCwpR9+GzTzl1FRTqdI+1Z2nUoPHfPxWyH05ZbWyIp/B6S89KPjhbuxpEkihnpYG86g8U84LRrHW+QRCefMlxhPkE7Qbj3cWOSRJXE2HGScx7tE9VOnak8a8b6BPE5WGkTZ1jRhYWqEDXQmyijjbXNNZp0D9TJ0YfAc9Kq1uHCaV7P5sTErP+9ZbF7IPmP7gmm90JchpIKZ8dUWikD7fdXZzSzi42QBCXQjOC9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ImGIfB9q; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZuLuTfk/; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ImGIfB9q;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZuLuTfk/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCL2sw2z30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:25:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONGts7/hBJv/SI9LHH6S4PEHXTtUzsYSWsi4Xmz5Gpg=;
	b=ImGIfB9qQtNHlsYyTKX6eCgUVdEHLg2T7WtH3H1hXH6E1aJXpotT/6WlKTDZpM55uJubu+
	YoKVIpG6l/qJgrpxSE7XJ/iyF91u0vp3pxTORN1w7rCcGuU1P1e3f9NjQZmrXV4JGqzwEJ
	Vl84VLHNv/QI6Zkp6S+ej6Sd5YCzYtc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONGts7/hBJv/SI9LHH6S4PEHXTtUzsYSWsi4Xmz5Gpg=;
	b=ZuLuTfk/LmlWWsElpn6g+uR00pOVuk9MiJ2LH/n3UQkuxtf596P3GY4QXBsvZ5/RFw0ijA
	BUEmCNH/2bRQuG9jyAZ2IgofjK8i8F8dOyY60B7pyZz+sI+pcUS+dPtY2bPcoPwosUeWV5
	RkE0IW7+gDm7jmQC38+5REr1BD1SAiA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-v7Bawfy8MyWr2WiBkY97Rg-1; Fri, 04 Jul 2025 06:25:46 -0400
X-MC-Unique: v7Bawfy8MyWr2WiBkY97Rg-1
X-Mimecast-MFC-AGG-ID: v7Bawfy8MyWr2WiBkY97Rg_1751624745
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a5780e8137so973158f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624745; x=1752229545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONGts7/hBJv/SI9LHH6S4PEHXTtUzsYSWsi4Xmz5Gpg=;
        b=v1EOKbqxMMbmWCxQak+kudALJHAlwWfgaA3rYKO+hTalC00TcvbFZV1GeH+Oyjm4rO
         UKPP1r4bMtH0mBDcNQGmwU3SPUfJfD6sXhU8MbnriEtt7gxDkWfOzmH8RXH9XB7Fx01u
         jHcHHoHY24YfGfDr2ZwxqpLKJm0w4Gz5HZeEZRwsL3gn9llRoUQaWd1owgSZQHKvV7UG
         tunbHKzidPduTVzsiNY7PunHJC102WQLouxsCi1RRKDTcSwSLwT6wQruREE/Oo2ygLSr
         6mmjRH6wz9nkm3s/AmRIiO6piZw7iIzkXPSSg7rjBFjHXj20tKQax0355seuikgAEPHY
         gAeA==
X-Forwarded-Encrypted: i=1; AJvYcCVPeGG3GLQiv8VRitmtZFBiS1B6wJrJwyKf/12593GI8crKVyoij4GCjN4dpL054bTYDMrie7ZII2u1eBE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHvPteyuQl7teqhIcOvHINRdAEw955Zz9mg4vmn2DSgV8xTo9V
	MGQ2Nk/POkbmucN0ldCnmy4CM7dXwtCITmmMr35An6CtlhmtpXCNVtbbfkkgHdRqfRsPh0Xbyi3
	bHmFtQpP4rBHldxcrcYU+xoG0ecKmM68vjEehLtzYjMe1SRxpLXk/b1A2pDIFoMQES7k=
X-Gm-Gg: ASbGncuS+bJDdyqJufw6Ev0GR4Q2CI8+eTkaUJYXv+zk0t0R1wIXK+HdQ8kgWff24tf
	WUqwQoh3F+zRZPgRVR7aB6cPEqPgWtwx+eL1L47FHGv/2MLfZDvW2PInpJ/am50Nn2BfomZJuOq
	m4hOUGNuNcwwV13VTeVXtjMCo6j9R2hPOzdtvUWZSz/KQsW349nKQ6IWZtxSaTEM4o3Tsz0PBpE
	/OCK2u8sVbGTty4QtKpBy/eIxREutmI0nDNRqK6UA9ljqCZoPeJm9WKmm7ZbU4nPIOzgvjYhcvp
	LoTmSpJCNe2+PmIh9xBs6/MJZeazuYdF8Pb6akizidSveRoz7JRasD/ESGyRDfd9xQl2TuMabTQ
	cUjtZ+w==
X-Received: by 2002:a5d:5846:0:b0:3a5:7991:fd3 with SMTP id ffacd0b85a97d-3b495b94916mr2217857f8f.11.1751624745018;
        Fri, 04 Jul 2025 03:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECnxpY/j05u6/I6xCq4leYolGKDWTZ8k8uJQRmE44kdkts1pPfCbxB96EsSkR3GWRBi0mgpw==
X-Received: by 2002:a5d:5846:0:b0:3a5:7991:fd3 with SMTP id ffacd0b85a97d-3b495b94916mr2217787f8f.11.1751624744465;
        Fri, 04 Jul 2025 03:25:44 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47030ba14sm2117357f8f.6.2025.07.04.03.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:44 -0700 (PDT)
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
Subject: [PATCH v2 06/29] mm/zsmalloc: make PageZsmalloc() sticky until the page is freed
Date: Fri,  4 Jul 2025 12:25:00 +0200
Message-ID: <20250704102524.326966-7-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: HTslK949Niof89lcZDmhgiZ0qTJSBFpswZ0Cn75S7mg_1751624745
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let the page freeing code handle clearing the page type. Being able to
identify balloon pages until actually freed is a requirement for
upcoming movable_ops migration changes.

Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zpdesc.h   | 5 -----
 mm/zsmalloc.c | 4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/mm/zpdesc.h b/mm/zpdesc.h
index 5cb7e3de43952..5763f36039736 100644
--- a/mm/zpdesc.h
+++ b/mm/zpdesc.h
@@ -163,11 +163,6 @@ static inline void __zpdesc_set_zsmalloc(struct zpdesc *zpdesc)
 	__SetPageZsmalloc(zpdesc_page(zpdesc));
 }
 
-static inline void __zpdesc_clear_zsmalloc(struct zpdesc *zpdesc)
-{
-	__ClearPageZsmalloc(zpdesc_page(zpdesc));
-}
-
 static inline struct zone *zpdesc_zone(struct zpdesc *zpdesc)
 {
 	return page_zone(zpdesc_page(zpdesc));
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 7f1431f2be98f..626f09fb27138 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -244,6 +244,7 @@ static inline void free_zpdesc(struct zpdesc *zpdesc)
 {
 	struct page *page = zpdesc_page(zpdesc);
 
+	/* PageZsmalloc is sticky until the page is freed to the buddy. */
 	__free_page(page);
 }
 
@@ -880,7 +881,7 @@ static void reset_zpdesc(struct zpdesc *zpdesc)
 	ClearPagePrivate(page);
 	zpdesc->zspage = NULL;
 	zpdesc->next = NULL;
-	__ClearPageZsmalloc(page);
+	/* PageZsmalloc is sticky until the page is freed to the buddy. */
 }
 
 static int trylock_zspage(struct zspage *zspage)
@@ -1055,7 +1056,6 @@ static struct zspage *alloc_zspage(struct zs_pool *pool,
 		if (!zpdesc) {
 			while (--i >= 0) {
 				zpdesc_dec_zone_page_state(zpdescs[i]);
-				__zpdesc_clear_zsmalloc(zpdescs[i]);
 				free_zpdesc(zpdescs[i]);
 			}
 			cache_free_zspage(pool, zspage);
-- 
2.49.0


