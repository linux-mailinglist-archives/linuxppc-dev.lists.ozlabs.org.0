Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA535964E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 23:49:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6lCc1kWgz3cfN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 07:49:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=virtuozzo.com (client-ip=130.117.225.111; helo=relay.virtuozzo.com; envelope-from=alexander.atanasov@virtuozzo.com; receiver=<UNKNOWN>)
X-Greylist: delayed 950 seconds by postgrey-1.36 at boromir; Tue, 16 Aug 2022 19:59:16 AEST
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6RSj00CHz2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 19:59:12 +1000 (AEST)
Received: from dev011.ch-qa.sw.ru ([172.29.1.16])
	by relay.virtuozzo.com with esmtp (Exim 4.95)
	(envelope-from <alexander.atanasov@virtuozzo.com>)
	id 1oNt3k-00FxfB-0V;
	Tue, 16 Aug 2022 11:41:39 +0200
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
Subject: [PATCH v2 1/4] Make place for common balloon code
Date: Tue, 16 Aug 2022 12:41:14 +0300
Message-Id: <20220816094117.3144881-2-alexander.atanasov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220816094117.3144881-1-alexander.atanasov@virtuozzo.com>
References: <20220816094117.3144881-1-alexander.atanasov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Aug 2022 07:48:41 +1000
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
mm/balloon_compaction.c -> mm/balloon_common.c

Signed-off-by: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
---
 MAINTAINERS                                              | 4 ++--
 arch/powerpc/platforms/pseries/cmm.c                     | 2 +-
 drivers/misc/vmw_balloon.c                               | 2 +-
 drivers/virtio/virtio_balloon.c                          | 2 +-
 include/linux/{balloon_compaction.h => balloon_common.h} | 2 +-
 mm/Makefile                                              | 2 +-
 mm/{balloon_compaction.c => balloon_common.c}            | 4 ++--
 mm/migrate.c                                             | 2 +-
 mm/vmscan.c                                              | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)
 rename include/linux/{balloon_compaction.h => balloon_common.h} (99%)
 rename mm/{balloon_compaction.c => balloon_common.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a5012ba6ff9..1b94bf3eb95d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21493,8 +21493,8 @@ L:	virtualization@lists.linux-foundation.org
 S:	Maintained
 F:	drivers/virtio/virtio_balloon.c
 F:	include/uapi/linux/virtio_balloon.h
-F:	include/linux/balloon_compaction.h
-F:	mm/balloon_compaction.c
+F:	include/linux/balloon_common.h
+F:	mm/balloon_common.c
 
 VIRTIO CRYPTO DRIVER
 M:	Gonglei <arei.gonglei@huawei.com>
diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 5f4037c1d7fe..3beb109c7e44 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -19,7 +19,7 @@
 #include <linux/stringify.h>
 #include <linux/swap.h>
 #include <linux/device.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon_common.h>
 #include <asm/firmware.h>
 #include <asm/hvcall.h>
 #include <asm/mmu.h>
diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 61a2be712bf7..6c6d24783548 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -29,7 +29,7 @@
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon_common.h>
 #include <linux/vmw_vmci_defs.h>
 #include <linux/vmw_vmci_api.h>
 #include <asm/hypervisor.h>
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 3f78a3a1eb75..6f69e483d98a 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -13,7 +13,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon_common.h>
 #include <linux/oom.h>
 #include <linux/wait.h>
 #include <linux/mm.h>
diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_common.h
similarity index 99%
rename from include/linux/balloon_compaction.h
rename to include/linux/balloon_common.h
index 5ca2d5699620..a45e9fd76235 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_common.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * include/linux/balloon_compaction.h
+ * include/linux/balloon_common.h
  *
  * Common interface definitions for making balloon pages movable by compaction.
  *
diff --git a/mm/Makefile b/mm/Makefile
index 9a564f836403..a3390f255b82 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -112,7 +112,7 @@ obj-$(CONFIG_ZSMALLOC)	+= zsmalloc.o
 obj-$(CONFIG_Z3FOLD)	+= z3fold.o
 obj-$(CONFIG_GENERIC_EARLY_IOREMAP) += early_ioremap.o
 obj-$(CONFIG_CMA)	+= cma.o
-obj-$(CONFIG_MEMORY_BALLOON) += balloon_compaction.o
+obj-$(CONFIG_MEMORY_BALLOON) += balloon_common.o
 obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
 obj-$(CONFIG_PAGE_TABLE_CHECK) += page_table_check.o
 obj-$(CONFIG_CMA_DEBUGFS) += cma_debug.o
diff --git a/mm/balloon_compaction.c b/mm/balloon_common.c
similarity index 99%
rename from mm/balloon_compaction.c
rename to mm/balloon_common.c
index 22c96fed70b5..54ed98653c78 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * mm/balloon_compaction.c
+ * mm/balloon_common.c
  *
  * Common interface for making balloon pages movable by compaction.
  *
@@ -9,7 +9,7 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/export.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon_common.h>
 
 static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
 				     struct page *page)
diff --git a/mm/migrate.c b/mm/migrate.c
index 6a1597c92261..a6df467a250a 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -41,7 +41,7 @@
 #include <linux/pfn_t.h>
 #include <linux/memremap.h>
 #include <linux/userfaultfd_k.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon_common.h>
 #include <linux/page_idle.h>
 #include <linux/page_owner.h>
 #include <linux/sched/mm.h>
diff --git a/mm/vmscan.c b/mm/vmscan.c
index b2b1431352dc..4732f8c24264 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -54,7 +54,7 @@
 #include <asm/div64.h>
 
 #include <linux/swapops.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon_common.h>
 #include <linux/sched/sysctl.h>
 
 #include "internal.h"
-- 
2.31.1

