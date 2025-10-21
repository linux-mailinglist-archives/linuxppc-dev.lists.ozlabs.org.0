Return-Path: <linuxppc-dev+bounces-13095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B80BF698E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:00:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXSm2NKFz3cZg;
	Tue, 21 Oct 2025 23:59:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051592;
	cv=none; b=RFppxB+SLZfetwAwp6coemlnyPpEls8OrkYwAGyO4UMPMZkWqCz6jeZghd2Q4FP9ti3VUa+Pqtod2kB4FJv30Ll3wtpNzqE+XqsgbUPkJiqK4Jwnqe8GNI7nCwk2IZi3aOL/NQvWXUs+X9vJ+QwPNpCfNPnPLGdk6ZtBQrqX0Gu4C6LLVo9wr5kVf+xIU7EEhNlaGWPbgaMaB9m90/H9BKYd0ULUc2PGh1UoLfQ9S91TJ6eUacLMoJlUh6v0+0dlfAxY4CPFsY/SkyBHOpx3yeQbx8AVlhnkMebHbGTJ8zAbxeTJQQDy27qj5nbS6Cyoie1aQkOciAuSSbONlyDHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051592; c=relaxed/relaxed;
	bh=sUyqikpnRIZJJ7+CBYLr21ot5Ik6tImIDaS0WggNCzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=O6hk+L+wDC+jBFey807nq17e/SS3p0VKeAlfJaBc47vg9wCaH5+pIaiDyzel/Tkj2uk5zJSDH7R6pkgpC0O2nxRnQV0+pcAVMYcRW6paGxK/iGXSHhAdEsVum4qYvLJTc6EUAy/fclyDn973Ufg8UYPScFLk9uKzZOXK+prjwhIrab8iuOl1zJ74jQ/6Yu4XeXVVfIo6iqHdng5JUKXZynkg8+TVsNg40psh+qoZvBlcaQFrMhxPqFtavugy04uX8nF9/xY3XHc2wHYkZ33bth3fm9EP6v5mJg6ukDBS/UiTJ1XaKV65O3m3ZHSrB129gcukYamlLTnZ94dl/NcZZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L8E5Ey5/; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L8E5Ey5/; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L8E5Ey5/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L8E5Ey5/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXSl3Q7Xz3cZZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 23:59:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUyqikpnRIZJJ7+CBYLr21ot5Ik6tImIDaS0WggNCzg=;
	b=L8E5Ey5/IbOLpLi+Xco8mKfedcmTLgEjBLb/Bhsrfx8v9IpExu8896wemDS/VsEcYUosmG
	EIAl6y/8QfB+EIaS3Net9eHmLnCBr8I77wS9H1s+4OXov+LApPCzMwWsNRTRrWOV18d185
	KN5c11mnhS8AeUZTpZgnE09MF+nnQz0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUyqikpnRIZJJ7+CBYLr21ot5Ik6tImIDaS0WggNCzg=;
	b=L8E5Ey5/IbOLpLi+Xco8mKfedcmTLgEjBLb/Bhsrfx8v9IpExu8896wemDS/VsEcYUosmG
	EIAl6y/8QfB+EIaS3Net9eHmLnCBr8I77wS9H1s+4OXov+LApPCzMwWsNRTRrWOV18d185
	KN5c11mnhS8AeUZTpZgnE09MF+nnQz0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-ky49H-8IPM2if6HcJRDGEQ-1; Tue, 21 Oct 2025 08:59:44 -0400
X-MC-Unique: ky49H-8IPM2if6HcJRDGEQ-1
X-Mimecast-MFC-AGG-ID: ky49H-8IPM2if6HcJRDGEQ_1761051584
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47106720618so34994305e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051583; x=1761656383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUyqikpnRIZJJ7+CBYLr21ot5Ik6tImIDaS0WggNCzg=;
        b=cWwV3djjMGc0j0MZ/JKYKHbSdMQ5cv0a2QIg44PDmpyeD5/ABWoBrVTHoOsl1+nItM
         fiW1TZYj09fsGESRCAD6IlCavPQJhG5Dtz3eVHH+RBRqC/UI73yZMXA7p3ErahYUvdoG
         zu5zV0h+rPMNEUd+mVNmdZuvTo6NzMZ4FcaPuIhCHDZLrtoFB7EFqOro1ETyDqRQAFX0
         a9CJX/OYiIE2AflHAcMWXweW0UVntc1Gp9/LnUfNs5sQe4Lxr6IP9ITr5tR/N37H+3vY
         rGgB9P0hzux6iQXuZx2WHUNxoyMkqIOjLEcY+P6zyDfHFvSD7TpImw+00UlKRTd8CZ+5
         Dgqw==
