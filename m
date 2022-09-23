Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF65E7EB5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:43:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYxJG5VMRz3dyb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 01:43:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D8AYHaFk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D8AYHaFk;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYxGy1q70z3c8j
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 01:42:18 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id b23so505797pfp.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 08:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zLw17P1/jLu1WnMKY3KoFcwRRM9V5OkzIhxmbz9wWPw=;
        b=D8AYHaFkxCTM9FFf9Oexvj6AuI1Z0ipsV9bF/3KXnS2xyeqk0h+SMNijWYmIafg1Ej
         bCMsJcCyOD3nT4jJ8VnuN8OIdDvGRpSI6OfZJvmTsEj9xfn09UNFTO2FaBkAxx3fjt/6
         0ritz6/TyFB6cCvZbVc84bE373zbYN5f1Wx6OLGuTXnoqmJXORDuPJ8fuBHjblh3teYb
         sMs0Tk4G7UpLgYegTScqykfrS3FGysKQcWLR79kUTdhd9SIT2jbnh/U4nUBoq/59Cl7J
         7y23q3DlHY088Uqa1+z46Nlay3OZ2x0YYIjWVIq71kdZXxOnsJf3apVvNDV8a1/y07S2
         iZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zLw17P1/jLu1WnMKY3KoFcwRRM9V5OkzIhxmbz9wWPw=;
        b=b/xXH4vc8qoebrs12Szbc43JDHbcLJqm9RKYySbCAkQBFLjnXsyRNl3b63/UgTiIlv
         G5tAs+ibQyumugfqKyX9WcGBoOiqcECHr85JenGGxHbD3IT6wheI0lA/Tfs/mxr80KyZ
         pb72cle3m4wRTpjAU3xmjmLLeSTFiHXgxW5ywF73BcRUBB8Gt8cIiLC7WGXJarjusyvS
         eXekvEwCslfEF0ipKxNsUxMl7gT/C4vCzx6mRcorWuMmUha+aBYSV3C2wsVdGz/YkGA6
         TBsHhmas6fnhEcF2X9wR0gcIoASMXrOZ7/9CYl+kv9clqbs51Qb8KL/Ikwj/wtGlsw3P
         xAqQ==
X-Gm-Message-State: ACrzQf3MiQOq9r3c/sUFDB62ZrCsdq9Jd1bRD5T1woGJGUtoRZHXXOKP
	QeFMnNqdQZDkn31lR/juuPqs2KWos4k=
X-Google-Smtp-Source: AMsMyM5tZ/uhZNaOYOxXFxaXA7MM80E6A+N87tu7RK3pToydC2IRsivOGTrOdNXW8ueknuiWxsE0JQ==
X-Received: by 2002:a65:4303:0:b0:439:f026:ccee with SMTP id j3-20020a654303000000b00439f026cceemr8183868pgq.322.1663947735763;
        Fri, 23 Sep 2022 08:42:15 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id t11-20020aa7946b000000b0053e940d360csm6583166pfq.58.2022.09.23.08.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:42:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/2] powerpc: nop trap instruction after WARN_ONCE fires
Date: Sat, 24 Sep 2022 01:41:43 +1000
Message-Id: <20220923154143.1115645-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220923154143.1115645-1-npiggin@gmail.com>
References: <20220923154143.1115645-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

WARN_ONCE and similar are often used in frequently executed code, and
should not crash the system. The program check interrupt caused by
WARN_ON_ONCE can be a significant overhead even when nothing is being
printed. This can cause performance to become unacceptable, having the
same effective impact to the user as a BUG_ON().

Avoid this overhead by patching the trap with a nop instruction after a
"once" trap fires. Conditional warnings that return a result must have
equivalent compare and branch instructions after the trap, so when it is
nopped the statement will behave the same way. It's possible the asm
goto should be removed entirely and this comparison just done in C now.

XXX: possibly this should schedule the patching to run in a different
context than the program check.

XXX: patching process could allocate memory for patched bugs rather
than keeping a word in the bug entry for all of them. Very few will
ever fire.

XXX: is concurrency okay?

XXX: could avoid clobbering cc in some cases, possibly optimise some
variants.

