Return-Path: <linuxppc-dev+bounces-10088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9003DAF8FF5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:25:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVC71jHYz30MY;
	Fri,  4 Jul 2025 20:25:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624739;
	cv=none; b=oVGh3ojZOdk52h+tvmk+iubr+aJG0E6OUGbVbNQ7tWJyDbm/qOWr/TJuacesFdL1R0sD3+o4MGo/AJ1qbOBa0npQyvFUeVqJOvkpkmaMFk1qNxa2WlAex37j2VeDk8K5v0vYJAZVCgoW5lE4Zs6Y4YOyIVbXuSwdQQFRzNcz27bppTWFDa6dVA1ITAcXOrpLFHgNnyjEngVj/jJ0kAu2rErIv5B7+WO9VKeYs6aogNuPzXTEam2RY/OKeUNeFuwZRS8zYmbi9hPqY+t+x3JrUsAPvnASF5dDZNH26AddfPfw1Uc1JK8xjGXy5ZxoEwoZWSAQuqNI3MFuLZwzJhQwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624739; c=relaxed/relaxed;
	bh=Sro688HYIitAmPcvBgChCRtb9/I9qH1hXgFepSE52NI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZODVNYmIpEp6MVkTMWHB8qtmLqUhQ0PPGZUCtEPF7j4BnD7viJAisSIOr8T+wVXwmC8LuLperTiYPcEN4wnR6uMPQKQg0gVsu9xt1KS4mkVe2a/kZf61aiLppCrcxwBnEUtr2hBs2HsJItD6xRP2o8jx86e08nJ+ML3B6Xz/2KrABfL3ccbrcTru0NzDUz1Ko/FP/eSFPZ7Zl5zyoHYJf+eryk3hstwxAFIWPhV/NPZWXNQaOEZYj3X0w5YT8TruYm7SjAljqgorbgBcjOR54NNQBkrwk3zFfbiuaxhmVa7g/D3BMMXsITLbU0mSacJP2+wSlThDHxQZOl6EcVwAHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eLwT/EmT; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eLwT/EmT; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eLwT/EmT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eLwT/EmT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVC604Fkz2xd3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:25:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sro688HYIitAmPcvBgChCRtb9/I9qH1hXgFepSE52NI=;
	b=eLwT/EmT7HWj0rRQfIwe+GHkBKXwyBzFk73+LECboajAXih4jvUvIAHT66sLrsMlKhQJ3U
	+MQQhaPr+iGGqcnM2ukBisGI8Ob9YdmFJFLREX/y4hIV9RVf1FvRX82yGreLroSdwjoDAf
	MHsJhjQZRmp2xmGq42yKdJpeOcC+eXw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sro688HYIitAmPcvBgChCRtb9/I9qH1hXgFepSE52NI=;
	b=eLwT/EmT7HWj0rRQfIwe+GHkBKXwyBzFk73+LECboajAXih4jvUvIAHT66sLrsMlKhQJ3U
	+MQQhaPr+iGGqcnM2ukBisGI8Ob9YdmFJFLREX/y4hIV9RVf1FvRX82yGreLroSdwjoDAf
	MHsJhjQZRmp2xmGq42yKdJpeOcC+eXw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-VSD7Jcv7OOS8caY6ubUBGA-1; Fri, 04 Jul 2025 06:25:29 -0400
X-MC-Unique: VSD7Jcv7OOS8caY6ubUBGA-1
X-Mimecast-MFC-AGG-ID: VSD7Jcv7OOS8caY6ubUBGA_1751624728
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so467239f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624728; x=1752229528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sro688HYIitAmPcvBgChCRtb9/I9qH1hXgFepSE52NI=;
        b=M3hGy0UbxkoqtRdceIkhX/cq1sejsHysn61QpE2m5sCUH+zMA3CxUQcE7uxwASU20g
         MeBHTf9Hv21WgywdLAPDAT8rfdoJndCeKZDras2LCnSsBZwzan1DJgu7ZnCyM9cMMIFr
         JNnz6sCM7Y5lzJvgwuo4vGT5zzni1sQWfXSc7k45cAQsUWJhDmCFoSSS5OxrahScs/qt
         dpzfFbsJmgNUeFVcVyczsHFHbvujd5bO8prYiASK8jrT+EN+GUKyRd8zmjngaJPLIkcc
         8lXYdx1x0ZCJxNQWRk9eVFrMsetyIGl7NXr5Pn2dHNU/B6RNS8h1V8SYZ5DgFkOYje4s
         SdLA==
