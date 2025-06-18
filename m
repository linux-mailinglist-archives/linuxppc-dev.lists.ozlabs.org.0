Return-Path: <linuxppc-dev+bounces-9457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD838ADF424
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:40:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcD1H8wz309v;
	Thu, 19 Jun 2025 03:40:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268428;
	cv=none; b=mvk2ZK7daOmDPEJ21mos36YliHkBXV+bpYAlavRBYO+Eo4EGcDF+V3+uLFGeuTs7FK5wVV3HD9OcIgz27WlDqrhRoWw4z+Xxn3Opq0gxlodV+BueHGvto/SLr2THMuZFtK+3ZeqdGr0JjgoInIb2eJrTYvzVDOmoksgkYoEgt4QkNX7J5Iy9SDZ4b7EnJxkvyfxDC0tTFGe6oSW1PnBQ5isNOY9aObCNrQUh/zTi2oc9UeiLHe3I2vrZC31OYugYkc2eS/WoEQYzFPOlzMbi6zx68/+gqqVDGMW4mfmABLvZsAjvuwp5CmZVIeQeyEuhHSNPyvCES87j7WJWEG/dYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268428; c=relaxed/relaxed;
	bh=kAt9cuNNODAnXK/nmmtOZ1rnZLVGre0BG0UABQvpVBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OUVZdQ7yX6lu5O4Yhz9E05Mf30C4/S6tQ6j8zxEeQIeKXZsHG3DwMgI+1UgsfsLBo8NssWeVIdp725E6aKsXisR0NCBavl6r7HeBpqpDrhWLTrJz+obr/9kETMJZTje2/kxr7hrYISE4coLNZIAU8tEbZ0AVOFVa/WS1u+Zj5Pi2RW2GToirP+icojiTGupHrxCIGaTA1RwML9F/N7VgOapsRPOSig19+1uyIbI2H5uXlAbckFg5zTznlkuzr8YAhxY+ax4vUp6spmMcj9OLLiHtDu0yUeLc4jb7ZX2y2+tFUSl2hSeKvNJNRJ8atXQHAa/dYnXbttlr0MfIq8BauQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AOmTrXQV; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AOmTrXQV; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AOmTrXQV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AOmTrXQV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcB4qr1z2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kAt9cuNNODAnXK/nmmtOZ1rnZLVGre0BG0UABQvpVBg=;
	b=AOmTrXQVr96s+QcVr3efsGogqsjm+jlV7NjoV0zXyCxvCR0Ysb8WcctMaiPY0HnehVJ8Ot
	tn5556afW7BYES020cTD1RkCR7edOASRb0bUkQvGtEBWIej4Yok0qOxgjL39f9LXTx5s5v
	4dbrEiIGZJgjk0FnPGjYFtJlxr4CeCM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kAt9cuNNODAnXK/nmmtOZ1rnZLVGre0BG0UABQvpVBg=;
	b=AOmTrXQVr96s+QcVr3efsGogqsjm+jlV7NjoV0zXyCxvCR0Ysb8WcctMaiPY0HnehVJ8Ot
	tn5556afW7BYES020cTD1RkCR7edOASRb0bUkQvGtEBWIej4Yok0qOxgjL39f9LXTx5s5v
	4dbrEiIGZJgjk0FnPGjYFtJlxr4CeCM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-5nr9RBISOH-8NvLEEMhE1Q-1; Wed, 18 Jun 2025 13:40:18 -0400
X-MC-Unique: 5nr9RBISOH-8NvLEEMhE1Q-1
X-Mimecast-MFC-AGG-ID: 5nr9RBISOH-8NvLEEMhE1Q_1750268418
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d30992bcso58186985e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268417; x=1750873217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAt9cuNNODAnXK/nmmtOZ1rnZLVGre0BG0UABQvpVBg=;
        b=uVii8CUMxOMtpND8pZF8zf7wExhwKu+/3JsMjIOjsrCAuCUsSJ/4df3zKGW7SsxeKO
         mxDGtb5b74nwZF/ZxiNYUdLUmw/NmQVbn6fLEaJDc49HXXGm4g1j66IFNNAMwV/VCWJ2
         x0HadPcM6eCGu43dTsF00mOuFoKzlNe/CS5X/Z4G684HovizpexYpwUpVWvnTrjyjbGQ
         kFl7mfjf6IQCMG3mBTE/FZuf7btTSFp5wR0ZVbqpO7gsbB/bvc4LmegTWXKvChl/DGhW
         x8O9PblxmQmDzMo7mAPZ+GGrNx4VfqcT2sWxusGAZLolFZPi/tEt5GhGjFvh12WnbgkU
         rToQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWlE5Vy8fa6mb49Ky/m2wdMQH8orQm/8WUcb3Vdr4gyjD2dD3SJb2fxf1uverZj5UsM1j2uLITYsQLSNo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFzAixmmsCUTKhc3uWIiS4w+BCsXI8/uwOZn75+6c0hLa97QPb
	USkGOc6Byjxa9RqBDEy2MiFMkyl62QoBJtGr1uTGiCWJkcg8JQyOEHORfO1Z9bssBDrYR/gj+TN
	d0sfb/ZBEXSa8StNKxU2qJ/u0xakwq56wjHiZf+PYlBs/qSy67HRUeY6nIwA1vuCs5H2asAoxLA
	oGjg==
