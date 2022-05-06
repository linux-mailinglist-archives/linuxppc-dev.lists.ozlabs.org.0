Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B3451D3A8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:47:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvkjJ1nt7z3cgn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 18:47:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YctfoxGM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YctfoxGM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvkgP4BbSz3bqs
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:46:09 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2468BaEN006436;
 Fri, 6 May 2022 08:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iWz4lzXRLfeBWsmtDZ2Lh/TB3pkxp7PFSascFlTZF9E=;
 b=YctfoxGMp2yg3gTLIqQ1VGqYdQ0wfvap0WLOqay1Sj2qSdxunG++20fRCiky560RwKUb
 fPPoSmucNgB6ZH3K3lSOGODq1pYocZtrFfyVbxZK7KFw6kbvkfIZO8tISNGMsr5H6Bt5
 yhzW7DLXnshw6gAt/90mWSMqumRRAwhMyWp5mO00Qc/zalmj/n98ykjuaDX4dGOM19vj
 MfvNAq007ZK5NQiGZTdVzPDktkk9/zAB4NybvpIs8PFzpY4Z4THHUYm3n71MBNzG72I8
 Ed7Wsw/mvBvkewVGTl+iid4KzNMcFOCyFo3oBjN2YcNrzIwHp4y0ZoL5IsHQZ4OdwqIE MA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvyxs8my4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:05 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468gh4K005160;
 Fri, 6 May 2022 08:46:02 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3fscdk637m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2468jqKb29557066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:45:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39BAF4C04A;
 Fri,  6 May 2022 08:45:59 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 215BE4C044;
 Fri,  6 May 2022 08:45:57 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:45:56 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/35] testing/selftests/powerpc: Add support to fetch
 "platform" and "base platform" from auxv to detect platform.
Date: Fri,  6 May 2022 14:15:11 +0530
Message-Id: <20220506084544.56527-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QW_n1YsoEYuPEIKt_Zy-hPExASY3VP80
X-Proofpoint-ORIG-GUID: QW_n1YsoEYuPEIKt_Zy-hPExASY3VP80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060045
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

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
index b7d188fc87c7..cf4763d3fc2d 100644
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
index 1afcd98f6036..eff56aa9f511 100644
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
+	if (!strcmp(pmu_name, "generic_compat_pmu"))
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
2.31.1

