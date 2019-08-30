Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B52A3A2C2E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 03:16:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KM4R3ryVzDr8t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 11:16:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KM2c5bTVzDqvZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 11:14:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46KM2c28j7z9sBp; Fri, 30 Aug 2019 11:14:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46KM2c1fyjz9sNC; Fri, 30 Aug 2019 11:14:32 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/64s/exceptions: Use keyword params to shorten arg
 lists
Date: Fri, 30 Aug 2019 11:14:26 +1000
Message-Id: <20190830011426.16810-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The argument lists for the INT_HANDLER macro are getting a bit
unwieldy. Use keyword parameters with default values to shorten them.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/exceptions-64s.S | 120 +++++++++++++--------------
 1 file changed, 60 insertions(+), 60 deletions(-)

This slots in after patch 22 of Nick's mega series.

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a476bb2f80f3..10037981ff2a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -619,7 +619,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  * - Fall through and continue executing in real, unrelocated mode.
  *   This is done if early=2.
  */
-.macro INT_HANDLER name, vec, ool, early, virt, hsrr, area, ri, dar, dsisr, bitmask, kvm
+.macro INT_HANDLER name, vec, ool=0, early=0, virt=0, hsrr=0, area=PACA_EXGEN, ri=1, dar=0, dsisr=0, bitmask=0, kvm=0
 	EXCEPTION_PROLOG_0 \area
 	.if \ool
 	.if !\virt
@@ -812,7 +812,7 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 #endif
 
-	INT_HANDLER system_reset, 0x100, 0, 0, 0, EXC_STD, PACA_EXNMI, 0, 0, 0, 0, 1
+	INT_HANDLER system_reset, 0x100, area=PACA_EXNMI, ri=0, kvm=1
 	/*
 	 * MSR_RI is not enabled, because PACA_EXNMI and nmi stack is
 	 * being used, so a nested NMI exception would corrupt it.
@@ -842,7 +842,7 @@ TRAMP_REAL_BEGIN(system_reset_idle_wake)
  */
 TRAMP_REAL_BEGIN(system_reset_fwnmi)
 	/* See comment at system_reset exception, don't turn on RI */
-	INT_HANDLER system_reset, 0x100, 0, 0, 0, EXC_STD, PACA_EXNMI, 0, 0, 0, 0, 0
+	INT_HANDLER system_reset, 0x100, area=PACA_EXNMI, ri=0
 
 #endif /* CONFIG_PPC_PSERIES */
 
@@ -905,7 +905,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
-	INT_HANDLER machine_check, 0x200, 0, 1, 0, EXC_STD, PACA_EXMC, 0, 1, 1, 0, 0
+	INT_HANDLER machine_check, 0x200, early=1, area=PACA_EXMC, dar=1, dsisr=1
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
@@ -917,7 +917,7 @@ EXC_VIRT_NONE(0x4200, 0x100)
 #ifdef CONFIG_PPC_PSERIES
 TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	/* See comment at machine_check exception, don't turn on RI */
-	INT_HANDLER machine_check, 0x200, 0, 1, 0, EXC_STD, PACA_EXMC, 0, 1, 1, 0, 0
+	INT_HANDLER machine_check, 0x200, early=1, area=PACA_EXMC, dar=1, dsisr=1
 #endif
 
 TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
@@ -1068,7 +1068,7 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	MACHINE_CHECK_HANDLER_WINDUP
 	/* See comment at machine_check exception, don't turn on RI */
