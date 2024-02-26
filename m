Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D881867167
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:39:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IY1NUbki;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjxtl16d1z86mT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:39:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IY1NUbki;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjxnz41c1z3w0l
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:35:03 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QAYYCZ008318;
	Mon, 26 Feb 2024 10:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HN/MqHYCbvaUj1cPn32DzUpLelKoXWgZjzjRxmropzw=;
 b=IY1NUbkiaenxiMX305N0kWYkWjJWnEYSGZ3/xZyLHOwor93XnZzkM51d+DMMItSCrmRi
 6+829pQTQD8/5w/03Mbwji/y3Lsmdryx49xQP+ujKcC5NY+AvYnHpKnw7vAcQ5jRWNTi
 OVUWx0M5NjvG7WAlYpTotprIZGq/SdDOAAOy4WW7pfY8P1RZiKP4MSLSu5bHpVdlgPoe
 YZJwfNnZP+Xa8Tla6U2lZDxXrz8ZHrIFcty/t4KbOymQ9Xckm6cAbSEmHbK9P8wB80uV
 +sxw+G/w3wumZuFdrYuQ7QjV9g/mLcl6Zg/wdWKhEBsG8O8l+zBvNPLmZ9cw23WcWfak lA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgpbkukc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 10:34:46 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41QAYj2b009736;
	Mon, 26 Feb 2024 10:34:45 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgpbkujvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 10:34:44 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41Q9WhdK024154;
	Mon, 26 Feb 2024 10:30:29 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0k01mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 10:30:29 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QAUNB038011304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 10:30:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 392042004B;
	Mon, 26 Feb 2024 10:30:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A869A2004E;
	Mon, 26 Feb 2024 10:30:20 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.195])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 10:30:20 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Kexec-ml <kexec@lists.infradead.org>
Subject: [PATCH linux-next v2 3/3] powerpc/kdump: Split KEXEC_CORE and CRASH_DUMP dependency
Date: Mon, 26 Feb 2024 16:00:10 +0530
Message-ID: <20240226103010.589537-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240226103010.589537-1-hbathini@linux.ibm.com>
References: <20240226103010.589537-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Iy4jI99TO3IiS5rRThhbMjtyGPRMXPIU
X-Proofpoint-ORIG-GUID: NssaNnVkaIiSGjSpHsHw0DjMuSrvhHm7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_07,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402260079
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
Cc: Baoquan He <bhe@redhat.com>, lkml <linux-kernel@vger.kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove CONFIG_CRASH_DUMP dependency on CONFIG_KEXEC. CONFIG_KEXEC_CORE
was used at places where CONFIG_CRASH_DUMP or CONFIG_CRASH_RESERVE was
appropriate. Replace with appropriate #ifdefs to support CONFIG_KEXEC
and !CONFIG_CRASH_DUMP configuration option. Also, make CONFIG_FA_DUMP
dependent on CONFIG_CRASH_DUMP to avoid unmet dependencies for FA_DUMP
with !CONFIG_KEXEC_CORE configuration option.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v2:
* Fixed a compile error for POWERNV build reported by Sourabh.

 arch/powerpc/Kconfig                 |  9 +--
 arch/powerpc/include/asm/kexec.h     | 98 ++++++++++++++--------------
 arch/powerpc/kernel/prom.c           |  2 +-
 arch/powerpc/kernel/setup-common.c   |  2 +-
 arch/powerpc/kernel/smp.c            |  4 +-
 arch/powerpc/kexec/Makefile          |  3 +-
 arch/powerpc/kexec/core.c            |  4 ++
 arch/powerpc/platforms/powernv/smp.c |  2 +-
 8 files changed, 61 insertions(+), 63 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 5cf8ad8d7e8e..e377deefa2dc 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -607,11 +607,6 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
 config ARCH_SUPPORTS_KEXEC
 	def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)
 
-config ARCH_SELECTS_KEXEC
-	def_bool y
-	depends on KEXEC
-	select CRASH_DUMP
-
 config ARCH_SUPPORTS_KEXEC_FILE
 	def_bool PPC64
 
@@ -622,7 +617,6 @@ config ARCH_SELECTS_KEXEC_FILE
 	def_bool y
 	depends on KEXEC_FILE
 	select KEXEC_ELF
-	select CRASH_DUMP
 	select HAVE_IMA_KEXEC if IMA
 
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
@@ -694,8 +688,7 @@ config ARCH_SELECTS_CRASH_DUMP
 
 config FA_DUMP
 	bool "Firmware-assisted dump"
