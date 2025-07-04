Return-Path: <linuxppc-dev+bounces-10097-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D01DAF900F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:26:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCX3yqnz3bgX;
	Fri,  4 Jul 2025 20:26:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624760;
	cv=none; b=NVVp9TEFwW8zIlSjpCEL5t3yRbyDWVQ4IOv0CwkXavlake/qLaBR+WT/orPCHwJSAnZttRNeEC5Zt6FoHUt4yrVydFS1P2NHvAQ1KS4hRJkz6ZNsjxyDJ2HROfktyfn34VGxTH0rtTV7RTmwJmMA+L4WiYkq8P6R+Bqr+kJsRasZFcpOOPLsuKCZmTAhyBDYAKnq7KwBOom1g938O0dC9D4Jyqiywa+Mhi7zL/HBsgSUOVQk8rtPFqkqMlZQD87tnr/6XGipF3XHh2RNBVpINJKfGYPBfXH6EtjYbfvudzJr9LhnmHyanxt6wATtWtQBUVyWqVB2Gy10edtCvMR0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624760; c=relaxed/relaxed;
	bh=QfBSPQaG9xeZudkGcFWJAgBBxYLZuNBkDrffE/+eDPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=hMk7RDjmJUEDzrsgcRitTiqASuOA0zHa2CV0yxbxD8RjjvsvaJp3YMIEc0arrq4eFYUngvtvLHZTxeJCvwCgdviHyT1skNj/w1h37FpMyzPKVsImVH8dZJsbnFodf0XzgJtM6s0L9TqPQvAXj0MWrQSE/M2FKe0BSBxzG4maj3nJwu7qSyF1Q5uFqkWfsFJvIhAX3HdjFalv7HfAaAO+1HMYdirOmJyFXR3I9V9Dh0cUzZo/fbytR8EEeAf6zEYUlYNbQIrlUAKF12sMKzOtjiB0ZIPRqJ07aoGi9KS9LSNkn9+msWyiofxZNGP0t+kqSWiFVCKQFsztB+42mHNH0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RPnE7xPP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RPnE7xPP; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RPnE7xPP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RPnE7xPP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCW5dyMz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:25:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QfBSPQaG9xeZudkGcFWJAgBBxYLZuNBkDrffE/+eDPg=;
	b=RPnE7xPP9v5R4M8rwpuTVRXSAoyMbvUNZivsmnjz6q/Z9ux2JZXjhnLfjJOPvZ7/+NH2ef
	hEhdBpPcJghdKfcLoZfqq/0QrodrKN9tB9tNCjm9rWBBOsYztrErPyQYSTZHvwDJsw4wt5
	ANF21Et031hwXurburXg0OTIPDgHWFM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QfBSPQaG9xeZudkGcFWJAgBBxYLZuNBkDrffE/+eDPg=;
	b=RPnE7xPP9v5R4M8rwpuTVRXSAoyMbvUNZivsmnjz6q/Z9ux2JZXjhnLfjJOPvZ7/+NH2ef
	hEhdBpPcJghdKfcLoZfqq/0QrodrKN9tB9tNCjm9rWBBOsYztrErPyQYSTZHvwDJsw4wt5
	ANF21Et031hwXurburXg0OTIPDgHWFM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-n6b0ry5KMu-Pjwp3IIDWlg-1; Fri, 04 Jul 2025 06:25:56 -0400
