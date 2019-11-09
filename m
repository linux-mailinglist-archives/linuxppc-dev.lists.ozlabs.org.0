Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA95CF5F28
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 13:40:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479Gv35VtLzF5Z0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 23:40:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479GXn1MlDzF271
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 23:24:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 479GXm2lPwz8t4P
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 23:24:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 479GXl4GXNz9sR7; Sat,  9 Nov 2019 23:24:23 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 479GXk5HHQz9sR3
 for <linuxppc-dev@ozlabs.org>; Sat,  9 Nov 2019 23:24:22 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA9C6d0J015635
 for <linuxppc-dev@ozlabs.org>; Sat, 9 Nov 2019 07:24:21 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w5rngq3vj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sat, 09 Nov 2019 07:24:20 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Sat, 9 Nov 2019 12:24:13 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 9 Nov 2019 12:24:09 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA9CO8fR27459614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 9 Nov 2019 12:24:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06840A4053;
 Sat,  9 Nov 2019 12:24:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED43BA404D;
 Sat,  9 Nov 2019 12:24:05 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.73.97])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  9 Nov 2019 12:24:05 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 4/4] powerpc/fadump: sysfs for fadump memory reservation
Date: Sat,  9 Nov 2019 17:53:39 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191109122339.20484-1-sourabhjain@linux.ibm.com>
References: <20191109122339.20484-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19110912-0028-0000-0000-000003B46547
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110912-0029-0000-0000-0000247768F5
Message-Id: <20191109122339.20484-5-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-09_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911090131
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
 linuxppc-dev@ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a sys interface to allow querying the memory reserved by FADump for
saving the crash dump.

Also added Documentation/ABI for the new sysfs file.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-kernel-fadump    |  7 +++++++
 Documentation/powerpc/firmware-assisted-dump.rst |  5 +++++
 arch/powerpc/kernel/fadump.c                     | 15 +++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
index a77f1a5ba389..c1d87c787b9a 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump
@@ -39,3 +39,10 @@ Description:	write only
 		The sysfs file is available when the system is booted to
 		collect the dump on OPAL based machine. It used to release
 		the memory used to collect the opalcore.
+
+What:		/sys/kernel/fadump/mem_reserved
+Date:		Nov 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read only
+		Provide information about the amount of memory reserved by
+		FADump to save the crash dump in bytes.
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index fc7b06408cea..01c3c9461cd5 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -268,6 +268,11 @@ Here is the list of files under kernel sysfs:
     be handled and vmcore will not be captured. This interface can be
     easily integrated with kdump service start/stop.
 
+ /sys/kernel/fadump/mem_reserved
+
+   This is used to display the memory reserved by FADump for saving the
+   crash dump.
+
  /sys/kernel/fadump_release_mem
     This file is available only when FADump is active during
     second kernel. This is used to release the reserved memory
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index a9591def0c84..2ed80f7b2652 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1357,6 +1357,13 @@ static ssize_t fadump_enabled_show(struct kobject *kobj,
 	return sprintf(buf, "%d\n", fw_dump.fadump_enabled);
 }
 
+static ssize_t fadump_mem_reserved_show(struct kobject *kobj,
+					struct kobj_attribute *attr,
+					char *buf)
+{
+	return sprintf(buf, "%ld\n", fw_dump.reserve_dump_area_size);
+}
+
 static ssize_t fadump_register_show(struct kobject *kobj,
 					struct kobj_attribute *attr,
 					char *buf)
@@ -1440,6 +1447,10 @@ static struct kobj_attribute enable_attr = __ATTR(enabled,
 static struct kobj_attribute register_attr = __ATTR(registered,
 						0644, fadump_register_show,
 						fadump_register_store);
+static struct kobj_attribute mem_reserved_attr = __ATTR(mem_reserved,
+						0444, fadump_mem_reserved_show,
+						NULL);
+
 
 DEFINE_SHOW_ATTRIBUTE(fadump_region);
 
@@ -1496,6 +1507,10 @@ static void fadump_init_files(void)
 			pr_err("unable to create release_mem sysfs file (%d)\n",
 			       rc);
 	}
+	rc = sysfs_create_file(fadump_kobj, &mem_reserved_attr.attr);
+	if (rc)
+		pr_err("unable to create mem_reserved sysfs file (%d)\n",
+		       rc);
 	return;
 }
 
-- 
2.17.2

