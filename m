Return-Path: <linuxppc-dev+bounces-9906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BB3AEDE07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:03:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5ry223Wz2yb9;
	Mon, 30 Jun 2025 23:01:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288498;
	cv=none; b=KeiFNzjLNOG1MtUMwqic+HN6qkbizYgqLitg5NWyHS5bdyv/gX5C+t4sr6LN1eMW/yp6171abYpS9yC6522iLe4CeYCMVxY+rgT2MJmSHOYI2TOt0NrL36m1XXkGqfDim6c7qqh4o3BfgPujZw+UvyydMG5lRHabGFOM1vtzizhbZfAqPqjZxnMKndpjwnRmsAGhAb7l7I4jLy6BQx6b/V+ZzdQmaiL7kGwrWZZupV/ztoXkZ0VgTBsxpjs8PNudnvqFO301xVBXWE14PFQzpouU8gqDzHew0nlx1+BzCw6J8ME6lfGNafW6RMgU5ynEbIbpDcK44aJI5W1C2IJFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288498; c=relaxed/relaxed;
	bh=1QasDl39udqF142inQM/Baaw9xGb/E/13xzKchOHRQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=I7pXGIUuDVMesIdAccAQ2/4KrFsBtV8M4XSiBS/IUVMA++rFmocs6LdhDm8vFtjn62nq3/pOwPZxCFh1A/qM28ROGq87KKhboqFvmWlaBltd0E1Ir20VEB4tOdY/+L0gKadCFYG2u+/HfrO8yeomMMoux34a7PhRETvVQCm9o3e9n3N5sCRV6ZzTyuQ3yFlthTCVQGkLPUjfed94/BgJdUP5J3+yvn5szOnZF6Mtf3U2cbLuYJrFdo+DjNd3/mONPoXhdATAcmczC/k2DQ3EnCaVudVaPtOwCie38n40mJHEvqpqC4hqcIL4eqy/PgyQCf57uCyj77nMWrA6FbyrIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jR+fvUZx; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jR+fvUZx; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jR+fvUZx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jR+fvUZx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5rx4GbNz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1QasDl39udqF142inQM/Baaw9xGb/E/13xzKchOHRQc=;
	b=jR+fvUZx0H2T+WZZV5/cwwNdAI3pHWiiXOVo2FSGoJVu5Vx59FP54qSOznq8buMIzsi+6x
	tEQ8I/KUL3zhXTiUS3hc34H0JMrxwf0UxA/b0z28HkUAnG3OqlTeJfWfxnvOd4JYQvO4kz
	j8QNEuq+Wj4sOvkundyNBDQZzE+CvXc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1QasDl39udqF142inQM/Baaw9xGb/E/13xzKchOHRQc=;
	b=jR+fvUZx0H2T+WZZV5/cwwNdAI3pHWiiXOVo2FSGoJVu5Vx59FP54qSOznq8buMIzsi+6x
	tEQ8I/KUL3zhXTiUS3hc34H0JMrxwf0UxA/b0z28HkUAnG3OqlTeJfWfxnvOd4JYQvO4kz
	j8QNEuq+Wj4sOvkundyNBDQZzE+CvXc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-61qv33ECOBi_XAKGpYb7Xw-1; Mon, 30 Jun 2025 09:01:23 -0400
