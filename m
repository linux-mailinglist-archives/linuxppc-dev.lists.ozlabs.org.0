Return-Path: <linuxppc-dev+bounces-7239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 129ECA6AC28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 18:39:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJXrs7224z305v;
	Fri, 21 Mar 2025 04:39:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742492381;
	cv=none; b=Qp4t9jopVLWj1Eap9L2DchLVjzp5xzLhb4TeN/cMjofYTaYUt2Ky3R8XZXzulLlZfnz3AVuKLDCUUwroXe9d72tmL5MKOdzVas2UrGRZViAk6+6ZH2TlARdXkxovW80P9S+QxkZcAI7dhT+3Y9AGWg0FPS66HgERGhKgHVQ2PH1FCI0/YPihy1aHgOQMjPJ/Dmb9eHSLkHJz2idpvbWHMAiGPwUQCGSJBXZYSQ/+U8Xk3Of1HsqevKe4V6ASwdfoLSGWnMFswpF3N/uyqksqxo1PKLT9cutfTyOMyWxkCmmC9ItJ5Biv7SzWgAS4ijXn9joIlqxZPRjem9JIo5s05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742492381; c=relaxed/relaxed;
	bh=t+zfvdKqKRtuF8/jqI7ab7rT2M9nI8zR6FIUh1soqhk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dZqzpeT4ypyRk900ZohW12OTr8N6vmkb+IeUjc0Nt9p4ABDWrLyLyzYa+vsccKGB0+9MJxtWl/FK1Rs2CYj36wc33g242+/hQhPf6tHD1UMV+yztRYWxfm/6SI9TwkkIHMlz8022/t0948espOgo9jMXYVfck9x5PyauyDpREOKAbCRvJKdK5rhpDuajwcZT5ZixEp1gRn+W48uMq8oGMKvNeH2SZTcplw/PM9j8yFIQLlBJTLnIMKXOCYaJ19mPEnEAOaOFUKjeeIjpjlOj17BzJApoh2KnXpah2B/FKbQva/ZG/sBid6EZX2T0S5MreX1b16Su15yo1PIclnMNqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gnKkYhdA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=32flczwykddujlivesxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gnKkYhdA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=32flczwykddujlivesxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJXrp3g92z2yD8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 04:39:38 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-22651aca434so14835205ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 10:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742492376; x=1743097176; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t+zfvdKqKRtuF8/jqI7ab7rT2M9nI8zR6FIUh1soqhk=;
        b=gnKkYhdA1LpvEjl36yr0YKHZ0Lav8r9GKDit5LznY15exHC0zQIdaVBRrZstzfWZq5
         SEPzXWYFZDqRt8hJ6NvGd8ZlmuhPWdEDqWWNmidIdEyJ1zeQoauvAiBuRd7oNU9htwrw
         ggeZ8aeUl+/L55ZS36K8DnqhbGj6vA2Au/To8KDjqF+NSSypgi5oPpGvFCkRYh0WXNXO
         RZd11t0B0jHYsq6jYJmSafS9XMJPWK+r5aUf8jrwa225oHAAsHoy+uP3WGCPwWbaYk5/
         mgP0gatStGqEvKROOJHOlRsJIg6qvf02fyRew7lXnQYFKVgZHhSE3uM7vDUYcYBBeFo1
         Gk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742492376; x=1743097176;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+zfvdKqKRtuF8/jqI7ab7rT2M9nI8zR6FIUh1soqhk=;
        b=N6K0g4HPalBYwKucypM2iRXZocLdi+gQsX1X6+fTTCgM6ILywX4Z1CbFBvQfl1CRYh
         npqw6XWgYJhDagy7SSO+8uFyXJkERIM2qCVFTJzeq585OxHF6J9SspZsn6zz5GmXGfq9
         brOMooRpSuEfZW7bIisMksrs83hgkfOqo1TxFJiscpB9q9RMISnoeoIoy5ffbWpYCKTZ
         2xP2hVwGOqkNWKN1p3duDvEZPz0wbJz8IL92XTLi69pg3DTDQqP+LoFyfUgmhPvdBPDP
         77Lv3a+aySnvgoWqz45MGNMP0BUcwKHexCYZR3GEl+DlaJAsvongp2iwIpQyrd2eCoE7
         nvdg==
X-Forwarded-Encrypted: i=1; AJvYcCWq+qdn2yhhhpvAM99mBVtQgoJ3nSki4bIMqnw7Ks591T8B7BooXct1kJ06DHoYPdukF5pWjGJQT74fP80=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJA8/EfNbWpADmdF9nixz2IEwmcAmIE026loZo5tugt2a9W0sF
	dXQur94pKZSukYdEu73wJLlJKxRZr5XwuyQ6PA+7bqZWS7c+B55K0M3HughQbBI12QH6MyDYZ4O
	Z8A==
X-Google-Smtp-Source: AGHT+IEj9U/qqkg2JK42tE1kXZKV4PCOb8pIWaocVHh7N8zNZBI6gh3bGtWfH3FUXtlThY+c9ekx5NvITFQ=
X-Received: from pgbdp2.prod.google.com ([2002:a05:6a02:f02:b0:af2:446a:1332])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:748d:b0:1f5:7f56:a649
 with SMTP id adf61e73a8af0-1fe42f359e6mr409764637.13.1742492376275; Thu, 20
 Mar 2025 10:39:36 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:39:29 -0700
In-Reply-To: <20250320173931.1583800-1-surenb@google.com>
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
Mime-Version: 1.0
References: <20250320173931.1583800-1-surenb@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250320173931.1583800-2-surenb@google.com>
Subject: [RFC 1/3] mm: implement cleancache
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, david@redhat.com, vbabka@suse.cz, 
	lorenzo.stoakes@oracle.com, liam.howlett@oracle.com, alexandru.elisei@arm.com, 
	peterx@redhat.com, hannes@cmpxchg.org, mhocko@kernel.org, 
	m.szyprowski@samsung.com, iamjoonsoo.kim@lge.com, mina86@mina86.com, 
	axboe@kernel.dk, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	hch@infradead.org, jack@suse.cz, hbathini@linux.ibm.com, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, aneesh.kumar@kernel.org, 
	bhelgaas@google.com, sj@kernel.org, fvdl@google.com, ziy@nvidia.com, 
	yuzhao@google.com, minchan@kernel.org, surenb@google.com, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Cleancache can be thought of as a page-granularity victim cache for clean
