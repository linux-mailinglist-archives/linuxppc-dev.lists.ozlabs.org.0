Return-Path: <linuxppc-dev+bounces-13105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9E0BF69F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:02:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXTL1GJ1z3dXM;
	Wed, 22 Oct 2025 00:00:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051622;
	cv=none; b=e1vxufbbo3D7lfF7Ervwz0WmqBVWrxCrcVNug4ySkfcIrmV5P/8sx+jjIecRIT1T53ENOKK3PQ0zySt4yN8Tm960s+aVEKgrJHfv9541V3JA36oTlr9hnHU9HzjbKRPEgSMCTLhHFnGGObi9gXMF//oimz/cZRtVP7bguLUnQXI1K49ei8d+OsROEPBZNnKZKNSjGY1Rb+Uhv+k/5JX0BRHdfT3oLktVlZ0MzUmwIjjPfq8iepmxydkJcx7djZDuTzqNOnCAilrXNfghdpn63OMzwyq2WM74kNqaQGVRneKWU4MRh/MpR2A29waURNe7aiSdbPBeuvX9z004dwadEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051622; c=relaxed/relaxed;
	bh=O+OTVNr68Ud6e3V7gLc8dmSyyby2S+Q4hsUbFdDpNzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=R2kVCormDJIGjwRY7yJJpmsp/Xece+CGXxdwFE5Z+WdKd+Q/I3bqGApIydNTc8LF6XbMgNh0wgedlXfXsTO8+Cj3ufn2TyYnrMuOmfuxxZOq/3POq3k7qwx1AzQynuI6cWbdp8jYBsk9tlKwNgz/hFZg/uF+mnAk52BWm3Q3dw/xcj0H5nSUwR5rysMzvU85MxMkbisTxSXYESwaFuk6oHF9yd5T+fyzMAW7H334c/PKsN6AvAdetfWGo9OWcDG9fRYDmxJRNDoOfjd08My+rh5k/za2lvzVs0BEMTj3OijufnQP6F8rWTsnkbm83YRfXMBmnK7zg/T3grH2GCvYPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DHLneQ0F; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UkpcTOxM; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DHLneQ0F;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UkpcTOxM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXTK22g4z30MY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 00:00:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+OTVNr68Ud6e3V7gLc8dmSyyby2S+Q4hsUbFdDpNzM=;
	b=DHLneQ0FofCvURi6Oe1IAr3/K8Syj/Cm9IPfXNINEyd5aaa4LJpVQ2Vyu95ls3Zgaa3IoD
	af6bfLwIH9wJlkmcxwIViCjCuPoch4NBpW5+KTywe/09u2efRShmpW59nRGfVwaz6pRonj
	I9EyPCYETfUWSViao4niUKawCkiRD3w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+OTVNr68Ud6e3V7gLc8dmSyyby2S+Q4hsUbFdDpNzM=;
	b=UkpcTOxMKnQ22b11m3nm3sAVjhwWFkhCP7lGq62ogW8EXRL11nu07ugGtfnv83lMYa1v3G
	FvsHr3/ZrcA3GGGVh32RRbvkFH6NnkRMg5S8UdVfodisgFJibEkt1jW19EZ7KvvLFmpXGV
	pc8pdMmJ1jb6bpq3VUVfPhz0OEE2FxU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-hJVX9L13N36SlmVSvMue6Q-1; Tue, 21 Oct 2025 09:00:17 -0400
X-MC-Unique: hJVX9L13N36SlmVSvMue6Q-1
X-Mimecast-MFC-AGG-ID: hJVX9L13N36SlmVSvMue6Q_1761051616
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-63c13013adeso6823303a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 06:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051616; x=1761656416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+OTVNr68Ud6e3V7gLc8dmSyyby2S+Q4hsUbFdDpNzM=;
        b=iP7NZ4S50/Mw32VDf+sZiqAtSBvFpF7QC613KoYGAqzCdo1doe3bjBpUfpqVubaGcw
         uT7rY6cUHOCAC+dj/jrclKGnFcRsiysXdiiKT79RcZxSIHwrsKEQsmqV7YE7bHN/ECA9
         fyxPuNCrJtlVnMJlSHmm+7GLuE7uQI48QK9hnC5iKmJ7zi/69NxaBdLWUieKakLFKQ8S
         ox4OCpGEKKjYthcYD8bRdjaXc5D0lgTremX/JA9b4HzE4wdifUB/uTbPpmVKrG8DzbIv
         qg1xLCA7NyFOJytP6nF1OAlUroiH9EkDbN9dSb4ZL00y6qqoBVoZiinXeQyVp94UAMLZ
         G4eA==
X-Forwarded-Encrypted: i=1; AJvYcCUbRBPfhbatogEsvg7K5JgZZwLaUVBsIt/WiyZSc/zRuIoiYfBhkw/nsPRlbVlGHfRHS+snJbx34ewc4R0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFrvXp3qHfLTXYR7RcPtb6MJPhzsGFFckey6KXE9dJbfSIt1do
	rPy4cThzZ9o/xy/WrTOd69NKspJ2a+LTHNMRKuf0X6fJ1iOrV3T6Dbsu0qQq/evIZk/AhRX9ZUa
	LROwN4BzZSh8AShqb0UJlc+93i/klZMg8WrdbaT7b3TsZglsUTFj+U3MeHugR4J7kHxs=