X-Forwarded-Encrypted: i=1; AJvYcCUWYZzBNfJZkeemPXlRiWIyMSAbi2bpuTxQhASNsqi/eFHJR45BYRIUpzFhfQ3+DboRNOqXXXxJ1J66JSU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxktO1mNDOQDa3BuxzeQi00SmHQr1D/iMprFp6mjfSBUrLVYnfj
	O10Y8lXdcbsgzbjAGRMe9gA9t3FLPqIQfZu3T8FJ0U5QnFrLYCn4e4gfhj6KBTF0b1Xy70q+JpT
	kk0fyGBnSMt1E0aT1B1xNiibLv+yaYW7pZHu0uXiFCgenc+JatWhOoD9D6n6u/DXNPRI=
X-Gm-Gg: ASbGncuT7NbndCMBpIk6Cquc7otzz6/jW4ZS78SamPQ08aArJnxX1IlGO+KHxR3fZ47
	ci72gffRCtsneVUN9ygvSClJXvoeULQF3X6YkOyh5HI9RnjotQzVRcgDaDQZ0R5HBEUkkql4+In
	lGapSfV+wwl80SP+obyKEFiYEQxF3O7MCKQ5yATo21gaSydFSnkLAprsaMmtThM2uQWXltwk6gQ
	AY+ipcKycbo6TNAUc4GcYbUiS2i/5sAfJX1IhMbK5iwddtTGU8/4EUfHP79aod4u/cJYPQqyRfy
	wDv1iBmecorsS2nYaHuNNsKTpIBrgAqysd12882p4cUuljwv2SexE1BfVzaMwz6IjqX0sNGeWku
	aEbsu1w==
X-Received: by 2002:a05:6000:2dc7:b0:3a5:75a6:73b9 with SMTP id ffacd0b85a97d-3b4964f4d95mr1608817f8f.11.1751624728232;
        Fri, 04 Jul 2025 03:25:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCjrfOCujVRy/tLPuq2vX5bnaQezkrR11WICwCcdt0ejgdnjfY6QZ4FsoDRZ4Yte6IkVy/1Q==
X-Received: by 2002:a05:6000:2dc7:b0:3a5:75a6:73b9 with SMTP id ffacd0b85a97d-3b4964f4d95mr1608748f8f.11.1751624727474;
        Fri, 04 Jul 2025 03:25:27 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d094csm2102185f8f.28.2025.07.04.03.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:26 -0700 (PDT)
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
Subject: [PATCH v2 00/29] mm/migration: rework movable_ops page migration (part 1)
Date: Fri,  4 Jul 2025 12:24:54 +0200
Message-ID: <20250704102524.326966-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
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
X-Mimecast-MFC-PROC-ID: EjmU3f6urf_mJU_2p9XoXfGgkqodLbLPmt3qE4VkEmo_1751624728
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Based on mm/mm-new.

In the future, as we decouple "struct page" from "struct folio", pages
that support "non-lru page migration" -- movable_ops page migration
such as memory balloons and zsmalloc -- will no longer be folios. They
will not have ->mapping, ->lru, and likely no refcount and no
page lock. But they will have a type and flags 🙂

This is the first part (other parts not written yet) of decoupling
movable_ops page migration from folio migration.

In this series, we get rid of the ->mapping usage, and start cleaning up
the code + separating it from folio migration.

Migration core will have to be further reworked to not treat movable_ops
pages like folios. This is the first step into that direction.

Heavily tested with virtio-balloon and lightly tested with zsmalloc
on x86-64. Cross-compile-tested.

v1 -> v2:
* "mm/balloon_compaction: convert balloon_page_delete() to
   balloon_page_finalize()"
 -> Extended patch description
* "mm/page_alloc: let page freeing clear any set page type"
 -> Add comment
* "mm/zsmalloc: make PageZsmalloc() sticky until the page is freed"
 -> Add comment
* "mm/migrate: factor out movable_ops page handling into
   migrate_movable_ops_page()"
 -> Extended patch description
* "mm/migrate: remove folio_test_movable() and folio_movable_ops()"
 -> Extended patch description
* "mm/zsmalloc: stop using __ClearPageMovable()"
 -> Clarify+extend comment
* "mm/migration: remove PageMovable()"
 -> Adjust patch description
* "mm: rename __PageMovable() to page_has_movable_ops()"
 -> Update comment in scan_movable_pages()
* "mm: convert "movable" flag in page->mapping to a page flag"
 -> Updated+extended patch description
 -> Use TESTPAGEFLAG+SETPAGEFLAG only
 -> Adjust comments for #else + #endif
* "mm/page-alloc: remove PageMappingFlags()"
 -> Extend patch description
* "docs/mm: convert from "Non-LRU page migration" to "movable_ops page
   migration""
 -> Fixup usage of page_movable_ops()
