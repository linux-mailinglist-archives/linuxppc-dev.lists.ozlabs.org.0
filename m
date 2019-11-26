Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F7E10A5A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 21:50:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MwyV6TwqzDqJH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 07:50:10 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mw9H08Z3zDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 07:14:27 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 57A4FAE46;
 Tue, 26 Nov 2019 20:14:23 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 16/35] powerpc/64s/exception: hdecrementer avoid touching
 the stack
Date: Tue, 26 Nov 2019 21:13:30 +0100
Message-Id: <eae832c2bfbe996b86490477b611ba8601789020.1574798487.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574798487.git.msuchanek@suse.de>
References: <cover.1574798487.git.msuchanek@suse.de>
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

The hdec interrupt handler is reported to sometimes fire in Linux if
KVM leaves it pending after a guest exists. This is harmless, so there
is a no-op handler for it.

The interrupt handler currently uses the regular kernel stack. Change
this to avoid touching the stack entirely.

This should be the last place where the regular Linux stack can be
accessed with asynchronous interrupts (including PMI) soft-masked.
It might be possible to take advantage of this invariant, e.g., to
context switch the kernel stack SLB entry without clearing MSR[EE].

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h      |  1 -
 arch/powerpc/kernel/exceptions-64s.S | 25 ++++++++++++++++++++-----
 arch/powerpc/kernel/time.c           |  9 ---------
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 08dbe3e6831c..e0107495c4de 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -24,7 +24,6 @@ extern struct clock_event_device decrementer_clockevent;
 
 
 extern void generic_calibrate_decr(void);
-extern void hdec_interrupt(struct pt_regs *regs);
 
 /* Some sane defaults: 125 MHz timebase, 1GHz processor */
 extern unsigned long ppc_proc_freq;
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 9fa71d51ecf4..7a234e6d7bf5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1491,6 +1491,8 @@ EXC_COMMON_BEGIN(decrementer_common)
 INT_DEFINE_BEGIN(hdecrementer)
 	IVEC=0x980
 	IHSRR=EXC_HV
+	ISTACK=0
+	IRECONCILE=0
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(hdecrementer)
@@ -1502,11 +1504,24 @@ EXC_VIRT_BEGIN(hdecrementer, 0x4980, 0x80)
 	GEN_INT_ENTRY hdecrementer, virt=1
 EXC_VIRT_END(hdecrementer, 0x4980, 0x80)
 EXC_COMMON_BEGIN(hdecrementer_common)
-	GEN_COMMON hdecrementer
-	bl	save_nvgprs
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	hdec_interrupt
-	b	ret_from_except
+	__GEN_COMMON_ENTRY hdecrementer
+	/*
+	 * Hypervisor decrementer interrupts not caught by the KVM test
+	 * shouldn't occur but are sometimes left pending on exit from a KVM
+	 * guest.  We don't need to do anything to clear them, as they are
+	 * edge-triggered.
+	 *
+	 * Be careful to avoid touching the kernel stack.
+	 */
+	ld	r10,PACA_EXGEN+EX_CTR(r13)
+	mtctr	r10
+	mtcrf	0x80,r9
+	ld	r9,PACA_EXGEN+EX_R9(r13)
+	ld	r10,PACA_EXGEN+EX_R10(r13)
+	ld	r11,PACA_EXGEN+EX_R11(r13)
+	ld	r12,PACA_EXGEN+EX_R12(r13)
+	ld	r13,PACA_EXGEN+EX_R13(r13)
+	HRFI_TO_KERNEL
 
 	GEN_KVM hdecrementer
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 694522308cd5..bebc8c440289 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -663,15 +663,6 @@ void timer_broadcast_interrupt(void)
 }
 #endif
 
-/*
- * Hypervisor decrementer interrupts shouldn't occur but are sometimes
- * left pending on exit from a KVM guest.  We don't need to do anything
- * to clear them, as they are edge-triggered.
- */
-void hdec_interrupt(struct pt_regs *regs)
-{
-}
-
 #ifdef CONFIG_SUSPEND
 static void generic_suspend_disable_irqs(void)
 {
-- 
2.23.0

