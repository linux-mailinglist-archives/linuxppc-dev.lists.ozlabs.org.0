Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B970552E8A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:20:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Lm050vRz3bqG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:20:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hb79o5fX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Hb79o5fX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Lk12pKdz3bgC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:18:17 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K8i7xs008091;
 Fri, 20 May 2022 09:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Pgzls9W4IExQr6QvWSKOKx0ICdGOlbvE2KwOCzCWCO4=;
 b=Hb79o5fX4hM2F7O6Aa6HuHYwD5b05oQnIWFYbn2eCZnY6drlJ5+birIuiHb+pvt0cbRc
 RVvn1Hd9mV+16MtcmBMO8eqiFB95QhAApfp+GsDB7hhqef0q/BQhkNHjmxwCsQc/+xQD
 KgpVAySgJIbL2WphmIBSuzzzC65Jd0lb3nmiyUrvV8GgoUWpo2pRmVZybYGO/ey4wBnx
 IYgw2+nUOfvMiL1hbYVAl5+GlY8uRpqJWL2/bIsNG/Gy7gy/S9phlbl04uI+MNixRB4Y
 JaJKfVNqLhsCb0LyQJE4o7Kd619CQ4k5BMWWekeDJdnZlBfVR/8hYYcHVpscpoDm90Ep UQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g67qx8ku8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:11 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9DSCC026573;
 Fri, 20 May 2022 09:18:10 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3g2429gjfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:10 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24K9HRup22282530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:17:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DAE94C04A;
 Fri, 20 May 2022 09:18:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3F434C046;
 Fri, 20 May 2022 09:18:03 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:18:03 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 02/35] testing/selftests/powerpc: Add support to fetch
 "platform" and "base platform" from auxv to detect platform.
Date: Fri, 20 May 2022 14:47:18 +0530
Message-Id: <20220520091751.17000-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2REQK6J4Wa_ArRPkkB_h5GSg9j1zTwwn
X-Proofpoint-ORIG-GUID: 2REQK6J4Wa_ArRPkkB_h5GSg9j1zTwwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205200066
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
index b984d1e162ac..f2baaeaea116 100644
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
+	if (!strcmp(pmu_name, "GENERIC_COMPAT"))
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