X-Gm-Gg: ASbGncsBjJ8LhGEtAZZ/FAC5V4Ny2BXk/ehAeSYWZhola6YJ+VI/A4mVVh3dolnpMsF
	Wo5m3Sc/BEW1lExpjZ/w3MpoCPhP0o9rOUWwTZ0x/e5mhMdtj0j0BwccAy0PISy+PZC77ogfjov
	iCEBldRWNvE6cXqj8+P09s5JT2oo2RTwm8ikii31nFSGO+zVOcTTiU/vqCpBMdbWgc2z79q/nJn
	7Tb8PnztFx4nPDcM7bp/pzThSL7u8eFkLVj/Ql6GM+JZ/faIJTY4AufCwz6sE9+XZsoZlllOgGa
	qJdcUJEMh6JR2F/dq2u3FEIOCk067UjYP2XX7OgAwSG3uF7PROVOCzP2YbnRcycFucg3XmeaP9K
	og4KScA==
X-Received: by 2002:a05:600c:c117:b0:450:d4ad:b7de with SMTP id 5b1f17b1804b1-4533cc69257mr159132065e9.3.1750268417479;
        Wed, 18 Jun 2025 10:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK6CJuAqwp4upaUAFmgBr8NRJjk1YOp/gZr+QzQDI0/4bBlZLAGc6Vo1CG+p/mbQiC9c5VzA==
X-Received: by 2002:a05:600c:c117:b0:450:d4ad:b7de with SMTP id 5b1f17b1804b1-4533cc69257mr159131415e9.3.1750268417023;
        Wed, 18 Jun 2025 10:40:17 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535ead2a84sm3430235e9.32.2025.06.18.10.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:16 -0700 (PDT)
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
Subject: [PATCH RFC 00/29] mm/migration: rework movable_ops page migration (part 1)
Date: Wed, 18 Jun 2025 19:39:43 +0200
Message-ID: <20250618174014.1168640-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: pVqsWA6zIYsXHEjwog9rvlEh5WsJ6qBfDM7XYuSHw0o_1750268418
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
page lock. But they will have flags :)

This is the first part (other parts not written yet) of decoupling
movable_ops page migration from folio migration.

In this series, we get rid of the ->mapping usage, and start cleaning up
the code + separating it from folio migration.

Migration core will have to be further reworked to not treat movable_ops
pages like folios. This is the first step into that direction.

RFC because I only did some light testing with virtio-balloon + zsmalloc
page migration, and have to polish some patch descriptions.

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
  mm/page_alloc: allow for making page types sticky until freed
  mm/balloon_compaction: make PageOffline sticky
  mm/zsmalloc: make PageZsmalloc() sticky
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
 include/linux/migrate.h              |  42 +----
 include/linux/mm.h                   |   4 +-
 include/linux/mm_types.h             |   1 -
 include/linux/page-flags.h           | 104 +++++++----
 include/linux/pagemap.h              |   2 +-
 include/linux/zsmalloc.h             |   2 +
 mm/balloon_compaction.c              |  21 ++-
 mm/compaction.c                      |  44 +----
 mm/gup.c                             |   4 +-
 mm/internal.h                        |   2 +-
 mm/ksm.c                             |   4 +-
 mm/memory-failure.c                  |   4 +-
 mm/memory_hotplug.c                  |   8 +-
 mm/migrate.c                         | 269 +++++++++++++++------------
 mm/page_alloc.c                      |  12 +-
 mm/page_isolation.c                  |  12 +-
 mm/rmap.c                            |  16 +-
 mm/util.c                            |   6 +-
 mm/vmscan.c                          |   6 +-
 mm/zpdesc.h                          |  15 +-
 mm/zsmalloc.c                        |  29 ++-
 28 files changed, 361 insertions(+), 390 deletions(-)


base-commit: 21f39cc0346ea2081a83f0469995144d75d23075
-- 
2.49.0


