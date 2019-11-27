Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE0710AEAC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 12:27:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NJQm2KkLzDqHq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 22:27:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NHMn1qDQzDqdd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 21:39:49 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 00E01B24A;
 Wed, 27 Nov 2019 10:39:46 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 rebase 18/34] powerpc/64s/exception: Clean up SRR specifiers
Date: Wed, 27 Nov 2019 11:38:54 +0100
Message-Id: <1f06dea00032f66c41a5696bbef95337d31a919a.1574803685.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574803684.git.msuchanek@suse.de>
References: <cover.1574803684.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Christian Brauner <christian@brauner.io>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Diana Craciun <diana.craciun@nxp.com>,
 Firoz Khan <firoz.khan@linaro.org>, Allison Randal <allison@lohutok.net>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Jagadeesh Pagadala <jagdsh.linux@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Dmitry Vyukov <dvyukov@google.com>, Daniel Axtens <dja@axtens.net>,
 Gustavo Romero <gromero@linux.ibm.com>, Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Brajeswar Ghosh <brajeswar.linux@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

Remove more magic numbers and replace with nicely named bools.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 68 +++++++++++++---------------
 1 file changed, 32 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 9494403b9586..ef37d0ab6594 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -105,11 +105,6 @@ name:
 	ori	reg,reg,(ABS_ADDR(label))@l;				\
 	addis	reg,reg,(ABS_ADDR(label))@h
 
-/* Exception register prefixes */
-#define EXC_HV_OR_STD	2 /* depends on HVMODE */
-#define EXC_HV		1
-#define EXC_STD		0
-
 /*
  * Branch to label using its 0xC000 address. This results in instruction
  * address suitable for MSR[IR]=0 or 1, which allows relocation to be turned
@@ -128,6 +123,7 @@ name:
  */
 #define IVEC		.L_IVEC_\name\()
 #define IHSRR		.L_IHSRR_\name\()
+#define IHSRR_IF_HVMODE	.L_IHSRR_IF_HVMODE_\name\()
 #define IAREA		.L_IAREA_\name\()
 #define IVIRT		.L_IVIRT_\name\()
 #define IISIDE		.L_IISIDE_\name\()
@@ -159,7 +155,10 @@ do_define_int n
 		.error "IVEC not defined"
 	.endif
 	.ifndef IHSRR
-		IHSRR=EXC_STD
+		IHSRR=0
+	.endif
+	.ifndef IHSRR_IF_HVMODE
+		IHSRR_IF_HVMODE=0
 	.endif
 	.ifndef IAREA
 		IAREA=PACA_EXGEN
@@ -257,7 +256,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r9,IAREA+EX_R9(r13)
 	ld	r10,IAREA+EX_R10(r13)
 	/* HSRR variants have the 0x2 bit added to their trap number */
-	.if IHSRR == EXC_HV_OR_STD
+	.if IHSRR_IF_HVMODE
 	BEGIN_FTR_SECTION
 	ori	r12,r12,(IVEC + 0x2)
 	FTR_SECTION_ELSE
@@ -278,7 +277,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r10,IAREA+EX_R10(r13)
 	ld	r11,IAREA+EX_R11(r13)
 	ld	r12,IAREA+EX_R12(r13)
-	.if IHSRR == EXC_HV_OR_STD
+	.if IHSRR_IF_HVMODE
 	BEGIN_FTR_SECTION
 	b	kvmppc_skip_Hinterrupt
 	FTR_SECTION_ELSE
@@ -403,7 +402,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	stw	r10,IAREA+EX_DSISR(r13)
 	.endif
 
-	.if IHSRR == EXC_HV_OR_STD
+	.if IHSRR_IF_HVMODE
 	BEGIN_FTR_SECTION
 	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
 	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
@@ -485,7 +484,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 		.abort "Bad maskable vector"
 		.endif
 
-		.if IHSRR == EXC_HV_OR_STD
+		.if IHSRR_IF_HVMODE
 		BEGIN_FTR_SECTION
 		bne	masked_Hinterrupt
 		FTR_SECTION_ELSE
@@ -618,12 +617,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
  * standard exception.
  */
-.macro EXCEPTION_RESTORE_REGS hsrr
+.macro EXCEPTION_RESTORE_REGS hsrr=0
 	/* Move original SRR0 and SRR1 into the respective regs */
 	ld	r9,_MSR(r1)
-	.if \hsrr == EXC_HV_OR_STD
-	.error "EXC_HV_OR_STD Not implemented for EXCEPTION_RESTORE_REGS"
-	.endif
 	.if \hsrr
 	mtspr	SPRN_HSRR1,r9
 	.else
@@ -898,7 +894,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
-	EXCEPTION_RESTORE_REGS EXC_STD
+	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
 
 	GEN_KVM system_reset
@@ -952,7 +948,7 @@ TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	lhz	r12,PACA_IN_MCE(r13);			\
 	subi	r12,r12,1;				\
 	sth	r12,PACA_IN_MCE(r13);			\