-	INT_HANDLER machine_check, 0x200, 0, 0, 0, EXC_STD, PACA_EXMC, 0, 1, 1, 0, 1
+	INT_HANDLER machine_check, 0x200, area=PACA_EXMC, ri=0, dar=1, dsisr=1, kvm=1
 
 EXC_COMMON_BEGIN(machine_check_common)
 	/*
@@ -1154,10 +1154,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
-	INT_HANDLER data_access, 0x300, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 1
+	INT_HANDLER data_access, 0x300, ool=1, dar=1, dsisr=1, kvm=1
 EXC_REAL_END(data_access, 0x300, 0x80)
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
-	INT_HANDLER data_access, 0x300, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 0
+	INT_HANDLER data_access, 0x300, virt=1, dar=1, dsisr=1
 EXC_VIRT_END(data_access, 0x4300, 0x80)
 
 TRAMP_KVM_SKIP(PACA_EXGEN, 0x300)
@@ -1185,10 +1185,10 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
-	INT_HANDLER data_access_slb, 0x380, 1, 0, 0, 0, PACA_EXSLB, 1, 1, 0, 0, 1
+	INT_HANDLER data_access_slb, 0x380, ool=1, area=PACA_EXSLB, dar=1, kvm=1
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
-	INT_HANDLER data_access_slb, 0x380, 0, 0, 1, 0, PACA_EXSLB, 1, 1, 0, 0, 0
+	INT_HANDLER data_access_slb, 0x380, virt=1, area=PACA_EXSLB, dar=1
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 
 TRAMP_KVM_SKIP(PACA_EXSLB, 0x380)
@@ -1220,10 +1220,10 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(instruction_access, 0x400, 0x80)
-	INT_HANDLER instruction_access, 0x400, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER instruction_access, 0x400, kvm=1
 EXC_REAL_END(instruction_access, 0x400, 0x80)
 EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
-	INT_HANDLER instruction_access, 0x400, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	INT_HANDLER instruction_access, 0x400, virt=1
 EXC_VIRT_END(instruction_access, 0x4400, 0x80)
 
 TRAMP_KVM(PACA_EXGEN, 0x400)
@@ -1245,10 +1245,10 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(instruction_access_slb, 0x480, 0x80)
-	INT_HANDLER instruction_access_slb, 0x480, 0, 0, 0, EXC_STD, PACA_EXSLB, 1, 0, 0, 0, 1
+	INT_HANDLER instruction_access_slb, 0x480, area=PACA_EXSLB, kvm=1
 EXC_REAL_END(instruction_access_slb, 0x480, 0x80)
 EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
-	INT_HANDLER instruction_access_slb, 0x480, 0, 0, 1, EXC_STD, PACA_EXSLB, 1, 0, 0, 0, 0
+	INT_HANDLER instruction_access_slb, 0x480, virt=1, area=PACA_EXSLB
 EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
 TRAMP_KVM(PACA_EXSLB, 0x480)
 
@@ -1277,10 +1277,10 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	b	ret_from_except
 
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
-	INT_HANDLER hardware_interrupt, 0x500, 0, 0, 0, EXC_HV_OR_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	INT_HANDLER hardware_interrupt, 0x500, hsrr=EXC_HV_OR_STD, bitmask=IRQS_DISABLED, kvm=1
 EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
-	INT_HANDLER hardware_interrupt, 0x500, 0, 0, 1, EXC_HV_OR_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	INT_HANDLER hardware_interrupt, 0x500, virt=1, hsrr=EXC_HV_OR_STD, bitmask=IRQS_DISABLED, kvm=1
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 
 TRAMP_KVM(PACA_EXGEN, 0x500)
@@ -1289,10 +1289,10 @@ EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 
 
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
-	INT_HANDLER alignment, 0x600, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 1
+	INT_HANDLER alignment, 0x600, dar=1, dsisr=1, kvm=1
 EXC_REAL_END(alignment, 0x600, 0x100)
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
-	INT_HANDLER alignment, 0x600, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 0
+	INT_HANDLER alignment, 0x600, virt=1, dar=1, dsisr=1
 EXC_VIRT_END(alignment, 0x4600, 0x100)
 
 TRAMP_KVM(PACA_EXGEN, 0x600)
@@ -1310,10 +1310,10 @@ EXC_COMMON_BEGIN(alignment_common)
 
 
 EXC_REAL_BEGIN(program_check, 0x700, 0x100)
-	INT_HANDLER program_check, 0x700, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER program_check, 0x700, kvm=1
 EXC_REAL_END(program_check, 0x700, 0x100)
 EXC_VIRT_BEGIN(program_check, 0x4700, 0x100)
-	INT_HANDLER program_check, 0x700, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	INT_HANDLER program_check, 0x700, virt=1
 EXC_VIRT_END(program_check, 0x4700, 0x100)
 TRAMP_KVM(PACA_EXGEN, 0x700)
 EXC_COMMON_BEGIN(program_check_common)
@@ -1352,10 +1352,10 @@ EXC_COMMON_BEGIN(program_check_common)
 
 
 EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
-	INT_HANDLER fp_unavailable, 0x800, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER fp_unavailable, 0x800, kvm=1
 EXC_REAL_END(fp_unavailable, 0x800, 0x100)
 EXC_VIRT_BEGIN(fp_unavailable, 0x4800, 0x100)
-	INT_HANDLER fp_unavailable, 0x800, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	INT_HANDLER fp_unavailable, 0x800, virt=1
 EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
 TRAMP_KVM(PACA_EXGEN, 0x800)
 EXC_COMMON_BEGIN(fp_unavailable_common)
@@ -1390,30 +1390,30 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 
 
 EXC_REAL_BEGIN(decrementer, 0x900, 0x80)
-	INT_HANDLER decrementer, 0x900, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	INT_HANDLER decrementer, 0x900, ool=1, bitmask=IRQS_DISABLED, kvm=1
 EXC_REAL_END(decrementer, 0x900, 0x80)
 EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
-	INT_HANDLER decrementer, 0x900, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 0
+	INT_HANDLER decrementer, 0x900, virt=1, bitmask=IRQS_DISABLED
 EXC_VIRT_END(decrementer, 0x4900, 0x80)
 TRAMP_KVM(PACA_EXGEN, 0x900)
 EXC_COMMON_ASYNC(decrementer_common, 0x900, timer_interrupt)
 
 
 EXC_REAL_BEGIN(hdecrementer, 0x980, 0x80)
-	INT_HANDLER hdecrementer, 0x980, 0, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER hdecrementer, 0x980, hsrr=EXC_HV, kvm=1
 EXC_REAL_END(hdecrementer, 0x980, 0x80)
 EXC_VIRT_BEGIN(hdecrementer, 0x4980, 0x80)
-	INT_HANDLER hdecrementer, 0x980, 0, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER hdecrementer, 0x980, virt=1, hsrr=EXC_HV, kvm=1
 EXC_VIRT_END(hdecrementer, 0x4980, 0x80)
 TRAMP_KVM_HV(PACA_EXGEN, 0x980)
 EXC_COMMON(hdecrementer_common, 0x980, hdec_interrupt)
 
 
 EXC_REAL_BEGIN(doorbell_super, 0xa00, 0x100)
-	INT_HANDLER doorbell_super, 0xa00, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	INT_HANDLER doorbell_super, 0xa00, bitmask=IRQS_DISABLED, kvm=1
 EXC_REAL_END(doorbell_super, 0xa00, 0x100)
 EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
-	INT_HANDLER doorbell_super, 0xa00, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 0
+	INT_HANDLER doorbell_super, 0xa00, virt=1, bitmask=IRQS_DISABLED
 EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
 TRAMP_KVM(PACA_EXGEN, 0xa00)
 #ifdef CONFIG_PPC_DOORBELL
@@ -1558,20 +1558,20 @@ TRAMP_KVM_BEGIN(do_kvm_0xc00)
 
 
 EXC_REAL_BEGIN(single_step, 0xd00, 0x100)
-	INT_HANDLER single_step, 0xd00, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER single_step, 0xd00, kvm=1
 EXC_REAL_END(single_step, 0xd00, 0x100)
 EXC_VIRT_BEGIN(single_step, 0x4d00, 0x100)
-	INT_HANDLER single_step, 0xd00, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	INT_HANDLER single_step, 0xd00, virt=1
 EXC_VIRT_END(single_step, 0x4d00, 0x100)
 TRAMP_KVM(PACA_EXGEN, 0xd00)
 EXC_COMMON(single_step_common, 0xd00, single_step_exception)
 
 
 EXC_REAL_BEGIN(h_data_storage, 0xe00, 0x20)
-	INT_HANDLER h_data_storage, 0xe00, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER h_data_storage, 0xe00, ool=1, hsrr=EXC_HV, kvm=1
 EXC_REAL_END(h_data_storage, 0xe00, 0x20)
 EXC_VIRT_BEGIN(h_data_storage, 0x4e00, 0x20)
-	INT_HANDLER h_data_storage, 0xe00, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER h_data_storage, 0xe00, ool=1, virt=1, hsrr=EXC_HV, kvm=1
 EXC_VIRT_END(h_data_storage, 0x4e00, 0x20)
 TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0xe00)
 EXC_COMMON_BEGIN(h_data_storage_common)
@@ -1597,20 +1597,20 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(h_instr_storage, 0xe20, 0x20)
-	INT_HANDLER h_instr_storage, 0xe20, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER h_instr_storage, 0xe20, ool=1, hsrr=EXC_HV, kvm=1
 EXC_REAL_END(h_instr_storage, 0xe20, 0x20)
 EXC_VIRT_BEGIN(h_instr_storage, 0x4e20, 0x20)
-	INT_HANDLER h_instr_storage, 0xe20, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER h_instr_storage, 0xe20, ool=1, virt=1, hsrr=EXC_HV, kvm=1
 EXC_VIRT_END(h_instr_storage, 0x4e20, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe20)
 EXC_COMMON(h_instr_storage_common, 0xe20, unknown_exception)
 
 
 EXC_REAL_BEGIN(emulation_assist, 0xe40, 0x20)
-	INT_HANDLER emulation_assist, 0xe40, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER emulation_assist, 0xe40, ool=1, hsrr=EXC_HV, kvm=1
 EXC_REAL_END(emulation_assist, 0xe40, 0x20)
 EXC_VIRT_BEGIN(emulation_assist, 0x4e40, 0x20)
-	INT_HANDLER emulation_assist, 0xe40, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER emulation_assist, 0xe40, ool=1, virt=1, hsrr=EXC_HV, kvm=1
 EXC_VIRT_END(emulation_assist, 0x4e40, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe40)
 EXC_COMMON(emulation_assist_common, 0xe40, emulation_assist_interrupt)
@@ -1622,7 +1622,7 @@ EXC_COMMON(emulation_assist_common, 0xe40, emulation_assist_interrupt)
  * mode.
  */
 EXC_REAL_BEGIN(hmi_exception, 0xe60, 0x20)
