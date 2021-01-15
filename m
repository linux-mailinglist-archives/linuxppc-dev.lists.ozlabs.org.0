Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AE82F814E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 17:56:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHS571BDYzDsWK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 03:56:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bCuRfVsA; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRxx1n4RzDsgt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:50:28 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id c13so5815594pfi.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BiXWZD14AytAqUE2Q2Qh5NDUePbaWTvuLLAljFHRolY=;
 b=bCuRfVsAgJdSFktZ5a41ivDshSONMkTdL7QNZfm1AfDUvpny00SbigcCKmukNI+Wf0
 S99HRh2g80LUEm4inHZKkGUQn8WT8csuRZGCTe3njFgqAbOaOpXti6oWWRN6wFduVkgE
 UkyqXuspWMOTVwOIPugdqiHhaWYtI3kVrW31BjA4YOhL6Hw+pqGLTgY6bWB76wol0TxO
 Uoue+tcxto1GGJ/+rkZ1ud22OEJnh9z/fZsrYHn/lBfvIhEOGCFqlnFB4NLawCR9tM72
 bUflNhSRahlY4WB/SRsKl38KKSjazmVszEY+IJ+oJu2Hqi2TRQ7VppUoKrxNnG9a9++K
 sh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BiXWZD14AytAqUE2Q2Qh5NDUePbaWTvuLLAljFHRolY=;
 b=Ft2zlRFKDbKLoA2hd8WanOCSEPFOjTR8MiImCnlztUa+ngno9UQAKUuiZCg6FwX4FO
 sYCMpmDQudjCuNBGDN8+7pUJ0THlRi+PKe6slh5Oj/mLHZbQnPkl4N9gUJaooNldjANJ
 XU5oNXVrODsAtwYGPj2B6LNq4/ITSskD7V4bwZ9BntW9NKJtU7xNdilFW/myVe9Ss5ZA
 fGjFCugVVAQjAFFdmVZz+0DjB5JoSoX6JH6jYkS3pORiRpdFvtNI8mtcYy4gdXWQj8QT
 QGqkRkHzo/4R9s9bYaSr4Fzg6sL3SqyxbdvwZw1/+npStGrUagd64JxiFbuya4W42ERx
 kN9g==
X-Gm-Message-State: AOAM5301OyWXHPfWBGtlFxTlXRunw8Sr5y36raa8bfhNm1cFyG2XFDrf
 v+A5hmnwTONrTR988I/qa4+77XXfQ/o=
X-Google-Smtp-Source: ABdhPJx/rcFEV+o+Rr6AWlPMpaLRO3FQic8B28yelIIdF6Kzrt5SXbendBcVHIYESrUhyo9xtP24Ew==
X-Received: by 2002:a63:725d:: with SMTP id c29mr8099472pgn.236.1610729426284; 
 Fri, 15 Jan 2021 08:50:26 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:50:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 02/39] powerpc/32s: move DABR match out of handle_page_fault
Date: Sat, 16 Jan 2021 02:49:35 +1000
Message-Id: <20210115165012.1260253-3-npiggin@gmail.com>
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
index 349bf3f0c3af..fc9a12768a14 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -680,7 +680,10 @@ handle_page_fault_tramp_1:
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

