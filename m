Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E491B9511
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 04:12:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499SwJ6l15zDqWf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 12:12:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499StG2nX7zDqNd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 12:10:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 499StF52xQz8swh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 12:10:45 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 499StF4CT4z9sSY; Mon, 27 Apr 2020 12:10:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=huntbag@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 499StF0Bn6z9sSK;
 Mon, 27 Apr 2020 12:10:44 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R21hA5018203; Sun, 26 Apr 2020 22:10:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30me4uxjr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Apr 2020 22:10:40 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03R229wd019277;
 Sun, 26 Apr 2020 22:10:40 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30me4uxjqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Apr 2020 22:10:40 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03R2A4Cc025737;
 Mon, 27 Apr 2020 02:10:38 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 30mcu5jth7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 02:10:38 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03R2AZfE62063000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 02:10:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9279A405C;
 Mon, 27 Apr 2020 02:10:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D32EA405F;
 Mon, 27 Apr 2020 02:10:34 +0000 (GMT)
Received: from ltc-wspoon6.aus.stglabs.ibm.com (unknown [9.40.193.95])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 02:10:34 +0000 (GMT)
From: Abhishek Goel <huntbag@linux.vnet.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC 1/3] powernv/cpuidle : Support for pre-entry and post exit of
 stop state in firmware
Date: Sun, 26 Apr 2020 21:10:25 -0500
Message-Id: <20200427021027.114582-1-huntbag@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-26_11:2020-04-24,
 2020-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270011
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
For deep stop states in which additional SPRs are lost, saving and
restoration will be done in OPAL.

This idea was first proposed by Nick here:
https://patchwork.ozlabs.org/patch/1208159/

The corresponding skiboot patch for this kernel patch is here:
https://patchwork.ozlabs.org/project/skiboot/list/?series=172831

When we callback from OPAL into kernel, r13 is clobbered. So, to
access PACA we need to restore it from HSPRGO. In future we can
handle this into OPAL as in here:
https://patchwork.ozlabs.org/patch/1245275/

Signed-off-by: Abhishek Goel <huntbag@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

 v1->v2 : No change in this patch.

 arch/powerpc/include/asm/opal-api.h        |  8 ++++-
 arch/powerpc/include/asm/opal.h            |  3 ++
 arch/powerpc/kernel/idle_book3s.S          |  5 +++
 arch/powerpc/platforms/powernv/idle.c      | 37 ++++++++++++++++++++++
 arch/powerpc/platforms/powernv/opal-call.c |  2 ++
 5 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index c1f25a760eb1..a2c782c99c9e 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -214,7 +214,9 @@
 #define OPAL_SECVAR_GET				176
 #define OPAL_SECVAR_GET_NEXT			177
 #define OPAL_SECVAR_ENQUEUE_UPDATE		178
-#define OPAL_LAST				178
+#define OPAL_REGISTER_OS_OPS			181
+#define OPAL_CPU_IDLE				182
+#define OPAL_LAST				182
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
@@ -1181,6 +1183,10 @@ struct opal_mpipl_fadump {
 	struct	opal_mpipl_region region[];
 } __packed;
 
+struct opal_os_ops {
+	__be64 os_idle_stop;
+};
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __OPAL_API_H */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 9986ac34b8e2..3c340bc4df8e 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -400,6 +400,9 @@ void opal_powercap_init(void);
 void opal_psr_init(void);
 void opal_sensor_groups_init(void);
 
+extern int64_t opal_register_os_ops(struct opal_os_ops *os_ops);
+extern int64_t opal_cpu_idle(__be64 srr1_addr, uint64_t psscr);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_OPAL_H */
diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_book3s.S
index 22f249b6f58d..8d287d1d06c0 100644
--- a/arch/powerpc/kernel/idle_book3s.S
+++ b/arch/powerpc/kernel/idle_book3s.S
@@ -49,6 +49,8 @@ _GLOBAL(isa300_idle_stop_noloss)
  */
 _GLOBAL(isa300_idle_stop_mayloss)
 	mtspr 	SPRN_PSSCR,r3
+	mr	r6, r13
+	mfspr	r13, SPRN_HSPRG0
 	std	r1,PACAR1(r13)
 	mflr	r4
 	mfcr	r5
@@ -74,6 +76,7 @@ _GLOBAL(isa300_idle_stop_mayloss)
 	std	r31,-8*18(r1)
 	std	r4,-8*19(r1)
 	std	r5,-8*20(r1)