-	depends on PPC64 && (PPC_RTAS || PPC_POWERNV)
-	select CRASH_DUMP
+	depends on CRASH_DUMP && PPC64 && (PPC_RTAS || PPC_POWERNV)
 	help
 	  A robust mechanism to get reliable kernel crash dump with
 	  assistance from firmware. This approach does not use kexec,
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index e1b43aa12175..fdb90e24dc74 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -55,59 +55,18 @@
 typedef void (*crash_shutdown_t)(void);
 
 #ifdef CONFIG_KEXEC_CORE
-
-/*
- * This function is responsible for capturing register states if coming
- * via panic or invoking dump using sysrq-trigger.
- */
-static inline void crash_setup_regs(struct pt_regs *newregs,
-					struct pt_regs *oldregs)
-{
-	if (oldregs)
-		memcpy(newregs, oldregs, sizeof(*newregs));
-	else
-		ppc_save_regs(newregs);
-}
+struct kimage;
+struct pt_regs;
 
 extern void kexec_smp_wait(void);	/* get and clear naca physid, wait for
 					  master to copy new code to 0 */
-extern int crashing_cpu;
-extern void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *));
-extern void crash_ipi_callback(struct pt_regs *);
-extern int crash_wake_offline;
-
-struct kimage;
-struct pt_regs;
 extern void default_machine_kexec(struct kimage *image);
-extern void default_machine_crash_shutdown(struct pt_regs *regs);
-extern int crash_shutdown_register(crash_shutdown_t handler);
-extern int crash_shutdown_unregister(crash_shutdown_t handler);
-
-extern void crash_kexec_prepare(void);
-extern void crash_kexec_secondary(struct pt_regs *regs);
-int __init overlaps_crashkernel(unsigned long start, unsigned long size);
-extern void reserve_crashkernel(void);
 extern void machine_kexec_mask_interrupts(void);
 
-static inline bool kdump_in_progress(void)
-{
-	return crashing_cpu >= 0;
-}
-
 void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_code_buffer,
 			 unsigned long start_address) __noreturn;
-
 void kexec_copy_flush(struct kimage *image);
 
-#if defined(CONFIG_CRASH_DUMP)
-bool is_kdump_kernel(void);
-#define is_kdump_kernel			is_kdump_kernel
-#if defined(CONFIG_PPC_RTAS)
-void crash_free_reserved_phys_range(unsigned long begin, unsigned long end);
-#define crash_free_reserved_phys_range crash_free_reserved_phys_range
-#endif /* CONFIG_PPC_RTAS */
-#endif /* CONFIG_CRASH_DUMP */
-
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops kexec_elf64_ops;
 
@@ -152,15 +111,56 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 
 #endif /* CONFIG_KEXEC_FILE */
 
-#else /* !CONFIG_KEXEC_CORE */
-static inline void crash_kexec_secondary(struct pt_regs *regs) { }
+#endif /* CONFIG_KEXEC_CORE */
+
+#ifdef CONFIG_CRASH_RESERVE
+int __init overlaps_crashkernel(unsigned long start, unsigned long size);
+extern void reserve_crashkernel(void);
+#else
+static inline void reserve_crashkernel(void) {}
+static inline int overlaps_crashkernel(unsigned long start, unsigned long size) { return 0; }
+#endif
 
-static inline int overlaps_crashkernel(unsigned long start, unsigned long size)
+#if defined(CONFIG_CRASH_DUMP)
+/*
+ * This function is responsible for capturing register states if coming
+ * via panic or invoking dump using sysrq-trigger.
+ */
+static inline void crash_setup_regs(struct pt_regs *newregs,
+					struct pt_regs *oldregs)
 {
-	return 0;
+	if (oldregs)
+		memcpy(newregs, oldregs, sizeof(*newregs));
+	else
+		ppc_save_regs(newregs);
+}
+
+extern int crashing_cpu;
+extern void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *));
+extern void crash_ipi_callback(struct pt_regs *regs);
+extern int crash_wake_offline;
+
+extern int crash_shutdown_register(crash_shutdown_t handler);
+extern int crash_shutdown_unregister(crash_shutdown_t handler);
+extern void default_machine_crash_shutdown(struct pt_regs *regs);
+
+extern void crash_kexec_prepare(void);
+extern void crash_kexec_secondary(struct pt_regs *regs);
+
+static inline bool kdump_in_progress(void)
+{
+	return crashing_cpu >= 0;
 }
 