-	EXCEPTION_RESTORE_REGS EXC_STD
+	EXCEPTION_RESTORE_REGS
 
 EXC_COMMON_BEGIN(machine_check_early_common)
 	/*
@@ -1321,7 +1317,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 INT_DEFINE_BEGIN(hardware_interrupt)
 	IVEC=0x500
-	IHSRR=EXC_HV_OR_STD
+	IHSRR_IF_HVMODE=1
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
@@ -1490,7 +1486,7 @@ EXC_COMMON_BEGIN(decrementer_common)
 
 INT_DEFINE_BEGIN(hdecrementer)
 	IVEC=0x980
-	IHSRR=EXC_HV
+	IHSRR=1
 	ISTACK=0
 	IRECONCILE=0
 	IKVM_REAL=1
@@ -1732,7 +1728,7 @@ EXC_COMMON_BEGIN(single_step_common)
 
 INT_DEFINE_BEGIN(h_data_storage)
 	IVEC=0xe00
-	IHSRR=EXC_HV
+	IHSRR=1
 	IDAR=1
 	IDSISR=1
 	IKVM_SKIP=1
@@ -1764,7 +1760,7 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
 
 INT_DEFINE_BEGIN(h_instr_storage)
 	IVEC=0xe20
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(h_instr_storage)
@@ -1787,7 +1783,7 @@ EXC_COMMON_BEGIN(h_instr_storage_common)
 
 INT_DEFINE_BEGIN(emulation_assist)
 	IVEC=0xe40
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(emulation_assist)
@@ -1815,7 +1811,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
  */
 INT_DEFINE_BEGIN(hmi_exception_early)
 	IVEC=0xe60
-	IHSRR=EXC_HV
+	IHSRR=1
 	IREALMODE_COMMON=1
 	ISTACK=0
 	IRECONCILE=0
@@ -1825,7 +1821,7 @@ INT_DEFINE_END(hmi_exception_early)
 
 INT_DEFINE_BEGIN(hmi_exception)
 	IVEC=0xe60
-	IHSRR=EXC_HV
+	IHSRR=1
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 INT_DEFINE_END(hmi_exception)
@@ -1847,7 +1843,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	cmpdi	cr0,r3,0
 	bne	1f
 
-	EXCEPTION_RESTORE_REGS EXC_HV
+	EXCEPTION_RESTORE_REGS hsrr=1
 	HRFI_TO_USER_OR_KERNEL
 
 1:
@@ -1855,7 +1851,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	 * Go to virtual mode and pull the HMI event information from
 	 * firmware.
 	 */
-	EXCEPTION_RESTORE_REGS EXC_HV
+	EXCEPTION_RESTORE_REGS hsrr=1
 	GEN_INT_ENTRY hmi_exception, virt=0
 
 	GEN_KVM hmi_exception_early
@@ -1874,7 +1870,7 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 
 INT_DEFINE_BEGIN(h_doorbell)
 	IVEC=0xe80
-	IHSRR=EXC_HV
+	IHSRR=1
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
@@ -1903,7 +1899,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 
 INT_DEFINE_BEGIN(h_virt_irq)
 	IVEC=0xea0
-	IHSRR=EXC_HV
+	IHSRR=1
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
@@ -2073,7 +2069,7 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 
 INT_DEFINE_BEGIN(h_facility_unavailable)
 	IVEC=0xf80
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(h_facility_unavailable)
@@ -2109,7 +2105,7 @@ EXC_VIRT_NONE(0x5100, 0x100)
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_system_error)
 	IVEC=0x1200
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(cbe_system_error)
@@ -2160,8 +2156,8 @@ EXC_VIRT_NONE(0x5400, 0x100)
 
 INT_DEFINE_BEGIN(denorm_exception)
 	IVEC=0x1500
-	IHSRR=EXC_HV
-	IBRANCH_TO_COMMON=0
+	IHSRR=1
+	IBRANCH_COMMON=0
 	IKVM_REAL=1
 INT_DEFINE_END(denorm_exception)
 
@@ -2269,7 +2265,7 @@ EXC_COMMON_BEGIN(denorm_exception_common)
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_maintenance)
 	IVEC=0x1600
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(cbe_maintenance)
@@ -2321,7 +2317,7 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_thermal)
 	IVEC=0x1800
-	IHSRR=EXC_HV
+	IHSRR=1
 	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(cbe_thermal)
@@ -2384,7 +2380,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
  * - Else it is one of PACA_IRQ_MUST_HARD_MASK, so hard disable and return.
  * This is called with r10 containing the value to OR to the paca field.
  */
-.macro MASKED_INTERRUPT hsrr
+.macro MASKED_INTERRUPT hsrr=0
 	.if \hsrr
 masked_Hinterrupt:
 	.else
@@ -2531,8 +2527,8 @@ TRAMP_REAL_BEGIN(hrfi_flush_fallback)
 	hrfid
 
 USE_TEXT_SECTION()
-	MASKED_INTERRUPT EXC_STD
-	MASKED_INTERRUPT EXC_HV
+	MASKED_INTERRUPT
+	MASKED_INTERRUPT hsrr=1
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 kvmppc_skip_interrupt:
-- 
2.23.0