-	INT_HANDLER hmi_exception, 0xe60, 1, 1, 0, EXC_HV, PACA_EXGEN, 0, 0, 0, 0, 1
+	INT_HANDLER hmi_exception, 0xe60, ool=1, early=1, hsrr=EXC_HV, ri=0, kvm=1
 EXC_REAL_END(hmi_exception, 0xe60, 0x20)
 EXC_VIRT_NONE(0x4e60, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe60)
@@ -1652,7 +1652,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	 * firmware.
 	 */
 	EXCEPTION_RESTORE_REGS EXC_HV
-	INT_HANDLER hmi_exception, 0xe60, 0, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	INT_HANDLER hmi_exception, 0xe60, hsrr=EXC_HV, bitmask=IRQS_DISABLED, kvm=1
 
 EXC_COMMON_BEGIN(hmi_exception_common)
 	EXCEPTION_COMMON(PACA_EXGEN, 0xe60)
@@ -1666,10 +1666,10 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 
 
 EXC_REAL_BEGIN(h_doorbell, 0xe80, 0x20)
-	INT_HANDLER h_doorbell, 0xe80, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	INT_HANDLER h_doorbell, 0xe80, ool=1, hsrr=EXC_HV, bitmask=IRQS_DISABLED, kvm=1
 EXC_REAL_END(h_doorbell, 0xe80, 0x20)
 EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
