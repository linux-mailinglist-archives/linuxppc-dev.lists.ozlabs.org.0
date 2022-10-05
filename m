Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A85F51AC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 11:21:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mj8FT4scPz3drf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 20:21:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=virtuozzo.com (client-ip=130.117.225.111; helo=relay.virtuozzo.com; envelope-from=alexander.atanasov@virtuozzo.com; receiver=<UNKNOWN>)
X-Greylist: delayed 953 seconds by postgrey-1.36 at boromir; Wed, 05 Oct 2022 20:20:31 AEDT
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mj8Dv2zSGz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 20:20:28 +1100 (AEDT)
Received: from dev011.ch-qa.sw.ru ([172.29.1.16])
	by relay.virtuozzo.com with esmtp (Exim 4.95)
	(envelope-from <alexander.atanasov@virtuozzo.com>)
	id 1og0GJ-007ckN-PT;
	Wed, 05 Oct 2022 11:02:44 +0200
From: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nadav Amit <namit@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 1/7] Make place for common balloon code
Date: Wed,  5 Oct 2022 12:01:51 +0300
Message-Id: <20221005090158.2801592-2-alexander.atanasov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221005090158.2801592-1-alexander.atanasov@virtuozzo.com>
References: <20221005090158.2801592-1-alexander.atanasov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Alexander Atanasov <alexander.atanasov@virtuozzo.com>, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, linux-mm@kvack.org, kernel@openvz.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

File already contains code that is common along balloon
drivers so rename it to reflect its contents.
mm/balloon_compaction.c -> mm/balloon.c
include/linux/balloon_compaction.h -> include/linux/balloon.h
Remove it from files which do not actually use it.
Drop externs from function delcarations.

Signed-off-by: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
Acked-by: Nadav Amit <namit@vmware.com>
---
 MAINTAINERS                                       |  4 ++--
 arch/powerpc/platforms/pseries/cmm.c              |  2 +-
 drivers/misc/vmw_balloon.c                        |  2 +-
 drivers/virtio/virtio_balloon.c                   |  2 +-
 include/linux/{balloon_compaction.h => balloon.h} | 12 +++++-------
 mm/Makefile                                       |  2 +-
 mm/{balloon_compaction.c => balloon.c}            |  4 +---
 mm/migrate.c                                      |  1 -
 mm/vmscan.c                                       |  1 -
 9 files changed, 12 insertions(+), 18 deletions(-)
 rename include/linux/{balloon_compaction.h => balloon.h} (93%)
 rename mm/{balloon_compaction.c => balloon.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8656ab794786..745eb0ada366 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21572,8 +21572,8 @@ L:	virtualization@lists.linux-foundation.org
 S:	Maintained
 F:	drivers/virtio/virtio_balloon.c
 F:	include/uapi/linux/virtio_balloon.h
-F:	include/linux/balloon_compaction.h
-F:	mm/balloon_compaction.c
+F:	include/linux/balloon.h
+F:	mm/balloon.c
 
 VIRTIO CRYPTO DRIVER
 M:	Gonglei <arei.gonglei@huawei.com>
diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 5f4037c1d7fe..1d40f6416d6a 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -19,7 +19,7 @@
 #include <linux/stringify.h>
 #include <linux/swap.h>
 #include <linux/device.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon.h>
 #include <asm/firmware.h>
 #include <asm/hvcall.h>
 #include <asm/mmu.h>
diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 61a2be712bf7..91d4d2a285c5 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -29,7 +29,7 @@
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon.h>
 #include <linux/vmw_vmci_defs.h>
 #include <linux/vmw_vmci_api.h>
 #include <asm/hypervisor.h>
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 3f78a3a1eb75..d0c27c680721 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -13,7 +13,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon.h>
 #include <linux/oom.h>
 #include <linux/wait.h>
 #include <linux/mm.h>
diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon.h
similarity index 93%
rename from include/linux/balloon_compaction.h
rename to include/linux/balloon.h
index 5ca2d5699620..46ac8f61f607 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * include/linux/balloon_compaction.h
- *
  * Common interface definitions for making balloon pages movable by compaction.
  *
  * Balloon page migration makes use of the general non-lru movable page
@@ -59,13 +57,13 @@ struct balloon_dev_info {
 			struct page *page, enum migrate_mode mode);
 };
 
-extern struct page *balloon_page_alloc(void);
-extern void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
+struct page *balloon_page_alloc(void);
+void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
 				 struct page *page);
-extern struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info);
-extern size_t balloon_page_list_enqueue(struct balloon_dev_info *b_dev_info,
+struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info);
+size_t balloon_page_list_enqueue(struct balloon_dev_info *b_dev_info,
 				      struct list_head *pages);
-extern size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
+size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 				     struct list_head *pages, size_t n_req_pages);
 
 static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
diff --git a/mm/Makefile b/mm/Makefile
index 9a564f836403..550cb0663f50 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -112,7 +112,7 @@ obj-$(CONFIG_ZSMALLOC)	+= zsmalloc.o
 obj-$(CONFIG_Z3FOLD)	+= z3fold.o
 obj-$(CONFIG_GENERIC_EARLY_IOREMAP) += early_ioremap.o
 obj-$(CONFIG_CMA)	+= cma.o
-obj-$(CONFIG_MEMORY_BALLOON) += balloon_compaction.o
+obj-$(CONFIG_MEMORY_BALLOON) += balloon.o
 obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
 obj-$(CONFIG_PAGE_TABLE_CHECK) += page_table_check.o
 obj-$(CONFIG_CMA_DEBUGFS) += cma_debug.o
diff --git a/mm/balloon_compaction.c b/mm/balloon.c
similarity index 99%
rename from mm/balloon_compaction.c
rename to mm/balloon.c
index 22c96fed70b5..22b3e876bc78 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon.c
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * mm/balloon_compaction.c
- *
  * Common interface for making balloon pages movable by compaction.
  *
  * Copyright (C) 2012, Red Hat, Inc.  Rafael Aquini <aquini@redhat.com>
@@ -9,7 +7,7 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/export.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon.h>
 
 static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
 				     struct page *page)
diff --git a/mm/migrate.c b/mm/migrate.c
index 6a1597c92261..a4c8bb334dde 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -41,7 +41,6 @@
 #include <linux/pfn_t.h>
 #include <linux/memremap.h>
 #include <linux/userfaultfd_k.h>
-#include <linux/balloon_compaction.h>
 #include <linux/page_idle.h>
 #include <linux/page_owner.h>
 #include <linux/sched/mm.h>
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 382dbe97329f..0274e2cb8430 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -54,7 +54,6 @@
 #include <asm/div64.h>
 
 #include <linux/swapops.h>
-#include <linux/balloon_compaction.h>
 #include <linux/sched/sysctl.h>
 
 #include "internal.h"
-- 
2.31.1

