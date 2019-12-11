Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5109611BBD2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 19:36:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y5H34KHLzDqtZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 05:36:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y2276CjWzDqHw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 03:09:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47Y22743DDz8wHf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 03:09:51 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47Y2272CrdzB3yF; Thu, 12 Dec 2019 03:09:51 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 47Y2240VgTz9sTt
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Dec 2019 03:09:47 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBG8A3Y067149
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Dec 2019 11:09:45 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wtcd1yhwb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Dec 2019 11:09:45 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Wed, 11 Dec 2019 16:09:43 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Dec 2019 16:09:39 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBBG9cN450921480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Dec 2019 16:09:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CC09A405C;
 Wed, 11 Dec 2019 16:09:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1396A405B;
 Wed, 11 Dec 2019 16:09:35 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.74.172])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Dec 2019 16:09:35 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v6 6/6] powerpc/fadump: sysfs for fadump memory reservation
Date: Wed, 11 Dec 2019 21:39:10 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
References: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19121116-0008-0000-0000-0000033FDBD4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121116-0009-0000-0000-00004A5F12C3
Message-Id: <20191211160910.21656-7-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_04:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912110136
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

Add a sys interface to allow querying the memory reserved by FADump for
saving the crash dump.

Also added Documentation/ABI for the new sysfs file.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-kernel-fadump    | 7 +++++++
 Documentation/powerpc/firmware-assisted-dump.rst | 5 +++++
 arch/powerpc/kernel/fadump.c                     | 9 +++++++++
 3 files changed, 21 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
index 5d988b919e81..8f7a64a81783 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump
@@ -31,3 +31,10 @@ Description:	write only
 		the system is booted to capture the vmcore using FADump.
 		It is used to release the memory reserved by FADump to
 		save the crash dump.
+
+What:		/sys/kernel/fadump/mem_reserved
+Date:		Dec 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read only
+		Provide information about the amount of memory reserved by
+		FADump to save the crash dump in bytes.
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index 365c10209ef3..04993eaf3113 100644
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
index 23f15bfea512..1c9b23c5b296 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1369,6 +1369,13 @@ static ssize_t enabled_show(struct kobject *kobj,
 	return sprintf(buf, "%d\n", fw_dump.fadump_enabled);
 }
 
+static ssize_t mem_reserved_show(struct kobject *kobj,
+				 struct kobj_attribute *attr,
+				 char *buf)
+{
+	return sprintf(buf, "%ld\n", fw_dump.reserve_dump_area_size);
+}
+
 static ssize_t registered_show(struct kobject *kobj,
 			       struct kobj_attribute *attr,
 			       char *buf)
@@ -1433,10 +1440,12 @@ static int fadump_region_show(struct seq_file *m, void *private)
 static struct kobj_attribute release_attr = __ATTR_WO(release_mem);
 static struct kobj_attribute enable_attr = __ATTR_RO(enabled);
 static struct kobj_attribute register_attr = __ATTR_RW(registered);
+static struct kobj_attribute mem_reserved_attr = __ATTR_RO(mem_reserved);
 
 static struct attribute *fadump_attrs[] = {
 	&enable_attr.attr,
 	&register_attr.attr,
+	&mem_reserved_attr.attr,
 	NULL,
 };
 
-- 
2.17.2

