Return-Path: <linuxppc-dev+bounces-9891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97138AEDDE4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:01:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5r12zQyz30FR;
	Mon, 30 Jun 2025 23:00:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288449;
	cv=none; b=GEs8GWg7Cjpl9NXcJWHmWQwkBSHSiUwnNsycVObutU7GDRSR0KZlyMWD6v3Bc1cidGhrQmhQb7l8tIbyH+pQI1S+UX9YWbisxwv7+ef58awxVnObgACgy666npIZa5A83qNXJhYlSct1jKVrPn9QCbx15w4MRrW2N8qf8q1zR4AekukMpkOX9iQa3fNASq9DAYtoAc5wscoWhRRxoMNA53CvBX5ICFCX3EcTYoxXeAxrTKlT3CP3zRJPYPhcqAijNitFpZG0LSCVLOpAWfdTSOmJLEOija/e7BST1wiuk8wY9jes1PLr1GwhUiAS9wcO6iySmCqojU+FXaYqHhPvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288449; c=relaxed/relaxed;
	bh=ZjlP0D3eY9tZf8Nb4qLq/i9Tdq3zqU6lo6GiM8rDh3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=FCPwYEbdoRC5Naip5rImvLgmfLGM8yS9NJGdBdMxbUyMA8HYnYOALcc3UN5M7NGyM4vfXZfg2vwoB8furg6VRROxES7O5DbEIxCaE4jB98uNsiZS/cM+7XD+pJpUMuWkdy4N0bNvHxSakN0l+BGZ54LxS3nXhEHfVgZ8C40dvdz80Xy/Hp71/Iezm3/Uj8j9Q22FMM6SUIqIXvAjWjdg7EzQBwdPuEvJUL+WhlW3TY5n57ZEZAV23GZOO6cNqy+FMv1/2627ZqvDEHOcBjL0skM5Pgog/94HQqpmOTgsdFX9feL75IbCDr4t0O0R+4LbnrkbAV+AxOg4iTtS1nvTiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ABmWTlWb; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C8DCVh/X; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ABmWTlWb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C8DCVh/X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5r04Vfhz2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:00:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjlP0D3eY9tZf8Nb4qLq/i9Tdq3zqU6lo6GiM8rDh3E=;
	b=ABmWTlWb1KB7UviZe/agxfh9gHMlU1MdVRVTsOH+Kea0TAsGx2PqSBo3mUVYkVo/6wMKMW
	+QQRn0n/uwF5FOwipiiX2RsD/8wK8OFmWbnrZX93b/OyC9rq6/cy0sc9+XxX8UzR+y+h5Q
	W+LOVxdc+qMxz40oR2vx9yGlzzu8u2Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjlP0D3eY9tZf8Nb4qLq/i9Tdq3zqU6lo6GiM8rDh3E=;
	b=C8DCVh/X2rny60miyG1JnglYGXYaiiE3IKnaIs/VuiEa5s4xm0y8PcaIMXA69kJDxHVUnN
	rrMhrcOHDz5hIxPagcBHrp/NtLdMA/wmLbq/JP5qdH9hSZI70UAckp2vNe/QvuaesR4Zh8
	InMwirAzpSRd5jSvgv5QnsMsgfQsKAk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-44sMqM7VNMWExjPX4CBzFA-1; Mon, 30 Jun 2025 09:00:42 -0400
X-MC-Unique: 44sMqM7VNMWExjPX4CBzFA-1
X-Mimecast-MFC-AGG-ID: 44sMqM7VNMWExjPX4CBzFA_1751288441
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so2651999f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288441; x=1751893241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjlP0D3eY9tZf8Nb4qLq/i9Tdq3zqU6lo6GiM8rDh3E=;
        b=FrKwDKG6NFuvOqRLjiEh40UhE91Bo4JI2Rdv+acT7r2HATt9pG7DUIBqhM3W79RAxj
         dQ1fW2+otGAC5+l14NVuAIyPGm8Dzl9n6ZGcSTpyUT4ACBoK8QA4wU7a15mvzMsCUwew
         PhJLgexIRrgcahljjM/lRf3KYFOFNYB47eQgXH546KYByFQQinsrnxazTa3DoiqlQe/f
         Ij6AJEr9KBml6Nu9SpVqKz3ymTwZESTGXuclOrmFud9z0fBS2rhG+DI01bwLI4rhxHe/
         pLtGZpzQyEUkJtf/cO3wcCdzxADruejt2uKJRYQNp0dyEs4IdvTPqO61ojjAlEm1Rw0u
         ASvw==
X-Forwarded-Encrypted: i=1; AJvYcCUio5qoyMEjDtKBP+L+K0eZwkbmCHC36BLgLVf0r00Sf93m0UsfwXYrqgsyDOtKIr8gXaC5HqtEWIqIQMI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwivYfMMAGAb6Ww3ZDtPiDCuX73AF8F6qFk9g3JbxXtS5Xk2gzn
	ybJBIeJ6DZApuVBXeKXPg4JHDyR0VRgVcgfGDCApsv/vLkVhXl0DjnMDBAhQgEOlwj+eQkcHt37
	xgS+Dj6c5dYy+YwcCRZDVDPfXSpqlhmUtG4mStyB/NAiXYLK24DOZFUOWGmBz6jEoIes=
X-Gm-Gg: ASbGnctVV9MfpXeYlVrzZx8yVcKz/VBMG6HFLqEZppiO6j55ivS0VO8Ey4EdXErww72
	BMXTpoRJTpqTVIuamxlgXtcAhc27uHl1AaB8zUqzDrjrQLgOm50xzxPjY7zXVhpY9aT8BpwQbzQ
	vBa057gzPVgNGfKck6p6fZfBHQjje1d1hsRolRuD3PbnfZMtaaHTUtNV+VNRhIFYrLcOmcTx6a4
	7q565wxdWVBnSdv+NCjVL/hPriVILPzMAVKFNP+PqjnJ62uegb3Qj2qD7gAlo82iSAOtv4VIwvQ
	CIMoqUxlAfrzseGgePIreF436BVT6u+hygEmut5kLYS1ryAluuETUo44pWr1Jg2ujaXPwD2PVqA
	6+a8QgiI=
X-Received: by 2002:a05:6000:200e:b0:3a6:daff:9e5 with SMTP id ffacd0b85a97d-3a6f31023bdmr13743596f8f.7.1751288440470;
        Mon, 30 Jun 2025 06:00:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaNYb3ONKvqKvr320nfpncqFiQLJi8PiPIyho0Wzz9N7dVDIemJ3QiyBdfpFdZCgx38anKxQ==
X-Received: by 2002:a05:6000:200e:b0:3a6:daff:9e5 with SMTP id ffacd0b85a97d-3a6f31023bdmr13743499f8f.7.1751288439567;
        Mon, 30 Jun 2025 06:00:39 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52ca4sm10445235f8f.58.2025.06.30.06.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:39 -0700 (PDT)
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
Subject: [PATCH v1 09/29] mm/migrate: factor out movable_ops page handling into migrate_movable_ops_page()
Date: Mon, 30 Jun 2025 14:59:50 +0200
Message-ID: <20250630130011.330477-10-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130011.330477-1-david@redhat.com>
References: <20250630130011.330477-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: ZbN2u9TiaW3JEfgTLcwiqVxX0e85A6VIRL28lCwoHh0_1751288441
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

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 82 ++++++++++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 37 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index d97f7cd137e63..0898ddd2f661f 100644
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


