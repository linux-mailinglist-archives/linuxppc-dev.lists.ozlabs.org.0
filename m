Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7035F4C8045
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 02:17:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6zqm4dxLz3ds2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 12:17:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=apgjSK56;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=apgjSK56; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6zpC4rKFz3dPK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 12:15:47 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22118fSo002933; 
 Tue, 1 Mar 2022 01:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=0wXITXxM9heQOkmaqFTLh+PFqj6U9FOTT+e0vupDXw8=;
 b=apgjSK567O/CMQBSgnilhS5Gb0LarpHaJ5XudbiZtTRiWJgiUYNPjvRaNcSDV3rpF9US
 C6T7KbZfLa6OGEXLGa35tDtNVCiHJFQ3ZfyyD7s34uqd1DPyA++shC+zdcy8IoN6Bd3S
 8+gB2s2b7RkcKjiFbM818EhSfnM90PFjQsWvnBlrFT+z2KT2aXisQZN2cwD5pCR13KDB
 lXA7z9Mml5YovpHuOMkmNtSPaZYolplBq7neUz5Kkt7oSDsxZJca+1m/d/5CAPJ8NDOg
 0W44Sn0K+6wFUHPTZFlVr+SCxkVgKnkID+otdepS/uIoJSunCSbSpol1vNBBF9seOOS3 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eh32c0n6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:15:43 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2211FgOx023035;
 Tue, 1 Mar 2022 01:15:42 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eh32c0n6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:15:42 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2210vchJ001245;
 Tue, 1 Mar 2022 01:15:42 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 3efbu9gns0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:15:41 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2211Fd8T15335868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 01:15:40 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E16B06A047;
 Tue,  1 Mar 2022 01:15:39 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C145C6A05A;
 Tue,  1 Mar 2022 01:15:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 01:15:38 +0000 (GMT)
Message-ID: <702d8b626ebfac2b52f4995eebeafe1c9a6fcb75.camel@linux.ibm.com>
Subject: [PATCH v6 8/9] powerpc/pseries/vas: sysfs interface to export
 capabilities
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Mon, 28 Feb 2022 17:15:36 -0800
In-Reply-To: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
References: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8tsvOvcEkk9m6wWmD72tsqOxQz5zDY8V
X-Proofpoint-ORIG-GUID: mZVEFHENcwQhtmXS8nhDdY_J79s2UoM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010004
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


The hypervisor provides the available VAS GZIP capabilities such
as default or QoS window type and the target available credits in
each type. This patch creates sysfs entries and exports the target,
used and the available credits for each feature.

This interface can be used by the user space to determine the credits
usage or to set the target credits in the case of QoS type (for DLPAR).

/sys/devices/vas/vas0/gzip/default_capabilities (default GZIP capabilities)
	nr_total_credits /* Total credits available. Can be
			 /* changed with DLPAR operation */
	nr_used_credits  /* Used credits */

/sys/devices/vas/vas0/gzip/qos_capabilities (QoS GZIP capabilities)
	nr_total_credits
	nr_used_credits

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/Makefile    |   2 +-
 arch/powerpc/platforms/pseries/vas-sysfs.c | 226 +++++++++++++++++++++
 arch/powerpc/platforms/pseries/vas.c       |   6 +
 arch/powerpc/platforms/pseries/vas.h       |   6 +
 4 files changed, 239 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/platforms/pseries/vas-sysfs.c

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index ee60b59024b4..29b522d2c755 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -29,6 +29,6 @@ obj-$(CONFIG_PPC_SVM)		+= svm.o
 obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
 
 obj-$(CONFIG_SUSPEND)		+= suspend.o
-obj-$(CONFIG_PPC_VAS)		+= vas.o
+obj-$(CONFIG_PPC_VAS)		+= vas.o vas-sysfs.o
 
 obj-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+= cc_platform.o
diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/platforms/pseries/vas-sysfs.c
new file mode 100644
index 000000000000..e24d3edb3021
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2022-23 IBM Corp.
+ */
+
+#define pr_fmt(fmt) "vas: " fmt
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/kobject.h>
+#include <linux/slab.h>
+#include <linux/mm.h>
+
+#include "vas.h"
+
+#ifdef CONFIG_SYSFS
+static struct kobject *pseries_vas_kobj;
+static struct kobject *gzip_caps_kobj;
+
+struct vas_caps_entry {
+	struct kobject kobj;
+	struct vas_cop_feat_caps *caps;
+};
+
+#define to_caps_entry(entry) container_of(entry, struct vas_caps_entry, kobj)
+
+#define sysfs_caps_entry_read(_name)					\
+static ssize_t _name##_show(struct vas_cop_feat_caps *caps, char *buf) 	\
+{									\
+	return sprintf(buf, "%d\n", atomic_read(&caps->_name));	\
+}
+
+struct vas_sysfs_entry {
+	struct attribute attr;
+	ssize_t (*show)(struct vas_cop_feat_caps *, char *);
+	ssize_t (*store)(struct vas_cop_feat_caps *, const char *, size_t);
+};
+
+#define VAS_ATTR_RO(_name)	\
+	sysfs_caps_entry_read(_name);		\
+	static struct vas_sysfs_entry _name##_attribute = __ATTR(_name,	\
+				0444, _name##_show, NULL);
+
+/*
+ * Create sysfs interface:
+ * /sys/devices/vas/vas0/gzip/default_capabilities
+ *	This directory contains the following VAS GZIP capabilities
+ *	for the defaule credit type.
+ * /sys/devices/vas/vas0/gzip/default_capabilities/nr_total_credits
+ *	Total number of default credits assigned to the LPAR which
+ *	can be changed with DLPAR operation.
+ * /sys/devices/vas/vas0/gzip/default_capabilities/nr_used_credits
+ *	Number of credits used by the user space. One credit will
+ *	be assigned for each window open.
+ *
+ * /sys/devices/vas/vas0/gzip/qos_capabilities
+ *	This directory contains the following VAS GZIP capabilities
+ *	for the Quality of Service (QoS) credit type.
+ * /sys/devices/vas/vas0/gzip/qos_capabilities/nr_total_credits
+ *	Total number of QoS credits assigned to the LPAR. The user
+ *	has to define this value using HMC interface. It can be
+ *	changed dynamically by the user.
+ * /sys/devices/vas/vas0/gzip/qos_capabilities/nr_used_credits
+ *	Number of credits used by the user space.
+ */
+
+VAS_ATTR_RO(nr_total_credits);
+VAS_ATTR_RO(nr_used_credits);
+
+static struct attribute *vas_capab_attrs[] = {
+	&nr_total_credits_attribute.attr,
+	&nr_used_credits_attribute.attr,
+	NULL,
+};
+
+static ssize_t vas_type_show(struct kobject *kobj, struct attribute *attr,
+			     char *buf)
+{
+	struct vas_caps_entry *centry;
+	struct vas_cop_feat_caps *caps;
+	struct vas_sysfs_entry *entry;
+
+	centry = to_caps_entry(kobj);
+	caps = centry->caps;
+	entry = container_of(attr, struct vas_sysfs_entry, attr);
+
+	if (!entry->show)
+		return -EIO;
+
+	return entry->show(caps, buf);
+}
+
+static ssize_t vas_type_store(struct kobject *kobj, struct attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct vas_caps_entry *centry;
+	struct vas_cop_feat_caps *caps;
+	struct vas_sysfs_entry *entry;
+
+	centry = to_caps_entry(kobj);
+	caps = centry->caps;
+	entry = container_of(attr, struct vas_sysfs_entry, attr);
+	if (!entry->store)
+		return -EIO;
+
+	return entry->store(caps, buf, count);
+}
+
+static void vas_type_release(struct kobject *kobj)
+{
+	struct vas_caps_entry *centry = to_caps_entry(kobj);
+	kfree(centry);
+}
+
+static const struct sysfs_ops vas_sysfs_ops = {
+	.show	=	vas_type_show,
+	.store	=	vas_type_store,
+};
+
+static struct kobj_type vas_attr_type = {
+		.release	=	vas_type_release,
+		.sysfs_ops      =       &vas_sysfs_ops,
+		.default_attrs  =       vas_capab_attrs,
+};
+
+static char *vas_caps_kobj_name(struct vas_cop_feat_caps *caps,
+				struct kobject **kobj)
+{
+	if (caps->descriptor == VAS_GZIP_QOS_CAPABILITIES) {
+		*kobj = gzip_caps_kobj;
+		return "qos_capabilities";
+	} else if (caps->descriptor == VAS_GZIP_DEFAULT_CAPABILITIES) {
+		*kobj = gzip_caps_kobj;
+		return "default_capabilities";
+	} else
+		return "Unknown";
+}
+
+/*
+ * Add feature specific capability dir entry.
+ * Ex: VDefGzip or VQosGzip
+ */
+int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps)
+{
+	struct vas_caps_entry *centry;
+	struct kobject *kobj = NULL;
+	int ret = 0;
+	char *name;
+
+	centry = kzalloc(sizeof(*centry), GFP_KERNEL);
+	if (!centry)
+		return -ENOMEM;
+
+	kobject_init(&centry->kobj, &vas_attr_type);
+	centry->caps = caps;
+	name  = vas_caps_kobj_name(caps, &kobj);
+
+	if (kobj) {
+		ret = kobject_add(&centry->kobj, kobj, "%s", name);
+
+		if (ret) {
+			pr_err("VAS: sysfs kobject add / event failed %d\n",
+					ret);
+			kobject_put(&centry->kobj);
+		}
+	}
+
+	return ret;
+}
+
+static struct miscdevice vas_miscdev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "vas",
+};
+
+/*
+ * Add VAS and VasCaps (overall capabilities) dir entries.
+ */
+int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps)
+{
+	int ret;
+
+	ret = misc_register(&vas_miscdev);
+	if (ret < 0) {
+		pr_err("%s: register vas misc device failed\n", __func__);
+		return ret;
+	}
+
+	/*
+	 * The hypervisor does not expose multiple VAS instances, but can
+	 * see multiple VAS instances on PowerNV. So create 'vas0' directory
+	 * on pseries.
+	 */
+	pseries_vas_kobj = kobject_create_and_add("vas0",
+					&vas_miscdev.this_device->kobj);
+	if (!pseries_vas_kobj) {
+		pr_err("Failed to create VAS sysfs entry\n");
+		return -ENOMEM;
+	}
+
+	if ((vas_caps->feat_type & VAS_GZIP_QOS_FEAT_BIT) ||
+		(vas_caps->feat_type & VAS_GZIP_DEF_FEAT_BIT)) {
+		gzip_caps_kobj = kobject_create_and_add("gzip",
+						       pseries_vas_kobj);
+		if (!gzip_caps_kobj) {
+			pr_err("Failed to create VAS GZIP capability entry\n");
+			kobject_put(pseries_vas_kobj);
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+#else
+int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps)
+{
+	return 0;
+}
+
+int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps)
+{
+	return 0;
+}
+#endif
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 96178dd58adf..ca0ad191229d 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -560,6 +560,10 @@ static int __init get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 		}
 	}
 
