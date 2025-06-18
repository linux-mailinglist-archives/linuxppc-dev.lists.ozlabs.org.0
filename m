Return-Path: <linuxppc-dev+bounces-9480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AFDADF46A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:43:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrdL0qLXz3bkL;
	Thu, 19 Jun 2025 03:41:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268486;
	cv=none; b=hlSM9p0haOFEBSMXxlNg/3NbDj4ANxNmQ+cRmu/UhBN3LjNb1Fn0wCJMiYI/J+yBQakr9TZpkNGm1KzXgYfnq6Rakol+9U78oYuhzJRGfmcTrhoh3E0BEeUeb4fh050iWBTh4nSkxycTabderfeh1D9b5O6a7os/T0fZMkqwrqTH1EzpHcrZ+pKPOL+54r51F+w1Sqgjvu2fzC7iE9pehH4lGHm+BzfDbnnbexZFadxDtdFv0Vipse8VtpnDoXDTb0HfWmhDjVA6V62UuZUHx0g8SBAlHYJok8oiGpnxMgLgYqgMvmd5gWaCh8xPp3aXwRJXlaRfcYnKfFUiY/ceVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268486; c=relaxed/relaxed;
	bh=OFGM8ws286HsZ+G2nyb5/sPhilYYDV0QN54X+S74Jfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Q353axLQAYFQ+F6YwjA8EWnZM0Mu1Zs+9e1YS1/gax2FBQTeG7JuDr1x5cBZkzgs/C52uw6Sj6aGcGI2cgrxR64ykizSsL1/dqQxqKqpe8lY5dVag6YOVoqlVWJS9TpujYwFh+VHH0zyQISi7p7Iz7MgkzQpu03j8l1TJ4ZCfMajTrs3XOInqUJyzGHwFz/HEz6OiC3PC2theon0G1UAS7ZTYq9iieLLajv24Tx1A3+17aEuabYOeroP1BJ1D7meOhFjO81cO78l+dqUgPqsZEQ6/BLfffy5NEHTtTPIKApB1vd1m6+AXv5cAtPDJCiEAp1+Mm0wQ049blBbv0P3uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RGgoRlBv; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gJTfLbc5; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RGgoRlBv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gJTfLbc5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrdK2Hhrz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFGM8ws286HsZ+G2nyb5/sPhilYYDV0QN54X+S74Jfc=;
	b=RGgoRlBvMfb8arUK2BvY6h0eS8PbkDeh3eO5qoLXOWcsk7KcpHNZbl35vHOlVHXD/++8y2
	Jq7J1Qrhz4k8HUne7GKcTg079Pb0TCqCq0FK2bZ7oIqfqli7PRosX6VYonskm897JAVSx4
	kM7Zp95LdcXDGC4Uj159vDDi1DdDSMs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFGM8ws286HsZ+G2nyb5/sPhilYYDV0QN54X+S74Jfc=;
	b=gJTfLbc5dhOneVaIVyFqUEIfK9WHKGNFLZqkFiBcaEnbYoOi3wlxDi675jByNzMBZtIbbQ
	fl2do+uqsJA9jq8tylTHsPqOLcdE+C81jQ6ssdxHcNvbFuIHktGA9i6cUQnpRfiPT8ocGV
	ASMtBdR2R33krjjF82pVjBNozzDaZUw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-26VE9j8rPtKAJYBuWmHvDQ-1; Wed, 18 Jun 2025 13:41:21 -0400
