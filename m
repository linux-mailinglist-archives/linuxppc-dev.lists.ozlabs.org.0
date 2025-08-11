Return-Path: <linuxppc-dev+bounces-10808-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9668B20C2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 16:40:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0y360nsdz3d2Y;
	Tue, 12 Aug 2025 00:40:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754923201;
	cv=none; b=e1ppaKbs2StQkewE5EsKFrQhuYArIwrbp3At+SZeDuZ+SZa5Gd//Z1qnjdHlb0lCX2USmQcJ/aT1PfhLlg+MA6JNoq5AyC2yenIi8JaaxQ4sMMtwpL19PJqkyVXdKdQBIrPc95I/V7oPKd7gRg+8w1fwZif0LXKMQYCG1pdOWSYV4hH+oI2g9w2O7WDoXxmRNJql9e2OUBsAL1M2bk4I/pWOjwkMrupP8Zl6PgzAdXELBt7OJp47kkgaCSe2qQ0myANUyTv8KjnmlpW7P9dtxziFKMazEcLnoMZ3VAXZx5IeVNIzg7pfIngy806R7yH5VmjU1yrVb7M77NBMjmlGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754923201; c=relaxed/relaxed;
	bh=xm0iYFfBOfajjEoxheRfcdwl0u9A+taNg4Dew7papsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=aCjfbwvKL1T3fC3D+HnNZSd6HZstneIaNwudmAkrxsc49UA3undKrpIZw/hMif+xCcakDuFplw+J5JN+tGU5GBqX0fjfM+skfyDSZpNx+Gd9DhMN47hBISbo+lgqaPbjR/Ai2xl4FxLoobzag1LRQ0MorCk6Sa3rmKnIEWbunknatibIQDGQY8Jdf630pDh3wo0tgYlFzCH3ffF8asPxPiOEK4exKjUhpUngx2AY0dmrHZD55btTw79RwYtxDmvU934S7R2CIHXDdi6HNxk2Kso5/AOIO0vDqWNvc2dBqrAlCdroh8ir9DJn/uG8uAWzGFTlQCiYRTdMar67EXRLbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dUoPjph8; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BK8duIhb; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dUoPjph8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BK8duIhb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0y3470Y2z3cyc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 00:40:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754923197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xm0iYFfBOfajjEoxheRfcdwl0u9A+taNg4Dew7papsc=;
	b=dUoPjph8tZ8IEfYRdE+czPf0/abbke/oGvlv7H79sGldVYQYBoPprCZ0RiHGTtM5T0SGoE
	0F9aeyUmA4sCfb57CQRT1PbBBKXa/PfKG1p12E+KOQMd3tQIRP0l0ar1yuOTuzGgFjqgRb
	ZVHGp9bQmawHI/9/Wghr4xbisJSEXXo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754923198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xm0iYFfBOfajjEoxheRfcdwl0u9A+taNg4Dew7papsc=;
	b=BK8duIhbdJ45RrGzqhmGe7toDrP6grpo6TtFIZJWI2oWHsxkERe+rVlrB5A3qMo7WhrnTP
	j/pNliNhztg45jifoKLXSz6vkeg8JNDO3DO6XW6iQB+LNHajSYyTwQDvt+lDAtScEigepL
	8pA6WzTKhG5orRpgfwrX+eKSYuEDMZE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-bO55ud65Oku-ldPpMNqE6A-1; Mon, 11 Aug 2025 10:39:56 -0400
