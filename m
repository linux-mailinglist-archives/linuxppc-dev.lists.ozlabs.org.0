Return-Path: <linuxppc-dev+bounces-13101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE81BF69CD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:01:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXT26Cpxz3dd4;
	Wed, 22 Oct 2025 00:00:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051606;
	cv=none; b=bmDvwQUnO5n0GHJA7HsPY0IVvoKb/y0715nbZTRZnzO4j+CuBxqISyP8IFexkxAzH3HUK4whfmdjILK+2cKs1ZcPqNovk7uYylocrTKSj6R7uP7kFUj2kUfIbHKNya7SwMoekNwIwEEkYFrKsrldlkSha+IaKefZl81YFuA1VuCDjmVMkBeK46t9O7MLp/fvSiA2DpsU7itzpGoiZek7nlS1xpsKpyWQeXNtJFgLlg5Pw0iLVXeFgkJj6Wrrg+L5P1Rz49OlpZnrQJnAlIWWy+TNj1K/oSsLEXrfspY72BtJhxFr38YcjubQImPPW6BsRnoF84n8TQbnSJz+lzdCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051606; c=relaxed/relaxed;
	bh=7dmjAOzzOKe+PWzSzDnov13uhbtuxj7aSoteYm9r0kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=WDRwfhGnUTUR+h5/pG0EbLYJXDEOv3Z1j6GVVPf5duCo46izMzKRdiRP4atUTEFFXSWTtRAQlMIhHaqsCIhE+NK2vXSozcWF0o1msrqG2yFGUrdMjlCoORqM4Fz0Ng9QGU02PhDIR65/L/369gSpWjST8CZgCzHE03dW6+7aa8E266e+bv0i71BskcsPphuiBGY5J+4vgDdHMJQlfqnPwW4J5D2jluBMJV/efPQfrTZoVFwcjwBkJnf/uZGrv136wJHgRJm1hYiYtslbCpnwcsrjxE47PZ3MinkxsC7nBSLys6i1GSPax3q7YUx7uRFBkVLl7jS55TLmHEBUdCb+dA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OAgYYcKg; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OAgYYcKg; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OAgYYcKg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OAgYYcKg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXT14H3wz3dXH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 00:00:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7dmjAOzzOKe+PWzSzDnov13uhbtuxj7aSoteYm9r0kM=;
	b=OAgYYcKgiMDMEm7OAz03vN+Xp12HUwI9RpH0l6PSgUT2GTMs6qSpp7Ipxj5aEy6kg9A5v9
	lLRFLQQiu5a+Y4tQ5k9ZQTWIbrDSSiDxcI0Z5V4rsGjoiBbGIvidpxtwgcfXSo/KX4JEa7
	KsgVa6wJ/+FviMc5yAGhW6OSRTqK5O0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7dmjAOzzOKe+PWzSzDnov13uhbtuxj7aSoteYm9r0kM=;
	b=OAgYYcKgiMDMEm7OAz03vN+Xp12HUwI9RpH0l6PSgUT2GTMs6qSpp7Ipxj5aEy6kg9A5v9
	lLRFLQQiu5a+Y4tQ5k9ZQTWIbrDSSiDxcI0Z5V4rsGjoiBbGIvidpxtwgcfXSo/KX4JEa7
	KsgVa6wJ/+FviMc5yAGhW6OSRTqK5O0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-FIxcMvpKPKmEp5GDv3LlMA-1; Tue, 21 Oct 2025 09:00:01 -0400
X-MC-Unique: FIxcMvpKPKmEp5GDv3LlMA-1
X-Mimecast-MFC-AGG-ID: FIxcMvpKPKmEp5GDv3LlMA_1761051600
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42851b6a659so253637f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 06:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051600; x=1761656400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dmjAOzzOKe+PWzSzDnov13uhbtuxj7aSoteYm9r0kM=;
        b=rlsQRBZb4VIbom28fxsv+2LY6e4tN2qR7kPY4Um4EPqvV2aQ0vCKPEq9K7doirB6Lz
         gUm2EGZSZmgK4SOcE0MHtjr7Y1ybaaQARgWQlXiRzBebIYmXhx6c0T06c89iw87El8xs
         +S0Mmv088qGvQuhrIMU24K9wJmhPzgvpNEz1fXApLlcNNv+oyZXopQQXhZeGzCH0PzaE
         BbP33lmzWvNGJN1lHedRfNyy3VJus1OCkmi/Xw2Z1N9pgqOfa+z32REcRe3IilfzObAX
         PRzScwFR51j5lMfm+axi5fj4NkaWQXY8IdWNmHBMTwWtQUi1YPdh8fC6Pz1LFwN+M1Us
         4N5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi3uh9FDnBgvekLX6DTLSmDiN9PjfehWcAIkYPV7FDMFsm2mo6LQADw6YtlnXO9DqXgSpoHBqeeYUdKws=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzNu+o4VrJom6oHlHhfUNf1+H1EZy3xFDpcaLRGgpI7Vr/tTLwr
	wGGme6mdf/tOZyAvL6yPzcBcpwz0VB13lSJHkZ6NgXrzNxk1qGNsy77VzCPKr+L54dJZ/s5qev+
	xLQJ5a92LL6VvuXJZRlUzveBGH7elGgJhRNZRgehUKknhWd/gd7iwvpEFgqdOre7AYxU=
