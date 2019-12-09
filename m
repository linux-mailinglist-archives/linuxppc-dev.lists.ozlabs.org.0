Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9BE1165FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 06:06:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WWPP1PC7zDqNx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 16:06:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WWDn0wklzDqMl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 15:58:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47WWDn0BKQz8t70
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 15:58:49 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47WWDm6thZz9sR0; Mon,  9 Dec 2019 15:58:48 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47WWDm2W4Sz9sPK
 for <linuxppc-dev@ozlabs.org>; Mon,  9 Dec 2019 15:58:48 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB94up8P055784
 for <linuxppc-dev@ozlabs.org>; Sun, 8 Dec 2019 23:58:46 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wrt9ej5m4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sun, 08 Dec 2019 23:58:45 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Mon, 9 Dec 2019 04:58:44 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Dec 2019 04:58:40 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB94wdHY1966414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Dec 2019 04:58:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39C4FA4053;
 Mon,  9 Dec 2019 04:58:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91B70A404D;
 Mon,  9 Dec 2019 04:58:37 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.249])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Dec 2019 04:58:37 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v5 3/6] powerpc/fadump: reorganize /sys/kernel/fadump_* sysfs
 files
Date: Mon,  9 Dec 2019 10:28:23 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191209045826.30076-1-sourabhjain@linux.ibm.com>
References: <20191209045826.30076-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19120904-0020-0000-0000-00000395B174
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120904-0021-0000-0000-000021ECEA31
Message-Id: <20191209045826.30076-4-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_01:2019-12-09,2019-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090042
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
Cc: corbet@lwn.net, mahesh@linux.vnet.ibm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, gregkh@linuxfoundation.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As the number of FADump sysfs files increases it is hard to manage all of
them inside /sys/kernel directory. It's better to have all the FADump
related sysfs files in a dedicated directory /sys/kernel/fadump. But in
order to maintain backward compatibility a symlink has been added for every
sysfs that has moved to new location.

As the FADump sysfs files are now part of a dedicated directory there is no
need to prefix their name with fadump_, hence sysfs file names are also
updated. For example fadump_enabled sysfs file is now referred as enabled.

Also consolidate ABI documentation for all the FADump sysfs files in a
single file Documentation/ABI/testing/sysfs-kernel-fadump.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-kernel-fadump | 33 +++++++
 arch/powerpc/kernel/fadump.c                  | 95 ++++++++++++-------
 2 files changed, 94 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
