Return-Path: <linuxppc-dev+bounces-10096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B64EFAF900C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCT5BkRz3bft;
	Fri,  4 Jul 2025 20:25:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624757;
	cv=none; b=fgRoLfP6nc6Llai3xMvGUmmvC9vMLXCBX7ShSaKWs1OW1M9xdKwSUxej65cIXpc3ZSTNSzI15kWp3xLlUS1uMSMXAvTjkosAubGFFmpgWEJLovSEpZSnMHKgOayEEZRzObLQ/h3u/qlUNEe5ixFt4QEpUJRZJnGP+HGaYTHQDqCFld4mrbgHDcieXe8IRlTnNe0RgcKyXXCpET+ibb3MRAnKQD86DSyWfsLjUqur/beEfa269yVXjDWWBe+Gbqxs+BzeJhb3Nszb7BRzTh56kRI9P9H5AI8YOJCtPjPqcQ8gHY3ZaQjfYKrur5DHSF1t7TnWyIYHWTDd3yA6MLE6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624757; c=relaxed/relaxed;
	bh=OVyour2UNFNS7aNaSR0hE5hzdL3B1bhwCvX/GUFQiSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=C/XAju4TbyXiaKE2DSb3flgeNuBPRGgRJfisma1z0XJH06S0/2fNJG1+99r5qHb+tes3KsFC2/2e4f3axbZ2HIFRWcuw+AbYbAIrdzCtWPj0KxkfH37TVCHQ6ujsfdbq8srJjrt4UEk8gbQnC79m+NUqB92srbi8GTBhrNEFyr7ZFx8NSv2sfr7IBP5L+1HBTptMCxZxMGjQkqlNPCLQd4ykm0/U5f/ny+7DMKQkQsZDL7hiJ3m6OTEUXoKPqC2mHO+iNTTKnbeGYyJUayPZzkTes2kVyzmIswlGt3XcWvBW9k0fWf51kcCj3VSOrbDC5HWA/tv02rTJzKY5BwG9xQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W1srpfHS; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W1srpfHS; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W1srpfHS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W1srpfHS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCT010Tz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:25:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVyour2UNFNS7aNaSR0hE5hzdL3B1bhwCvX/GUFQiSw=;
	b=W1srpfHSaPp5GZ/pMVWBJJdydFMIBbZiCZSqpTnGCok1GU3kFUwBYxmYltMs6qxKpa1MYm
	nbCZF71b/pXb+X1w5FD1QwKFoNvtu+EOLOSlq7sGRbwMerOmCbHb2YgMXAsVMEFvf66atR
	Zlh/z/BeLbzHeOmojYlnFKQCIa02T7w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVyour2UNFNS7aNaSR0hE5hzdL3B1bhwCvX/GUFQiSw=;
	b=W1srpfHSaPp5GZ/pMVWBJJdydFMIBbZiCZSqpTnGCok1GU3kFUwBYxmYltMs6qxKpa1MYm
	nbCZF71b/pXb+X1w5FD1QwKFoNvtu+EOLOSlq7sGRbwMerOmCbHb2YgMXAsVMEFvf66atR
	Zlh/z/BeLbzHeOmojYlnFKQCIa02T7w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-xrGxrIYxOdGXet4_Hp2-dA-1; Fri, 04 Jul 2025 06:25:53 -0400
X-MC-Unique: xrGxrIYxOdGXet4_Hp2-dA-1
X-Mimecast-MFC-AGG-ID: xrGxrIYxOdGXet4_Hp2-dA_1751624752
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-454acc74f22so5102705e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624752; x=1752229552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVyour2UNFNS7aNaSR0hE5hzdL3B1bhwCvX/GUFQiSw=;
        b=gQhCuWbBc9mLCWr0wJarQBNqD8pHN8jnrxFPp3arx26PTwCGPgZYOEoicyoRYXP0V2
         6O5P4iWkwB+ZPV1/hWYjQUidiQ2sQSCcgOlV1/G3FZHObOIQ99b4dSV8RWTrM+UzOIST
         wm3M6zAr+0ivQzFOsNlCW7TbW01juGwxe1SrYe6pxetQb7HYZVxwvAWfIxJZl8glq0pT
         DU/Xxx/qNeBYVwkYPq2nKp51RT1EmwhUWzGXtGPnMKv3+fpC1yk447MOuAmY3lkPlPc1
         G26HllepSdEHog2cc47wIs5Do2um3/j9zYaPpPLlyBEM2F/UcjYlHfsY2fHcpkEulnJh
         QHpA==
X-Forwarded-Encrypted: i=1; AJvYcCUjY9LLF+/AeUcEuCOvs0jV83hlDRClfgj0ois14QXjB19hbaT44iVFQADFNp1IAXTHeWPUPTqOA1Uvxa0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzeDKXfA1N/RuY2D2h/Pe5mQUYDk1jT0uHRHDJlujQVp2sJZTTT
	vR10W9QRUIC0D3BB8SZY197moj+/3fQKRNf7erxPEL73uP2dWGbzkbqLuEQVfjmdmQLCwq5mpXO
	F1/Go9y9wFECCC/ETPL7aKVhkn42nH0AJ648vYi5NMUOgBlWmJi6vETytTEewkrDISi8=
X-Gm-Gg: ASbGnctKHuqtKry3ou7C5JZkmhxvcl3zIIfVHyB7edPveBAg+QxxmUo56mjbUF4utOt
	jPx/vIWVpH/PohwjU8WjKtSNDy7ZibVPojAOvPChPQI9louzGlFUqps/loX0CYcAsHFJfjT7KyQ
	KEk5KN8ZsIWXXvMaIiY9JhKIzorUkRoPSbGEUo/OvtshNZNGjDqDOhDzjPAMbbc4IX+u5vcZFUG
	aPp5J946+9sM3XTHHXPBx6YzqPvBok2FpzElHrl9trGcieXm5dnASc5giflh7Yzv9LuBe8X0s4O
	KAEb5YwGTAnjSMsBVu6hGp1fKMK6JS7eZomQXiq9U1LJllCB+7Js0qz4INmVuxydhSu0RBXMyK3
	v4kqzuA==
X-Received: by 2002:a05:600c:4f07:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-454b835631bmr1455875e9.14.1751624751465;
        Fri, 04 Jul 2025 03:25:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2Rez8KVGPQFiDbU29hzAgNjBI7xFdtw4twkMv/+PHLeFt8+nZnPGBAy1buVfR9Z9nLRQVCg==
X-Received: by 2002:a05:600c:4f07:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-454b835631bmr1455215e9.14.1751624750855;
        Fri, 04 Jul 2025 03:25:50 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454b1634b0fsm22804075e9.17.2025.07.04.03.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:49 -0700 (PDT)
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
Subject: [PATCH v2 08/29] mm/migrate: rename putback_movable_folio() to putback_movable_ops_page()
Date: Fri,  4 Jul 2025 12:25:02 +0200
Message-ID: <20250704102524.326966-9-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 7Sxgc313VbYhFOgqXUdkFxvAO3JRxLkrk8sbvYLN3OY_1751624752
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

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 2e648d75248e4..c3cd66b05fe2f 100644
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


