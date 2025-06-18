Return-Path: <linuxppc-dev+bounces-9465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A802DADF443
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:41:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcb1HjTz3bkP;
	Thu, 19 Jun 2025 03:40:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268447;
	cv=none; b=Qed/5e9Ehj41SgJjG78YUaLwDN1j6jQrDE1MZwk68hJOikv8UhF8V2PLh8SfJlDSVfearpsT5524Ufy2fmjHOIxX3FexE7+tw2IaNJs9UEv6RckOW6LcV6TnB3vM8Yu5pEDSmQ+jXWI92+Qq9tmTn0P5Nmr/E08/6/YDrDb0mgoASoj/hyqK2DFhV/F440LLiTbnfttYNknIwGJVtCt9IOcfJE0Q2B67AdMYtSevgsGLylzAblG7sW/V3/HSCJKnShHSaml7vv/oa+mH3eGfGQmcghRxdsolZ8psIFKRw0qXiLEDrQ9/BntGUguMN0SJFWdgbrajSHgPSSRzcK+DPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268447; c=relaxed/relaxed;
	bh=j8LuODrccx/EBs9A7vTNySqHbhe9k9tI08r8Ga0Xgcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=WEEiveGRESNmCvS5AOOMqS6NxWM2FDSevy9dFcxv8bnQDkgMYjaRTvZBLNw4T5+hXeS98/U6faWHfhPdTHQSxC1lw58yxbwBRk9mYmR2jIXWPnGuZcCxUVbGRZmoWGjWYAXZ/DJUtWmURiKIKQCWLlLfmB2+5NEbmodZ2HezcvT0T9ofDiJIHV+wpbCJgkzYbMLtqL3LnHJQdJr9dlRJBhGm/u8qOiR+hJfJAp0L3g74sDPdeX5c+gjZU86IL6ewl5nDdKjNCUTcYdVmEAwXXGnj1M9KuJJZaZjw6Cdgmw0MkfrJx/9vjfLWQU5TatpmCqyrhqkjcD4CCAU4H7eddg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BgMkcbAH; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RCpxvbjO; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BgMkcbAH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RCpxvbjO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcZ2SZSz3bcj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8LuODrccx/EBs9A7vTNySqHbhe9k9tI08r8Ga0Xgcs=;
	b=BgMkcbAHy1/eVRLRmgt+sjcBKKoLlDiVaBgDx7ZFsNVFKXo8Str57NYXPa38pr6aN1/dXG
	cxd/FwKChObXG6wgBnhdhr6PrE/hz5cHkC2nc16nOqhSSEk6UxNYL8Ub5hZXBfjhXcBtAw
	G65q+hM6tZb/Z/I2ED/Usg8o+Xn8dS4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8LuODrccx/EBs9A7vTNySqHbhe9k9tI08r8Ga0Xgcs=;
	b=RCpxvbjOuT9c9cUHmHHE5gQUFTBlbTEwmuAgOTHzu85isAMX9Ys2O/Dzxuxty2AeJmlTZd
	Yi71kmg/V0eeFa/FhWft8CI6lA5skAJej74NnLso3yFPKi7orD81JTKp++xzagG9SKGc+D
	43nG5LqNvrX+srGE6OCU7JUTZidScBE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-K1Dbpj2tPrCFHPUVXJw6eQ-1; Wed, 18 Jun 2025 13:40:42 -0400
