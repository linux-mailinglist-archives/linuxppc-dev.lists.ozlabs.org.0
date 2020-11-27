Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6C02C5ED9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 04:04:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChzxH3LvvzDrQV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 14:04:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DH89CHaJ; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chzvg0fl0zDrPh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 14:02:54 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id r2so2020519pls.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 19:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=y38YfYHzNFWW0uhDjfdEY4kwJxb1uk0ec4aPIfuK6ps=;
 b=DH89CHaJvmprl1aDYerkSTOwsMY47u7V+WpQoIWewQiEmsNxPkd6YtCYd+DdK93tgW
 IZ4xGxyPIw26O6s/gYO8W0+uzARKJ8YV0yt4BDJrKwuBptR1hYEymt8Ge2/KzJBjin/2
 8XHK4GeC8dYVMr5zUpcTtU4xV98yU4dV22GatM31FIkpmcfCdpUJjCcs4sxOQ2sSxYYs
 YI0L6SC37U2bTx20UdiIZSlQ5hcw1XAuR+Ae6UpqiDYjo9VjhwuiU+MdRQ3gl6uWWuME
 fd97riPzGaROdTC/ih8IJvGHg20qExYsEXBsQuIAMqT8fFRHVdTPUO43g99ryBXgs9P2
 UDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=y38YfYHzNFWW0uhDjfdEY4kwJxb1uk0ec4aPIfuK6ps=;
 b=RiExmkecl80RMisnrSjSWJp7gQ+OqUhCXGDGN6D0w9Xrpy6rmIPZFwlhB9kUbfuy0c
 a0ChsyZe3SJp+lPkyqWyayEsesyFNofCd07FKVdhZljL2NJn9xigR6xU8RWLsLkRfiRN
 Fnw2+Ua4WH9MpR/o9x/6KQ4pcqtmfVu8bvFC0WAPH9q4Eok4L3EAdQn78Exb3zYnSjlp
 HPQ/vMW0JSlv9sMb7nMNkzZZd29FVo8R68xnOngPr2L5gLQthkFolPCN1bCZpDirQc0T
 d5PHwo42+1NZ8SUUpT1LQC/yD0L8ThV5DXw7lNgI7iBDnKQJ9Suhv1mV9dGDwUebk1IK
 +m3w==
X-Gm-Message-State: AOAM530ZR97KfAM0K6/TGONBhO2eyytoiCR6HIKvVWyrCwgpRH18lqvX
 O1OGhbFP46dG2mZJjKl+cu7jxP29r8CIVg==
X-Google-Smtp-Source: ABdhPJwLgqJamIkiMOZQeZsEkHZhI6aJ+dj5uVxaVhsLr78aV+J4bGV2C7NeTbKgWfqtBTy+ksQmnQ==
X-Received: by 2002:a17:902:848e:b029:d6:d2c9:1d4c with SMTP id
 c14-20020a170902848eb02900d6d2c91d4cmr4896726plo.40.1606446171170; 
 Thu, 26 Nov 2020 19:02:51 -0800 (PST)
Received: from tee480.ibm.com (180-150-65-4.b49641.syd.nbn.aussiebb.net.
 [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w22sm5760609pge.25.2020.11.26.19.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 19:02:50 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Allow relative pointers in bug table entries
Date: Fri, 27 Nov 2020 14:02:38 +1100
Message-Id: <20201127030238.763-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This enables GENERIC_BUG_RELATIVE_POINTERS on Power so that 32-bit
offsets are stored in the bug entries rather than 64-bit pointers.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/Kconfig           |  4 ++++
 arch/powerpc/include/asm/bug.h | 37 ++++++++++++++++++++++++++++++++--
 arch/powerpc/xmon/xmon.c       | 17 ++++++++++++++--
 3 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9f13fe08492..294108e0e5c6 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -311,6 +311,10 @@ config GENERIC_BUG
 	default y
 	depends on BUG
 
+config GENERIC_BUG_RELATIVE_POINTERS
+	def_bool y
+	depends on GENERIC_BUG
+
 config SYS_SUPPORTS_APM_EMULATION
 	default y if PMAC_APM_EMU
 	bool
diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 338f36cd9934..d03d834042a1 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -12,7 +12,11 @@
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 .macro EMIT_BUG_ENTRY addr,file,line,flags
 	 .section __bug_table,"aw"
+#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 5001:	 PPC_LONG \addr, 5002f
+#else
+5001:	 .4byte \addr - 5001b, 5002f - 5001b
+#endif /* CONFIG_GENERIC_BUG_RELATIVE_POINTERS */
 	 .short \line, \flags
 	 .org 5001b+BUG_ENTRY_SIZE
 	 .previous
@@ -23,7 +27,11 @@
 #else
 .macro EMIT_BUG_ENTRY addr,file,line,flags
 	 .section __bug_table,"aw"
+#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 5001:	 PPC_LONG \addr
+#else
+5001:	 .4byte \addr - 5001b
+#endif /* CONFIG_GENERIC_BUG_RELATIVE_POINTERS */
 	 .short \flags
 	 .org 5001b+BUG_ENTRY_SIZE
 	 .previous
@@ -34,20 +42,45 @@
 /* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
    sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
 	"2:\t" PPC_LONG "1b, %0\n"		\
 	"\t.short %1, %2\n"			\
 	".org 2b+%3\n"				\
 	".previous\n"
-#else
+
+#else /* relative pointers */
+
+#define _EMIT_BUG_ENTRY				\
+	".section __bug_table,\"aw\"\n"		\
+	"2:\t.4byte 1b - 2b, %0 - 2b\n"		\
+	"\t.short %1, %2\n"			\
+	".org 2b+%3\n"				\
+	".previous\n"
+#endif /* relative pointers */
+
+#else /* verbose */
+
+#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
 	"2:\t" PPC_LONG "1b\n"			\
 	"\t.short %2\n"				\
 	".org 2b+%3\n"				\
 	".previous\n"
-#endif
+
+#else /* relative pointers */
+
+#define _EMIT_BUG_ENTRY				\
+	".section __bug_table,\"aw\"\n"		\
+	"2:\t.4byte 1b - 2b\n"		\
+	"\t.short %2\n"				\
+	".org 2b+%3\n"				\
+	".previous\n"
+
+#endif /* relative pointers */
+#endif /* verbose */
 
 #define BUG_ENTRY(insn, flags, ...)			\
 	__asm__ __volatile__(				\
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 55c43a6c9111..5f7cf7e95767 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1731,6 +1731,9 @@ static void print_bug_trap(struct pt_regs *regs)
 #ifdef CONFIG_BUG
 	const struct bug_entry *bug;
 	unsigned long addr;
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+	char *file;
+#endif
 
 	if (regs->msr & MSR_PR)
 		return;		/* not in kernel */
@@ -1744,10 +1747,20 @@ static void print_bug_trap(struct pt_regs *regs)
 		return;
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
+	file = bug->file;
+#else /* relative pointers */
+	file = (char *)bug + bug->file_disp;
+#endif /* relative pointers */
 	printf("kernel BUG at %s:%u!\n",
-	       bug->file, bug->line);
+	       file, bug->line);
 #else
-	printf("kernel BUG at %px!\n", (void *)bug->bug_addr);
+#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
+	addr = bug->addr;
+#else /* relative pointers */
+	addr = (unsigned long)bug + bug->bug_addr_disp;
+#endif /* relative pointers */
+	printf("kernel BUG at %px!\n", (void *)addr);
 #endif
 #endif /* CONFIG_BUG */
 }
-- 
2.17.1

