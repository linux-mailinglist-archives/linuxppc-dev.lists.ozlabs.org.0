Return-Path: <linuxppc-dev+bounces-13096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 259B1BF699D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:00:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXSq4fw1z3dTf;
	Tue, 21 Oct 2025 23:59:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051595;
	cv=none; b=B1Q8qWqV+3gv0URiywpzJIX6TtE3O/+8/3wbtrIQ1MiCWlsaNT6XVkw9XXU6ELgtsnpWgeoJZqxRVCoeAdyi3XYEQnMedlIaicBeo/RlQQCSWI0t+HS2+mb9gWs6e7DHUs95MDuLPYVTCJCa1FP7llqVKgumSG88sJre2ZSa4vcebtn7yvaTkivdpg2aE85U7R+ouebFtK3KVYbSE7Pt79sAYQMuS50LYIf2k6NVB5PgQCJitAsC9xZ8EblmWhlLwaz/QJ112ejY8XjFoGQVGRkiH3lAwlwxjlHoK9OZqKfade4H7AC2yF8U7yWK3KwBDwfDcJ8yeMb9L/H5ajL1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051595; c=relaxed/relaxed;
	bh=z5VcU60xQeN7ydJcNuOrJoqdazEeOf9bmMF6YJ9dhbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=HIL6XRW2IGmv/UrLZR85W93HnEvnLOv7S8E4q9uLsX8sUbTtiwfHvEnqQaNq/aXPORORWTENr7BZZ0jm49mPSbHSH9lgkheneekcZHZkIpzrKwAuTxbW1qmPoWSgcN+2C6b3CqJPQjsI3gQwQxqtzB8Oh2hsSDiI/OsOueCmeUa0VtjOCCL/RnLvV3SnQPrcLgKqcZN5lB7wF9suAW1BEhW30o2NnDTIW+I4G9CmY006ZiM/5rYZc/8MuGJ/SsRlg1CiAEdzXYaiVCteySGRzURCBzMGHXYN3OqwlKCdfQsASoGB1vvvphJXuVvly9+yWrlx5a1xTdm6IQVPwk6q8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vnwku5BP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IzvnESS6; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vnwku5BP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IzvnESS6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXSp6NFrz3c5b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 23:59:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5VcU60xQeN7ydJcNuOrJoqdazEeOf9bmMF6YJ9dhbk=;
	b=Vnwku5BPKWOPAdq0Grdr+r2UexSBw6Sflmeiyh7zytJg4r8R5Djf56SszLrnjn8ni+cN5d
	boFMUnDL3/8zbaH0OX5v++xMKAxUjHJ8wDVhMDI9awj6HY0KeZ+Typr3LnCW+fDP/pz6Wm
	JeJspvjLFLGYmqF4ogjHWd1ZCLQCB8U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5VcU60xQeN7ydJcNuOrJoqdazEeOf9bmMF6YJ9dhbk=;
	b=IzvnESS6Kx1lMzaZRH9+2t7BolbzghkMeIvymZNTxKyapNa4ZM8wRFNDGjoXDxSxsNzP3g
	mVj2B90rXzUDiu90ONC4uyI1qw82dkkavcPzZdkHMJjTRt8MV14pB030sppawsPUmixsqS
	Q3DrkoGewjIMQfIH5Qw7dcRcq75Ooas=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-ipq15a4HP4KerjwV2aKfsw-1; Tue, 21 Oct 2025 08:59:49 -0400
X-MC-Unique: ipq15a4HP4KerjwV2aKfsw-1
X-Mimecast-MFC-AGG-ID: ipq15a4HP4KerjwV2aKfsw_1761051588
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47107fcb257so77727225e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051588; x=1761656388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5VcU60xQeN7ydJcNuOrJoqdazEeOf9bmMF6YJ9dhbk=;
        b=CQKJf9OXGkCmycf5OTMNYanJX81BLaL7HQQrrnHzxhZxR5V6Axip+bK9tEgt+/qitN
         BriwhahBjrP4dYjiWwn0UFqth4ARPRXQEjyYqZ8Rd2aEVZ7sVFHukDQd9ULJHMpaNrsj
         s3FR96u5FKe5WLEVr1kmrN9MweGcVMmD1lH0ghcHWn6DoOiVWptWNftR+9XAdZRwVwmZ
         wtu/Q5CFJx3QDv6Tp9fz5lZLTKSjuajozi9+0yzqKPYGnbvrz58FN62hw0sBWwrvnIeD
         s5iwGSWjSF1030WGWj2uoET86TfqJSg+3crqE/+kvTD8yokiSSqQ9yQNDO2E7L+B/KQ4
         52OA==
