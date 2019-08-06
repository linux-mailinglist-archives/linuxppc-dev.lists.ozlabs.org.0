Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFBF829F0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 05:14:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462frL1F8hzDqHl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 13:14:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462fpN11gxzDqTL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 13:12:56 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x76374Tg144191
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Aug 2019 23:12:53 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u70rb1drx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Aug 2019 23:12:52 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Tue, 6 Aug 2019 04:12:51 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 6 Aug 2019 04:12:49 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x763ClCW42467682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Aug 2019 03:12:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C462111C04A;
 Tue,  6 Aug 2019 03:12:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B380B11C050;
 Tue,  6 Aug 2019 03:12:46 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.126])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Aug 2019 03:12:46 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/fadump: sysfs for fadump memory reservation
Date: Tue,  6 Aug 2019 08:42:42 +0530
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
x-cbid: 19080603-0016-0000-0000-0000029AA028
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080603-0017-0000-0000-000032F9AA89
Message-Id: <20190806031242.30749-1-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-06_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908060036
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
Cc: mahesh@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Sourabh Jain <sourabhjain@linux.ibm.com>, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a sys interface to allow querying the memory reserved by fadump
for saving the crash dump.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 Documentation/powerpc/firmware-assisted-dump.rst |  5 +++++
 arch/powerpc/kernel/fadump.c                     | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index 9ca12830a48e..4a7f6dc556f5 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -222,6 +222,11 @@ Here is the list of files under kernel sysfs:
     be handled and vmcore will not be captured. This interface can be
     easily integrated with kdump service start/stop.
 
+/sys/kernel/fadump_mem_reserved
+
+   This is used to display the memory reserved by fadump for saving the
+   crash dump.
+
  /sys/kernel/fadump_release_mem
     This file is available only when fadump is active during
     second kernel. This is used to release the reserved memory
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4eab97292cc2..70d49013ebec 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1514,6 +1514,13 @@ static ssize_t fadump_enabled_show(struct kobject *kobj,
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
@@ -1632,6 +1639,9 @@ static struct kobj_attribute fadump_attr = __ATTR(fadump_enabled,
 static struct kobj_attribute fadump_register_attr = __ATTR(fadump_registered,
 						0644, fadump_register_show,
 						fadump_register_store);
+static struct kobj_attribute fadump_mem_reserved_attr =
+			__ATTR(fadump_mem_reserved, 0444,
+			fadump_mem_reserved_show, NULL);
 
 DEFINE_SHOW_ATTRIBUTE(fadump_region);
 
@@ -1663,6 +1673,10 @@ static void fadump_init_files(void)
 			printk(KERN_ERR "fadump: unable to create sysfs file"
 				" fadump_release_mem (%d)\n", rc);
 	}
+	rc = sysfs_create_file(kernel_kobj, &fadump_mem_reserved_attr.attr);
+	if (rc)
+		pr_err("unable to create sysfs file fadump_mem_reserved (%d)\n",
+			rc);
 	return;
 }
 
-- 
2.17.2