-	INT_HANDLER h_doorbell, 0xe80, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	INT_HANDLER h_doorbell, 0xe80, ool=1, virt=1, hsrr=EXC_HV, bitmask=IRQS_DISABLED, kvm=1
 EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe80)
 #ifdef CONFIG_PPC_DOORBELL
@@ -1680,10 +1680,10 @@ EXC_COMMON_ASYNC(h_doorbell_common, 0xe80, unknown_exception)
 
 
 EXC_REAL_BEGIN(h_virt_irq, 0xea0, 0x20)
-	INT_HANDLER h_virt_irq, 0xea0, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	INT_HANDLER h_virt_irq, 0xea0, ool=1, hsrr=EXC_HV, bitmask=IRQS_DISABLED, kvm=1
 EXC_REAL_END(h_virt_irq, 0xea0, 0x20)
 EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
-	INT_HANDLER h_virt_irq, 0xea0, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
+	INT_HANDLER h_virt_irq, 0xea0, ool=1, virt=1, hsrr=EXC_HV, bitmask=IRQS_DISABLED, kvm=1
 EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xea0)
 EXC_COMMON_ASYNC(h_virt_irq_common, 0xea0, do_IRQ)
@@ -1696,20 +1696,20 @@ EXC_VIRT_NONE(0x4ee0, 0x20)
 
 
 EXC_REAL_BEGIN(performance_monitor, 0xf00, 0x20)
