Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C73B8546781
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:43:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMc25kKsz3dqf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:43:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cMFv+LKm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cMFv+LKm;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMZ83Tfyz3bnT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:41:36 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AD8X4a012850;
	Fri, 10 Jun 2022 13:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sGb6tGneLfyAbW7pPK8orz9IPMrF1LRWIitxYAxBxVQ=;
 b=cMFv+LKmFm4jHteCsowbgjCNrn5uTQxyxU+EB9Scf1HSKthq93K3CSuIYIYf3RzDXgtf
 UIa0uQjWCynVzUoiTEu8zVgdZJJuP8zHwV8iinSbWHHBezwIm+P0tUNxOxFzePGKeqxv
 Yc++4KJoj2nR+HqO6tWUeB7vIZ2IY51OM/qHio8f8cw0NMep3U3vBMZNj6WEFQQ6ObTJ
 dmp4G6CzuJ1VLFx+84ULUoceoZa/ikES7aNESw1axZMWlRU0Tm+oAYxM/jDmlqe8Ktgh
 /yhZTK46q4Cg23ZUzAsLMgNuYpV8OYN5zoq6j7HccoyKXwZtEI9jLIJmGVMu2HJ6kS9/ Hg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6jw8ppw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:41:31 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADal8v020453;
	Fri, 10 Jun 2022 13:41:29 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3gfxnj0bhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:41:29 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADf5BE16056826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:41:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA2A552050;
	Fri, 10 Jun 2022 13:41:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5EC8A5204E;
	Fri, 10 Jun 2022 13:41:24 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 02/35] testing/selftests/powerpc: Add support to fetch "platform" and "base platform" from auxv to detect platform.
Date: Fri, 10 Jun 2022 19:10:40 +0530
Message-Id: <20220610134113.62991-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6ZvyucWqgZ4xUVtuBQi_acsDAKTEpWJm
X-Proofpoint-GUID: 6ZvyucWqgZ4xUVtuBQi_acsDAKTEpWJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_05,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100052
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The /proc/self/auxv contains information about "platform" on any
system. Also "base platform" which is an indication about platform
string corresponding to the real PVR. When systems are booted in
compat mode, say, power10 booted in power9 mode, "platform" will
point to power9 whereas base platform will point to power10. Incase,
if the distro doesn't support platform indicated by real PVR,
base platform will have a default value.
The mismatch of platform/base platform is an indication of system
booted in compat mode. In such cases, distro will have a Generic
Compat registered which supports basic features for performance
monitoring.

Some of the selftest needs to be handled differently ( ex: generic
events, alternative events, bhrb filter map) in Generic Compat PMU.
Hence selftest framework needs utility functions to identify such
cases. One way is make sure of auxv information. Below condition can
be used to detect if Generic Compat PMU is registered. ie:

<<>>
if ((AT_PLATFORM != AT_BASE_PLATFORM) && (AT_BASE_PLATFORM != PVR))
<<>>
this indicates Generic Compat PMU.

Add utility function in "include/utils.h" to return:
AT_PLATFORM and AT_BASE_PLATFORM from auxv. Also update misc.c in
"sampling_tests" folder to add function to use above check to
determine presence of generic compat pmu.

In other architecture ( like x86 ), pmu_name is exposed via
"/sys/bus/event_source/devices/cpu/caps". The same could be used
in powerpc in future. Since currently we don't have the "caps"
support in powerpc, patch uses auxv information to detect platform
type and compat mode. But as placeholder utility function is added
considering possiblity of getting "caps" information via sysfs.
If that doesn't exist, fallback to using auxv information.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../testing/selftests/powerpc/include/utils.h | 10 ++++
 .../powerpc/pmu/sampling_tests/misc.c         | 50 +++++++++++++++++++
 .../powerpc/pmu/sampling_tests/misc.h         |  3 ++
 3 files changed, 63 insertions(+)

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index b9fa9cd709df..e222a5858450 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -74,6 +74,16 @@ static inline bool have_hwcap2(unsigned long ftr2)
 }
 #endif
 
+static inline char *auxv_base_platform(void)
+{
+	return ((char *)get_auxv_entry(AT_BASE_PLATFORM));
+}
+
+static inline char *auxv_platform(void)
+{
+	return ((char *)get_auxv_entry(AT_PLATFORM));
+}
+
 bool is_ppc64le(void);
 int using_hash_mmu(bool *using_hash);
 
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
index b984d1e162ac..6e30b455cbd6 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
@@ -454,3 +454,53 @@ int get_thresh_cmp_val(struct event event)
 		result = (exp << 8) | value;
 	return result;
 }
+
+/*
+ * Utility function to check for generic compat PMU
+ * by comparing base_platform value from auxv and real
+ * PVR value.
+ */
+static bool auxv_generic_compat_pmu(void)
+{
+	int base_pvr = 0;
+
+	if (!strcmp(auxv_base_platform(), "power9"))
+		base_pvr = POWER9;
+	else if (!strcmp(auxv_base_platform(), "power10"))
+		base_pvr = POWER10;
+
+	return (!base_pvr);
+}
+
+/*
+ * Check for generic compat PMU.
+ * First check for presence of pmu_name from
+ * "/sys/bus/event_source/devices/cpu/caps".
+ * If doesn't exist, fallback to using value
+ * auxv.
+ */
+bool check_for_generic_compat_pmu(void)
+{
+	char pmu_name[256];
+
+	memset(pmu_name, 0, sizeof(pmu_name));
+	if (read_sysfs_file("bus/event_source/devices/cpu/caps/pmu_name",
+		pmu_name, sizeof(pmu_name)) < 0)
+		return auxv_generic_compat_pmu();
+
+	if (!strcmp(pmu_name, "ISAv3"))
+		return true;
+	else
+		return false;
+}
+
+/*
+ * Check if system is booted in compat mode.
+ */
+bool check_for_compat_mode(void)
+{
+	char *platform = auxv_platform();
+	char *base_platform = auxv_base_platform();
+
+	return strcmp(platform, base_platform);
+}
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
index 078120883fde..c0e923f38793 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
@@ -5,6 +5,7 @@
  * Copyright 2022, Kajol Jain, IBM Corp.
  */
 
+#include <sys/stat.h>
 #include "../event.h"
 
 #define POWER10 0x80
@@ -53,6 +54,8 @@ int collect_samples(void *sample_buff);
 u64 *get_intr_regs(struct event *event, void *sample_buff);
 u64 get_reg_value(u64 *intr_regs, char *register_name);
 int get_thresh_cmp_val(struct event event);
+bool check_for_generic_compat_pmu(void);
+bool check_for_compat_mode(void);
 
 static inline int get_mmcr0_fc56(u64 mmcr0, int pmc)
 {
-- 
2.35.1

