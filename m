Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E11F9681
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 18:02:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CDZR3lhxzF5BM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 04:02:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CDMh3y5nzF0jn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 03:53:19 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B6092B109;
 Tue, 12 Nov 2019 16:53:15 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/33] powerpc/64s/exception: Introduce INT_DEFINE parameter
 block for code generation
Date: Tue, 12 Nov 2019 17:51:59 +0100
Message-Id: <854059454c690c6f63957a2130aa04e2cd501af2.1573576649.git.msuchanek@suse.de>
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

The code generation macro arguments are difficult to read, and
defaults can't easily be used.

This introduces a block where parameters can be set for interrupt
handler code generation by the subsequent macros, and adds the first
generation macro for interrupt entry.

One interrupt handler is converted to the new macros to demonstrate
the change, the rest will be coverted all at once.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 77 ++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index d0018dd17e0a..e6ad6e6cf65e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -193,6 +193,61 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	mtctr	reg;							\
 	bctr
 
+/*
+ * Interrupt code generation macros
+ */
+#define IVEC		.L_IVEC_\name\()
+#define IHSRR		.L_IHSRR_\name\()
+#define IAREA		.L_IAREA_\name\()
+#define IDAR		.L_IDAR_\name\()
+#define IDSISR		.L_IDSISR_\name\()
+#define ISET_RI		.L_ISET_RI_\name\()
+#define IEARLY		.L_IEARLY_\name\()
+#define IMASK		.L_IMASK_\name\()
+#define IKVM_REAL	.L_IKVM_REAL_\name\()
+#define IKVM_VIRT	.L_IKVM_VIRT_\name\()
+
+#define INT_DEFINE_BEGIN(n)						\
+.macro int_define_ ## n name
+
+#define INT_DEFINE_END(n)						\
+.endm ;									\
+int_define_ ## n n ;							\
+do_define_int n
+
+.macro do_define_int name
+	.ifndef IVEC
+		.error "IVEC not defined"
+	.endif
+	.ifndef IHSRR
+		IHSRR=EXC_STD
+	.endif
+	.ifndef IAREA
+		IAREA=PACA_EXGEN
+	.endif
+	.ifndef IDAR
+		IDAR=0
+	.endif
+	.ifndef IDSISR
+		IDSISR=0
+	.endif
+	.ifndef ISET_RI
+		ISET_RI=1
+	.endif
+	.ifndef IEARLY
+		IEARLY=0
+	.endif
+	.ifndef IMASK
+		IMASK=0
+	.endif
+	.ifndef IKVM_REAL
+		IKVM_REAL=0
+	.endif
+	.ifndef IKVM_VIRT
+		IKVM_VIRT=0
+	.endif
+.endm
+
 .macro INT_KVM_HANDLER name, vec, hsrr, area, skip
 	TRAMP_KVM_BEGIN(\name\()_kvm)
 	KVM_HANDLER \vec, \hsrr, \area, \skip
@@ -474,7 +529,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	 */
 	GET_SCRATCH0(r10)
 	std	r10,\area\()+EX_R13(r13)
-	.if \dar
+	.if \dar == 1
 	.if \hsrr
 	mfspr	r10,SPRN_HDAR
 	.else
@@ -482,7 +537,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.endif
 	std	r10,\area\()+EX_DAR(r13)
 	.endif
-	.if \dsisr
+	.if \dsisr == 1
 	.if \hsrr
 	mfspr	r10,SPRN_HDSISR
 	.else
@@ -506,6 +561,14 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.endif
 .endm
 
+.macro GEN_INT_ENTRY name, virt, ool=0
+	.if ! \virt
+		INT_HANDLER \name, IVEC, \ool, IEARLY, \virt, IHSRR, IAREA, ISET_RI, IDAR, IDSISR, IMASK, IKVM_REAL
+	.else
+		INT_HANDLER \name, IVEC, \ool, IEARLY, \virt, IHSRR, IAREA, ISET_RI, IDAR, IDSISR, IMASK, IKVM_VIRT
+	.endif
+.endm
+
 /*
  * On entry r13 points to the paca, r9-r13 are saved in the paca,
  * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
@@ -1143,12 +1206,18 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	bl	unrecoverable_exception
 	b	.
 
+INT_DEFINE_BEGIN(data_access)
+	IVEC=0x300
+	IDAR=1
+	IDSISR=1
+	IKVM_REAL=1
+INT_DEFINE_END(data_access)
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
-	INT_HANDLER data_access, 0x300, ool=1, dar=1, dsisr=1, kvm=1
+	GEN_INT_ENTRY data_access, virt=0, ool=1
 EXC_REAL_END(data_access, 0x300, 0x80)
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
-	INT_HANDLER data_access, 0x300, virt=1, dar=1, dsisr=1
+	GEN_INT_ENTRY data_access, virt=1
 EXC_VIRT_END(data_access, 0x4300, 0x80)
 INT_KVM_HANDLER data_access, 0x300, EXC_STD, PACA_EXGEN, 1
 EXC_COMMON_BEGIN(data_access_common)
-- 
2.23.0

