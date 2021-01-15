Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D132F8172
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:04:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHSFj73v2zDqyB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:04:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ax+epYOo; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRy95k0vzDshj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:50:41 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id b5so5534377pjl.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4KaqbIbZCf8cZawDRivc6DU3QbwIaKzwxG1I1cHwtpw=;
 b=Ax+epYOomqEegnnH6cQMRGgzo5h4qvIehLFkt/0Gi/8tI4H9uodz84BZhH6AyjXg7c
 LFufD522gmYo07NC/02AC2cgul8NlfpVlbM48MDA7Hp4/c2z8NoaQYUsMKme+pumH+Br
 sxfMgT+tqTeK/y2A79IsknjsPzCJmvXHyeuisVLbfYODVHnskOTWBz8ceL/6Ven7dEK/
 hVCEweKpx/6SDXLCvg16rJdLt6yUZgSXV8WMLl36BfkFr21GF0oqBlt+60py53VVWk4k
 dvGgwrIHeCmTPfI0Zh8hqhnerNIYCUjX2GIu/GCRkQRo3pRmnMSCKo0GFYTSVqnkFXDv
 0oPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4KaqbIbZCf8cZawDRivc6DU3QbwIaKzwxG1I1cHwtpw=;
 b=gQWacioitkC1SVNwdorvKNFoBbPqu3tML4tax1irWlpIE+FIXbgbxA4ISaD9s2GXHB
 FTa39WiEvDttwM7B9A9eWmsI69TMhv4e1VVb0fNAgRNMtfUTnzxjvE/Gmt2d1tqOsnnC
 IUng6AtHclCuD3solnogOYIkNvtdRRwftBeImhNLvG5icMnoqQls9HvVl2kc2LR38KIQ
 lrZMA6SvYXVFWo+Xq82Y/+qjPcX9Wike4tE6nF+FuEGCcsf3V9bqVBDbdnto0r1qL2et
 425X5dEwr+7pv3dJSyW+w7HqiGtgobKWonUBG2HI0foytYWs9Wh0AyGLOs0tltv+xZ9u
 C7YQ==
X-Gm-Message-State: AOAM533LPFjsyhOX6NoAj6qs9H0EpyPYVFxVKGqfw9JMLD3MtiL4WJqf
 s54PhOKUTIkgcUEKmiNkdyHUOIf1HOQ=
X-Google-Smtp-Source: ABdhPJwXKtdadoHJATto9LOEQEPLYUutRWO0uXdmcv5zNsskkgKpc1s9DPBO/XCV1yWXR8mmQHXnYA==
X-Received: by 2002:a17:902:ed4a:b029:de:84d3:c237 with SMTP id
 y10-20020a170902ed4ab02900de84d3c237mr519992plb.59.1610729438207; 
 Fri, 15 Jan 2021 08:50:38 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:50:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 06/39] powerpc: do_break get registers from regs
Date: Sat, 16 Jan 2021 02:49:39 +1000
Message-Id: <20210115165012.1260253-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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

