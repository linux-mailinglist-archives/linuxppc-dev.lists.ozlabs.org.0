Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 960BE184CC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 07:17:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4501nQ13nNzDqVh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 15:17:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4501fV0dT9zDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 15:11:45 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x494vLha042697
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 May 2019 01:11:43 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sc9uf8huy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 01:11:41 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Thu, 9 May 2019 06:11:39 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 May 2019 06:11:38 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x495BbTW59441370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 May 2019 05:11:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC00552059
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 05:11:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 63FA45206B
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 05:11:36 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4C992A03C6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 15:11:32 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/5] powerpc/powernv: Get rid of old scom_controller
 abstraction
Date: Thu,  9 May 2019 15:11:17 +1000
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509051119.7694-1-ajd@linux.ibm.com>
References: <20190509051119.7694-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050905-0028-0000-0000-0000036BCB72
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050905-0029-0000-0000-0000242B4AF0
Message-Id: <20190509051119.7694-3-ajd@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090032
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Once upon a time, the SCOM access code was used by the WSP platform as well
as powernv. Thus it made sense to have a generic SCOM access interface to
abstract between different platforms.

Now that it's just powernv, with no other platforms currently on the
horizon, let's rip out scom_controller and make everything much simpler and
more direct.

While we're here, fix up the comment block at the top and add a SPDX
header.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v1->v2:
- new patch
---
 arch/powerpc/platforms/powernv/Makefile     |   2 +-
 arch/powerpc/platforms/powernv/opal-xscom.c | 215 +++++++++++++-------
 arch/powerpc/platforms/powernv/scom.c       | 170 ----------------
 arch/powerpc/platforms/powernv/scom.h       | 133 ------------
 4 files changed, 143 insertions(+), 377 deletions(-)
 delete mode 100644 arch/powerpc/platforms/powernv/scom.c
 delete mode 100644 arch/powerpc/platforms/powernv/scom.h

diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index 4b1644150135..69a3aefa905b 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -4,7 +4,6 @@ obj-y			+= idle.o opal-rtc.o opal-nvram.o opal-lpc.o opal-flash.o
 obj-y			+= rng.o opal-elog.o opal-dump.o opal-sysparam.o opal-sensor.o
 obj-y			+= opal-msglog.o opal-hmi.o opal-power.o opal-irqchip.o
 obj-y			+= opal-kmsg.o opal-powercap.o opal-psr.o opal-sensor-groups.o
-obj-y			+= opal-xscom.o scom.o
 
 obj-$(CONFIG_SMP)	+= smp.o subcore.o subcore-asm.o
 obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
@@ -16,3 +15,4 @@ obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
 obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
 obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o
 obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
+obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
index 66337d92cb63..e16b0e346d7e 100644
--- a/arch/powerpc/platforms/powernv/opal-xscom.c
+++ b/arch/powerpc/platforms/powernv/opal-xscom.c
@@ -1,6 +1,10 @@
+// SPDX-License-Identifier:  GPL-2.0+
 /*
- * PowerNV LPC bus handling.
+ * PowerNV SCOM bus debugfs interface
  *
+ * Copyright 2010 Benjamin Herrenschmidt, IBM Corp
+ *                <benh@kernel.crashing.org>
+ *     and        David Gibson, IBM Corporation.
  * Copyright 2013 IBM Corp.
  *
  * This program is free software; you can redistribute it and/or
@@ -14,63 +18,13 @@
 #include <linux/bug.h>
 #include <linux/gfp.h>
 #include <linux/slab.h>
+#include <linux/uaccess.h>
 
 #include <asm/machdep.h>
 #include <asm/firmware.h>
 #include <asm/opal.h>
-
-#include "scom.h"
-
-/*
- * We could probably fit that inside the scom_map_t
- * which is a void* after all but it's really too ugly
- * so let's kmalloc it for now
- */
-struct opal_scom_map {
-	uint32_t chip;
-	uint64_t addr;
-};
-
-static scom_map_t opal_scom_map(struct device_node *dev, u64 reg, u64 count)
-{
-	struct opal_scom_map *m;
-	const __be32 *gcid;
-
-	if (!of_get_property(dev, "scom-controller", NULL)) {
-		pr_err("%s: device %pOF is not a SCOM controller\n",
-			__func__, dev);
-		return SCOM_MAP_INVALID;
-	}
-	gcid = of_get_property(dev, "ibm,chip-id", NULL);
-	if (!gcid) {
-		pr_err("%s: device %pOF has no ibm,chip-id\n",
-			__func__, dev);
-		return SCOM_MAP_INVALID;
-	}
-	m = kmalloc(sizeof(*m), GFP_KERNEL);
-	if (!m)
-		return NULL;
-	m->chip = be32_to_cpup(gcid);
-	m->addr = reg;
-
-	return (scom_map_t)m;
-}
-
-static void opal_scom_unmap(scom_map_t map)
-{
-	kfree(map);
-}
-
-static int opal_xscom_err_xlate(int64_t rc)
-{
-	switch(rc) {
-	case 0:
-		return 0;
-	/* Add more translations if necessary */
-	default:
-		return -EIO;
-	}
-}
+#include <asm/debugfs.h>
+#include <asm/prom.h>
 
 static u64 opal_scom_unmangle(u64 addr)
 {
@@ -103,39 +57,154 @@ static u64 opal_scom_unmangle(u64 addr)
 	return addr;
 }
 
-static int opal_scom_read(scom_map_t map, u64 reg, u64 *value)
+static int opal_scom_read(uint32_t chip, uint64_t addr, u64 reg, u64 *value)
 {
-	struct opal_scom_map *m = map;
 	int64_t rc;
 	__be64 v;
 
-	reg = opal_scom_unmangle(m->addr + reg);
-	rc = opal_xscom_read(m->chip, reg, (__be64 *)__pa(&v));
+	reg = opal_scom_unmangle(addr + reg);
+	rc = opal_xscom_read(chip, reg, (__be64 *)__pa(&v));
+	if (rc) {
+		*value = 0xfffffffffffffffful;
+		return -EIO;
+	}
 	*value = be64_to_cpu(v);
-	return opal_xscom_err_xlate(rc);
+	return 0;
 }
 
-static int opal_scom_write(scom_map_t map, u64 reg, u64 value)
+static int opal_scom_write(uint32_t chip, uint64_t addr, u64 reg, u64 value)
 {
-	struct opal_scom_map *m = map;
 	int64_t rc;
 
-	reg = opal_scom_unmangle(m->addr + reg);
-	rc = opal_xscom_write(m->chip, reg, value);
-	return opal_xscom_err_xlate(rc);
+	reg = opal_scom_unmangle(addr + reg);
+	rc = opal_xscom_write(chip, reg, value);
+	if (rc)
+		return -EIO;
+	return 0;
+}
+
+struct scom_debug_entry {
+	u32 chip;
+	struct debugfs_blob_wrapper path;
+	char name[16];
+};
+
+static ssize_t scom_debug_read(struct file *filp, char __user *ubuf,
+			       size_t count, loff_t *ppos)
+{
+	struct scom_debug_entry *ent = filp->private_data;
+	u64 __user *ubuf64 = (u64 __user *)ubuf;
+	loff_t off = *ppos;
+	ssize_t done = 0; 
+	u64 reg, reg_base, reg_cnt, val;
+	int rc;
+
+	if (off < 0 || (off & 7) || (count & 7))
+		return -EINVAL;
+	reg_base = off >> 3;
+	reg_cnt = count >> 3;
+
+	for (reg = 0; reg < reg_cnt; reg++) {
+		rc = opal_scom_read(ent->chip, reg_base, reg, &val);
+		if (!rc)
+			rc = put_user(val, ubuf64);
+		if (rc) {
+			if (!done)
+				done = rc;
+			break;
+		}
+		ubuf64++;
+		*ppos += 8;
+		done += 8;
+	}
+	return done;
+}
+
+static ssize_t scom_debug_write(struct file* filp, const char __user *ubuf,
+				size_t count, loff_t *ppos)
+{
+	struct scom_debug_entry *ent = filp->private_data;
+	u64 __user *ubuf64 = (u64 __user *)ubuf;
+	loff_t off = *ppos;
+	ssize_t done = 0; 
+	u64 reg, reg_base, reg_cnt, val;
+	int rc;
+
+	if (off < 0 || (off & 7) || (count & 7))
+		return -EINVAL;
+	reg_base = off >> 3;
+	reg_cnt = count >> 3;
+
+	for (reg = 0; reg < reg_cnt; reg++) {
+		rc = get_user(val, ubuf64);
+		if (!rc)
+			rc = opal_scom_write(ent->chip, reg_base, reg,  val);
+		if (rc) {
+			if (!done)
+				done = rc;
+			break;
+		}
+		ubuf64++;
+		done += 8;
+	}
+	return done;
 }
 
