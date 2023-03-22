Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA266C4261
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 06:49:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhHbd4dl2z3fCh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 16:49:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DzlAyUQZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DzlAyUQZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhHXh4wNlz3c6P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 16:46:43 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M2BNfS001054
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=B8streqaDSGrc9jS1nMasgyNzD95Jdci1yrqTDvcAqk=;
 b=DzlAyUQZrxe2hfqGouZHhckcB68wQDur47I6PCNZfTxUTMSRX95aH7ZiOKAU12tJ8KjZ
 bPi5wzXl2NE6VBDfWGE2pxXOna6FY8iclk5QejK0hqlE9oYtAY+653DZqQxy1OTipp7I
 hhynf31IEiAUWnzXmP1FFkGCmpBMk1CeEM01pWMYFMVE6sfr27FRamkQSAt/680dupV/
 CTHogMiY3owFzoyBCaDdrDo5fEJQUc+S/om919f2jQnisQcvOLum/kSxGPidBJxjzBI5
 bpnrsW9LiEf2oJL9B+KCkhO/iuK90jUYQ3TYAXKQm6Tfv6TpzAVxDmue2fM8b8kqBBnz OQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfnmay322-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32M3A1BV022403
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pd4x6dftf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32M5kaiN22872602
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:36 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2791D20043
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:36 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28DB92004F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:35 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 83470602FE;
	Wed, 22 Mar 2023 16:46:32 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/9] powerpc/dexcr: Add initial Dynamic Execution Control Register (DEXCR) support
Date: Wed, 22 Mar 2023 16:46:05 +1100
Message-Id: <20230322054612.1340573-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322054612.1340573-1-bgray@linux.ibm.com>
References: <20230322054612.1340573-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hds_HjeOplwIXM7y1WIPvNoJpfYLgPni
X-Proofpoint-ORIG-GUID: hds_HjeOplwIXM7y1WIPvNoJpfYLgPni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 mlxlogscore=880 malwarescore=0 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303220039
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ISA 3.1B introduces the Dynamic Execution Control Register (DEXCR). It
is a per-cpu register that allows control over various CPU behaviours
including branch hint usage, indirect branch speculation, and
hashst/hashchk support.

Add some definitions and basic support for the DEXCR in the kernel.
Right now it just

  * Zero initialises the DEXCR and HASHKEYR when a CPU onlines.
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
v1:	* Only make a CPU feature for NPHIE. We only need to know if the
	  hashst/hashchk functionality is supported for a static DEXCR.
	* Initialise the DEXCR to 0 when each CPU comes online. Remove
	  the dexcr_init() and get_thread_dexcr() functions.
	* No longer track the DEXCR in a per-thread field.
	* Remove the made-up Opal features
---
 arch/powerpc/include/asm/book3s/64/kexec.h | 5 +++++
 arch/powerpc/include/asm/cputable.h        | 4 +++-
 arch/powerpc/include/asm/reg.h             | 7 +++++++
 arch/powerpc/kernel/cpu_setup_power.c      | 8 ++++++++
 arch/powerpc/kernel/prom.c                 | 1 +
 5 files changed, 24 insertions(+), 1 deletion(-)

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
index 1e8b2e04e626..0cebfefe0d5c 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -384,7 +384,14 @@
 #define SPRN_HRMOR	0x139	/* Real mode offset register */
 #define SPRN_HSRR0	0x13A	/* Hypervisor Save/Restore 0 */
 #define SPRN_HSRR1	0x13B	/* Hypervisor Save/Restore 1 */
+#define SPRN_HASHKEYR	0x1D4	/* Non-privileged hashst/hashchk key register */
 #define SPRN_ASDR	0x330	/* Access segment descriptor register */
+#define SPRN_DEXCR	0x33C	/* Dynamic execution control register */
+#define   DEXCR_PR_BIT(aspect)	PPC_BIT(32 + (aspect))
+#define   DEXCR_PR_SBHE		DEXCR_PR_BIT(0)	/* Speculative Branch Hint Enable */
+#define   DEXCR_PR_IBRTPD	DEXCR_PR_BIT(3)	/* Indirect Branch Recurrent Target Prediction Disable */
+#define   DEXCR_PR_SRAPD	DEXCR_PR_BIT(4)	/* Subroutine Return Address Prediction Disable */
+#define   DEXCR_PR_NPHIE	DEXCR_PR_BIT(5)	/* Non-Privileged Hash Instruction Enable */
 #define SPRN_IC		0x350	/* Virtual Instruction Count */
 #define SPRN_VTB	0x351	/* Virtual Time Base */
 #define SPRN_LDBAR	0x352	/* LD Base Address Register */
diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
index 097c033668f0..c00721801a1b 100644
--- a/arch/powerpc/kernel/cpu_setup_power.c
+++ b/arch/powerpc/kernel/cpu_setup_power.c
@@ -126,6 +126,12 @@ static void init_PMU_ISA31(void)
 	mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
 }
 
+static void init_DEXCR(void)
+{
+	mtspr(SPRN_DEXCR, 0);
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
2.39.2

