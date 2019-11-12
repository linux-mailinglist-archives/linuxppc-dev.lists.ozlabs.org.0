Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D06F97A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 18:52:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CFh03gGfzF5SM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 04:52:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CDNC6GdHzF33T
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 03:53:47 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 57F59B167;
 Tue, 12 Nov 2019 16:53:44 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 20/33] powerpc/64s/exception: only test KVM in SRR interrupts
 when PR KVM is supported
Date: Tue, 12 Nov 2019 17:52:18 +0100
Message-Id: <3fabf68dbaaffed3a3737ab61a79f8f2b47c5ab1.1573576649.git.msuchanek@suse.de>
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

Apart from SRESET, MCE, and syscall (hcall variant), the SRR type
interrupts are not escalated to hypervisor mode, so delivered to the OS.

When running PR KVM, the OS is the hypervisor, and the guest runs with
MSR[PR]=1, so these interrupts must test if a guest was running when
interrupted. These tests are required at the real-mode entry points
because the PR KVM host runs with LPCR[AIL]=0.

In HV KVM and nested HV KVM, the guest always receives these interrupts,
so there is no need for the host to make this test. So remove the tests
if PR KVM is not configured.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 65 ++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 2f50587392aa..38bc66b95516 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -214,9 +214,36 @@ do_define_int n
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
- * If hv is possible, interrupts come into to the hv version
- * of the kvmppc_interrupt code, which then jumps to the PR handler,
- * kvmppc_interrupt_pr, if the guest is a PR guest.
+ * All interrupts which set HSRR registers, as well as SRESET and MCE and
+ * syscall when invoked with "sc 1" switch to MSR[HV]=1 (HVMODE) to be taken,
+ * so they all generally need to test whether they were taken in guest context.
+ *
+ * Note: SRESET and MCE may also be sent to the guest by the hypervisor, and be
+ * taken with MSR[HV]=0.
+ *
+ * Interrupts which set SRR registers (with the above exceptions) do not
+ * elevate to MSR[HV]=1 mode, though most can be taken when running with
+ * MSR[HV]=1  (e.g., bare metal kernel and userspace). So these interrupts do
+ * not need to test whether a guest is running because they get delivered to
+ * the guest directly, including nested HV KVM guests.
+ *
+ * The exception is PR KVM, where the guest runs with MSR[PR]=1 and the host
+ * runs with MSR[HV]=0, so the host takes all interrupts on behalf of the
+ * guest. PR KVM runs with LPCR[AIL]=0 which causes interrupts to always be
+ * delivered to the real-mode entry point, therefore such interrupts only test
+ * KVM in their real mode handlers, and only when PR KVM is possible.
+ *
+ * Interrupts that are taken in MSR[HV]=0 and escalate to MSR[HV]=1 are always
+ * delivered in real-mode when the MMU is in hash mode because the MMU
+ * registers are not set appropriately to translate host addresses. In nested
+ * radix mode these can be delivered in virt-mode as the host translations are
+ * used implicitly (see: effective LPID, effective PID).
+ */
+
+/*
+ * If an interrupt is taken while a guest is running, it is immediately routed
+ * to KVM to handle. If both HV and PR KVM arepossible, KVM interrupts go first
+ * to kvmppc_interrupt_hv, which handles the PR guest case.
  */
 #define kvmppc_interrupt kvmppc_interrupt_hv
 #else
@@ -1258,8 +1285,10 @@ INT_DEFINE_BEGIN(data_access)
 	IVEC=0x300
 	IDAR=1
 	IDSISR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(data_access)
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
@@ -1306,8 +1335,10 @@ INT_DEFINE_BEGIN(data_access_slb)
 	IAREA=PACA_EXSLB
 	IRECONCILE=0
 	IDAR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(data_access_slb)
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
@@ -1357,7 +1388,9 @@ INT_DEFINE_BEGIN(instruction_access)
 	IISIDE=1
 	IDAR=1
 	IDSISR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(instruction_access)
 
 EXC_REAL_BEGIN(instruction_access, 0x400, 0x80)
@@ -1396,7 +1429,9 @@ INT_DEFINE_BEGIN(instruction_access_slb)
 	IRECONCILE=0
 	IISIDE=1
 	IDAR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(instruction_access_slb)
 
 EXC_REAL_BEGIN(instruction_access_slb, 0x480, 0x80)
@@ -1488,7 +1523,9 @@ INT_DEFINE_BEGIN(alignment)
 	IVEC=0x600
 	IDAR=1
 	IDSISR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(alignment)
 
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
@@ -1518,7 +1555,9 @@ EXC_COMMON_BEGIN(alignment_common)
  */
 INT_DEFINE_BEGIN(program_check)
 	IVEC=0x700
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(program_check)
 
 EXC_REAL_BEGIN(program_check, 0x700, 0x100)
@@ -1581,7 +1620,9 @@ EXC_COMMON_BEGIN(program_check_common)
 INT_DEFINE_BEGIN(fp_unavailable)
 	IVEC=0x800
 	IRECONCILE=0
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(fp_unavailable)
 
 EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
@@ -1643,7 +1684,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 INT_DEFINE_BEGIN(decrementer)
 	IVEC=0x900
 	IMASK=IRQS_DISABLED
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(decrementer)
 
 EXC_REAL_BEGIN(decrementer, 0x900, 0x80)
@@ -1728,7 +1771,9 @@ EXC_COMMON_BEGIN(hdecrementer_common)
 INT_DEFINE_BEGIN(doorbell_super)
 	IVEC=0xa00
 	IMASK=IRQS_DISABLED
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(doorbell_super)
 
 EXC_REAL_BEGIN(doorbell_super, 0xa00, 0x100)
@@ -1919,7 +1964,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
  */
 INT_DEFINE_BEGIN(single_step)
 	IVEC=0xd00
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(single_step)
 
 EXC_REAL_BEGIN(single_step, 0xd00, 0x100)
@@ -2208,7 +2255,9 @@ EXC_VIRT_NONE(0x4ee0, 0x20)
 INT_DEFINE_BEGIN(performance_monitor)
 	IVEC=0xf00
 	IMASK=IRQS_PMI_DISABLED
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(performance_monitor)
 
 EXC_REAL_BEGIN(performance_monitor, 0xf00, 0x20)
@@ -2237,7 +2286,9 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 INT_DEFINE_BEGIN(altivec_unavailable)
 	IVEC=0xf20
 	IRECONCILE=0
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(altivec_unavailable)
 
 EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
@@ -2291,7 +2342,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 INT_DEFINE_BEGIN(vsx_unavailable)
 	IVEC=0xf40
 	IRECONCILE=0
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(vsx_unavailable)
 
 EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
@@ -2344,7 +2397,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
  */
 INT_DEFINE_BEGIN(facility_unavailable)
 	IVEC=0xf60
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(facility_unavailable)
 
 EXC_REAL_BEGIN(facility_unavailable, 0xf60, 0x20)
@@ -2434,8 +2489,10 @@ EXC_VIRT_NONE(0x5200, 0x100)
 
 INT_DEFINE_BEGIN(instruction_breakpoint)
 	IVEC=0x1300
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(instruction_breakpoint)
 
 EXC_REAL_BEGIN(instruction_breakpoint, 0x1300, 0x100)
@@ -2606,7 +2663,9 @@ EXC_VIRT_NONE(0x5600, 0x100)
 
 INT_DEFINE_BEGIN(altivec_assist)
 	IVEC=0x1700
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(altivec_assist)
 
 EXC_REAL_BEGIN(altivec_assist, 0x1700, 0x100)
-- 
2.23.0

