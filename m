Return-Path: <linuxppc-dev+bounces-9463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F011BADF439
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:41:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcR0CwTz30gC;
	Thu, 19 Jun 2025 03:40:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268438;
	cv=none; b=GwwaFQI9aAGoH21yigPgIsCgHHZysbv0Y1tGrab8gAv1r4EqTZhxZBOutl0i102YXT5zTwtZ5UKCL+fckykwLZqD3Z/zIoh9NI8G2DLIMn/AduU3HB7kJYrWNumTE1FctxY7NQK36z+vdafuyditPAX1dL5Wvpb3Wpx+/MVQ+8cYoa1amRbtdVQn10qeRSaEyiJbEJPXleCyV5LYQGExxQ0ChYyP3ZvnfiYWjdWdIkTNn2NKkhwJ1qkKe9xiZCMalKypKDD5X5XbPlVtTi5kzkWbAregzOSiMRHhOejPb8pfuUSmSepZA7e4zueR6r1GYBaK5wdaYtXPgGy11pH+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268438; c=relaxed/relaxed;
	bh=piFGbpStSQJy+mcXr4hbLewWyhEioJRgfJ7dmrDuxBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Jz8TtVTWUX0SJsGLCYsKZsyNRZLQJo9FMFEkfxdSVWMRwuj7Or63ffUI+VMuNQNfZRDFJ8KFkPyo762628BssJa74Xgj7s9bwDDa5PySxjeDbjf8cXtc5SlG9Cpikj46Jdis6bskwOm/N2FGVPGEAD9GzYJKqFgUKzUvzle0rjSgIft5SAw5R7pIzZcNGczGCpI1LCvACiGRG6VWc8JUWZi4ktZ5cK5FQan/8V3Z9sat5mJIyxoABX9bUYxV9tOwQJw2+E0WcrQJEeNTniKk23FJMIZ/8Dom242TF1LxO1nVVT4jpSLdk54fGFS+C4XqeyJDVpbXglDgYWPTbYo7rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VVyb9wFN; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M3QvKigs; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VVyb9wFN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M3QvKigs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcQ2D4Gz3bcj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piFGbpStSQJy+mcXr4hbLewWyhEioJRgfJ7dmrDuxBM=;
	b=VVyb9wFND5FyCauso8iAM54xJh/hPxW1x3yygN/CuDhNf5wlW4dyn9nJzUP+6HMK0KeYTs
	Yq3fcfAz9MJIWsou6t68JmDDgGmKHy3NcmGFo4EOJjq2KCGsIo5PVX0UHx3eG+JjogZDXc
	dbupQXERQi37krOcS40y84W4PWU+WuU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piFGbpStSQJy+mcXr4hbLewWyhEioJRgfJ7dmrDuxBM=;
	b=M3QvKigsY1QrgtrC/vGvyqWUFJvyH85AhyNI3CUW1b5X7pB1Xja0qTNyIteG4mF/5VCfTr
	djcL7JLZFQ5WG5IagS77YauL/AOCSPrpMT/vYW3tNz6JyYRypoO0HvD8t+fhIvIuXN3qF+
	81/aDkUZSQu0Kq5+T7RrNGAgAQgDf5E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-JfzRGUuhMuuexQJS36FtdA-1; Wed, 18 Jun 2025 13:40:34 -0400
X-MC-Unique: JfzRGUuhMuuexQJS36FtdA-1
X-Mimecast-MFC-AGG-ID: JfzRGUuhMuuexQJS36FtdA_1750268433
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d244bfabso59187695e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268433; x=1750873233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piFGbpStSQJy+mcXr4hbLewWyhEioJRgfJ7dmrDuxBM=;
        b=ADvhxDDZk+OLHTLbBodyoNQBfAT174wa/6vse7OluQGIXXofSX/ukQaU2DAwNfw3cX
         KhJahPG65ZiVjMjQKXeWk8dbl8cPXz+RPC16KxtC3UUdJCGH+AryMSj0iSoFuKtLXh2c
         RmgKaeTtsgzqvkkiC8TUoYO+YGKecVhCSE1BAqlxZW0e5K3aM3flS+o/M4svTxJBJmNV
         gMRWufEESYcvbtoPgdgvpsbptfP0dWhBUcE8rR1eWQnQ2LeIFNxs9bpznHRtEOaNEDR3
         MPrW5dgtmlqXkIn1eWJYXoL7vDXyJ9oRmR9xWbr2PFyXrWqdC5nrbn9hweH9UJAhJfwp
         P6jw==
