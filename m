Return-Path: <linuxppc-dev+bounces-9908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A364AEDE0F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:04:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5s82YLFz3brB;
	Mon, 30 Jun 2025 23:01:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288508;
	cv=none; b=HcP5743evAX7X1uq1jLHJIOMAImmKqvBpjuFimUDxCydGW3TBH4AmQqxw1Hc3slKDvepzo3or/p4PXgQ2QXP1xpuzGa0nzdLvUOas7hHbPu/WiYYBV3vgm/wFp0YyXBlzwnSytH6z4XIp7NEhPdhI7YMN0fLbSBDuZCCb/nuH700XX2Nk/zj+L2TcPNB7SSyUVcbk+c2jErouTBst6tmMRgdwngtzMPxBMZf53/FfDgScVoVV/852I8eJAYls3Ne0rmMeYw0lvJcpsasoFaFaQpiq+2O7e0DHncNCZJYX1BHBlj3mJItIVYpkSZgiiNgnZzjprdj/C006PfdTHsweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288508; c=relaxed/relaxed;
	bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=DYkBCkq2sPnu3AjJLZ1Juv7fqq5IWkMPS+SYmZojeNRn/QCzTiJcGzNaomwBVup/dYtHrgbjMG1GP+apCOSUS3kYaZCBHPtw98MR2f8vwersWgLewzbkLIXrin9jys9w3Sy7H6xiTNhxTY1MSPRGkePCOydR4xQk+YgEAS67rjpmdehr+EV42wGXnqFpEwNBJmIUHW5dSvpcwHm76MvOPoNGPfOqW6Y3ck7daUZJuTYDz/7y9b2N5H1qE2TKBxiPcSfsud01KbG2Jp2GTu92JKX2BLvu9SPVYn7o+6vlZkWDa/HT3wHolU25TvUlp3pTwdMQMo3c74y13z/V62v9tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hThIGwIR; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hThIGwIR; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hThIGwIR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hThIGwIR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5s73QLpz30Vn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
	b=hThIGwIR5gSK9Vb7FB5pl2q4Wq5AF5jfYZNkEV/PlIMl+KfugUbpOq+x6WWNI72SABZOOs
	lEIAf+JfDrfFRIPQPas0J+GSap8xKIiCEDqWA0X3/wZipnsco2+QnHE58nwLAODisw7K9z
	2KTlhWm9cgeNMbgIi2B0+aWTVc8NUHA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
	b=hThIGwIR5gSK9Vb7FB5pl2q4Wq5AF5jfYZNkEV/PlIMl+KfugUbpOq+x6WWNI72SABZOOs
	lEIAf+JfDrfFRIPQPas0J+GSap8xKIiCEDqWA0X3/wZipnsco2+QnHE58nwLAODisw7K9z
	2KTlhWm9cgeNMbgIi2B0+aWTVc8NUHA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-cPsyxTHSOq6Hhch-Y0wGrA-1; Mon, 30 Jun 2025 09:01:43 -0400
X-MC-Unique: cPsyxTHSOq6Hhch-Y0wGrA-1
X-Mimecast-MFC-AGG-ID: cPsyxTHSOq6Hhch-Y0wGrA_1751288502
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a5281ba3a4so1975986f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288502; x=1751893302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
        b=HD+6CU/B81qy5yQqPf6qGUEabjnH3ceyyRhNbimdlMPHTArFZfQmBVmKUsld4KKUHC
         IaM53H98T+NZwqfSoDMBV6RmACXKTA+eKiqVrsAtJnD+xk8mPp+6q4JpJ2Zx5A8Y2qZB
         h7lXEGcPI8jOnd27251I1tyIm6r9Fe9YkdMxeDAMeH8RKagUnnZINa4khMWWD9iIEkYv
         eEgswVro9Z75MzK+ZD2DeraCgLlCcNxoJYQpjn22PuWPL34qDY1nNZrv8HwzMbiCSt+X
         wczwUvIyQIjHJBWallRgFJO4eFqRgGbGhMEl88NGADNgtOSNMZbbD+76a8e+t1YRY5ar
         3O8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfBb/69wRdyfZbme/T7SwN4jWp4dAEb3NhYXM6FHoqW69im+MRGirertdmqwyKqlA/HvQ4nWTgX3lgckU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLo+i3XQlkhIKIZxltwvcX0UC/fFPl5Cnis9T/PH52Hk8MpfLL
	05LvQvQofB1VUGNS1aX8JAEQwwqQeJnYchVt4gdwCsA8nGp4bvEA71L4kGf5LPMaN0YiyPo/AQo
	mWaGyaF2CaTPPfa6GgyrNysxU8c+5p8QCE3ZmZit0uLE2SSXPwVN6POpAjJRqMm4E6nI=
X-Gm-Gg: ASbGncvtmSXFOp6CWyUnmfimTydbDw3BojjaPLO6ePC/AYVZPMRQ6Hk279/hnukqqMU
	EdoCaAt1v4KH1wwbYXEd3foN6tZKWyZfXz+ogxBLvtNtaOcLaq1WQUOwgACiNscEEHHxX4Lzfeq
	7ZOWGNmUAXRXCE+PaV96PuoWtCL0p/hZUBJdEmkdMxmsM5NQ2s4ihfYWXV8GB7c+MRc6ZkkO0xf
	fVKbdRh4sn+D7uEVNxy0YIeOcH35vrI58Td4SedDKQLzD3nCA162PDxHSuhCStBWTx4RyxiIiTJ
	CLwbJJBeBbFBr5Ngrph6CdBxHWoG6sn2sIaN8soKZRDooflfZ7Ia0INBhN4iJ89iy3ZK0/jlmD4
	H7IowVdU=
X-Received: by 2002:adf:9c85:0:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3a8ffcca245mr9545878f8f.31.1751288501850;
        Mon, 30 Jun 2025 06:01:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmBHmttdmK2eq+WBU1B9I2DDaPMLfI/76nbXYnXDHgExr/7iQPmKv6fPJxJBiz140zN+RyvQ==
X-Received: by 2002:adf:9c85:0:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3a8ffcca245mr9545827f8f.31.1751288501169;
        Mon, 30 Jun 2025 06:01:41 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f943sm10337130f8f.101.2025.06.30.06.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:40 -0700 (PDT)
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
Subject: [PATCH v1 29/29] mm/balloon_compaction: provide single balloon_page_insert() and balloon_mapping_gfp_mask()
Date: Mon, 30 Jun 2025 15:00:10 +0200
Message-ID: <20250630130011.330477-30-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: HnmavJI11ndNPvZSu4cijYJxFjiLCxOJvGrzMSNuGck_1751288502
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's just special-case based on IS_ENABLED(CONFIG_BALLOON_COMPACTION
like we did for balloon_page_finalize().

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


