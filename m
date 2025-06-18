Return-Path: <linuxppc-dev+bounces-9474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B47D7ADF45A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:42:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrd040rMz30WT;
	Thu, 19 Jun 2025 03:41:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268468;
	cv=none; b=FGivRbNYqvclZQjOweqbypWQ3v3HqRLN2LSN4ZuCqfZkxI3dhKTy1k5ElOw2Dx8/+jgZmigRyTV0tzl5HNKqXjUo5z7YkI8Up/KjPlYQPKUd2XszFwGW+LGBwt9xnhtm46Z8bg0CY8Jj5NFgA9MUzalq5klPDnQUkEEVVQa9wzcn85T3JB1qugHyPUZ9ykJu98TmkEUmvRW7jnWJBXZvUXMGH+AxV4sxjET38hTiTiXxSxjjOcHcxOtcv53YjWkbVgOFlb6MJzzDeffHgziSPUNwlOiBRP2lDy1D/6ZQjxDr1khJJ4tkrLYMvKtQtzXyJDbzdWY0UfMRaJTHcW8QUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268468; c=relaxed/relaxed;
	bh=iZh2vT8OhFDnKR2hfytPb7VOtq98Q1N4tcWXpFSfOT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=i/2UAiTmlpF3l0m1T36RQtSA/LYnyWpCgC8/MicfCnBNL1qeDZPfrbIli/funlyJcWQ5DeJYFPHj1Gd+qf7pM1Ajo4fPl3vzaAgLFgHoEQN0XAZCbkIePMj7/gOX2RPAgdpsQbYTjnst+VQn/B6A+QQVdgbZ9iNBmJL0n9tHcmt2tptygsldQSJd7wiqBJ4m9NDesdnPPv5NXC7xb2bAEoBaSRyvMq3NFna60T8zBjiyY/ESIZDz0ThYVjTCjfH84OKzEonxchoT/vsdu1DjExe0ePVIriVgRa6M03lME/pxGkPvUa3r4ubJft8BINMBX2GRZcsM4LVYHVxk9r7O9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hY8swlU1; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hY8swlU1; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hY8swlU1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hY8swlU1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcz6Nt6z30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iZh2vT8OhFDnKR2hfytPb7VOtq98Q1N4tcWXpFSfOT0=;
	b=hY8swlU1Xwh0Has8b3m9inXtra5+wVcICvzKnlJLWf4QM2TlKKYCYO+TyPK0SNPUqPLKaE
	qwiwLY/WR9ALBpyKHbvlZcOOYZqDasugoIXMoZOeHT1dayWndAfgTI31ZE1+GqZvrDhed3
	wpPr/D3ulOioG1ClLp8D4+90mWi4bWc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iZh2vT8OhFDnKR2hfytPb7VOtq98Q1N4tcWXpFSfOT0=;
	b=hY8swlU1Xwh0Has8b3m9inXtra5+wVcICvzKnlJLWf4QM2TlKKYCYO+TyPK0SNPUqPLKaE
	qwiwLY/WR9ALBpyKHbvlZcOOYZqDasugoIXMoZOeHT1dayWndAfgTI31ZE1+GqZvrDhed3
	wpPr/D3ulOioG1ClLp8D4+90mWi4bWc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-vPJBA0-xNTqdqAxfkDeHcw-1; Wed, 18 Jun 2025 13:41:04 -0400
