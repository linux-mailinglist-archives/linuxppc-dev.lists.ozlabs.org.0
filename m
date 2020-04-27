Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A661B9515
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 04:15:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499Szw5RM1zDqLY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 12:15:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499StR19TczDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 12:10:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 499StP4jJdz8swh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 12:10:53 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 499StP1kt9z9sSY; Mon, 27 Apr 2020 12:10:53 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=huntbag@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 499StN4hq7z9sSK;
 Mon, 27 Apr 2020 12:10:52 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R23Yr8013757; Sun, 26 Apr 2020 22:10:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mhr529ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Apr 2020 22:10:50 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03R24q1L016953;
 Sun, 26 Apr 2020 22:10:50 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mhr529tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Apr 2020 22:10:50 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03R2A5aQ019739;
 Mon, 27 Apr 2020 02:10:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 30mcu6tunj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 02:10:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03R2Ajp258327204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 02:10:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04795A405B;
 Mon, 27 Apr 2020 02:10:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85EF6A405C;
 Mon, 27 Apr 2020 02:10:43 +0000 (GMT)
Received: from ltc-wspoon6.aus.stglabs.ibm.com (unknown [9.40.193.95])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 02:10:43 +0000 (GMT)
From: Abhishek Goel <huntbag@linux.vnet.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC 3/3] powernv/cpuidle : Introduce capability for
 firmware-enabled-stop
Date: Sun, 26 Apr 2020 21:10:27 -0500
Message-Id: <20200427021027.114582-3-huntbag@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427021027.114582-1-huntbag@linux.vnet.ibm.com>
References: <20200427021027.114582-1-huntbag@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-26_11:2020-04-24,
 2020-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004270016
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, npiggin@gmail.com,
 oohall@gmail.com, psampat@linux.ibm.com,
 Abhishek Goel <huntbag@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch introduces the capability for firmware to handle the stop
states instead. A bit is set based on the discovery of the feature
and correspondingly also the responsibility to handle the stop states.

If Kernel does not know about stop version, it can fallback to opal for
idle stop support if firmware-stop-supported property is present.

Earlier this patch was posted as part of this series :
https://lkml.org/lkml/2020/3/4/589

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Signed-off-by: Abhishek Goel <huntbag@linux.vnet.ibm.com>
---

 v1->v2: This patch is newly added in this series.

 arch/powerpc/include/asm/processor.h  |  1 +
 arch/powerpc/kernel/dt_cpu_ftrs.c     |  8 ++++++++
 arch/powerpc/platforms/powernv/idle.c | 27 ++++++++++++++++-----------
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 66fa20476d0e..d5c6532b11ef 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -430,6 +430,7 @@ extern unsigned long cpuidle_disable;
 enum idle_boot_override {IDLE_NO_OVERRIDE = 0, IDLE_POWERSAVE_OFF};
 
 #define STOP_ENABLE		0x00000001
+#define FIRMWARE_STOP_ENABLE	0x00000010
 
 #define STOP_VERSION_P9       0x1
 
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index db1a525e090d..ff4a87b79702 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -298,6 +298,13 @@ static int __init feat_enable_idle_stop(struct dt_cpu_feature *f)
 	return 1;
 }
 
+static int __init feat_enable_firmware_stop(struct dt_cpu_feature *f)
+{
+	stop_dep.cpuidle_prop |= FIRMWARE_STOP_ENABLE;
+
+	return 1;
+}
+
 static int __init feat_enable_mmu_hash(struct dt_cpu_feature *f)
 {
 	u64 lpcr;
@@ -592,6 +599,7 @@ static struct dt_cpu_feature_match __initdata
 	{"idle-nap", feat_enable_idle_nap, 0},
 	{"alignment-interrupt-dsisr", feat_enable_align_dsisr, 0},
 	{"idle-stop", feat_enable_idle_stop, 0},
+	{"firmware-stop-supported", feat_enable_firmware_stop, 0},
 	{"machine-check-power8", feat_enable_mce_power8, 0},
 	{"performance-monitor-power8", feat_enable_pmu_power8, 0},
 	{"data-stream-control-register", feat_enable_dscr, CPU_FTR_DSCR},
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 538f0842ac3f..0de5de81902e 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -633,16 +633,6 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	unsigned long mmcr0 = 0;
 	struct p9_sprs sprs = {}; /* avoid false used-uninitialised */
 	bool sprs_saved = false;
-	int rc = 0;
-
-	/*
-	 * Kernel takes decision whether to make OPAL call or not. This logic
-	 * will be combined with the logic for BE opal to take decision.
-	 */
-	if (firmware_stop_supported) {
-		rc = opal_cpu_idle(cpu_to_be64(__pa(&srr1)), (uint64_t) psscr);
-		goto out;
-	}
 
 	if (!(psscr & (PSSCR_EC|PSSCR_ESL))) {
 		/* EC=ESL=0 case */
@@ -835,6 +825,19 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	return srr1;
 }
 
+static unsigned long power9_firmware_idle_stop(unsigned long psscr, bool mmu_on)
+{
+	unsigned long srr1;
+	int rc;
+
+	rc = opal_cpu_idle(cpu_to_be64(__pa(&srr1)), (uint64_t) psscr);
+
+	if (mmu_on)
+		mtmsr(MSR_KERNEL);
+	return srr1;
+
+}
+
 #ifdef CONFIG_HOTPLUG_CPU
 static unsigned long power9_offline_stop(unsigned long psscr)
 {
@@ -1394,9 +1397,11 @@ static int __init pnv_init_idle_states(void)
 	    !(stop_dep.cpuidle_prop & STOP_ENABLE))
 		goto out;
 
-	/* Check for supported version in kernel */
+	/* Check for supported version in kernel or fallback to kernel*/
 	if (stop_dep.stop_version & STOP_VERSION_P9) {
 		stop_dep.idle_stop = power9_idle_stop;
+	} else if (stop_dep.cpuidle_prop & FIRMWARE_STOP_ENABLE) {
+		stop_dep.idle_stop = power9_firmware_idle_stop;
 	} else {
 		stop_dep.idle_stop = NULL;
 		goto out;
-- 
2.17.1

