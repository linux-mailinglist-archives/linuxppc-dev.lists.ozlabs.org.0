Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7381330956E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:38:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSZyv1594zDqTw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:37:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BdkpIhPv; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZLB3F7gzDrTf
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:09:37 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id g15so8494094pgu.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4KaqbIbZCf8cZawDRivc6DU3QbwIaKzwxG1I1cHwtpw=;
 b=BdkpIhPvyFo5/mrCx2M9ZliPAmDBxxQpQ23Rltnx6Mfwy4s9FYKQUsSKU5WZfyIsIG
 hHQFPl9YrjyCBnCJcYORjB+U1/7HqvD7mdh8oj796qiCZorxxJaQ/DOpXbNwa3lU3Hud
 dTw1Oh1Kizlg3aOjVL584lT2PUgroxT4XTi3DsNcafpx5mFcvHS8KF2XC0Og80nadNYP
 qjFp+qoUJ9o0YAcHvhtJWmAaqGLESd59AhkquSkuJH+5Q2eO2ase0PJ0D22/RpJ/UwGz
 yTAN72Jkbxm+icNmtvAltvkJ6DwLbOeg7H5RzSNau3DVqoeBfp6HSuyiXcSWgW0Hbdyh
 NTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4KaqbIbZCf8cZawDRivc6DU3QbwIaKzwxG1I1cHwtpw=;
 b=OT14s0AAgk8Dklq97ClEdp0JjAhfdh5LMYnq+gPPplT6Ii9czo3JNr6noMULxBVxV9
 hopxfbrPViaruTde8NWZQDK4zwt9+OsmsBugxUqCG+3w9tlGTY2tNiQCYLe+n/+LYg6Q
 gTD4uUIRRTyL5vGe69EkqoPKpdbzazWHXBOrZqSbhBy3LGgast9Zqxtfu6Y3s7Q3Wo0F
 J31tWtzBs+Jmj2gOcjckQlEDBoxnqlXDkR6lVWnCgiNjWqbyLB9uIcQNX/XT3TUzCOOX
 mGWwOEh3yPNhHKXaCZ2PTdjQ0palcK36UDyPYGbJwgzX15L4ThLE9FvHLAKAVukMNM5a
 2BzQ==
X-Gm-Message-State: AOAM531lwF0BERP/nHYnEtZhM9YwbLlnzHGcy3VmZgddZGPWoCdHSwV3
 HT0GGca4Ony259hUiulKcvRVM5nwpDc=
X-Google-Smtp-Source: ABdhPJz9akVzuCyTjRWJvEsTG4roXZqxyGPXSt5w46tEqiD0TsNv8gXu8BHXR1wdDx7azxkRLKlxdw==
X-Received: by 2002:a65:498e:: with SMTP id r14mr8798194pgs.235.1612012175007; 
 Sat, 30 Jan 2021 05:09:35 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 08/42] powerpc: do_break get registers from regs
Date: Sat, 30 Jan 2021 23:08:18 +1000
Message-Id: <20210130130852.2952424-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to the previous patch this makes interrupt handler function
types more regular so they can be wrapped with the next patch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/debug.h | 3 +--
 arch/powerpc/kernel/head_8xx.S   | 5 ++---
 arch/powerpc/kernel/process.c    | 7 +++----
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
index ec57daf87f40..0550eceab3ca 100644
--- a/arch/powerpc/include/asm/debug.h
+++ b/arch/powerpc/include/asm/debug.h
@@ -52,8 +52,7 @@ extern void do_send_trap(struct pt_regs *regs, unsigned long address,
 			 unsigned long error_code, int brkpt);
 #else
 
-extern void do_break(struct pt_regs *regs, unsigned long address,
-		     unsigned long error_code);
+void do_break(struct pt_regs *regs);
 #endif
 
 #endif /* _ASM_POWERPC_DEBUG_H */
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 0b2c247cfdff..7869db974185 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -364,10 +364,9 @@ do_databreakpoint:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	mfspr	r4,SPRN_BAR
 	stw	r4,_DAR(r11)
-#ifdef CONFIG_VMAP_STACK
-	lwz	r5,_DSISR(r11)
-#else
+#ifndef CONFIG_VMAP_STACK
 	mfspr	r5,SPRN_DSISR
+	stw	r5,_DSISR(r11)
 #endif
 	EXC_XFER_STD(0x1c00, do_break)
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index a66f435dabbf..4f0f81e9420b 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -659,11 +659,10 @@ static void do_break_handler(struct pt_regs *regs)
 	}
 }
 
-void do_break (struct pt_regs *regs, unsigned long address,
-		    unsigned long error_code)
+void do_break(struct pt_regs *regs)
 {
 	current->thread.trap_nr = TRAP_HWBKPT;
-	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, error_code,
+	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, regs->dsisr,
 			11, SIGSEGV) == NOTIFY_STOP)
 		return;
 
@@ -681,7 +680,7 @@ void do_break (struct pt_regs *regs, unsigned long address,
 		do_break_handler(regs);
 
 	/* Deliver the signal to userspace */
-	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)address);
+	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)regs->dar);
 }
 #endif	/* CONFIG_PPC_ADV_DEBUG_REGS */
 
-- 
2.23.0

