Return-Path: <linuxppc-dev+bounces-10116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 897A5AF904A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:29:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVDh6gH6z3bwp;
	Fri,  4 Jul 2025 20:27:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624820;
	cv=none; b=kc0xtxlVCwM7VEhWoZJ9oN/6Ak0v4ChTkgh1mQ8kcI2+j9YmIQ1jPDPI0poS6P0sZq1QtWr2hiLdZ3ogpzqNOVE/g2HI9a7xexMElL9Ot6U8gLYAD7wnut33h3eZNB4rgv5YvRDiMjarxTvLFpQRVnSMW1p8NKjUv4tYFpScKusO1zZ+OWVWbgl2fN0hAChNtnzRDud3PM5BQ1JZ2PVT69yNnu4zYMG85FpZ4uO6RaOme4A0uGMMRyJNrbhpg7xJbOYGYn1aQpZIFSa3y80DcGc77++xInmRTbGtsB39OD4+NrmCab/bhX8jKi//pOTDKG5OONYwhm9Jpi9M/p3mDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624820; c=relaxed/relaxed;
	bh=DAmNizoml8pi0FWiSRf1K1mTve+PnYDWvVyOK7ajbGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Bzf/1i/AHMGE4Edm3TSLiuJ2z6urhO/owdvuJjaZqgLAbXpq6iU4G4vE7QavJbURdo41WCq3X2oeYPGpP68OYjyaozJdTjt9xmq6oK6az6cIxEFiDUICBnuVV5669cSQIVzlQYC5uNlg8muFAX4t6HUOAsf4q24p10EF9YaXPHXL2j2DQQ0I/4r3uAiAg6ze4rGn4ZmfE5aUrKZtl73FMLUbV/1V0yAoa8xmw/YmEJuSuqNhNm0tC62x5EtXYOUAJfkQP5K/GEO5tHSUunzI8xGPngv2Cu1/hAyIHY5ycJ5aSex2J7inbJXjm370bGOxKwcUr2qssbv6ZPUL15r5kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bOifjdlA; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bOifjdlA; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bOifjdlA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bOifjdlA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVDh0zQQz3bwf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAmNizoml8pi0FWiSRf1K1mTve+PnYDWvVyOK7ajbGc=;
	b=bOifjdlABqDiVmOOdxKqTVDYnEIb6NT/hMDKMpIW2OactrcQ5BDDw5MJ2QgMjgH3MSdelj
	RU7PO1uZQevsMs0YQwDvHayi5UmGJYByp1cXMMjzwxhE5Eb+zRQQyFd+NqbtaYa4lBuBJs
	PbrH9LV5gpZPNsVFdztEoHMs2Zd8Ajk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAmNizoml8pi0FWiSRf1K1mTve+PnYDWvVyOK7ajbGc=;
	b=bOifjdlABqDiVmOOdxKqTVDYnEIb6NT/hMDKMpIW2OactrcQ5BDDw5MJ2QgMjgH3MSdelj
	RU7PO1uZQevsMs0YQwDvHayi5UmGJYByp1cXMMjzwxhE5Eb+zRQQyFd+NqbtaYa4lBuBJs
	PbrH9LV5gpZPNsVFdztEoHMs2Zd8Ajk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-TYnFTVCWNzKr1Bi3sYEK5w-1; Fri, 04 Jul 2025 06:26:51 -0400
X-MC-Unique: TYnFTVCWNzKr1Bi3sYEK5w-1
X-Mimecast-MFC-AGG-ID: TYnFTVCWNzKr1Bi3sYEK5w_1751624810
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so500531f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624810; x=1752229610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAmNizoml8pi0FWiSRf1K1mTve+PnYDWvVyOK7ajbGc=;
        b=bnw8sVSXmSMu0rgtW32UZZ3kTqGmYkuGaC6f7XEqYf1nOuSx+QTzVPdczsqMP3yZpL
         80ckjCwQ2gXBt4K6aphFOMjxMfnsRw+bMbqmiYPBbe0wDekRYeeIErrVSOQs1KaLpNi7
         dP+v2g0BNtS3Rs1WqSZrss/g6TfYdGPtKlkj4IxcvsTbN5mMVO43QamZXoOjuEayXIS9
         hW/JwG6w/opd87CvaahDnlfcNvxWhfBMjtlDJWlPQt/c54oetpaAZSSt3T3YQo5PTi33
         7N4yFwZIpTRlE/KSt689tbLuOPKkLzAMBYhI60OLdosJvVX2uRMTPiXijaA+ibL06Pgt
         35MA==
