Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E73D5BED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 16:40:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYMzj5kyMz3bWY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 00:40:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=Kp8OTnqJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=me.com
 (client-ip=17.58.6.48; helo=pv50p00im-hyfv10021501.me.com;
 envelope-from=sxwjean@me.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256
 header.s=1a1hai header.b=Kp8OTnqJ; dkim-atps=neutral
Received: from pv50p00im-hyfv10021501.me.com (pv50p00im-hyfv10021501.me.com
 [17.58.6.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYMxs397Xz2xfL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 00:39:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1627309890; bh=BFckRY2ZB+u/6XP4etNMmpqRWkq7WwCBzEFO1iXPI5U=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=Kp8OTnqJn3pDMdmdqmeZsD0CvbL30+CsNeOhRb8FidfRZk+E8qsvz9C7r9oJlIR54
 1LhPwgvylmJKnI406dIm6L5SsbP/ApGcdr2jjOuigNoaTw5Qr0avDv5lKO2PXgOsPX
 sC8JQvh8qtP2ZAQw2WKWOsx+ImwV/co/+na6Mz7EmbqAnNJiCmgWHStvAIzQuY1Gjm
 9WWyiCIo9PUniUFZAZe2sB9h2Kaa0yeHCmlb2qzl8AQOnxEA3uJeh2QEefY3eOIzWf
 1KzhRO44aQ9fXpHGcVyLgq6Dil+MLkyB9Z1oynNmRDzMP6RvY7g/rp8kP79l51GALa
 STOVSfpNXmFmw==
Received: from xiongwei.. (unknown [120.245.2.8])
 by pv50p00im-hyfv10021501.me.com (Postfix) with ESMTPSA id A051DB4037A;
 Mon, 26 Jul 2021 14:31:24 +0000 (UTC)
From: sxwjean@me.com
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/4] powerpc: Optimize register usage for esr register
Date: Mon, 26 Jul 2021 22:30:50 +0800
Message-Id: <20210726143053.532839-1-sxwjean@me.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-26_06:2021-07-26,
 2021-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=710 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2107260082
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
Cc: ravi.bangoria@linux.ibm.com, Xiongwei Song <sxwjean@gmail.com>,
 aneesh.kumar@linux.ibm.com, oleg@redhat.com, linux-kernel@vger.kernel.org,
 efremov@linux.com, paulus@samba.org, npiggin@gmail.com, peterx@redhat.com,
 akpm@linux-foundation.org, sandipan@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiongwei Song <sxwjean@gmail.com>

Create an anonymous union for dsisr and esr regsiters, we can reference
esr to get the exception detail when CONFIG_4xx=y or CONFIG_BOOKE=y.
Otherwise, reference dsisr. This makes code more clear.

Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h          |  5 ++++-
 arch/powerpc/include/uapi/asm/ptrace.h     |  5 ++++-
 arch/powerpc/kernel/process.c              |  2 +-
 arch/powerpc/kernel/ptrace/ptrace.c        |  2 ++
 arch/powerpc/kernel/traps.c                |  2 +-
 arch/powerpc/mm/fault.c                    | 16 ++++++++++++++--
 arch/powerpc/platforms/44x/machine_check.c |  4 ++--
 arch/powerpc/platforms/4xx/machine_check.c |  2 +-
 8 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 3e5d470a6155..c252d04b1206 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -44,7 +44,10 @@ struct pt_regs
 #endif
 			unsigned long trap;
 			unsigned long dar;
-			unsigned long dsisr;
+			union {
+				unsigned long dsisr;
+				unsigned long esr;
+			};
 			unsigned long result;
 		};
 	};
diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
index 7004cfea3f5f..e357288b5f34 100644
--- a/arch/powerpc/include/uapi/asm/ptrace.h
+++ b/arch/powerpc/include/uapi/asm/ptrace.h
@@ -53,7 +53,10 @@ struct pt_regs
 	/* N.B. for critical exceptions on 4xx, the dar and dsisr
 	   fields are overloaded to hold srr0 and srr1. */
 	unsigned long dar;		/* Fault registers */