X-MC-Unique: bO55ud65Oku-ldPpMNqE6A-1
X-Mimecast-MFC-AGG-ID: bO55ud65Oku-ldPpMNqE6A_1754923195
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-458c0845b34so32874195e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 07:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754923195; x=1755527995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xm0iYFfBOfajjEoxheRfcdwl0u9A+taNg4Dew7papsc=;
        b=KXJgEzkv1Qu4ZCQraos8W/oqQKrpfXi5nV7rkUrI2fzQIhpujQYSofvC0CepATGpXk
         fB28fbfanHho+Q3Q4XD+m9Jt81EG22/S7Wiyg2jeyTsCe26W607LP8bdUqxx9b75ydXP
         jn+oJZnSL33SEYiSR+WwgwfoeGuMRBnoo9EfOUfgQHzoHVGC8ADxKT2AQepONX49QecA
         2o/IqD53Fkefq5XYWk4SBSVb7rq5o7SJDA7gXhdW8ZSqsakaBScgYYJ0prozZuG/37IK
         PSJ8km4vXJg9WajEOj6LhZHZJhX2YmJ4MfMCrPq8Srs4Ej3MrHOcl3rBXqvAVN/66iuJ
         cO+g==
X-Forwarded-Encrypted: i=1; AJvYcCV+8jWD77PnBQ7mL7sSorM4PNedkWEM8b3x4gtBsZchhHoks6G6djj+dKr6nDr8hZoSibUPweXDPlp0vjg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuDWgiEib7DZQVZ1k7zreXmJi89bEbdWfXe0uJMgVW6DsyzTHw
	ySpk4iSHurQn/6aAbqqk/+QxzlM+uTJGmtsiwz51QLSVlMAAkIJqsTyKfCvpuXb3P5NJ/lG539r
	H5f3VZC3Fay8zMSbWt7U2n4ZfD8ZUa2hjsEXYHA2r13EdfTuEcitOIynBnkELT1X36QY=
X-Gm-Gg: ASbGnctmr8Luk1giP2xAGV5MFRgXDyt/o+lNfvaXFAVCHGGkQcOoWgZ/vikvu3y8fl/
	FjGz0Ws62PRKlbDl5817LFYPnTpN+gIIWmx0AgbY7RF/7ULs7c0eZpaVl8fplpEwIebcef4Atsi
	liBROfpn7Ktt3fqgnVenvmEzt7orRdEdADrCjSbIH2jzGvQc7e18DB1MGSEZYPBiS1owEJm44kW
	1GmS50l11hiq78NiufxP3qoPQ6/3e+HY7VrSIeH00/D5/Y1n2nVlFKKcDchmBziubn3lzav2FRw
	T/YOWEkZm5ljfSN6/Ih9v7tnpe3fVrZeZG3BnB1tKie3hPJB6ulQXp+5Vf6K+jP2V0pVZioys1V
	voDQDQrqDD5wBrMjw1Xo988rE
X-Received: by 2002:a05:600c:1d01:b0:458:be62:dcd3 with SMTP id 5b1f17b1804b1-459f4f9bd34mr130468445e9.17.1754923195007;
        Mon, 11 Aug 2025 07:39:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiigg+0PNvGEb3wRzSSq9JM70VE9hLMIH2EVbNkuJbtlZWW3Ch7GW5N/kbNcHDKqZhLgst/w==
X-Received: by 2002:a05:600c:1d01:b0:458:be62:dcd3 with SMTP id 5b1f17b1804b1-459f4f9bd34mr130467845e9.17.1754923194477;
        Mon, 11 Aug 2025 07:39:54 -0700 (PDT)
