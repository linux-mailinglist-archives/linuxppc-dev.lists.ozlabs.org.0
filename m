Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E44453FE076
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 18:55:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H09CY663Wz2ynY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 02:55:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oW6Vl9Ky;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oW6Vl9Ky; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H09Bw00y5z2xrg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 02:54:29 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id w8so45780pgf.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 09:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d3kI7+BUsr3OVzhTjzR2IW/TBxPALK/7LDl3mNUQLaQ=;
 b=oW6Vl9KyQnaFt46fWNMVcBmSOFFEhe5CHagPLQYbCq3QHqrY+MKcJrKGFJFLPCZbx7
 R6PicJjgx4hfce24jIvkK2aMkP0wisNEzB9LhlOZE9FOtMJ1ShtIFwTe6ART0M0oAETI
 E4uN45kSJ1AH1eqk9VpiYFXoI+AQISCIiQ+KM4qr9tULe8bJrkfwdBQwt74CfZNIoAcr
 g9og7/Ft8B3Ws3UBX0qEJuCFuFaOLFmezieeRApGxBuv75b90TFmx3R957CPoDm8GqkE
 cvu2nJUv7iT/OjNP4mrY1b1fy7PcI/ujP+ak/TZbPY5Bp9ji62W03LzGEAc+tP7QxMYf
 tOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d3kI7+BUsr3OVzhTjzR2IW/TBxPALK/7LDl3mNUQLaQ=;
 b=hwYVz/MfpsWqvuw6b1xWB+V0LYddUauzxM7zJ0S15n5fJuUf5jbmcbNMVnd7AjndDc
 u6E25e/yv8ayInUjK9rFV0TL1sRCHRy8acLXUYTVZ/941ZTRPrEVslxn0UmEI46TdQgT
 YjKYHYLmFndjb8d0kcV0r/XX6aDkAtKvYtOiLOkWrSXfy3f+hX5DHYxmISTnkJU+1RNB
 6+dQZBcuJvMUlgQBwmFWoBFENcusFZ2WW3GvyLP4BAJq1P6qNm8QYqyyAT0xkNI3h+nj
 RLCFrSQExMIhWSkoFUJ0NdK2AVM0ysW3faucM422kuD90Lk+gfl/dumI7DFmZCCZGXnj
 Plmw==
X-Gm-Message-State: AOAM531ZPIUWB5zXsjYuAWb2QtZK0yopoLxXxGU9CGkAGq3x8fIkD+Io
 SxAK/oY5hZlWBh8dFzi8vwrmMGPQ+SU=
X-Google-Smtp-Source: ABdhPJynTDOL7DwduubDKuwrxoAD3YI0g0X1mzZInS4t1RLdFgVedM6n/Io6DltQUY3H5vycMBZ5WQ==
X-Received: by 2002:a62:5846:0:b0:3f2:805b:50b1 with SMTP id
 m67-20020a625846000000b003f2805b50b1mr350151pfb.74.1630515266602; 
 Wed, 01 Sep 2021 09:54:26 -0700 (PDT)
Received: from bobo.ibm.com (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id m64sm221824pga.55.2021.09.01.09.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 09:54:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/64s: system call scv tabort fix for corrupt
 irq soft-mask state
Date: Thu,  2 Sep 2021 02:54:17 +1000
Message-Id: <20210901165418.1412891-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Eirik Fuller <efuller@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a system call is made with a transaction active, the kernel
immediately aborts it and returns. scv system calls disable irqs even
earlier in their interrupt handler, and tabort_syscall does not fix this
up.

This can result in irq soft-mask state being messed up on the next
kernel entry, and crashing at BUG_ON(arch_irq_disabled_regs(regs)) in
the kernel exit handlers, or possibly worse.

Fix this by having tabort_syscall setting irq soft-mask back to enabled
(which requires MSR[EE] be disabled first).

Reported-by: Eirik Fuller <efuller@redhat.com>
Fixes: 7fa95f9adaee7 ("powerpc/64s: system call support for scv/rfscv instructions")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

Tested the wrong kernel before sending v1 and missed a bug, sorry.

 arch/powerpc/kernel/interrupt_64.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index d4212d2ff0b5..9c31d65b4851 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -428,16 +428,22 @@ RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_end, syscall_restart)
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 tabort_syscall:
 _ASM_NOKPROBE_SYMBOL(tabort_syscall)
-	/* Firstly we need to enable TM in the kernel */
+	/* We need to enable TM in the kernel, and disable EE (for scv) */
 	mfmsr	r10
 	li	r9, 1
 	rldimi	r10, r9, MSR_TM_LG, 63-MSR_TM_LG
+	LOAD_REG_IMMEDIATE(r9, MSR_EE)
+	andc	r10, r10, r9
 	mtmsrd	r10, 0
 
 	/* tabort, this dooms the transaction, nothing else */
 	li	r9, (TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT)
 	TABORT(R9)
 
+	/* scv has disabled irqs so must re-enable. sc just remains enabled */
+	li	r9,IRQS_ENABLED
+	stb	r9,PACAIRQSOFTMASK(r13)
+
 	/*
 	 * Return directly to userspace. We have corrupted user register state,
 	 * but userspace will never see that register state. Execution will
-- 
2.23.0

