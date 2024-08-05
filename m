Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA315947486
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 07:09:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q2g+1nzy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WckyC4fKpz3ccX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 15:09:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q2g+1nzy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WckxW2bnTz3cJ0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2024 15:09:02 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4753xN6F020120;
	Mon, 5 Aug 2024 05:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=isshMusKYvtjeuz7yHCaCrUcSplvjMweRksGxO3
	2GpM=; b=Q2g+1nzyor1eg9FPCfI3wFyJaSi8Xm4qMAFAMC+hm29IK13ygk6jQpl
	97gxqEohS9+dGYdpZxasBv5LQr55kQQ/KqVZdF/Ma9uosXR3eTSdK8rykX3a/AKj
	Yc8b+SLuBjTdw/76p9ze3Q2TkmC/URm6lEBMWu4cKcsnCPp4fgW8yMx0zsAdPLgl
	LJQROplqdN+wF7sNam68knMD0j4D/nIKjGuvKTfA28O9UtEtD91di4ndWMi4g0vQ
	EXnA8P+B/qHEZ5A0gq/k7xCoqBtTtzdBjTqyq1GUv+dfJXoR7Y6k0e5TsXllEJmE
	V0QsF9c4r2+6nG5MArx+fpJZ8xQ+r3g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40tqa303pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 05:08:53 +0000 (GMT)
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47558qwT016140;
	Mon, 5 Aug 2024 05:08:52 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40tqa303pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 05:08:52 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4752eoIL024166;
	Mon, 5 Aug 2024 05:08:51 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40syvp4t5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 05:08:51 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47558jJO56819980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Aug 2024 05:08:47 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69DD020043;
	Mon,  5 Aug 2024 05:08:45 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CF8F20040;
	Mon,  5 Aug 2024 05:08:43 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Aug 2024 05:08:43 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: bhe@redhat.com
Subject: [PATCH] Document/kexec: Generalize crash hotplug description
Date: Mon,  5 Aug 2024 10:38:29 +0530
Message-ID: <20240805050829.297171-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L8Nlt8mvubJ-cNSGhD1hDO3Zk7B6cMQV
X-Proofpoint-ORIG-GUID: yt3EFoGssYFBIfPyYS6v6IoHcuXig4bQ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-04_14,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050033
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
Cc: Petr Tesarik <petr@tesarici.cz>, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 79365026f869 ("crash: add a new kexec flag for hotplug support")
generalizes the crash hotplug support to allow architectures to update
multiple kexec segments on CPU/Memory hotplug and not just elfcorehdr.
Therefore, update the relevant kernel documentation to reflect the same.

No functional change.

Cc: Petr Tesarik <petr@tesarici.cz>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

Discussion about the documentation update:
https://lore.kernel.org/all/68d0328d-531a-4a2b-ab26-c97fd8a12e8b@linux.ibm.com/

---
 .../ABI/testing/sysfs-devices-memory          |  6 ++--
 .../ABI/testing/sysfs-devices-system-cpu      |  6 ++--
 .../admin-guide/mm/memory-hotplug.rst         |  5 ++--
 Documentation/core-api/cpu_hotplug.rst        | 10 ++++---
 kernel/crash_core.c                           | 29 ++++++++++++-------
 5 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-memory b/Documentation/ABI/testing/sysfs-devices-memory
index a95e0f17c35a..421acc8e2c6b 100644
--- a/Documentation/ABI/testing/sysfs-devices-memory
+++ b/Documentation/ABI/testing/sysfs-devices-memory
@@ -115,6 +115,6 @@ What:		/sys/devices/system/memory/crash_hotplug
 Date:		Aug 2023
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:
-		(RO) indicates whether or not the kernel directly supports
-		modifying the crash elfcorehdr for memory hot un/plug and/or
-		on/offline changes.
+		(RO) indicates whether or not the kernel update of kexec
+		segments on memory hot un/plug and/or on/offline events,
+		avoiding the need to reload kdump kernel.
diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index 325873385b71..f4ada1cd2f96 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -703,9 +703,9 @@ What:		/sys/devices/system/cpu/crash_hotplug
 Date:		Aug 2023
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:
-		(RO) indicates whether or not the kernel directly supports
-		modifying the crash elfcorehdr for CPU hot un/plug and/or
-		on/offline changes.
+		(RO) indicates whether or not the kernel update of kexec
+		segments on CPU hot un/plug and/or on/offline events,
+		avoiding the need to reload kdump kernel.
 
 What:		/sys/devices/system/cpu/enabled
 Date:		Nov 2022
diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index 098f14d83e99..cb2c080f400c 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -294,8 +294,9 @@ The following files are currently defined:
 ``crash_hotplug``      read-only: when changes to the system memory map
 		       occur due to hot un/plug of memory, this file contains
 		       '1' if the kernel updates the kdump capture kernel memory
-		       map itself (via elfcorehdr), or '0' if userspace must update
-		       the kdump capture kernel memory map.
+		       map itself (via elfcorehdr and other relevant kexec
+		       segments), or '0' if userspace must update the kdump
+		       capture kernel memory map.
 
 		       Availability depends on the CONFIG_MEMORY_HOTPLUG kernel
 		       configuration option.
diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
index dcb0e379e5e8..a21dbf261be7 100644
--- a/Documentation/core-api/cpu_hotplug.rst
+++ b/Documentation/core-api/cpu_hotplug.rst
@@ -737,8 +737,9 @@ can process the event further.
 
 When changes to the CPUs in the system occur, the sysfs file
 /sys/devices/system/cpu/crash_hotplug contains '1' if the kernel
-updates the kdump capture kernel list of CPUs itself (via elfcorehdr),
-or '0' if userspace must update the kdump capture kernel list of CPUs.
+updates the kdump capture kernel list of CPUs itself (via elfcorehdr and
+other relevant kexec segment), or '0' if userspace must update the kdump
+capture kernel list of CPUs.
 
 The availability depends on the CONFIG_HOTPLUG_CPU kernel configuration
 option.
@@ -750,8 +751,9 @@ file can be used in a udev rule as follows:
  SUBSYSTEM=="cpu", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"
 
 For a CPU hot un/plug event, if the architecture supports kernel updates
-of the elfcorehdr (which contains the list of CPUs), then the rule skips
-the unload-then-reload of the kdump capture kernel.
+of the elfcorehdr (which contains the list of CPUs) and other relevant
+kexec segments, then the rule skips the unload-then-reload of the kdump
+capture kernel.
 
 Kernel Inline Documentations Reference
 ======================================
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 63cf89393c6e..64dad01e260b 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -520,18 +520,25 @@ int crash_check_hotplug_support(void)
 }
 
 /*
- * To accurately reflect hot un/plug changes of cpu and memory resources
- * (including onling and offlining of those resources), the elfcorehdr
- * (which is passed to the crash kernel via the elfcorehdr= parameter)
- * must be updated with the new list of CPUs and memories.
+ * To accurately reflect hot un/plug changes of CPU and Memory resources
+ * (including onling and offlining of those resources), the relevant
+ * kexec segments must be updated with latest CPU and Memory resources.
  *
- * In order to make changes to elfcorehdr, two conditions are needed:
- * First, the segment containing the elfcorehdr must be large enough
- * to permit a growing number of resources; the elfcorehdr memory size
- * is based on NR_CPUS_DEFAULT and CRASH_MAX_MEMORY_RANGES.
- * Second, purgatory must explicitly exclude the elfcorehdr from the
- * list of segments it checks (since the elfcorehdr changes and thus
- * would require an update to purgatory itself to update the digest).
+ * Architectures must ensure two things for all segments that need
+ * updating during hotplug events:
+ *
+ * 1. Segments must be large enough to accommodate a growing number of
+ *    resources.
+ * 2. Exclude the segments from SHA verification.
+ *
+ * For example, on most architectures, the elfcorehdr (which is passed
+ * to the crash kernel via the elfcorehdr= parameter) must include the
+ * new list of CPUs and memory. To make changes to the elfcorehdr, it
+ * should be large enough to permit a growing number of CPU and Memory
+ * resources. One can estimate the elfcorehdr memory size based on
+ * NR_CPUS_DEFAULT and CRASH_MAX_MEMORY_RANGES. The elfcorehdr is
+ * excluded from SHA verification by default if the architecture
+ * supports crash hotplug.
  */
 static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
 {
-- 
2.45.2