---
 arch/powerpc/include/asm/bug.h | 14 ++++++++++--
 arch/powerpc/kernel/traps.c    | 42 +++++++++++++++++++++++++++++++++-
 include/asm-generic/bug.h      |  9 ++++++++
 include/linux/bug.h            |  1 +
 lib/bug.c                      | 22 +++++++++---------
 5 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index dec73137fea0..0ea7b9fe0305 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -14,6 +14,7 @@
 .macro __EMIT_BUG_ENTRY addr,file,line,flags
 	 .section __bug_table,"aw"
 5001:	 .4byte \addr - .
+	 .4byte 0
 	 .4byte 0
 	 .4byte 5002f - .
 	 .short \line, \flags
@@ -27,6 +28,7 @@
 .macro __EMIT_BUG_ENTRY addr,file,line,flags
 	 .section __bug_table,"aw"
 5001:	 .4byte \addr - .
+	 .4byte 0
 	 .4byte 0
 	 .short \flags
 	 .org 5001b+BUG_ENTRY_SIZE
@@ -48,6 +50,7 @@
 #else /* !__ASSEMBLY__ */
 struct arch_bug_entry {
 	signed int recovery_addr_disp;
+	unsigned int insn;
 };
 
 /* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
@@ -57,6 +60,7 @@ struct arch_bug_entry {
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
 	"	.4byte 0\n"			\
+	"	.4byte 0\n"			\
 	"	.4byte %0 - .\n"		\
 	"	.short %1, %2\n"		\
 	".org 2b+%3\n"				\
@@ -66,6 +70,7 @@ struct arch_bug_entry {
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
 	"	.4byte 0\n"			\
+	"	.4byte 0\n"			\
 	"	.short %2\n"			\
 	".org 2b+%3\n"				\
 	".previous\n"
@@ -76,6 +81,7 @@ struct arch_bug_entry {
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
 	"	.4byte 1b - %l[" #label "]\n"	\
+	"	.4byte 0\n"			\
 	"	.4byte %0 - .\n"		\
 	"	.short %1, %2\n"		\
 	".org 2b+%3\n"				\
@@ -85,6 +91,7 @@ struct arch_bug_entry {
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
 	"	.4byte 1b - %l[" #label "]\n"	\
+	"	.4byte 0\n"			\
 	"	.short %2\n"			\
 	".org 2b+%3\n"				\
 	".previous\n"
@@ -106,7 +113,7 @@ struct arch_bug_entry {
 		: : "i" (__FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
-		  ##__VA_ARGS__ : : label)
+		  ##__VA_ARGS__ : "cr0" : label)
 
 /*
  * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
@@ -151,7 +158,7 @@ __label_warn_on:						\
 		} else {					\
 			__label__ __label_warn_on;		\
 								\
-			WARN_ENTRY(PPC_TLNEI " %4, 0",		\
+			WARN_ENTRY(PPC_TLNEI " %4, 0 ; cmpdi %4, 0 ; bne %l[__label_warn_on]",		\
 				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
 				   __label_warn_on,		\
 				   "r" ((__force long)(x)));	\
@@ -178,6 +185,9 @@ __label_warn_on:						\
 #define _EMIT_BUG_ENTRY
 #define _EMIT_WARN_ENTRY
 #endif
+#define arch_generic_bug_entry_clear_once
+void arch_generic_bug_entry_clear_once(struct bug_entry *bug);
+
 #endif /* CONFIG_BUG */
 
 #include <asm-generic/bug.h>
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 1e521a432bd0..14137c17b9cd 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1458,6 +1458,44 @@ static int emulate_math(struct pt_regs *regs)
 static inline int emulate_math(struct pt_regs *regs) { return -1; }
 #endif
 
