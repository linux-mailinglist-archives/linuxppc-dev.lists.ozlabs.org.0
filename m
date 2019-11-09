Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9BCF610E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 20:07:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479RV70zQmzF769
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 06:07:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479RLJ65x1zF6QV
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 06:00:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 479RLJ4QKKz8svV
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 06:00:56 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 479RLJ3wlpz9sNH; Sun, 10 Nov 2019 06:00:56 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 479RLH2dlgz9sNx
 for <linuxppc-dev@ozlabs.org>; Sun, 10 Nov 2019 06:00:55 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA9IvAE9126656
 for <linuxppc-dev@ozlabs.org>; Sat, 9 Nov 2019 14:00:53 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w5tuamwa2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sat, 09 Nov 2019 14:00:53 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Sat, 9 Nov 2019 19:00:51 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 9 Nov 2019 19:00:47 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xA9J0kpb30540204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 9 Nov 2019 19:00:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B35A52052;
 Sat,  9 Nov 2019 19:00:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.192.65])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B6C305204F;
 Sat,  9 Nov 2019 19:00:43 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v8 2/4] powerpc: expose secure variables to userspace via sysfs
Date: Sat,  9 Nov 2019 13:00:30 -0600
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191109190032.96259-1-nayna@linux.ibm.com>
References: <20191109190032.96259-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19110919-0028-0000-0000-000003B478CC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110919-0029-0000-0000-000024777CC3
Message-Id: <20191109190032.96259-3-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-09_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911090193
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerNV secure variables, which store the keys used for OS kernel
verification, are managed by the firmware. These secure variables need to
be accessed by the userspace for addition/deletion of the certificates.

This patch adds the sysfs interface to expose secure variables for PowerNV
secureboot. The users shall use this interface for manipulating
the keys stored in the secure variables.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Eric Richter <erichte@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-secvar |  46 +++++
 arch/powerpc/Kconfig                   |  11 ++
 arch/powerpc/kernel/Makefile           |   1 +
 arch/powerpc/kernel/secvar-sysfs.c     | 248 +++++++++++++++++++++++++
 4 files changed, 306 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-secvar
 create mode 100644 arch/powerpc/kernel/secvar-sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
new file mode 100644
index 000000000000..911b89cc6957
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-secvar
@@ -0,0 +1,46 @@
+What:		/sys/firmware/secvar
+Date:		August 2019
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	This directory is created if the POWER firmware supports OS
+		secureboot, thereby secure variables. It exposes interface
+		for reading/writing the secure variables
+
+What:		/sys/firmware/secvar/vars
+Date:		August 2019
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	This directory lists all the secure variables that are supported
+		by the firmware.
+
+What:		/sys/firmware/secvar/backend
+Date:		August 2019
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	A string indicating which backend is in use by the firmware.
+		This determines the format of the variable and the accepted
+		format of variable updates.
+
+What:		/sys/firmware/secvar/vars/<variable name>
+Date:		August 2019
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	Each secure variable is represented as a directory named as
+		<variable_name>. The variable name is unique and is in ASCII
+		representation. The data and size can be determined by reading
+		their respective attribute files.
+
+What:		/sys/firmware/secvar/vars/<variable_name>/size
+Date:		August 2019
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	An integer representation of the size of the content of the
+		variable. In other words, it represents the size of the data.
+
+What:		/sys/firmware/secvar/vars/<variable_name>/data
+Date:		August 2019
+Contact:	Nayna Jain h<nayna@linux.ibm.com>
+Description:	A read-only file containing the value of the variable. The size
+		of the file represents the maximum size of the variable data.
+
+What:		/sys/firmware/secvar/vars/<variable_name>/update
+Date:		August 2019
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	A write-only file that is used to submit the new value for the
+		variable. The size of the file represents the maximum size of
+		the variable data that can be written.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c795039bdc73..cabc091f3fe1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -945,6 +945,17 @@ config PPC_SECURE_BOOT
 	  to enable OS secure boot on systems that have firmware support for
 	  it. If in doubt say N.
 