X-MC-Unique: K1Dbpj2tPrCFHPUVXJw6eQ-1
X-Mimecast-MFC-AGG-ID: K1Dbpj2tPrCFHPUVXJw6eQ_1750268441
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso47059585e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268441; x=1750873241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8LuODrccx/EBs9A7vTNySqHbhe9k9tI08r8Ga0Xgcs=;
        b=XSiA6brKT1qYt/dixHeBVXNoyNWhnUFyno2qu6pWJUaRBu7zvAu4+JAEz+t4zUGYts
         wxK+k4Gxw5t43Lgcx3y0cWkyJzoDos7f6cf+mBJ/bVV84quAt2XLV7znVBLURQlzwgT0
         zBwn6/+Fa5YqQ/hC2Yd7TA3yqLl7Ocxe0Sm+qlfcSHoIgV1IUOmImENgJhvar9fXAdnl
         ZvpR1E/kCtfVgPbc3d41KlfBcjkc/v5Gpt7NFJzwHoA95UgGz2mXApyTS+7OzYCTZZe+
         HlBpDStiE8x3isRN/vFI4zPXFRrqBX6om2BIwxZN8QvHKYX5lmpfRu8yrMCv2dAeNJWg
         Atzg==
X-Forwarded-Encrypted: i=1; AJvYcCVCK2cmauwy8jSiIAA0kElwA6PwGwEY/Ec31f7SWLKICJ6dccaMWjgxmsMSNACgymLIpiyvQTEZ2jbg2zk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBn/eHJFY5z3Bfo7HB50YgEgfjpaPMaa2rxLgnrlLAHfSu56ZV
	LFwilcesGmfQyg7VLLjDwl+rgtfuUN3hBrpFnGJlyolTADxBC0USm9l6u8vuamCduC4134ZQDIh
	qMPIaaexmYboxSB1HWNWcMuTwKlrqXnzNHxiRc64j1S99RHDxY9Q/g4koAFgUMwYek/8=
X-Gm-Gg: ASbGncv7DX2J1c671hFvCC8ic3iQVH/WePR8V82xMMly+J6Yt0ZCOjH18E1OAIaacMc
	Qf3DfYu6CzCzeGtbhrLy8QOW0V8FnNpq7Iq1YLWHJa5BohUlhVUcYaaxeaCNdL22/mUWn8YU8JG
	ReYeUW4hqcMi379Ays8TF1AkkFcJ11oDK6AY9yxfYE3+HZvxon/xDDcHWrqOUboxdGzT7/sD3hC
	tDOoaYGaYe8ynpVhS1BUjVLWFiNCEXaDjeKeXojee68wjrIfEXHuaV1oYHLUG84+ZEpLWT/Djjq
	Ak4tzkLJNlzPPjWu3oGj4sRm8FCshq3B9xkGCnjGKgrn7D4V1mBVzNaYUzMmmF2hPc9GaaYsqWP
	vDbEjiQ==
X-Received: by 2002:a05:600c:1ca1:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-4533cae6605mr166407575e9.8.1750268441178;
        Wed, 18 Jun 2025 10:40:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc4TaNXORzdooVLODlvwGNYZ3WZPNGmS5C2sKfTSdPVLBbA2Ps3b4UKdLfdRWvy1N8seVTmg==
X-Received: by 2002:a05:600c:1ca1:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-4533cae6605mr166407185e9.8.1750268440690;
        Wed, 18 Jun 2025 10:40:40 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e97ab95sm3814165e9.7.2025.06.18.10.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:40 -0700 (PDT)
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
Subject: [PATCH RFC 09/29] mm/migrate: factor out movable_ops page handling into migrate_movable_ops_page()
Date: Wed, 18 Jun 2025 19:39:52 +0200
Message-ID: <20250618174014.1168640-10-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: L4cGOhv7KQBdb9ZGu_7RxkiKjE0yEai4lKZy6UJHBzU_1750268441
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's factor it out, simplifying the calling code.

The assumption is that flush_dcache_page() is not required for
movable_ops pages: as documented for flush_dcache_folio(), it really
only applies when the kernel wrote to pagecache pages / pages in
highmem. movable_ops callbacks should be handling flushing
caches if ever required.

Note that we can now change folio_mapping_flags() to folio_test_anon()
to make it clearer, because movable_ops pages will never take that path.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 82 ++++++++++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 37 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 32e77898f7d6c..456e41dad83a2 100644
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