X-Gm-Gg: ASbGnctfhqwFOudssnkBVAGPW7okxa1Qg9jOnJVuZPedJ3xMB4Btn0pd9xK9/MxZ0ow
	SAzQPyC1TiCc0UNSbDiJ4tJ4hvuHg+7dMwbayaeDPJeswTuw8mKo05CkmsrtB44YerFnihr5lUj
	6xDEdrlV7oTDsrYiepd17On1P1aU0jMTu1wj1BzMmbMwrLO6+HI2c8f/5iPFfw7OVcPUcNu19hR
	eSN69jI+FXI+9PdbYAPwZvD5W1bNm2kP0g3Ow09WEM9uZE9G4LImsc8EEenSSUdM/89rhpFaFCG
	MhmNkc1HlzNkGfSgPFBcJN7uh3rC4bSLZlosXGGhycoR+z/ocTnzn8FZV979zXjKn4osxsw7GAC
	STC5S7ufP0i/fSu9nYZtXb95n3MzCQDxNkzQDmTQm5SDlO/5WKeLQhtEMGYMq
X-Received: by 2002:a05:6000:2503:b0:425:825d:2c64 with SMTP id ffacd0b85a97d-42704d6c822mr11791986f8f.17.1761051599809;
        Tue, 21 Oct 2025 05:59:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfxO1MIMIHuEAyS8Hvj/zoSDSKI4v296mvX+6V2esc8bVwH2VAjXdgu+NOffYas4k+6n6n6g==
X-Received: by 2002:a05:6000:2503:b0:425:825d:2c64 with SMTP id ffacd0b85a97d-42704d6c822mr11791940f8f.17.1761051599346;
        Tue, 21 Oct 2025 05:59:59 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00cdf6csm20134215f8f.43.2025.10.21.05.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:58 -0700 (PDT)
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
Subject: [PATCH v1 12/23] mm/balloon_compaction: remove balloon_page_push/pop()
Date: Tue, 21 Oct 2025 14:59:17 +0200
Message-ID: <20251021125929.377194-13-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: NsM1qxOJrTJnF9JKmx_KeZ3iNMqYKsuIdlLo1omyo0U_1761051600
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's remove these helpers as they are unused now.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 30 ------------------------------
 mm/balloon_compaction.c            |  5 ++---
 2 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 1452ea0635245..e5451cf1f6589 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -126,34 +126,4 @@ static inline void balloon_page_finalize(struct page *page)
 		set_page_private(page, 0);
 	/* PageOffline is sticky until the page is freed to the buddy. */
 }
-
-/*
- * balloon_page_push - insert a page into a page list.
- * @head : pointer to list
- * @page : page to be added
- *
- * Caller must ensure the page is private and protect the list.
- */
-static inline void balloon_page_push(struct list_head *pages, struct page *page)
-{
-	list_add(&page->lru, pages);
-}
-
-/*
- * balloon_page_pop - remove a page from a page list.
- * @head : pointer to list
- * @page : page to be added
- *
- * Caller must ensure the page is private and protect the list.
- */
-static inline struct page *balloon_page_pop(struct list_head *pages)
-{
-	struct page *page = list_first_entry_or_null(pages, struct page, lru);
-
-	if (!page)
-		return NULL;
-
-	list_del(&page->lru);
-	return page;
-}
 #endif /* _LINUX_BALLOON_COMPACTION_H */
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index c44e0b62203cc..90b2d61a593b7 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -128,9 +128,8 @@ EXPORT_SYMBOL_GPL(balloon_page_alloc);
  * Drivers must call this function to properly enqueue a new allocated balloon
  * page before definitively removing the page from the guest system.
  *
- * Drivers must not call balloon_page_enqueue on pages that have been pushed to
- * a list with balloon_page_push before removing them with balloon_page_pop. To
- * enqueue a list of pages, use balloon_page_list_enqueue instead.
+ * Drivers must not enqueue pages while page->lru is still in
+ * use, and must not use page->lru until a page was unqueued again.
  */
 void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
 			  struct page *page)
-- 
2.51.0


