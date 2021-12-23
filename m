Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CF247DC06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 01:32:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKB3X1nlRz3dkl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 11:32:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f9K1qKKj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f9K1qKKj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKB2p357sz2ynk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 11:31:46 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMNafSe026939; 
 Thu, 23 Dec 2021 00:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=u8wgB8oH3vSm5yaq0/dm5fQXqD621UgjG/stWVyNdIM=;
 b=f9K1qKKjVE5TgXk7uQC2yfjpBdUNS7WZ2esHMbZfoi4c9n8wAw9YJBfQiJpWhGDBOw+k
 W9j8SzutX9i9/pqzsEfDzCXeSvgkW+5b5cunegL1qph097y+p+sIIS4A2NGFQ7nidKBP
 9/ruXD+2PprR+vpXIuZK17ecSVZurLrpsjDWrzn1TgBrmZAMUiKmcn0v75TYHwXsNBoT
 o2I1T9FbrAt91rjMkW9uTOr9ghGoJg5ugo52VkURySw37fhh37hCq7x2bHqdW7nAI+Nz
 l3epQ2HWX4mpzQg/PqU+2yALiAwHhiCXgEwdZT4XJ8enh7TXrc5uqEIToqV21xoyoxWT QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d486xxnhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:31:39 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BN0Us3p009883;
 Thu, 23 Dec 2021 00:31:38 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d486xxnhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:31:38 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BN0C5mL015553;
 Thu, 23 Dec 2021 00:31:37 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3d179b05pc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:31:37 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BN0VafV9765222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 00:31:36 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 971CA78066;
 Thu, 23 Dec 2021 00:31:36 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B81097805E;
 Thu, 23 Dec 2021 00:31:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.90.83])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 00:31:35 +0000 (GMT)
Message-ID: <515af15946bc0913ade0f25fd0a0363faac03316.camel@linux.ibm.com>
Subject: [PATCH v2 09/10] powerpc/pseries/vas: sysfs interface to export
 capabilities
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Wed, 22 Dec 2021 16:31:34 -0800
In-Reply-To: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
References: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EwbSPZZfvnBjFlUW_BkwyQgoGU_NI5x_
X-Proofpoint-GUID: tjXK717pdzKtKjDwm2b5u7L7yzm9PK09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_09,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112230000
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

/sys/devices/vas/vas0/gzip/def_caps: (default GZIP capabilities)
	avail_creds /* Available credits to use */
	target_creds /* Total credits available. Can be
			 /* changed with DLPAR operation */
	used_creds  /* Used credits */

/sys/devices/vas/vas0/gzip/qos_caps (QoS GZIP capabilities)
	avail_creds
	target_creds
	used_creds

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/Makefile    |   2 +-
 arch/powerpc/platforms/pseries/vas-sysfs.c | 218 +++++++++++++++++++++
 arch/powerpc/platforms/pseries/vas.c       |   6 +
 arch/powerpc/platforms/pseries/vas.h       |   6 +
 4 files changed, 231 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/platforms/pseries/vas-sysfs.c

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 41d8aee98da4..349f42c31b65 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -30,6 +30,6 @@ obj-$(CONFIG_PPC_SVM)		+= svm.o
 obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
 
 obj-$(CONFIG_SUSPEND)		+= suspend.o
-obj-$(CONFIG_PPC_VAS)		+= vas.o
+obj-$(CONFIG_PPC_VAS)		+= vas.o vas-sysfs.o
 
 obj-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+= cc_platform.o
diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/platforms/pseries/vas-sysfs.c
new file mode 100644
index 000000000000..f7609cdef8f8
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2016-17 IBM Corp.
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
+static ssize_t avail_creds_show(struct vas_cop_feat_caps *caps, char *buf)
+{
+	/*
+	 * avail_creds may be -ve if used_creds is oversubscribed,
+	 * can happen if target_creds is reduced with DLPAR core removal.
+	 */
+	int avail_creds = atomic_read(&caps->target_creds) -
+			atomic_read(&caps->used_creds);
+	return sprintf(buf, "%d\n", avail_creds);
+}
+
+#define sysfs_capbs_entry_read(_name)					\
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
+	sysfs_capbs_entry_read(_name);		\
+	static struct vas_sysfs_entry _name##_attribute = __ATTR(_name,	\
+				0444, _name##_show, NULL);
+
+VAS_ATTR_RO(target_creds);
+VAS_ATTR_RO(used_creds);
+
+static struct vas_sysfs_entry avail_creds_attribute =
+	__ATTR(avail_creds, 0444, avail_creds_show, NULL);
+
+static struct attribute *vas_capab_attrs[] = {
+	&target_creds_attribute.attr,
+	&used_creds_attribute.attr,
+	&avail_creds_attribute.attr,
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
+		return "qos_caps";
+	} else if (caps->descriptor == VAS_GZIP_DEFAULT_CAPABILITIES) {
+		*kobj = gzip_caps_kobj;
+		return "def_caps";
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
+	 * on PowerVM.
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
index c7dec3adc3af..4b4048209c7d 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -553,6 +553,10 @@ static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 		}
 	}
 
+	rc = sysfs_add_vas_caps(caps);
+	if (rc)
+		return rc;
+
 	copypaste_feat = true;
 
 	return 0;
@@ -832,6 +836,8 @@ static int __init pseries_vas_init(void)
 	caps_all.descriptor = be64_to_cpu(hv_caps->descriptor);
 	caps_all.feat_type = be64_to_cpu(hv_caps->feat_type);
 
+	sysfs_pseries_vas_init(&caps_all);
+
 	hv_cop_caps = kmalloc(sizeof(*hv_cop_caps), GFP_KERNEL);
 	if (!hv_cop_caps) {
 		rc = -ENOMEM;
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 8ce9b84693e8..bc393bd74030 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -24,6 +24,9 @@
 #define VAS_COPY_PASTE_USER_MODE	0x00000001
 #define VAS_COP_OP_USER_MODE		0x00000010
 
+#define VAS_GZIP_QOS_CAPABILITIES	0x56516F73477A6970
+#define VAS_GZIP_DEFAULT_CAPABILITIES	0x56446566477A6970
+
 /*
  * Co-processor feature - GZIP QoS windows or GZIP default windows
  */
@@ -120,4 +123,7 @@ struct pseries_vas_window {
 	char *name;
 	int fault_virq;
 };
+
+int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
+int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps);
 #endif /* _VAS_H */
-- 
2.27.0


