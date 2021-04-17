Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 626CB363266
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 23:11:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FN5NH2Mnkz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 07:11:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RL5GWn1G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RL5GWn1G; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FN5Mq6H7xz30Cb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 07:10:47 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13HL52H6183137; Sat, 17 Apr 2021 17:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=eAFL5s3EOX/JDHqh1JOdsultJpXxSIB3gd+sDeiO8xo=;
 b=RL5GWn1GBgMKPtVo62UUXflprKNTlFePWQycpFTIYUnHWjjPUt/LsvcKJD0CPA3VlIYh
 iAkRzdmC1bqhMrEXJl3RJ4zVLsp1D1nPbc1xbtTOW34r5q0y4xcIhPGvFtw0edFNWS3v
 AABE2OFtxbomeKEhjR97yb7rs7EYHT+zaq3+0BRNazKeG2684nKhjE5gPAtoUYdSQMpb
 5apuSMyvjoq3GQPy+77vwEuFe13hbCO5LYtrCjNLSiPOTzkN4Qst6LXecGP8YmkcplPI
 dvC4gjvrm5GjXV/7IzCxy+xoGTeb7K6XCguNS7W/YKf+R/QiEunz+zYcdJTQODbBfAz+ 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37ys9t59tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Apr 2021 17:10:40 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13HL55bF183361;
 Sat, 17 Apr 2021 17:10:40 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37ys9t59th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Apr 2021 17:10:40 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13HLAMW1012801;
 Sat, 17 Apr 2021 21:10:39 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 37yqa8dhty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Apr 2021 21:10:39 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13HLAdut11534710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Apr 2021 21:10:39 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5935B124055;
 Sat, 17 Apr 2021 21:10:39 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A5A7124052;
 Sat, 17 Apr 2021 21:10:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.232.48])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 17 Apr 2021 21:10:38 +0000 (GMT)
Message-ID: <60176ad795219afbeaf51ad596af4bae710617b7.camel@linux.ibm.com>
Subject: [V3 PATCH 12/16] powerpc/pseries/vas: sysfs interface to export
 capabilities
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sat, 17 Apr 2021 14:10:36 -0700
In-Reply-To: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QzNfC-IeHvTDHQVW1ondJX-B8Uume9Fa
X-Proofpoint-ORIG-GUID: ohHsOVGICswjNUkCIDTAO9Cxe06EZJuH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-17_15:2021-04-16,
 2021-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104170152
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


pHyp provides GZIP default and GZIP QoS capabilities which gives
the total number of credits are available in LPAR. This patch
creates sysfs entries and exports LPAR credits, the currently used
and the available credits for each feature.

/sys/kernel/vas/VasCaps/VDefGzip: (default GZIP capabilities)
	avail_lpar_creds /* Available credits to use */
	target_lpar_creds /* Total credits available which can be
			 /* changed with DLPAR operation */
	used_lpar_creds  /* Used credits */

/sys/kernel/vas/VasCaps/VQosGzip (QoS GZIP capabilities)
	avail_lpar_creds
	target_lpar_creds
	used_lpar_creds

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/Makefile    |   2 +-
 arch/powerpc/platforms/pseries/vas-sysfs.c | 173 +++++++++++++++++++++
 arch/powerpc/platforms/pseries/vas.c       |   6 +
 arch/powerpc/platforms/pseries/vas.h       |   2 +
 4 files changed, 182 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/platforms/pseries/vas-sysfs.c

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 4cda0ef87be0..e24093bebc0b 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -30,4 +30,4 @@ obj-$(CONFIG_PPC_SVM)		+= svm.o
 obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
 
 obj-$(CONFIG_SUSPEND)		+= suspend.o