X-MC-Unique: n6b0ry5KMu-Pjwp3IIDWlg-1
X-Mimecast-MFC-AGG-ID: n6b0ry5KMu-Pjwp3IIDWlg_1751624755
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso317514f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624755; x=1752229555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfBSPQaG9xeZudkGcFWJAgBBxYLZuNBkDrffE/+eDPg=;
        b=wXb884cSOXT8S7V6ePi2P+nZ3D3r5FrQSa7FrJxhPZOdO0tdJb5vxTiyf+tkcA04i6
         ONGpiGVzif3hzfbxyuKfc+VQNnjliAXXFLSTnHzvMr5bLbuEr3qfEzFONxm4Ahz7bYGK
         B/CU8FK86dvpAqtk/mVlhd3lakgAqB5kwgK2BVXIO+0gHoP32fi4tLl4+bVIrnY655x4
         hnDuScoe4r7c3uTVQmG3+Fqe9KLTbJP4rq82FuDkRSViFeGxVCA9B4Rejm530EVOP82i
         +IV4rlyQEiOwFs4NRxjKRO1jR1ZrGVkBc9/gvBqcqsCJZC7FRdQLzutrodhyGvOZGldf
         cKRw==
X-Forwarded-Encrypted: i=1; AJvYcCXJcmogDPN8gfouEmS0G3xcxgFO+6qwyABMF0sR9IHpV6OXZamQ6/TBrHP+cmxFCNVkkHg9FY6/+47tq/o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwO84/JAA1Hiwbd6gfUXhUOLWJ/XZVMDhuYf3r/BYzcpcWJER2o
	FB6zBicM1uZBP+zMRc5j1W/k0ZlWDOUywucyOMvzoA95x6PpeQeaADGjhCXk3k0gHSFeCtG+ned
	f5A6kHZsnxht7GMgFXBNdHSV41fRNPv6MCvihWmliAZyadycaP8wpDMyS12ZztHYrDes=
X-Gm-Gg: ASbGncuye8N955TmzTqfOISFft4e47zZjuriUe0OEXsloEC5tjJM4XcQYcjmk74mTgn
	d8VoPBEDYZm43RLpZ4Q6K1xZZ1f20YVILl2zv7WL8s92SB2su1ucZkiu/UYHWkvxyfWoCr88ut+
	tAGGxSoGoZgxSpwTQT/RlWVPhH4Fj5J/QqdD2M9cYYwkYUYZq6btALPk50JkFrFFXShweOOIvTh
	6ET7w7x3Ok8STm5+4Q5Wtrx25n8LSowVIscFVbCQP3l8MSSfXX6hsgSYpcXUc3Es3e+W5s5tR0S
	kI8ng1/yC4ZeGffMbXfnkO0hpMgcUYtSxaC6nViHgTfwUxYszL2HTpNanOl7K8Cvqa675cP8eEY
	HG7ZN1w==
X-Received: by 2002:a05:6000:2312:b0:3a4:e54c:adf2 with SMTP id ffacd0b85a97d-3b497011964mr1275733f8f.5.1751624754818;
        Fri, 04 Jul 2025 03:25:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfrhXd/yIZyYpWVcak9U+vZiPIE1G2M2XMax2kqYgfF02lLZKKCminarbrdx4X4RqYGyvSNg==
X-Received: by 2002:a05:6000:2312:b0:3a4:e54c:adf2 with SMTP id ffacd0b85a97d-3b497011964mr1275679f8f.5.1751624754226;
        Fri, 04 Jul 2025 03:25:54 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285e241sm2143549f8f.94.2025.07.04.03.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:53 -0700 (PDT)
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
Subject: [PATCH v2 09/29] mm/migrate: factor out movable_ops page handling into migrate_movable_ops_page()
Date: Fri,  4 Jul 2025 12:25:03 +0200
Message-ID: <20250704102524.326966-10-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: y72Sx9FzR4l4hnIb0uhZp9VVjgGoxZJWNwUlJ1LSEZc_1751624755
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's factor it out, simplifying the calling code.

Before this change, we would have called flush_dcache_folio() also on
movable_ops pages. As documented in Documentation/core-api/cachetlb.rst:

	"This routine need only be called for page cache pages which can
	 potentially ever be mapped into the address space of a user
	 process."

So don't do it for movable_ops pages. If there would ever be such a
movable_ops page user, it should do the flushing itself after performing
the copy.