+	rc = sysfs_add_vas_caps(caps);
+	if (rc)
+		return rc;
+
 	copypaste_feat = true;
 
 	return 0;
@@ -844,6 +848,8 @@ static int __init pseries_vas_init(void)
 	caps_all.descriptor = be64_to_cpu(hv_caps->descriptor);
 	caps_all.feat_type = be64_to_cpu(hv_caps->feat_type);
 
+	sysfs_pseries_vas_init(&caps_all);
+
 	hv_cop_caps = kmalloc(sizeof(*hv_cop_caps), GFP_KERNEL);
 	if (!hv_cop_caps) {
 		rc = -ENOMEM;
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 701363cfd7c1..f1bdb776021e 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -30,6 +30,9 @@
 #define VAS_COPY_PASTE_USER_MODE	0x00000001
 #define VAS_COP_OP_USER_MODE		0x00000010
 
+#define VAS_GZIP_QOS_CAPABILITIES	0x56516F73477A6970
+#define VAS_GZIP_DEFAULT_CAPABILITIES	0x56446566477A6970
+
 /*
  * Co-processor feature - GZIP QoS windows or GZIP default windows
  */
@@ -125,4 +128,7 @@ struct pseries_vas_window {
 	char *name;
 	int fault_virq;
 };
+
+int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
+int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps);
 #endif /* _VAS_H */
-- 
2.27.0