X-MC-Unique: 26VE9j8rPtKAJYBuWmHvDQ-1
X-Mimecast-MFC-AGG-ID: 26VE9j8rPtKAJYBuWmHvDQ_1750268480
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so3929145f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268480; x=1750873280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFGM8ws286HsZ+G2nyb5/sPhilYYDV0QN54X+S74Jfc=;
        b=XDz77fppxknLPQbH/2o+td+uQdKHKa2wb/lc3SqQZopwHE6TyEAtSaEpqwoB9GqKSt
         WhLrsv1lWDDFFAtYJwfDXs2iNder13pTXQhBjSjBEKwle/z5bDf3x+vQ7IzunSmJLt6p
         gYcY+ly0GhfInnIbfSfoUFrXwGp5bx61IWBBXnpA5wzkd2bPs2cQUG/IrWvBCfv9UGpv
         P1aFRCAQ4dbuumRqH4Ih/a1Zp1qCo6WfqSDT6R1Hz2296c3i5qHdlWduWouBqgsqKk2o
         aYZpJO1wzOQ5wWL7AjC5DKkXz27ekitzUdLz74PA2+HZCfpUGSIXGsVo4Q9LAfQs1lI3
         IpbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzBGQbqhSsln/Ro/t2Ygf6b8wC7DG/KyT1690SAQ+Gab560Xa2yuVVw5UwMPDBEEo+r2KQYwELo2igaBE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxyxJngod525YgvuHlDKFqXP1wHk+l3hyf1n6Y4QzPFn1cmoGnh
	nOVcE4p5XhbkrgK2HUIHmwzcoe4hu3RBJDOFYi2EIVZ0dymD91x6Ru0v6diGjTfY5j9OzNCQfjZ
	WMe2BwzlJGtD5KEzOiEQedGvh0eCwlmDFZgjwkiLcP5dF+puzPyixBQDebtrvld+mR4k=
X-Gm-Gg: ASbGncsvxM5sHi/4ouFhxLFW7Y7W5NmdLwc2xqcoLm9kDGqnKBJvxOQCSUp30PIZWtc
	hOL0mjkg0ZB+6GyjecqT/u9xLVTtrGnF4w48jZsxUaizSDYHHv+/ykfLWtV0b14N+9H6+Vj/ENc
	oz+ORwbVYXZU1rfmCX1eM9SX3AxL+G5Jlyvw/idrrPLAAwKXqiaxjoCnxSfMOehoGNwwhIh9i8y
	mSBnLuDcejB7U6513yiQ1dF6k0b6DgXS2S4x4nW8gkq3e/ByOZzdhJwkn76g6uhhk8ltyFj5tbz
	ofVBD4MVmG39BwtX1EvCGPFJrFlmRc/rxHZs79YaQjhgGxFAgl2b87oimm8L24Rwz9sAYCNTYYL
	EQGUPnA==
X-Received: by 2002:a05:6000:2f88:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3a572e6be35mr15379308f8f.36.1750268479821;
        Wed, 18 Jun 2025 10:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGgOLn/JzQiVrSw8561br8iJzDS6W98mGXalaJQyvnuLaRLghELBqFwLLjepyMMgs/X1CCpA==
X-Received: by 2002:a05:6000:2f88:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3a572e6be35mr15379264f8f.36.1750268479340;
        Wed, 18 Jun 2025 10:41:19 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b62ba7sm17866251f8f.91.2025.06.18.10.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:18 -0700 (PDT)
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
Subject: [PATCH RFC 23/29] mm/page-alloc: remove PageMappingFlags()
Date: Wed, 18 Jun 2025 19:40:06 +0200
Message-ID: <20250618174014.1168640-24-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: WF_LsioLepGSsVR6m1T4NikI297eQwmQ2jMNZmmQyF4_1750268480
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We can now simply check for PageAnon() and remove PageMappingFlags().

... and while at it, use the folio instead and operate on
folio->mapping.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 5 -----
 mm/page_alloc.c            | 7 +++----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index abed972e902e1..f539bd5e14200 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -723,11 +723,6 @@ static __always_inline bool folio_mapping_flags(const struct folio *folio)
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
 }
 
-static __always_inline bool PageMappingFlags(const struct page *page)
-{
-	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) != 0;
-}
-
 static __always_inline bool folio_test_anon(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a134b9fa9520e..a0ebcc5f54bb2 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1375,10 +1375,9 @@ __always_inline bool free_pages_prepare(struct page *page,
 			(page + i)->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;
 		}
 	}
-	if (PageMappingFlags(page)) {
-		if (PageAnon(page))
-			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
-		page->mapping = NULL;
+	if (folio_test_anon(folio)) {
+		mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
+		folio->mapping = NULL;
 	}
 	if (unlikely(page_has_type(page)))
 		page->page_type = UINT_MAX;
-- 
2.49.0


