Return-Path: <linuxppc-dev+bounces-13093-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 497B6BF6982
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:00:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXSj6Y37z3c5f;
	Tue, 21 Oct 2025 23:59:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051589;
	cv=none; b=nTDwQFZzxL6JtnQXCts4ebps9pEkgzhGqPIWY9rLCr4114bJ+ILvtQif1tecyiOJFld7NJUVVN2n7IFZJEyZSxO1OoYvqfTig3Atvbh9mA0tL+w1H70OogIuA/NQBmUD+lM8gsAYGXOXKZcBHikcUykprH0XBCKlhADVJSf9eQZZ2fotBrg+CYHg4wID1W0l5Kj988HpU20p5WvLWxCYpDd992n6axyaisC6uElfzLX8rZEno9GFiNdNk050uqmzohRsfeUghnJcTNZydoM/uHqyKvr4bg00ofDUIb00XFDx1OSRO5IItOJ7hMRlIXhSmglToTWVIL16OgZnJcV4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051589; c=relaxed/relaxed;
	bh=P14fEtg6A4OumBhlVUt/bQLfxRXlwvUBKmtTUWPdWKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=OKjtneWCaNfxxLEdti7wdbgkxHpI45w3my6yNF65UmTXFkBS8vqpqQXJ0nmDe7PDheKdHImbSd5B6U26bDU/Fu7esVd+AGE/oPK0gotvLlk+t5TpbWZbwMQwQrfG9GFnO63jD6HMgcWWnVoD4XXANItrVYRHczznTp7uLe5HP0wDPjnmrCerdj8p8EUTDPkvIetCbxXyOQvOrwiMcEwxMPyxx6By25waUfXQcW6aCMy7bIMzpSE9qz/v51eh576ZkDTQxhQGwZbx1ozRWp0dyIHL46NTgtoKwqup3ZL+p3eEx0BX+89ujx7+Rx3GsaCCFcYP2bOdVUMAbh2uyEH/3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f5NReEnz; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f5NReEnz; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f5NReEnz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f5NReEnz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXSh6c1Gz3bs7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 23:59:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P14fEtg6A4OumBhlVUt/bQLfxRXlwvUBKmtTUWPdWKk=;
	b=f5NReEnzoguhOKrUYV5XyjQhFFBX3hyxdPWWtR6+biSiDRkOae944zjqSfyH3FP51gawMm
	XM0NaDhzAzuzcMeMIdm87ooXQNuvWm0WyVcYqAEz+S8taUflB5R9WsbWja4aG9juP0HN08
	/CQLkhy1J7sVMmA/ss9B7BN978qb384=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P14fEtg6A4OumBhlVUt/bQLfxRXlwvUBKmtTUWPdWKk=;
	b=f5NReEnzoguhOKrUYV5XyjQhFFBX3hyxdPWWtR6+biSiDRkOae944zjqSfyH3FP51gawMm
	XM0NaDhzAzuzcMeMIdm87ooXQNuvWm0WyVcYqAEz+S8taUflB5R9WsbWja4aG9juP0HN08
	/CQLkhy1J7sVMmA/ss9B7BN978qb384=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-XYRjzpa4P3eWOGDqIe5rXA-1; Tue, 21 Oct 2025 08:59:42 -0400
