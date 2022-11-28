Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E4639FB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:50:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL91n0yvQz3f5D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:50:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ANWaRdA+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ANWaRdA+;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8wj6RsNz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:45:57 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS0bxYO024139;
	Mon, 28 Nov 2022 02:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eIdX3qbh+kuOYYc89N11UElSjKpV3ksMC+onDLaZqwM=;
 b=ANWaRdA+SzZ+f9s7nw3gsymD+vu3V/ddeo9daYrXfX4VoOkBMv6z5lSB5KSgve+VoW10
 VKW0e93gKHuBKwzJD4A37tgZrgze8PMvuoTif1cAEvNheY49RbZK+bd7pa+yJ92RwucK
 hMOVRT27Dc7au94o+51pO+xm4vWg34WxZZ1Ds8lHbCHZlvoBIVfyUEu8rLoWopt/Q+DK
 1P4pticNtMM3TbIKYLTE8kLjbnjG9JHp0/5Dc3zzHnkfydzEs18dlGHWL/ICGJMIPRYK
 A/5OlpCDLndz9tvFY1d5J4McrL7lSsDn3TqLYidbIDxIA/wfo5ynvbUcxpoJK3GsKbED 6Q== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3v8j4c36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:47 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS2aain020877;
	Mon, 28 Nov 2022 02:45:45 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3m3ae99ubv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS2dJng2032336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 02:39:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7429B4C050;
	Mon, 28 Nov 2022 02:45:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C88864C040;
	Mon, 28 Nov 2022 02:45:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 02:45:42 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 486F96032A;
	Mon, 28 Nov 2022 13:45:39 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 02/13] powerpc: Add initial Dynamic Execution Control Register (DEXCR) support
Date: Mon, 28 Nov 2022 13:44:47 +1100
Message-Id: <20221128024458.46121-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128024458.46121-1-bgray@linux.ibm.com>
References: <20221128024458.46121-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rxSKxrdPsgBMtD4AVNLsf_n8AyJJD9VB
X-Proofpoint-ORIG-GUID: rxSKxrdPsgBMtD4AVNLsf_n8AyJJD9VB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280018
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
Cc: ajd@linux.ibm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, cmr@bluescreens.de, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ISA 3.1B introduces the Dynamic Execution Control Register (DEXCR). It
is a per-cpu register that allows control over various CPU behaviours
including branch hint usage, indirect branch speculation, and
hashst/hashchk support.

Though introduced in 3.1B, no CPUs using 3.1 were released, so
CPU_FTR_ARCH_31 is used to determine support for the register itself.
Support for each DEXCR bit (aspect) is reported separately by the
firmware.

Add various definitions and basic support for the DEXCR in the kernel.
Right now it just initialises and maintains the DEXCR on process
creation/swap, and clears it in reset_sprs().

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kexec.h |  3 +++
 arch/powerpc/include/asm/cputable.h        |  8 ++++++-
 arch/powerpc/include/asm/processor.h       | 13 +++++++++++
 arch/powerpc/include/asm/reg.h             |  6 ++++++
 arch/powerpc/kernel/Makefile               |  1 +
 arch/powerpc/kernel/dexcr.c                | 25 ++++++++++++++++++++++
 arch/powerpc/kernel/dt_cpu_ftrs.c          |  4 ++++
 arch/powerpc/kernel/process.c              | 13 ++++++++++-
 arch/powerpc/kernel/prom.c                 |  4 ++++
 9 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/kernel/dexcr.c

diff --git a/arch/powerpc/include/asm/book3s/64/kexec.h b/arch/powerpc/include/asm/book3s/64/kexec.h
index d4b9d476ecba..563baf94a962 100644
--- a/arch/powerpc/include/asm/book3s/64/kexec.h
+++ b/arch/powerpc/include/asm/book3s/64/kexec.h
@@ -21,6 +21,9 @@ static inline void reset_sprs(void)
 			plpar_set_ciabr(0);
 	}
 
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		mtspr(SPRN_DEXCR, 0);
+
 	/*  Do we need isync()? We are going via a kexec reset */
 	isync();
 }
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 757dbded11dc..03bc192f2d8b 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -192,6 +192,10 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_P9_RADIX_PREFETCH_BUG	LONG_ASM_CONST(0x0002000000000000)
 #define CPU_FTR_ARCH_31			LONG_ASM_CONST(0x0004000000000000)
 #define CPU_FTR_DAWR1			LONG_ASM_CONST(0x0008000000000000)
