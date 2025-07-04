Return-Path: <linuxppc-dev+bounces-10102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE76AF901F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:27:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCs5GDlz3bn0;
	Fri,  4 Jul 2025 20:26:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624777;
	cv=none; b=A/2rZw1nUnlkvIs5Nz6gBqjxrubJOYwOocjL0yvHfDSrupzaqW4B3l/fgjD9BK1eeVEE2cLYoQLmo0QTTC3HYCq8OGm+RcRBj8mKVwYtyT3m4CD92lPZ4TS+8DJ5WCEe1M3/kqwaDNQOIHXU4gYNajdzXY8eEcldWCDwoifvaWzw1hx3klju/SFNH0rn3Di6sM/OOMkPIgRlqRrARI8HqyfSZGpZNnIgqY7uP+eOdqK+0MZLZIsXfuuh5itPAdKfymkW107YvCSN2Xp3nxnCD3iWr7LmkqoYEmJR+UNidAWP7TURtGIAIdNkkepptcFX9ET7WbhKxb9PbH+YggpTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624777; c=relaxed/relaxed;
	bh=0v9UDDMP4rF7Dl8ADVUR+GZMZCj14eHRzzjvBkF5+v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=B5+HxyApS9Cxlj7fydfP14YSE3AkTiWdwGkVz7AWeY1S5l4zJSVJXMayonCMzdRp9fhq8G8gDn4HWjkLDKREQgBkU7Nkv06n1DLEQPQ2PkRdPtN6JNBdJK3jNjaIsf1PVdze+tKak4TlWyhfJR8ZRxnu3pqk/yvUcaaqpLtNlLicO2pzWETpbHh+bzmpXZr50GPWqOia1duIZCTBSQnpfPMqJth7TPBDJnkUs8mkH5OdIRA27CPmZ7KnAaV8Fn01rPJoNcBoD0i0l8ued/unhg71pS+Kd/lf9HjGfy6VLM6U32QEDS0LodIEZ9wQkNi+7N93H7OMiH+ZLOV/Bfm2+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d5zpj+K5; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pl/24z8c; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d5zpj+K5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pl/24z8c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCr6X8gz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0v9UDDMP4rF7Dl8ADVUR+GZMZCj14eHRzzjvBkF5+v8=;
	b=d5zpj+K56ScBjHhhTQrMl25uWqP8E+Hw+n8QcKEOZ6huQkcnpm21Uw+QC6m+ds56eMMJjv
	/txTi3mR9JjnqFFBAtuOHyMKPmrkb5a9BX7XEYmI3wcAqkNKVoDzy1A7hgcNNyfvY8KzNP
	gPbFS3hnCmEcEB8hyCBx1WX7+xlLwGw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0v9UDDMP4rF7Dl8ADVUR+GZMZCj14eHRzzjvBkF5+v8=;
	b=Pl/24z8cFWrr6kqDSU3fr4jdkjoozTSNF6Ml1s/6U5H1smwCW5koJExKrFiIXZMYovrHPT
	qfkhAjZVcF41Fi/0U+3JI3TVOrTwAw0c6MNY+Vgk0serTt6On6qWpHuUhy+dRNCa+jxqBC
	4P4tzhtujK9+iYHfIXedIVREDr+c35g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-6UAACKX_OjCLAVQdQyBhug-1; Fri, 04 Jul 2025 06:26:10 -0400
X-MC-Unique: 6UAACKX_OjCLAVQdQyBhug-1
X-Mimecast-MFC-AGG-ID: 6UAACKX_OjCLAVQdQyBhug_1751624769
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso519459f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624769; x=1752229569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0v9UDDMP4rF7Dl8ADVUR+GZMZCj14eHRzzjvBkF5+v8=;
        b=UyWD4S7KG2VpD2mecL4eNY32ht+H+441iWhBlDNXUcSZmzypW7gvZxWYiRX4XMUgjn
         S/NfYhQZBGoefZAtbbkPK0pZ4ezSDPO6D3a3WQS3qsNNCw4KAu4wKOXWtSH0V14MrHZk
         U/D+S9HRADOkH+23eNVVvTCZu/t0wLEoNWmBnntPoj7wm/pceLpqtsSwe59a2MNZKSOe
         93EAlyx6DfehE8YoK4mczOSlGxUXgboYWYg9nrDIbZBVcmniB/CF7q+KVdE0f6hTZOKz
         zbHAZ5yTmU7MofS9jlo0sZ4QhHZJJswvDeAf3a0jS2RytKcyhI/3SNL+09hR87VcDSmm
         rM7g==