X-Gm-Gg: ASbGnctfUKRqyuP64frvdR83hgmkZ3iSQflOq3/6SSnykhsMhy9BhbSgF6h06Ud+NpK
	3MscgbcRS8xH7NboTkPwE7FGHFmTfyH//e5SDQxn1GrJqPirKdl5uIJu02zDlOscL7V03lS4F5B
	S9YTIXlXNRHc2BGHHiFcv10rxqSaOCbxPG5orMv/1YW62u0RWZay/T3+spWPhKT7iXcQ66N8tec
	1X97+wPRmKPlBo8SbIgGN8YIw6M33oBfNFoAaDZ2Lxt96pDg40+FgHzUadKwMn5A4TDopwg5XPw
	OV/ql+MdXDmZzcw/jomObFnGcbZEnmtdBQmZuvuFX7xOJMjPB+hbEhHKH7yvq25ouuS1+djOXy9
	jaMekqpKhHXgfBJopv8tPpSBe6WKvqqQxTo2cP8DnuxEQHi5Bi3cATVVyBLK4
X-Received: by 2002:a05:600c:3b8d:b0:46d:27b7:e7e5 with SMTP id 5b1f17b1804b1-47117917572mr150179065e9.32.1761051604300;
        Tue, 21 Oct 2025 06:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZFp/NfFGh9nzvdan/GtiYx6zHPVXBd5PXGxqlBj7uT7XLqj1hdDZYgamMo86fNe5GicJaNA==
X-Received: by 2002:a05:600c:3b8d:b0:46d:27b7:e7e5 with SMTP id 5b1f17b1804b1-47117917572mr150178725e9.32.1761051603807;
        Tue, 21 Oct 2025 06:00:03 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47114423862sm283718595e9.1.2025.10.21.06.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:00:03 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v1 14/23] mm/balloon_compaction: move internal helpers to memory_compaction.c
Date: Tue, 21 Oct 2025 14:59:19 +0200
Message-ID: <20251021125929.377194-15-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021125929.377194-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: XpIgEAFmYLAO_mDYWHlsv9SmKAhzE4oC7sXGz8i5eFw_1761051616
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's move the helpers that are not required by drivers anymore.

While at it, drop the doc of balloon_page_device() as it is trivial.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 44 ------------------------------
 mm/balloon_compaction.c            | 38 ++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 44 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index d1d4739398978..eec8994056a44 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -75,48 +75,4 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 	balloon->migratepage = NULL;
 	balloon->adjust_managed_page_count = false;
 }
-
-#ifdef CONFIG_BALLOON_COMPACTION
-/*
- * balloon_page_device - get the b_dev_info descriptor for the balloon device
- *			 that enqueues the given page.
- */
-static inline struct balloon_dev_info *balloon_page_device(struct page *page)
-{
-	return (struct balloon_dev_info *)page_private(page);
-}
-#endif /* CONFIG_BALLOON_COMPACTION */
-
-/*
- * balloon_page_insert - insert a page into the balloon's page list and make
- *			 the page->private assignment accordingly.
- * @balloon : pointer to balloon device
- * @page    : page to be assigned as a 'balloon page'
- *
- * Caller must ensure the balloon_pages_lock is held.
- */
-static inline void balloon_page_insert(struct balloon_dev_info *balloon,
-				       struct page *page)
-{
-	__SetPageOffline(page);
-	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
-		SetPageMovableOps(page);
-		set_page_private(page, (unsigned long)balloon);
-	}
-	list_add(&page->lru, &balloon->pages);
-}
-
-/*
- * balloon_page_finalize - prepare a balloon page that was removed from the
- *			   balloon list for release to the page allocator
- * @page: page to be released to the page allocator
- *
- * Caller must ensure the balloon_pages_lock is held.
- */
-static inline void balloon_page_finalize(struct page *page)
-{
-	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
-		set_page_private(page, 0);
-	/* PageOffline is sticky until the page is freed to the buddy. */
-}
 #endif /* _LINUX_BALLOON_COMPACTION_H */
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 709c57c00b481..717bc43732d09 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -17,6 +17,44 @@
  */
 static DEFINE_SPINLOCK(balloon_pages_lock);
 
+static inline struct balloon_dev_info *balloon_page_device(struct page *page)
+{
+	return (struct balloon_dev_info *)page_private(page);
+}
+
+/*
+ * balloon_page_insert - insert a page into the balloon's page list and make
+ *			 the page->private assignment accordingly.
+ * @balloon : pointer to balloon device
+ * @page    : page to be assigned as a 'balloon page'
+ *
+ * Caller must ensure the balloon_pages_lock is held.
+ */
+static inline void balloon_page_insert(struct balloon_dev_info *balloon,
+				       struct page *page)
+{
+	__SetPageOffline(page);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
+		SetPageMovableOps(page);
+		set_page_private(page, (unsigned long)balloon);
+	}
+	list_add(&page->lru, &balloon->pages);
+}
+
+/*
+ * balloon_page_finalize - prepare a balloon page that was removed from the
+ *			   balloon list for release to the page allocator
+ * @page: page to be released to the page allocator
+ *
+ * Caller must ensure the balloon_pages_lock is held.
+ */
+static inline void balloon_page_finalize(struct page *page)
+{
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		set_page_private(page, 0);
+	/* PageOffline is sticky until the page is freed to the buddy. */
+}
+
 static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
 				     struct page *page)
 {
-- 
2.51.0