+#define CPU_FTR_DEXCR_SBHE		LONG_ASM_CONST(0x0010000000000000)
+#define CPU_FTR_DEXCR_IBRTPD		LONG_ASM_CONST(0x0020000000000000)
+#define CPU_FTR_DEXCR_SRAPD		LONG_ASM_CONST(0x0040000000000000)
+#define CPU_FTR_DEXCR_NPHIE		LONG_ASM_CONST(0x0080000000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -451,7 +455,9 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
 	    CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
-	    CPU_FTR_DAWR | CPU_FTR_DAWR1)
+	    CPU_FTR_DAWR | CPU_FTR_DAWR1 | \
+	    CPU_FTR_DEXCR_SBHE | CPU_FTR_DEXCR_IBRTPD | CPU_FTR_DEXCR_SRAPD | \
+	    CPU_FTR_DEXCR_NPHIE)
 #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
 	    CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 631802999d59..0a8a793b8b8b 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -446,6 +446,19 @@ int exit_vmx_usercopy(void);
 int enter_vmx_ops(void);
 void *exit_vmx_ops(void *dest);
 
+#ifdef CONFIG_PPC_BOOK3S_64
+
+unsigned long get_thread_dexcr(struct thread_struct const *t);
+
+#else
+
+static inline unsigned long get_thread_dexcr(struct thread_struct const *t)
+{
+	return 0;
+}
+
+#endif /* CONFIG_PPC_BOOK3S_64 */
+
 #endif /* __KERNEL__ */
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_PROCESSOR_H */
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 1e8b2e04e626..cdd1f174c399 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -385,6 +385,12 @@
 #define SPRN_HSRR0	0x13A	/* Hypervisor Save/Restore 0 */
 #define SPRN_HSRR1	0x13B	/* Hypervisor Save/Restore 1 */
 #define SPRN_ASDR	0x330	/* Access segment descriptor register */
+#define SPRN_DEXCR	0x33C	/* Dynamic execution control register */
+#define   DEXCR_PRO_MASK(aspect)	__MASK(63 - (32 + (aspect)))	/* Aspect number to problem state aspect mask */
+#define   DEXCR_PRO_SBHE		DEXCR_PRO_MASK(0)	/* Speculative Branch Hint Enable */
+#define   DEXCR_PRO_IBRTPD		DEXCR_PRO_MASK(3)	/* Indirect Branch Recurrent Target Prediction Disable */
+#define   DEXCR_PRO_SRAPD		DEXCR_PRO_MASK(4)	/* Subroutine Return Address Prediction Disable */
+#define   DEXCR_PRO_NPHIE		DEXCR_PRO_MASK(5)	/* Non-Privileged Hash Instruction Enable */
 #define SPRN_IC		0x350	/* Virtual Instruction Count */
 #define SPRN_VTB	0x351	/* Virtual Time Base */
 #define SPRN_LDBAR	0x352	/* LD Base Address Register */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 9b6146056e48..b112315cfdc2 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -79,6 +79,7 @@ obj-$(CONFIG_VDSO32)		+= vdso32_wrapper.o
 obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_PPC_DAWR)		+= dawr.o
