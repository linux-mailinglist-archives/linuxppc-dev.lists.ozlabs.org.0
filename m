Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 414A12F4880
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 11:22:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG3Ql4BL4zDrdj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 21:22:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DG3Nn38PYzDrBm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 21:20:21 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 8793CAE80020;
 Wed, 13 Jan 2021 05:20:17 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/iommu/debug: Add debugfs entries for IOMMU
 tables
Date: Wed, 13 Jan 2021 21:20:14 +1100
Message-Id: <20210113102014.124452-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds a folder per LIOBN under /sys/kernel/debug/iommu with IOMMU
table parameters.

This is enabled by CONFIG_IOMMU_DEBUGFS.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

The first use is to find leaks:

while [ true ] ; do echo $( date ; sudo find /sys/kernel/debug/iommu -iname weight
-exec cat {} \; ) ; sleep 1 ; done

None found yet though.


---
 arch/powerpc/kernel/iommu.c | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 5b69a6a72a0e..c00214a4355c 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -25,6 +25,7 @@
 #include <linux/pci.h>
 #include <linux/iommu.h>
 #include <linux/sched.h>
+#include <linux/debugfs.h>
 #include <asm/io.h>
 #include <asm/prom.h>
 #include <asm/iommu.h>
@@ -38,6 +39,47 @@
 
 #define DBG(...)
 
+#ifdef CONFIG_IOMMU_DEBUGFS
+static int iommu_debugfs_weight_get(void *data, u64 *val)
+{
+	struct iommu_table *tbl = data;
+	*val = bitmap_weight(tbl->it_map, tbl->it_size);
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(iommu_debugfs_fops_weight, iommu_debugfs_weight_get, NULL, "%llu\n");
+
+static void iommu_debugfs_add(struct iommu_table *tbl)
+{
+	char name[10];
+	struct dentry *liobn_entry;
+
+	sprintf(name, "%08lx", tbl->it_index);
+	liobn_entry = debugfs_create_dir(name, iommu_debugfs_dir);
+
+	debugfs_create_file_unsafe("weight", 0400, liobn_entry, tbl, &iommu_debugfs_fops_weight);
+	debugfs_create_ulong("it_size", 0400, liobn_entry, &tbl->it_size);
+	debugfs_create_ulong("it_page_shift", 0400, liobn_entry, &tbl->it_page_shift);
+	debugfs_create_ulong("it_reserved_start", 0400, liobn_entry, &tbl->it_reserved_start);
+	debugfs_create_ulong("it_reserved_end", 0400, liobn_entry, &tbl->it_reserved_end);
+	debugfs_create_ulong("it_indirect_levels", 0400, liobn_entry, &tbl->it_indirect_levels);
+	debugfs_create_ulong("it_level_size", 0400, liobn_entry, &tbl->it_level_size);
+}
+
+static void iommu_debugfs_del(struct iommu_table *tbl)
+{
+	char name[10];
+	struct dentry *liobn_entry;
+
+	sprintf(name, "%08lx", tbl->it_index);
+	liobn_entry = debugfs_lookup(name, iommu_debugfs_dir);
+	if (liobn_entry)
+		debugfs_remove(liobn_entry);
+}
+#else
+static void iommu_debugfs_add(struct iommu_table *tbl){}
+static void iommu_debugfs_del(struct iommu_table *tbl){}
+#endif
+
 static int novmerge;
 
 static void __iommu_free(struct iommu_table *, dma_addr_t, unsigned int);
@@ -725,6 +767,8 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 		welcomed = 1;
 	}
 
+	iommu_debugfs_add(tbl);
+
 	return tbl;
 }
 
@@ -744,6 +788,8 @@ static void iommu_table_free(struct kref *kref)
 		return;
 	}
 
+	iommu_debugfs_del(tbl);
+
 	iommu_table_release_pages(tbl);
 
 	/* verify that table contains no entries */
-- 
2.17.1

