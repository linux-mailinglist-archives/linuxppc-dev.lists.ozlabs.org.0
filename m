Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE210A562
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 21:23:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MwMG1LgszDqbf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 07:23:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mw8s32b4zDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 07:14:05 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2AB20AF3B;
 Tue, 26 Nov 2019 20:14:02 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/35] powerpc/64s/exception: Add GEN_COMMON macro that
 uses INT_DEFINE parameters
Date: Tue, 26 Nov 2019 21:13:16 +0100
Message-Id: <feab2b2c94c63f4b7f1378edfda0cdae63108539.1574798487.git.msuchanek@suse.de>
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

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e6ad6e6cf65e..591ae2a73e18 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -206,6 +206,9 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define IMASK		.L_IMASK_\name\()
 #define IKVM_REAL	.L_IKVM_REAL_\name\()
 #define IKVM_VIRT	.L_IKVM_VIRT_\name\()
+#define ISTACK		.L_ISTACK_\name\()
+#define IRECONCILE	.L_IRECONCILE_\name\()
+#define IKUAP		.L_IKUAP_\name\()
 
 #define INT_DEFINE_BEGIN(n)						\
 .macro int_define_ ## n name
@@ -246,6 +249,15 @@ do_define_int n
 	.ifndef IKVM_VIRT
 		IKVM_VIRT=0
 	.endif
+	.ifndef ISTACK
+		ISTACK=1
+	.endif
+	.ifndef IRECONCILE
+		IRECONCILE=1
+	.endif
+	.ifndef IKUAP
+		IKUAP=1
+	.endif
 .endm
 
 .macro INT_KVM_HANDLER name, vec, hsrr, area, skip
@@ -670,6 +682,10 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
 	.endif
 .endm
 
+.macro GEN_COMMON name
+	INT_COMMON IVEC, IAREA, ISTACK, IKUAP, IRECONCILE, IDAR, IDSISR
+.endm
+
 /*
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
  * standard exception.
@@ -1221,13 +1237,7 @@ EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 EXC_VIRT_END(data_access, 0x4300, 0x80)
 INT_KVM_HANDLER data_access, 0x300, EXC_STD, PACA_EXGEN, 1
 EXC_COMMON_BEGIN(data_access_common)
-	/*
-	 * Here r13 points to the paca, r9 contains the saved CR,
-	 * SRR0 and SRR1 are saved in r11 and r12,
-	 * r9 - r13 are saved in paca->exgen.
-	 * EX_DAR and EX_DSISR have saved DAR/DSISR
-	 */
-	INT_COMMON 0x300, PACA_EXGEN, 1, 1, 1, 1, 1
+	GEN_COMMON data_access
 	ld	r4,_DAR(r1)
 	ld	r5,_DSISR(r1)
 BEGIN_MMU_FTR_SECTION
-- 
2.23.0