+config PPC_SECVAR_SYSFS
+	bool "Enable sysfs interface for POWER secure variables"
+	default y
+	depends on PPC_SECURE_BOOT
+	depends on SYSFS
+	help
+	  POWER secure variables are managed and controlled by firmware.
+	  These variables are exposed to userspace via sysfs to enable
+	  read/write operations on these variables. Say Y if you have
+	  secure boot enabled and want to expose variables to userspace.
+
 endmenu
 
 config ISA_DMA_API
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 3cf26427334f..b216e9f316ee 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -162,6 +162,7 @@ obj-y				+= ucall.o
 endif
 
 obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o ima_arch.o secvar-ops.o
+obj-$(CONFIG_PPC_SECVAR_SYSFS)	+= secvar-sysfs.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_prom_init.o := n
diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
new file mode 100644
index 000000000000..39345edbdecc
--- /dev/null
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 IBM Corporation <nayna@linux.ibm.com>
+ *
+ * This code exposes secure variables to user via sysfs
+ */
+
+#define pr_fmt(fmt) "secvar-sysfs: "fmt
+
+#include <linux/slab.h>
+#include <linux/compat.h>
+#include <linux/string.h>
+#include <linux/of.h>
+#include <asm/secvar.h>
+
+#define NAME_MAX_SIZE	   1024
+
+static struct kobject *secvar_kobj;
+static struct kset *secvar_kset;
+
+static ssize_t backend_show(struct kobject *kobj, struct kobj_attribute *attr,
+			    char *buf)
+{
+	ssize_t rc = 0;
+	struct device_node *node;
+	const char *compatible;
+
+	node = of_find_node_by_name(NULL, "secvar");
+	if (!of_device_is_available(node))
+		return -ENODEV;
+
+	rc = of_property_read_string(node, "compatible", &compatible);
+	if (rc)
+		return rc;
+
+	rc = sprintf(buf, "%s\n", compatible);
+
+	of_node_put(node);
+
+	return rc;
+}
+
+
+static ssize_t size_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	uint64_t dsize;
+	int rc;
+
+	rc = secvar_ops->get(kobj->name, strlen(kobj->name) + 1, NULL, &dsize);
+	if (rc) {
+		pr_err("Error retrieving %s variable size %d\n", kobj->name,
+		       rc);
+		return rc;
+	}
+
+	return sprintf(buf, "%llu\n", dsize);
+}
+
+static ssize_t data_read(struct file *filep, struct kobject *kobj,
+			 struct bin_attribute *attr, char *buf, loff_t off,
+			 size_t count)
+{
+	uint64_t dsize;
+	char *data;
+	int rc;
+
+	rc = secvar_ops->get(kobj->name, strlen(kobj->name) + 1, NULL, &dsize);
+	if (rc) {
+		pr_err("Error getting %s variable size %d\n", kobj->name, rc);
+		return rc;
+	}
+	pr_debug("dsize is %llu\n", dsize);
+
+	data = kzalloc(dsize, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	rc = secvar_ops->get(kobj->name, strlen(kobj->name) + 1, data, &dsize);
+	if (rc) {
+		pr_err("Error getting %s variable %d\n", kobj->name, rc);
+		goto data_fail;
+	}
+
+	rc = memory_read_from_buffer(buf, count, &off, data, dsize);
+
+data_fail:
+	kfree(data);
+	return rc;
+}
+
+static ssize_t update_write(struct file *filep, struct kobject *kobj,
+			    struct bin_attribute *attr, char *buf, loff_t off,
+			    size_t count)
+{
+	int rc;
+
+	pr_debug("count is %ld\n", count);
+	rc = secvar_ops->set(kobj->name, strlen(kobj->name) + 1, buf, count);
+	if (rc) {
+		pr_err("Error setting the %s variable %d\n", kobj->name, rc);
+		return rc;
+	}
+
+	return count;
+}
+
+static struct kobj_attribute backend_attr = __ATTR_RO(backend);
+
+static struct kobj_attribute size_attr = __ATTR_RO(size);
+
+static struct bin_attribute data_attr = __BIN_ATTR_RO(data, 0);
+
+static struct bin_attribute update_attr = __BIN_ATTR_WO(update, 0);
+
+static struct bin_attribute *secvar_bin_attrs[] = {
+	&data_attr,
+	&update_attr,
+	NULL,
+};
+
+static struct attribute *secvar_attrs[] = {
+	&size_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group secvar_attr_group = {
+	.attrs = secvar_attrs,
+	.bin_attrs = secvar_bin_attrs,
+};
+__ATTRIBUTE_GROUPS(secvar_attr);
+
+static struct kobj_type secvar_ktype = {
+	.sysfs_ops	= &kobj_sysfs_ops,
+	.default_groups = secvar_attr_groups,
+};
+
+static int update_kobj_size(void)
+{
+
+	struct device_node *node;
+	u64 varsize;
+	int rc = 0;
+
+	node = of_find_compatible_node(NULL, NULL, "ibm,edk2-compat-v1");
+	if (!of_device_is_available(node)) {
+		rc = -ENODEV;
+		goto out;
+	}
+
+	rc = of_property_read_u64(node, "max-var-size", &varsize);
+	if (rc)
+		goto out;
+
+	data_attr.size = varsize;
+	update_attr.size = varsize;
+
+out:
+	of_node_put(node);
+
+	return rc;
+}
+
+static int secvar_sysfs_load(void)
+{
+	char *name;
+	uint64_t namesize = 0;
+	struct kobject *kobj;
+	int rc;
+
+	name = kzalloc(NAME_MAX_SIZE, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	do {
+		rc = secvar_ops->get_next(name, &namesize, NAME_MAX_SIZE);
+		if (rc) {
+			if (rc != -ENOENT)
+				pr_err("error getting secvar from firmware %d\n",
+				       rc);
+			break;
+		}
+
+		kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
+		if (!kobj) {
+			rc = -ENOMEM;
+			break;
+		}
+
+		kobject_init(kobj, &secvar_ktype);
+
+		rc = kobject_add(kobj, &secvar_kset->kobj, "%s", name);
+		if (rc) {
+			pr_warn("kobject_add error %d for attribute: %s\n", rc,
+				name);
+			kobject_put(kobj);
+			kobj = NULL;
+		}
+
+		if (kobj)
+			kobject_uevent(kobj, KOBJ_ADD);
+
+	} while (!rc);
+
+	kfree(name);
+	return rc;
+}
+
+static int secvar_sysfs_init(void)
+{
+	int rc;
+
+	if (!secvar_ops) {
+		pr_warn("secvar: failed to retrieve secvar operations.\n");
+		return -ENODEV;
+	}
+
+	secvar_kobj = kobject_create_and_add("secvar", firmware_kobj);
+	if (!secvar_kobj) {
+		pr_err("secvar: Failed to create firmware kobj\n");
+		return -ENOMEM;
+	}
+
+	rc = sysfs_create_file(secvar_kobj, &backend_attr.attr);
+	if (rc) {
+		kobject_put(secvar_kobj);
+		return -ENOMEM;
+	}
+
+	secvar_kset = kset_create_and_add("vars", NULL, secvar_kobj);
+	if (!secvar_kset) {
+		pr_err("secvar: sysfs kobject registration failed.\n");
+		kobject_put(secvar_kobj);
+		return -ENOMEM;
+	}
+
+	rc = update_kobj_size();
+	if (rc) {
+		pr_err("Cannot read the size of the attribute\n");
+		return rc;
+	}
+
+	secvar_sysfs_load();
+
+	return 0;
+}
+
+late_initcall(secvar_sysfs_init);
-- 
2.20.1