-	unsigned long dsisr;		/* on 4xx/Book-E used for ESR */
+	union {
+		unsigned long dsisr;		/* on Book-S used for DSISR */
+		unsigned long esr;		/* on 4xx/Book-E used for ESR */
+	};
 	unsigned long result;		/* Result of a system call */
 };
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 185beb290580..f74af8f9133c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1499,7 +1499,7 @@ static void __show_regs(struct pt_regs *regs)
 	    trap == INTERRUPT_DATA_STORAGE ||
 	    trap == INTERRUPT_ALIGNMENT) {
 		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
-			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->dsisr);
+			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->esr);
 		else
 			pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
 	}
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 0a0a33eb0d28..00789ad2c4a3 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -375,6 +375,8 @@ void __init pt_regs_check(void)
 		     offsetof(struct user_pt_regs, dar));
 	BUILD_BUG_ON(offsetof(struct pt_regs, dsisr) !=
 		     offsetof(struct user_pt_regs, dsisr));
+	BUILD_BUG_ON(offsetof(struct pt_regs, esr) !=
+		     offsetof(struct user_pt_regs, esr));
 	BUILD_BUG_ON(offsetof(struct pt_regs, result) !=
 		     offsetof(struct user_pt_regs, result));
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index dfbce527c98e..2164f5705a0b 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -562,7 +562,7 @@ static inline int check_io_access(struct pt_regs *regs)
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 /* On 4xx, the reason for the machine check or program exception
    is in the ESR. */
-#define get_reason(regs)	((regs)->dsisr)
+#define get_reason(regs)	((regs)->esr)
 #define REASON_FP		ESR_FP
 #define REASON_ILLEGAL		(ESR_PIL | ESR_PUO)
 #define REASON_PRIVILEGED	ESR_PPR
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index a8d0ce85d39a..62953d4e7c93 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -541,7 +541,11 @@ static __always_inline void __do_page_fault(struct pt_regs *regs)
 {
 	long err;
 
-	err = ___do_page_fault(regs, regs->dar, regs->dsisr);
+	if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
+		err = ___do_page_fault(regs, regs->dar, regs->esr);
+	else
+		err = ___do_page_fault(regs, regs->dar, regs->dsisr);
+
 	if (unlikely(err))
 		bad_page_fault(regs, err);
 }
@@ -567,7 +571,15 @@ NOKPROBE_SYMBOL(hash__do_page_fault);
  */
 static void __bad_page_fault(struct pt_regs *regs, int sig)
 {
-	int is_write = page_fault_is_write(regs->dsisr);
+	unsigned long err_reg;
+	int is_write;
+
+	if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
+		err_reg = regs->esr;
+	else
+		err_reg = regs->dsisr;
+
+	is_write = page_fault_is_write(err_reg);
 
 	/* kernel has accessed a bad area */
 
diff --git a/arch/powerpc/platforms/44x/machine_check.c b/arch/powerpc/platforms/44x/machine_check.c
index a5c898bb9bab..5d19daacd78a 100644
--- a/arch/powerpc/platforms/44x/machine_check.c
+++ b/arch/powerpc/platforms/44x/machine_check.c
@@ -11,7 +11,7 @@
 
 int machine_check_440A(struct pt_regs *regs)
 {
-	unsigned long reason = regs->dsisr;
+	unsigned long reason = regs->esr;
 
 	printk("Machine check in kernel mode.\n");
 	if (reason & ESR_IMCP){
@@ -48,7 +48,7 @@ int machine_check_440A(struct pt_regs *regs)
 #ifdef CONFIG_PPC_47x
 int machine_check_47x(struct pt_regs *regs)
 {
-	unsigned long reason = regs->dsisr;
+	unsigned long reason = regs->esr;
 	u32 mcsr;
 
 	printk(KERN_ERR "Machine check in kernel mode.\n");
diff --git a/arch/powerpc/platforms/4xx/machine_check.c b/arch/powerpc/platforms/4xx/machine_check.c
index a71c29892a91..a905da1d6f41 100644
--- a/arch/powerpc/platforms/4xx/machine_check.c
+++ b/arch/powerpc/platforms/4xx/machine_check.c
@@ -10,7 +10,7 @@
 
 int machine_check_4xx(struct pt_regs *regs)
 {
-	unsigned long reason = regs->dsisr;
+	unsigned long reason = regs->esr;
 
 	if (reason & ESR_IMCP) {
 		printk("Instruction");
-- 
2.30.2

