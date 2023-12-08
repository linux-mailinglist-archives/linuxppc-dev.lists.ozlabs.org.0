Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A804980A2B9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 12:55:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rlGT+EnL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmqM91M4hz3dW9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 22:55:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rlGT+EnL;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmqJJ3rGcz3d8n
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 22:52:32 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SmqJJ3BZ8z4wcX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 22:52:32 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SmqJJ35wwz4xFj; Fri,  8 Dec 2023 22:52:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rlGT+EnL;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SmqJJ06MYz4wcX
	for <linuxppc-dev@ozlabs.org>; Fri,  8 Dec 2023 22:52:31 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8BZrXI006347;
	Fri, 8 Dec 2023 11:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LDiPXgi7qHFkirZq58Mw8I2wvRXczoodPmi6ogdlJ9g=;
 b=rlGT+EnLv1UPE+AzgT1ry0TWd/fZwsJfTyQJ6eKTRhjvqB1tS6oUGcso+4OQY+8OmDqE
 bMh/P5sIFKtzzrpqZfcRCHy/Atl11aRVjDjRiXL3keit2U4QuRqfkqyFvchnsJXEeMXF
 DZL7FMgwiu1x/OXiyZVMhApTKFGXnfr/2oIr/902XrXOgdoB6geVd5xJwsPQr52ILoga
 A9+4W9xF/zQvVoeCybyearTxknLrqNDVfFdS9/tDckOWcQ5xqwpSshv1tumT69SX4Emu
 L5gEU1aNuohdly6umgxrfbfAV1X6fjx9ircbVBtFz0KbOrl3wBUleJG8aG5hQcGTm5BF Vw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uv0cu47j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 11:52:24 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B89mHeo015410;
	Fri, 8 Dec 2023 11:52:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3utavksbgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 11:52:23 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B8BqKhq7537248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Dec 2023 11:52:20 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C43D32004B;
	Fri,  8 Dec 2023 11:52:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBE1420040;
	Fri,  8 Dec 2023 11:52:16 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.c4p-in.ibmmobiledemo.com (unknown [9.177.65.40])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Dec 2023 11:52:16 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v6 2/3] powerpc/fadump: add hotplug_ready sysfs interface
Date: Fri,  8 Dec 2023 17:21:58 +0530
Message-ID: <20231208115159.82236-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208115159.82236-1-sourabhjain@linux.ibm.com>
References: <20231208115159.82236-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SlSfsBnRxeF1-O_H9tXfaFS72Nq6hdZA
X-Proofpoint-ORIG-GUID: SlSfsBnRxeF1-O_H9tXfaFS72Nq6hdZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_06,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=741 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312080098
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Aditya Gupta <adityag@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
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
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N Rao <naveen@kernel.org>
---
 Documentation/ABI/testing/sysfs-kernel-fadump | 11 +++++++++++
 arch/powerpc/kernel/fadump.c                  | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
index 8f7a64a81783..971934b2891e 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump
@@ -38,3 +38,14 @@ Contact:	linuxppc-dev@lists.ozlabs.org
 Description:	read only
 		Provide information about the amount of memory reserved by
 		FADump to save the crash dump in bytes.
+
+What:		/sys/kernel/fadump/hotplug_ready
+Date:		Sep 2023
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read only
+		Kdump udev rule re-registers fadump on memory add/remove events,
+		primarily to update the elfcorehdr. This sysfs indicates the
+		kdump udev rule that fadump re-registration is not required on
+		memory add/remove events because elfcorehdr is now prepared in
+		the second/fadump kernel.
+User:		kexec-tools
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index eb9132538268..a55dd9bf754c 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1455,6 +1455,18 @@ static ssize_t enabled_show(struct kobject *kobj,
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
@@ -1527,11 +1539,13 @@ static struct kobj_attribute release_attr = __ATTR_WO(release_mem);
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

