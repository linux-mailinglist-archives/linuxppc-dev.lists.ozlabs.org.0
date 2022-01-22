Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CB54968FB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 01:59:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgdDS3vclz3cDN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 11:59:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kqAK3Bl/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kqAK3Bl/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgdB73tZdz2xDM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 11:57:03 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20M0JshU022408; 
 Sat, 22 Jan 2022 00:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nh6umd63qUzlSvRT/ybRdDx08XVhgaa35SL8UEjjSo8=;
 b=kqAK3Bl/6nFIGHGy3YKsbQV1fY6waXn1XIfZLo6AqMvzkrzwLYVg4RTMnd1QsjKDQjtl
 ZKHeYpQu1kaPaq2gQCRS2OiI9lBk+XHGYmtZPSH2FzhqSWkn4rWLggOuEoi9D1Iqruye
 QYgESJLi2y514JzvPnwi/kYnp1H0c9uQKbJ0iAg7pbahVY8cIyPPWjMSewMMMVeOac35
 8bqAEhu4jYBb7I+TkMezl2yNOafgIGzqoDftg52PlbZ9yeXYHdgMu4aw2GoQ0bM6MUNv
 WS3FOXs5lwo4GSzKow3mT3Op45Mh6uPgVMsY82LHGHnyAD0Yacr4eIWOGf6cnZ1GpQUs nw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr79s0dvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jan 2022 00:56:57 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20M0Y5fC028235;
 Sat, 22 Jan 2022 00:56:55 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3dqj380nv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jan 2022 00:56:55 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20M0uqfH46792980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Jan 2022 00:56:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E31A3A4040;
 Sat, 22 Jan 2022 00:56:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86756A404D;
 Sat, 22 Jan 2022 00:56:49 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com.com (unknown
 [9.211.59.92]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 22 Jan 2022 00:56:49 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/2] pseries: define sysfs interface to expose PKS
 variables
Date: Fri, 21 Jan 2022 19:56:37 -0500
Message-Id: <20220122005637.28199-3-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220122005637.28199-1-nayna@linux.ibm.com>
References: <20220122005637.28199-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0Fzu8-wiAN7YBXV8W_rWBssgqqd-dC92
X-Proofpoint-ORIG-GUID: 0Fzu8-wiAN7YBXV8W_rWBssgqqd-dC92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_10,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201220001
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Douglas Miller <dougmill@linux.vnet.ibm.com>,
 Greg KH <gregkh@linuxfoundation.org>, George Wilson <gcwilson@linux.ibm.com>,
 gjoyce@ibm.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerVM guest secure boot intend to use Platform Keystore(PKS) for the
purpose of storing public keys to verify digital signature.

Define sysfs interface to expose PKS variables to userspace to allow
read/write/add/delete operations. Each variable is shown as a read/write
attribute file. The size of the file represents the size of the current
content of the variable.

create_var and delete_var attribute files are always present which allow
users to create/delete variables. These are write only attributes.The
design has tried to be compliant with sysfs semantic to represent single
value per attribute. Thus, rather than mapping a complete data structure
representation to create_var, it only accepts a single formatted string
to create an empty variable.

The sysfs interface is designed such as to expose PKS configuration
properties, operating system variables and firmware variables.
Current version exposes configuration and operating system variables.
The support for exposing firmware variables will be added in the future
version.

Example of pksvar sysfs interface:

# cd /sys/firmware/pksvar/
# ls
config  os

# cd config

# ls -ltrh
total 0
-r--r--r-- 1 root root 64K Jan 21 17:55 version
-r--r--r-- 1 root root 64K Jan 21 17:55 used_space
-r--r--r-- 1 root root 64K Jan 21 17:55 total_size
-r--r--r-- 1 root root 64K Jan 21 17:55 supported_policies
-r--r--r-- 1 root root 64K Jan 21 17:55 max_object_size
-r--r--r-- 1 root root 64K Jan 21 17:55 max_object_label_size
-r--r--r-- 1 root root 64K Jan 21 17:55 flags

# cd os

# ls -ltrh
total 0
-rw------- 1 root root 104 Jan 21 17:56 var4
-rw------- 1 root root 104 Jan 21 17:56 var3
-rw------- 1 root root 831 Jan 21 17:56 GLOBAL_PK
-rw------- 1 root root 831 Jan 21 17:56 GLOBAL_KEK
-rw------- 1 root root  76 Jan 21 17:56 GLOBAL_dbx
-rw------- 1 root root 831 Jan 21 17:56 GLOBAL_db
--w------- 1 root root 64K Jan 21 17:56 delete_var
--w------- 1 root root 64K Jan 21 17:56 create_var

