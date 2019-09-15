Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDD8B304F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 15:42:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WVtb4fHczF5Qm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 23:42:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WVSN5Nt5zF59g
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 23:23:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46WVSN4X7Gz8tWS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 23:23:32 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46WVSN42G7z9sPZ; Sun, 15 Sep 2019 23:23:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46WVSM61tJz9sP4
 for <linuxppc-dev@ozlabs.org>; Sun, 15 Sep 2019 23:23:31 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8FDMZhj161761
 for <linuxppc-dev@ozlabs.org>; Sun, 15 Sep 2019 09:23:29 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v0u127cgf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sun, 15 Sep 2019 09:23:29 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Sun, 15 Sep 2019 14:23:27 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 15 Sep 2019 14:23:25 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8FDNOjw52166872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 15 Sep 2019 13:23:24 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A631A4060;
 Sun, 15 Sep 2019 13:23:24 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E13AFA405B;
 Sun, 15 Sep 2019 13:23:22 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.54.91])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 15 Sep 2019 13:23:22 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 4/4] powerpc/fadump: sysfs for fadump memory reservation
Date: Sun, 15 Sep 2019 18:53:10 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190915132310.13542-1-sourabhjain@linux.ibm.com>
References: <20190915132310.13542-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19091513-0012-0000-0000-0000034BEF4F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091513-0013-0000-0000-000021866297
Message-Id: <20190915132310.13542-5-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-15_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909150147
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
 linux-kernel@vger.kernel.org, hbathini@linux.ibm.com
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
 arch/powerpc/kernel/fadump.c                     | 14 ++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
index ed8eec3d759c..34cb89173872 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump
@@ -39,3 +39,10 @@ Description:	write only
 		The sysfs file is available when the system is booted to
 		collect the dump on OPAL based machine. It used to release
 		the memory used to collect the opalcore.
+
+What:		/sys/kernel/fadump/fadump_mem_reserved
+Date:		Sep 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read only
+		Provide information about the amount of memory reserved by
+		FADump to save the crash dump in bytes.
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index 4fd7f5eab97d..7e8404052ba7 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -268,6 +268,11 @@ Here is the list of files under kernel sysfs:
     be handled and vmcore will not be captured. This interface can be
     easily integrated with kdump service start/stop.
 
+ /sys/kernel/fadump/fadump_mem_reserved
+
+   This is used to display the memory reserved by FADump for saving the
+   crash dump.
+
  /sys/kernel/fadump_release_mem
     This file is available only when FADump is active during
     second kernel. This is used to release the reserved memory
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index bb70fa208a86..d970ce2a8a44 100644
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
@@ -1430,6 +1437,9 @@ static struct kobj_attribute fadump_attr = __ATTR(fadump_enabled,
 static struct kobj_attribute fadump_register_attr = __ATTR(fadump_registered,
 						0644, fadump_register_show,
 						fadump_register_store);
+static struct kobj_attribute fadump_mem_reserved_attr =
+			__ATTR(fadump_mem_reserved, 0444,
+			       fadump_mem_reserved_show, NULL);
 
 DEFINE_SHOW_ATTRIBUTE(fadump_region);
 
@@ -1487,6 +1497,10 @@ static void fadump_init_files(void)
 			pr_err("unable to create fadump/fadump_release_mem sysfs file (%d)\n",
 			       rc);
 	}
+	rc = sysfs_create_file(fadump_kobj, &fadump_mem_reserved_attr.attr);
+	if (rc)
+		pr_err("unable to create fadump_mem_reserved sysfs file (%d)\n",
+		       rc);
 	return;
 }
 
-- 
2.17.2

