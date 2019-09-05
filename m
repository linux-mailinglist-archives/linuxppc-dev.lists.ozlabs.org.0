Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D02AAAE8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 20:28:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PThZ1LwCzDqV5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 04:28:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PTXJ0dk0zDqkm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 04:21:03 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x85IChxM124697
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Sep 2019 14:21:00 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uu70u19pw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2019 14:21:00 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 5 Sep 2019 19:20:58 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Sep 2019 19:20:55 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x85IKsxv46596586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Sep 2019 18:20:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2388FAE051;
 Thu,  5 Sep 2019 18:20:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49CB3AE053;
 Thu,  5 Sep 2019 18:20:52 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.95.49])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Sep 2019 18:20:52 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 2/3] powerpc/ftrace: Enable HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
Date: Thu,  5 Sep 2019 23:50:29 +0530
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1567707399.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1567707399.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19090518-0016-0000-0000-000002A72719
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090518-0017-0000-0000-000033079C8C
Message-Id: <0224f2d0971b069c678e2ff678cfc2cd1e114cfe.1567707399.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-05_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=929 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909050172
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This associates entries in the ftrace_ret_stack with corresponding stack
frames, enabling more robust stack unwinding. Also update the only user
of ftrace_graph_ret_addr() to pass the stack pointer.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/asm-prototypes.h      | 3 ++-
 arch/powerpc/include/asm/ftrace.h              | 2 ++
 arch/powerpc/kernel/stacktrace.c               | 2 +-
 arch/powerpc/kernel/trace/ftrace.c             | 5 +++--
 arch/powerpc/kernel/trace/ftrace_32.S          | 1 +
 arch/powerpc/kernel/trace/ftrace_64_mprofile.S | 1 +
 arch/powerpc/kernel/trace/ftrace_64_pg.S       | 1 +
 7 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 49196d35e3bb..8561498e653c 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -134,7 +134,8 @@ extern int __ucmpdi2(u64, u64);
 
 /* tracing */
 void _mcount(void);
-unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip);
+unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
+						unsigned long sp);
 
 void pnv_power9_force_smt4_catch(void);
 void pnv_power9_force_smt4_release(void);
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 3dfb80b86561..f54a08a2cd70 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -8,6 +8,8 @@
 #define MCOUNT_ADDR		((unsigned long)(_mcount))
 #define MCOUNT_INSN_SIZE	4 /* sizeof mcount call */
 
+#define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
+
 #ifdef __ASSEMBLY__
 
 /* Based off of objdump optput from glibc */
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 1e2276963f6d..e2a46cfed5fd 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -182,7 +182,7 @@ static int __save_stack_trace_tsk_reliable(struct task_struct *tsk,
 		 * FIXME: IMHO these tests do not belong in
 		 * arch-dependent code, they are generic.
 		 */
-		ip = ftrace_graph_ret_addr(tsk, &graph_idx, ip, NULL);
+		ip = ftrace_graph_ret_addr(tsk, &graph_idx, ip, stack);
 #ifdef CONFIG_KPROBES
 		/*
 		 * Mark stacktraces with kretprobed functions on them
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index be1ca98fce5c..7ea0ca044b65 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -944,7 +944,8 @@ int ftrace_disable_ftrace_graph_caller(void)
  * Hook the return address and push it in the stack of return addrs
  * in current thread info. Return the address we want to divert to.
  */
-unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip)
+unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
+						unsigned long sp)
 {
 	unsigned long return_hooker;
 
@@ -956,7 +957,7 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip)
 
 	return_hooker = ppc_function_entry(return_to_handler);
 
-	if (!function_graph_enter(parent, ip, 0, NULL))
+	if (!function_graph_enter(parent, ip, 0, (unsigned long *)sp))
 		parent = return_hooker;
 out:
 	return parent;
diff --git a/arch/powerpc/kernel/trace/ftrace_32.S b/arch/powerpc/kernel/trace/ftrace_32.S
index 183f608efb81..e023ae59c429 100644
--- a/arch/powerpc/kernel/trace/ftrace_32.S
+++ b/arch/powerpc/kernel/trace/ftrace_32.S
@@ -50,6 +50,7 @@ _GLOBAL(ftrace_stub)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 _GLOBAL(ftrace_graph_caller)
+	addi	r5, r1, 48
 	/* load r4 with local address */
 	lwz	r4, 44(r1)
 	subi	r4, r4, MCOUNT_INSN_SIZE
diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
index 74acbf16a666..f9fd5f743eba 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
@@ -294,6 +294,7 @@ _GLOBAL(ftrace_graph_caller)
 	std	r2, 24(r1)
 	ld	r2, PACATOC(r13)	/* get kernel TOC in r2 */
 
+	addi	r5, r1, 112
 	mfctr	r4		/* ftrace_caller has moved local addr here */
 	std	r4, 40(r1)
 	mflr	r3		/* ftrace_caller has restored LR from stack */
diff --git a/arch/powerpc/kernel/trace/ftrace_64_pg.S b/arch/powerpc/kernel/trace/ftrace_64_pg.S
index e41a7d13c99c..6708e24db0ab 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_pg.S
+++ b/arch/powerpc/kernel/trace/ftrace_64_pg.S
@@ -41,6 +41,7 @@ _GLOBAL(ftrace_stub)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 _GLOBAL(ftrace_graph_caller)
+	addi	r5, r1, 112
 	/* load r4 with local address */
 	ld	r4, 128(r1)
 	subi	r4, r4, MCOUNT_INSN_SIZE
-- 
2.23.0

