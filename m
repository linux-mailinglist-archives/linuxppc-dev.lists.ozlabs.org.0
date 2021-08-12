Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4EE3EA5B0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 15:29:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlnbZ49KVz3clk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 23:29:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dfjVsu+E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dfjVsu+E; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlnZl5kxkz2yMq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 23:28:47 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17CD5FLU085678; Thu, 12 Aug 2021 09:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yEbpgxGUKdUJxSZyST6qKqhf4I1DK4m4TlsEVOTRXBE=;
 b=dfjVsu+Eq75AQ0+SgqvcTr/jmIzNamLQMPbl+PkMcc4+8K9wWbsY2N5xdgO4fMFQpYfh
 DA0tWrOLuDzthGH5wGhmbkuhF5cv1R6sPT0/DF7gwX4mn74NMdbCFPKavawv4uY8PZQq
 3LyU3jUk6NxkWXVv71NsHG6gCPzJEEEVztIkdY6TozA8mNgtUqW8iNFyhDjwgLPga8MJ
 9tzvIY8FcGZ0QpxaGAA83mrUSUpvbfMqgSKh2PNZxej8ma3+3mCqPs4Umz20aRC9QoXO
 KHNQyOF5L5MzShnIA17dZrlxF6XbeRCCim9FlKlky0rtmGtlRK1x6iTI6iUGsQ4UaEIM kA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3acy932xf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 09:28:42 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17CDP2N5013647;
 Thu, 12 Aug 2021 13:28:41 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3a9htgb5dq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 13:28:41 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17CDSeF418416172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Aug 2021 13:28:40 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E80E76A047;
 Thu, 12 Aug 2021 13:28:39 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BC296A051;
 Thu, 12 Aug 2021 13:28:38 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.50.186])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 12 Aug 2021 13:28:37 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 2/2] powerpc: rename powerpc_debugfs_root to
 arch_debugfs_dir
Date: Thu, 12 Aug 2021 18:58:31 +0530
Message-Id: <20210812132831.233794-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210812132831.233794-1-aneesh.kumar@linux.ibm.com>
References: <20210812132831.233794-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EEomobtPMDE9SCRiCGeZO-RX0mWujdco
X-Proofpoint-ORIG-GUID: EEomobtPMDE9SCRiCGeZO-RX0mWujdco
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-12_04:2021-08-12,
 2021-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120085
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No functional change in this patch. arch_debugfs_dir is the generic kernel
name declared in linux/debugfs.h for arch-specific debugfs directory.
Architectures like x86/s390 already use the name. Rename powerpc
specific powerpc_debugfs_root to arch_debugfs_dir.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/debugfs.h          | 13 -------------
 arch/powerpc/kernel/Makefile                |  3 ++-
 arch/powerpc/kernel/dawr.c                  |  3 +--
 arch/powerpc/kernel/eeh.c                   | 16 ++++++++--------
 arch/powerpc/kernel/eeh_cache.c             |  4 ++--
 arch/powerpc/kernel/fadump.c                |  4 ++--
 arch/powerpc/kernel/hw_breakpoint.c         |  1 -
 arch/powerpc/kernel/kdebugfs.c              | 14 ++++++++++++++
 arch/powerpc/kernel/security.c              | 16 ++++++++--------
 arch/powerpc/kernel/setup-common.c          | 13 -------------
 arch/powerpc/kernel/setup_64.c              |  1 -
 arch/powerpc/kernel/traps.c                 |  4 ++--
 arch/powerpc/kvm/book3s_xics.c              |  6 +++---
 arch/powerpc/kvm/book3s_xive.c              |  3 +--
 arch/powerpc/kvm/book3s_xive_native.c       |  3 +--
 arch/powerpc/mm/book3s64/hash_utils.c       |  4 ++--
 arch/powerpc/mm/book3s64/pgtable.c          |  4 ++--
 arch/powerpc/mm/book3s64/radix_tlb.c        |  6 +++---
 arch/powerpc/mm/ptdump/bats.c               |  4 ++--
 arch/powerpc/mm/ptdump/segment_regs.c       |  4 ++--
 arch/powerpc/platforms/cell/axon_msi.c      |  4 ++--
 arch/powerpc/platforms/powernv/memtrace.c   |  3 +--
 arch/powerpc/platforms/powernv/opal-imc.c   |  4 ++--
 arch/powerpc/platforms/powernv/opal-lpc.c   |  4 ++--
 arch/powerpc/platforms/powernv/opal-xscom.c |  4 ++--
 arch/powerpc/platforms/powernv/pci-ioda.c   |  4 ++--
 arch/powerpc/platforms/pseries/dtl.c        |  4 ++--
 arch/powerpc/platforms/pseries/lpar.c       |  5 +++--
 arch/powerpc/sysdev/xive/common.c           |  3 +--
 arch/powerpc/xmon/xmon.c                    |  6 +++---
 30 files changed, 75 insertions(+), 92 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/debugfs.h
 create mode 100644 arch/powerpc/kernel/kdebugfs.c

