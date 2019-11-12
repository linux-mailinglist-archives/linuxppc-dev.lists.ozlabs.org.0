Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF96EF9845
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 19:07:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CG1f3FW6zF5Wh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 05:07:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CDNM04ZzzF1wq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 03:53:55 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EFBA0AD72;
 Tue, 12 Nov 2019 16:53:51 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 25/33] powerpc/64s/exception: remove lite interrupt return
Date: Tue, 12 Nov 2019 17:52:23 +0100
Message-Id: <b7166cac80cefc561e30a6c6c324384b973081b4.1573576649.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573576649.git.msuchanek@suse.de>
References: <cover.1573576649.git.msuchanek@suse.de>
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

The difference between lite and regular returns is that the lite case
restores all NVGPRs, whereas lite skips that. This is quite clumsy
though, most interrupts want the NVGPRs saved for debugging, not to
modify in the caller, so the NVGPRs restore is not necessary most of
the time. Restore NVGPRs explicitly for one case that requires it,
and move everything else over to avoiding the restore unless the
interrupt return demands it (e.g., handling a signal).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S       |  4 ----
 arch/powerpc/kernel/exceptions-64s.S | 21 +++++++++++----------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index b2e68f5ca8f7..00173cc904ef 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -452,10 +452,6 @@ _GLOBAL(fast_interrupt_return)
 
 	.balign IFETCH_ALIGN_BYTES
 _GLOBAL(interrupt_return)
-	REST_NVGPRS(r1)
-
-	.balign IFETCH_ALIGN_BYTES
-_GLOBAL(interrupt_return_lite)
 	ld	r4,_MSR(r1)
 	andi.	r0,r4,MSR_PR
 	beq	kernel_interrupt_return
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 269edd1460be..1bccc869ebd3 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1507,7 +1507,7 @@ EXC_COMMON_BEGIN(hardware_interrupt_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM hardware_interrupt
 
@@ -1694,7 +1694,7 @@ EXC_COMMON_BEGIN(decrementer_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM decrementer
 
@@ -1785,7 +1785,7 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 #else
 	bl	unknown_exception
 #endif
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM doorbell_super
 
@@ -2183,7 +2183,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 #else
 	bl	unknown_exception
 #endif
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM h_doorbell
 
@@ -2213,7 +2213,7 @@ EXC_COMMON_BEGIN(h_virt_irq_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM h_virt_irq
 
@@ -2260,7 +2260,7 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
-	b	interrupt_return_lite
+	b	interrupt_return
 
 	GEN_KVM performance_monitor
 
@@ -3013,7 +3013,7 @@ do_hash_page:
         cmpdi	r3,0			/* see if __hash_page succeeded */
 
 	/* Success */
-	beq	interrupt_return_lite	/* Return from exception on success */
+	beq	interrupt_return	/* Return from exception on success */
 
 	/* Error */
 	blt-	13f
@@ -3027,10 +3027,11 @@ do_hash_page:
 handle_page_fault:
 11:	andis.  r0,r5,DSISR_DABRMATCH@h
 	bne-    handle_dabr_fault
+	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_page_fault
 	cmpdi	r3,0
-	beq+	interrupt_return_lite
+	beq+	interrupt_return
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r4,_DAR(r1)
@@ -3045,9 +3046,9 @@ handle_dabr_fault:
 	bl      do_break
 	/*
 	 * do_break() may have changed the NV GPRS while handling a breakpoint.
-	 * If so, we need to restore them with their updated values. Don't use
-	 * interrupt_return_lite here.
+	 * If so, we need to restore them with their updated values.
 	 */
+	REST_NVGPRS(r1)
 	b       interrupt_return
 
 
-- 
2.23.0

