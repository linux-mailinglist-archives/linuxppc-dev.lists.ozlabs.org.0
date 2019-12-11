Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89411BBC2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 19:31:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y5B03gz8zDqv3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 05:31:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y21x19dvzDqHw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 03:09:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47Y21w5F9Hz99nS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 03:09:40 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47Y21w0CKJzB3y7; Thu, 12 Dec 2019 03:09:40 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47Y21t60wgzB3xy
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Dec 2019 03:09:38 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBG8KoC139325
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Dec 2019 11:09:36 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wt2kupfjj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Dec 2019 11:09:35 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Wed, 11 Dec 2019 16:09:31 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Dec 2019 16:09:29 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBBG9SPG56098860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Dec 2019 16:09:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B867A405B;
 Wed, 11 Dec 2019 16:09:28 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8293A405C;
 Wed, 11 Dec 2019 16:09:25 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.74.172])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Dec 2019 16:09:25 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v6 3/6] powerpc/fadump: reorganize /sys/kernel/fadump_* sysfs
 files
Date: Wed, 11 Dec 2019 21:39:07 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
References: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19121116-0028-0000-0000-000003C7992F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121116-0029-0000-0000-0000248ACF15
Message-Id: <20191211160910.21656-4-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_04:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912110136
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
 Documentation/ABI/testing/sysfs-kernel-fadump |  33 +++++
 arch/powerpc/kernel/fadump.c                  | 118 +++++++++++++-----
 2 files changed, 117 insertions(+), 34 deletions(-)
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
index ed59855430b9..23f15bfea512 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -36,6 +36,8 @@ static struct fw_dump fw_dump;
 
 static void __init fadump_reserve_crash_area(u64 base);
 
+struct kobject *fadump_kobj;
+
 #ifndef CONFIG_PRESERVE_FA_DUMP
 static DEFINE_MUTEX(fadump_mutex);
 struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0 };
@@ -1323,9 +1325,9 @@ static void fadump_invalidate_release_mem(void)
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
 
@@ -1350,23 +1352,33 @@ static ssize_t fadump_release_memory_store(struct kobject *kobj,
 	return count;
 }
 
-static ssize_t fadump_enabled_show(struct kobject *kobj,
-					struct kobj_attribute *attr,
-					char *buf)
+/* Release the reserved memory and disable the FADump */
+static void unregister_fadump(void)
+{
+	fadump_cleanup();
+	fadump_release_memory(fw_dump.reserve_dump_area_start,
+			      fw_dump.reserve_dump_area_size);
+	fw_dump.fadump_enabled = 0;
+	kobject_put(fadump_kobj);
+}
+
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
@@ -1418,15 +1430,17 @@ static int fadump_region_show(struct seq_file *m, void *private)
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
+ATTRIBUTE_GROUPS(fadump);
 
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
@@ -1453,10 +1462,51 @@ static void fadump_init_files(void)
 				" fadump_region\n");
 
 	if (fw_dump.dump_active) {
-		rc = sysfs_create_file(kernel_kobj, &fadump_release_attr.attr);
+		rc = sysfs_create_file(fadump_kobj, &release_attr.attr);
+		if (rc)
+			pr_err("unable to create release_mem sysfs file (%d)\n",
+			       rc);
+	}
+
+	rc = sysfs_create_groups(fadump_kobj, fadump_groups);
+	if (rc) {
+		pr_err("sysfs group creation failed (%d), unregistering FADump",
+		       rc);
+		unregister_fadump();
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
+	rc = compat_only_sysfs_link_entry_to_kobj(kernel_kobj, fadump_kobj,
+						  "enabled", "fadump_enabled");
+	if (rc) {
+		pr_err("unable to create fadump_enabled symlink (%d)", rc);
+		return;
+	}
+
+	rc = compat_only_sysfs_link_entry_to_kobj(kernel_kobj, fadump_kobj,
+						  "registered",
+						  "fadump_registered");
+	if (rc) {
+		pr_err("unable to create fadump_registered symlink (%d)", rc);
+		sysfs_remove_link(kernel_kobj, "fadump_enabled");
+		return;
+	}
+
+	if (fw_dump.dump_active) {
+		rc = compat_only_sysfs_link_entry_to_kobj(kernel_kobj,
+							  fadump_kobj,
+							  "release_mem",
+							  "fadump_release_mem");
 		if (rc)
-			printk(KERN_ERR "fadump: unable to create sysfs file"
-				" fadump_release_mem (%d)\n", rc);
+			pr_err("unable to create fadump_release_mem symlink (%d)",
+			       rc);
 	}
 	return;
 }
-- 
2.17.2