-static inline void reserve_crashkernel(void) { ; }
+bool is_kdump_kernel(void);
+#define is_kdump_kernel			is_kdump_kernel
+#if defined(CONFIG_PPC_RTAS)
+void crash_free_reserved_phys_range(unsigned long begin, unsigned long end);
+#define crash_free_reserved_phys_range crash_free_reserved_phys_range
+#endif /* CONFIG_PPC_RTAS */
+
+#else /* !CONFIG_CRASH_DUMP */
+static inline void crash_kexec_secondary(struct pt_regs *regs) { }
 
 static inline int crash_shutdown_register(crash_shutdown_t handler)
 {
@@ -183,7 +183,7 @@ static inline void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *))
 {
 }
 
-#endif /* CONFIG_KEXEC_CORE */
+#endif /* CONFIG_CRASH_DUMP */
 
 #ifdef CONFIG_PPC_BOOK3S_64
 #include <asm/book3s/64/kexec.h>
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 1dc32a058156..cd8d8883de90 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -475,7 +475,7 @@ static int __init early_init_dt_scan_chosen_ppc(unsigned long node,
 		tce_alloc_end = *lprop;
 #endif
 
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_RESERVE
 	lprop = of_get_flat_dt_prop(node, "linux,crashkernel-base", NULL);
 	if (lprop)
 		crashk_res.start = *lprop;
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 8cb84d46319e..34aef8f753f9 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -110,7 +110,7 @@ int ppc_do_canonicalize_irqs;
 EXPORT_SYMBOL(ppc_do_canonicalize_irqs);
 #endif
 
-#ifdef CONFIG_VMCORE_INFO
+#ifdef CONFIG_CRASH_DUMP
 /* This keeps a track of which one is the crashing cpu. */
 int crashing_cpu = -1;
 #endif
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 693334c20d07..aa81c95c73a4 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -588,7 +588,7 @@ void smp_send_debugger_break(void)
 }
 #endif
 
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_DUMP
 void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *))
 {
 	int cpu;
@@ -631,7 +631,7 @@ void crash_smp_send_stop(void)
 
 	stopped = true;
 
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_DUMP
 	if (kexec_crash_image) {
 		crash_kexec_prepare();
 		return;
diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index 91e96f5168b7..8e469c4da3f8 100644
--- a/arch/powerpc/kexec/Makefile
+++ b/arch/powerpc/kexec/Makefile
@@ -3,12 +3,13 @@
 # Makefile for the linux kernel.
 #
 
-obj-y				+= core.o crash.o core_$(BITS).o
+obj-y				+= core.o core_$(BITS).o
 
 obj-$(CONFIG_PPC32)		+= relocate_32.o
 
 obj-$(CONFIG_KEXEC_FILE)	+= file_load.o ranges.o file_load_$(BITS).o elf_$(BITS).o
 obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info.o
+obj-$(CONFIG_CRASH_DUMP)	+= crash.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_core_$(BITS).o := n
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 3ff4411ed496..b8333a49ea5d 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -44,10 +44,12 @@ void machine_kexec_mask_interrupts(void) {
 	}
 }
 
+#ifdef CONFIG_CRASH_DUMP
 void machine_crash_shutdown(struct pt_regs *regs)
 {
 	default_machine_crash_shutdown(regs);
 }
+#endif
 
 void machine_kexec_cleanup(struct kimage *image)
 {
@@ -77,6 +79,7 @@ void machine_kexec(struct kimage *image)
 	for(;;);
 }
 
+#ifdef CONFIG_CRASH_RESERVE
 void __init reserve_crashkernel(void)
 {
 	unsigned long long crash_size, crash_base, total_mem_sz;
@@ -251,3 +254,4 @@ static int __init kexec_setup(void)
 	return 0;
 }
 late_initcall(kexec_setup);
+#endif /* CONFIG_CRASH_RESERVE */
diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index 9e1a25398f98..8f14f0581a21 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -434,7 +434,7 @@ void __init pnv_smp_init(void)
 	smp_ops = &pnv_smp_ops;
 
 #ifdef CONFIG_HOTPLUG_CPU
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_DUMP
 	crash_wake_offline = 1;
 #endif
 #endif
-- 
2.43.2

