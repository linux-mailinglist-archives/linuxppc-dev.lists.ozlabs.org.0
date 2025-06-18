Return-Path: <linuxppc-dev+bounces-9486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A38ADF47B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:44:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrdd5dR2z3bwp;
	Thu, 19 Jun 2025 03:41:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268501;
	cv=none; b=kBcVQQc2SNG+n4hmXrj0Fvt3xvl5ZH3ci7V8o1Drn+3EfEP5dE91D86fydk7AGiMioet+m6DYt9/G26cd5yWYrbF9IAeWrKZMaXrIPtw46FAapFG8WOiXJ+C2LbyViOhzlbM3e4WhtxJoc7fiGpvfN4JcBuJk+UMGz2Vpkz95FZsTxKzDVudR87VP1vBpSOVVWm+l1jxcKSxjylxthf2Yy7T7c2Jka5bsyYzuNyAws1xOTtflEJQ/+3xIlV84KimVBe6yMsuLD0FrQO/D1/RmYZvahVof0aYKZICAmyGcUJRbwdoR74YTs/7konaJFPV2CLKVpmY+5r7W9rOE1tRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268501; c=relaxed/relaxed;
	bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=B3tL2p5MRippgZObkjt9AC5ZI1g5VH9G41+QW4lYkbdmmQOLKLC0k3YXHUDrkS/TGha7V0KVP5xsZriybYkPwVMznWI0Rl7b9Hc0x+JGFWY4inUrnc4GdlejrjisAAThIPEqBxUQOxZma6WJjvMxbCPwks1LqLmh2UuR0Jb2/nO9odCNC4TVeNino35Ei5GEHxJT8VW/ODNNa25K1+6MZ+0+bkFodTsRcMKwY6KfyV9wjYZKslmnF2vPmKqsactR7KlUTXvm+j3GqVFt0q/l7S010xq4cFzPXahPt16yQF2KMaGUgxFRhjTYSuxnFcy1gyn5aV3JGHBrh2mj5xCW+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JBsk/po/; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JBsk/po/; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JBsk/po/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JBsk/po/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrdd0lVxz3c05
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
	b=JBsk/po/YFtbGG83kCNHqBX9u3CrM6xGcrVTjUJH2+X+m4nkVMYWJIpva3kVTEmcUvJshu
	S3YbSS+yfNtRh+y2KqyetkUJ+p6yV6gl0qLAowVN/sfUZXoMlL6hF2zzPpOXqSIyZx88fB
	j0giuLNFIUwiI5H36cQfjT2tZZUBZCw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
	b=JBsk/po/YFtbGG83kCNHqBX9u3CrM6xGcrVTjUJH2+X+m4nkVMYWJIpva3kVTEmcUvJshu
	S3YbSS+yfNtRh+y2KqyetkUJ+p6yV6gl0qLAowVN/sfUZXoMlL6hF2zzPpOXqSIyZx88fB
	j0giuLNFIUwiI5H36cQfjT2tZZUBZCw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-WCv5D-RGPJm6Po6ApHrLtg-1; Wed, 18 Jun 2025 13:41:37 -0400
X-MC-Unique: WCv5D-RGPJm6Po6ApHrLtg-1
X-Mimecast-MFC-AGG-ID: WCv5D-RGPJm6Po6ApHrLtg_1750268496
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso43922525e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268496; x=1750873296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
        b=Cs/dz4rrYyq9NI9OgBNaCeKDP38+hgN+NcMBAEtcksepntlEyvoGKrYuXu9qUGKZMh
         Ezh9p0C0fRvR018+Tm4qX5SjK3r1LeunENTHue/FSwzWauTEO+hj/OMKz9+Ho2m7aV8r
         q6N+OU0g367DJQRJJjcuiVd9/EBwNlek1AIUmfLObAlUXUrB3+lCIhOij9T8/eshD5s7
         7bSMohJW2LZqgGd9Kw4PqYmyzSY+wI+9MEjU0IumT5a+Bfm92H/7GePG/wqu72QMhxI7
         bwlldrVN4o/gJLMY2MbZLwc4xnT07v+T7rVkar7I5tmx22oxAcS3CpBcKOKWmU1O3xTb
         mMRA==
X-Forwarded-Encrypted: i=1; AJvYcCXN1mww25GMhLbC3R/5atrN09HvUS9mwCoy+Sp93uMzPbq+pbDKEh3xyubcdDnNJGVSZKKE1mP/8lOy5DU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGRLGkG+IPibjSLRz34PKEzHxxjOWtRLv8VqAaimDnzqGeu/Jd
	xtDg96U7uIuxdGLUb8KPzHo2EYT/4uyz/lko3jaAhRsk77phLLPeB7o9chvN7AkXzoG8kY+0pJ2
	aZQzTxDYSsOMGwwSMrd1Uk7dHn+xqqceJuwqwYfqHnPuIuhDWGoiHSlRqEtuJEnyipcw=
X-Gm-Gg: ASbGncucnTzDIdKreVscWYQt5vOuMPm74ARwT+KTToUib+EE7AzBBXdjTnUzTq+HZfp
	ORFpJbn4Ryq70upukxT3BJDOpmYT8/R1dMzYZKxgKgXy6EwBoG6MF5qXxEeDFfPAC/gWdHDwI4h
	ajTrmya/san/lQpWNR38NGNc/RfxJpPOuDTQ8X+UZ1JlBYBmh2LOWuIwb+DZ0gEC9PbAP3odid3
	pznd1qoaV7uGsfOFcsTT4/oAsVpMmax6KAYJmUO7ovvrMn/Ir3f4EBRH5LOkyiN3Sth0D0VfSIE
	Ca8QKa5+0LGH1Ls+oV4wMZsqqlfovSEgAX4OkbvykQEt3/rwGZn4SPzHj7FpUepjnGbQ9vkQIXK
	TH3Qb1Q==
X-Received: by 2002:a05:600c:5253:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4534219a64fmr154424555e9.11.1750268496148;
        Wed, 18 Jun 2025 10:41:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQJSoFqz4Qx4eaIpu3abT7lqqTMcn+cWB1r/wxQDnmsMcckQg5l2MzM3eBNzoSDxLAyECFAg==
X-Received: by 2002:a05:600c:5253:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4534219a64fmr154423805e9.11.1750268495716;
        Wed, 18 Jun 2025 10:41:35 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535eac8edbsm3459385e9.24.2025.06.18.10.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:35 -0700 (PDT)
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
Subject: [PATCH RFC 29/29] mm/balloon_compaction: provide single balloon_page_insert() and balloon_mapping_gfp_mask()
Date: Wed, 18 Jun 2025 19:40:12 +0200
Message-ID: <20250618174014.1168640-30-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: QMjxicQKdIMnMUTn9N5X7G-Vh6HtRP63kuBEhZM05uo_1750268496
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