X-MC-Unique: XYRjzpa4P3eWOGDqIe5rXA-1
X-Mimecast-MFC-AGG-ID: XYRjzpa4P3eWOGDqIe5rXA_1761051581
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-471005f28d2so21612015e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051581; x=1761656381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P14fEtg6A4OumBhlVUt/bQLfxRXlwvUBKmtTUWPdWKk=;
        b=v52STu2uFICxHFedilIC1EQJu0DRoJB0BwYmNviBM6NmXIYz2mpKCnuE43MmaoohnV
         sTMvBZaT/U1y5LOdpmKWnKfiCOS/n57lTC2ZFwTc3ig/uW/V87V6xhg4t61V5c9H2MSH
         gHEK/l//GljX9Q0/CZPiKZBfXnwCZeW13B/zH6V1PqMu8N/L2IPpC1JJL1Curj78wQW6
         +sBRWtNEnwf2HM6h1TbbSyhj1Mc8GPj6xv8LVkry6m7rlSq4//ZGLMQeyMQNCdPew9cR
         2ehCAVMU+TVZFVz9BA6Cx1HLKlhBoW5Jj3CSw181YM7xGGDNMpp92LLY5FPFQkav8GyF
         yJQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqVvqyDzGCCjJqslRdbdtnnZqcRHfsHfy32Oh1R/xOCwOJaQFGyNodRLjySq4NAA3blVMxYyrlgE79BKM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzM2OItV0q1DsYXEawwzIthCWKT/VFv7O2WhsEyvTMfp+GiLhpW
	VFicydvz9HvSHSk21fUYlq+bzQytlDnUCsKLoTwf95ZFApNpqc3HHJiDVu0m1WrJ3r+BSDCQjEg
	NIi1l4sTN9Qze09lslwGAncyIGG7F1kNCuYiRoJO5qvbFyd8m7yARrgBq+v3LmDteJDU66eh74n
	w=
X-Gm-Gg: ASbGncunweYybL4vwAnVx32jQ/1+x1icx5qtnVWG5Q+g2Sk9Xhdff5eb34szE9A01LX
	OLQ2OIuInNgp6usNLRZFmuhBAXJDNu5u8hkQnPrxIBwjJAZL2Af8mNDxEvKkr2gacNZUvomE4JT
	iUi6MySZe1Iqc0NYxDv+ndqc9w65yQpg2t0yMYDs9ndHNzQdEvwCS58oD8XbNARIfhjlRo+1PvI
	BWWKg+LvDqBnH9Yb4HhtMz+bsYmGH7nEIs7Zjjc9Okhxq4WqV7SKDkecnPV7s+bsl5FNohERoKj
	jV34rixxR31B12AFDjcyq6mfbmlbTpZxp5wFm+WYQ6LyFvF6jPNVKW3pSzZqLE8eUGc6ZqqGUdu
	N3c/vFPh6QAdD5YGO48b+5MB8AMgtfJcw0b9CKYrIB5iT0fyPb7cq1CI0VgSa
X-Received: by 2002:a05:600c:1988:b0:471:1387:376a with SMTP id 5b1f17b1804b1-4711791c661mr133821675e9.28.1761051581231;
        Tue, 21 Oct 2025 05:59:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcapACDzzVAi+UFv8YmL677aUf6eV6ZNfonjpRp41+s2WgUXfVDbrd4RA2JmDz7jP4+SdmlQ==
X-Received: by 2002:a05:600c:1988:b0:471:1387:376a with SMTP id 5b1f17b1804b1-4711791c661mr133821385e9.28.1761051580770;
        Tue, 21 Oct 2025 05:59:40 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4715520d747sm220307515e9.14.2025.10.21.05.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:40 -0700 (PDT)
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
Subject: [PATCH v1 04/23] mm/balloon_compaction: centralize basic page migration handling
Date: Tue, 21 Oct 2025 14:59:09 +0200
Message-ID: <20251021125929.377194-5-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: VqW0aq8ir66Jen0rsTKp75jjn44hRDXw392EbxxJAY8_1761051581
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's update the balloon page references, the balloon page list, the
BALLOON_MIGRATE counter and the isolated-pages counter in
balloon_page_migrate(), after letting the balloon->migratepage()
callback deal with the actual inflation+deflation.

Note that we now perform the balloon list modifications outside of any
implementation-specific locks: which is fine, there is nothing special
about these page actions that the lock would be protecting.

The old page is already no longer in the list (isolated) and the new page
is not yet in the list.

