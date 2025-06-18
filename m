Return-Path: <linuxppc-dev+bounces-9466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B25ADF445
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:41:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcc2bXLz3bcj;
	Thu, 19 Jun 2025 03:40:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268448;
	cv=none; b=OWoJivkcPpXLjwO63Jo8syWwZ3bzgMxbVbJ0Nx+7JCxUCSL0uxa5yKzr1/ROv8PyKwaj5bzLWT4Wl1fGmIkzYd68sIEVVnQ5vRzTUdWHfxOVPQM/U4Y9uQ2X3uh04D8N8sGL3CHGG+LtxAFJ3yhXGrUcB0wXw6QAGKlgggCns3wJEhlHQQDtS9NGBVessj92ME54oyD+cn1SGUa4ody2qwpOoRrUxnAvhga+OJqp3kXADcpv+uW14uwWagJRTZgCSBrvavg7sqw4tsqiY6NtDYPxnpe0cIBKxXCVydmrAKasW+TyHsIjoPXLee5ZXrljIKx0T3GTwl0GHkC8xVGngw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268448; c=relaxed/relaxed;
	bh=5rGfc3zUjh7F4hWUWCipVozVPKyNvGr3sO3WbBx9inE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=NnoSYMGV0ga1UyB4uYIMYNAf2TgzduY2EkSxL+9dCBGdB5xY7Vna1XmwNTQ3JuVJCsp2uhVJiZuYXsCDkCXtTEXlbTEmRF0mB0iNBCMJ9XdsRoL2FWwHHKAQUBokfzzxb61pqMJz3euivdH6zBhcPMFkYz+hoGxCdvlqXtAcNQ24v6yWC0L+VXSO4t7pvCXanSR/Jsjb+ccubOvp6vTw/QbngwaFCLfty/bHz3eFueecqnwm0MQ6rW4zkc13MHyr5BF0NH5cYE7Wkz2MDq1yE1QDMOmDvn5x4KyieIKKUDhvaj7LE0o7UDVxxuwSCLIzK4qlP6HDEuoRHACdittwOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CppTbSKY; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CppTbSKY; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CppTbSKY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CppTbSKY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcZ0HnHz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5rGfc3zUjh7F4hWUWCipVozVPKyNvGr3sO3WbBx9inE=;
	b=CppTbSKYVFMZK6SzpRCHx9gHLIcl3rKVYYRRy29CCXG+WCYSW5NTWcwzHF8GOzQ4cvTrLW
	dJ60VNXYu0fNoLowV7RlrD4VimYYO2GbQkqbgXYc/Qt3lmhGCoQA2GnHc4iSWh4UjIoUSL
	AOU46I5Dr6B9pLQGHmSJyw/jg5dQcbI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5rGfc3zUjh7F4hWUWCipVozVPKyNvGr3sO3WbBx9inE=;
	b=CppTbSKYVFMZK6SzpRCHx9gHLIcl3rKVYYRRy29CCXG+WCYSW5NTWcwzHF8GOzQ4cvTrLW
	dJ60VNXYu0fNoLowV7RlrD4VimYYO2GbQkqbgXYc/Qt3lmhGCoQA2GnHc4iSWh4UjIoUSL
	AOU46I5Dr6B9pLQGHmSJyw/jg5dQcbI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-e3fsYhA4OiCUOCiutA9Cqg-1; Wed, 18 Jun 2025 13:40:40 -0400
X-MC-Unique: e3fsYhA4OiCUOCiutA9Cqg-1
X-Mimecast-MFC-AGG-ID: e3fsYhA4OiCUOCiutA9Cqg_1750268439
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so2846367f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268439; x=1750873239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rGfc3zUjh7F4hWUWCipVozVPKyNvGr3sO3WbBx9inE=;
        b=fo39ZCY9NCHVTZnNutaMhK5McfXiBQzAfzZ5A4LDTyCsKb0f3GvSsHxwA2Fw5eURi5
         hTkRYKxQrOwfcbQG3Ds4ggAJwENe7MfKeRm8idbBJRfK7nFs8fUuay588HXCBHaJGoEZ
         5Oa1vEV23m0YRAc+90A/SKaed+ISDBWmmobGpgqYa9gojN9RK4dSbvI8IDwHxRZ+Yzem
         VhvbQXLQlFkYNGz/+48hv0aRd7wDiUzbzQgTAnkQz1PXy8jCRxfew2IIbJtc8dNLa8og
         XfSg6ZgF3hrNz7hB93J6zmx2JmUxBDLr9DxAYPJd/tMsVtkcw4d+MTcNyA+SyWeixft9
         GsYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVRbETdsAGthNbx/Lmh/cbmmtu8uAdvRgFxu6qBCbsNb11O9xJsfkGoZYoID1YBlxdDrf7oAAx2co+NQs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw56ZWjOHTXoF4hBMD0r0P/3tXkw4+pUnSIvUKUgkZZN2inIx6Y
	JyBBQ3FvbmJIWN9XeleKxZzp/DO3Fi6126Nq3jYlLMxGwE9Z+0ZKuydMgGV4BaLHuMcm4B5SfbC
	fnyUc85SCUV7ZFwv1HPn51INy1MKmzng4ge5653tcV3tlb301ihp9BRr9Vyc6+biixcc=