* Smaller patch description changes
* Collect RBs+Acks (thanks everybody!)

RFC -> v1:
* Some smaller fixups + comment changes + subject/description updates
* Added ACKs/RBs (hope I didn't miss any)
* "mm/migrate: move movable_ops page handling out of move_to_new_folio()"
 -> Fix goto out; vs goto out_unlock_both;
* "mm: remove __folio_test_movable()"
 -> Fix page_has_movable_ops() checking wrong page

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jerrin Shaji George <jerrin.shaji-george@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: "Eugenio Pérez" <eperezma@redhat.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Brendan Jackman <jackmanb@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Xu Xin <xu.xin16@zte.com.cn>
Cc: Chengming Zhou <chengming.zhou@linux.dev>
Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: Naoya Horiguchi <nao.horiguchi@gmail.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: Harry Yoo <harry.yoo@oracle.com>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>

David Hildenbrand (29):
  mm/balloon_compaction: we cannot have isolated pages in the balloon
    list
  mm/balloon_compaction: convert balloon_page_delete() to
    balloon_page_finalize()
  mm/zsmalloc: drop PageIsolated() related VM_BUG_ONs
  mm/page_alloc: let page freeing clear any set page type
  mm/balloon_compaction: make PageOffline sticky until the page is freed
  mm/zsmalloc: make PageZsmalloc() sticky until the page is freed
  mm/migrate: rename isolate_movable_page() to
    isolate_movable_ops_page()
  mm/migrate: rename putback_movable_folio() to
    putback_movable_ops_page()
  mm/migrate: factor out movable_ops page handling into
    migrate_movable_ops_page()
  mm/migrate: remove folio_test_movable() and folio_movable_ops()
  mm/migrate: move movable_ops page handling out of move_to_new_folio()
  mm/zsmalloc: stop using __ClearPageMovable()
  mm/balloon_compaction: stop using __ClearPageMovable()
  mm/migrate: remove __ClearPageMovable()
  mm/migration: remove PageMovable()
  mm: rename __PageMovable() to page_has_movable_ops()
  mm/page_isolation: drop __folio_test_movable() check for large folios
  mm: remove __folio_test_movable()
  mm: stop storing migration_ops in page->mapping
  mm: convert "movable" flag in page->mapping to a page flag
  mm: rename PG_isolated to PG_movable_ops_isolated
  mm/page-flags: rename PAGE_MAPPING_MOVABLE to PAGE_MAPPING_ANON_KSM
  mm/page-alloc: remove PageMappingFlags()
  mm/page-flags: remove folio_mapping_flags()
  mm: simplify folio_expected_ref_count()
  mm: rename PAGE_MAPPING_* to FOLIO_MAPPING_*
  docs/mm: convert from "Non-LRU page migration" to "movable_ops page
    migration"
  mm/balloon_compaction: "movable_ops" doc updates
  mm/balloon_compaction: provide single balloon_page_insert() and
    balloon_mapping_gfp_mask()

 Documentation/mm/page_migration.rst  |  39 ++--
 arch/powerpc/platforms/pseries/cmm.c |   2 +-
 drivers/misc/vmw_balloon.c           |   3 +-
 drivers/virtio/virtio_balloon.c      |   4 +-
 fs/proc/page.c                       |   4 +-
 include/linux/balloon_compaction.h   |  90 ++++-----
 include/linux/fs.h                   |   2 +-
 include/linux/migrate.h              |  46 +----
 include/linux/mm.h                   |   4 +-
 include/linux/mm_types.h             |   1 -
 include/linux/page-flags.h           | 106 +++++++----
 include/linux/pagemap.h              |   2 +-
 include/linux/zsmalloc.h             |   2 +
 mm/balloon_compaction.c              |  21 ++-
 mm/compaction.c                      |  44 +----
 mm/gup.c                             |   4 +-
 mm/internal.h                        |   2 +-
 mm/ksm.c                             |   4 +-
 mm/memory-failure.c                  |   4 +-
 mm/memory_hotplug.c                  |  10 +-
 mm/migrate.c                         | 271 ++++++++++++++++-----------
 mm/page_alloc.c                      |  13 +-
 mm/page_isolation.c                  |  12 +-
 mm/rmap.c                            |  16 +-
 mm/util.c                            |   6 +-
 mm/vmscan.c                          |   6 +-
 mm/zpdesc.h                          |  15 +-
 mm/zsmalloc.c                        |  33 ++--
 28 files changed, 373 insertions(+), 393 deletions(-)


base-commit: 31a2460cb90e6ac3604c72fb54e936b8129fec05
-- 
2.49.0