pages that the kernel's pageframe replacement algorithm (PFRA) would like
to keep around, but can't since there isn't enough memory.  So when the
PFRA "evicts" a page, it first attempts to use cleancache code to
put the data contained in that page into "transcendent memory", memory
that is not directly accessible or addressable by the kernel.
Later, when the system needs to access a page in a file on disk, it first
checks cleancache to see if it already contains it; if it does, the page
of data is copied into the kernel and a disk access is avoided.
The patchset borrows the idea, some code and documentation from previous
cleancache implementation but as opposed to being a thin pass-through
layer it now implements housekeeping code to associate cleancache pages
with their inodes and handling of page pools donated by the cleancache
backends. If also avoids intrusive hooks into filesystem code, limiting
itself to hooks in mm reclaim and page-in paths and two hooks to detect
new filesystem mount/unmount events.
This patch implements the basic cleancache support. Future plans include
implementing large folio support, sysfs statistics and cleancache page
eviction mechanism.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Minchan Kim <minchan@google.com>
---
 block/bdev.c               |   8 +
 fs/super.c                 |   3 +
 include/linux/cleancache.h |  88 ++++
 include/linux/fs.h         |   7 +
 mm/Kconfig                 |  17 +
 mm/Makefile                |   1 +
 mm/cleancache.c            | 926 +++++++++++++++++++++++++++++++++++++
 mm/filemap.c               |  63 ++-
 mm/truncate.c              |  21 +-
 9 files changed, 1124 insertions(+), 10 deletions(-)
 create mode 100644 include/linux/cleancache.h
 create mode 100644 mm/cleancache.c

diff --git a/block/bdev.c b/block/bdev.c
index 9d73a8fbf7f9..aa00b9da9e0a 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -28,6 +28,7 @@
 #include <linux/part_stat.h>
 #include <linux/uaccess.h>
 #include <linux/stat.h>
+#include <linux/cleancache.h>
 #include "../fs/internal.h"
 #include "blk.h"
 
@@ -95,12 +96,19 @@ static void kill_bdev(struct block_device *bdev)
 void invalidate_bdev(struct block_device *bdev)
 {
 	struct address_space *mapping = bdev->bd_mapping;
+	struct cleancache_filekey key;
 
 	if (mapping->nrpages) {
 		invalidate_bh_lrus();
 		lru_add_drain_all();	/* make sure all lru add caches are flushed */
 		invalidate_mapping_pages(mapping, 0, -1);
 	}
+	/*
+	 * 99% of the time, we don't need to flush the cleancache on the bdev.
+	 * But, for the strange corners, lets be cautious
+	 */
+	cleancache_invalidate_inode(mapping,
+				    cleancache_get_key(mapping->host, &key));
 }
 EXPORT_SYMBOL(invalidate_bdev);
 
diff --git a/fs/super.c b/fs/super.c
index 5a7db4a556e3..7e8d668a587e 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -31,6 +31,7 @@
 #include <linux/mutex.h>
 #include <linux/backing-dev.h>
 #include <linux/rculist_bl.h>
+#include <linux/cleancache.h>
 #include <linux/fscrypt.h>
 #include <linux/fsnotify.h>
 #include <linux/lockdep.h>
@@ -374,6 +375,7 @@ static struct super_block *alloc_super(struct file_system_type *type, int flags,
 	s->s_time_gran = 1000000000;
 	s->s_time_min = TIME64_MIN;
 	s->s_time_max = TIME64_MAX;
+	cleancache_add_fs(s);
 
 	s->s_shrink = shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE,
 				     "sb-%s", type->name);
