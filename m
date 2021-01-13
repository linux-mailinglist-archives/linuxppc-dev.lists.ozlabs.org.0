Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ACE2F455C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 08:38:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFzpN562vzDqyG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 18:38:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hJLbMN/L; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzg22gHLzDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:32:29 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id b5so624197pjk.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BiXWZD14AytAqUE2Q2Qh5NDUePbaWTvuLLAljFHRolY=;
 b=hJLbMN/L8HbecwRSi/Qx237T6hRbdHpdpD9V1xs9c0NlDgOOStCcsCsO3yVJ/FM21V
 FAYBvCdJ+j4yuxrqSALvlMNgwgL9yqhtXkiqMow3CiEdQlSFZFacuCq96i8q+XDHw9br
 YJXuHYMBgEI3Wa7errTCx5m0RoSuuVOIPhTLzUFbw+EkprWU+vVXhr6z6bkqi2mugmf6
 +Uza/AdZpuRUgN7bc8U17IkdGXcJUhfOhMykU1M2RsA6h1mE7/kIiQ/nalpKEmaDTY69
 ScI/mGzPV49TupEugwqIwH54K6KuNm1dlDwwzejMHxAUe/xBKyukN/+4BxebFV/8IpbH
 IKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BiXWZD14AytAqUE2Q2Qh5NDUePbaWTvuLLAljFHRolY=;
 b=IVRqpHz7SfCCrIEKJTNzxu2fYlsz6k9Z1yqQmRQY4L6nbAsNERrTpp68AhdM0u4IjV
 mAXFl6NGRW6XmxV7E3aiAM+CxvRm6IGV1zmnJwbLSD7UkuZk2hrfpSscwLoeot20QSqt
 fWjmvGfvsodoH5ywXZvsKgrFZX8ElojsosPyTZuZXsLx4WdzTzZkYi4plA9zoZlDpq57
 Z2gU2G0gHGEj0FbFvA3i+tfFz/9/xQbw+e+wxGOW95mFr9PVvKF5OW3SOYMcRywE7ypl
 IMZvdNXtBtzH95DpTCKkQU5wVdOnV+CudAnkUBNQQaLjmDDdp2tawu1C/ozZ9sR7XTDp
 iaMw==
X-Gm-Message-State: AOAM531/Lu4ydp+9J5iRzLs0ugf1Vvwh+oVN8ddkmrVw5P0iivgCvCX8
 C8dLQnrHG7suQVqt/HUjE/RVa4Um5vc=
X-Google-Smtp-Source: ABdhPJz+uNpOHO3I2NgxGJ+xhR+sP/goOWQAKdhF1wiNLTOFbgOrl5I5NMyTmfuwnQSKEv9K0oPj8A==
X-Received: by 2002:a17:902:a3ca:b029:da:df3c:91c8 with SMTP id
 q10-20020a170902a3cab02900dadf3c91c8mr832652plb.41.1610523145984; 
 Tue, 12 Jan 2021 23:32:25 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:32:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 01/21] powerpc/32s: Do DABR match out of handle_page_fault()
Date: Wed, 13 Jan 2021 17:31:55 +1000
Message-Id: <20210113073215.516986-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210113073215.516986-1-npiggin@gmail.com>
References: <20210113073215.516986-1-npiggin@gmail.com>
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

