Return-Path: <linuxppc-dev+bounces-9882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C685EAEDDC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:00:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5qb2myMz2y06;
	Mon, 30 Jun 2025 23:00:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288427;
	cv=none; b=lEgM7aaRaXmzAg/PI368m+obUhkJj1TyvyatZ5c2g6t1ikf2LEnS+MWUcgzP2oLANjYbYeIGgtpDQJSd3f/MGeQ30Gexunk+W6A2f0j0VmkGzIqvnuJu8rv307GYsqCaR0s1bdC9HfmkXQ+bzlthFtQlWzk3jfZTj/sszeaUPt/iqlNBHwjVMD7kWmuOLlasYBTWYUk0pKHqL7DYKu3+1G2Fi07jPLNv+ykIg1/KqpOuCloBn2ZLsOTQAFtn/ICBbnjKsbZ/cZeNq4KcpovjwkFUAefg3FLklacaia3zBr0wWq1ECaLcP38qkV4kCyJX30a+u5KLLDn2S8M0si1bRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288427; c=relaxed/relaxed;
	bh=vfJnfBkXpkPuvL/9X/X6rRos3axIFOlRbKihQ7zrqmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sgioenwvv26AIRvJxhBmQm269b9pF1JhS+ubfM1CK7QAMIuvXepidxz6IAQk5evPyMznT+VlYVACMlOzXwEYCBcbocFQ112DwQoSOXBiShZM2g9ieWqT4smgPQ4kCDRfWfj1bC+HxOfaF42krjqjkSlv10Yr27JW97DExO7lHbS9t8+a1L55noK0tzalRfXKgRSX5HXMSzPsupb4/0Kyson7f9bnm4/e4hvC22WBK5E+siyJgKqBO6K52XW9gAqUhmDES+UZpY0Cx4BXi9ogLDeRuU2myVam2ZPiuozhMfpyfniL0+6XGUTpvX9o1cfQ4bjUjJVcQE7JnOnnVX8MEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RZibEWH1; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=THB87Q9l; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RZibEWH1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=THB87Q9l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5qY2T9nz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:00:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vfJnfBkXpkPuvL/9X/X6rRos3axIFOlRbKihQ7zrqmc=;
	b=RZibEWH1BWSjLAU0YJD8o9WncRjjo9PQAfZ7r+WbZDr2agQso/7sYTNoiZGTSKHyOGo0Hz
	Kt3h6ZZe0FgF0CPxN67U9fy3ipOLUvmvuyMeK7mw/ghwzkK7z1C5/AX5SvMVm8fk53MwA9
	tR8B/z8jU9FLQJO9BMbH1r1yRkuQKLs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vfJnfBkXpkPuvL/9X/X6rRos3axIFOlRbKihQ7zrqmc=;
	b=THB87Q9lomRIhyPn13FQD19jjkBcy2hwmEdZdfahygc0r2F0EwsgoH5dPi9qyUXYWVv0En
	s1tLagcghIxJ27Oc8CJt2Ye/gshYAv+yd7gEXoHlXAyDjpUomz6qY89lekOyEi+cWzg+t+
	hOU8/xMFWkPMjT9ndvGQ454cnj3aIzo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-3wKmrhvXPeek-flw35647A-1; Mon, 30 Jun 2025 09:00:16 -0400
X-MC-Unique: 3wKmrhvXPeek-flw35647A-1
X-Mimecast-MFC-AGG-ID: 3wKmrhvXPeek-flw35647A_1751288415
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso12659175e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288415; x=1751893215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfJnfBkXpkPuvL/9X/X6rRos3axIFOlRbKihQ7zrqmc=;
        b=iRlOJjLgNwb6IkBv2kgaANON7lnte2+YP7PGOTLmfHuwjN4UmD/TtF3k0sIeyT8zAY
         3N49jPpf8XRW8LhFnJplJs/YIFMaVMpxfBYjbKXY/gkSiZ1+e/SHwfvNwv4Teu5VS2z8
         CQzJxUFINtjHF3iPuj94LuxSjQwfx3fAxTGAzik9Cr5HMpIxxZEXCMO79oZRwPYc1NXp
         RrKSkNncEuwResuLDRZi8kQHDMn0kAZ28CEVk2KSeuLa+9tvfR5GZP573tbnvy49nJnk
         d2fQBCRSjHmTNaO+ayBcWab2QsKfgQUBov+3Vk/5Vkkm4z3cL8N0GmRDKWw8YkelGWaR
         Z4Ww==