-	INT_HANDLER performance_monitor, 0xf00, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_PMI_DISABLED, 1
+	INT_HANDLER performance_monitor, 0xf00, ool=1, bitmask=IRQS_PMI_DISABLED, kvm=1
 EXC_REAL_END(performance_monitor, 0xf00, 0x20)
 EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
-	INT_HANDLER performance_monitor, 0xf00, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_PMI_DISABLED, 0
+	INT_HANDLER performance_monitor, 0xf00, ool=1, virt=1, bitmask=IRQS_PMI_DISABLED
 EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 TRAMP_KVM(PACA_EXGEN, 0xf00)
 EXC_COMMON_ASYNC(performance_monitor_common, 0xf00, performance_monitor_exception)
 
 
 EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
-	INT_HANDLER altivec_unavailable, 0xf20, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER altivec_unavailable, 0xf20, ool=1, kvm=1
 EXC_REAL_END(altivec_unavailable, 0xf20, 0x20)
 EXC_VIRT_BEGIN(altivec_unavailable, 0x4f20, 0x20)
-	INT_HANDLER altivec_unavailable, 0xf20, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	INT_HANDLER altivec_unavailable, 0xf20, ool=1, virt=1
 EXC_VIRT_END(altivec_unavailable, 0x4f20, 0x20)
 TRAMP_KVM(PACA_EXGEN, 0xf20)
 EXC_COMMON_BEGIN(altivec_unavailable_common)
@@ -1747,10 +1747,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 
 
 EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
-	INT_HANDLER vsx_unavailable, 0xf40, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER vsx_unavailable, 0xf40, ool=1, kvm=1
 EXC_REAL_END(vsx_unavailable, 0xf40, 0x20)
 EXC_VIRT_BEGIN(vsx_unavailable, 0x4f40, 0x20)
-	INT_HANDLER vsx_unavailable, 0xf40, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	INT_HANDLER vsx_unavailable, 0xf40, ool=1, virt=1
 EXC_VIRT_END(vsx_unavailable, 0x4f40, 0x20)
 TRAMP_KVM(PACA_EXGEN, 0xf40)
 EXC_COMMON_BEGIN(vsx_unavailable_common)
@@ -1787,20 +1787,20 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 
 
 EXC_REAL_BEGIN(facility_unavailable, 0xf60, 0x20)
-	INT_HANDLER facility_unavailable, 0xf60, 1, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER facility_unavailable, 0xf60, ool=1, kvm=1
 EXC_REAL_END(facility_unavailable, 0xf60, 0x20)
 EXC_VIRT_BEGIN(facility_unavailable, 0x4f60, 0x20)
-	INT_HANDLER facility_unavailable, 0xf60, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	INT_HANDLER facility_unavailable, 0xf60, ool=1, virt=1
 EXC_VIRT_END(facility_unavailable, 0x4f60, 0x20)
 TRAMP_KVM(PACA_EXGEN, 0xf60)
 EXC_COMMON(facility_unavailable_common, 0xf60, facility_unavailable_exception)
 
 
 EXC_REAL_BEGIN(h_facility_unavailable, 0xf80, 0x20)
-	INT_HANDLER h_facility_unavailable, 0xf80, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER h_facility_unavailable, 0xf80, ool=1, hsrr=EXC_HV, kvm=1
 EXC_REAL_END(h_facility_unavailable, 0xf80, 0x20)
 EXC_VIRT_BEGIN(h_facility_unavailable, 0x4f80, 0x20)