X-Forwarded-Encrypted: i=1; AJvYcCUoIAaler7utuTSWSGvSvZQPCB+jYKY5BG6hTtStM0uFz2a6fZ6TLZDUe6GRrr/YuWNMV39bO6sPh0+wZU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwC6e4qH+njkUjei493IR7d3FD/4irQiY8vdFF14vmQvB0QFetq
	UyGolbrLI9ZurE12cuEszoWVnDHeALuYvS3Qz3d7UXZ5fBBbnqlgFyCAkq78PVJpSDmgZy3SNwD
	OgcyWibAXB4+pNGEv4Scnmc9M6W0Qd26UnbjC1QsbkwMiUZswdkQl+A4Hz0jkw9XQhic=
X-Gm-Gg: ASbGncui2OUcNiuv+rNo8AD9AVHSwfcwsCti9ngn9nBUu+RM2z168p7m78clSVBCT8x
	0C+l1W/ndpRYjdkD0WWKz2GjcsDsVIjtSATlFwfc+qG9AgO3n3WVJHEi3X4vMjHI2H7Z7Gq7h0Y
	M+xpHjY53dcxzTe9hbINyIdu2LqpcjM8oGwU9Q8w+M5/UiFgSMmLsV2C+sK4rbE69PsQbWnhSzw
	D998Dz6/dBulha2MNK84bwasrJMU++jiHtHsRpWKehCAxcYByRIZPYi5WIeKHTYBHXDNgSrCxqk
	K0nRTrJo73VHS4JUpA18Tfa0yO7/BqVtrNrK5gloFvhGW98kLBX6kDtvJuKZFnn0tJefEjq1LOo
	fG55kpf5A3b6Evd17KdzZZJRTSdMt+wcIJUUNziWAw3+jCO45qXafDU668Vne
X-Received: by 2002:a05:600c:45ca:b0:46e:59dd:1b4d with SMTP id 5b1f17b1804b1-471178a4bb0mr123277975e9.16.1761051588088;
        Tue, 21 Oct 2025 05:59:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHERIP76djccuxwEVDdc3jxl3cHQS1Z1VLDzbGDsvVWwgXU4e20hoqSfb9F5zq9YX0z7BLvwQ==
X-Received: by 2002:a05:600c:45ca:b0:46e:59dd:1b4d with SMTP id 5b1f17b1804b1-471178a4bb0mr123277565e9.16.1761051587656;
        Tue, 21 Oct 2025 05:59:47 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471556e17afsm190432085e9.17.2025.10.21.05.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:47 -0700 (PDT)
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
Subject: [PATCH v1 07/23] mm/balloon_compaction: use a device-independent balloon (list) lock
Date: Tue, 21 Oct 2025 14:59:12 +0200
Message-ID: <20251021125929.377194-8-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: kunDaFXt224JNhL3Gx6TcMkvOBYi7599RNFNcUz3OEA_1761051588
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In order to remove the dependency on the page lock for balloon
pages, we need a lock that is independent of the page.

It's crucial that we can handle the scenario where balloon deflation
(clearing page->private) can race with page isolation (using
page->private to obtain the balloon_dev_info where the lock currently
resides).

The current lock in balloon_dev_info is therefore not suitable.

Fortunately, we never really have more than a single balloon device
per VM, so we can just keep it simple and use a static lock to protect
all balloon devices.

Based on this change we will remove the dependency on the page lock
next.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h |  6 ++---
 mm/balloon_compaction.c            | 36 +++++++++++++++++-------------
 2 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 3109d3c43d306..e2d9eb40e1fbb 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -21,10 +21,10 @@
  *   i. Setting the PG_movable_ops flag and page->private with the following
  *	lock order
  *	    +-page_lock(page);
- *	      +--spin_lock_irq(&b_dev_info->pages_lock);
+ *	      +--spin_lock_irq(&balloon_pages_lock);
  *
  *  ii. isolation or dequeueing procedure must remove the page from balloon
- *      device page list under b_dev_info->pages_lock.
+ *      device page list under &balloon_pages_lock
  *
  * The functions provided by this interface are placed to help on coping with
  * the aforementioned balloon page corner case, as well as to ensure the simple
