Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7A06D242B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 17:40:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp4HS61srz3fWW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 02:40:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h88zBcpY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h88zBcpY;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp4GX4GNDz3fQY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 02:39:31 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32VF9aWQ022595;
	Fri, 31 Mar 2023 15:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QYQpr9VmLdqpeVZbTAb42z+J0T6n0Z4Ey3Cl/9VQzic=;
 b=h88zBcpYxQZTuhlgnAdjVBHTOucunkwWXTKwCg8Fgh8RIEB2r9/cCyto6tLXMkrTfOvh
 JiIgXH6C9XktuQaQPhNJvEeSM2BwfjSI+XPJaIdbXwjS+wpVetOrS4Qks+XjW47yBSfY
 JSRqzbQJ6UPY1Z9YNCYTywkwY6YX9r9lUHjVs0Hz5U2sxF+sxOi5+I/qoj9XvfSl3L3m
 m0h9omnXutm344pLqa9Gx4BmLVDv1HMJYvI/4r0jtzwHnXT0aioPincFRgAyYClqlWQr
 WVuy6DD71H0/1dhJ3PYEmrT/Ba8ZPSd7d7x37tcoeYTpnUUuIz7KennAwfhBGdAA0qE/ Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pp16d20rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 15:39:23 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32VF9db8023005;
	Fri, 31 Mar 2023 15:39:23 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pp16d20qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 15:39:22 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32V1I3gi013053;
	Fri, 31 Mar 2023 15:39:21 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3phr7fpvyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 15:39:21 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32VFdH8H64291314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Mar 2023 15:39:17 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA3AE20043;
	Fri, 31 Mar 2023 15:39:17 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E846120040;
	Fri, 31 Mar 2023 15:39:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.179.0.144])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Mar 2023 15:39:16 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH 1/2] pseries/smp: export the smt level in the SYS FS.
Date: Fri, 31 Mar 2023 17:39:04 +0200
Message-Id: <20230331153905.31698-2-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331153905.31698-1-ldufour@linux.ibm.com>
References: <20230331153905.31698-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PGc9QIzO_ZHUuoWKf1gThmRJW9B1TMUD
X-Proofpoint-GUID: 3nWUCXfU9EBO2gnYWIsNv4wvaUa9ZIOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310123
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
Cc: nathanl@linux.ibm.com, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no SMT level recorded in the kernel neither in user space.
Indeed there is no real constraint about that and mixed SMT levels are
allowed and system is working fine this way.

However when new CPU are added, the kernel is onlining all the threads
which is leading to mixed SMT levels and confuse end user a bit.

To prevent this exports a SMT level from the kernel so user space
application like the energy daemon, could read it to adjust their settings.
There is no action unless recording the value when a SMT value is written
into the new sysfs entry. User space applications like ppc64_cpu should
update the sysfs when changing the SMT level to keep the system consistent.

Suggested-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/pseries.h |  3 ++
 arch/powerpc/platforms/pseries/smp.c     | 39 ++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index f8bce40ebd0c..af0a145af98f 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -23,7 +23,9 @@ extern int pSeries_machine_check_exception(struct pt_regs *regs);
 extern long pseries_machine_check_realmode(struct pt_regs *regs);
 void pSeries_machine_check_log_err(void);
 
+
 #ifdef CONFIG_SMP
+extern int pseries_smt;
 extern void smp_init_pseries(void);
 
 /* Get state of physical CPU from query_cpu_stopped */
@@ -34,6 +36,7 @@ int smp_query_cpu_stopped(unsigned int pcpu);
 #define QCSS_HARDWARE_ERROR -1
 #define QCSS_HARDWARE_BUSY -2
 #else
+#define pseries_smt 1
 static inline void smp_init_pseries(void) { }
 #endif
 
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index c597711ef20a..6c382922f8f3 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -21,6 +21,7 @@
 #include <linux/device.h>
 #include <linux/cpu.h>
 #include <linux/pgtable.h>
+#include <linux/sysfs.h>
 
 #include <asm/ptrace.h>
 #include <linux/atomic.h>
@@ -45,6 +46,8 @@
 
 #include "pseries.h"
 
+int pseries_smt;
+
 /*
  * The Primary thread of each non-boot processor was started from the OF client
  * interface by prom_hold_cpus and is spinning on secondary_hold_spinloop.
@@ -280,3 +283,39 @@ void __init smp_init_pseries(void)
 
 	pr_debug(" <- smp_init_pSeries()\n");
 }
+
+static ssize_t pseries_smt_store(struct class *class,
+			 struct class_attribute *attr,
+			 const char *buf, size_t count)
+{
+	int smt;
+
+	if (kstrtou32(buf, 0, &smt) || !smt || smt > (u32) threads_per_core) {
+		pr_err("Invalid pseries_smt specified.\n");
+		return -EINVAL;
+	}
+
+	pseries_smt = smt;
+
+	return count;
+}
+
+static ssize_t pseries_smt_show(struct class *class, struct class_attribute *attr,
+			  char *buf)
+{
+	return sysfs_emit(buf, "%d\n", pseries_smt);
+}
+
+static CLASS_ATTR_RW(pseries_smt);
+
+static int __init pseries_smt_init(void)
+{
+	int rc;
+
+	pseries_smt = smt_enabled_at_boot;
+	rc = sysfs_create_file(kernel_kobj, &class_attr_pseries_smt.attr);
+	if (rc)
+		pr_err("Can't create pseries_smt sysfs/kernel entry.\n");
+	return rc;
+}
+machine_device_initcall(pseries, pseries_smt_init);
-- 
2.40.0

