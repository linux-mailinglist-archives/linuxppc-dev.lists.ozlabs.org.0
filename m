Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F17A710AE3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 11:53:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NHgb13BhzDqnn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 21:53:31 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NHMM2nsszDqb5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 21:39:27 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 47A62B435;
 Wed, 27 Nov 2019 10:39:24 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 rebase 04/34] powerpc/64s/exception: Expand EXC_COMMON and
 EXC_COMMON_ASYNC macros
Date: Wed, 27 Nov 2019 11:38:40 +0100
Message-Id: <d9dcb0fadba7cd93132155136d9c74a4b291cce7.1574803684.git.msuchanek@suse.de>
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

These don't provide a large amount of code sharing. Removing them
makes code easier to shuffle around. For example, some of the common
instructions will be moved into the common code gen macro.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 160 ++++++++++++++++++++-------
 1 file changed, 117 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 087df86d03ff..cefe2e9a9e05 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -757,28 +757,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 #define FINISH_NAP
 #endif
 
-#define EXC_COMMON(name, realvec, hdlr)					\
-	EXC_COMMON_BEGIN(name);						\
-	INT_COMMON realvec, PACA_EXGEN, 1, 1, 1, 0, 0 ;			\
-	bl	save_nvgprs;						\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
-	bl	hdlr;							\
-	b	ret_from_except
-
-/*
- * Like EXC_COMMON, but for exceptions that can occur in the idle task and
- * therefore need the special idle handling (finish nap and runlatch)
- */
-#define EXC_COMMON_ASYNC(name, realvec, hdlr)				\
-	EXC_COMMON_BEGIN(name);						\
-	INT_COMMON realvec, PACA_EXGEN, 1, 1, 1, 0, 0 ;			\
-	FINISH_NAP;							\
-	RUNLATCH_ON;							\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
-	bl	hdlr;							\
-	b	ret_from_except_lite
-
-
 /*
  * There are a few constraints to be concerned with.
  * - Real mode exceptions code/data must be located at their physical location.
@@ -1349,7 +1327,13 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 	INT_HANDLER hardware_interrupt, 0x500, virt=1, hsrr=EXC_HV_OR_STD, bitmask=IRQS_DISABLED, kvm=1
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 INT_KVM_HANDLER hardware_interrupt, 0x500, EXC_HV_OR_STD, PACA_EXGEN, 0
-EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
+EXC_COMMON_BEGIN(hardware_interrupt_common)
+	INT_COMMON 0x500, PACA_EXGEN, 1, 1, 1, 0, 0
+	FINISH_NAP
+	RUNLATCH_ON
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	do_IRQ
+	b	ret_from_except_lite
 
 
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
@@ -1455,7 +1439,13 @@ EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 	INT_HANDLER decrementer, 0x900, virt=1, bitmask=IRQS_DISABLED
 EXC_VIRT_END(decrementer, 0x4900, 0x80)
 INT_KVM_HANDLER decrementer, 0x900, EXC_STD, PACA_EXGEN, 0
-EXC_COMMON_ASYNC(decrementer_common, 0x900, timer_interrupt)
+EXC_COMMON_BEGIN(decrementer_common)
+	INT_COMMON 0x900, PACA_EXGEN, 1, 1, 1, 0, 0
+	FINISH_NAP
+	RUNLATCH_ON
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	timer_interrupt
+	b	ret_from_except_lite
 
 
 EXC_REAL_BEGIN(hdecrementer, 0x980, 0x80)
@@ -1465,7 +1455,12 @@ EXC_VIRT_BEGIN(hdecrementer, 0x4980, 0x80)
 	INT_HANDLER hdecrementer, 0x980, virt=1, hsrr=EXC_HV, kvm=1
 EXC_VIRT_END(hdecrementer, 0x4980, 0x80)
 INT_KVM_HANDLER hdecrementer, 0x980, EXC_HV, PACA_EXGEN, 0
-EXC_COMMON(hdecrementer_common, 0x980, hdec_interrupt)
+EXC_COMMON_BEGIN(hdecrementer_common)
+	INT_COMMON 0x980, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	hdec_interrupt
+	b	ret_from_except
 
 
 EXC_REAL_BEGIN(doorbell_super, 0xa00, 0x100)
@@ -1475,11 +1470,17 @@ EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
 	INT_HANDLER doorbell_super, 0xa00, virt=1, bitmask=IRQS_DISABLED
 EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
 INT_KVM_HANDLER doorbell_super, 0xa00, EXC_STD, PACA_EXGEN, 0
+EXC_COMMON_BEGIN(doorbell_super_common)
+	INT_COMMON 0xa00, PACA_EXGEN, 1, 1, 1, 0, 0
+	FINISH_NAP
+	RUNLATCH_ON
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
-EXC_COMMON_ASYNC(doorbell_super_common, 0xa00, doorbell_exception)
+	bl	doorbell_exception
 #else
-EXC_COMMON_ASYNC(doorbell_super_common, 0xa00, unknown_exception)
+	bl	unknown_exception
 #endif
+	b	ret_from_except_lite
 
 
 EXC_REAL_NONE(0xb00, 0x100)
@@ -1623,7 +1624,12 @@ EXC_VIRT_BEGIN(single_step, 0x4d00, 0x100)
 	INT_HANDLER single_step, 0xd00, virt=1
 EXC_VIRT_END(single_step, 0x4d00, 0x100)
 INT_KVM_HANDLER single_step, 0xd00, EXC_STD, PACA_EXGEN, 0
-EXC_COMMON(single_step_common, 0xd00, single_step_exception)
+EXC_COMMON_BEGIN(single_step_common)
+	INT_COMMON 0xd00, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	single_step_exception
+	b	ret_from_except
 
 
 EXC_REAL_BEGIN(h_data_storage, 0xe00, 0x20)
@@ -1654,7 +1660,12 @@ EXC_VIRT_BEGIN(h_instr_storage, 0x4e20, 0x20)
 	INT_HANDLER h_instr_storage, 0xe20, ool=1, virt=1, hsrr=EXC_HV, kvm=1
 EXC_VIRT_END(h_instr_storage, 0x4e20, 0x20)
 INT_KVM_HANDLER h_instr_storage, 0xe20, EXC_HV, PACA_EXGEN, 0
-EXC_COMMON(h_instr_storage_common, 0xe20, unknown_exception)
+EXC_COMMON_BEGIN(h_instr_storage_common)
+	INT_COMMON 0xe20, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	unknown_exception
+	b	ret_from_except
 
 
 EXC_REAL_BEGIN(emulation_assist, 0xe40, 0x20)
@@ -1664,7 +1675,12 @@ EXC_VIRT_BEGIN(emulation_assist, 0x4e40, 0x20)
 	INT_HANDLER emulation_assist, 0xe40, ool=1, virt=1, hsrr=EXC_HV, kvm=1
 EXC_VIRT_END(emulation_assist, 0x4e40, 0x20)
 INT_KVM_HANDLER emulation_assist, 0xe40, EXC_HV, PACA_EXGEN, 0
-EXC_COMMON(emulation_assist_common, 0xe40, emulation_assist_interrupt)
+EXC_COMMON_BEGIN(emulation_assist_common)
+	INT_COMMON 0xe40, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	emulation_assist_interrupt
+	b	ret_from_except
 
 
 /*
@@ -1721,11 +1737,17 @@ EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
 	INT_HANDLER h_doorbell, 0xe80, ool=1, virt=1, hsrr=EXC_HV, bitmask=IRQS_DISABLED, kvm=1
 EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
 INT_KVM_HANDLER h_doorbell, 0xe80, EXC_HV, PACA_EXGEN, 0
+EXC_COMMON_BEGIN(h_doorbell_common)
+	INT_COMMON 0xe80, PACA_EXGEN, 1, 1, 1, 0, 0
+	FINISH_NAP
+	RUNLATCH_ON
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
-EXC_COMMON_ASYNC(h_doorbell_common, 0xe80, doorbell_exception)
+	bl	doorbell_exception
 #else
-EXC_COMMON_ASYNC(h_doorbell_common, 0xe80, unknown_exception)
+	bl	unknown_exception
 #endif
+	b	ret_from_except_lite
 
 
 EXC_REAL_BEGIN(h_virt_irq, 0xea0, 0x20)
@@ -1735,7 +1757,13 @@ EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
 	INT_HANDLER h_virt_irq, 0xea0, ool=1, virt=1, hsrr=EXC_HV, bitmask=IRQS_DISABLED, kvm=1
 EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 INT_KVM_HANDLER h_virt_irq, 0xea0, EXC_HV, PACA_EXGEN, 0
-EXC_COMMON_ASYNC(h_virt_irq_common, 0xea0, do_IRQ)
+EXC_COMMON_BEGIN(h_virt_irq_common)
+	INT_COMMON 0xea0, PACA_EXGEN, 1, 1, 1, 0, 0
+	FINISH_NAP
+	RUNLATCH_ON
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	do_IRQ
+	b	ret_from_except_lite
 
 
 EXC_REAL_NONE(0xec0, 0x20)
@@ -1751,7 +1779,13 @@ EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
 	INT_HANDLER performance_monitor, 0xf00, ool=1, virt=1, bitmask=IRQS_PMI_DISABLED
 EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 INT_KVM_HANDLER performance_monitor, 0xf00, EXC_STD, PACA_EXGEN, 0
-EXC_COMMON_ASYNC(performance_monitor_common, 0xf00, performance_monitor_exception)
+EXC_COMMON_BEGIN(performance_monitor_common)
+	INT_COMMON 0xf00, PACA_EXGEN, 1, 1, 1, 0, 0
+	FINISH_NAP
+	RUNLATCH_ON
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	performance_monitor_exception
+	b	ret_from_except_lite
 
 
 EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
@@ -1842,7 +1876,12 @@ EXC_VIRT_BEGIN(facility_unavailable, 0x4f60, 0x20)
 	INT_HANDLER facility_unavailable, 0xf60, ool=1, virt=1
 EXC_VIRT_END(facility_unavailable, 0x4f60, 0x20)
 INT_KVM_HANDLER facility_unavailable, 0xf60, EXC_STD, PACA_EXGEN, 0
-EXC_COMMON(facility_unavailable_common, 0xf60, facility_unavailable_exception)
+EXC_COMMON_BEGIN(facility_unavailable_common)
+	INT_COMMON 0xf60, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	facility_unavailable_exception
+	b	ret_from_except
 
 
 EXC_REAL_BEGIN(h_facility_unavailable, 0xf80, 0x20)
@@ -1852,7 +1891,12 @@ EXC_VIRT_BEGIN(h_facility_unavailable, 0x4f80, 0x20)
 	INT_HANDLER h_facility_unavailable, 0xf80, ool=1, virt=1, hsrr=EXC_HV, kvm=1
 EXC_VIRT_END(h_facility_unavailable, 0x4f80, 0x20)
 INT_KVM_HANDLER h_facility_unavailable, 0xf80, EXC_HV, PACA_EXGEN, 0
-EXC_COMMON(h_facility_unavailable_common, 0xf80, facility_unavailable_exception)
+EXC_COMMON_BEGIN(h_facility_unavailable_common)
+	INT_COMMON 0xf80, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	facility_unavailable_exception
+	b	ret_from_except
 
 
 EXC_REAL_NONE(0xfa0, 0x20)
@@ -1873,7 +1917,12 @@ EXC_REAL_BEGIN(cbe_system_error, 0x1200, 0x100)
 EXC_REAL_END(cbe_system_error, 0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
 INT_KVM_HANDLER cbe_system_error, 0x1200, EXC_HV, PACA_EXGEN, 1
-EXC_COMMON(cbe_system_error_common, 0x1200, cbe_system_error_exception)
+EXC_COMMON_BEGIN(cbe_system_error_common)
+	INT_COMMON 0x1200, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	cbe_system_error_exception
+	b	ret_from_except
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
@@ -1887,7 +1936,12 @@ EXC_VIRT_BEGIN(instruction_breakpoint, 0x5300, 0x100)
 	INT_HANDLER instruction_breakpoint, 0x1300, virt=1
 EXC_VIRT_END(instruction_breakpoint, 0x5300, 0x100)
 INT_KVM_HANDLER instruction_breakpoint, 0x1300, EXC_STD, PACA_EXGEN, 1
-EXC_COMMON(instruction_breakpoint_common, 0x1300, instruction_breakpoint_exception)
+EXC_COMMON_BEGIN(instruction_breakpoint_common)
+	INT_COMMON 0x1300, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	instruction_breakpoint_exception
+	b	ret_from_except
 
 
 EXC_REAL_NONE(0x1400, 0x100)
@@ -1987,7 +2041,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	b	.
 #endif
 
-EXC_COMMON(denorm_common, 0x1500, unknown_exception)
+EXC_COMMON_BEGIN(denorm_common)
+	INT_COMMON 0x1500, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	unknown_exception
+	b	ret_from_except
 
 
 #ifdef CONFIG_CBE_RAS
@@ -1996,7 +2055,12 @@ EXC_REAL_BEGIN(cbe_maintenance, 0x1600, 0x100)
 EXC_REAL_END(cbe_maintenance, 0x1600, 0x100)
 EXC_VIRT_NONE(0x5600, 0x100)
 INT_KVM_HANDLER cbe_maintenance, 0x1600, EXC_HV, PACA_EXGEN, 1
-EXC_COMMON(cbe_maintenance_common, 0x1600, cbe_maintenance_exception)
+EXC_COMMON_BEGIN(cbe_maintenance_common)
+	INT_COMMON 0x1600, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	cbe_maintenance_exception
+	b	ret_from_except
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1600, 0x100)
 EXC_VIRT_NONE(0x5600, 0x100)
@@ -2010,11 +2074,16 @@ EXC_VIRT_BEGIN(altivec_assist, 0x5700, 0x100)
 	INT_HANDLER altivec_assist, 0x1700, virt=1
 EXC_VIRT_END(altivec_assist, 0x5700, 0x100)
 INT_KVM_HANDLER altivec_assist, 0x1700, EXC_STD, PACA_EXGEN, 0
+EXC_COMMON_BEGIN(altivec_assist_common)
+	INT_COMMON 0x1700, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
-EXC_COMMON(altivec_assist_common, 0x1700, altivec_assist_exception)
+	bl	altivec_assist_exception
 #else
-EXC_COMMON(altivec_assist_common, 0x1700, unknown_exception)
+	bl	unknown_exception
 #endif
+	b	ret_from_except
 
 
 #ifdef CONFIG_CBE_RAS
@@ -2023,7 +2092,12 @@ EXC_REAL_BEGIN(cbe_thermal, 0x1800, 0x100)
 EXC_REAL_END(cbe_thermal, 0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
 INT_KVM_HANDLER cbe_thermal, 0x1800, EXC_HV, PACA_EXGEN, 1
-EXC_COMMON(cbe_thermal_common, 0x1800, cbe_thermal_exception)
+EXC_COMMON_BEGIN(cbe_thermal_common)
+	INT_COMMON 0x1800, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	cbe_thermal_exception
+	b	ret_from_except
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
-- 
2.23.0