X-Forwarded-Encrypted: i=1; AJvYcCVGXdmIqbCKgh7XWhbu3hNR8stHWHVMlsis0yz9gYMxx4yr/TN0wJVmx7fKhzUVxsd4DkW+xlHHGtx9UT8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzQU3VCvMxIAdFaAnAHRLQwabUUOxPUyehxvn8QI2LgBo0VlvRE
	REHvi8q4ACwnIkF8YpGywxV/gfTTpLpS5T/tJISriaz5e3sYf20B6p1ashUrk90WmWaR0kpETDp
	IzJvLhTI0BoUkuseMFOVP5kSJcpACtKEazlOif5Ncm2h2R55Fl7Q9fMhI+r7NVq6XDoU=
X-Gm-Gg: ASbGncvSBcUDCD/Sc/C5HPDux+pKvNs3lPpGkfRha/CvRNbff7mYeAGdxtykrsfmk7p
	TRVHDlp49hrZSU0byxHpNXfWEJiQYPb10LIIMP9w9eyHjajXN0qgreYcKTP5NDUSBKYBrPxABuB
	YDJGqk5MQTIv+sDCr1RDVZSXeWXOaFJ/2NEo8a62pJqZy6cwIxZCFtIK4MmSc2j6YyGjtvG3zE9
	lq1iHOFR/oIDL61ZkIEevlQ7QFWiqxxHI+Ddet6nD1vk6KUmZ4zmR/YTS70Wk37copA1gDIoQDV
	/tIav6BH80Gj8L70r0eMSsvM+SG6+8vtWVzKw7/DehQF/FtGnqiw2ryUquKNSekynTPmfeKDJcW
	lF8cjAgnZn2UUPA5IvgRIk5YKu51Ys7l503a0EWCnoF7Og2JrvQ5glagHKYc0
X-Received: by 2002:a05:6000:26d1:b0:3ec:db0a:464c with SMTP id ffacd0b85a97d-42704dc94a0mr12883686f8f.44.1761051583498;
        Tue, 21 Oct 2025 05:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQe5sfmvBNGfARqbQvLIETNCNFniX0I3Wgmf7ZO8nqCKClSavcBGyNI7STnbkUGhrMC20EJA==
X-Received: by 2002:a05:6000:26d1:b0:3ec:db0a:464c with SMTP id ffacd0b85a97d-42704dc94a0mr12883652f8f.44.1761051583045;
        Tue, 21 Oct 2025 05:59:43 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5b3acfsm20082945f8f.14.2025.10.21.05.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:42 -0700 (PDT)
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
Subject: [PATCH v1 05/23] mm/balloon_compaction: centralize adjust_managed_page_count() handling
Date: Tue, 21 Oct 2025 14:59:10 +0200
Message-ID: <20251021125929.377194-6-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: J33XPe1cGiejXTDHneXV6NvjJpB1feaur3cSPxeu9Ks_1761051584
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's centralize it, by allowing for the driver to enable this handling
through a new flag (bool for now) in the balloon device info.

Note that we now adjust the counter when adding/removing a page into the
balloon list: when removing a page to deflate it, it will now happen
before the driver communicated with hypervisor, not afterwards.

This shouldn't make a difference in practice.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 13 +------------
 drivers/virtio/virtio_balloon.c      | 19 ++-----------------
 include/linux/balloon_compaction.h   |  2 ++
 mm/balloon_compaction.c              | 17 +++++++++++++++++
 4 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 07b21d2bc8a78..9ed71683ae402 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -165,7 +165,6 @@ static long cmm_alloc_pages(long nr)
 
 		balloon_page_enqueue(&b_dev_info, page);
 		atomic_long_inc(&loaned_pages);
-		adjust_managed_page_count(page, -1);
 		nr--;
 	}
 
@@ -190,7 +189,6 @@ static long cmm_free_pages(long nr)
 		if (!page)
 			break;
 		plpar_page_set_active(page);
-		adjust_managed_page_count(page, 1);
 		__free_page(page);
 		atomic_long_dec(&loaned_pages);
 		nr--;
@@ -515,16 +513,6 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 		return -EBUSY;
 	}
 