diff --git a/arch/powerpc/include/asm/debugfs.h b/arch/powerpc/include/asm/debugfs.h
deleted file mode 100644
index 2c5c48571d75..000000000000
--- a/arch/powerpc/include/asm/debugfs.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef _ASM_POWERPC_DEBUGFS_H
-#define _ASM_POWERPC_DEBUGFS_H
-
-/*
- * Copyright 2017, Michael Ellerman, IBM Corporation.
- */
-
-#include <linux/debugfs.h>
-
-extern struct dentry *powerpc_debugfs_root;
-
-#endif /* _ASM_POWERPC_DEBUGFS_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index f66b63e81c3b..7be36c1e1db6 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -46,7 +46,8 @@ obj-y				:= cputable.o syscalls.o \
 				   prom.o traps.o setup-common.o \
 				   udbg.o misc.o io.o misc_$(BITS).o \
 				   of_platform.o prom_parse.o firmware.o \
-				   hw_breakpoint_constraints.o interrupt.o
+				   hw_breakpoint_constraints.o interrupt.o \
+				   kdebugfs.o
 obj-y				+= ptrace/
 obj-$(CONFIG_PPC64)		+= setup_64.o \
 				   paca.o nvram_64.o note.o
diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
index cdc2dccb987d..64e423d2fe0f 100644
--- a/arch/powerpc/kernel/dawr.c
+++ b/arch/powerpc/kernel/dawr.c
@@ -9,7 +9,6 @@
 #include <linux/export.h>
 #include <linux/fs.h>
 #include <linux/debugfs.h>
-#include <asm/debugfs.h>
 #include <asm/machdep.h>
 #include <asm/hvcall.h>
 
@@ -101,7 +100,7 @@ static int __init dawr_force_setup(void)
 	if (PVR_VER(mfspr(SPRN_PVR)) == PVR_POWER9) {
 		/* Turn DAWR off by default, but allow admin to turn it on */
 		debugfs_create_file_unsafe("dawr_enable_dangerous", 0600,
-					   powerpc_debugfs_root,
+					   arch_debugfs_dir,
 					   &dawr_force_enable,
 					   &dawr_enable_fops);
 	}
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 3bbdcc86d01b..e9b597ed423c 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -21,9 +21,9 @@
 #include <linux/spinlock.h>
 #include <linux/export.h>
 #include <linux/of.h>
+#include <linux/debugfs.h>
 
 #include <linux/atomic.h>
-#include <asm/debugfs.h>
 #include <asm/eeh.h>
 #include <asm/eeh_event.h>
 #include <asm/io.h>
@@ -1901,24 +1901,24 @@ static int __init eeh_init_proc(void)
 		proc_create_single("powerpc/eeh", 0, NULL, proc_eeh_show);
 #ifdef CONFIG_DEBUG_FS
 		debugfs_create_file_unsafe("eeh_enable", 0600,
-					   powerpc_debugfs_root, NULL,
+					   arch_debugfs_dir, NULL,
 					   &eeh_enable_dbgfs_ops);
 		debugfs_create_u32("eeh_max_freezes", 0600,
-				powerpc_debugfs_root, &eeh_max_freezes);
+				arch_debugfs_dir, &eeh_max_freezes);
 		debugfs_create_bool("eeh_disable_recovery", 0600,
-				powerpc_debugfs_root,
+				arch_debugfs_dir,
 				&eeh_debugfs_no_recover);
 		debugfs_create_file_unsafe("eeh_dev_check", 0600,
-				powerpc_debugfs_root, NULL,
+				arch_debugfs_dir, NULL,
 				&eeh_dev_check_fops);
 		debugfs_create_file_unsafe("eeh_dev_break", 0600,
-				powerpc_debugfs_root, NULL,
+				arch_debugfs_dir, NULL,
 				&eeh_dev_break_fops);
 		debugfs_create_file_unsafe("eeh_force_recover", 0600,
-				powerpc_debugfs_root, NULL,
+				arch_debugfs_dir, NULL,
 				&eeh_force_recover_fops);
 		debugfs_create_file_unsafe("eeh_dev_can_recover", 0600,
-				powerpc_debugfs_root, NULL,
+				arch_debugfs_dir, NULL,
 				&eeh_dev_can_recover_fops);
 		eeh_cache_debugfs_init();
 #endif
diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_cache.c
index bf3270426d82..9bdaaf7fddc9 100644
--- a/arch/powerpc/kernel/eeh_cache.c
+++ b/arch/powerpc/kernel/eeh_cache.c
@@ -12,8 +12,8 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/atomic.h>
+#include <linux/debugfs.h>
 #include <asm/pci-bridge.h>
-#include <asm/debugfs.h>
 #include <asm/ppc-pci.h>
 
 
@@ -283,6 +283,6 @@ DEFINE_SHOW_ATTRIBUTE(eeh_addr_cache);
 void eeh_cache_debugfs_init(void)
 {
 	debugfs_create_file_unsafe("eeh_address_cache", 0400,
-			powerpc_debugfs_root, NULL,
+			arch_debugfs_dir, NULL,
 			&eeh_addr_cache_fops);
 }
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index b990075285f5..b7ceb041743c 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -24,8 +24,8 @@
 #include <linux/slab.h>
 #include <linux/cma.h>
 #include <linux/hugetlb.h>
+#include <linux/debugfs.h>
 
-#include <asm/debugfs.h>
 #include <asm/page.h>
 #include <asm/prom.h>
 #include <asm/fadump.h>
@@ -1557,7 +1557,7 @@ static void fadump_init_files(void)
 		return;
 	}
 