X-Forwarded-Encrypted: i=1; AJvYcCV2N1B5QojmBOpggArWm/+rWyPCnToLkCoKxskeQH+S2xjCrxlu4vbE8/EI8ojHielixxwbfaujGCfeDBs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyVu5LU7wQGrHzcswFPAKvOwl1LcFICn8RAb2dSP1vbfvdIVPxC
	6ldRdO64BJZ71P9uK2gNHx3YgnzYdFfzIS7Vv3r6fkaJTVtoEbqa/6Dk00bG9pMyvbE1k/9Nmhp
	Z11btuX/wnJ+Tv9/XgKM9jn5uQq6GsBJyQGJHT8AZn5LNSU9ITKvzHJgEJP0DQt7WHHg=
X-Gm-Gg: ASbGncssD1532kfyrslmSXcgmW1+yEc2rSUTRrbTPfCCDUv3Ywp9F8N7jEojCuJztJm
	dIoVENX074eAnnVyR2qQ5GDMfefMrXr59p3eV8gAmq/0xQAYieEaSITsPn2QDoQ1Gk9WYrGHlWf
	KeMRIGSEe6Za8SqM+qxwo3IHOicHaS/xo82apM4Yi/2aBB2M1oNpk0+soJMAhk7WuCajMds5Qwf
	uSshHLKq1gZkW2txqfyZHVDzf64tH16fdiyJp5eOPvHU3A+PISqkX1Qfw9o+LLLEHx9ZXLAsFo7
	B/B+DRLyMJeJO9WEoR0QuOFbjKPZV0WLUFS09u+R0f0sU+zdkRcS9BfhAYMMIb5/thy3KEqtp2F
	sqXCf4uA=
X-Received: by 2002:a05:600c:3f0e:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-4538ee6fc79mr120597015e9.23.1751288414940;
        Mon, 30 Jun 2025 06:00:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Y6zMVNRx8SyemplqzZ+r/tVyw00Oe4g4/JGEqtvy2G6LpOQKRmzj2nzxeHUR41ZrxoqB6w==
X-Received: by 2002:a05:600c:3f0e:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-4538ee6fc79mr120596525e9.23.1751288414400;
        Mon, 30 Jun 2025 06:00:14 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e59659sm10376300f8f.77.2025.06.30.06.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:13 -0700 (PDT)
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
Subject: [PATCH v1 00/29] mm/migration: rework movable_ops page migration (part 1)
Date: Mon, 30 Jun 2025 14:59:41 +0200
Message-ID: <20250630130011.330477-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: t1rk1iXK7qx7VZg3YlzKDDSKPXGHraeeIGZxO0V52t0_1751288415
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
page lock. But they will have a type and flags :)

This is the first part (other parts not written yet) of decoupling
movable_ops page migration from folio migration.

In this series, we get rid of the ->mapping usage, and start cleaning up
the code + separating it from folio migration.

Migration core will have to be further reworked to not treat movable_ops
pages like folios. This is the first step into that direction.

Heavily tested with virtio-balloon and lightly tested with zsmalloc
on x86-64. Cross-compile-tested.

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
 include/linux/page-flags.h           | 104 ++++++----
 include/linux/pagemap.h              |   2 +-
 include/linux/zsmalloc.h             |   2 +
 mm/balloon_compaction.c              |  21 ++-
 mm/compaction.c                      |  44 +----
 mm/gup.c                             |   4 +-
 mm/internal.h                        |   2 +-
 mm/ksm.c                             |   4 +-
 mm/memory-failure.c                  |   4 +-
 mm/memory_hotplug.c                  |   8 +-
 mm/migrate.c                         | 271 ++++++++++++++++-----------
 mm/page_alloc.c                      |  12 +-
 mm/page_isolation.c                  |  12 +-
 mm/rmap.c                            |  16 +-
 mm/util.c                            |   6 +-
 mm/vmscan.c                          |   6 +-
 mm/zpdesc.h                          |  15 +-
 mm/zsmalloc.c                        |  29 ++-
 28 files changed, 365 insertions(+), 392 deletions(-)


base-commit: 2e462e10265dcdce546cab85a902b716e2b26d9f
-- 
2.49.0