Let's use -ENOENT to communicate the special "inflation of new page
failed after already deflating the old page" to balloon_page_migrate() so
it can handle it accordingly.

While at it, rename balloon->b_dev_info to make it mach the other
functions. Also, drop the comment above balloon_page_migrate(), which
seems unnecessary.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 16 ---------
 drivers/misc/vmw_balloon.c           | 49 +++++-----------------------
 drivers/virtio/virtio_balloon.c      | 12 -------
 mm/balloon_compaction.c              | 37 ++++++++++++++++++---
 4 files changed, 41 insertions(+), 73 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 67c7309c36147..07b21d2bc8a78 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -501,8 +501,6 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 			   struct page *newpage, struct page *page,
 			   enum migrate_mode mode)
 {
-	unsigned long flags;
-
 	/*
 	 * loan/"inflate" the newpage first.
 	 *
@@ -517,9 +515,6 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 		return -EBUSY;
 	}
 
-	/* balloon page list reference */
-	get_page(newpage);
-
 	/*
 	 * When we migrate a page to a different zone, we have to fixup the
 	 * count of both involved zones as we adjusted the managed page count
@@ -530,22 +525,11 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 		adjust_managed_page_count(newpage, -1);
 	}
 
-	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
-	balloon_page_insert(b_dev_info, newpage);
-	__count_vm_event(BALLOON_MIGRATE);
-	b_dev_info->isolated_pages--;
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
-
 	/*
 	 * activate/"deflate" the old page. We ignore any errors just like the
 	 * other callers.
 	 */
 	plpar_page_set_active(page);
-
-	balloon_page_finalize(page);
-	/* balloon page list reference */
-	put_page(page);
-
 	return 0;
 }
 #else /* CONFIG_BALLOON_COMPACTION */
diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 07e60a4b846aa..52b8c0f1eead7 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -1724,18 +1724,17 @@ static inline void vmballoon_debugfs_exit(struct vmballoon *b)
  * @page: a ballooned page that should be migrated.
  * @mode: migration mode, ignored.
  *
- * This function is really open-coded, but that is according to the interface
- * that balloon_compaction provides.
- *
  * Return: zero on success, -EAGAIN when migration cannot be performed
- *	   momentarily, and -EBUSY if migration failed and should be retried
- *	   with that specific page.
+ *	   momentarily, -EBUSY if migration failed and should be retried
+ *	   with that specific page, and -ENOENT when deflating @page
+ *	   succeeded but inflating @newpage failed, effectively deflating
+ *	   the balloon.
  */
 static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 				 struct page *newpage, struct page *page,
 				 enum migrate_mode mode)
 {
-	unsigned long status, flags;
+	unsigned long status;
 	struct vmballoon *b;
 	int ret = 0;
 
@@ -1773,14 +1772,6 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 		goto out_unlock;
 	}
 
-	/*
-	 * The page is isolated, so it is safe to delete it without holding
-	 * @pages_lock . We keep holding @comm_lock since we will need it in a
-	 * second.
-	 */
-	balloon_page_finalize(page);
-	put_page(page);
-
 	/* Inflate */
 	vmballoon_add_page(b, 0, newpage);
 	status = vmballoon_lock_op(b, 1, VMW_BALLOON_4K_PAGE,
@@ -1799,36 +1790,12 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 		 * change.
 		 */
 		atomic64_dec(&b->size);
-	} else {
 		/*
-		 * Success. Take a reference for the page, and we will add it to
-		 * the list after acquiring the lock.
+		 * Tell the core that we're deflating the old page and don't
+		 * need the new page.
 		 */
-		get_page(newpage);
-	}
-
-	/* Update the balloon list under the @pages_lock */
-	spin_lock_irqsave(&b->b_dev_info.pages_lock, flags);
-
-	/*
-	 * On inflation success, we already took a reference for the @newpage.
-	 * If we succeed just insert it to the list and update the statistics
-	 * under the lock.
-	 */
-	if (status == VMW_BALLOON_SUCCESS) {
-		balloon_page_insert(&b->b_dev_info, newpage);
-		__count_vm_event(BALLOON_MIGRATE);
-	} else {
-		__count_vm_event(BALLOON_DEFLATE);
+		ret = -ENOENT;
 	}
