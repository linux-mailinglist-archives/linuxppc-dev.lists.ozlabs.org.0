Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C197224364
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 20:55:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7gKr1T4qzDr2k
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 04:55:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7gHr5znkzDrMr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 04:53:28 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HIWixO033393; Fri, 17 Jul 2020 14:53:22 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32be11xh18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 14:53:22 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06HIWkqW033523;
 Fri, 17 Jul 2020 14:53:22 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32be11xh0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 14:53:22 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06HIdw1H006218;
 Fri, 17 Jul 2020 18:53:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 327527y6md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 18:53:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06HIrGSM59048030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 18:53:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBE7752057;
 Fri, 17 Jul 2020 18:53:16 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.85.74.95])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 640D35204F;
 Fri, 17 Jul 2020 18:53:12 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, benh@kernel.crashing.org,
 paulus@samba.org, mikey@neuling.org, ego@linux.vnet.ibm.com,
 svaidy@linux.ibm.com, psampat@linux.ibm.com, pratik.r.sampat@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] powerpc/powernv/idle: Replace CPU features checks with
 PVR checks
Date: Sat, 18 Jul 2020 00:23:04 +0530
Message-Id: <20200717185306.60607-2-psampat@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200717185306.60607-1-psampat@linux.ibm.com>
References: <20200717185306.60607-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_09:2020-07-17,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007170129
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As the idle framework's architecture is incomplete, hence instead of
checking for just the processor type advertised in the device tree CPU
features; check for the Processor Version Register (PVR) so that finer
granularity can be leveraged while making processor checks.

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/idle.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 2dd467383a88..f62904f70fc6 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -92,7 +92,7 @@ static int pnv_save_sprs_for_deep_states(void)
 		if (rc != 0)
 			return rc;
 
-		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+		if (pvr_version_is(PVR_POWER9)) {
 			rc = opal_slw_set_reg(pir, P9_STOP_SPR_MSR, msr_val);
 			if (rc)
 				return rc;
@@ -116,7 +116,7 @@ static int pnv_save_sprs_for_deep_states(void)
 				return rc;
 
 			/* Only p8 needs to set extra HID regiters */
-			if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
+			if (!pvr_version_is(PVR_POWER9)) {
 
 				rc = opal_slw_set_reg(pir, SPRN_HID1, hid1_val);
 				if (rc != 0)
@@ -971,7 +971,7 @@ unsigned long pnv_cpu_offline(unsigned int cpu)
 
 	__ppc64_runlatch_off();
 
-	if (cpu_has_feature(CPU_FTR_ARCH_300) && deepest_stop_found) {
+	if (pvr_version_is(PVR_POWER9) && deepest_stop_found) {
 		unsigned long psscr;
 
 		psscr = mfspr(SPRN_PSSCR);
@@ -1175,7 +1175,7 @@ static void __init pnv_disable_deep_states(void)
 	pr_warn("cpuidle-powernv: Disabling idle states that lose full context\n");
 	pr_warn("cpuidle-powernv: Idle power-savings, CPU-Hotplug affected\n");
 
-	if (cpu_has_feature(CPU_FTR_ARCH_300) &&
+	if (pvr_version_is(PVR_POWER9) &&
 	    (pnv_deepest_stop_flag & OPAL_PM_LOSE_FULL_CONTEXT)) {
 		/*
 		 * Use the default stop state for CPU-Hotplug
@@ -1205,7 +1205,7 @@ static void __init pnv_probe_idle_states(void)
 		return;
 	}
 
-	if (cpu_has_feature(CPU_FTR_ARCH_300))
+	if (pvr_version_is(PVR_POWER9))
 		pnv_power9_idle_init();
 
 	for (i = 0; i < nr_pnv_idle_states; i++)
@@ -1278,7 +1278,7 @@ static int pnv_parse_cpuidle_dt(void)
 		pnv_idle_states[i].residency_ns = temp_u32[i];
 
 	/* For power9 */
-	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+	if (pvr_version_is(PVR_POWER9)) {
 		/* Read pm_crtl_val */
 		if (of_property_read_u64_array(np, "ibm,cpu-idle-state-psscr",
 					       temp_u64, nr_idle_states)) {
@@ -1337,7 +1337,7 @@ static int __init pnv_init_idle_states(void)
 		if (cpu == cpu_first_thread_sibling(cpu))
 			p->idle_state = (1 << threads_per_core) - 1;
 
-		if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
+		if (!pvr_version_is(PVR_POWER9)) {
 			/* P7/P8 nap */
 			p->thread_idle_state = PNV_THREAD_RUNNING;
 		} else {
-- 
2.25.4