1. Read variable

# hexdump -C GLOBAL_db
00000000  00 00 00 00 a1 59 c0 a5  e4 94 a7 4a 87 b5 ab 15  |.....Y.....J....|
00000010  5c 2b f0 72 3f 03 00 00  00 00 00 00 23 03 00 00  |\+.r?.......#...|
....
00000330  02 a8 e8 ed 0f 20 60 3f  40 04 7c a8 91 21 37 eb  |..... `?@.|..!7.|
00000340  f3 f1 4e                                          |..N|
00000343

2. Write variable

cat /tmp/data.bin > <variable_name>

3. Create variable

# echo "var1" > create_var
# ls -ltrh
total 0
-rw------- 1 root root 104 Jan 21 17:56 var4
-rw------- 1 root root 104 Jan 21 17:56 var3
-rw------- 1 root root 831 Jan 21 17:56 GLOBAL_PK
-rw------- 1 root root 831 Jan 21 17:56 GLOBAL_KEK
-rw------- 1 root root  76 Jan 21 17:56 GLOBAL_dbx
-rw------- 1 root root 831 Jan 21 17:56 GLOBAL_db
--w------- 1 root root 64K Jan 21 17:56 delete_var
--w------- 1 root root 64K Jan 21 17:57 create_var
-rw------- 1 root root   0 Jan 21 17:57 var1.tmp

Current design creates a zero size temporary variable. This implies
it is not yet persisted to PKS. Only once data is written to newly
created temporary variable and if it is successfully stored in the
PKS, that the variable is permanent. The temporary variable will get
removed on reboot. The code currently doesn't remove .tmp suffix
immediately when persisted. The future version will fix this.

To avoid the additional .tmp semantic, alternative option is to consider
any zero size variable as temporary variable. This option is under
evaluation. This would avoid any runtime sysfs magic to replace .tmp
variable with real variable.

Also, the formatted string to pass to create_var will have following
format in the future version:
<variable_name>:<comma-separated-policy strings>

4. Delete variable
# echo "var3" > delete_var
# ls -ltrh
total 0
-rw------- 1 root root 104 Jan 21 17:56 var4
-rw------- 1 root root 831 Jan 21 17:56 GLOBAL_PK
-rw------- 1 root root 831 Jan 21 17:56 GLOBAL_KEK
-rw------- 1 root root  76 Jan 21 17:56 GLOBAL_dbx
-rw------- 1 root root 831 Jan 21 17:56 GLOBAL_db
--w------- 1 root root 64K Jan 21 17:57 create_var
-rw------- 1 root root   0 Jan 21 17:57 var1.tmp
--w------- 1 root root 64K Jan 21 17:58 delete_var

The var3 file is removed at runtime, if variable is successfully
removed from the PKS storage.

NOTE: We are evaluating two design for userspace interface: using the
sysfs or defining a new filesystem based. Any feedback on this sysfs based
approach would be highly appreciated. We have tried to follow one value
per attribute semantic. If that or any other semantics aren't followed
properly, please let us know.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-pksvar        |  77 ++++
 arch/powerpc/platforms/pseries/Kconfig        |   7 +
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 arch/powerpc/platforms/pseries/pksvar-sysfs.c | 356 ++++++++++++++++++
 4 files changed, 441 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-pksvar
 create mode 100644 arch/powerpc/platforms/pseries/pksvar-sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-pksvar b/Documentation/ABI/testing/sysfs-pksvar
new file mode 100644
index 000000000000..fe5327f5bd70
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-pksvar
@@ -0,0 +1,77 @@
+What:		/sys/firmware/pksvar
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	This directory is created if the POWER firmware supports
+		Platform Keystore (PKS). It exposes interface for reading/writing
+		variables which are persisted in PKS.
+
+What:		/sys/firmware/pksvar/config
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	This directory lists the configuration properties of Platform
+		Keystore.
+
+What:		/sys/firmware/pksvar/os
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	This directory lists all the variables owned by operating system
+		users and stored in Platform Keystore.
+
+What:		/sys/firmware/pksvar/config/version
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	A value indicating version of Firmware Platform Keystore.
+
+What:		/sys/firmware/pksvar/config/used_space
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	The value specifying amount of space used in Platform Keystore.
+
+What:		/sys/firmware/pksvar/config/total_size
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	The value specifying total size of Platform Keystore.
+
+What:		/sys/firmware/pksvar/config/supported_policies
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	The value specifying policies supported by Platform Keystore semantics.
+
+What:		/sys/firmware/pksvar/config/max_object_size
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	The value specifies the maximum object size that can be supported.
+
+What:		/sys/firmware/pksvar/config/max_object_label_size
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:    The value specifies the maximum object label size that is supported.
+
+What:		/sys/firmware/pksvar/config/flags
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:    The value specifies the flags supported by Platform Keystore.
+
+What:		/sys/firmware/pksvar/os/<attribute_file>
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:    A read-write file indicating the variable stored in the Platform Keystore.
+		The size of the file represents the size of the actual data stored for
+		this variable in PKS.
+
+What:		/sys/firmware/pksvar/os/create_var
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:    A write only file used to create new variables. The user should write
+		formatted string containing name to this file. It creates at runtime
+		zero size read-write <variable-name>.tmp temporary attribute file. The
+		temporary variable name is not persisted to Platform Keystore until
+		data is updated to it.
+
+What:		/sys/firmware/pksvar/os/delete_var
+Date:		August 2022
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:    A write only file used to delete existing variable. The user should
+		write variable name to this file. If the variable is successfully
+		deleted from Platform Keystore, the corresponding attribute file is
+		also removed at runtime.
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 32d0df84e611..9310876d201d 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -157,6 +157,13 @@ config PSERIES_PKS
 	  this config to enable operating system interface to hypervisor to
 	  access this space.
 
+config PSERIES_PKS_SYSFS
+	depends on PSERIES_PKS
+	tristate "Support for sysfs interface the Platform Key Storage"
+	help
+	  Enable sysfs based user interace to add/delete/modify variables
+	  stored in Platform Keystore.
+
 config PAPR_SCM
 	depends on PPC_PSERIES && MEMORY_HOTPLUG && LIBNVDIMM
 	tristate "Support for the PAPR Storage Class Memory interface"
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 83eb665a742f..27f9aafbd08b 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -34,3 +34,4 @@ obj-$(CONFIG_PPC_VAS)		+= vas.o
 
 obj-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+= cc_platform.o
 obj-$(CONFIG_PSERIES_PKS)      += pks.o
+obj-$(CONFIG_PSERIES_PKS_SYSFS) += pksvar-sysfs.o
diff --git a/arch/powerpc/platforms/pseries/pksvar-sysfs.c b/arch/powerpc/platforms/pseries/pksvar-sysfs.c
new file mode 100644
index 000000000000..2e53daaf6e9f
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/pksvar-sysfs.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 IBM Corporation <nayna@linux.ibm.com>
+ *
+ * This code exposes variables stored in Platform Keystore via sysfs
+ */
+
+#define pr_fmt(fmt) "pksvar-sysfs: " fmt
+
+#include <linux/slab.h>
+#include <linux/compat.h>
+#include <linux/string.h>
+#include <linux/of.h>
+#include <asm/pks.h>
+
+static struct kobject *pks_kobj;
+static struct kobject *prop_kobj;
+static struct kobject *os_kobj;
+
+static struct pks_config *config;
+
+struct osvar_sysfs_attr {
+	struct bin_attribute bin_attr;
+	struct list_head node;
+};
+
+static LIST_HEAD(osvar_sysfs_list);
+
+
+static ssize_t osvar_sysfs_read(struct file *file, struct kobject *kobj,
+				struct bin_attribute *bin_attr, char *buf,
+				loff_t off, size_t count)
+{
+	struct pks_var var;
+	char *out;
+	u32 outlen;
+	int rc;
+
+	var.name = (char *)bin_attr->attr.name;
+	var.namelen = strlen(var.name) + 1;
+	var.prefix = NULL;
+	rc = pks_read_var(&var);
+	if (rc) {
+		pr_err("Error reading object %d\n", rc);
+		return rc;
+	}
+
+	outlen = sizeof(var.policy) + var.datalen;
+	out = kzalloc(outlen, GFP_KERNEL);
+	memcpy(out, &var.policy, sizeof(var.policy));
+	memcpy(out + sizeof(var.policy), var.data, var.datalen);
+
+	count = outlen;
+	memcpy(buf, out, outlen);
+
+	kfree(out);
+	return count;
+}
+
+static ssize_t osvar_sysfs_write(struct file *file, struct kobject *kobj,
+				 struct bin_attribute *bin_attr, char *buf,
+				 loff_t off, size_t count)
+{
+	struct pks_var *var = NULL;
+	int rc = 0;
+	char *p;
+	char *name = (char *)bin_attr->attr.name;
+	struct osvar_sysfs_attr *osvar_sysfs = NULL;
+
+	list_for_each_entry(osvar_sysfs, &osvar_sysfs_list, node) {
+		if (strncmp(name, osvar_sysfs->bin_attr.attr.name,
+			    strlen(name)) == 0) {
+			var = osvar_sysfs->bin_attr.private;
+			break;
+		}
+	}
+
+	p = strsep(&name, ".");
+
+	var->datalen = count;
+	var->data = kzalloc(count, GFP_KERNEL);
+	if (!var->data)
+		return -ENOMEM;
+
+	memcpy(var->data, buf, count);
+	var->name = p;
+	var->namelen = strlen(p) + 1;
+
+	pr_info("var %s of length %d to be written\n", var->name, var->namelen);
+	var->prefix = NULL;
+	rc = pks_update_signed_var(*var);
+
+	if (rc) {
+		pr_err(" write failed with rc is %d\n", rc);
+		var->datalen = 0;
+		count = rc;
+		goto err;
+	}
+
+err:
+	kfree(var->data);
+	return count;
+}
+
+
+
+static ssize_t version_show(struct kobject *kobj, struct kobj_attribute *attr,
+			    char *buf)
+{
+	return sprintf(buf, "%d\n", config->version);
+}
+
+static ssize_t flags_show(struct kobject *kobj, struct kobj_attribute *attr,
+			  char *buf)
+{
+	return sprintf(buf, "%02x\n", config->flags);
+}
+
+static ssize_t max_object_label_size_show(struct kobject *kobj,
+					  struct kobj_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%u\n", config->maxobjlabelsize);
+}
+
+static ssize_t max_object_size_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%u\n", config->maxobjsize);
+}
+
+static ssize_t total_size_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%u\n", config->totalsize);
+}
+
+static ssize_t used_space_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%u\n", config->usedspace);
+}
+
+static ssize_t supported_policies_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%u\n", config->supportedpolicies);
+}
+
+static ssize_t create_var_store(struct kobject *kobj,
+				struct kobj_attribute *attr,
+				const char *buf, size_t count)
+{
+	int rc;
+	struct pks_var *var;
+	char *suffix = ".tmp";
+	char *name;
+	u16 namelen = 0;
+	struct osvar_sysfs_attr *osvar_sysfs = NULL;
+
+	namelen = count + strlen(suffix);
+	name = kzalloc(namelen, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+	memcpy(name, buf, count-1);
+	memcpy(name + (count-1), suffix, strlen(suffix));
+	name[namelen] = '\0';
+
+	pr_debug("var %s of length %d to be added\n", name, namelen);
+
+	osvar_sysfs = kzalloc(sizeof(struct osvar_sysfs_attr), GFP_KERNEL);
+	if (!osvar_sysfs) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	var = kzalloc(sizeof(struct pks_var), GFP_KERNEL);
+
+	if (!var) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	var->name = name;
+	var->namelen = namelen;
+	var->prefix = NULL;
+	var->policy = 0;
+
+	sysfs_bin_attr_init(&osvar_sysfs->bin_attr);
+	osvar_sysfs->bin_attr.private = var;
+	osvar_sysfs->bin_attr.attr.name = name;
+	osvar_sysfs->bin_attr.attr.mode = 0600;
+	osvar_sysfs->bin_attr.size = 0;
+	osvar_sysfs->bin_attr.read = osvar_sysfs_read;
+	osvar_sysfs->bin_attr.write = osvar_sysfs_write;
+
+	rc = sysfs_create_bin_file(os_kobj,
+			&osvar_sysfs->bin_attr);
+	if (rc)
+		goto err;
+
+	list_add_tail(&osvar_sysfs->node, &osvar_sysfs_list);
+	rc = count;
+err:
+	return rc;
+}
+
+static ssize_t delete_var_store(struct kobject *kobj,
+				struct kobj_attribute *attr,
+				const char *buf, size_t count)
+{
+	int rc;
+	struct pks_var_name vname;
+	struct osvar_sysfs_attr *osvar_sysfs = NULL;
+
+	vname.name = kzalloc(count, GFP_KERNEL);
+	if (!vname.name)
+		return -ENOMEM;
+
+	memcpy(vname.name, buf, count-1);
+	vname.name[count] = '\0';
+	vname.namelen = count;
+
+	pr_debug("var %s of length %lu to be deleted\n", buf, count);
+
+	rc = pks_remove_var(NULL, vname);
+
+	if (!rc) {
+		list_for_each_entry(osvar_sysfs, &osvar_sysfs_list, node) {
+			if (strncmp(vname.name, osvar_sysfs->bin_attr.attr.name,
+				    strlen(vname.name)) == 0) {
+				list_del(&osvar_sysfs->node);
+				sysfs_remove_bin_file(os_kobj, &osvar_sysfs->bin_attr);
+				break;
+			}
+		}
+		rc = count;
+	}
+
+	return rc;
+}
+
+static struct kobj_attribute version_attr = __ATTR_RO(version);
+static struct kobj_attribute flags_attr = __ATTR_RO(flags);
+static struct kobj_attribute max_object_label_size_attr = __ATTR_RO(max_object_label_size);
+static struct kobj_attribute max_object_size_attr = __ATTR_RO(max_object_size);
+static struct kobj_attribute total_size_attr = __ATTR_RO(total_size);
+static struct kobj_attribute used_space_attr = __ATTR_RO(used_space);
+static struct kobj_attribute supported_policies_attr = __ATTR_RO(supported_policies);
+static struct kobj_attribute create_var_attr = __ATTR_WO(create_var);
+static struct kobj_attribute delete_var_attr = __ATTR_WO(delete_var);
+
+static int __init pks_sysfs_prop_load(void)
+{
+	int rc;
+
+	config = pks_get_config();
+	if (!config)
+		return -ENODEV;
+
+	rc = sysfs_create_file(prop_kobj, &version_attr.attr);
+	rc = sysfs_create_file(prop_kobj, &flags_attr.attr);
+	rc = sysfs_create_file(prop_kobj, &max_object_label_size_attr.attr);
+	rc = sysfs_create_file(prop_kobj, &max_object_size_attr.attr);
+	rc = sysfs_create_file(prop_kobj, &total_size_attr.attr);
+	rc = sysfs_create_file(prop_kobj, &used_space_attr.attr);
+	rc = sysfs_create_file(prop_kobj, &supported_policies_attr.attr);
+
+	return 0;
+}
+
+static int __init pks_sysfs_os_load(void)
+{
+	struct osvar_sysfs_attr *osvar_sysfs = NULL;
+	struct pks_var_name_list namelist;
+	struct pks_var *var;
+	int rc;
+	int i;
+
+	rc = sysfs_create_file(os_kobj, &create_var_attr.attr);
+	rc = sysfs_create_file(os_kobj, &delete_var_attr.attr);
+	rc = pks_get_var_ids_for_type(NULL, &namelist);
+	if (rc)
+		return rc;
+
+	for (i = 0; i < namelist.varcount; i++) {
+		var = kzalloc(sizeof(struct pks_var), GFP_KERNEL);
+		var->name = namelist.varlist[i].name;
+		var->namelen = namelist.varlist[i].namelen;
+		var->prefix = NULL;
+		rc = pks_read_var(var);
+		if (rc) {
+			pr_err("Error %d reading object %s\n", rc, var->name);
+			continue;
+		}
+
+		osvar_sysfs = kzalloc(sizeof(struct osvar_sysfs_attr), GFP_KERNEL);
+		if (!osvar_sysfs) {
+			rc = -ENOMEM;
+			break;
+		}
+
+		sysfs_bin_attr_init(&osvar_sysfs->bin_attr);
+		osvar_sysfs->bin_attr.private = var;
+		osvar_sysfs->bin_attr.attr.name = namelist.varlist[i].name;
+		osvar_sysfs->bin_attr.attr.mode = 0600;
+		osvar_sysfs->bin_attr.size = var->datalen;
+		osvar_sysfs->bin_attr.read = osvar_sysfs_read;
+		osvar_sysfs->bin_attr.write = osvar_sysfs_write;
+
+		rc = sysfs_create_bin_file(os_kobj,
+				&osvar_sysfs->bin_attr);
+
+		if (rc)
+			continue;
+
+		list_add_tail(&osvar_sysfs->node, &osvar_sysfs_list);
+	}
+
+	return rc;
+}
+
+static int pks_sysfs_init(void)
+{
+	int rc;
+
+	pks_kobj = kobject_create_and_add("pksvar", firmware_kobj);
+	if (!pks_kobj) {
+		pr_err("pksvar: Failed to create pks kobj\n");
+		return -ENOMEM;
+	}
+
+	prop_kobj = kobject_create_and_add("config", pks_kobj);
+	if (!prop_kobj) {
+		pr_err("secvar: config kobject registration failed.\n");
+		kobject_put(pks_kobj);
+		return -ENOMEM;
+	}
+
+	rc = pks_sysfs_prop_load();
+	if (rc)
+		return rc;
+
+	os_kobj = kobject_create_and_add("os", pks_kobj);
+	if (!os_kobj) {
+		pr_err("pksvar: os kobject registration failed.\n");
+		kobject_put(os_kobj);
+		return -ENOMEM;
+	}
+
+	rc = pks_sysfs_os_load();
+	if (rc)
+		return rc;
+
+	return 0;
+}
+late_initcall(pks_sysfs_init);
-- 
2.27.0

