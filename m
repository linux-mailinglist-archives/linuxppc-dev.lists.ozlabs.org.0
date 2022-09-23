Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EFD5E7EAF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYxHb1PmDz3cdg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 01:42:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DmQ2e/Ea;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DmQ2e/Ea;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYxGx6Cqrz3c7y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 01:42:16 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id bu5-20020a17090aee4500b00202e9ca2182so8168010pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=sezbfpSEem8dkYgp/boSXBGHFuAdJzlKrM0WcSQFSwE=;
        b=DmQ2e/EasOhAwkYml0GfkCPbMYUCiDmkB4swoiX6PUnAmB4IUDTYDcbb5S2GW5ppWG
         Zd3jHdS0C/sF3Iqe6nocBo30jYHwpUZrLcyoiBFkb4AmhAUGUP/nFRHOxTDYSP327Zhp
         DT+H/itfAwDvpx2ThAmDm45zWqNxRrF+ai6fYPByVk5nhEuRZdM4qXHjMTtOOXPaQQGJ
         j9FBw7I59SMb/LetbQaCpC4SUoNeEepMJJ2k607XqpRFypkN4WvhPXX98iKx8RYPeiq2
         jlGxFaL3F4ooCXOt6meo8JCZM1cQBBAKlm01luENNq+pejjCwlp3CpRrjUr72I2rFBZ6
         Txuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=sezbfpSEem8dkYgp/boSXBGHFuAdJzlKrM0WcSQFSwE=;
        b=GLniggjd6PLrpKTkRVhiIjoUJshys3dtX+mE8pJm9YQrSbQ1B+EvEi+k5CtNzYsx/i
         KpXiddCqpFj58jUxXMRsE/5YmOcF6SfXW+2ZWcxS8wSUyPMiBr6ZFSTMBoGuzYzcK5F9
         GpNxM4+M9bNvSZwt/lj3VmR9vInWwTRXfTnTB6QcweyCtYMSdP1h3gOT3Nb/W/x7LlI4
         H649kUyJ2/UC/6HEwC2A7OtlvFaP42HT3nern3J0ktFsLlto2wNwC0uTEyy+kuc8/R5H
         ORAn6FcmlC0T2cAOHucrORt0hnl43MLCH47FI6unGtcMr70iNus3CAR9uZIwdymFIVAB
         CMuA==
X-Gm-Message-State: ACrzQf1ZzmaXHT6cFtYF4wnDbePCrfdCsiNb3I4Yn/Fml759yqvZOlYw
	mnKxk+369Xa1aFX34uAWpqqm9GhWOMo=
X-Google-Smtp-Source: AMsMyM47wk1VUAmYEnhAlUG6VBTEXUgs1nR45q7HnIMI0E0mMvLCWawwzdiJCT2KLwf1lOnWTSYUQg==
X-Received: by 2002:a17:90a:c38d:b0:203:5db4:577a with SMTP id h13-20020a17090ac38d00b002035db4577amr10431014pjt.69.1663947733124;
        Fri, 23 Sep 2022 08:42:13 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id t11-20020aa7946b000000b0053e940d360csm6583166pfq.58.2022.09.23.08.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:42:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/2] powerpc: Don't use extable for WARN
Date: Sat, 24 Sep 2022 01:41:42 +1000
Message-Id: <20220923154143.1115645-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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

extable is used for handling user memory access faults from kernel mode,
as such it is a fast-ish path. Using it in the very slow WARN path
increases the number of extable entries from 1306 to 6516 in a
ppc64le_defconfig vmlinux, increasing the average number of search
steps by ~2.3.

This patch adds a recovery address to the bug_entry struct instead of
using the extable. The size of the bug entry table plus the extable
go from 137kB to 126kB.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig           |  4 ++++
 arch/powerpc/include/asm/bug.h | 31 ++++++++++++++++++++++++++++---
 arch/powerpc/kernel/traps.c    | 16 ++++++++++------
 include/asm-generic/bug.h      |  3 +++
 4 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4c466acdc70d..3b379fa15082 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -336,6 +336,10 @@ config GENERIC_BUG_RELATIVE_POINTERS
 	def_bool y
 	depends on GENERIC_BUG
 
