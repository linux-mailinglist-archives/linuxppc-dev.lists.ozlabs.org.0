Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F17C830954D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:24:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSZfk5ngtzDrTN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:23:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f75ntVIz; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZKs6Q5bzDrRn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:09:21 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id s15so7086276plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tz+dGlIlud8b846NlZPsODSAtHGoLrNLOcqbQTXiVvg=;
 b=f75ntVIzqpvo4nKGhYtx/C9xk095ujxWAS5e1UqNtb0+HnIIQhZr2sF7fg2dNSB1HB
 TW9z2/iT8G1lcOgsrYipZc8exDd0Yx8XocwEgmjNy8242LP6xefGT1gxd2NP4070dSsh
 91H3HwkiFx2hOwIpuZapzdsqpvsGtPOOUx/Zeau3GzqhaABMZ2rMLEE2rzbJzwlmIvAm
 BESA+5uEHvC8acHLCk0rFZGkATAA4Vd0maeIeN7mB3Rwvtw0zgcMKeFAtoUK9vsJG5le
 WQbvrT92eD2qNzLURpKtWY5nRyUA4F+jAXA2rQeJvfSAMkavYN/2XseYgjkRtCmcGE+X
 1szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tz+dGlIlud8b846NlZPsODSAtHGoLrNLOcqbQTXiVvg=;
 b=iTkWohNU1DZUaOYMC8x7nxPoj1aY1M7ZINY62sVtanT0+RDh9xz2WxxX8JG+9gAI2a
 GXbw7cCHjSOgy4L2OV53mFmL6/T+xeeLBZmg0FxpAXt/qlz32Hdrmw/wboNO3MIwYkjM
 mIVi4Zz4Bshe65CBO9n1AiW5YoiciSvPXwqUGXAtjGrKo7Yts5E7v3vmHEjl7B4AH6KN
 Pf9cXR/L5Gp4jlV74UzoYUtXK7jRf+JTnf9nR2yu+MT9HcAaxYHc0YiWXB8Z5oREqLKK
 Q3GrHPFBykl1mByVGz3X7YkrvSnHKCEzOksXFSPX8WHsw6zJctbt7qT4ExpAmLDn6AvR
 PXyQ==
X-Gm-Message-State: AOAM531VTnCStQDgm4W1OwyWbLiXlQIFrrzktxc9bbj1Kr2JI6pwh9xT
 6TMXA3+ckWhyGSQopHibV7OW/XAsR+8=
X-Google-Smtp-Source: ABdhPJzQsKlAV0ITNwSpxUt6cjcnTlyI+P5bBkIvOGTOuFR/I36+MRb9oTpU08G6DKouT0VG9uT/Aw==
X-Received: by 2002:a17:90a:4606:: with SMTP id
 w6mr1419921pjg.205.1612012158833; 
 Sat, 30 Jan 2021 05:09:18 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 03/42] powerpc/32s: move DABR match out of handle_page_fault
Date: Sat, 30 Jan 2021 23:08:13 +1000
Message-Id: <20210130130852.2952424-4-npiggin@gmail.com>
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

From: Christophe Leroy <christophe.leroy@csgroup.eu>

handle_page_fault() has some code dedicated to book3s/32 to
call do_break() when the DSI is a DABR match.

On other platforms, do_break() is handled separately.

Do the same for book3s/32, do it earlier in the process of DSI.

This change also avoid doing the test on ISI.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S       | 15 ---------------
 arch/powerpc/kernel/head_book3s_32.S |  3 +++
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 1c9b0ccc2172..238eacfda7b0 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -670,10 +670,6 @@ ppc_swapcontext:
 	.globl	handle_page_fault
 handle_page_fault:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-#ifdef CONFIG_PPC_BOOK3S_32
-	andis.  r0,r5,DSISR_DABRMATCH@h
-	bne-    handle_dabr_fault
-#endif
 	bl	do_page_fault
 	cmpwi	r3,0
 	beq+	ret_from_except
@@ -687,17 +683,6 @@ handle_page_fault:
 	bl	__bad_page_fault
 	b	ret_from_except_full
 
-#ifdef CONFIG_PPC_BOOK3S_32
-	/* We have a data breakpoint exception - handle it */
-handle_dabr_fault:
-	SAVE_NVGPRS(r1)
-	lwz	r0,_TRAP(r1)
-	clrrwi	r0,r0,1
-	stw	r0,_TRAP(r1)
-	bl      do_break
-	b	ret_from_except_full
-#endif
-
 /*
  * This routine switches between two different tasks.  The process
  * state of one is saved on its kernel stack.  Then the state
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 858fbc8b19f3..6d411b8fd5d3 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -689,7 +689,10 @@ handle_page_fault_tramp_1:
 	lwz	r5, _DSISR(r11)
 	/* fall through */
 handle_page_fault_tramp_2:
+	andis.	r0, r5, DSISR_DABRMATCH@h
+	bne-	1f
 	EXC_XFER_LITE(0x300, handle_page_fault)
+1:	EXC_XFER_STD(0x300, do_break)
 
 #ifdef CONFIG_VMAP_STACK
 .macro save_regs_thread		thread
-- 
2.23.0