-	debugfs_create_file("fadump_region", 0444, powerpc_debugfs_root, NULL,
+	debugfs_create_file("fadump_region", 0444, arch_debugfs_dir, NULL,
 			    &fadump_region_fops);
 
 	if (fw_dump.dump_active) {
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 21a638aff72f..91a3be14808b 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -22,7 +22,6 @@
 #include <asm/processor.h>
 #include <asm/sstep.h>
 #include <asm/debug.h>
-#include <asm/debugfs.h>
 #include <asm/hvcall.h>
 #include <asm/inst.h>
 #include <linux/uaccess.h>
diff --git a/arch/powerpc/kernel/kdebugfs.c b/arch/powerpc/kernel/kdebugfs.c
new file mode 100644
index 000000000000..36d3124d5a8b
--- /dev/null
+++ b/arch/powerpc/kernel/kdebugfs.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/debugfs.h>
+#include <linux/export.h>
+#include <linux/init.h>
+
+struct dentry *arch_debugfs_dir;
+EXPORT_SYMBOL(arch_debugfs_dir);
+
+static int __init arch_kdebugfs_init(void)
+{
+	arch_debugfs_dir = debugfs_create_dir("powerpc", NULL);
+	return 0;
+}
+arch_initcall(arch_kdebugfs_init);
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index cc51fa52e783..1a998490fe60 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -11,10 +11,10 @@
 #include <linux/nospec.h>
 #include <linux/prctl.h>
 #include <linux/seq_buf.h>
+#include <linux/debugfs.h>
 
 #include <asm/asm-prototypes.h>
 #include <asm/code-patching.h>
-#include <asm/debugfs.h>
 #include <asm/security_features.h>
 #include <asm/setup.h>
 #include <asm/inst.h>
@@ -106,7 +106,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_barrier_nospec, barrier_nospec_get,
 static __init int barrier_nospec_debugfs_init(void)
 {
 	debugfs_create_file_unsafe("barrier_nospec", 0600,
-				   powerpc_debugfs_root, NULL,
+				   arch_debugfs_dir, NULL,
 				   &fops_barrier_nospec);
 	return 0;
 }
@@ -114,7 +114,7 @@ device_initcall(barrier_nospec_debugfs_init);
 
 static __init int security_feature_debugfs_init(void)
 {
-	debugfs_create_x64("security_features", 0400, powerpc_debugfs_root,
+	debugfs_create_x64("security_features", 0400, arch_debugfs_dir,
 			   &powerpc_security_features);
 	return 0;
 }
@@ -420,7 +420,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_stf_barrier, stf_barrier_get, stf_barrier_set,
 
 static __init int stf_barrier_debugfs_init(void)
 {
-	debugfs_create_file_unsafe("stf_barrier", 0600, powerpc_debugfs_root,
+	debugfs_create_file_unsafe("stf_barrier", 0600, arch_debugfs_dir,
 				   NULL, &fops_stf_barrier);
 	return 0;
 }
@@ -748,7 +748,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_count_cache_flush, count_cache_flush_get,
 static __init int count_cache_flush_debugfs_init(void)
 {
 	debugfs_create_file_unsafe("count_cache_flush", 0600,
-				   powerpc_debugfs_root, NULL,
+				   arch_debugfs_dir, NULL,
 				   &fops_count_cache_flush);
 	return 0;
 }
@@ -834,9 +834,9 @@ DEFINE_SIMPLE_ATTRIBUTE(fops_uaccess_flush, uaccess_flush_get, uaccess_flush_set
 
 static __init int rfi_flush_debugfs_init(void)
 {
-	debugfs_create_file("rfi_flush", 0600, powerpc_debugfs_root, NULL, &fops_rfi_flush);
-	debugfs_create_file("entry_flush", 0600, powerpc_debugfs_root, NULL, &fops_entry_flush);
-	debugfs_create_file("uaccess_flush", 0600, powerpc_debugfs_root, NULL, &fops_uaccess_flush);
+	debugfs_create_file("rfi_flush", 0600, arch_debugfs_dir, NULL, &fops_rfi_flush);
+	debugfs_create_file("entry_flush", 0600, arch_debugfs_dir, NULL, &fops_entry_flush);
+	debugfs_create_file("uaccess_flush", 0600, arch_debugfs_dir, NULL, &fops_uaccess_flush);
 	return 0;
 }
 device_initcall(rfi_flush_debugfs_init);
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index aa9c2d01424a..b1e43b69a559 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -33,7 +33,6 @@
 #include <linux/of_platform.h>
 #include <linux/hugetlb.h>
 #include <linux/pgtable.h>
-#include <asm/debugfs.h>
 #include <asm/io.h>
 #include <asm/paca.h>
 #include <asm/prom.h>
@@ -773,18 +772,6 @@ static int __init check_cache_coherency(void)
 late_initcall(check_cache_coherency);
 #endif /* CONFIG_CHECK_CACHE_COHERENCY */
 
-#ifdef CONFIG_DEBUG_FS
-struct dentry *powerpc_debugfs_root;
-EXPORT_SYMBOL(powerpc_debugfs_root);
-
-static int powerpc_debugfs_init(void)
-{
-	powerpc_debugfs_root = debugfs_create_dir("powerpc", NULL);
-	return 0;
-}
-arch_initcall(powerpc_debugfs_init);
-#endif
-
 void ppc_printk_progress(char *s, unsigned short hex)
 {
 	pr_info("%s\n", s);
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 1ff258f6c76c..eaa79a0996d1 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -32,7 +32,6 @@
 #include <linux/nmi.h>
 #include <linux/pgtable.h>
 
-#include <asm/debugfs.h>
 #include <asm/kvm_guest.h>
 #include <asm/io.h>
 #include <asm/kdump.h>
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index dfbce527c98e..c8f648727d36 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -37,10 +37,10 @@
 #include <linux/smp.h>
 #include <linux/console.h>
 #include <linux/kmsg_dump.h>
+#include <linux/debugfs.h>
 
 #include <asm/emulated_ops.h>
 #include <linux/uaccess.h>
-#include <asm/debugfs.h>
 #include <asm/interrupt.h>
 #include <asm/io.h>
 #include <asm/machdep.h>
@@ -2267,7 +2267,7 @@ static int __init ppc_warn_emulated_init(void)
 	struct ppc_emulated_entry *entries = (void *)&ppc_emulated;
 
 	dir = debugfs_create_dir("emulated_instructions",
-				 powerpc_debugfs_root);
+				 arch_debugfs_dir);
 
 	debugfs_create_u32("do_warn", 0644, dir, &ppc_warn_emulated);
 
diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index 303e3cb096db..ebd5d920de8c 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -10,13 +10,13 @@
 #include <linux/gfp.h>
 #include <linux/anon_inodes.h>
 #include <linux/spinlock.h>
-
+#include <linux/debugfs.h>
 #include <linux/uaccess.h>
+
 #include <asm/kvm_book3s.h>
 #include <asm/kvm_ppc.h>
 #include <asm/hvcall.h>
 #include <asm/xics.h>
-#include <asm/debugfs.h>
 #include <asm/time.h>
 
 #include <linux/seq_file.h>
@@ -1024,7 +1024,7 @@ static void xics_debugfs_init(struct kvmppc_xics *xics)
 		return;
 	}
 
-	xics->dentry = debugfs_create_file(name, 0444, powerpc_debugfs_root,
+	xics->dentry = debugfs_create_file(name, 0444, arch_debugfs_dir,
 					   xics, &xics_debug_fops);
 
 	pr_debug("%s: created %s\n", __func__, name);
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 8cfab3547494..19adbb1dda04 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -22,7 +22,6 @@
 #include <asm/xive.h>
 #include <asm/xive-regs.h>
 #include <asm/debug.h>
-#include <asm/debugfs.h>
 #include <asm/time.h>
 #include <asm/opal.h>
 
@@ -2329,7 +2328,7 @@ static void xive_debugfs_init(struct kvmppc_xive *xive)
 		return;
 	}
 
-	xive->dentry = debugfs_create_file(name, S_IRUGO, powerpc_debugfs_root,
+	xive->dentry = debugfs_create_file(name, S_IRUGO, arch_debugfs_dir,
 					   xive, &xive_debug_fops);
 
 	pr_debug("%s: created %s\n", __func__, name);
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 573ecaab3597..4ce800c7454f 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -20,7 +20,6 @@
 #include <asm/xive.h>
 #include <asm/xive-regs.h>
 #include <asm/debug.h>
-#include <asm/debugfs.h>
 #include <asm/opal.h>
 
 #include <linux/debugfs.h>
@@ -1257,7 +1256,7 @@ static void xive_native_debugfs_init(struct kvmppc_xive *xive)
 		return;
 	}
 
-	xive->dentry = debugfs_create_file(name, 0444, powerpc_debugfs_root,
+	xive->dentry = debugfs_create_file(name, 0444, arch_debugfs_dir,
 					   xive, &xive_native_debug_fops);
 
 	pr_debug("%s: created %s\n", __func__, name);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index ac5720371c0d..c145776d3ae5 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -36,8 +36,8 @@
 #include <linux/hugetlb.h>
 #include <linux/cpu.h>
 #include <linux/pgtable.h>
+#include <linux/debugfs.h>
 
-#include <asm/debugfs.h>
 #include <asm/interrupt.h>
 #include <asm/processor.h>
 #include <asm/mmu.h>
@@ -2072,7 +2072,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_hpt_order, hpt_order_get, hpt_order_set, "%llu\n")
 
 static int __init hash64_debugfs(void)
 {
-	debugfs_create_file("hpt_order", 0600, powerpc_debugfs_root, NULL,
+	debugfs_create_file("hpt_order", 0600, arch_debugfs_dir, NULL,
 			    &fops_hpt_order);
 	return 0;
 }
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 9ffa65074cb0..7011a8f16d7a 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -6,9 +6,9 @@
 #include <linux/sched.h>
 #include <linux/mm_types.h>
 #include <linux/memblock.h>
+#include <linux/debugfs.h>
 #include <misc/cxl-base.h>
 
-#include <asm/debugfs.h>
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 #include <asm/trace.h>
@@ -520,7 +520,7 @@ static int __init pgtable_debugfs_setup(void)
 	 * invalidated as expected.
 	 */
 	debugfs_create_bool("tlbie_enabled", 0600,
-			powerpc_debugfs_root,
+			arch_debugfs_dir,
 			&tlbie_enabled);
 
 	return 0;
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 1fa2bc6a969e..7724af19ed7e 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -10,6 +10,7 @@
 #include <linux/memblock.h>
 #include <linux/mmu_context.h>
 #include <linux/sched/mm.h>
+#include <linux/debugfs.h>
 
 #include <asm/ppc-opcode.h>
 #include <asm/tlb.h>
@@ -17,7 +18,6 @@
 #include <asm/trace.h>
 #include <asm/cputhreads.h>
 #include <asm/plpar_wrappers.h>
-#include <asm/debugfs.h>
 
 #include "internal.h"
 
@@ -1529,9 +1529,9 @@ EXPORT_SYMBOL_GPL(do_h_rpt_invalidate_prt);
 static int __init create_tlb_single_page_flush_ceiling(void)
 {
 	debugfs_create_u32("tlb_single_page_flush_ceiling", 0600,
-			   powerpc_debugfs_root, &tlb_single_page_flush_ceiling);
+			   arch_debugfs_dir, &tlb_single_page_flush_ceiling);
 	debugfs_create_u32("tlb_local_single_page_flush_ceiling", 0600,
-			   powerpc_debugfs_root, &tlb_local_single_page_flush_ceiling);
+			   arch_debugfs_dir, &tlb_local_single_page_flush_ceiling);
 	return 0;
 }
 late_initcall(create_tlb_single_page_flush_ceiling);
diff --git a/arch/powerpc/mm/ptdump/bats.c b/arch/powerpc/mm/ptdump/bats.c
index c4c628b03cf8..8bf7383fb26c 100644
--- a/arch/powerpc/mm/ptdump/bats.c
+++ b/arch/powerpc/mm/ptdump/bats.c
@@ -7,7 +7,7 @@
  */
 
 #include <linux/pgtable.h>
-#include <asm/debugfs.h>
+#include <linux/debugfs.h>
 #include <asm/cpu_has_feature.h>
 
 #include "ptdump.h"
@@ -103,7 +103,7 @@ static const struct file_operations bats_fops = {
 static int __init bats_init(void)
 {
 	debugfs_create_file("block_address_translation", 0400,
-			    powerpc_debugfs_root, NULL, &bats_fops);
+			    arch_debugfs_dir, NULL, &bats_fops);
 	return 0;
 }
 device_initcall(bats_init);
diff --git a/arch/powerpc/mm/ptdump/segment_regs.c b/arch/powerpc/mm/ptdump/segment_regs.c
index 565048a0c9be..9223dfb85c51 100644
--- a/arch/powerpc/mm/ptdump/segment_regs.c
+++ b/arch/powerpc/mm/ptdump/segment_regs.c
@@ -6,7 +6,7 @@
  * This dumps the content of Segment Registers
  */
 
-#include <asm/debugfs.h>
+#include <linux/debugfs.h>
 
 static void seg_show(struct seq_file *m, int i)
 {
@@ -55,7 +55,7 @@ static const struct file_operations sr_fops = {
 
 static int __init sr_init(void)
 {
-	debugfs_create_file("segment_registers", 0400, powerpc_debugfs_root,
+	debugfs_create_file("segment_registers", 0400, arch_debugfs_dir,
 			    NULL, &sr_fops);
 	return 0;
 }
diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platforms/cell/axon_msi.c
index ca2555b8a0c2..82335e364c44 100644
--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -12,8 +12,8 @@
 #include <linux/export.h>
 #include <linux/of_platform.h>
 #include <linux/slab.h>
+#include <linux/debugfs.h>
 
-#include <asm/debugfs.h>
 #include <asm/dcr.h>
 #include <asm/machdep.h>
 #include <asm/prom.h>
@@ -480,6 +480,6 @@ void axon_msi_debug_setup(struct device_node *dn, struct axon_msic *msic)
 
 	snprintf(name, sizeof(name), "msic_%d", of_node_to_nid(dn));
 
-	debugfs_create_file(name, 0600, powerpc_debugfs_root, msic, &fops_msic);
+	debugfs_create_file(name, 0600, arch_debugfs_dir, msic, &fops_msic);
 }
 #endif /* DEBUG */
diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 537a4daed614..877720c64515 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -18,7 +18,6 @@
 #include <linux/memory_hotplug.h>
 #include <linux/numa.h>
 #include <asm/machdep.h>
-#include <asm/debugfs.h>
 #include <asm/cacheflush.h>
 
 /* This enables us to keep track of the memory removed from each node. */
@@ -330,7 +329,7 @@ DEFINE_SIMPLE_ATTRIBUTE(memtrace_init_fops, memtrace_enable_get,
 static int memtrace_init(void)
 {
 	memtrace_debugfs_dir = debugfs_create_dir("memtrace",
-						  powerpc_debugfs_root);
+						  arch_debugfs_dir);
 
 	debugfs_create_file("enable", 0600, memtrace_debugfs_dir,
 			    NULL, &memtrace_init_fops);
diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
index 7824cc364bc4..63e4738baf33 100644
--- a/arch/powerpc/platforms/powernv/opal-imc.c
+++ b/arch/powerpc/platforms/powernv/opal-imc.c
@@ -13,11 +13,11 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/crash_dump.h>
+#include <linux/debugfs.h>
 #include <asm/opal.h>
 #include <asm/io.h>
 #include <asm/imc-pmu.h>
 #include <asm/cputhreads.h>
-#include <asm/debugfs.h>
 
 static struct dentry *imc_debugfs_parent;
 
@@ -56,7 +56,7 @@ static void export_imc_mode_and_cmd(struct device_node *node,
 	u32 cb_offset;
 	struct imc_mem_info *ptr = pmu_ptr->mem_info;
 
-	imc_debugfs_parent = debugfs_create_dir("imc", powerpc_debugfs_root);
+	imc_debugfs_parent = debugfs_create_dir("imc", arch_debugfs_dir);
 
 	if (of_property_read_u32(node, "cb_offset", &cb_offset))
 		cb_offset = IMC_CNTL_BLK_OFFSET;
diff --git a/arch/powerpc/platforms/powernv/opal-lpc.c b/arch/powerpc/platforms/powernv/opal-lpc.c
index 608569082ba0..1e5d51db40f8 100644
--- a/arch/powerpc/platforms/powernv/opal-lpc.c
+++ b/arch/powerpc/platforms/powernv/opal-lpc.c
@@ -10,13 +10,13 @@
 #include <linux/bug.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/debugfs.h>
 
 #include <asm/machdep.h>
 #include <asm/firmware.h>
 #include <asm/opal.h>
 #include <asm/prom.h>
 #include <linux/uaccess.h>
-#include <asm/debugfs.h>
 #include <asm/isa-bridge.h>
 
 static int opal_lpc_chip_id = -1;
@@ -371,7 +371,7 @@ static int opal_lpc_init_debugfs(void)
 	if (opal_lpc_chip_id < 0)
 		return -ENODEV;
 
-	root = debugfs_create_dir("lpc", powerpc_debugfs_root);
+	root = debugfs_create_dir("lpc", arch_debugfs_dir);
 
 	rc |= opal_lpc_debugfs_create_type(root, "io", OPAL_LPC_IO);
 	rc |= opal_lpc_debugfs_create_type(root, "mem", OPAL_LPC_MEM);
diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
index fd510d961b8c..6b4eed2ef4fa 100644
--- a/arch/powerpc/platforms/powernv/opal-xscom.c
+++ b/arch/powerpc/platforms/powernv/opal-xscom.c
@@ -14,11 +14,11 @@
 #include <linux/gfp.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/debugfs.h>
 
 #include <asm/machdep.h>
 #include <asm/firmware.h>
 #include <asm/opal.h>
-#include <asm/debugfs.h>
 #include <asm/prom.h>
 
 static u64 opal_scom_unmangle(u64 addr)
@@ -189,7 +189,7 @@ static int scom_debug_init(void)
 	if (!firmware_has_feature(FW_FEATURE_OPAL))
 		return 0;
 
-	root = debugfs_create_dir("scom", powerpc_debugfs_root);
+	root = debugfs_create_dir("scom", arch_debugfs_dir);
 	if (!root)
 		return -1;
 
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 7de464679292..eb4897f499ab 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -20,6 +20,7 @@
 #include <linux/iommu.h>
 #include <linux/rculist.h>
 #include <linux/sizes.h>
+#include <linux/debugfs.h>
 
 #include <asm/sections.h>
 #include <asm/io.h>
@@ -32,7 +33,6 @@
 #include <asm/iommu.h>
 #include <asm/tce.h>
 #include <asm/xics.h>
-#include <asm/debugfs.h>
 #include <asm/firmware.h>
 #include <asm/pnv-pci.h>
 #include <asm/mmzone.h>
@@ -2259,7 +2259,7 @@ static void pnv_pci_ioda_create_dbgfs(void)
 		phb = hose->private_data;
 
 		sprintf(name, "PCI%04x", hose->global_number);
-		phb->dbgfs = debugfs_create_dir(name, powerpc_debugfs_root);
+		phb->dbgfs = debugfs_create_dir(name, arch_debugfs_dir);
 
 		debugfs_create_file_unsafe("dump_diag_regs", 0200, phb->dbgfs,
 					   phb, &pnv_pci_diag_data_fops);
diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index 982f069e4c31..352af5b14a0f 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -11,10 +11,10 @@
 #include <linux/spinlock.h>
 #include <asm/smp.h>
 #include <linux/uaccess.h>
+#include <linux/debugfs.h>
 #include <asm/firmware.h>
 #include <asm/dtl.h>
 #include <asm/lppaca.h>
-#include <asm/debugfs.h>
 #include <asm/plpar_wrappers.h>
 #include <asm/machdep.h>
 
@@ -338,7 +338,7 @@ static int dtl_init(void)
 
 	/* set up common debugfs structure */
 
-	dtl_dir = debugfs_create_dir("dtl", powerpc_debugfs_root);
+	dtl_dir = debugfs_create_dir("dtl", arch_debugfs_dir);
 
 	debugfs_create_x8("dtl_event_mask", 0600, dtl_dir, &dtl_event_mask);
 	debugfs_create_u32("dtl_buf_entries", 0400, dtl_dir, &dtl_buf_entries);
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index dab356e3ff87..2c1d66b5fde3 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -22,6 +22,8 @@
 #include <linux/workqueue.h>
 #include <linux/proc_fs.h>
 #include <linux/pgtable.h>
+#include <linux/debugfs.h>
+
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
@@ -39,7 +41,6 @@
 #include <asm/kexec.h>
 #include <asm/fadump.h>
 #include <asm/asm-prototypes.h>
-#include <asm/debugfs.h>
 #include <asm/dtl.h>
 
 #include "pseries.h"
@@ -2016,7 +2017,7 @@ static int __init vpa_debugfs_init(void)
 	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
 		return 0;
 
-	vpa_dir = debugfs_create_dir("vpa", powerpc_debugfs_root);
+	vpa_dir = debugfs_create_dir("vpa", arch_debugfs_dir);
 
 	/* set up the per-cpu vpa file*/
 	for_each_possible_cpu(i) {
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index dbdbbc2f1dc5..f85915ca0f98 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -21,7 +21,6 @@
 #include <linux/msi.h>
 #include <linux/vmalloc.h>
 
-#include <asm/debugfs.h>
 #include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/smp.h>
@@ -1716,7 +1715,7 @@ DEFINE_SHOW_ATTRIBUTE(xive_core_debug);
 int xive_core_debug_init(void)
 {
 	if (xive_enabled())
-		debugfs_create_file("xive", 0400, powerpc_debugfs_root,
+		debugfs_create_file("xive", 0400, arch_debugfs_dir,
 				    NULL, &xive_core_debug_fops);
 	return 0;
 }
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index da4d7f225a40..ead460b80905 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -26,8 +26,8 @@
 #include <linux/ctype.h>
 #include <linux/highmem.h>
 #include <linux/security.h>
+#include <linux/debugfs.h>
 
-#include <asm/debugfs.h>
 #include <asm/ptrace.h>
 #include <asm/smp.h>
 #include <asm/string.h>
@@ -4077,8 +4077,8 @@ DEFINE_SIMPLE_ATTRIBUTE(xmon_dbgfs_ops, xmon_dbgfs_get,
 
 static int __init setup_xmon_dbgfs(void)
 {
-	debugfs_create_file("xmon", 0600, powerpc_debugfs_root, NULL,
-				&xmon_dbgfs_ops);
+	debugfs_create_file("xmon", 0600, arch_debugfs_dir, NULL,
+			    &xmon_dbgfs_ops);
 	return 0;
 }
 device_initcall(setup_xmon_dbgfs);
-- 
2.31.1