-static const struct scom_controller opal_scom_controller = {
-	.map	= opal_scom_map,
-	.unmap	= opal_scom_unmap,
-	.read	= opal_scom_read,
-	.write	= opal_scom_write
+static const struct file_operations scom_debug_fops = {
+	.read =		scom_debug_read,
+	.write =	scom_debug_write,
+	.open =		simple_open,
+	.llseek =	default_llseek,
 };
 
-static int opal_xscom_init(void)
+static int scom_debug_init_one(struct dentry *root, struct device_node *dn,
+			       int chip)
 {
-	if (firmware_has_feature(FW_FEATURE_OPAL))
-		scom_init(&opal_scom_controller);
+	struct scom_debug_entry *ent;
+	struct dentry *dir;
+
+	ent = kzalloc(sizeof(*ent), GFP_KERNEL);
+	if (!ent)
+		return -ENOMEM;
+
+	ent->chip = chip;
+	snprintf(ent->name, 16, "%08x", chip);
+	ent->path.data = (void*)kasprintf(GFP_KERNEL, "%pOF", dn);
+	ent->path.size = strlen((char *)ent->path.data);
+
+	dir = debugfs_create_dir(ent->name, root);
+	if (!dir) {
+		kfree(ent->path.data);
+		kfree(ent);
+		return -1;
+	}
+
+	debugfs_create_blob("devspec", 0400, dir, &ent->path);
+	debugfs_create_file("access", 0600, dir, ent, &scom_debug_fops);
+
 	return 0;
 }
-machine_arch_initcall(powernv, opal_xscom_init);
+
+static int scom_debug_init(void)
+{
+	struct device_node *dn;
+	struct dentry *root;
+	int chip, rc;
+
+	if (!firmware_has_feature(FW_FEATURE_OPAL))
+		return 0;
+
+	root = debugfs_create_dir("scom", powerpc_debugfs_root);
+	if (!root)
+		return -1;
+
+	rc = 0;
+	for_each_node_with_property(dn, "scom-controller") {
+		chip = of_get_ibm_chip_id(dn);
+		WARN_ON(chip == -1);
+		rc |= scom_debug_init_one(root, dn, chip);
+	}
+
+	return rc;
+}
+device_initcall(scom_debug_init);
diff --git a/arch/powerpc/platforms/powernv/scom.c b/arch/powerpc/platforms/powernv/scom.c
deleted file mode 100644
index 288580e5fdfe..000000000000
--- a/arch/powerpc/platforms/powernv/scom.c
+++ /dev/null
@@ -1,170 +0,0 @@
-/*
- * Copyright 2010 Benjamin Herrenschmidt, IBM Corp
- *                <benh@kernel.crashing.org>
- *     and        David Gibson, IBM Corporation.
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
- */
-
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/export.h>
-#include <asm/debugfs.h>
-#include <asm/prom.h>
-#include <linux/uaccess.h>
-
-#include "scom.h"
-
-const struct scom_controller *scom_controller;
-
-#ifdef CONFIG_SCOM_DEBUGFS
-struct scom_debug_entry {
-	struct device_node *dn;
-	struct debugfs_blob_wrapper path;
-	char name[16];
-};
-
-static ssize_t scom_debug_read(struct file *filp, char __user *ubuf,
-			       size_t count, loff_t *ppos)
-{
-	struct scom_debug_entry *ent = filp->private_data;
-	u64 __user *ubuf64 = (u64 __user *)ubuf;
-	loff_t off = *ppos;
-	ssize_t done = 0; 
-	u64 reg, reg_cnt, val;
-	scom_map_t map;
-	int rc;
-
-	if (off < 0 || (off & 7) || (count & 7))
-		return -EINVAL;
-	reg = off >> 3;
-	reg_cnt = count >> 3;
-
-	map = scom_map(ent->dn, reg, reg_cnt);
-	if (!scom_map_ok(map))
-		return -ENXIO;
-
-	for (reg = 0; reg < reg_cnt; reg++) {
-		rc = scom_read(map, reg, &val);
-		if (!rc)
-			rc = put_user(val, ubuf64);
-		if (rc) {
-			if (!done)
-				done = rc;
-			break;
-		}
-		ubuf64++;
-		*ppos += 8;
-		done += 8;
-	}
-	scom_unmap(map);
-	return done;
-}
-
-static ssize_t scom_debug_write(struct file* filp, const char __user *ubuf,
-				size_t count, loff_t *ppos)
-{
-	struct scom_debug_entry *ent = filp->private_data;
-	u64 __user *ubuf64 = (u64 __user *)ubuf;
-	loff_t off = *ppos;
-	ssize_t done = 0; 
-	u64 reg, reg_cnt, val;
-	scom_map_t map;
-	int rc;
-
-	if (off < 0 || (off & 7) || (count & 7))
-		return -EINVAL;
-	reg = off >> 3;
-	reg_cnt = count >> 3;
-
-	map = scom_map(ent->dn, reg, reg_cnt);
-	if (!scom_map_ok(map))
-		return -ENXIO;
-
-	for (reg = 0; reg < reg_cnt; reg++) {
-		rc = get_user(val, ubuf64);
-		if (!rc)
-			rc = scom_write(map, reg,  val);
-		if (rc) {
-			if (!done)
-				done = rc;
-			break;
-		}
-		ubuf64++;
-		done += 8;
-	}
-	scom_unmap(map);
-	return done;
-}
-
-static const struct file_operations scom_debug_fops = {
-	.read =		scom_debug_read,
-	.write =	scom_debug_write,
-	.open =		simple_open,
-	.llseek =	default_llseek,
-};
-
-static int scom_debug_init_one(struct dentry *root, struct device_node *dn,
-			       int i)
-{
-	struct scom_debug_entry *ent;
-	struct dentry *dir;
-
-	ent = kzalloc(sizeof(*ent), GFP_KERNEL);
-	if (!ent)
-		return -ENOMEM;
-
-	ent->dn = of_node_get(dn);
-	snprintf(ent->name, 16, "%08x", i);
-	ent->path.data = (void*)kasprintf(GFP_KERNEL, "%pOF", dn);
-	ent->path.size = strlen((char *)ent->path.data);
-
-	dir = debugfs_create_dir(ent->name, root);
-	if (!dir) {
-		of_node_put(dn);
-		kfree(ent->path.data);
-		kfree(ent);
-		return -1;
-	}
-
-	debugfs_create_blob("devspec", 0400, dir, &ent->path);
-	debugfs_create_file("access", 0600, dir, ent, &scom_debug_fops);
-
-	return 0;
-}
-
-static int scom_debug_init(void)
-{
-	struct device_node *dn;
-	struct dentry *root;
-	int i, rc;
-
-	root = debugfs_create_dir("scom", powerpc_debugfs_root);
-	if (!root)
-		return -1;
-
-	i = rc = 0;
-	for_each_node_with_property(dn, "scom-controller") {
-		int id = of_get_ibm_chip_id(dn);
-		if (id == -1)
-			id = i;
-		rc |= scom_debug_init_one(root, dn, id);
-		i++;
-	}
-
-	return rc;
-}
-device_initcall(scom_debug_init);
-#endif /* CONFIG_SCOM_DEBUGFS */
diff --git a/arch/powerpc/platforms/powernv/scom.h b/arch/powerpc/platforms/powernv/scom.h
deleted file mode 100644
index 2c72f7fc8726..000000000000
--- a/arch/powerpc/platforms/powernv/scom.h
+++ /dev/null
@@ -1,133 +0,0 @@
-/*
- * Copyright 2010 Benjamin Herrenschmidt, IBM Corp
- *                <benh@kernel.crashing.org>
- *     and        David Gibson, IBM Corporation.
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
- */
-
-#ifndef _SCOM_H
-#define _SCOM_H
-
-/*
- * The SCOM bus is a sideband bus used for accessing various internal
- * registers of the processor or the chipset. The implementation details
- * differ between processors and platforms, and the access method as
- * well.
- *
- * This API allows to "map" ranges of SCOM register numbers associated
- * with a given SCOM controller. The later must be represented by a
- * device node, though some implementations might support NULL if there
- * is no possible ambiguity
- *
- * Then, scom_read/scom_write can be used to accesses registers inside
- * that range. The argument passed is a register number relative to
- * the beginning of the range mapped.
- */
-
-typedef void *scom_map_t;
-
-/* Value for an invalid SCOM map */
-#define SCOM_MAP_INVALID	(NULL)
-
-/* The scom_controller data structure is what the platform passes
- * to the core code in scom_init, it provides the actual implementation
- * of all the SCOM functions
- */
-struct scom_controller {
-	scom_map_t (*map)(struct device_node *ctrl_dev, u64 reg, u64 count);
-	void (*unmap)(scom_map_t map);
-
-	int (*read)(scom_map_t map, u64 reg, u64 *value);
-	int (*write)(scom_map_t map, u64 reg, u64 value);
-};
-
-extern const struct scom_controller *scom_controller;
-
-/**
- * scom_init - Initialize the SCOM backend, called by the platform
- * @controller: The platform SCOM controller
- */
-static inline void scom_init(const struct scom_controller *controller)
-{
-	scom_controller = controller;
-}
-
-/**
- * scom_map_ok - Test is a SCOM mapping is successful
- * @map: The result of scom_map to test
- */
-static inline int scom_map_ok(scom_map_t map)
-{
-	return map != SCOM_MAP_INVALID;
-}
-
-/**
- * scom_map - Map a block of SCOM registers
- * @ctrl_dev: Device node of the SCOM controller
- *            some implementations allow NULL here
- * @reg: first SCOM register to map
- * @count: Number of SCOM registers to map
- */
-
-static inline scom_map_t scom_map(struct device_node *ctrl_dev,
-				  u64 reg, u64 count)
-{
-	return scom_controller->map(ctrl_dev, reg, count);
-}
-
-/**
- * scom_unmap - Unmap a block of SCOM registers
- * @map: Result of scom_map is to be unmapped
- */
-static inline void scom_unmap(scom_map_t map)
-{
-	if (scom_map_ok(map))
-		scom_controller->unmap(map);
-}
-
-/**
- * scom_read - Read a SCOM register
- * @map: Result of scom_map
- * @reg: Register index within that map
- * @value: Updated with the value read
- *
- * Returns 0 (success) or a negative error code
- */
-static inline int scom_read(scom_map_t map, u64 reg, u64 *value)
-{
-	int rc;
-
-	rc = scom_controller->read(map, reg, value);
-	if (rc)
-		*value = 0xfffffffffffffffful;
-	return rc;
-}
-
-/**
- * scom_write - Write to a SCOM register
- * @map: Result of scom_map
- * @reg: Register index within that map
- * @value: Value to write
- *
- * Returns 0 (success) or a negative error code
- */
-static inline int scom_write(scom_map_t map, u64 reg, u64 value)
-{
-	return scom_controller->write(map, reg, value);
-}
-
-
-#endif /* _SCOM_H */
-- 
2.20.1