-	INT_HANDLER h_facility_unavailable, 0xf80, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER h_facility_unavailable, 0xf80, ool=1, virt=1, hsrr=EXC_HV, kvm=1
 EXC_VIRT_END(h_facility_unavailable, 0x4f80, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xf80)
 EXC_COMMON(h_facility_unavailable_common, 0xf80, facility_unavailable_exception)
@@ -1820,7 +1820,7 @@ EXC_VIRT_NONE(0x5100, 0x100)
 
 #ifdef CONFIG_CBE_RAS
 EXC_REAL_BEGIN(cbe_system_error, 0x1200, 0x100)
-	INT_HANDLER cbe_system_error, 0x1200, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER cbe_system_error, 0x1200, ool=1, hsrr=EXC_HV, kvm=1
 EXC_REAL_END(cbe_system_error, 0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
 TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0x1200)
@@ -1832,10 +1832,10 @@ EXC_VIRT_NONE(0x5200, 0x100)
 
 
 EXC_REAL_BEGIN(instruction_breakpoint, 0x1300, 0x100)
-	INT_HANDLER instruction_breakpoint, 0x1300, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER instruction_breakpoint, 0x1300, kvm=1
 EXC_REAL_END(instruction_breakpoint, 0x1300, 0x100)
 EXC_VIRT_BEGIN(instruction_breakpoint, 0x5300, 0x100)
-	INT_HANDLER instruction_breakpoint, 0x1300, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	INT_HANDLER instruction_breakpoint, 0x1300, virt=1
 EXC_VIRT_END(instruction_breakpoint, 0x5300, 0x100)
 TRAMP_KVM_SKIP(PACA_EXGEN, 0x1300)
 EXC_COMMON(instruction_breakpoint_common, 0x1300, instruction_breakpoint_exception)
@@ -1845,7 +1845,7 @@ EXC_REAL_NONE(0x1400, 0x100)
 EXC_VIRT_NONE(0x5400, 0x100)
 
 EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
-	INT_HANDLER denorm_exception_hv, 0x1500, 0, 2, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 0
+	INT_HANDLER denorm_exception_hv, 0x1500, early=2, hsrr=EXC_HV
 #ifdef CONFIG_PPC_DENORMALISATION
 	mfspr	r10,SPRN_HSRR1
 	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
@@ -1939,7 +1939,7 @@ EXC_COMMON(denorm_common, 0x1500, unknown_exception)
 
 #ifdef CONFIG_CBE_RAS
 EXC_REAL_BEGIN(cbe_maintenance, 0x1600, 0x100)
-	INT_HANDLER cbe_maintenance, 0x1600, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER cbe_maintenance, 0x1600, ool=1, hsrr=EXC_HV, kvm=1
 EXC_REAL_END(cbe_maintenance, 0x1600, 0x100)
 EXC_VIRT_NONE(0x5600, 0x100)
 TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0x1600)
@@ -1951,10 +1951,10 @@ EXC_VIRT_NONE(0x5600, 0x100)
 
 
 EXC_REAL_BEGIN(altivec_assist, 0x1700, 0x100)
-	INT_HANDLER altivec_assist, 0x1700, 0, 0, 0, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER altivec_assist, 0x1700, kvm=1
 EXC_REAL_END(altivec_assist, 0x1700, 0x100)
 EXC_VIRT_BEGIN(altivec_assist, 0x5700, 0x100)
-	INT_HANDLER altivec_assist, 0x1700, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
+	INT_HANDLER altivec_assist, 0x1700, virt=1
 EXC_VIRT_END(altivec_assist, 0x5700, 0x100)
 TRAMP_KVM(PACA_EXGEN, 0x1700)
 #ifdef CONFIG_ALTIVEC
@@ -1966,7 +1966,7 @@ EXC_COMMON(altivec_assist_common, 0x1700, unknown_exception)
 
 #ifdef CONFIG_CBE_RAS
 EXC_REAL_BEGIN(cbe_thermal, 0x1800, 0x100)
-	INT_HANDLER cbe_thermal, 0x1800, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER cbe_thermal, 0x1800, ool=1, hsrr=EXC_HV, kvm=1
 EXC_REAL_END(cbe_thermal, 0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
 TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0x1800)
-- 
2.21.0

