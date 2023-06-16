Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26860732604
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 05:52:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hziP/Lae;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj4xc0FJ6z3bhy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:52:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hziP/Lae;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj4sm3FPmz2xwH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:49:32 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3lhgo020488;
	Fri, 16 Jun 2023 03:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rzNl3cpUXF/nB/uqkOebVB+Ad88JlMcFV+1SoKTQM0s=;
 b=hziP/Laeikcn2YdUkjHGhDBTV8N9zb8+qP++AQ1okYvmdNNhHQ4sxNMMbkK7Nw5GoZ9b
 IV9LgbcfoKd0OUXYlu06bggxq50svcguEEZkRf5mHXQFXsQUxYrYytuVP1rgeL447UzQ
 2rH/RbdW/4DK6hWY7bTUWPSu//ZPksc/sajTs+sjtonXufE3Xrlc+R377oF68aJmSFU6
 VATTuizWc4dIaeqNFMZHAgih9PglqsY/IrG1PRUUo7NK10DZbDaFR0vQB4NwBhyRZS0x
 MgjcIxJDcvq1GKg9mt1y3gPpux2mFg/NsWt44JXrHbqPCZsC6KuluQ2vYzwZBkoL6fnC gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8g4yr0mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:28 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35G3lqMJ020591;
	Fri, 16 Jun 2023 03:49:28 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8g4yr0mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:27 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G2sNN4031597;
	Fri, 16 Jun 2023 03:49:25 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r4gee44ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35G3nNqE11338398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 03:49:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5684120043;
	Fri, 16 Jun 2023 03:49:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65F9120040;
	Fri, 16 Jun 2023 03:49:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 03:49:22 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6044F60125;
	Fri, 16 Jun 2023 13:49:18 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 03/11] powerpc/dexcr: Add initial Dynamic Execution Control Register (DEXCR) support
Date: Fri, 16 Jun 2023 13:48:38 +1000
Message-Id: <20230616034846.311705-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616034846.311705-1-bgray@linux.ibm.com>
References: <20230616034846.311705-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5Fh2pETYL-qoaNTZuFq85lFeSfl73tX4
X-Proofpoint-GUID: 2IEFR0w95I-CNu5SFojrdNrv56ua0y6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 lowpriorityscore=0 mlxlogscore=884 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306160032
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ISA 3.1B introduces the Dynamic Execution Control Register (DEXCR). It
is a per-cpu register that allows control over various CPU behaviours
including branch hint usage, indirect branch speculation, and
hashst/hashchk support.

Add some definitions and basic support for the DEXCR in the kernel.
Right now it just

  * Initialises the DEXCR and HASHKEYR to a fixed value when a CPU
    onlines.
  * Clears them in reset_sprs().
  * Detects when the NPHIE aspect is supported (the others don't get
    looked at in this series, so there's no need to waste a CPU_FTR
    on them).

We initialise the HASHKEYR to ensure that all cores have the same key,
so an HV enforced NPHIE + swapping cores doesn't randomly crash a
process using hash instructions. The stores to HASHKEYR are
unconditional because the ISA makes no mention of the SPR being missing
if support for doing the hashes isn't present. So all that would happen
is the HASHKEYR value gets ignored. This helps slightly if NPHIE
detection fails; e.g., we currently only detect it on pseries.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---
v3:	* Initialise DEXCR with NPHIE enabled
v2:	* More definitions for ptrace
v1:	* Only make a CPU feature for NPHIE. We only need to know if the
	  hashst/hashchk functionality is supported for a static DEXCR.
	* Initialise the DEXCR to 0 when each CPU comes online. Remove
	  the dexcr_init() and get_thread_dexcr() functions.
	* No longer track the DEXCR in a per-thread field.
	* Remove the made-up Opal features
---
 arch/powerpc/include/asm/book3s/64/kexec.h |  5 +++++
 arch/powerpc/include/asm/cputable.h        |  4 +++-
 arch/powerpc/include/asm/reg.h             | 11 +++++++++++
 arch/powerpc/kernel/cpu_setup_power.c      |  8 ++++++++
 arch/powerpc/kernel/prom.c                 |  1 +
 5 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kexec.h b/arch/powerpc/include/asm/book3s/64/kexec.h