X-Forwarded-Encrypted: i=1; AJvYcCWcBKrGi8DLYoZm8KHpxAS8AIxFmbCtkr5RpEOUiZTQB3aPk3UpbIpiODdUCuLT5SgDQyerFz8U3RYrshk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyoyz9LiuksHZzZQJ1+OWMvvmq822TWxRdNFBUj7/pUsXbnE2Sv
	zfUJKybqwFSwrvGD6r3OPj5uq3e2MJ7ape3NcizV2wqgCbtuDUZTQ2JCES8xbz3/XkDuOZ84+sW
	3yV8gS6i83zOmckGhQzHXB78lvPgLEQUvctzFps0pwG/5cE9o2QLGafiqISJ889DC9B8=
X-Gm-Gg: ASbGncvO+T7ZwD63yGMd190LEHXLzUXDB5O34UrSc5ibYWyoG8CPLQHmTOUls1jZOWv
	2tXF4JYegyOb1A8mteu4U4KLPqo/IPnBOaIiL27SBXk8maDOaDvOunQo6V2cHIv/es342Elfvm7
	zMD6syS1iPQVoP9LDyOmc3lIBOvUqNhIkqfS+nDw7+ziQeEirkWnwrbOHrqO7c2YFiBhYcxYPM0
	1DtzQck+ROZAV22jRk7Cvwbq7ZjBOuH/hCTdj/LU9TGXW5nl4hmiXnhi4BZ+NGup6CcNrmN5yRA
	37zqNwyajtRc/Y/ZvFq2UcsAO1E3SPfj1c6Npy+kgrmZDanLfEFyhiQsCIO8pCsUtxaHjNPz1jW
	lEwA/dw==
X-Received: by 2002:a05:600c:8b26:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-4533ca6635amr196393005e9.10.1750268433008;
        Wed, 18 Jun 2025 10:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPWAw9+UfLP1Ct5dqz9wzZx48CMnDwfNIf0E7YgKYn6BQsIliiNikQN1x74QYxh04+83mIbA==
X-Received: by 2002:a05:600c:8b26:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-4533ca6635amr196392375e9.10.1750268432585;
        Wed, 18 Jun 2025 10:40:32 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e99d5bbsm3600465e9.36.2025.06.18.10.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:32 -0700 (PDT)
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
Subject: [PATCH RFC 06/29] mm/zsmalloc: make PageZsmalloc() sticky
Date: Wed, 18 Jun 2025 19:39:49 +0200
Message-ID: <20250618174014.1168640-7-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: haUCbcmBX02A6GLI_qbyj3ChKVbKVb2nqf6Go3DIu9M_1750268433
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let the buddy handle clearing the type.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zpdesc.h   | 5 -----
 mm/zsmalloc.c | 3 +--
 2 files changed, 1 insertion(+), 7 deletions(-)

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
index 7f1431f2be98f..f98747aed4330 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -880,7 +880,7 @@ static void reset_zpdesc(struct zpdesc *zpdesc)
 	ClearPagePrivate(page);
 	zpdesc->zspage = NULL;
 	zpdesc->next = NULL;
-	__ClearPageZsmalloc(page);
+	/* PageZsmalloc is sticky until the page is freed to the buddy. */
 }
 
 static int trylock_zspage(struct zspage *zspage)
@@ -1055,7 +1055,6 @@ static struct zspage *alloc_zspage(struct zs_pool *pool,
 		if (!zpdesc) {
 			while (--i >= 0) {
 				zpdesc_dec_zone_page_state(zpdescs[i]);
-				__zpdesc_clear_zsmalloc(zpdescs[i]);
 				free_zpdesc(zpdescs[i]);
 			}
 			cache_free_zspage(pool, zspage);
-- 
2.49.0


