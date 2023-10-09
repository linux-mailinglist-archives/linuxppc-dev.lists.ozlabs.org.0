Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F597BD28A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 06:23:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZsMB5fwi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3m9s0rh4z3vX2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 15:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZsMB5fwi;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3m5z4C8Gz3c1Q
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 15:20:07 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4S3m5x6y4kz4xW1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 15:20:05 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4S3m5x6nxYz4xVy; Mon,  9 Oct 2023 15:20:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZsMB5fwi;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4S3m5x4TVdz4xVx;
	Mon,  9 Oct 2023 15:20:05 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3994HQFS012294;
	Mon, 9 Oct 2023 04:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kjaO3vdIgsS3IuENaUA+AYjRex+yP0cXaPFERIbt3qc=;
 b=ZsMB5fwii7hh8mS9Ya0P63Q4PKDMfT5pgdb86yOAcidQXW+WasoHQ7YN0VQHYOoN1SlU
 Ry7SYeUQOShbpoJRmySjoekMuk8V/FmXYwv6JZiqKHCIEG/wdXFP4EAHtEJxFwlcBzRD
 us4l0eygIaImtn0TXN+47AmElHD7IoyO90qifXMTYiiQvQt/QnHFkH6DyaJJpOEoUpct
 wqt8BKFkmPO142uxyzuWcM9phJG98wZz1AqQYSap9KtPRe0hQ6o4MoAjXTWgcEDdznnG
 F2z7/bccEwbOvTCQ2KPX2LcR/JB/1c68OOwO+tsjlsjxQGWxvjfrPMTrMVVqwpU8zuil Cg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmac301av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 04:20:03 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3994Ge1v001147;
	Mon, 9 Oct 2023 04:20:02 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkkvje63d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 04:20:02 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3994Jx4820709944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 04:19:59 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A640F20043;
	Mon,  9 Oct 2023 04:19:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E34520040;
	Mon,  9 Oct 2023 04:19:58 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.c4p-in.ibmmobiledemo.com (unknown [9.43.79.177])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 04:19:58 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 2/3] powerpc/fadump: add hotplug_ready sysfs interface
Date: Mon,  9 Oct 2023 09:49:52 +0530
Message-ID: <20231009041953.36139-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009041953.36139-1-sourabhjain@linux.ibm.com>
References: <20231009041953.36139-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LGmED31PGIRcmWVyW_KYrtZGKXoEP0qF
X-Proofpoint-GUID: LGmED31PGIRcmWVyW_KYrtZGKXoEP0qF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_02,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090037
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
Cc: mahesh@linux.vnet.ibm.com, adityag@linux.ibm.com, hbathini@linux.ibm.com
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
index 2d59225a0664..7696cbf70699 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1473,6 +1473,18 @@ static ssize_t enabled_show(struct kobject *kobj,
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
@@ -1545,11 +1557,13 @@ static struct kobj_attribute release_attr = __ATTR_WO(release_mem);
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