+	std	r6,-8*21(r1)
 	/* 168 bytes */
 	PPC_STOP
 	b	.	/* catch bugs */
@@ -91,8 +94,10 @@ _GLOBAL(idle_return_gpr_loss)
 	ld	r1,PACAR1(r13)
 	ld	r4,-8*19(r1)
 	ld	r5,-8*20(r1)
+	ld	r6,-8*21(r1)
 	mtlr	r4
 	mtcr	r5
+	mr	r13,r6
 	/*
 	 * KVM nap requires r2 to be saved, rather than just restoring it
 	 * from PACATOC. This could be avoided for that less common case
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 78599bca66c2..1841027b25c5 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -35,6 +35,7 @@
 static u32 supported_cpuidle_states;
 struct pnv_idle_states_t *pnv_idle_states;
 int nr_pnv_idle_states;
+static bool firmware_stop_supported;
 
 /*
  * The default stop state that will be used by ppc_md.power_save
@@ -602,6 +603,25 @@ struct p9_sprs {
 	u64 uamor;
 };
 
+/*
+ * This function is called from OPAL if firmware support for stop
+ * states is present and enabled. It provides a fallback for idle
+ * stop states via OPAL.
+ */
+static uint64_t os_idle_stop(uint64_t psscr, bool save_gprs)
+{
+	/*
+	 * For lite state which does not lose even GPRS we call
+	 * idle_stop_noloss while for all other states we call
+	 * idle_stop_mayloss. Saving and restoration of other additional
+	 * SPRs if required is handled in OPAL. All the quirks are also
+	 * handled in OPAL.
+	 */
+	if (!save_gprs)
+		return isa300_idle_stop_noloss(psscr);
+	return isa300_idle_stop_mayloss(psscr);
+}
+
 static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 {
 	int cpu = raw_smp_processor_id();
@@ -613,6 +633,16 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	unsigned long mmcr0 = 0;
 	struct p9_sprs sprs = {}; /* avoid false used-uninitialised */
 	bool sprs_saved = false;
+	int rc = 0;
+
+	/*
+	 * Kernel takes decision whether to make OPAL call or not. This logic
+	 * will be combined with the logic for BE opal to take decision.
+	 */
+	if (firmware_stop_supported) {
+		rc = opal_cpu_idle(cpu_to_be64(__pa(&srr1)), (uint64_t) psscr);
+		goto out;
+	}
 
 	if (!(psscr & (PSSCR_EC|PSSCR_ESL))) {
 		/* EC=ESL=0 case */
@@ -1232,6 +1262,10 @@ static int pnv_parse_cpuidle_dt(void)
 		pr_warn("opal: PowerMgmt Node not found\n");
 		return -ENODEV;
 	}
+
+	if (of_device_is_compatible(np, "firmware-stop-supported"))
+		firmware_stop_supported = true;
+
 	nr_idle_states = of_property_count_u32_elems(np,
 						"ibm,cpu-idle-state-flags");
 
@@ -1326,6 +1360,7 @@ static int pnv_parse_cpuidle_dt(void)
 
 static int __init pnv_init_idle_states(void)
 {
+	struct opal_os_ops os_ops;
 	int cpu;
 	int rc = 0;
 
@@ -1349,6 +1384,8 @@ static int __init pnv_init_idle_states(void)
 		}
 	}
 
+	os_ops.os_idle_stop = be64_to_cpu(os_idle_stop);
+	rc = opal_register_os_ops((struct opal_os_ops *)(&os_ops));
 	/* In case we error out nr_pnv_idle_states will be zero */
 	nr_pnv_idle_states = 0;
 	supported_cpuidle_states = 0;
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 5cd0f52d258f..c885e607ba62 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -293,3 +293,5 @@ OPAL_CALL(opal_mpipl_query_tag,			OPAL_MPIPL_QUERY_TAG);
 OPAL_CALL(opal_secvar_get,			OPAL_SECVAR_GET);
 OPAL_CALL(opal_secvar_get_next,			OPAL_SECVAR_GET_NEXT);
 OPAL_CALL(opal_secvar_enqueue_update,		OPAL_SECVAR_ENQUEUE_UPDATE);
+OPAL_CALL(opal_register_os_ops,			OPAL_REGISTER_OS_OPS);
+OPAL_CALL(opal_cpu_idle,			OPAL_CPU_IDLE);
-- 
2.17.1