X-Gm-Gg: ASbGncvtQH9iGDPaKPo3s5Th7xDfGCiYnqH2h+JoJIKlmQIQDfOxUsTfzOmz5fY45mx
	lcZCb2S/1h7h2GeVpMy13kyYQL41dH8qWjCKALT4/Di2vKeu/BXUDMwXQ8MYCtmQnK3/+EUC/5I
	NXvzav5IULc8ELUtw7p7S33gh0phQZMn7HUuoeZ1Aae/8mlKoARVRYzv9TP2YI2To3nPxiDcNgk
	67GsiYzJ0aL7TmmpNW1vbREbmVOiwxmURo+OOB1+GxdREkQQqNQ4/sr+sHHbQEYhYokoMIwE137
	IY0TxItJfsRAZW7ZFWZwWnk2/7cRbSyMQ03+uFwPQCfZDzRDwO9zldKcmi8oIf8sfGOszMuT8KH
	+Ki28oQ==
X-Received: by 2002:a05:6000:144f:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3a57237c9a7mr17230277f8f.26.1750268438537;
        Wed, 18 Jun 2025 10:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk4wH3M6h2T58ReQA5DPEIh/WOsy58XEgAZ0LBQTHsCj9tNbupSQVC4fwDx3ff0ep2cpGgew==
X-Received: by 2002:a05:6000:144f:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3a57237c9a7mr17230239f8f.26.1750268438093;
        Wed, 18 Jun 2025 10:40:38 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a800d9sm17307416f8f.45.2025.06.18.10.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:37 -0700 (PDT)
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
Subject: [PATCH RFC 08/29] mm/migrate: rename putback_movable_folio() to putback_movable_ops_page()
Date: Wed, 18 Jun 2025 19:39:51 +0200
Message-ID: <20250618174014.1168640-9-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: DTfemJF-gi1dMJRFc22nNrR8Iz7JX4gSOCD2U6VIGOw_1750268439
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

... and factor the complete handling of movable_ops pages out.
Convert it similar to isolate_movable_ops_page().

While at it, convert the VM_BUG_ON_FOLIO() into a VM_WARN_ON_PAGE().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 6bbb455f8b593..32e77898f7d6c 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -133,12 +133,30 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	return false;
 }
 
-static void putback_movable_folio(struct folio *folio)
+/**
+ * putback_movable_ops_page - putback an isolated movable_ops page
+ * @page: The isolated page.
+ *
+ * Putback an isolated movable_ops page.
+ *
+ * After the page was putback, it might get freed instantly.
+ */
+static void putback_movable_ops_page(struct page *page)
 {
-	const struct movable_operations *mops = folio_movable_ops(folio);
-
-	mops->putback_page(&folio->page);
-	folio_clear_isolated(folio);
+	/*
+	 * TODO: these pages will not be folios in the future. All
+	 * folio dependencies will have to be removed.
+	 */
+	struct folio *folio = page_folio(page);
+
+	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
+	folio_lock(folio);
+	/* If the page was released by it's owner, there is nothing to do. */
+	if (PageMovable(page))
+		page_movable_ops(page)->putback_page(page);
+	ClearPageIsolated(page);
+	folio_unlock(folio);
+	folio_put(folio);
 }
 
 /*
@@ -166,14 +184,7 @@ void putback_movable_pages(struct list_head *l)
 		 * have PAGE_MAPPING_MOVABLE.
 		 */
 		if (unlikely(__folio_test_movable(folio))) {
-			VM_BUG_ON_FOLIO(!folio_test_isolated(folio), folio);
-			folio_lock(folio);
-			if (folio_test_movable(folio))
-				putback_movable_folio(folio);
-			else
-				folio_clear_isolated(folio);
-			folio_unlock(folio);
-			folio_put(folio);
+			putback_movable_ops_page(&folio->page);
 		} else {
 			node_stat_mod_folio(folio, NR_ISOLATED_ANON +
 					folio_is_file_lru(folio), -folio_nr_pages(folio));
-- 
2.49.0