@@ -469,6 +471,7 @@ void deactivate_locked_super(struct super_block *s)
 {
 	struct file_system_type *fs = s->s_type;
 	if (atomic_dec_and_test(&s->s_active)) {
+		cleancache_remove_fs(s);
 		shrinker_free(s->s_shrink);
 		fs->kill_sb(s);
 
diff --git a/include/linux/cleancache.h b/include/linux/cleancache.h
new file mode 100644
index 000000000000..a9161cbf3490
--- /dev/null
+++ b/include/linux/cleancache.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_CLEANCACHE_H
+#define _LINUX_CLEANCACHE_H
+
+#include <linux/fs.h>
+#include <linux/exportfs.h>
+#include <linux/mm.h>
+
+/* super_block->cleancache_id value for an invalid ID */
+#define CLEANCACHE_ID_INVALID	-1
+
+#define CLEANCACHE_KEY_MAX	6
+
+/*
+ * Cleancache requires every file with a folio in cleancache to have a
+ * unique key unless/until the file is removed/truncated.  For some
+ * filesystems, the inode number is unique, but for "modern" filesystems
+ * an exportable filehandle is required (see exportfs.h)
+ */
+struct cleancache_filekey {
+	union {
+		ino_t ino;
+		__u32 fh[CLEANCACHE_KEY_MAX];
+		u32 key[CLEANCACHE_KEY_MAX];
+	} u;
+};
+
+#ifdef CONFIG_CLEANCACHE
+
+/* Hooks into MM and FS */
+struct cleancache_filekey *cleancache_get_key(struct inode *inode,
+					      struct cleancache_filekey *key);
+void cleancache_add_fs(struct super_block *sb);
+void cleancache_remove_fs(struct super_block *sb);
+void cleancache_store_folio(struct folio *folio,
+			    struct cleancache_filekey *key);
+bool cleancache_restore_folio(struct folio *folio,
+			      struct cleancache_filekey *key);
+void cleancache_invalidate_folio(struct address_space *mapping,
+				 struct folio *folio,
+				 struct cleancache_filekey *key);
+void cleancache_invalidate_inode(struct address_space *mapping,
+				 struct cleancache_filekey *key);
+
+/*
+ * Backend API
+ *
+ * Cleancache does not touch page reference. Page refcount should be 1 when
+ * page is placed or returned into cleancache and pages obtained from
+ * cleancache will also have their refcount at 1.
+ */
+int cleancache_register_backend(const char *name, struct list_head *folios);
+int cleancache_backend_get_folio(int area_id, struct folio *folio);
+int cleancache_backend_put_folio(int area_id, struct folio *folio);
+
+#else /* CONFIG_CLEANCACHE */
+
+static inline
+struct cleancache_filekey *cleancache_get_key(struct inode *inode,
+					      struct cleancache_filekey *key)
+{
+	return NULL;
+}
+static inline void cleancache_add_fs(struct super_block *sb) {}
+static inline void cleancache_remove_fs(struct super_block *sb) {}
+static inline void cleancache_store_folio(struct folio *folio,
+					  struct cleancache_filekey *key) {}
+static inline bool cleancache_restore_folio(struct folio *folio,
+					    struct cleancache_filekey *key)
+{
+	return false;
+}
+static inline void cleancache_invalidate_folio(struct address_space *mapping,
+					       struct folio *folio,
+					       struct cleancache_filekey *key) {}
+static inline void cleancache_invalidate_inode(struct address_space *mapping,
+					       struct cleancache_filekey *key) {}
+
+static inline int cleancache_register_backend(const char *name,
+		struct list_head *folios) { return -EOPNOTSUPP; }
+static inline int cleancache_backend_get_folio(int area_id,
+		struct folio *folio) { return -EOPNOTSUPP; }
+static inline int cleancache_backend_put_folio(int area_id,
+		struct folio *folio) { return -EOPNOTSUPP; }
+
+#endif /* CONFIG_CLEANCACHE */
+
+#endif /* _LINUX_CLEANCACHE_H */
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 2788df98080f..851544454c9e 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1407,6 +1407,13 @@ struct super_block {
 
 	const struct dentry_operations *s_d_op; /* default d_op for dentries */
 
+#ifdef CONFIG_CLEANCACHE
+	/*
+	 * Saved identifier for cleancache (CLEANCACHE_ID_INVALID means none)
+	 */
+	int cleancache_id;
+#endif
+
 	struct shrinker *s_shrink;	/* per-sb shrinker handle */
 
 	/* Number of inodes with nlink == 0 but still referenced */
diff --git a/mm/Kconfig b/mm/Kconfig
index 4a4e7b63d30a..d6ebf0fb0432 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -945,6 +945,23 @@ config USE_PERCPU_NUMA_NODE_ID
 config HAVE_SETUP_PER_CPU_AREA
 	bool
 
+config CLEANCACHE
+	bool "Enable cleancache to cache clean pages if tmem is present"
+	help
+	  Cleancache can be thought of as a page-granularity victim cache
+	  for clean pages that the kernel's pageframe replacement algorithm
+	  (PFRA) would like to keep around, but can't since there isn't enough
+	  memory.  So when the PFRA "evicts" a page, it first attempts to use
+	  cleancache code to put the data contained in that page into
+	  "transcendent memory", memory that is not directly accessible or
+	  addressable by the kernel and is of unknown and possibly
+	  time-varying size. When system wishes to access a page in a file
+	  on disk, it first checks cleancache to see if it already contains
+	  it; if it does, the page is copied into the kernel and a disk
+	  access is avoided.
+
+	  If unsure, say N.
+
 config CMA
 	bool "Contiguous Memory Allocator"
 	depends on MMU
diff --git a/mm/Makefile b/mm/Makefile
index e7f6bbf8ae5f..084dbe9edbc4 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -148,3 +148,4 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_PT_RECLAIM) += pt_reclaim.o
+obj-$(CONFIG_CLEANCACHE) += cleancache.o
diff --git a/mm/cleancache.c b/mm/cleancache.c
new file mode 100644
index 000000000000..23113c5adfc5
--- /dev/null
+++ b/mm/cleancache.c
@@ -0,0 +1,926 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cleancache frontend
+ *
+ */
+
+#include <linux/cleancache.h>
+#include <linux/debugfs.h>
+#include <linux/exportfs.h>
+#include <linux/fs.h>
+#include <linux/hashtable.h>
+#include <linux/highmem.h>
+#include <linux/idr.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+#include <linux/xarray.h>
+
+/*
+ * Possible lock nesting:
+ * inode->pages.xa_lock
+ *	free_folios_lock
+ *
+ * inode->pages.xa_lock
+ *	fs->hash_lock
+ *
+ * Notes: should keep free_folios_lock and fs->hash_lock HARDIRQ-irq-safe
+ * since inode->pages.xa_lock is HARDIRQ-irq-safe and we take these locks
+ * while holding inode->pages.xa_lock. This means whenever we take these
+ * locks while not holding inode->pages.xa_lock, we should disable irqs.
+ */
+
+/* Counters available via /sys/kernel/debug/cleancache */
+static u64 cleancache_hits;
+static u64 cleancache_misses;
+static u64 cleancache_stores;
+static u64 cleancache_failed_stores;
+static u64 cleancache_invalidates;
+
+/*
+ * @cleancache_inode represents each inode in @cleancache_fs
+ *
+ * The cleancache_inode will be freed by RCU when the last page from xarray
+ * is freed, except for invalidate_inode() case.
+ */
+struct cleancache_inode {
+	struct cleancache_filekey key;
+	struct hlist_node hash;
+	refcount_t ref_count;
+
+	struct xarray pages;
+	struct rcu_head rcu;
+	struct cleancache_fs *fs;
+};
+
+static struct kmem_cache *slab_inode;
+
+#define INODE_HASH_BITS		10
+
+/* represents each file system instance hosted by the cleancache */
+struct cleancache_fs {
+	spinlock_t hash_lock;
+	DECLARE_HASHTABLE(inode_hash, INODE_HASH_BITS);
+	refcount_t ref_count;
+};
+
+static DEFINE_IDR(fs_idr);
+static DEFINE_SPINLOCK(fs_lock);
+
+/* Cleancache backend memory pool */
+struct cleancache_pool {
+	struct list_head free_folios;
+	spinlock_t free_folios_lock;
+};
+
+#define CLEANCACHE_MAX_POOLS	64
+
+static struct cleancache_pool pools[CLEANCACHE_MAX_POOLS];
+static atomic_t nr_pools = ATOMIC_INIT(0);
+static DEFINE_SPINLOCK(pools_lock);
+
+/*
+ * If the filesystem uses exportable filehandles, use the filehandle as
+ * the key, else use the inode number.
+ */
+struct cleancache_filekey *cleancache_get_key(struct inode *inode,
+					      struct cleancache_filekey *key)
+{
+	int (*fhfn)(struct inode *inode, __u32 *fh, int *max_len, struct inode *parent);
+	int len = 0, maxlen = CLEANCACHE_KEY_MAX;
+	struct super_block *sb = inode->i_sb;
+
+	key->u.ino = inode->i_ino;
+	if (sb->s_export_op != NULL) {
+		fhfn = sb->s_export_op->encode_fh;
+		if  (fhfn) {
+			len = (*fhfn)(inode, &key->u.fh[0], &maxlen, NULL);
+			if (len <= FILEID_ROOT || len == FILEID_INVALID)
+				return NULL;
+			if (maxlen > CLEANCACHE_KEY_MAX)
+				return NULL;
+		}
+	}
+	return key;
+}
+
+/* page attribute helpers */
+static inline void set_page_pool_id(struct page *page, int id)
+{
+	page->page_type = id;
+}
+
+static inline int page_pool_id(struct page *page)
+{
+	return page->page_type;
+}
+
+static inline struct cleancache_pool *page_pool(struct page *page)
+{
+	return &pools[page_pool_id(page)];
+}
+
+/* Can be used only when page is isolated */
+static inline void __SetPageCCacheFree(struct page *page)
+{
+	SetPagePrivate(page);
+}
+
+static inline void SetPageCCacheFree(struct page *page)
+{
+	lockdep_assert_held(&(page_pool(page)->free_folios_lock));
+	__SetPageCCacheFree(page);
+}
+
+static inline void ClearPageCCacheFree(struct page *page)
+{
+	lockdep_assert_held(&(page_pool(page)->free_folios_lock));
+	ClearPagePrivate(page);
+}
+
+static inline int PageCCacheFree(struct page *page)
+{
+	lockdep_assert_held(&(page_pool(page)->free_folios_lock));
+	return PagePrivate(page);
+}
+
+/* Can be used only when page is isolated */
+static void __set_page_inode_offs(struct page *page,
+				  struct cleancache_inode *inode,
+				  unsigned long index)
+{
+	page->mapping = (struct address_space *)inode;
+	page->index = index;
+}
+
+static void set_page_inode_offs(struct page *page, struct cleancache_inode *inode,
+				unsigned long index)
+{
+	lockdep_assert_held(&(page_pool(page)->free_folios_lock));
+
+	__set_page_inode_offs(page, inode, index);
+}
+
+static void page_inode_offs(struct page *page, struct cleancache_inode **inode,
+			    unsigned long *index)
+{
+	lockdep_assert_held(&(page_pool(page)->free_folios_lock));
+
+	*inode = (struct cleancache_inode *)page->mapping;
+	*index = page->index;
+}
+
+/* page pool helpers */
+static void add_page_to_pool(struct page *page, struct cleancache_pool *pool)
+{
+	unsigned long flags;
+
+	VM_BUG_ON(!list_empty(&page->lru));
+
+	spin_lock_irqsave(&pool->free_folios_lock, flags);
+
+	set_page_inode_offs(page, NULL, 0);
+	SetPageCCacheFree(page);
+	list_add(&page_folio(page)->lru, &pool->free_folios);
+
+	spin_unlock_irqrestore(&pool->free_folios_lock, flags);
+}
+
+static struct page *remove_page_from_pool(struct page *page, struct cleancache_pool *pool)
+{
+	lockdep_assert_held(&pool->free_folios_lock);
+	VM_BUG_ON(page_pool(page) != pool);
+
+	if (!PageCCacheFree(page))
+		return NULL;
+
+	list_del_init(&page->lru);
+	ClearPageCCacheFree(page);
+
+	return page;
+}
+
+static struct page *pick_page_from_pool(void)
+{
+	struct cleancache_pool *pool;
+	struct page *page = NULL;
+	unsigned long flags;
+	int count;
+
+	count = atomic_read_acquire(&nr_pools);
+	for (int i = 0; i < count; i++) {
+		pool = &pools[i];
+		spin_lock_irqsave(&pool->free_folios_lock, flags);
+		if (!list_empty(&pool->free_folios)) {
+			struct folio *folio;
+
+			folio = list_last_entry(&pool->free_folios,
+						struct folio, lru);
+			page = &folio->page;
+			WARN_ON(!remove_page_from_pool(page, pool));
+			spin_unlock_irqrestore(&pool->free_folios_lock, flags);
+			break;
+		}
+		spin_unlock_irqrestore(&pool->free_folios_lock, flags);
+	}
+
+	return page;
+}
+
+/* FS helpers */
+static struct cleancache_fs *get_fs(int fs_id)
+{
+	struct cleancache_fs *fs;
+
+	rcu_read_lock();
+	fs = idr_find(&fs_idr, fs_id);
+	if (fs && !refcount_inc_not_zero(&fs->ref_count))
+		fs = NULL;
+	rcu_read_unlock();
+
+	return fs;
+}
+
+static void put_fs(struct cleancache_fs *fs)
+{
+	if (refcount_dec_and_test(&fs->ref_count))
+		kfree(fs);
+}
+
+/* inode helpers */
+static struct cleancache_inode *alloc_inode(struct cleancache_fs *fs,
+					    struct cleancache_filekey *key)
+{
+	struct cleancache_inode *inode;
+
+	inode = kmem_cache_alloc(slab_inode, GFP_ATOMIC|__GFP_NOWARN);
+	if (inode) {
+		memcpy(&inode->key, key, sizeof(*key));
+		xa_init_flags(&inode->pages, XA_FLAGS_LOCK_IRQ);
+		INIT_HLIST_NODE(&inode->hash);
+		inode->fs = fs;
+		refcount_set(&inode->ref_count, 1);
+	}
+
+	return inode;
+}
+
+static int erase_pages_from_inode(struct cleancache_inode *inode,
+				  bool remove_inode);
+
+static void inode_free_rcu(struct rcu_head *rcu)
+{
+	struct cleancache_inode *inode;
+
+	inode = container_of(rcu, struct cleancache_inode, rcu);
+	erase_pages_from_inode(inode, false);
+	kmem_cache_free(slab_inode, inode);
+}
+
+static bool get_inode(struct cleancache_inode *inode)
+{
+	return refcount_inc_not_zero(&inode->ref_count);
+}
+
+static bool put_inode(struct cleancache_inode *inode)
+{
+	if (!refcount_dec_and_test(&inode->ref_count))
+		return false;
+
+	call_rcu(&inode->rcu, inode_free_rcu);
+	return true;
+}
+
+static void remove_inode_if_empty(struct cleancache_inode *inode)
+{
+	struct cleancache_fs *fs = inode->fs;
+
+	lockdep_assert_held(&inode->pages.xa_lock);
+
+	if (!xa_empty(&inode->pages))
+		return;
+
+	spin_lock(&fs->hash_lock);
+	if (!WARN_ON(hlist_unhashed(&inode->hash)))
+		hlist_del_init_rcu(&inode->hash);
+	spin_unlock(&fs->hash_lock);
+	/* Caller should have taken an extra refcount to keep inode valid */
+	WARN_ON(put_inode(inode));
+}
+
+static int store_page_in_inode(struct cleancache_inode *inode,
+			       unsigned long index, struct page *page)
+{
+	struct cleancache_pool *pool = page_pool(page);
+	unsigned long flags;
+	int err;
+
+	lockdep_assert_held(&inode->pages.xa_lock);
+	VM_BUG_ON(!list_empty(&page->lru));
+
+	spin_lock_irqsave(&pool->free_folios_lock, flags);
+
+	err = xa_err(__xa_store(&inode->pages, index, page,
+				GFP_ATOMIC|__GFP_NOWARN));
+	if (!err) {
+		set_page_inode_offs(page, inode, index);
+		VM_BUG_ON_PAGE(PageCCacheFree(page), page);
+	}
+
+	spin_unlock_irqrestore(&pool->free_folios_lock, flags);
+
+	return err;
+}
+
+static void erase_page_from_inode(struct cleancache_inode *inode,
+				  unsigned long index, struct page *page)
+{
+	bool removed;
+
+	lockdep_assert_held(&inode->pages.xa_lock);
+
+	removed = __xa_erase(&inode->pages, index);
+	VM_BUG_ON(!removed || !list_empty(&page->lru));
+
+	remove_inode_if_empty(inode);
+}
+
+static int erase_pages_from_inode(struct cleancache_inode *inode, bool remove_inode)
+{
+	XA_STATE(xas, &inode->pages, 0);
+	unsigned long flags;
+	struct page *page;
+	unsigned int ret = 0;
+
+	xas_lock_irqsave(&xas, flags);
+
+	if (!xa_empty(&inode->pages)) {
+		xas_for_each(&xas, page, ULONG_MAX) {
+			__xa_erase(&inode->pages, xas.xa_index);
+			add_page_to_pool(page, page_pool(page));
+			ret++;
+		}
+	}
+	if (remove_inode)
+		remove_inode_if_empty(inode);
+
+	xas_unlock_irqrestore(&xas, flags);
+
+	return ret;
+}
+
+static struct cleancache_inode *find_and_get_inode(struct cleancache_fs *fs,
+						   struct cleancache_filekey *key)
+{
+	struct cleancache_inode *tmp, *inode = NULL;
+
+	rcu_read_lock();
+	hash_for_each_possible_rcu(fs->inode_hash, tmp, hash, key->u.ino) {
+		if (memcmp(&tmp->key, key, sizeof(*key)))
+			continue;
+
+		/* TODO: should we stop if get fails? */
+		if (get_inode(tmp)) {
+			inode = tmp;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return inode;
+}
+
+static struct cleancache_inode *add_and_get_inode(struct cleancache_fs *fs,
+						  struct cleancache_filekey *key)
+{
+	struct cleancache_inode *inode, *tmp;
+	unsigned long flags;
+
+	inode = alloc_inode(fs, key);
+	if (!inode)
+		return ERR_PTR(-ENOMEM);
+
+	spin_lock_irqsave(&fs->hash_lock, flags);
+	tmp = find_and_get_inode(fs, key);
+	if (tmp) {
+		spin_unlock_irqrestore(&fs->hash_lock, flags);
+		/* someone already added it */
+		put_inode(inode);
+		put_inode(tmp);
+		return ERR_PTR(-EEXIST);
+	}
+
+	hash_add_rcu(fs->inode_hash, &inode->hash, key->u.ino);
+	get_inode(inode);
+	spin_unlock_irqrestore(&fs->hash_lock, flags);
+
+	return inode;
+}
+
+/*
+ * We want to store only workingset pages in the cleancache to increase hit
+ * ratio so there are four cases:
+ *
+ * @page is workingset but cleancache doesn't have it: use new cleancache page
+ * @page is workingset and cleancache has it: overwrite the stale data
+ * @page is !workingset and cleancache doesn't have it: just bail out
+ * @page is !workingset and cleancache has it: remove the stale @page
+ */
+static bool store_into_inode(struct cleancache_fs *fs,
+			     struct cleancache_filekey *key,
+			     pgoff_t offset, struct page *page)
+{
+	bool workingset = PageWorkingset(page);
+	struct cleancache_inode *inode;
+	struct page *stored_page;
+	void *src, *dst;
+	bool ret = false;
+
+find_inode:
+	inode = find_and_get_inode(fs, key);
+	if (!inode) {
+		if (!workingset)
+			return false;
+
+		inode = add_and_get_inode(fs, key);
+		if (IS_ERR_OR_NULL(inode)) {
+			/*
+			 * Retry if someone just added new inode from under us.
+			 */
+			if (PTR_ERR(inode) == -EEXIST)
+				goto find_inode;
+
+			return false;
+		}
+	}
+
+	xa_lock(&inode->pages);
+
+	stored_page = xa_load(&inode->pages, offset);
+	if (stored_page) {
+		if (!workingset) {
+			erase_page_from_inode(inode, offset, stored_page);
+			add_page_to_pool(stored_page, page_pool(stored_page));
+			goto out_unlock;
+		}
+	} else {
+		if (!workingset)
+			goto out_unlock;
+
+		stored_page = pick_page_from_pool();
+		if (!stored_page)
+			goto out_unlock;
+
+		if (store_page_in_inode(inode, offset, stored_page)) {
+			add_page_to_pool(stored_page, page_pool(stored_page));
+			goto out_unlock;
+		}
+	}
+
+	/* Copy the content of the page */
+	src = kmap_local_page(page);
+	dst = kmap_local_page(stored_page);
+	memcpy(dst, src, PAGE_SIZE);
+	kunmap_local(dst);
+	kunmap_local(src);
+
+	ret = true;
+out_unlock:
+	/*
+	 * Remove the inode if it was just created but we failed to add a page.
+	 */
+	remove_inode_if_empty(inode);
+	xa_unlock(&inode->pages);
+	put_inode(inode);
+
+	return ret;
+}
+
+static bool load_from_inode(struct cleancache_fs *fs,
+			    struct cleancache_filekey *key,
+			    pgoff_t offset, struct page *page)
+{
+	struct cleancache_inode *inode;
+	struct page *stored_page;
+	void *src, *dst;
+	bool ret = false;
+
+	inode = find_and_get_inode(fs, key);
+	if (!inode)
+		return false;
+
+	xa_lock(&inode->pages);
+
+	stored_page = xa_load(&inode->pages, offset);
+	if (stored_page) {
+		src = kmap_local_page(stored_page);
+		dst = kmap_local_page(page);
+		memcpy(dst, src, PAGE_SIZE);
+		kunmap_local(dst);
+		kunmap_local(src);
+		ret = true;
+	}
+
+	xa_unlock(&inode->pages);
+	put_inode(inode);
+
+	return ret;
+}
+
+static bool invalidate_page(struct cleancache_fs *fs,
+			    struct cleancache_filekey *key, pgoff_t offset)
+{
+	struct cleancache_inode *inode;
+	struct page *page;
+
+	inode = find_and_get_inode(fs, key);
+	if (!inode)
+		return false;
+
+	xa_lock(&inode->pages);
+	page = xa_load(&inode->pages, offset);
+	if (page) {
+		erase_page_from_inode(inode, offset, page);
+		add_page_to_pool(page, page_pool(page));
+	}
+	xa_unlock(&inode->pages);
+	put_inode(inode);
+
+	return page != NULL;
+}
+
+static unsigned int invalidate_inode(struct cleancache_fs *fs,
+				     struct cleancache_filekey *key)
+{
+	struct cleancache_inode *inode;
+	unsigned int ret;
+
+	inode = find_and_get_inode(fs, key);
+	if (!inode)
+		return 0;
+
+	ret = erase_pages_from_inode(inode, true);
+	put_inode(inode);
+
+	return ret;
+}
+
+/* Hooks into MM and FS */
+void cleancache_add_fs(struct super_block *sb)
+{
+	int fs_id;
+	struct cleancache_fs *fs;
+
+	fs = kzalloc(sizeof(struct cleancache_fs), GFP_KERNEL);
+	if (!fs)
+		goto err;
+
+	spin_lock_init(&fs->hash_lock);
+	hash_init(fs->inode_hash);
+	refcount_set(&fs->ref_count, 1);
+
+	idr_preload(GFP_KERNEL);
+	spin_lock(&fs_lock);
+	fs_id = idr_alloc(&fs_idr, fs, 0, 0, GFP_NOWAIT);
+	spin_unlock(&fs_lock);
+	idr_preload_end();
+
+	if (fs_id < 0) {
+		pr_warn("too many file systems\n");
+		goto err_free;
+	}
+
+	sb->cleancache_id = fs_id;
+	return;
+
+err_free:
+	kfree(fs);
+err:
+	sb->cleancache_id = CLEANCACHE_ID_INVALID;
+}
+
+void cleancache_remove_fs(struct super_block *sb)
+{
+	int fs_id = sb->cleancache_id;
+	struct cleancache_inode *inode;
+	struct cleancache_fs *fs;
+	struct hlist_node *tmp;
+	int cursor;
+
+	sb->cleancache_id = CLEANCACHE_ID_INVALID;
+	fs = get_fs(fs_id);
+	if (!fs)
+		return;
+
+	/*
+	 * No need to hold any lock here since this function is called when
+	 * fs is unmounted. IOW, inode insert/delete race cannot happen.
+	 */
+	hash_for_each_safe(fs->inode_hash, cursor, tmp, inode, hash)
+		cleancache_invalidates += invalidate_inode(fs, &inode->key);
+	synchronize_rcu();
+
+#ifdef CONFIG_DEBUG_VM
+	for (int i = 0; i < HASH_SIZE(fs->inode_hash); i++)
+		VM_BUG_ON(!hlist_empty(&fs->inode_hash[i]));
+#endif
+	spin_lock(&fs_lock);
+	idr_remove(&fs_idr, fs_id);
+	spin_unlock(&fs_lock);
+	put_fs(fs);
+	pr_info("removed file system %d\n", fs_id);
+
+	/* free the object */
+	put_fs(fs);
+}
+
+/*
+ * WARNING: This cleancache function might be called with disabled irqs
+ */
+void cleancache_store_folio(struct folio *folio,
+			    struct cleancache_filekey *key)
+{
+	struct cleancache_fs *fs;
+	int fs_id;
+
+	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
+
+	if (!key)
+		return;
+
+	/* Do not support large folios yet */
+	if (folio_test_large(folio))
+		return;
+
+	fs_id = folio->mapping->host->i_sb->cleancache_id;
+	if (fs_id == CLEANCACHE_ID_INVALID)
+		return;
+
+	fs = get_fs(fs_id);
+	if (!fs)
+		return;
+
+	if (store_into_inode(fs, key, folio->index, &folio->page))
+		cleancache_stores++;
+	else
+		cleancache_failed_stores++;
+	put_fs(fs);
+}
+
+bool cleancache_restore_folio(struct folio *folio,
+			      struct cleancache_filekey *key)
+{
+	struct cleancache_fs *fs;
+	int fs_id;
+	bool ret;
+
+	if (!key)
+		return false;
+
+	/* Do not support large folios yet */
+	if (folio_test_large(folio))
+		return false;
+
+	fs_id = folio->mapping->host->i_sb->cleancache_id;
+	if (fs_id == CLEANCACHE_ID_INVALID)
+		return false;
+
+	fs = get_fs(fs_id);
+	if (!fs)
+		return false;
+
+	ret = load_from_inode(fs, key, folio->index, &folio->page);
+	if (ret)
+		cleancache_hits++;
+	else
+		cleancache_misses++;
+	put_fs(fs);
+
+	return ret;
+}
+
+/*
+ * WARNING: This cleancache function might be called with disabled irqs
+ */
+void cleancache_invalidate_folio(struct address_space *mapping,
+				 struct folio *folio,
+				 struct cleancache_filekey *key)
+{
+	struct cleancache_fs *fs;
+	int fs_id;
+
+	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
+
+	if (!key)
+		return;
+
+	/* Do not support large folios yet */
+	if (folio_test_large(folio))
+		return;
+
+	/* Careful, folio->mapping can be NULL */
+	fs_id = mapping->host->i_sb->cleancache_id;
+	if (fs_id == CLEANCACHE_ID_INVALID)
+		return;
+
+	fs = get_fs(fs_id);
+	if (!fs)
+		return;
+
+	if (invalidate_page(fs, key, folio->index))
+		cleancache_invalidates++;
+	put_fs(fs);
+}
+
+void cleancache_invalidate_inode(struct address_space *mapping,
+				 struct cleancache_filekey *key)
+{
+	struct cleancache_fs *fs;
+	int fs_id;
+
+	if (!key)
+		return;
+
+	fs_id = mapping->host->i_sb->cleancache_id;
+	if (fs_id == CLEANCACHE_ID_INVALID)
+		return;
+
+	fs = get_fs(fs_id);
+	if (!fs)
+		return;
+
+	cleancache_invalidates += invalidate_inode(fs, key);
+	put_fs(fs);
+}
+
+/* Backend API */
+/*
+ * Register a new backend and add its pages for cleancache to use.
+ * Returns pool id on success or a negative error code on failure.
+ */
+int cleancache_register_backend(const char *name, struct list_head *folios)
+{
+	struct cleancache_pool *pool;
+	unsigned long pool_size = 0;
+	unsigned long flags;
+	struct folio *folio;
+	int pool_id;
+
+	/* pools_lock prevents concurrent registrations */
+	spin_lock(&pools_lock);
+
+	pool_id = atomic_read(&nr_pools);
+	if (pool_id >= CLEANCACHE_MAX_POOLS) {
+		spin_unlock(&pools_lock);
+		return -ENOMEM;
+	}
+
+	pool = &pools[pool_id];
+	INIT_LIST_HEAD(&pool->free_folios);
+	spin_lock_init(&pool->free_folios_lock);
+	/* Ensure above stores complete before we increase the count */
+	atomic_set_release(&nr_pools, pool_id + 1);
+
+	spin_unlock(&pools_lock);
+
+	list_for_each_entry(folio, folios, lru) {
+		struct page *page;
+
+		/* Do not support large folios yet */
+		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
+		VM_BUG_ON_FOLIO(folio_ref_count(folio) != 1, folio);
+		page = &folio->page;
+		set_page_pool_id(page, pool_id);
+		__set_page_inode_offs(page, NULL, 0);
+		__SetPageCCacheFree(page);
+		pool_size++;
+	}
+
+	spin_lock_irqsave(&pool->free_folios_lock, flags);
+	list_splice_init(folios, &pool->free_folios);
+	spin_unlock_irqrestore(&pool->free_folios_lock, flags);
+
+	pr_info("Registered \'%s\' cleancache backend, pool id %d, size %lu pages\n",
+		name ? : "none", pool_id, pool_size);
+
+	return pool_id;
+}
+EXPORT_SYMBOL(cleancache_register_backend);
+
+int cleancache_backend_get_folio(int pool_id, struct folio *folio)
+{
+	struct cleancache_inode *inode;
+	struct cleancache_pool *pool;
+	unsigned long flags;
+	unsigned long index;
+	struct page *page;
+
+
+	/* Do not support large folios yet */
+	if (folio_test_large(folio))
+		return -EOPNOTSUPP;
+
+	page = &folio->page;
+	/* Does the page belong to the requesting backend */
+	if (page_pool_id(page) != pool_id)
+		return -EINVAL;
+
+	pool = &pools[pool_id];
+again:
+	spin_lock_irqsave(&pool->free_folios_lock, flags);
+
+	/* If page is free inside the pool, return it */
+	if (remove_page_from_pool(page, pool)) {
+		spin_unlock_irqrestore(&pool->free_folios_lock, flags);
+		return 0;
+	}
+
+	/*
+	 * The page is not free, therefore it has to belong to a valid inode.
+	 * Operations on CCacheFree and page->mapping are done under
+	 * free_folios_lock which we are currently holding and CCacheFree
+	 * always gets cleared before page->mapping is set.
+	 */
+	page_inode_offs(page, &inode, &index);
+	if (WARN_ON(!inode || !get_inode(inode))) {
+		spin_unlock_irqrestore(&pool->free_folios_lock, flags);
+		return -EINVAL;
+	}
+
+	spin_unlock_irqrestore(&pool->free_folios_lock, flags);
+
+	xa_lock_irqsave(&inode->pages, flags);
+	/*
+	 * Retry if the page got erased from the inode but was not added into
+	 * the pool yet. erase_page_from_inode() and add_page_to_pool() happens
+	 * under inode->pages.xa_lock which we are holding, therefore by now
+	 * both operations should have completed. Let's retry.
+	 */
+	if (xa_load(&inode->pages, index) != page) {
+		xa_unlock_irqrestore(&inode->pages, flags);
+		put_inode(inode);
+		goto again;
+	}
+
+	erase_page_from_inode(inode, index, page);
+
+	spin_lock(&pool->free_folios_lock);
+	set_page_inode_offs(page, NULL, 0);
+	spin_unlock(&pool->free_folios_lock);
+
+	xa_unlock_irqrestore(&inode->pages, flags);
+
+	put_inode(inode);
+
+	return 0;
+}
+EXPORT_SYMBOL(cleancache_backend_get_folio);
+
+int cleancache_backend_put_folio(int pool_id, struct folio *folio)
+{
+	struct cleancache_pool *pool = &pools[pool_id];
+	struct page *page;
+
+	/* Do not support large folios yet */
+	if (folio_test_large(folio))
+		return -EOPNOTSUPP;
+
+	page = &folio->page;
+	VM_BUG_ON_PAGE(page_ref_count(page) != 1, page);
+	VM_BUG_ON(!list_empty(&page->lru));
+	/* Reset struct page fields */
+	set_page_pool_id(page, pool_id);
+	INIT_LIST_HEAD(&page->lru);
+	add_page_to_pool(page, pool);
+
+	return 0;
+}
+EXPORT_SYMBOL(cleancache_backend_put_folio);
+
+static int __init init_cleancache(void)
+{
+	slab_inode = KMEM_CACHE(cleancache_inode, 0);
+	if (!slab_inode)
+		return -ENOMEM;
+
+	return 0;
+}
+core_initcall(init_cleancache);
+
+#ifdef CONFIG_DEBUG_FS
+static int __init cleancache_debugfs_init(void)
+{
+	struct dentry *root;
+
+	root = debugfs_create_dir("cleancache", NULL);
+	debugfs_create_u64("hits", 0444, root, &cleancache_hits);
+	debugfs_create_u64("misses", 0444, root, &cleancache_misses);
+	debugfs_create_u64("stores", 0444, root, &cleancache_stores);
+	debugfs_create_u64("failed_stores", 0444, root, &cleancache_failed_stores);
+	debugfs_create_u64("invalidates", 0444, root, &cleancache_invalidates);
+
+	return 0;
+}
+late_initcall(cleancache_debugfs_init);
+#endif
diff --git a/mm/filemap.c b/mm/filemap.c
index cc69f174f76b..51dd86d7031f 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -36,6 +36,7 @@
 #include <linux/cpuset.h>
 #include <linux/hugetlb.h>
 #include <linux/memcontrol.h>
+#include <linux/cleancache.h>
 #include <linux/shmem_fs.h>
 #include <linux/rmap.h>
 #include <linux/delayacct.h>
@@ -147,10 +148,20 @@ static void page_cache_delete(struct address_space *mapping,
 }
 
 static void filemap_unaccount_folio(struct address_space *mapping,
-		struct folio *folio)
+		struct folio *folio, struct cleancache_filekey *key)
 {
 	long nr;
 
+	/*
+	 * if we're uptodate, flush out into the cleancache, otherwise
+	 * invalidate any existing cleancache entries.  We can't leave
+	 * stale data around in the cleancache once our page is gone
+	 */
+	if (folio_test_uptodate(folio) && folio_test_mappedtodisk(folio))
+		cleancache_store_folio(folio, key);
+	else
+		cleancache_invalidate_folio(mapping, folio, key);
+
 	VM_BUG_ON_FOLIO(folio_mapped(folio), folio);
 	if (!IS_ENABLED(CONFIG_DEBUG_VM) && unlikely(folio_mapped(folio))) {
 		pr_alert("BUG: Bad page cache in process %s  pfn:%05lx\n",
@@ -210,6 +221,16 @@ static void filemap_unaccount_folio(struct address_space *mapping,
 		folio_account_cleaned(folio, inode_to_wb(mapping->host));
 }
 
+static void ___filemap_remove_folio(struct folio *folio, void *shadow,
+				    struct cleancache_filekey *key)
+{
+	struct address_space *mapping = folio->mapping;
+
+	trace_mm_filemap_delete_from_page_cache(folio);
+	filemap_unaccount_folio(mapping, folio, key);
+	page_cache_delete(mapping, folio, shadow);
+}
+
 /*
  * Delete a page from the page cache and free it. Caller has to make
  * sure the page is locked and that nobody else uses it - or that usage
@@ -217,11 +238,7 @@ static void filemap_unaccount_folio(struct address_space *mapping,
  */
 void __filemap_remove_folio(struct folio *folio, void *shadow)
 {
-	struct address_space *mapping = folio->mapping;
-
-	trace_mm_filemap_delete_from_page_cache(folio);
-	filemap_unaccount_folio(mapping, folio);
-	page_cache_delete(mapping, folio, shadow);
+	___filemap_remove_folio(folio, shadow, NULL);
 }
 
 void filemap_free_folio(struct address_space *mapping, struct folio *folio)
@@ -246,11 +263,20 @@ void filemap_free_folio(struct address_space *mapping, struct folio *folio)
 void filemap_remove_folio(struct folio *folio)
 {
 	struct address_space *mapping = folio->mapping;
+	struct cleancache_filekey *pkey;
+	struct cleancache_filekey key;
 
 	BUG_ON(!folio_test_locked(folio));
+
+	/*
+	 * cleancache_get_key() uses sb->s_export_op->encode_fh which can
+	 * also take inode->i_lock. Get the key before taking inode->i_lock.
+	 */
+	pkey = cleancache_get_key(mapping->host, &key);
+
 	spin_lock(&mapping->host->i_lock);
 	xa_lock_irq(&mapping->i_pages);
-	__filemap_remove_folio(folio, NULL);
+	___filemap_remove_folio(folio, NULL, pkey);
 	xa_unlock_irq(&mapping->i_pages);
 	if (mapping_shrinkable(mapping))
 		inode_add_lru(mapping->host);
@@ -316,18 +342,26 @@ static void page_cache_delete_batch(struct address_space *mapping,
 void delete_from_page_cache_batch(struct address_space *mapping,
 				  struct folio_batch *fbatch)
 {
+	struct cleancache_filekey *pkey;
+	struct cleancache_filekey key;
 	int i;
 
 	if (!folio_batch_count(fbatch))
 		return;
 
+	/*
+	 * cleancache_get_key() uses sb->s_export_op->encode_fh which can
+	 * also take inode->i_lock. Get the key before taking inode->i_lock.
+	 */
+	pkey = cleancache_get_key(mapping->host, &key);
+
 	spin_lock(&mapping->host->i_lock);
 	xa_lock_irq(&mapping->i_pages);
 	for (i = 0; i < folio_batch_count(fbatch); i++) {
 		struct folio *folio = fbatch->folios[i];
 
 		trace_mm_filemap_delete_from_page_cache(folio);
-		filemap_unaccount_folio(mapping, folio);
+		filemap_unaccount_folio(mapping, folio, pkey);
 	}
 	page_cache_delete_batch(mapping, fbatch);
 	xa_unlock_irq(&mapping->i_pages);
@@ -1865,6 +1899,13 @@ void *filemap_get_entry(struct address_space *mapping, pgoff_t index)
 out:
 	rcu_read_unlock();
 
+	if (folio && !folio_test_uptodate(folio)) {
+		struct cleancache_filekey key;
+
+		if (cleancache_restore_folio(folio, cleancache_get_key(mapping->host, &key)))
+			folio_mark_uptodate(folio);
+	}
+
 	return folio;
 }
 
@@ -2430,6 +2471,7 @@ static int filemap_update_page(struct kiocb *iocb,
 		struct address_space *mapping, size_t count,
 		struct folio *folio, bool need_uptodate)
 {
+	struct cleancache_filekey key;
 	int error;
 
 	if (iocb->ki_flags & IOCB_NOWAIT) {
@@ -2466,6 +2508,11 @@ static int filemap_update_page(struct kiocb *iocb,
 				   need_uptodate))
 		goto unlock;
 
+	if (cleancache_restore_folio(folio,
+			cleancache_get_key(folio->mapping->host, &key))) {
+		folio_mark_uptodate(folio);
+		goto unlock;
+	}
 	error = -EAGAIN;
 	if (iocb->ki_flags & (IOCB_NOIO | IOCB_NOWAIT | IOCB_WAITQ))
 		goto unlock;
diff --git a/mm/truncate.c b/mm/truncate.c
index 5d98054094d1..6a981c2e57ca 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -20,6 +20,7 @@
 #include <linux/pagevec.h>
 #include <linux/task_io_accounting_ops.h>
 #include <linux/shmem_fs.h>
+#include <linux/cleancache.h>
 #include <linux/rmap.h>
 #include "internal.h"
 
@@ -190,6 +191,7 @@ int truncate_inode_folio(struct address_space *mapping, struct folio *folio)
  */
 bool truncate_inode_partial_folio(struct folio *folio, loff_t start, loff_t end)
 {
+	struct cleancache_filekey key;
 	loff_t pos = folio_pos(folio);
 	unsigned int offset, length;
 	struct page *split_at, *split_at2;
@@ -218,6 +220,8 @@ bool truncate_inode_partial_folio(struct folio *folio, loff_t start, loff_t end)
 	if (!mapping_inaccessible(folio->mapping))
 		folio_zero_range(folio, offset, length);
 
+	cleancache_invalidate_folio(folio->mapping, folio,
+			cleancache_get_key(folio->mapping->host, &key));
 	if (folio_needs_release(folio))
 		folio_invalidate(folio, offset, length);
 	if (!folio_test_large(folio))
@@ -337,6 +341,7 @@ long mapping_evict_folio(struct address_space *mapping, struct folio *folio)
 void truncate_inode_pages_range(struct address_space *mapping,
 				loff_t lstart, loff_t lend)
 {
+	struct cleancache_filekey key;
 	pgoff_t		start;		/* inclusive */
 	pgoff_t		end;		/* exclusive */
 	struct folio_batch fbatch;
@@ -347,7 +352,7 @@ void truncate_inode_pages_range(struct address_space *mapping,
 	bool		same_folio;
 
 	if (mapping_empty(mapping))
-		return;
+		goto out;
 
 	/*
 	 * 'start' and 'end' always covers the range of pages to be fully
@@ -435,6 +440,10 @@ void truncate_inode_pages_range(struct address_space *mapping,
 		truncate_folio_batch_exceptionals(mapping, &fbatch, indices);
 		folio_batch_release(&fbatch);
 	}
+
+out:
+	cleancache_invalidate_inode(mapping,
+				    cleancache_get_key(mapping->host, &key));
 }
 EXPORT_SYMBOL(truncate_inode_pages_range);
 
@@ -488,6 +497,10 @@ void truncate_inode_pages_final(struct address_space *mapping)
 		xa_unlock_irq(&mapping->i_pages);
 	}
 
+	/*
+	 * Cleancache needs notification even if there are no pages or shadow
+	 * entries.
+	 */
 	truncate_inode_pages(mapping, 0);
 }
 EXPORT_SYMBOL(truncate_inode_pages_final);
@@ -643,6 +656,7 @@ int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
 int invalidate_inode_pages2_range(struct address_space *mapping,
 				  pgoff_t start, pgoff_t end)
 {
+	struct cleancache_filekey key;
 	pgoff_t indices[PAGEVEC_SIZE];
 	struct folio_batch fbatch;
 	pgoff_t index;
@@ -652,7 +666,7 @@ int invalidate_inode_pages2_range(struct address_space *mapping,
 	int did_range_unmap = 0;
 
 	if (mapping_empty(mapping))
-		return 0;
+		goto out;
 
 	folio_batch_init(&fbatch);
 	index = start;
@@ -713,6 +727,9 @@ int invalidate_inode_pages2_range(struct address_space *mapping,
 	if (dax_mapping(mapping)) {
 		unmap_mapping_pages(mapping, start, end - start + 1, false);
 	}
+out:
+	cleancache_invalidate_inode(mapping,
+				    cleancache_get_key(mapping->host, &key));
 	return ret;
 }
 EXPORT_SYMBOL_GPL(invalidate_inode_pages2_range);
-- 
2.49.0.rc1.451.g8f38331e32-goog