@@ -52,7 +52,6 @@
  */
 struct balloon_dev_info {
 	unsigned long isolated_pages;	/* # of isolated pages for migration */
-	spinlock_t pages_lock;		/* Protection to pages list */
 	struct list_head pages;		/* Pages enqueued & handled to Host */
 	int (*migratepage)(struct balloon_dev_info *, struct page *newpage,
 			struct page *page, enum migrate_mode mode);
@@ -71,7 +70,6 @@ extern size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 {
 	balloon->isolated_pages = 0;
-	spin_lock_init(&balloon->pages_lock);
 	INIT_LIST_HEAD(&balloon->pages);
 	balloon->migratepage = NULL;
 	balloon->adjust_managed_page_count = false;
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index fd9ec47cf4670..97e838795354d 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -11,6 +11,12 @@
 #include <linux/export.h>
 #include <linux/balloon_compaction.h>
 
+/*
+ * Lock protecting the balloon_dev_info of all devices. We don't really
+ * expect more than one device.
+ */
+static DEFINE_SPINLOCK(balloon_pages_lock);
+
 static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
 				     struct page *page)
 {
@@ -47,13 +53,13 @@ size_t balloon_page_list_enqueue(struct balloon_dev_info *b_dev_info,
 	unsigned long flags;
 	size_t n_pages = 0;
 
-	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	spin_lock_irqsave(&balloon_pages_lock, flags);
 	list_for_each_entry_safe(page, tmp, pages, lru) {
 		list_del(&page->lru);
 		balloon_page_enqueue_one(b_dev_info, page);
 		n_pages++;
 	}
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 	return n_pages;
 }
 EXPORT_SYMBOL_GPL(balloon_page_list_enqueue);
@@ -83,7 +89,7 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 	unsigned long flags;
 	size_t n_pages = 0;
 
-	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	spin_lock_irqsave(&balloon_pages_lock, flags);
 	list_for_each_entry_safe(page, tmp, &b_dev_info->pages, lru) {
 		if (n_pages == n_req_pages)
 			break;
@@ -106,7 +112,7 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 		dec_node_page_state(page, NR_BALLOON_PAGES);
 		n_pages++;
 	}
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 
 	return n_pages;
 }
@@ -149,9 +155,9 @@ void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	spin_lock_irqsave(&balloon_pages_lock, flags);
 	balloon_page_enqueue_one(b_dev_info, page);
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 }
 EXPORT_SYMBOL_GPL(balloon_page_enqueue);
 
@@ -191,11 +197,11 @@ struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info)
 		 * BUG() here, otherwise the balloon driver may get stuck in
 		 * an infinite loop while attempting to release all its pages.
 		 */
-		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+		spin_lock_irqsave(&balloon_pages_lock, flags);
 		if (unlikely(list_empty(&b_dev_info->pages) &&
 			     !b_dev_info->isolated_pages))
 			BUG();
-		spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+		spin_unlock_irqrestore(&balloon_pages_lock, flags);
 		return NULL;
 	}
 	return list_first_entry(&pages, struct page, lru);
@@ -213,10 +219,10 @@ static bool balloon_page_isolate(struct page *page, isolate_mode_t mode)
 	if (!b_dev_info)
 		return false;
 
-	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	spin_lock_irqsave(&balloon_pages_lock, flags);
 	list_del(&page->lru);
 	b_dev_info->isolated_pages++;
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 
 	return true;
 }
@@ -230,10 +236,10 @@ static void balloon_page_putback(struct page *page)
 	if (WARN_ON_ONCE(!b_dev_info))
 		return;
 
-	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	spin_lock_irqsave(&balloon_pages_lock, flags);
 	list_add(&page->lru, &b_dev_info->pages);
 	b_dev_info->isolated_pages--;
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 }
 
 static int balloon_page_migrate(struct page *newpage, struct page *page,
@@ -253,7 +259,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	rc = b_dev_info->migratepage(b_dev_info, newpage, page, mode);
 	switch (rc) {
 	case 0:
-		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+		spin_lock_irqsave(&balloon_pages_lock, flags);
 
 		/* Insert the new page into the balloon list. */
 		get_page(newpage);
@@ -272,7 +278,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 		}
 		break;
 	case -ENOENT:
-		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+		spin_lock_irqsave(&balloon_pages_lock, flags);
 
 		/* Old page was deflated but new page not inflated. */
 		__count_vm_event(BALLOON_DEFLATE);
@@ -285,7 +291,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	}
 
 	b_dev_info->isolated_pages--;
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 
 	/* Free the now-deflated page we isolated in balloon_page_isolate(). */
 	balloon_page_finalize(page);
-- 
2.51.0


