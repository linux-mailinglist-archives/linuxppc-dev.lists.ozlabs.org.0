Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 447473B7A64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 00:23:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDzWp18Tqz3dYQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 08:23:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VRV8Ox5f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VRV8Ox5f; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDzSP4vPnz306f
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 08:20:21 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id 17so333154pfz.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dl/ypNueAt2O+poDpp4W8n+JUlvOYUy2ukBKe2NJQTc=;
 b=VRV8Ox5f8QBzTlMM8A5zXqCwadYfHmN267qsmaVZXdPJdZ+qEBrfJmjhCtKoDiPRFv
 txIHGRJOYtG6jua+2mcJGjcTDwuxgvsxwod+BlUHdmTnM/6Yw2OISQUiFQBOiC/NSASY
 j3pXNck/+85IdtTgyLPutu6vmD1NnCd2eQHJoQcWsSbHD+M8TZz9t+6deJrGm68zF738
 6LpYoKOr+ZhJgfLPWwEUGAM1Cu0+fv0oaswTQn02ySiBPKj5jH22dgCpSlpnbQA43RhG
 H5WOrdsBCIf6LXnkmH7qBCcRi8//W34IovMKEEBLdEJ2uSg98PTZ3W9eSJi2isaiI+y8
 BfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dl/ypNueAt2O+poDpp4W8n+JUlvOYUy2ukBKe2NJQTc=;
 b=cpjxJDlfBsmk0Iz3ZPOvR3oVNE87o4hfwVe5r/Ha29ln1F8gjpPRp8NVVlDjl6Zakr
 hlX9Wq4D1pIpcuy4iyrW6B09AKX5qBKbBcayXiuWnWu3orD/E9cyrcGC29BSuBq/1HPe
 GscHscAkn9D/kHBoJZeRxtkCp03238C9OkDW+vzMuTOVinwql5Z5jmcQy1XQ/L0+966B
 7PZpXJB+GdgNYtVv/PCMvpgSpdSvBsMl81mLym35xL3zgvxbLzfrJdN1NEc/VM5FKQc9
 9rW5s8M8GF3zOcc5MMFRAp7dHYz76h40N7DgtDz/XEKCZOb2PbOiPgKn0AymO0aj3hW+
 lN9w==
X-Gm-Message-State: AOAM532+ePE+CT/SUGvDmUm1MpdXsHt7Z7gICNTeQgNV8rCSrLtY4WtS
 zkyHdp2IS32uiYjgB0j2uM1rZQfE4p4=
X-Google-Smtp-Source: ABdhPJyHM6JjnF6qJqRJQTAdZjp+O6+ZoXuEJnfwpr93B95w9lyNVfAYfJX9Rnuk2QD/T7VNbp2Q9g==
X-Received: by 2002:aa7:808b:0:b029:2ef:cdd4:8297 with SMTP id
 v11-20020aa7808b0000b02902efcdd48297mr32429410pff.27.1625005219405; 
 Tue, 29 Jun 2021 15:20:19 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id l7sm19316583pgb.19.2021.06.29.15.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 15:20:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 7/9] powerpc/64/interrupts: add missing kprobe annotations
 on interrupt exit symbols
Date: Wed, 30 Jun 2021 08:19:55 +1000
Message-Id: <20210629221957.1947577-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210629221957.1947577-1-npiggin@gmail.com>
References: <20210629221957.1947577-1-npiggin@gmail.com>
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

