Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9F2C9453
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 01:53:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClNrq35kfzDqmJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 11:53:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qkVUB6Xe; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClNq72LlCzDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 11:52:18 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id x24so11550736pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 16:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hpOUiMsgMrLYarjDlVezk+0DYPCIz2dM0giFyPfH8bY=;
 b=qkVUB6XedjdzeIPssj88ZbgU4Ew7UFHuMPO64RgXlT6HWPq0afE77wb+6mUejAnSPJ
 0puqGTEbETjTNPMMiOuZryLN1MqSOLYLHPwTXNymZnAyje0+53zLYnA47PasrmddYWS7
 KqO/+uM8TUwuHFPm3n3xNG7JwAiy9ZMtpQajBsmR1tsEbQ/sPxbKwJhApkqlmfCjpj2v
 FQELs4fDKG3cJPsv09HmmphEv6fwL12IqzJac68Qk5Jp0QM05FnjBfNb0q9BfnUt5GrG
 sCMVNswpsB8PA2JmGuUFBnt0UL8DcYyVbPW/yJt+8GWNQ/TIVnmjRq3egIVrNm3r7nsS
 ncjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hpOUiMsgMrLYarjDlVezk+0DYPCIz2dM0giFyPfH8bY=;
 b=IxIxFcVdYnT2HxA4DmLxUKjDGelNMvjbluesSaPITJaAtW4NjL0APc8E6ORhpr3wO2
 8CO+lKVOYVqqrEG1/9/YLkHmF78Px6GzROCg4l/N/qPDgYbYUfSZul+F8gj9lXls4eOK
 EYEQV5o0Ci2tfyS5a6VhfeOwUknfSnTPuO9o6t/3Q2ZgVC/d8VfvncgNuT1WAeN991Zi
 +05JRRuoTDJG7IOAmIErLQ7y377SjLibdFiHfw5fSy+dvXUJ82YiCGrZOxfYZFTlnk7o
 quMUBE3v/8VPdy+y2xQRQenJ5CK4CoEk0g9A657gjZL6K6C7fHjQ1ZmCy1AYyE4gOAzN
 dOnw==
X-Gm-Message-State: AOAM533sBt3mkbXgTnoptcoSC+SN8qTxXtDP9zmPQ7IjabppYJMEA2zN
 rb3YlvK4wmREAdBPLan97Q2ydcdSZu8=
X-Google-Smtp-Source: ABdhPJxLBJmrdoD/6K/HIHMmYbZGEiL05ipwvsIAm6Be3nZ+AjcF7CbnnqwiGFVLcxDPb1fK0YLdvQ==
X-Received: by 2002:a65:6095:: with SMTP id t21mr61367pgu.20.1606783933999;
 Mon, 30 Nov 2020 16:52:13 -0800 (PST)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id 10sm227974pgq.93.2020.11.30.16.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 16:52:13 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc: Allow relative pointers in bug table entries
Date: Tue,  1 Dec 2020 11:52:03 +1100
Message-Id: <20201201005203.15210-1-jniethe5@gmail.com>
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
While this doesn't save space for 32-bit machines, use it anyway so
there is only one code path.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: Remove non-relative pointers code
---
 arch/powerpc/Kconfig           | 4 ++++
 arch/powerpc/include/asm/bug.h | 8 ++++----
 arch/powerpc/xmon/xmon.c       | 4 ++--
 3 files changed, 10 insertions(+), 6 deletions(-)

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
index 338f36cd9934..ba0500872cce 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -12,7 +12,7 @@
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 .macro EMIT_BUG_ENTRY addr,file,line,flags
 	 .section __bug_table,"aw"
-5001:	 PPC_LONG \addr, 5002f
+5001:	 .4byte \addr - 5001b, 5002f - 5001b
 	 .short \line, \flags
 	 .org 5001b+BUG_ENTRY_SIZE
 	 .previous
@@ -23,7 +23,7 @@
 #else
 .macro EMIT_BUG_ENTRY addr,file,line,flags
 	 .section __bug_table,"aw"
-5001:	 PPC_LONG \addr
+5001:	 .4byte \addr - 5001b
 	 .short \flags
 	 .org 5001b+BUG_ENTRY_SIZE
 	 .previous
@@ -36,14 +36,14 @@
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
-	"2:\t" PPC_LONG "1b, %0\n"		\
+	"2:\t.4byte 1b - 2b, %0 - 2b\n"		\
 	"\t.short %1, %2\n"			\
 	".org 2b+%3\n"				\
 	".previous\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
-	"2:\t" PPC_LONG "1b\n"			\
+	"2:\t.4byte 1b - 2b\n"			\
 	"\t.short %2\n"				\
 	".org 2b+%3\n"				\
 	".previous\n"
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 55c43a6c9111..9704c81aff7d 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1745,9 +1745,9 @@ static void print_bug_trap(struct pt_regs *regs)
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 	printf("kernel BUG at %s:%u!\n",
-	       bug->file, bug->line);
+	       (char *)bug + bug->file_disp, bug->line);
 #else
-	printf("kernel BUG at %px!\n", (void *)bug->bug_addr);
+	printf("kernel BUG at %px!\n", (void *)bug + bug->bug_addr_disp);
 #endif
 #endif /* CONFIG_BUG */
 }
-- 
2.17.1

