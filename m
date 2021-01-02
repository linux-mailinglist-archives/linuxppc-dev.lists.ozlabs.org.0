Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3272E8744
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 13:28:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7Ll038rszDqqK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 23:27:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aJvu87Y+; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7Lh50QjHzDqJ1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:25:21 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id s21so13544482pfu.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BiXWZD14AytAqUE2Q2Qh5NDUePbaWTvuLLAljFHRolY=;
 b=aJvu87Y+Dbp0mlpLpuSuJlR/r3ddgoBsZNjwWghex8PI3qns6IDLO1N6+qcY92qhmj
 U9+77BS1zC1+fG8ZrDOdhecBd6V0RovSaqaaZ24W4KAOp61yxyOU6EKtqEYwicg5dzbG
 cxKmY9/71mL5Nw7BmJ/2GCaZlliAc4hzw1wBuVSp6wIlB16MgwiyHyo0dTL4WtY5oi13
 QaOqfAInoXetFsGJT1vdMgGeZt0ElT1diYdi1QsZqiVCL6wPdp+UK3AzOLJsxXaD4SoN
 RcaiRmGNqtUhXsjqgWqejFgAahAulT+vOkl7UJvOMs2tzlj3A2rxBVMOR5xvqRIBX+NZ
 uaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BiXWZD14AytAqUE2Q2Qh5NDUePbaWTvuLLAljFHRolY=;
 b=qGqKrf13XBfVRvXCxdlP/dvNGZvu6lz+Yp9R6OA0rHppvBzdjDRvqY80m6qlKAZJW0
 xkVGtnN3h/dHbH5atKpcxe2wNSx6vTnxTGLKv8wZB/BKj8mXEg+9u5n1AR9gTux6jjb6
 l1qKYTn96ae3aNuW8BihY7wup5bi4rv9Wq/arNHz615Il89FjacvgzEltRf09+9sxG6C
 Csr0BbXN8lmUrTyNZQlFx51xV26hLIK/nrEKD4jrSJnNwmyhcJgDwWEdVoeOKLJFRK7H
 mjaKsiKoKd2OIVJ/GIabt6s6FOGfM++9LmE4FeW6C/VpTHCGr83JgG10sxm0Qdx8S+j+
 Pr6Q==
X-Gm-Message-State: AOAM532kqV1sMyEwa9F2znegMbqPCWeNQebqq0uGmp59ZRgVvX5vAb4o
 rs7MVm9rbJxD5AGWvia60T+29wyhRmc=
X-Google-Smtp-Source: ABdhPJzuGcpjq32yUO5lvphu4chCjkJ0DB6qRo1W7tf7pMMuoCxbrfHxCudmh60GnnAcaYxv9kbKyA==
X-Received: by 2002:a62:874a:0:b029:19e:6e03:cfc3 with SMTP id
 i71-20020a62874a0000b029019e6e03cfc3mr57953002pfe.67.1609590318778; 
 Sat, 02 Jan 2021 04:25:18 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:25:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 01/21] powerpc/32s: Do DABR match out of handle_page_fault()
Date: Sat,  2 Jan 2021 22:24:48 +1000
Message-Id: <20210102122508.1950592-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210102122508.1950592-1-npiggin@gmail.com>
References: <20210102122508.1950592-1-npiggin@gmail.com>
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