X-Forwarded-Encrypted: i=1; AJvYcCUmwrTWhFYoi+vqDN8RS3pCcvUUKb9OnHWrrOnTIiN4UXWez6Wr+3GVTf1h//QvdTi8gg/ElUKqfUuP+JY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzKZVBefer9JZDNdftInZ1usUKjw4G/m4lASrZiMlaBsoeKwjTo
	udASO1CbBlmVcCQamC73G9X1hv+8QZoIPTdHrumFWs8YNxyQqSFSsbMtt3g75mIsXh4FhPI3t6k
	964a9t2GriYxbrN5diT3pmcxWp6wg8aZQW2Hm54o17t8uxO78NCG3wZPBu/9AC/ET1T8=
X-Gm-Gg: ASbGncu0uT7wYU45H18AgfiAp22itrAJRKcho6xhEirGlO6Ci7DYbqajLeBso0zHimU
	NCtUFOVO14AFkiEUtEfOYbKz8FlHEq9/XPTrDyYvnUPOxhDoEj3mvkO7kELrMDCMnMlNGFIbyuy
	x8dCgvN13MYq3z6qLxgvTIKLCGpvodf/sPUAjudcxEldusjJEVk4Q9CFadPACvbb8x9rmcRmkZ4
	YoHfukEcR4hum/VwkLBIJENahwfyjwi23uK93cxrTXby6obndU/fY9V//rGGLEJyubkNovoJGsy
	ZVFPpdH0X0+OIJdLAj+K76jhoIiRb6W0/G++MTu70b0Cskg+jzM2JkCO52IHU/HqkvhhxrZ6KXK
	eBtnZJQ==
X-Received: by 2002:a05:6000:1a88:b0:3b4:58ff:ed1 with SMTP id ffacd0b85a97d-3b4966267b8mr1677163f8f.52.1751624769056;
        Fri, 04 Jul 2025 03:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOt865rvlOHIOEECbMk+LvbVs6qEWcN/5MI9jLz/1+4Qw68QFcrUmFxGowYoL4Q/9NBp5iRA==
X-Received: by 2002:a05:6000:1a88:b0:3b4:58ff:ed1 with SMTP id ffacd0b85a97d-3b4966267b8mr1677111f8f.52.1751624768501;
        Fri, 04 Jul 2025 03:26:08 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285c90esm2150789f8f.91.2025.07.04.03.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:07 -0700 (PDT)
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
Subject: [PATCH v2 14/29] mm/migrate: remove __ClearPageMovable()
Date: Fri,  4 Jul 2025 12:25:08 +0200
Message-ID: <20250704102524.326966-15-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 2DcYZqqLCckcE24kbMLH_n9GKIZ7uQdT_Z1VPpIsdHg_1751624769
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Unused, let's remove it.

The Chinese docs in Documentation/translations/zh_CN/mm/page_migration.rst
still mention it, but that whole docs is destined to get outdated and
updated by somebody that actually speaks that language.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  8 ++------
 mm/compaction.c         | 11 -----------
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c99a00d4ca27d..6eeda8eb1e0d8 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -35,8 +35,8 @@ struct migration_target_control;
  * @src page.  The driver should copy the contents of the
  * @src page to the @dst page and set up the fields of @dst page.
  * Both pages are locked.
- * If page migration is successful, the driver should call
- * __ClearPageMovable(@src) and return MIGRATEPAGE_SUCCESS.
+ * If page migration is successful, the driver should
+ * return MIGRATEPAGE_SUCCESS.
  * If the driver cannot migrate the page at the moment, it can return
  * -EAGAIN.  The VM interprets this as a temporary migration failure and
  * will retry it later.  Any other error value is a permanent migration
@@ -106,16 +106,12 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 #ifdef CONFIG_COMPACTION
 bool PageMovable(struct page *page);
 void __SetPageMovable(struct page *page, const struct movable_operations *ops);
-void __ClearPageMovable(struct page *page);
 #else
 static inline bool PageMovable(struct page *page) { return false; }
 static inline void __SetPageMovable(struct page *page,
 		const struct movable_operations *ops)
 {
 }
-static inline void __ClearPageMovable(struct page *page)
-{
-}
 #endif
 
 static inline
diff --git a/mm/compaction.c b/mm/compaction.c
index 17455c5a4be05..889ec696ba96a 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -137,17 +137,6 @@ void __SetPageMovable(struct page *page, const struct movable_operations *mops)
 }
 EXPORT_SYMBOL(__SetPageMovable);
 
-void __ClearPageMovable(struct page *page)
-{
-	VM_BUG_ON_PAGE(!PageMovable(page), page);
-	/*
-	 * This page still has the type of a movable page, but it's
-	 * actually not movable any more.
-	 */
-	page->mapping = (void *)PAGE_MAPPING_MOVABLE;
-}
-EXPORT_SYMBOL(__ClearPageMovable);
-
 /* Do not skip compaction more than 64 times */
 #define COMPACT_MAX_DEFER_SHIFT 6
 
-- 
2.49.0


