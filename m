Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D35888AD578
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 22:02:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GYpjlTai;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNbkJ3YMLz3vhM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 06:02:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GYpjlTai;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNbgz1SlXz3cXh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 05:59:59 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VNbgz0fFPz4wyj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 05:59:59 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VNbgz0c0dz4wyl; Tue, 23 Apr 2024 05:59:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GYpjlTai;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4VNbgy58dTz4wyj
	for <linuxppc-dev@ozlabs.org>; Tue, 23 Apr 2024 05:59:58 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43MJA2f3024774;
	Mon, 22 Apr 2024 19:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZHEYp7W5tCDedYhY3Qx0nIXpgb+50v+VKXCVu72udIQ=;
 b=GYpjlTaiN1NwXJ000fB4lsqzJJxObDuVIgW4r7IyS9TXhVmrbUX37D1yyUOBs5OG05xY
 NB3lLYUTTwSQqwgzX9+BXYbMJ82nX/VxZA/n7G5X/w2naTPWsScUrS1iwEYo0n93K7pF
 Syrqums2s9d9+YwuW80264Z89ajOWSmAWtCMN2arplThBcFajv0kynqLvF9rHNwfWkqT
 k9lTcO1G5tHqz/kvoMDBm5GmYwOWVUZvIRQhQs5eX3ymgjzlC9zoNQVyktnhNQyoGSCN
 axQy6ciGcwrznlAQLzr6zktEI6SR73Q+Rz4yTnYwDNxN+geZ3MWcCE6QhDrPa7Z12rDj Vw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xnwhc03eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 19:59:53 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43MI0puc028653;
	Mon, 22 Apr 2024 19:59:52 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmtr295yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 19:59:52 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43MJxloQ15663418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Apr 2024 19:59:49 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E47820040;
	Mon, 22 Apr 2024 19:59:47 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9321820049;
	Mon, 22 Apr 2024 19:59:44 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.102.192])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Apr 2024 19:59:44 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v10 2/3] powerpc/fadump: add hotplug_ready sysfs interface
Date: Tue, 23 Apr 2024 01:29:31 +0530
Message-ID: <20240422195932.1583833-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240422195932.1583833-1-sourabhjain@linux.ibm.com>
References: <20240422195932.1583833-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pWlvo69QiGI8NhIqmrE1HrUGq_hMsz9W
X-Proofpoint-ORIG-GUID: pWlvo69QiGI8NhIqmrE1HrUGq_hMsz9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_14,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxlogscore=886 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404220084
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Aditya Gupta <adityag@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
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

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N Rao <naveen@kernel.org>
---
 Documentation/ABI/testing/sysfs-kernel-fadump | 11 +++++++++++
 arch/powerpc/kernel/fadump.c                  | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
index 8f7a64a81783..c586054657d6 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump
@@ -38,3 +38,14 @@ Contact:	linuxppc-dev@lists.ozlabs.org
 Description:	read only
 		Provide information about the amount of memory reserved by
 		FADump to save the crash dump in bytes.
+
+What:		/sys/kernel/fadump/hotplug_ready
+Date:		Apr 2024
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read only
+		Kdump udev rule re-registers fadump on memory add/remove events,
+		primarily to update the elfcorehdr. This sysfs indicates the
+		kdump udev rule that fadump re-registration is not required on
+		memory add/remove events because elfcorehdr is now prepared in
+		the second/fadump kernel.
+User:		kexec-tools
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 35254fc1516b..dfab452e947b 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1442,6 +1442,18 @@ static ssize_t enabled_show(struct kobject *kobj,
 	return sprintf(buf, "%d\n", fw_dump.fadump_enabled);
 }
 
+/*
+ * /sys/kernel/fadump/hotplug_ready sysfs node returns 1, which inidcates
+ * to usersapce that fadump re-registration is not required on memory
+ * hotplug events.
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
@@ -1514,11 +1526,13 @@ static struct kobj_attribute release_attr = __ATTR_WO(release_mem);
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
2.44.0