X-MC-Unique: 61qv33ECOBi_XAKGpYb7Xw-1
X-Mimecast-MFC-AGG-ID: 61qv33ECOBi_XAKGpYb7Xw_1751288483
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so21887755e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288482; x=1751893282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QasDl39udqF142inQM/Baaw9xGb/E/13xzKchOHRQc=;
        b=HFy4HysI/AGFyHFi0CYo1qIkG6wefWHuvuYNIE0thnPJ5L3uoDKEhA4kcX4wCaUYoc
         sC3hIbd6HvLLWtkepOYUNkiw9MGaXHkLsFTYez38Og0hlvWqN42QZ4iHb28Mc1sY8OTa
         GdzSE1Wyxu5SK8jfm1CULhQh64gUGfXKMrBvtr5nyJ+JBQcswKvGBqF+0sYoP/iOTYzq
         djg304X1g+k34qtvvz9Znvblu2NEu3vYW4IKic+bfUkyQyS5dUeHwANRPaeMaCAC5uhH
         Gc7GWt+vmzb+1ykOBmGaITebvksLolkUhjGM9ZUkvtLZgmpu3zF14qeJkS7H/ZAuVV7s
         2vJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6n4oBUAbYF9EtUx54Q/6XXCgt7fQllTYKffjx0VABlns9kA8WpDFK37G1JXw6RLFmGb4HpovwwUHvQN4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJ866AA38LuBr9xPzCu/QACOTE1MgfTZkV+wK32p0dxu89yiJv
	xU6sxVv9bL7CYmSQ5EUJpa3pV5epZhHbkxmjHHTuI7clb9X6JixDmcRMnZZmPwOwiJIM1vf7eGd
	O5dkWRgj8hc9hRj1krQstMR4kd84GJq8xf46Cox8dGctzxwPai8OGuduWmFoxJhNIKB0=
X-Gm-Gg: ASbGncuTIruLuDNuF6SI8fooV9fkMRDP+McGc00PYE0FnS1ai3C68UNptH0O6nqhXZr
	Bdqnnh6LcxbitFLrO2JA8iL0RSR7RQ8o8fDfU1ZZLsELs4rr9LXrscZWcQNkV8RgknRak4dtO9U
	y4RznAjqO47zEFP4ciKFOrcK3nU0fplqi6JSS2cZmr9LRxCexKH1HLddcd2q2TOpgo7BPup1dJ8
	aKwgXGTe5kw3uYB1d3NUnIbbu1pVNXhW6PQBjJy2qLraEcNDKTUF2d0cg2biSd29UJJuZSOJlmw
	G0PtxKbsv9HrccuPBtEWQMmck0hmYriemoOTBjVp6A6Y9bKwjkqYbZAdDsOCYW+KyJ79XrwUaR+
	lhzdQ5Vk=
X-Received: by 2002:a05:600c:8b6f:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-4538f9b3107mr110835275e9.6.1751288481860;
        Mon, 30 Jun 2025 06:01:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBR/gPcUn8RUWOgibmcJHz2SRyFZ4ktYe9xvVAqHy7XBBioQHhn6lWeSN3C2mJi+xEdsRK1w==
X-Received: by 2002:a05:600c:8b6f:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-4538f9b3107mr110833985e9.6.1751288480607;
        Mon, 30 Jun 2025 06:01:20 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad0fesm169286405e9.25.2025.06.30.06.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:20 -0700 (PDT)
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
Subject: [PATCH v1 23/29] mm/page-alloc: remove PageMappingFlags()
Date: Mon, 30 Jun 2025 15:00:04 +0200
Message-ID: <20250630130011.330477-24-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: iNY-koKO6hNZhoFCs2gv3tbkve_gf9gOzuiXI_1g2jY_1751288483
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We can now simply check for PageAnon() and remove PageMappingFlags().

... and while at it, use the folio instead and operate on
folio->mapping.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 5 -----
 mm/page_alloc.c            | 7 +++----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index abed972e902e1..f539bd5e14200 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -723,11 +723,6 @@ static __always_inline bool folio_mapping_flags(const struct folio *folio)
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
 }
 
-static __always_inline bool PageMappingFlags(const struct page *page)
-{
-	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) != 0;
-}
-
 static __always_inline bool folio_test_anon(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a134b9fa9520e..a0ebcc5f54bb2 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1375,10 +1375,9 @@ __always_inline bool free_pages_prepare(struct page *page,
 			(page + i)->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;
 		}
 	}
-	if (PageMappingFlags(page)) {
-		if (PageAnon(page))
-			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
-		page->mapping = NULL;
+	if (folio_test_anon(folio)) {
+		mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
+		folio->mapping = NULL;
 	}
 	if (unlikely(page_has_type(page)))
 		page->page_type = UINT_MAX;
-- 
2.49.0