+static DEFINE_MUTEX(bug_lock);
+
+void arch_generic_bug_entry_clear_once(struct bug_entry *bug)
+{
+	unsigned long bugaddr = bug_addr(bug);
+
+	BUG_ON(!bug->arch.insn);
+
+	mutex_lock(&bug_lock);
+	if (bug->arch.insn == 0) {
+		mutex_unlock(&bug_lock);
+		return;
+	}
+	patch_instruction((u32 *)bugaddr, ppc_inst(bug->arch.insn));
+	bug->arch.insn = 0;
+	mutex_unlock(&bug_lock);
+}
+
+static void bug_entry_done_once(struct bug_entry *bug)
+{
+	unsigned long bugaddr = bug_addr(bug);
+	unsigned int insn;
+
+	if (!mutex_trylock(&bug_lock))
+		return;
+
+	if (bug->arch.insn != 0)
+		goto out;
+
+	if (__get_user(insn, (unsigned int __user *)bugaddr))
+		goto out;
+
+	patch_instruction((u32 *)bugaddr, ppc_inst(PPC_RAW_NOP()));
+
+out:
+	mutex_unlock(&bug_lock);
+}
+
 static void do_program_check(struct pt_regs *regs)
 {
 	unsigned int reason = get_reason(regs);
@@ -1494,7 +1532,7 @@ static void do_program_check(struct pt_regs *regs)
 
 		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
 		    report_bug(bugaddr, regs) == BUG_TRAP_TYPE_WARN) {
-			const struct bug_entry *bug;
+			struct bug_entry *bug;
 			unsigned long recov;
 
 			bug = find_bug(bugaddr);
@@ -1502,6 +1540,8 @@ static void do_program_check(struct pt_regs *regs)
 				recov = regs->nip + 4;
 			else
 				recov = bugaddr - bug->arch.recovery_addr_disp;
+			if (bug && (bug->flags & BUGFLAG_ONCE))
+				bug_entry_done_once(bug);
 
 			regs_set_return_ip(regs, recov);
 			return;
diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index 1ce8431bdf02..a0cb717998c1 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -49,6 +49,15 @@ struct bug_entry {
 #endif
 	unsigned short	flags;
 };
+
+static inline unsigned long bug_addr(const struct bug_entry *bug)
+{
+#ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
+	return (unsigned long)&bug->bug_addr_disp + bug->bug_addr_disp;
+#else
+	return bug->bug_addr;
+#endif
+}
 #endif	/* CONFIG_GENERIC_BUG */
 
 /*
diff --git a/include/linux/bug.h b/include/linux/bug.h
index 348acf2558f3..a207445e5b5f 100644
--- a/include/linux/bug.h
+++ b/include/linux/bug.h
@@ -46,6 +46,7 @@ enum bug_trap_type report_bug(unsigned long bug_addr, struct pt_regs *regs);
 /* These are defined by the architecture */
 int is_valid_bugaddr(unsigned long addr);
 
+void __generic_bug_clear_once(void);
 void generic_bug_clear_once(void);
 
 #else	/* !CONFIG_GENERIC_BUG */
diff --git a/lib/bug.c b/lib/bug.c
index c223a2575b72..d1cc4f763679 100644
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -50,15 +50,6 @@
 
 extern struct bug_entry __start___bug_table[], __stop___bug_table[];
 
-static inline unsigned long bug_addr(const struct bug_entry *bug)
-{
-#ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
-	return (unsigned long)&bug->bug_addr_disp + bug->bug_addr_disp;
-#else
-	return bug->bug_addr;
-#endif
-}
-
 #ifdef CONFIG_MODULES
 /* Updates are protected by module mutex */
 static LIST_HEAD(module_bug_list);
@@ -209,12 +200,21 @@ enum bug_trap_type report_bug(unsigned long bugaddr, struct pt_regs *regs)
 	return BUG_TRAP_TYPE_BUG;
 }
 
+#ifndef arch_generic_bug_entry_clear_once
+#define arch_generic_bug_entry_clear_once(bug)
+#endif
+
 static void clear_once_table(struct bug_entry *start, struct bug_entry *end)
 {
 	struct bug_entry *bug;
 
-	for (bug = start; bug < end; bug++)
-		bug->flags &= ~BUGFLAG_DONE;
+	for (bug = start; bug < end; bug++) {
+		bool triggered = bug->flags & BUGFLAG_DONE;
+		if (triggered) {
+			bug->flags &= ~BUGFLAG_DONE;
+			arch_generic_bug_entry_clear_once(bug);
+		}
+	}
 }
 
 void generic_bug_clear_once(void)
-- 
2.37.2

