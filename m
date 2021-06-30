Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C7F3B7E59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 09:49:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFD5R6tmBz3dYg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 17:49:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DdrMD9Yj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DdrMD9Yj; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFD1y3HSnz3061
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 17:46:46 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 in17-20020a17090b4391b0290170ba0ec7fcso3389298pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 00:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Le9lImfTGPP4K5D85xGjoL3el9d+L/uApQNo0qX4ScY=;
 b=DdrMD9Yj78toCGGmYvxBd6i8bgY1xO3becjqUrNqDaQAm+Al2yi5WrUKA7Jn0a28dF
 JHmZKy0HO4hfE1P4MPBXGbbehiBEolmewaM1H/5y/ZKMUhlZssfGZaT5lls+2le4EpbP
 dzVjEeGWzNu1e8XcxecCSzMYn6I1u01eLApG62Nd74h1BSCa9/HTSWK10neAQGhiRrWK
 w5DuhArvJmCXibDRpNu18tq1e95SAOsr9s7x8i6V28lI74Dk5/GWxJ+kAcTdRSXHc3kn
 jZ23ucPrCT+Gwph1f16SHY33419eO9wPl7Sk+nEl4WUqVKutEuKkfVxviB4+YJkByU4q
 HxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Le9lImfTGPP4K5D85xGjoL3el9d+L/uApQNo0qX4ScY=;
 b=GSr1U0yE/ujXCvJCytCvzkQ53N6lppJb2IbSr2tVd+54dgZXjVAT95HMDPGs4WWm9K
 8y2mvjuHXS1AB/psA/KEUkURDxCWJygRUzDVPcwuKm0AHxBcdmsjTJqObfc7c82HSDuS
 rag0icqoSyfS/dkJmauSml+NMXOosb1innCIVlIr2QsL3bjCEkXujWYPmaAowmVRrRyI
 MLNngHBslh8vTy1BhB19OQI4bHv7BvYINTvrZCLO+iMMpJgzBf2nr/IsqWsM1ID6DbVC
 bChTRzqi4EhwdfuYW6ZoidbxEOGp9E+Jwn3cgnm+BsiSHROQfyS3GREbGhqhgJ9nbHaI
 +vsw==
X-Gm-Message-State: AOAM533wrfH+dTOuktLCMkGbDJxjc/uyJTu/fecvj/b5ra9jrFcKXSxS
 MYtxJ5YLddP5wBRtt7imXns6LI3QE9s=
X-Google-Smtp-Source: ABdhPJy1JMwNZVSUn7Djs90JNHsjkNmhIkHKOosJSPcT8gk3CkdikhEN7ZgUU/QkEyI3QS1Q3+XXJw==
X-Received: by 2002:a17:90b:1c02:: with SMTP id
 oc2mr3255075pjb.36.1625039203887; 
 Wed, 30 Jun 2021 00:46:43 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id g4sm20503369pfu.134.2021.06.30.00.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 00:46:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 7/9] powerpc/64/interrupt: add missing kprobe annotations
 on interrupt exit symbols
Date: Wed, 30 Jun 2021 17:46:19 +1000
Message-Id: <20210630074621.2109197-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210630074621.2109197-1-npiggin@gmail.com>
References: <20210630074621.2109197-1-npiggin@gmail.com>
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
without more justification for why it's safe. Disallow kprobing on any
of the (non-local) labels in the exit paths.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 2c92bbca02ca..5c18362693fe 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -197,6 +197,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 .Lsyscall_vectored_\name\()_rst_end:
 
 syscall_vectored_\name\()_restart:
+_ASM_NOKPROBE_SYMBOL(syscall_vectored_\name\()_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
 	ld	r2,PACATOC(r13)
@@ -238,6 +239,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_emulate)
 	.balign IFETCH_ALIGN_BYTES
 	.globl system_call_common_real
 system_call_common_real:
+_ASM_NOKPROBE_SYMBOL(system_call_common_real)
 	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
 	mtmsrd	r10
 
@@ -402,6 +404,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
 #ifdef CONFIG_PPC_BOOK3S
 syscall_restart:
+_ASM_NOKPROBE_SYMBOL(syscall_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
 	ld	r2,PACATOC(r13)
@@ -420,6 +423,7 @@ RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_end, syscall_restart)
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 tabort_syscall:
+_ASM_NOKPROBE_SYMBOL(tabort_syscall)
 	/* Firstly we need to enable TM in the kernel */
 	mfmsr	r10
 	li	r9, 1
@@ -602,6 +606,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 #ifdef CONFIG_PPC_BOOK3S
 interrupt_return_\srr\()_user_restart:
+_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
 	ld	r2,PACATOC(r13)
@@ -735,6 +740,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 #ifdef CONFIG_PPC_BOOK3S
 interrupt_return_\srr\()_kernel_restart:
+_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
 	ld	r2,PACATOC(r13)
-- 
2.23.0

