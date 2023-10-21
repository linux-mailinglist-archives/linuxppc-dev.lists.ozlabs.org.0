Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1044A7D1EE8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Oct 2023 20:19:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BJSYtdY0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SCV8v6d52z3bgs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Oct 2023 05:19:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BJSYtdY0;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SCV7457HLz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Oct 2023 05:17:52 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SCV744YR1z4xWk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Oct 2023 05:17:52 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SCV744VhNz4xQQ; Sun, 22 Oct 2023 05:17:52 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BJSYtdY0;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SCV741Xzmz4xPR;
	Sun, 22 Oct 2023 05:17:51 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39LIF2tc019867;
	Sat, 21 Oct 2023 18:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Z7vrPBDVKn204hCH9a4q6H0NaaNnWt4OPQEcEzdBFR8=;
 b=BJSYtdY08P4ED6+citFIWGiyp1oPHJL50a/kzL4Mdq0n4XXz12/oe+NEBRDOVeD4IuIz
 OhLqVKAVNr9r1WFRNkg5MdoP+GwUmve2YUpr7EuzjYqtYfC7PD5Da2MEquTNRvXzYYpY
 pN4S8hjJSRopTBufPWDutSaz/KFPf97bueOTxZF9pdUm34PaNza6a1b6EdJZQRvYkZtE
 KiQ7kgisO6U9VVYq7m1MfXzzjrPzramLtGXu0JLkO30ylWoHncCM74ORSSe41bVIGHsb
 MASLuPT2XQrLT97d409Ns67gPoBJfKtJEs9PA3IhD3EHhwzenHap3tAYWQqVPWjeHIXC RQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvkrr01tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Oct 2023 18:17:49 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39LGpACB029791;
	Sat, 21 Oct 2023 18:17:49 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tuc47vmx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Oct 2023 18:17:48 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39LIHjIl19399214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Oct 2023 18:17:45 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFB1620043;
	Sat, 21 Oct 2023 18:17:45 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 847132004D;
	Sat, 21 Oct 2023 18:17:44 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.54.104])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 21 Oct 2023 18:17:44 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v4 2/3] powerpc/fadump: add hotplug_ready sysfs interface
Date: Sat, 21 Oct 2023 23:47:32 +0530
Message-ID: <20231021181733.204311-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231021181733.204311-1-sourabhjain@linux.ibm.com>
References: <20231021181733.204311-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZGy9LIG1-Iu-jvjhViMV3tf6Yln5gdfy
X-Proofpoint-ORIG-GUID: ZGy9LIG1-Iu-jvjhViMV3tf6Yln5gdfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-21_11,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=942 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310210167
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The elfcorehdr describes the CPUs and memory of the crashed kernel to
the kernel that captures the dump, known as the second or fadump kernel.
The elfcorehdr needs to be updated if the system's memory changes due to
memory hotplug or online/offline events.

Currently, memory hotplug events are monitored in userspace by udev
rules, and fadump is re-registered, which recreates the elfcorehdr with
the latest available memory in the system.

However, the previous patch ("powerpc: make fadump resilient with memory
add/remove events") moved the creation of elfcorehdr to the second or
fadump kernel. This eliminates the need to regenerate the elfcorehdr
during memory hotplug or online/offline events.

Create a sysfs entry at /sys/kernel/fadump/hotplug_ready to let
userspace know that fadump re-registration is not required for memory
add/remove events.

Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-kernel-fadump | 12 ++++++++++++
 arch/powerpc/kernel/fadump.c                  | 14 ++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
index 8f7a64a81783..f8ba21da0f71 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump
@@ -38,3 +38,15 @@ Contact:	linuxppc-dev@lists.ozlabs.org
 Description:	read only
 		Provide information about the amount of memory reserved by
 		FADump to save the crash dump in bytes.
+What:		/sys/kernel/fadump/hotplug_ready
+Date:		Sep 2023
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read only
+		The Kdump scripts utilize udev rules to monitor memory add/remove
+		events, ensuring that FADUMP is automatically re-registered when
+		system memory changes occur. This re-registration was necessary
+		to update the elfcorehdr, which describes the system memory to the
+		second kernel. Now If this sysfs node holds a value of 1, it
+		indicates to userspace that FADUMP does not require re-registration
+		since the elfcorehdr is now generated in the second kernel.
+User:		kexec-tools
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 32d532136113..78b0118939cb 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1475,6 +1475,18 @@ static ssize_t enabled_show(struct kobject *kobj,
 	return sprintf(buf, "%d\n", fw_dump.fadump_enabled);
 }
 
+/*
+ * /sys/kernel/fadump/hotplug_ready sysfs node only returns 1,
+ * which inidcates to usersapce that fadump re-registration is not
+ * required on memory hotplug events.
+ */
+static ssize_t hotplug_ready_show(struct kobject *kobj,
+				      struct kobj_attribute *attr,
+				      char *buf)
+{
+	return sprintf(buf, "%d\n", 1);
+}
+
 static ssize_t mem_reserved_show(struct kobject *kobj,
 				 struct kobj_attribute *attr,
 				 char *buf)
@@ -1547,11 +1559,13 @@ static struct kobj_attribute release_attr = __ATTR_WO(release_mem);
 static struct kobj_attribute enable_attr = __ATTR_RO(enabled);
 static struct kobj_attribute register_attr = __ATTR_RW(registered);
 static struct kobj_attribute mem_reserved_attr = __ATTR_RO(mem_reserved);
+static struct kobj_attribute hotplug_ready_attr = __ATTR_RO(hotplug_ready);
 
 static struct attribute *fadump_attrs[] = {
 	&enable_attr.attr,
 	&register_attr.attr,
 	&mem_reserved_attr.attr,
+	&hotplug_ready_attr.attr,
 	NULL,
 };
 
-- 
2.41.0