-obj-$(CONFIG_PPC_VAS)		+= vas.o
+obj-$(CONFIG_PPC_VAS)		+= vas.o vas-sysfs.o
diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/platforms/pseries/vas-sysfs.c
new file mode 100644
index 000000000000..5f01f8ba6806
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2016-17 IBM Corp.
+ */
+
+#define pr_fmt(fmt) "vas: " fmt
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/kobject.h>
+#include <linux/slab.h>
+#include <linux/mm.h>
+
+#include "vas.h"
+
+#ifdef CONFIG_SYSFS
+static struct kobject *pseries_vas_kobj;
+static struct kobject *vas_capabs_kobj;
+
+struct vas_capabs_entry {
+	struct kobject kobj;
+	struct vas_ct_capabs *capabs;
+};
+
+#define to_capabs_entry(entry) container_of(entry, struct vas_capabs_entry, kobj)
+
+static ssize_t avail_lpar_creds_show(struct vas_ct_capabs *capabs, char *buf)
+{
+	int avail_creds = atomic_read(&capabs->target_lpar_creds) -
+			atomic_read(&capabs->used_lpar_creds);
+	return sprintf(buf, "%d\n", avail_creds);
+}
+
+#define sysfs_capbs_entry_read(_name)					\
+static ssize_t _name##_show(struct vas_ct_capabs *capabs, char *buf) 	\
+{									\
+	return sprintf(buf, "%d\n", atomic_read(&capabs->_name));	\
+}
+
+struct vas_sysfs_entry {
+	struct attribute attr;
+	ssize_t (*show)(struct vas_ct_capabs *, char *);
+	ssize_t (*store)(struct vas_ct_capabs *, const char *, size_t);
+};
+
+#define VAS_ATTR_RO(_name)	\
+	sysfs_capbs_entry_read(_name);		\
+	static struct vas_sysfs_entry _name##_attribute = __ATTR(_name,	\
+				0444, _name##_show, NULL);
+
+VAS_ATTR_RO(target_lpar_creds);
+VAS_ATTR_RO(used_lpar_creds);
+
+static struct vas_sysfs_entry avail_lpar_creds_attribute =
+	__ATTR(avail_lpar_creds, 0444, avail_lpar_creds_show, NULL);
+
+static struct attribute *vas_capab_attrs[] = {
+	&target_lpar_creds_attribute.attr,
+	&used_lpar_creds_attribute.attr,
+	&avail_lpar_creds_attribute.attr,
+	NULL,
+};
+
+static ssize_t vas_type_show(struct kobject *kobj, struct attribute *attr,
+			     char *buf)
+{
+	struct vas_capabs_entry *centry;
+	struct vas_ct_capabs *capabs;
+	struct vas_sysfs_entry *entry;
+
+	centry = to_capabs_entry(kobj);
+	capabs = centry->capabs;
+	entry = container_of(attr, struct vas_sysfs_entry, attr);
+
+	if (!entry->show)
+		return -EIO;
+
+	return entry->show(capabs, buf);
+}
+
+static ssize_t vas_type_store(struct kobject *kobj, struct attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct vas_capabs_entry *centry;
+	struct vas_ct_capabs *capabs;
+	struct vas_sysfs_entry *entry;
+
+	centry = to_capabs_entry(kobj);
+	capabs = centry->capabs;
+	entry = container_of(attr, struct vas_sysfs_entry, attr);
+	if (!entry->store)
+		return -EIO;
+
+	return entry->store(capabs, buf, count);
+}
+
+static void vas_type_release(struct kobject *kobj)
+{
+	struct vas_capabs_entry *centry = to_capabs_entry(kobj);
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
+/*
+ * Add feature specific capability dir entry.
+ * Ex: VDefGzip or VQosGzip
+ */
+int sysfs_add_vas_capabs(struct vas_ct_capabs *capabs)
+{
+	struct vas_capabs_entry *centry;
+	int ret = 0;
+
+	centry = kzalloc(sizeof(*centry), GFP_KERNEL);
+	if (!centry)
+		return -ENOMEM;
+
+	kobject_init(&centry->kobj, &vas_attr_type);
+	centry->capabs = capabs;
+
+	ret = kobject_add(&centry->kobj, vas_capabs_kobj, "%s",
+			  capabs->name);
+
+	if (ret) {
+		pr_err("VAS: sysfs kobject add / event failed %d\n", ret);
+		kobject_put(&centry->kobj);
+	}
+
+	return ret;
+}
+
+/*
+ * Add VAS and VasCaps (overall capabilities) dir entries.
+ */
+int __init sysfs_pseries_vas_init(struct vas_all_capabs *vas_caps)
+{
+	pseries_vas_kobj = kobject_create_and_add("vas", kernel_kobj);
+	if (!pseries_vas_kobj) {
+		pr_err("Failed to create VAS sysfs entry\n");
+		return -ENOMEM;
+	}
+
+	vas_capabs_kobj = kobject_create_and_add(vas_caps->name,
+						 pseries_vas_kobj);
+	if (!vas_capabs_kobj) {
+		pr_err("Failed to create VAS capabilities kobject\n");
+		kobject_put(pseries_vas_kobj);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+#else
+int sysfs_add_vas_capabs(struct vas_ct_capabs *capabs)
+{
+	return 0;
+}
+
+int __init sysfs_pseries_vas_init(struct vas_all_capabs *vas_caps)
+{
+	return 0;
+}
+#endif
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 2106eca0862a..ac06fa09900c 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -594,6 +594,10 @@ static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 		}
 	}
 
+	rc = sysfs_add_vas_capabs(capab);
+	if (rc)
+		return rc;
+
 	copypaste_feat = 1;
 
 	return 0;
@@ -629,6 +633,8 @@ static int __init pseries_vas_init(void)
 	capabs_all.descriptor = be64_to_cpu(capabs_be->descriptor);
 	capabs_all.feat_type = be64_to_cpu(capabs_be->feat_type);
 
+	sysfs_pseries_vas_init(&capabs_all);
+
 	ct_capabs_be = kmalloc(sizeof(*ct_capabs_be), GFP_KERNEL);
 	if (!ct_capabs_be) {
 		rc = -ENOMEM;
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 208682fffa57..e64677f03f08 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -93,4 +93,6 @@ struct vas_win_lpar_be {
 	__be64	win_util;	/* Number of bytes processed */
 } __packed __aligned(0x1000);
 
+int sysfs_add_vas_capabs(struct vas_ct_capabs *capabs);
+int __init sysfs_pseries_vas_init(struct vas_all_capabs *vas_caps);
 #endif /* _VAS_H */
-- 
2.18.2


