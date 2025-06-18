Return-Path: <linuxppc-dev+bounces-9467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2BDADF447
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:41:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcf2b1dz3bm3;
	Thu, 19 Jun 2025 03:40:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268450;
	cv=none; b=Kj2FUxTICV8nuAjcX7Zfy0cq1LimoXci8pErX8uoZAhU6y6PgmXVSWPm8+KV0TJIvOyfPJia6mI/l53cc8yrDj2+tkg0nPcbQymr8BA8W+KCiO0TYhJ7lG1SfN1UORQRJkZiknI6Hn/6RaXlX2he8jHMiGjrDGeokzBqUSbTUqr7QoPDqTT89YL5cmpKAvn0sHKyNtpE5OLbBI1vgAcW5qE07Ub9LldHZCvEpUOqqSKMB1oM9BhrM/qZoK5NDSmeexoCZ+HHcIzW6Vkv6nGjDCfiQngNqFi5mP3I/GZ0mQ4ypB7qpaC42RmvY01SW13Z0hUS24oj2vjwxV0Ar1NGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268450; c=relaxed/relaxed;
	bh=fwm1uiBUBcXGnja63XmY2QjIjVtNliVfN8dAKrOXwFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=arVZwrFONne36qVei5FTd8PAMuZzHuHo3jkAeq8LH6hYqdMANbL6aUOxHUue6qEiW1nehHIuuBWsKXZ0qJ3BNkTjTC3I3FNlQCChy/6lecOP7EVCui93+VLzyfEY0fVDQgCeuCcndoZ9iPc1xbnFaGHmvVsnq29JTp+HL2BBODQgbU1ExFre7jnBgQRnL9HWqrG9ChGfasOmZQWgeMBW5DcAMJ/puzLE9ZmV30XGkOtgz8tkC8Mc0rOjO0O47+7jUx19k10MJsImWIuhukY07bOyoZB1pZ3n3X5myrnlE9w3UvEzM3pL1rrUs246roiFCzkykBj0C54UnjSND8CmXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VD9sVH3S; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VD9sVH3S; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VD9sVH3S;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VD9sVH3S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcd4PNMz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwm1uiBUBcXGnja63XmY2QjIjVtNliVfN8dAKrOXwFc=;
	b=VD9sVH3SPFbwAKcwimR5q7xu57SOHFr3oJhLQJJafeSmxBvEG+O0XTQts57j33Pc7gypad
	kZqhu2g8GtVnq36domyi4q5rPG6zDVqjAs8jWKchGo8TQlke2j1lcWYxTA8g+eoIMbQwPD
	RAawYFeoMCVZU82wHUHfvDo1AP0kOEk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwm1uiBUBcXGnja63XmY2QjIjVtNliVfN8dAKrOXwFc=;
	b=VD9sVH3SPFbwAKcwimR5q7xu57SOHFr3oJhLQJJafeSmxBvEG+O0XTQts57j33Pc7gypad
	kZqhu2g8GtVnq36domyi4q5rPG6zDVqjAs8jWKchGo8TQlke2j1lcWYxTA8g+eoIMbQwPD
	RAawYFeoMCVZU82wHUHfvDo1AP0kOEk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-754VSLRaNWGY4yoCRXhHBg-1; Wed, 18 Jun 2025 13:40:45 -0400
