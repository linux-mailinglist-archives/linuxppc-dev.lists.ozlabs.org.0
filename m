Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE02115083
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 13:42:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TsgJ13rbzDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 23:42:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TsGx1c62zDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:24:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47TsGw65VKz8swt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:24:56 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47TsGw4cFXz9sRQ; Fri,  6 Dec 2019 23:24:56 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 47TsGw05KRz9sRH
 for <linuxppc-dev@ozlabs.org>; Fri,  6 Dec 2019 23:24:55 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6CGtT2088517
 for <linuxppc-dev@ozlabs.org>; Fri, 6 Dec 2019 07:24:53 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wpvg2whte-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 06 Dec 2019 07:24:53 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Fri, 6 Dec 2019 12:24:51 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Dec 2019 12:24:48 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB6COlXQ2097652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2019 12:24:47 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F328C4C046;
 Fri,  6 Dec 2019 12:24:46 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C70D4C044;
 Fri,  6 Dec 2019 12:24:45 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.191])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Dec 2019 12:24:45 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 3/6] powerpc/fadump: reorganize /sys/kernel/fadump_* sysfs
 files
Date: Fri,  6 Dec 2019 17:54:31 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191206122434.29587-1-sourabhjain@linux.ibm.com>
References: <20191206122434.29587-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19120612-0028-0000-0000-000003C5F9B3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120612-0029-0000-0000-000024891F3F
Message-Id: <20191206122434.29587-4-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_03:2019-12-05,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=1 mlxscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912060105
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
 Documentation/ABI/testing/sysfs-kernel-fadump | 33 ++++++++++
 arch/powerpc/kernel/fadump.c                  | 66 ++++++++++++++-----
 2 files changed, 83 insertions(+), 16 deletions(-)
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
index ed59855430b9..41a3cda81791 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1418,13 +1418,16 @@ static int fadump_region_show(struct seq_file *m, void *private)
 	return 0;
 }
 
-static struct kobj_attribute fadump_release_attr = __ATTR(fadump_release_mem,
+struct kobject *fadump_kobj;
+EXPORT_SYMBOL_GPL(fadump_kobj);
+
+static struct kobj_attribute release_attr = __ATTR(release_mem,
 						0200, NULL,
 						fadump_release_memory_store);
-static struct kobj_attribute fadump_attr = __ATTR(fadump_enabled,
+static struct kobj_attribute enable_attr = __ATTR(enabled,
 						0444, fadump_enabled_show,
 						NULL);
-static struct kobj_attribute fadump_register_attr = __ATTR(fadump_registered,
+static struct kobj_attribute register_attr = __ATTR(registered,
 						0644, fadump_register_show,
 						fadump_register_store);
 
@@ -1435,16 +1438,11 @@ static void fadump_init_files(void)
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
@@ -1452,11 +1450,47 @@ static void fadump_init_files(void)
 		printk(KERN_ERR "fadump: unable to create debugfs file"
 				" fadump_region\n");
 
+	rc = sysfs_create_file(fadump_kobj, &enable_attr.attr);
+	if (rc)
+		pr_err("unable to create enabled sysfs file (%d)\n",
+		       rc);
+	rc = sysfs_create_file(fadump_kobj, &register_attr.attr);
+	if (rc)
+		pr_err("unable to create registered sysfs file (%d)\n",
+		       rc);
+	if (fw_dump.dump_active) {
+		rc = sysfs_create_file(fadump_kobj, &release_attr.attr);
+		if (rc)
+			pr_err("unable to create release_mem sysfs file (%d)\n",
+			       rc);
+	}
+
+	/* The FADump sysfs are moved from kernel_kobj to fadump_kobj need to
+	 * create symlink at old location to maintain backward compatibility.
+	 *
+	 *      - fadump_enabled -> fadump/enabled
+	 *      - fadump_registered -> fadump/registered
+	 *      - fadump_release_mem -> fadump/release_mem
+	 */
+	rc = create_sysfs_symlink_entry_to_kobj(kernel_kobj, fadump_kobj,
+						"enabled", "fadump_enabled");
+	if (rc)
+		pr_err("unable to create fadump_enabled symlink (%d)\n", rc);
+
+	rc = create_sysfs_symlink_entry_to_kobj(kernel_kobj, fadump_kobj,
+						"registered",
+						"fadump_registered");
+	if (rc)
+		pr_err("unable to create fadump_registered symlink (%d)\n", rc);
+
 	if (fw_dump.dump_active) {
-		rc = sysfs_create_file(kernel_kobj, &fadump_release_attr.attr);
+		rc = create_sysfs_symlink_entry_to_kobj(kernel_kobj,
+							fadump_kobj,
+							"release_mem",
+							"fadump_release_mem");
 		if (rc)
-			printk(KERN_ERR "fadump: unable to create sysfs file"
-				" fadump_release_mem (%d)\n", rc);
+			pr_err("unable to create fadump_release_mem symlink (%d)\n",
+			       rc);
 	}
 	return;
 }
-- 
2.17.2

