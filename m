Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E653B5A17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 09:52:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD0FV4MfXz3dVC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 17:52:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=D2tGl4nV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D2tGl4nV; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD0BW0rVSz3bSr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 17:49:55 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 cx9-20020a17090afd89b0290170a3e085edso211689pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dl/ypNueAt2O+poDpp4W8n+JUlvOYUy2ukBKe2NJQTc=;
 b=D2tGl4nVKDWQ7qf4DUOKMB/iXJTOexQgDctgENQdQj5N1vHTNBlmlstjmZ87PGsnQv
 bs+BhZntnZD2yIzrh/3Bqxhhkkt6zpyMbA6AAYyVjZXrVLWj/y7ObQACHalEnGnXeZsS
 oasR8cldpgyRSg/PikqjLY/WeOSoX7j/0jK+yofFs8zEW3jEag4b31ZD+wVzmYngDpCQ
 pXvNHeWDuOqi+SyPBVJUljoKhKPDd82px3pMoVqZ0zquvoyX1SHARCFXxtL7iKRzRwo/
 tas23KgLRiD3BI8bPAsVvsCx8lBxQ4fJUpjEea42dyUu4rw2Q4ul66RiY1TYLnpfa9Fq
 nGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dl/ypNueAt2O+poDpp4W8n+JUlvOYUy2ukBKe2NJQTc=;
 b=CyKEpo4gdsPV8Rb9iJg/CR/GM5qcbhsz4GfqaqD+SV7nV0UmwL/1Ewrh7D3Fj7t1o2
 jfUPfgsiHXPWBY+YqWYtN1DMAOLnCUajN3Ar3c1Nbx2LBIhZOqMzFMkhhGDeadSA/XX2
 hYG1vj3mwB/iExEHSoGLn1apxaVb2vl8SgmBzGZA8KFvAFIYSDHlVB8bDZZAw7OB+D8g
 kE4k/uSBjAXYiY+NnmI6hS4uR/wBQZeGfaUWJGbDe9RD1pn0jZt9higwwllibxa9b4Dd
 OkWM50PMmhLiQuAphFLcjqhFHsHL2d7278YSC9bAMdSGHUqmfAosNtycaakWrXr0+j8T
 /KpA==
X-Gm-Message-State: AOAM531P1/Al4xVFmwmYavHkmLLULOhmAGDv2wzXXdwqesKK+b3m/2sq
 LM89DCAfQjbvu76N/Y2Sv6UfQZQvwks=
X-Google-Smtp-Source: ABdhPJygbmcMIlEPPYZMyyiUWOWY6GW1XdST60hzKej88f7tOOyCteq1wlDEG+IEcKNh4wAPbLj+0w==
X-Received: by 2002:a17:90a:4414:: with SMTP id
 s20mr25916695pjg.81.1624866592641; 
 Mon, 28 Jun 2021 00:49:52 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id b22sm5264962pfp.20.2021.06.28.00.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 00:49:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/8] powerpc/64/interrupts: add missing kprobe annotations on
 interrupt exit symbols
Date: Mon, 28 Jun 2021 17:49:30 +1000
Message-Id: <20210628074932.1499554-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210628074932.1499554-1-npiggin@gmail.com>
References: <20210628074932.1499554-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If one interrupt exit symbol must not be kprobed, none of them can be,
really.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index c06ed64541e1..06244b4df719 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -198,6 +198,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
 #ifdef CONFIG_PPC_BOOK3S
 syscall_vectored_\name\()_restart:
+_ASM_NOKPROBE_SYMBOL(syscall_vectored_\name\()_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
 	ld	r2,PACATOC(r13)
@@ -240,6 +241,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_emulate)
 	.balign IFETCH_ALIGN_BYTES
 	.globl system_call_common_real
 system_call_common_real:
+_ASM_NOKPROBE_SYMBOL(system_call_common_real)
 	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
 	mtmsrd	r10
 
@@ -404,6 +406,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
 #ifdef CONFIG_PPC_BOOK3S
 syscall_restart:
+_ASM_NOKPROBE_SYMBOL(syscall_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
 	ld	r2,PACATOC(r13)
@@ -422,6 +425,7 @@ RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_end, syscall_restart)
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 tabort_syscall:
+_ASM_NOKPROBE_SYMBOL(tabort_syscall)
 	/* Firstly we need to enable TM in the kernel */
 	mfmsr	r10
 	li	r9, 1
@@ -604,6 +608,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 #ifdef CONFIG_PPC_BOOK3S
 interrupt_return_\srr\()_user_restart:
+_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
 	ld	r2,PACATOC(r13)
@@ -737,6 +742,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 #ifdef CONFIG_PPC_BOOK3S
 interrupt_return_\srr\()_kernel_restart:
+_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
 	ld	r2,PACATOC(r13)
-- 
2.23.0