X-MC-Unique: 754VSLRaNWGY4yoCRXhHBg-1
X-Mimecast-MFC-AGG-ID: 754VSLRaNWGY4yoCRXhHBg_1750268444
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451dda846a0so56145075e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268444; x=1750873244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwm1uiBUBcXGnja63XmY2QjIjVtNliVfN8dAKrOXwFc=;
        b=Vx04siRnm8UzILbEZMSdtODJds6Ez9FE/rf0n8OE4sqDtoqc4fDOZ4EAvt9+7H1kvw
         bxsRY3Wp7GddJQdsI0b3oTqKI/PwRYLiQXlzswFHSWvJzi+HiYVbSn6Lno9Gq+ivdyqA
         T7kdk3M6Zav5Nn13e664kyTUbg93h0PRftmdIq65y5Jj+g5imgYQKFSg1fxZnkCuBAlf
         9jrvOPrdm1MzurrDjmIJeo3eyg2FaO4jIW2/MctIWCVls9C6ye1EDZz3m3WSCPOlld7p
         JF07L7sH+2Ag4vzUqJzI/Q8jwXjAhNgjY4z51mjBiln3wVHnB6exuBE1lBnsLukZbANm
         CXKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK3a5G/Ki27lVAsSgqqtjam3r9zWVI8UP7ZruqO4q2TzIhcte6PIaQzR3vslaeQ2POvqiZR0FhGm1i54U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQF9ErzfqnXLKaiQMuurzQCbiYLPbjrpcmPF/pfrRqKI3slKxc
	F2j0wfJOpNfXUZzOwazcG6dv6pqCmMN2D7xC3KPuOjJ3Undf+c//tJ3wVBehB8kBNLn/3Nv2oaZ
	p4Z/CXr51Cwp1vLCvUgeNYJizsRkUafZ0pGMzPiYAmb1E0TzYa5YacGQvtDlYCZ3LhK0=
X-Gm-Gg: ASbGnct2RBw4eTWjNeoIrOACXbKY/I2wL3h3mTKiA1WNiZ9dmi9Z3oS+zhSFs3ZG5ht
	+zhfP2jwKoSuf5cII3MPknbJkgEytqnS+qJFKCSzws+n1mnLPP+vtuSi/LcMRr7enssfW2f6RcS
	/P/RmO6VmFiRhNJlqxqnhn2EHuR2yY/yZ5BR+LnVqbHYeJxSn5sa8mh/Lnx6UsgWM6uv+bhw41T
	6B2Qh20RYcoiwqefZF6aN2XqFuMrDhOYQrTcrQ5cct8fykkvH6/RxxBdlGBVnL5KsSNhPr24tUY
	IZ5Xx16aOuiQHkuB6xmneMYoXifx87DFYVdQSWjPXAFzZ0Bf5oF+6IwXgoN1nzxP/qj5yd17VY0
	EpVjbGQ==
X-Received: by 2002:a05:6000:71c:b0:3a4:cfbf:51ae with SMTP id ffacd0b85a97d-3a572367afbmr15684688f8f.4.1750268443737;
        Wed, 18 Jun 2025 10:40:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEywSnKMkZlpTz2OAMYD8vOZkvPdDtLDDWrsPSDJX8ViTkX0laZRXIHvaFqn8ElXQBewjN+xg==
X-Received: by 2002:a05:6000:71c:b0:3a4:cfbf:51ae with SMTP id ffacd0b85a97d-3a572367afbmr15684628f8f.4.1750268443292;
        Wed, 18 Jun 2025 10:40:43 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a54b7asm17688084f8f.16.2025.06.18.10.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:42 -0700 (PDT)
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
Subject: [PATCH RFC 10/29] mm/migrate: remove folio_test_movable() and folio_movable_ops()
Date: Wed, 18 Jun 2025 19:39:53 +0200
Message-ID: <20250618174014.1168640-11-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 8a2lhhnU9C7GZCPoqj3Zd30z1YL2f8t5XZ-v_sgUOcI_1750268444
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Folios will have nothing to do with movable_ops page migration. These
functions are now unused, so let's remove them.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c0ec7422837bd..c99a00d4ca27d 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -118,20 +118,6 @@ static inline void __ClearPageMovable(struct page *page)
 }
 #endif
 
-static inline bool folio_test_movable(struct folio *folio)
-{
-	return PageMovable(&folio->page);
-}
-
-static inline
-const struct movable_operations *folio_movable_ops(struct folio *folio)
-{
-	VM_BUG_ON(!__folio_test_movable(folio));
-
-	return (const struct movable_operations *)
-		((unsigned long)folio->mapping - PAGE_MAPPING_MOVABLE);
-}
-
 static inline
 const struct movable_operations *page_movable_ops(struct page *page)
 {
-- 
2.49.0