new file mode 100644
index 000000000000..5d988b919e81
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump
@@ -0,0 +1,33 @@
+What:		/sys/kernel/fadump/*
+Date:		Dec 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:
+		The /sys/kernel/fadump/* is a collection of FADump sysfs
+		file provide information about the configuration status
+		of Firmware Assisted Dump (FADump).
+
+What:		/sys/kernel/fadump/enabled
+Date:		Dec 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read only
+		Primarily used to identify whether the FADump is enabled in
+		the kernel or not.
+User:		Kdump service
+
+What:		/sys/kernel/fadump/registered
+Date:		Dec 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read/write
+		Helps to control the dump collect feature from userspace.
+		Setting 1 to this file enables the system to collect the
+		dump and 0 to disable it.
+User:		Kdump service
+
+What:		/sys/kernel/fadump/release_mem
+Date:		Dec 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	write only
+		This is a special sysfs file and only available when
+		the system is booted to capture the vmcore using FADump.
+		It is used to release the memory reserved by FADump to
+		save the crash dump.
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index ed59855430b9..35ecb51edc50 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -44,6 +44,13 @@ struct fadump_mrange_info reserved_mrange_info = { "reserved", NULL, 0, 0, 0 };
 #ifdef CONFIG_CMA
 static struct cma *fadump_cma;
 
+#define CREATE_SYMLINK(target, symlink_name) do {\
+	rc = compat_only_sysfs_link_entry_to_kobj(kernel_kobj, fadump_kobj, \
+						  target, symlink_name); \
+	if (rc) \
+		pr_err("unable to create %s symlink (%d)", symlink_name, rc); \
+} while (0)
+
 /*
  * fadump_cma_init() - Initialize CMA area from a fadump reserved memory
  *
@@ -1323,9 +1330,9 @@ static void fadump_invalidate_release_mem(void)
 	fw_dump.ops->fadump_init_mem_struct(&fw_dump);
 }
 
-static ssize_t fadump_release_memory_store(struct kobject *kobj,
-					struct kobj_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t release_mem_store(struct kobject *kobj,
+				 struct kobj_attribute *attr,
+				 const char *buf, size_t count)
 {
 	int input = -1;
 
@@ -1350,23 +1357,23 @@ static ssize_t fadump_release_memory_store(struct kobject *kobj,
 	return count;
 }
 
-static ssize_t fadump_enabled_show(struct kobject *kobj,
-					struct kobj_attribute *attr,
-					char *buf)
+static ssize_t enabled_show(struct kobject *kobj,
+			    struct kobj_attribute *attr,
+			    char *buf)
 {
 	return sprintf(buf, "%d\n", fw_dump.fadump_enabled);
 }
 
-static ssize_t fadump_register_show(struct kobject *kobj,
-					struct kobj_attribute *attr,
-					char *buf)
+static ssize_t registered_show(struct kobject *kobj,
+			       struct kobj_attribute *attr,
+			       char *buf)
 {
 	return sprintf(buf, "%d\n", fw_dump.dump_registered);
 }
 
-static ssize_t fadump_register_store(struct kobject *kobj,
-					struct kobj_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t registered_store(struct kobject *kobj,
+				struct kobj_attribute *attr,
+				const char *buf, size_t count)
 {
 	int ret = 0;
 	int input = -1;
@@ -1418,15 +1425,22 @@ static int fadump_region_show(struct seq_file *m, void *private)
 	return 0;
 }
 
-static struct kobj_attribute fadump_release_attr = __ATTR(fadump_release_mem,
-						0200, NULL,
-						fadump_release_memory_store);
-static struct kobj_attribute fadump_attr = __ATTR(fadump_enabled,
-						0444, fadump_enabled_show,
-						NULL);
-static struct kobj_attribute fadump_register_attr = __ATTR(fadump_registered,
-						0644, fadump_register_show,
-						fadump_register_store);
+struct kobject *fadump_kobj;
+EXPORT_SYMBOL_GPL(fadump_kobj);
+
+static struct kobj_attribute release_attr = __ATTR_WO(release_mem);
+static struct kobj_attribute enable_attr = __ATTR_RO(enabled);
+static struct kobj_attribute register_attr = __ATTR_RW(registered);
+
+static struct attribute *fadump_attrs[] = {
+	&enable_attr.attr,
+	&register_attr.attr,
+	NULL,
+};
+
+static struct attribute_group fadump_group = {
+	.attrs = fadump_attrs,
+};
 
 DEFINE_SHOW_ATTRIBUTE(fadump_region);
 
@@ -1435,16 +1449,11 @@ static void fadump_init_files(void)
 	struct dentry *debugfs_file;
 	int rc = 0;
 
-	rc = sysfs_create_file(kernel_kobj, &fadump_attr.attr);
-	if (rc)
-		printk(KERN_ERR "fadump: unable to create sysfs file"
-			" fadump_enabled (%d)\n", rc);
-
-	rc = sysfs_create_file(kernel_kobj, &fadump_register_attr.attr);
-	if (rc)
-		printk(KERN_ERR "fadump: unable to create sysfs file"
-			" fadump_registered (%d)\n", rc);
-
+	fadump_kobj = kobject_create_and_add("fadump", kernel_kobj);
+	if (!fadump_kobj) {
+		pr_err("failed to create fadump kobject\n");
+		return;
+	}
 	debugfs_file = debugfs_create_file("fadump_region", 0444,
 					powerpc_debugfs_root, NULL,
 					&fadump_region_fops);
@@ -1453,11 +1462,29 @@ static void fadump_init_files(void)
 				" fadump_region\n");
 
 	if (fw_dump.dump_active) {
-		rc = sysfs_create_file(kernel_kobj, &fadump_release_attr.attr);
+		rc = sysfs_create_file(fadump_kobj, &release_attr.attr);
 		if (rc)
-			printk(KERN_ERR "fadump: unable to create sysfs file"
-				" fadump_release_mem (%d)\n", rc);
+			pr_err("unable to create release_mem sysfs file (%d)\n",
+			       rc);
 	}
+
+	rc = sysfs_create_group(fadump_kobj, &fadump_group);
+	if (rc) {
+		pr_err("sysfs group creation failed (%d)", rc);
+		return;
+	}
+
+	/* The FADump sysfs are moved from kernel_kobj to fadump_kobj need to
+	 * create symlink at old location to maintain backward compatibility.
+	 *
+	 *      - fadump_enabled -> fadump/enabled
+	 *      - fadump_registered -> fadump/registered
+	 *      - fadump_release_mem -> fadump/release_mem
+	 */
+	CREATE_SYMLINK("enabled", "fadump_enabled");
+	CREATE_SYMLINK("registered", "fadump_registered");
+	if (fw_dump.dump_active)
+		CREATE_SYMLINK("release_mem", "fadump_release_mem");
 	return;
 }
 
-- 
2.17.2