X-MC-Unique: vPJBA0-xNTqdqAxfkDeHcw-1
X-Mimecast-MFC-AGG-ID: vPJBA0-xNTqdqAxfkDeHcw_1750268463
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a5780e8137so531018f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268463; x=1750873263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZh2vT8OhFDnKR2hfytPb7VOtq98Q1N4tcWXpFSfOT0=;
        b=TvjHGvQ8ABQKe0IfsmZs0Jd9UgK5rgQjc3aTQDUU5ilsmr9lG0qRPxjgKinF9k/lYa
         ElGeFKb0wPqUg6ZLlJcNWjaBUuiXCKvvTN4scpMiFOivWYIqkjg1fLbZwGegD9hoI6Rh
         wloMdOL/oYs1mbkFof9UyRWGouQuJQLfRNx9Zm2wSMp/NZg+FNPd7mpfnRjeckZhKci6
         txu5pPN5IWefkUWV83fwXLMwayc33B7r+v8rfGfnpFV2f0hFE9c4pXtBZ4x9L+J6ZnQ+
         BYYurXHx/vYZmUk+Pc2VtVcwSpg//e1S5H84nsu8t2rnkkgkt4kT+dMv6zvrMNHjtC0w
         nEnw==
X-Forwarded-Encrypted: i=1; AJvYcCWOh2EfmHr+eTnA+LcdrwRvDEsBd9JDFASyYJb/xQSIUM5RPytISbyBOJ9ph1Wi9h67sSqOibhRAmGZ99Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBTjoq8h37x4SOTOV0iVfb4VwgjnuXRgqjA2WfpT9UXGQksiaT
	FNht8IOxiDdpIytenpVJ0mMgc9CNhmZWAInGlN2oOiwq99vwr1hI2VfHVuojXYxKfS/xEQ9pkzR
	nuLjXlyleCNyHW2zqR3k01S1w5FV1sL2QuZ65bcnoMX80Kf3h9PhafzvKr7Slj9ekBnMOAqaT2K
	V75A==
X-Gm-Gg: ASbGncsZ6059r9UrtIracBfuKjAxXm3COQNUWyiaK+J8ZL+6gzf9X5PxBXWGT+789P4
	GC5ZovjmVuWvBWjO24g25MUn4vqNydFTkancMxgMy9eeXB30gx316EMeRR7bx2GlmIli+t4KzbI
	JdHxq28rr+JIaTU8u71XEo4ZpCdmrFKFTRRQ8mfgkBFJ/Y6WlOt6p+LT1xT9xUI2XDAm/lhI5Ob
	d+SI8cePZiDPzGv+w7HR1jr+qNFPDiaDgfmwPGhwtth7DuEPGiYX3sp1cmdzimcpuO8XQs527vv
	59rjWtVzVigVQGtkCODWN5z7L3lelQR7iyLfMNle0QPNTSY88OCLkSfSl1T7T3QoPeWwnSIUjmb
	N2LfoBQ==
X-Received: by 2002:a05:6000:2a04:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3a6c971ce8dmr252788f8f.17.1750268462954;
        Wed, 18 Jun 2025 10:41:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIfeWEl0T3CJLW2Q374pwGp0+w6+6OG/MMLaU0GvL+YMoweLR1hXiYpIsPjINzwYBpzh5jeg==
X-Received: by 2002:a05:6000:2a04:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3a6c971ce8dmr252776f8f.17.1750268462550;
        Wed, 18 Jun 2025 10:41:02 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453596df276sm20306265e9.0.2025.06.18.10.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:02 -0700 (PDT)
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
Subject: [PATCH RFC 17/29] mm/page_isolation: drop __folio_test_movable() check for large folios
Date: Wed, 18 Jun 2025 19:40:00 +0200
Message-ID: <20250618174014.1168640-18-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: yR2FJOjcrBoDCLRfFGmVZeBlSofVg3IpWQINKSEVb7Y_1750268463
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently, we only support migration of individual non-folio pages, so
we can not run into that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b97b965b3ed01..f72b6cd38b958 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -92,7 +92,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 				h = size_to_hstate(folio_size(folio));
 				if (h && !hugepage_migration_supported(h))
 					return page;
-			} else if (!folio_test_lru(folio) && !__folio_test_movable(folio)) {
+			} else if (!folio_test_lru(folio)) {
 				return page;
 			}
 
-- 
2.49.0