index d4b9d476ecba..df37a76c1e9f 100644
--- a/arch/powerpc/include/asm/book3s/64/kexec.h
+++ b/arch/powerpc/include/asm/book3s/64/kexec.h
@@ -21,6 +21,11 @@ static inline void reset_sprs(void)
 			plpar_set_ciabr(0);
 	}
 
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		mtspr(SPRN_DEXCR, 0);
+		mtspr(SPRN_HASHKEYR, 0);
+	}
+
 	/*  Do we need isync()? We are going via a kexec reset */
 	isync();
 }
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 757dbded11dc..443a9d482b15 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -192,6 +192,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_P9_RADIX_PREFETCH_BUG	LONG_ASM_CONST(0x0002000000000000)
 #define CPU_FTR_ARCH_31			LONG_ASM_CONST(0x0004000000000000)
 #define CPU_FTR_DAWR1			LONG_ASM_CONST(0x0008000000000000)
+#define CPU_FTR_DEXCR_NPHIE		LONG_ASM_CONST(0x0010000000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -451,7 +452,8 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
 	    CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
-	    CPU_FTR_DAWR | CPU_FTR_DAWR1)
+	    CPU_FTR_DAWR | CPU_FTR_DAWR1 | \
+	    CPU_FTR_DEXCR_NPHIE)
 #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
 	    CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 6372e5f55ef0..ed6acb0f17e7 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -382,7 +382,18 @@
 #define SPRN_HIOR	0x137	/* 970 Hypervisor interrupt offset */
 #define SPRN_RMOR	0x138	/* Real mode offset register */
 #define SPRN_HRMOR	0x139	/* Real mode offset register */
+#define SPRN_HDEXCR_RO	0x1C7	/* Hypervisor DEXCR (non-privileged, readonly) */
+#define SPRN_HASHKEYR	0x1D4	/* Non-privileged hashst/hashchk key register */
+#define SPRN_HDEXCR	0x1D7	/* Hypervisor dynamic execution control register */
+#define SPRN_DEXCR_RO	0x32C	/* DEXCR (non-privileged, readonly) */
 #define SPRN_ASDR	0x330	/* Access segment descriptor register */
+#define SPRN_DEXCR	0x33C	/* Dynamic execution control register */
+#define   DEXCR_PR_BIT(aspect)	PPC_BIT(32 + (aspect))
+#define   DEXCR_PR_SBHE		DEXCR_PR_BIT(0)	/* Speculative Branch Hint Enable */
+#define   DEXCR_PR_IBRTPD	DEXCR_PR_BIT(3)	/* Indirect Branch Recurrent Target Prediction Disable */
+#define   DEXCR_PR_SRAPD	DEXCR_PR_BIT(4)	/* Subroutine Return Address Prediction Disable */
+#define   DEXCR_PR_NPHIE	DEXCR_PR_BIT(5)	/* Non-Privileged Hash Instruction Enable */
+#define   DEXCR_INIT		DEXCR_PR_NPHIE	/* Fixed DEXCR value to initialise all CPUs with */
 #define SPRN_IC		0x350	/* Virtual Instruction Count */
 #define SPRN_VTB	0x351	/* Virtual Time Base */
 #define SPRN_LDBAR	0x352	/* LD Base Address Register */
diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
index 097c033668f0..98bd4e6c1770 100644
--- a/arch/powerpc/kernel/cpu_setup_power.c
+++ b/arch/powerpc/kernel/cpu_setup_power.c
@@ -126,6 +126,12 @@ static void init_PMU_ISA31(void)
 	mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
 }
 
+static void init_DEXCR(void)
+{
+	mtspr(SPRN_DEXCR, DEXCR_INIT);
+	mtspr(SPRN_HASHKEYR, 0);
+}
+
 /*
  * Note that we can be called twice of pseudo-PVRs.
  * The parameter offset is not used.
@@ -241,6 +247,7 @@ void __setup_cpu_power10(unsigned long offset, struct cpu_spec *t)
 	init_FSCR_power10();
 	init_PMU();
 	init_PMU_ISA31();
+	init_DEXCR();
 
 	if (!init_hvmode_206(t))
 		return;
@@ -263,6 +270,7 @@ void __restore_cpu_power10(void)
 	init_FSCR_power10();
 	init_PMU();
 	init_PMU_ISA31();
+	init_DEXCR();
 
 	msr = mfmsr();
 	if (!(msr & MSR_HV))
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 9d9ee4e9e1a1..0b5878c3125b 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -182,6 +182,7 @@ static struct ibm_feature ibm_pa_features[] __initdata = {
 	  .cpu_user_ftrs2 = PPC_FEATURE2_HTM_COMP | PPC_FEATURE2_HTM_NOSC_COMP },
 
 	{ .pabyte = 64, .pabit = 0, .cpu_features = CPU_FTR_DAWR1 },
+	{ .pabyte = 68, .pabit = 5, .cpu_features = CPU_FTR_DEXCR_NPHIE },
 };
 
 /*
-- 
2.40.1

