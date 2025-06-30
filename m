Return-Path: <linuxppc-dev+bounces-9888-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2BDAEDDDE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:01:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5qr70cWz2ypV;
	Mon, 30 Jun 2025 23:00:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288440;
	cv=none; b=LR+hjjh5vohkFAefCe4XvSsO3f7ZnHIyoi5BPY/YR/uQomiWUBz4RYoHqaryVHjvM8Hz12BIE3SXJvL1SzivX5w8ego7mbhGUqk5qZcEoLe/XO2oZHFxP97xMhx3gF5ubcnHg6UTPHAwVFUuUawGeFvvXvwmxTvlhwxw2f0j0ix3nkDRfBVltgrA6ThaR1Amfv7VYEIOD39Kfdca3edlhd7X1i31a+1cMJy2WdIwULbKKzD8F2cLjFvgu+0tKJGeWkxS33H8cIth0jH35J6DUcvx4u1ANhFbAQQz++BAmKrNdU0JkRG8kpfCgXfM2T00cHtK9xpcQQ5SpDqTLRZUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288440; c=relaxed/relaxed;
	bh=nJlezl1jqk1KHM/JmX+CbcKO2aiRBLF0rBMpUlNHwJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=RGJzBfWTLDCMfxsoVE2Ltev4kIqfhuh2XQsHb1qzd5ipeWfF6hHytK8jIl97Jb0KxcJfpT3wJQn3V8tjyT984mFq5IIQjAZarm1Rbar1hVYR0hXoCB503vBOYVP1JmsC5tFxNalw4ZqGH1ugeRBacuI1+hWHXXwth4F3QxcKZ97OXCuiWSbuDIEYrzQ8mkdItGQD1oteVEtnsXcxEXuD82d48M3i5W6JvS26SIa3tBQbDnbAZr6DJsieYwT3FmljlsBDgf0HJqx7PAQN6Wr6kRVzTENwW9S1q3hyMw82LNtX67IvNw/10iv70Bd9wjeZAvC6qTvzIz1MTLjToKS5gA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=diCTLGq3; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ff8JK5XA; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=diCTLGq3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ff8JK5XA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5qr0tj4z2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:00:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJlezl1jqk1KHM/JmX+CbcKO2aiRBLF0rBMpUlNHwJA=;
	b=diCTLGq3WO60229kAbiUpwjHa7UTqymkEVJ5hcvwzbqWe2kyXHUzhDRVsHcB6yNmVB/3QQ
	Z10Jj6Nvb7vZ5MJUrMn7aG56/+RKxZ/lSsbiPSyEyVawAqWTPbHSdvvSN0QtZPWkbK9o9s
	HzuQ6L/jExpHGRC5NGp6g/cuXOm0Ofs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJlezl1jqk1KHM/JmX+CbcKO2aiRBLF0rBMpUlNHwJA=;
	b=Ff8JK5XATAz7w5QiIwOWXf431vXb38qgodMkr1xaVcsFEamTko+AGd5iB/BxCxBsjKtNpS
	YUGZM8N7mlIIUC23i/bHTHgLOX7+APXPSPEiFw8nVjSswLsI84lhie2xGV38Spg3Do+t41
	pYAKDLHNhfFhP0GPgIeLuOuF6FttpQo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-ExDW9uEINASmnOW4qPTkkg-1; Mon, 30 Jun 2025 09:00:33 -0400
X-MC-Unique: ExDW9uEINASmnOW4qPTkkg-1
X-Mimecast-MFC-AGG-ID: ExDW9uEINASmnOW4qPTkkg_1751288432
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so1396487f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288432; x=1751893232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJlezl1jqk1KHM/JmX+CbcKO2aiRBLF0rBMpUlNHwJA=;
        b=PrPU7TbnY6RzH0rgOb1nLnEbFO1+A+o6vdQQAAt9LbPxKWdyZEW7ZvuRmPINZA5mBB
         1owUDtix1pO7wSPAZbX8fOqpPUfr0XRuLjTcG394V8FU2rN8Kohg6p9SKop+lR+tKHBi
         8m7se1jqD3J4LF/s02yXbiI9lsMlaA3ipWzi9Y+yd4J+nCxR0CvqHTkSQiT5cdlokBvY
         k1yz2uAG9IOglHTZaVtVGXYPrZztIUbDkuYUV3pzLKYZ97kBpNI9cq+9UuzqZ7KCoUaw
         DfbG/fdrJL5EMB0gHRVIfweAOznQS76qN95GsygB7ImS3YO4iIdFXEAHzZFp/rZw0GyZ
         cZwg==
X-Forwarded-Encrypted: i=1; AJvYcCUa6cPbUKL8cOObhsV4qrLzoyllhBp+ZRL5U5B5AQGFVil3YzMJbgGcc7cYH4zpLUYO2P/m6/A86h9TM34=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywh7tDXrsTy9xLfkOyev53gNQUatw1rFTe0Xkm3oC7RTKmFLUu1
	4/zXeomZ23wbQOTsmvlnAt1oDGWQ7rGyZld1mTCoCWvOnL2AWXjp0/mLt2ftBDVLy24b4ewIC39
	W2Sf/PeBuZCGB/cCYHh2q7XBnMW2BnS8UfzJMejKs0b4MkKVyKkHhcppnd/QWym8sChs=
X-Gm-Gg: ASbGncv9A5/Q2SKW3ifyVsBk1cCrx4/X+q06h0EG+B/xC3zDsJ9sxoTLGn0YfK28KN5
	q3e4BubIueJK+81K/BoNiKcXs4ZosS8k3Exl5PVTkTlTulVzfBlv15bI1415s+b83iA2MGx9DwX
	AT3wDbI3DWmj+Hzjj/qK7sfSTDhqXiD/Lfyc81ZWa/yPpMJkAzL/sB08Rxid7f3+gr20YgXbJ1B
	dcPcR/eykjWGmzcmbDHAlGtSzZ/Gsbc0MG9p23BMhe+U7UHuOKsd+7RGAcmZG1ORAPkbNn8dkJ5
	LB53tZ1NHRQHNrbgwi5TBobpwl8VDK+MqsVjwPFeutz5aEKhY4909ZEwgleQdfkeWbImg8NVCSh
	eUEjM2So=
X-Received: by 2002:adf:e181:0:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3a8feb844cemr10501286f8f.53.1751288431559;
        Mon, 30 Jun 2025 06:00:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGEarPHGaA16flG07pTm8Y+2ZoBRaEqSqyGzIU15EPr/yTHmV5lKxwKCSS//XnEer0oKPVNw==
X-Received: by 2002:adf:e181:0:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3a8feb844cemr10501216f8f.53.1751288430998;
        Mon, 30 Jun 2025 06:00:30 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7fadf3sm10557609f8f.34.2025.06.30.06.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:30 -0700 (PDT)
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
Subject: [PATCH v1 06/29] mm/zsmalloc: make PageZsmalloc() sticky until the page is freed
Date: Mon, 30 Jun 2025 14:59:47 +0200
Message-ID: <20250630130011.330477-7-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: FOodB29crIPJaQbtQjdKg-vfYnprWX-Tdpof_5-lcDs_1751288432
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let the page freeing code handle clearing the page type.

Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
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