+obj-$(CONFIG_PPC_BOOK3S_64)	+= dexcr.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_ppc970.o cpu_setup_pa6t.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_power.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= mce.o mce_power.o
diff --git a/arch/powerpc/kernel/dexcr.c b/arch/powerpc/kernel/dexcr.c
new file mode 100644
index 000000000000..32a0a69ff638
--- /dev/null
+++ b/arch/powerpc/kernel/dexcr.c
@@ -0,0 +1,25 @@
+#include <linux/cache.h>
+#include <linux/init.h>
+
+#include <asm/cpu_has_feature.h>
+#include <asm/cputable.h>
+#include <asm/processor.h>
+#include <asm/reg.h>
+
+#define DEFAULT_DEXCR	0
+
+static int __init dexcr_init(void)
+{
+	if (!early_cpu_has_feature(CPU_FTR_ARCH_31))
+		return 0;
+
+	mtspr(SPRN_DEXCR, DEFAULT_DEXCR);
+
+	return 0;
+}
+early_initcall(dexcr_init);
+
+unsigned long get_thread_dexcr(struct thread_struct const *t)
+{
+	return DEFAULT_DEXCR;
+}
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index c3fb9fdf5bd7..896a48211a37 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -661,6 +661,10 @@ static struct dt_cpu_feature_match __initdata
 	{"prefix-instructions", feat_enable, 0},
 	{"matrix-multiply-assist", feat_enable_mma, 0},
 	{"debug-facilities-v31", feat_enable, CPU_FTR_DAWR1},
+	{"dexcr-speculative-branch-hint-enable", feat_enable, CPU_FTR_DEXCR_SBHE},
+	{"dexcr-indirect-branch-recurrent-target-prediction-disable", feat_enable, CPU_FTR_DEXCR_IBRTPD},
+	{"dexcr-subroutine-return-address-prediction-disable", feat_enable, CPU_FTR_DEXCR_SRAPD},
+	{"dexcr-non-privileged-hash-instruction-enable", feat_enable, CPU_FTR_DEXCR_NPHIE},
 };
 
 static bool __initdata using_dt_cpu_ftrs;
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 67da147fe34d..17d26f652b80 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1228,6 +1228,13 @@ static inline void restore_sprs(struct thread_struct *old_thread,
 	if (cpu_has_feature(CPU_FTR_P9_TIDR) &&
 	    old_thread->tidr != new_thread->tidr)
 		mtspr(SPRN_TIDR, new_thread->tidr);
+
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		unsigned long new_dexcr = get_thread_dexcr(new_thread);
+
+		if (new_dexcr != get_thread_dexcr(old_thread))
+			mtspr(SPRN_DEXCR, new_dexcr);
+	}
 #endif
 
 }
@@ -1802,7 +1809,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 	setup_ksp_vsid(p, sp);
 
-#ifdef CONFIG_PPC64 
+#ifdef CONFIG_PPC64
 	if (cpu_has_feature(CPU_FTR_DSCR)) {
 		p->thread.dscr_inherit = current->thread.dscr_inherit;
 		p->thread.dscr = mfspr(SPRN_DSCR);
@@ -1939,6 +1946,10 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 	current->thread.tm_tfiar = 0;
 	current->thread.load_tm = 0;
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		mtspr(SPRN_DEXCR, get_thread_dexcr(&current->thread));
+#endif /* CONFIG_PPC_BOOK3S_64 */
 }
 EXPORT_SYMBOL(start_thread);
 
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 1eed87d954ba..eff250e1ae9a 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -180,6 +180,10 @@ static struct ibm_feature ibm_pa_features[] __initdata = {
 	  .cpu_user_ftrs2 = PPC_FEATURE2_HTM_COMP | PPC_FEATURE2_HTM_NOSC_COMP },
 
 	{ .pabyte = 64, .pabit = 0, .cpu_features = CPU_FTR_DAWR1 },
+	{ .pabyte = 68, .pabit = 0, .cpu_features = CPU_FTR_DEXCR_SBHE },
+	{ .pabyte = 68, .pabit = 3, .cpu_features = CPU_FTR_DEXCR_IBRTPD },
+	{ .pabyte = 68, .pabit = 4, .cpu_features = CPU_FTR_DEXCR_SRAPD },
+	{ .pabyte = 68, .pabit = 5, .cpu_features = CPU_FTR_DEXCR_NPHIE },
 };
 
 /*
-- 
2.38.1