Received: from localhost (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de. [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459fb43b491sm120611835e9.3.2025.08.11.07.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 07:39:54 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	Benjamin LaHaise <bcrl@kvack.org>,
	Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Kleikamp <shaggy@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v1 1/2] mm/migrate: remove MIGRATEPAGE_UNMAP
Date: Mon, 11 Aug 2025 16:39:47 +0200
Message-ID: <20250811143949.1117439-2-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811143949.1117439-1-david@redhat.com>
References: <20250811143949.1117439-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: DzFN1dHvQHU9yx9MndygdLWO6CU6EqBIe6FuLGsp-rw_1754923195
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

migrate_folio_unmap() is the only user of MIGRATEPAGE_UNMAP. We want to
remove MIGRATEPAGE_* completely.

It's rather weird to have a generic MIGRATEPAGE_UNMAP, documented to be
returned from address-space callbacks, when it's only used for an
internal helper.

Let's start by having only a single "success" return value for
migrate_folio_unmap() -- 0 -- by moving the "folio was already freed"
check into the single caller.

There is a remaining comment for PG_isolated, which we renamed to
PG_movable_ops_isolated recently and forgot to update.

While we might still run into that case with zsmalloc, it's something we
want to get rid of soon. So let's just focus that optimization on real
folios only for now by excluding movable_ops pages. Note that concurrent
freeing can happen at any time and this "already freed" check is not
relevant for correctness.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  1 -
 mm/migrate.c            | 40 ++++++++++++++++++++--------------------
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index acadd41e0b5cf..40f2b5a37efbb 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -18,7 +18,6 @@ struct migration_target_control;
  * - zero on page migration success;
  */
 #define MIGRATEPAGE_SUCCESS		0
-#define MIGRATEPAGE_UNMAP		1
 
 /**
  * struct movable_operations - Driver page migration
diff --git a/mm/migrate.c b/mm/migrate.c
index 425401b2d4e14..e9dacf1028dc7 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1176,16 +1176,6 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 	bool locked = false;
 	bool dst_locked = false;
 
-	if (folio_ref_count(src) == 1) {
-		/* Folio was freed from under us. So we are done. */
-		folio_clear_active(src);
-		folio_clear_unevictable(src);
-		/* free_pages_prepare() will clear PG_isolated. */
-		list_del(&src->lru);
-		migrate_folio_done(src, reason);
-		return MIGRATEPAGE_SUCCESS;
-	}
-
 	dst = get_new_folio(src, private);
 	if (!dst)
 		return -ENOMEM;
@@ -1275,7 +1265,7 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 
 	if (unlikely(page_has_movable_ops(&src->page))) {
 		__migrate_folio_record(dst, old_page_state, anon_vma);
-		return MIGRATEPAGE_UNMAP;
+		return 0;
 	}
 
 	/*
@@ -1305,7 +1295,7 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 
 	if (!folio_mapped(src)) {
 		__migrate_folio_record(dst, old_page_state, anon_vma);
-		return MIGRATEPAGE_UNMAP;
+		return 0;
 	}
 
 out:
@@ -1848,14 +1838,28 @@ static int migrate_pages_batch(struct list_head *from,
 				continue;
 			}
 
+			/*
+			 * If we are holding the last folio reference, the folio
+			 * was freed from under us, so just drop our reference.
+			 */
+			if (likely(!page_has_movable_ops(&folio->page)) &&
+			    folio_ref_count(folio) == 1) {
+				folio_clear_active(folio);
+				folio_clear_unevictable(folio);
+				list_del(&folio->lru);
+				migrate_folio_done(folio, reason);
+				stats->nr_succeeded += nr_pages;
+				stats->nr_thp_succeeded += is_thp;
+				continue;
+			}
+
 			rc = migrate_folio_unmap(get_new_folio, put_new_folio,
 					private, folio, &dst, mode, reason,
 					ret_folios);
 			/*
 			 * The rules are:
-			 *	Success: folio will be freed
-			 *	Unmap: folio will be put on unmap_folios list,
-			 *	       dst folio put on dst_folios list
+			 *	0: folio will be put on unmap_folios list,
+			 *	   dst folio put on dst_folios list
 			 *	-EAGAIN: stay on the from list
 			 *	-ENOMEM: stay on the from list
 			 *	Other errno: put on ret_folios list
@@ -1905,11 +1909,7 @@ static int migrate_pages_batch(struct list_head *from,
 				thp_retry += is_thp;
 				nr_retry_pages += nr_pages;
 				break;
-			case MIGRATEPAGE_SUCCESS:
-				stats->nr_succeeded += nr_pages;
-				stats->nr_thp_succeeded += is_thp;
-				break;
-			case MIGRATEPAGE_UNMAP:
+			case 0:
 				list_move_tail(&folio->lru, &unmap_folios);
 				list_add_tail(&dst->lru, &dst_folios);
 				break;
-- 
2.50.1