Note that we can now change folio_mapping_flags() to folio_test_anon()
to make it clearer, because movable_ops pages will never take that path.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 82 ++++++++++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 37 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index c3cd66b05fe2f..d66d0776036c3 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -159,6 +159,45 @@ static void putback_movable_ops_page(struct page *page)
 	folio_put(folio);
 }
 
+/**
+ * migrate_movable_ops_page - migrate an isolated movable_ops page
+ * @page: The isolated page.
+ *
+ * Migrate an isolated movable_ops page.
+ *
+ * If the src page was already released by its owner, the src page is
+ * un-isolated (putback) and migration succeeds; the migration core will be the
+ * owner of both pages.
+ *
+ * If the src page was not released by its owner and the migration was
+ * successful, the owner of the src page and the dst page are swapped and
+ * the src page is un-isolated.
+ *
+ * If migration fails, the ownership stays unmodified and the src page
+ * remains isolated: migration may be retried later or the page can be putback.
+ *
+ * TODO: migration core will treat both pages as folios and lock them before
+ * this call to unlock them after this call. Further, the folio refcounts on
+ * src and dst are also released by migration core. These pages will not be
+ * folios in the future, so that must be reworked.
+ *
+ * Returns MIGRATEPAGE_SUCCESS on success, otherwise a negative error
+ * code.
+ */
+static int migrate_movable_ops_page(struct page *dst, struct page *src,
+		enum migrate_mode mode)
+{
+	int rc = MIGRATEPAGE_SUCCESS;
+
+	VM_WARN_ON_ONCE_PAGE(!PageIsolated(src), src);
+	/* If the page was released by it's owner, there is nothing to do. */
+	if (PageMovable(src))
+		rc = page_movable_ops(src)->migrate_page(dst, src, mode);
+	if (rc == MIGRATEPAGE_SUCCESS)
+		ClearPageIsolated(src);
+	return rc;
+}
+
 /*
  * Put previously isolated pages back onto the appropriate lists
  * from where they were once taken off for compaction/migration.
@@ -1023,51 +1062,20 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 								mode);
 		else
 			rc = fallback_migrate_folio(mapping, dst, src, mode);
-	} else {
-		const struct movable_operations *mops;
 
-		/*
-		 * In case of non-lru page, it could be released after
-		 * isolation step. In that case, we shouldn't try migration.
-		 */
-		VM_BUG_ON_FOLIO(!folio_test_isolated(src), src);
-		if (!folio_test_movable(src)) {
-			rc = MIGRATEPAGE_SUCCESS;
-			folio_clear_isolated(src);
+		if (rc != MIGRATEPAGE_SUCCESS)
 			goto out;
-		}
-
-		mops = folio_movable_ops(src);
-		rc = mops->migrate_page(&dst->page, &src->page, mode);
-		WARN_ON_ONCE(rc == MIGRATEPAGE_SUCCESS &&
-				!folio_test_isolated(src));
-	}
-
-	/*
-	 * When successful, old pagecache src->mapping must be cleared before
-	 * src is freed; but stats require that PageAnon be left as PageAnon.
-	 */
-	if (rc == MIGRATEPAGE_SUCCESS) {
-		if (__folio_test_movable(src)) {
-			VM_BUG_ON_FOLIO(!folio_test_isolated(src), src);
-
-			/*
-			 * We clear PG_movable under page_lock so any compactor
-			 * cannot try to migrate this page.
-			 */
-			folio_clear_isolated(src);
-		}
-
 		/*
-		 * Anonymous and movable src->mapping will be cleared by
-		 * free_pages_prepare so don't reset it here for keeping
-		 * the type to work PageAnon, for example.
+		 * For pagecache folios, src->mapping must be cleared before src
+		 * is freed. Anonymous folios must stay anonymous until freed.
 		 */
-		if (!folio_mapping_flags(src))
+		if (!folio_test_anon(src))
 			src->mapping = NULL;
 
 		if (likely(!folio_is_zone_device(dst)))
 			flush_dcache_folio(dst);
+	} else {
+		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
 	}
 out:
 	return rc;
-- 
2.49.0