-	/*
-	 * When we migrate a page to a different zone, we have to fixup the
-	 * count of both involved zones as we adjusted the managed page count
-	 * when inflating.
-	 */
-	if (page_zone(page) != page_zone(newpage)) {
-		adjust_managed_page_count(page, 1);
-		adjust_managed_page_count(newpage, -1);
-	}
-
 	/*
 	 * activate/"deflate" the old page. We ignore any errors just like the
 	 * other callers.
@@ -551,6 +539,7 @@ static int cmm_init(void)
 		return -EOPNOTSUPP;
 
 	balloon_devinfo_init(&b_dev_info);
+	b_dev_info.adjust_managed_page_count = true;
 	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
 		b_dev_info.migratepage = cmm_migratepage;
 
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 8969271581bca..f7d6a4a6e54f5 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -274,9 +274,6 @@ static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
 
 		set_page_pfns(vb, vb->pfns + vb->num_pfns, page);
 		vb->num_pages += VIRTIO_BALLOON_PAGES_PER_PAGE;
-		if (!virtio_has_feature(vb->vdev,
-					VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
-			adjust_managed_page_count(page, -1);
 		vb->num_pfns += VIRTIO_BALLOON_PAGES_PER_PAGE;
 	}
 
@@ -295,9 +292,6 @@ static void release_pages_balloon(struct virtio_balloon *vb,
 	struct page *page, *next;
 
 	list_for_each_entry_safe(page, next, pages, lru) {
-		if (!virtio_has_feature(vb->vdev,
-					VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
-			adjust_managed_page_count(page, 1);
 		list_del(&page->lru);
 		put_page(page); /* balloon reference */
 	}
@@ -839,17 +833,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 	if (!mutex_trylock(&vb->balloon_lock))
 		return -EAGAIN;
 
-	/*
-	  * When we migrate a page to a different zone and adjusted the
-	  * managed page count when inflating, we have to fixup the count of
-	  * both involved zones.
-	  */
-	if (!virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM) &&
-	    page_zone(page) != page_zone(newpage)) {
-		adjust_managed_page_count(page, 1);
-		adjust_managed_page_count(newpage, -1);
-	}
-
 	/* balloon's page migration 1st step  -- inflate "newpage" */
 	vb->num_pfns = VIRTIO_BALLOON_PAGES_PER_PAGE;
 	set_page_pfns(vb, vb->pfns, newpage);
@@ -958,6 +941,8 @@ static int virtballoon_probe(struct virtio_device *vdev)
 	if (err)
 		goto out_free_vb;
 
+	if (!virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
+		vb->vb_dev_info.adjust_managed_page_count = true;
 #ifdef CONFIG_BALLOON_COMPACTION
 	vb->vb_dev_info.migratepage = virtballoon_migratepage;
 #endif
diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 7cfe48769239e..3109d3c43d306 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -56,6 +56,7 @@ struct balloon_dev_info {
 	struct list_head pages;		/* Pages enqueued & handled to Host */
 	int (*migratepage)(struct balloon_dev_info *, struct page *newpage,
 			struct page *page, enum migrate_mode mode);
+	bool adjust_managed_page_count;
 };
 
 extern struct page *balloon_page_alloc(void);
@@ -73,6 +74,7 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 	spin_lock_init(&balloon->pages_lock);
 	INIT_LIST_HEAD(&balloon->pages);
 	balloon->migratepage = NULL;
+	balloon->adjust_managed_page_count = false;
 }
 
 #ifdef CONFIG_BALLOON_COMPACTION
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 5444c61bb9e76..fd9ec47cf4670 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -23,6 +23,8 @@ static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
 	BUG_ON(!trylock_page(page));
 	balloon_page_insert(b_dev_info, page);
 	unlock_page(page);
+	if (b_dev_info->adjust_managed_page_count)
+		adjust_managed_page_count(page, -1);
 	__count_vm_event(BALLOON_INFLATE);
 	inc_node_page_state(page, NR_BALLOON_PAGES);
 }
@@ -95,6 +97,8 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 			continue;
 
 		list_del(&page->lru);
+		if (b_dev_info->adjust_managed_page_count)
+			adjust_managed_page_count(page, 1);
 		balloon_page_finalize(page);
 		__count_vm_event(BALLOON_DEFLATE);
 		list_add(&page->lru, pages);
@@ -256,12 +260,25 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 
 		balloon_page_insert(b_dev_info, newpage);
 		__count_vm_event(BALLOON_MIGRATE);
+
+		if (b_dev_info->adjust_managed_page_count &&
+		    page_zone(page) != page_zone(newpage)) {
+			/*
+			 * When we migrate a page to a different zone we
+			 * have to fixup the count of both involved zones.
+			 */
+			adjust_managed_page_count(page, 1);
+			adjust_managed_page_count(newpage, -1);
+		}
 		break;
 	case -ENOENT:
 		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 
 		/* Old page was deflated but new page not inflated. */
 		__count_vm_event(BALLOON_DEFLATE);
+
+		if (b_dev_info->adjust_managed_page_count)
+			adjust_managed_page_count(page, 1);
 		break;
 	default:
 		return rc;
-- 
2.51.0


