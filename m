Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 675DC2151F4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 06:56:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0YDp5Ly4zDqgC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 14:56:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0Y6R6svTzDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 14:50:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B0Y6Q1jQGz9D05
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 14:50:38 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B0Y6P4dYmz9sSd; Mon,  6 Jul 2020 14:50:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=huntbag@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B0Y6P0m5Vz9sPF;
 Mon,  6 Jul 2020 14:50:36 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06643puX143928; Mon, 6 Jul 2020 00:50:35 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322paknbgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 00:50:35 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0664oYHc105610;
 Mon, 6 Jul 2020 00:50:34 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322paknbft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 00:50:34 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0664nrj2018940;
 Mon, 6 Jul 2020 04:50:32 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 322hd7svf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 04:50:32 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0664oT7758851572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 04:50:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1B17A405F;
 Mon,  6 Jul 2020 04:50:29 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EDCCA4054;
 Mon,  6 Jul 2020 04:50:28 +0000 (GMT)
Received: from bostonp9.aus.stglabs.ibm.com (unknown [9.3.23.179])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jul 2020 04:50:27 +0000 (GMT)
From: Abhishek Goel <huntbag@linux.vnet.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC v2 1/2] powerpc/powernv : Add support for pre-entry and
 post-exit of stop state using OPAL V4 OS services
Date: Sun,  5 Jul 2020 23:50:00 -0500
Message-Id: <20200706045001.77039-1-huntbag@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_02:2020-07-02,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 cotscore=-2147483648 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=979 adultscore=0 clxscore=1011 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007060032
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

This patch provides kernel framework fro opal support of save restore
of sprs in idle stop loop. Opal support for stop states is needed to
selectively enable stop states or to introduce a quirk quickly in case
a buggy stop state is present.

We make a opal call from kernel if firmware-stop-support for stop
states is present and enabled. All the quirks for pre-entry of stop
state is handled inside opal. A call from opal is made into kernel
where we execute stop afer saving of NVGPRs.
After waking up from 0x100 vector in kernel, we enter back into opal.
All the quirks in post exit path, if any, are then handled in opal,
from where we return successfully back to kernel.

Signed-off-by: Abhishek Goel <huntbag@linux.vnet.ibm.com>
---
v1->v2 : Rebased the patch on Nick's Opal V4 OS patchset

 arch/powerpc/include/asm/opal-api.h        |  4 +++-
 arch/powerpc/include/asm/opal.h            |  1 +
 arch/powerpc/platforms/powernv/idle.c      | 12 ++++++++++++
 arch/powerpc/platforms/powernv/opal-call.c |  1 +
 arch/powerpc/platforms/powernv/opal.c      | 15 +++++++++++++++
 5 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 97c5e5423827..437b6937685d 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -219,7 +219,8 @@
 #define OPAL_REPORT_TRAP			183
 #define OPAL_FIND_VM_AREA			184
 #define OPAL_REGISTER_OS_OPS			185
-#define OPAL_LAST				185
+#define OPAL_CPU_IDLE				186
+#define OPAL_LAST				186
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
@@ -1207,6 +1208,7 @@ struct opal_os_ops {
 	__be64  os_printf; /* void printf(int32_t level, const char *str) */
 	__be64  os_vm_map; /* int64_t os_vm_map(uint64_t ea, uint64_t pa, uint64_t flags) */
 	__be64  os_vm_unmap; /* void os_vm_unmap(uint64_t ea) */
+	__be64  os_idle_stop; /* void os_idle_stop(uint64_t srr1_addr, uint64_t psscr) */
 };
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 09985b7718b3..1774c056acb8 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -407,6 +407,7 @@ void opal_sensor_groups_init(void);
 
 int64_t opal_find_vm_area(uint64_t addr, struct opal_vm_area *opal_vm_area);
 int64_t opal_register_os_ops(struct opal_os_ops *ops, uint64_t size);
+int64_t opal_cpu_idle(uint64_t srr1_addr, uint64_t psscr);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 78599bca66c2..3afd4293f729 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -805,6 +805,18 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	return srr1;
 }
 
+static unsigned long power9_firmware_idle_stop(unsigned long psscr, bool mmu_on)
+{
+	unsigned long srr1;
+	int rc;
+
+	rc = opal_cpu_idle(cpu_to_be64(&srr1), (uint64_t) psscr);
+
+	if (mmu_on)
+		mtmsr(MSR_KERNEL);
+	return srr1;
+}
+
 #ifdef CONFIG_HOTPLUG_CPU
 static unsigned long power9_offline_stop(unsigned long psscr)
 {
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 11f419e76059..79076ca2de03 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -351,3 +351,4 @@ OPAL_CALL(opal_sym_to_addr,			OPAL_SYM_TO_ADDR);
 OPAL_CALL(opal_report_trap,			OPAL_REPORT_TRAP);
 OPAL_CALL(opal_find_vm_area,			OPAL_FIND_VM_AREA);
 OPAL_CALL(opal_register_os_ops,			OPAL_REGISTER_OS_OPS);
+OPAL_CALL(opal_cpu_idle,			OPAL_CPU_IDLE);
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 93b9afaf33b3..1fbf7065f918 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -1150,6 +1150,20 @@ static void os_vm_unmap(uint64_t ea)
 	local_flush_tlb_mm(mm);
 }
 
+int64_t os_idle_stop(uint64_t srr1_addr, uint64_t psscr)
+{
+	/*
+	 * For lite state which does not lose even GPRS we call
+	 * idle_stop_noloss while for all other states we call
+	 * idle_stop_mayloss. Saving and restoration of other additional
+	 * SPRs if required is handled in OPAL. All the quirks are also
+	 * handled in OPAL.
+	 */
+	if (!(psscr & (PSSCR_EC|PSSCR_ESL)))
+		return isa300_idle_stop_noloss(psscr);
+	return isa300_idle_stop_mayloss(psscr);
+}
+
 static int __init opal_init_mm(void)
 {
 	struct mm_struct *mm;
@@ -1231,6 +1245,7 @@ static int __init opal_init_early(void)
 		opal_os_ops.os_printf = cpu_to_be64(&os_printf);
 		opal_os_ops.os_vm_map = cpu_to_be64(&os_vm_map);
 		opal_os_ops.os_vm_unmap = cpu_to_be64(&os_vm_unmap);
+		opal_os_ops.os_idle_stop = cpu_to_be64(&os_idle_stop);
 		if (opal_register_os_ops(&opal_os_ops, sizeof(opal_os_ops))) {
 			pr_warn("OPAL register OS ops failed, firmware will run in v3 mode.\n");
 		} else {
-- 
2.17.1