+config GENERIC_BUG_ARCH_ENTRY
+	def_bool y
+	depends on GENERIC_BUG
+
 config SYS_SUPPORTS_APM_EMULATION
 	default y if PMAC_APM_EMU
 	bool
diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 61a4736355c2..dec73137fea0 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -14,6 +14,7 @@
 .macro __EMIT_BUG_ENTRY addr,file,line,flags
 	 .section __bug_table,"aw"
 5001:	 .4byte \addr - .
+	 .4byte 0
 	 .4byte 5002f - .
 	 .short \line, \flags
 	 .org 5001b+BUG_ENTRY_SIZE
@@ -26,6 +27,7 @@
 .macro __EMIT_BUG_ENTRY addr,file,line,flags
 	 .section __bug_table,"aw"
 5001:	 .4byte \addr - .
+	 .4byte 0
 	 .short \flags
 	 .org 5001b+BUG_ENTRY_SIZE
 	 .previous
@@ -33,7 +35,6 @@
 #endif /* verbose */
 
 .macro EMIT_WARN_ENTRY addr,file,line,flags
-	EX_TABLE(\addr,\addr+4)
 	__EMIT_BUG_ENTRY \addr,\file,\line,\flags
 .endm
 
@@ -45,12 +46,17 @@
 .endm
 
 #else /* !__ASSEMBLY__ */
+struct arch_bug_entry {
+	signed int recovery_addr_disp;
+};
+
 /* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
    sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
+	"	.4byte 0\n"			\
 	"	.4byte %0 - .\n"		\
 	"	.short %1, %2\n"		\
 	".org 2b+%3\n"				\
@@ -59,6 +65,26 @@
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
+	"	.4byte 0\n"			\
+	"	.short %2\n"			\
+	".org 2b+%3\n"				\
+	".previous\n"
+#endif
+
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define _EMIT_WARN_ENTRY(label)			\
+	".section __bug_table,\"aw\"\n"		\
+	"2:	.4byte 1b - .\n"		\
+	"	.4byte 1b - %l[" #label "]\n"	\
+	"	.4byte %0 - .\n"		\
+	"	.short %1, %2\n"		\
+	".org 2b+%3\n"				\
+	".previous\n"
+#else
+#define _EMIT_WARN_ENTRY(label)			\
+	".section __bug_table,\"aw\"\n"		\
+	"2:	.4byte 1b - .\n"		\
+	"	.4byte 1b - %l[" #label "]\n"	\
 	"	.short %2\n"			\
 	".org 2b+%3\n"				\
 	".previous\n"
@@ -76,8 +102,7 @@
 #define WARN_ENTRY(insn, flags, label, ...)		\
 	asm_volatile_goto(				\
 		"1:	" insn "\n"			\
-		EX_TABLE(1b, %l[label])			\
-		_EMIT_BUG_ENTRY				\
+		_EMIT_WARN_ENTRY(label)			\
 		: : "i" (__FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index dadfcef5d6db..1e521a432bd0 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1494,13 +1494,17 @@ static void do_program_check(struct pt_regs *regs)
 
 		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
 		    report_bug(bugaddr, regs) == BUG_TRAP_TYPE_WARN) {
-			const struct exception_table_entry *entry;
+			const struct bug_entry *bug;
+			unsigned long recov;
 
-			entry = search_exception_tables(bugaddr);
-			if (entry) {
-				regs_set_return_ip(regs, extable_fixup(entry) + regs->nip - bugaddr);
-				return;
-			}
+			bug = find_bug(bugaddr);
+			if (!bug || bug->arch.recovery_addr_disp == 0)
+				recov = regs->nip + 4;
+			else
+				recov = bugaddr - bug->arch.recovery_addr_disp;
+
+			regs_set_return_ip(regs, recov);
+			return;
 		}
 		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
 		return;
diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index ba1f860af38b..1ce8431bdf02 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -36,6 +36,9 @@ struct bug_entry {
 #else
 	signed int	bug_addr_disp;
 #endif
+#ifdef CONFIG_GENERIC_BUG_ARCH_ENTRY
+	struct arch_bug_entry arch;
+#endif
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 	const char	*file;
-- 
2.37.2