X-Forwarded-Encrypted: i=1; AJvYcCX4bEU63way81PNmn6t/fnJ1t32R2SXB1ixcxnmEmV3tDdkCgeCtOx5b9W2ZhnCWsJBTE0vBZ0a7E0h1zk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9Cl9Ebi0YZX1zvwkyWtMErzKBzlsies6ExoPNmfSSg+8Bx5R1
	vV2C7D9mYeB2uLJMVTmYSfFEF4ah2Na2jeuKcDhuqxOBmnftceQ5Qd24RbCcjAeiBBc+YmtN0Mq
	F2bXfj54Q7sEw+tITA9+yJr9Xoe0CDpUsPqDwPbjNV36X01gqxjQsUG+mZjenIdUg1E8=
X-Gm-Gg: ASbGncuUXTTVvuPkuzDTrX0T6/WeYkXtOmSn7KnlezO+4fZZx5FnV7h2i0ZfK2G1FP3
	kGjArRb4dRR/SQh8Pt4Uo9rOGJm9QqPIBm1ssNvWL4e364Nwn0VihVAZde8g+w9epXvWBp8/5qd
	mKHtfa/Qtobg8mQnyWFRa1uy7/X9v+cJxh56OJXZpE+Ukf/kI7aqpm5n1OxF5Kx7cn3UTv7VTrn
	ajW2tRUIoo2ZYJAGaybOxFU6KMs/iykelclnTahku6UCdaHJMooo3lR+30VWCLWd09tmU4zdhMd
	qjwp0baDBEdbaFC5/Ce7j5oVEMrznBUI5bfFnM0vnfGQFPUPukcgGyjKadPkfJUXNFMKjuz+6OF
	aPY2Ppw==
X-Received: by 2002:a05:6000:2906:b0:3a6:e2d5:f14c with SMTP id ffacd0b85a97d-3b4970294bamr1229499f8f.30.1751624810313;
        Fri, 04 Jul 2025 03:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU9MKO4L2eImwXLAzlEGTAbbgXQLTQHWpn061Frnhroy+xSoAIVNW9jaIe3vRaTd6Fz7itPA==
X-Received: by 2002:a05:6000:2906:b0:3a6:e2d5:f14c with SMTP id ffacd0b85a97d-3b4970294bamr1229434f8f.30.1751624809815;
        Fri, 04 Jul 2025 03:26:49 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47030bc5asm2113887f8f.20.2025.07.04.03.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:49 -0700 (PDT)
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
Subject: [PATCH v2 29/29] mm/balloon_compaction: provide single balloon_page_insert() and balloon_mapping_gfp_mask()
Date: Fri,  4 Jul 2025 12:25:23 +0200
Message-ID: <20250704102524.326966-30-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: KgzzPpPY3YxnftnxqgimxsmZAKbAW4ZlqQzNY0QRwgE_1751624810
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's just special-case based on IS_ENABLED(CONFIG_BALLOON_COMPACTION)
like we did for balloon_page_finalize().

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 42 +++++++++++-------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 2fecfead91d26..7cfe48769239e 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -77,6 +77,15 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 
 #ifdef CONFIG_BALLOON_COMPACTION
 extern const struct movable_operations balloon_mops;
+/*
+ * balloon_page_device - get the b_dev_info descriptor for the balloon device
+ *			 that enqueues the given page.
+ */
+static inline struct balloon_dev_info *balloon_page_device(struct page *page)
+{
+	return (struct balloon_dev_info *)page_private(page);
+}
+#endif /* CONFIG_BALLOON_COMPACTION */
 
 /*
  * balloon_page_insert - insert a page into the balloon's page list and make
@@ -91,41 +100,20 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 				       struct page *page)
 {
 	__SetPageOffline(page);
-	SetPageMovableOps(page);
-	set_page_private(page, (unsigned long)balloon);
-	list_add(&page->lru, &balloon->pages);
-}
-
-/*
- * balloon_page_device - get the b_dev_info descriptor for the balloon device
- *			 that enqueues the given page.
- */
-static inline struct balloon_dev_info *balloon_page_device(struct page *page)
-{
-	return (struct balloon_dev_info *)page_private(page);
-}
-
-static inline gfp_t balloon_mapping_gfp_mask(void)
-{
-	return GFP_HIGHUSER_MOVABLE;
-}
-
-#else /* !CONFIG_BALLOON_COMPACTION */
-
-static inline void balloon_page_insert(struct balloon_dev_info *balloon,
-				       struct page *page)
-{
-	__SetPageOffline(page);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
+		SetPageMovableOps(page);
+		set_page_private(page, (unsigned long)balloon);
+	}
 	list_add(&page->lru, &balloon->pages);
 }
 
 static inline gfp_t balloon_mapping_gfp_mask(void)
 {
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		return GFP_HIGHUSER_MOVABLE;
 	return GFP_HIGHUSER;
 }
 
-#endif /* CONFIG_BALLOON_COMPACTION */
-
 /*
  * balloon_page_finalize - prepare a balloon page that was removed from the
  *			   balloon list for release to the page allocator
-- 
2.49.0