-
-	/*
-	 * We deflated successfully, so regardless to the inflation success, we
-	 * need to reduce the number of isolated_pages.
-	 */
-	b->b_dev_info.isolated_pages--;
-	spin_unlock_irqrestore(&b->b_dev_info.pages_lock, flags);
-
 out_unlock:
 	up_read(&b->conf_sem);
 	return ret;
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 1b93d8c643612..8969271581bca 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -827,7 +827,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 {
 	struct virtio_balloon *vb = container_of(vb_dev_info,
 			struct virtio_balloon, vb_dev_info);
-	unsigned long flags;
 
 	/*
 	 * In order to avoid lock contention while migrating pages concurrently
@@ -840,8 +839,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 	if (!mutex_trylock(&vb->balloon_lock))
 		return -EAGAIN;
 
-	get_page(newpage); /* balloon reference */
-
 	/*
 	  * When we migrate a page to a different zone and adjusted the
 	  * managed page count when inflating, we have to fixup the count of
@@ -854,11 +851,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 	}
 
 	/* balloon's page migration 1st step  -- inflate "newpage" */
-	spin_lock_irqsave(&vb_dev_info->pages_lock, flags);
-	balloon_page_insert(vb_dev_info, newpage);
-	vb_dev_info->isolated_pages--;
-	__count_vm_event(BALLOON_MIGRATE);
-	spin_unlock_irqrestore(&vb_dev_info->pages_lock, flags);
 	vb->num_pfns = VIRTIO_BALLOON_PAGES_PER_PAGE;
 	set_page_pfns(vb, vb->pfns, newpage);
 	tell_host(vb, vb->inflate_vq);
@@ -869,10 +861,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 	tell_host(vb, vb->deflate_vq);
 
 	mutex_unlock(&vb->balloon_lock);
-
-	balloon_page_finalize(page);
-	put_page(page); /* balloon reference */
-
 	return 0;
 }
 #endif /* CONFIG_BALLOON_COMPACTION */
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 03c5dbabb1565..5444c61bb9e76 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -232,20 +232,49 @@ static void balloon_page_putback(struct page *page)
 	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
 }
 
-/* move_to_new_page() counterpart for a ballooned page */
 static int balloon_page_migrate(struct page *newpage, struct page *page,
 		enum migrate_mode mode)
 {
-	struct balloon_dev_info *balloon = balloon_page_device(page);
+	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
+	unsigned long flags;
+	int rc;
 
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
 
 	/* Isolated balloon pages cannot get deflated. */
-	if (WARN_ON_ONCE(!balloon))
+	if (WARN_ON_ONCE(!b_dev_info))
 		return -EAGAIN;
 
-	return balloon->migratepage(balloon, newpage, page, mode);
+	rc = b_dev_info->migratepage(b_dev_info, newpage, page, mode);
+	switch (rc) {
+	case 0:
+		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+
+		/* Insert the new page into the balloon list. */
+		get_page(newpage);
+
+		balloon_page_insert(b_dev_info, newpage);
+		__count_vm_event(BALLOON_MIGRATE);
+		break;
+	case -ENOENT:
+		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+
+		/* Old page was deflated but new page not inflated. */
+		__count_vm_event(BALLOON_DEFLATE);
+		break;
+	default:
+		return rc;
+	}
+
+	b_dev_info->isolated_pages--;
+	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+
+	/* Free the now-deflated page we isolated in balloon_page_isolate(). */
+	balloon_page_finalize(page);
+	put_page(page);
+
+	return 0;
 }
 
 const struct movable_operations balloon_mops = {
-- 
2.51.0


