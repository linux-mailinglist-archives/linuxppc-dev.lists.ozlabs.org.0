Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF71F3B7A66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 00:24:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDzXn5rM5z3bqm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 08:24:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oW8tdQAB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oW8tdQAB; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDzSV155cz308J
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 08:20:26 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id e33so130628pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 15:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DAxuQnwoSFaaEZhnxTC5DarUsV4i4rnGyZG+PA3KsCo=;
 b=oW8tdQABQDz+ZVLlfAsXDZyCgRtIr1LimpBRw6/6Xch5y4DAr9WTMkPvxV3dHvoU/q
 rV0IyKm37gq+zzJscU6kPYYUcq+h5EJRRUo2UFdWQIfU8QErbAVPWd77TSQyjmTT4nFT
 V5BS5t+PwcWimhbfinL4TCkuIhNbk70HZP9rp+7wKuXjJpxPe0Rw9n0t5VYJhjU74H+I
 FYgZ9yq6jngy9BV6wE93NCj+jxNi/VTI3zn/JDcqBBfjGJHFh6/l3HCOfkQndlbTgbaq
 Uuc1qexZn3irkj1pPRHAPqM2BLAeFyuRmJEnmenO/UUZSQm0IjH23UpNBsV15c6TPFYj
 cAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DAxuQnwoSFaaEZhnxTC5DarUsV4i4rnGyZG+PA3KsCo=;
 b=bv65wwUNl2b6IL6rtD+j9nJgBDod/MmjjpepXn7Lnfl6ThW0/yLsC8QAzbPll8BcdO
 MgAGUTWeN6sJNupPJJTvARI/8W+sqeZ0muZcerBY/K075nyPJtN2e0n6sCqXIuG1Bg7R
 dvXiMTgz9eGznEfZ+FM6n/eOqqrtLsE3q9VPUBt6NDEbDmRxTkuGu8UDBAG5IihmV2IE
 9bxPntmd74mrrgzQ5h1hWw8ycg/wTQnRhRQan92TISX7vFw5KnKKlgjBc7GKJ9idqXrH
 1CYdAc8BbpuL64rf4WIsUv23FrLEzgpz9v5NwlJ4/QejEdBlu3yfKfiDTG5/INw6bPpu
 uO4A==
X-Gm-Message-State: AOAM533W/sI0fTb4cJcn5GlAl0CtlpiwftoiylC3ed+xLNaqKcUboTgb
 j3DKAhwizZzbisv4ecQ29ivaFjj3kec=
X-Google-Smtp-Source: ABdhPJyecadAOXWibfm0Me+Wc2SJTO9beVpXteuXvdmCHlOI/i/XQ/uuwcr1kdbnTivp+CV+FpwvfA==
X-Received: by 2002:a65:67d4:: with SMTP id b20mr30765936pgs.93.1625005223745; 
 Tue, 29 Jun 2021 15:20:23 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id l7sm19316583pgb.19.2021.06.29.15.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 15:20:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 9/9] powerpc/64s: move ret_from_fork etc above
 __end_soft_masked
Date: Wed, 30 Jun 2021 08:19:57 +1000
Message-Id: <20210629221957.1947577-10-npiggin@gmail.com>
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

Code which runs with interrupts enabled should be moved above
__end_soft_masked where possible, because maskable interrupts that hit
below there need to consult the soft mask table.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 52 +++++++++++++++---------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 795c105850e4..3ca3576690ce 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -451,32 +451,6 @@ _ASM_NOKPROBE_SYMBOL(tabort_syscall)
 	b	.	/* prevent speculative execution */
 #endif
 
-#ifdef CONFIG_PPC_BOOK3S
-_GLOBAL(ret_from_fork_scv)
-	bl	schedule_tail
-	REST_NVGPRS(r1)
-	li	r3,0	/* fork() return value */
-	b	.Lsyscall_vectored_common_exit
-#endif
-
-_GLOBAL(ret_from_fork)
-	bl	schedule_tail
-	REST_NVGPRS(r1)
-	li	r3,0	/* fork() return value */
-	b	.Lsyscall_exit
-
-_GLOBAL(ret_from_kernel_thread)
-	bl	schedule_tail
-	REST_NVGPRS(r1)
-	mtctr	r14
-	mr	r3,r15
-#ifdef PPC64_ELF_ABI_v2
-	mr	r12,r14
-#endif
-	bctrl
-	li	r3,0
-	b	.Lsyscall_exit
-
 	/*
 	 * If MSR EE/RI was never enabled, IRQs not reconciled, NVGPRs not
 	 * touched, no exit work created, then this can be used.
@@ -770,3 +744,29 @@ interrupt_return_macro hsrr
 __end_soft_masked:
 DEFINE_FIXED_SYMBOL(__end_soft_masked)
 #endif /* CONFIG_PPC_BOOK3S */
+
+#ifdef CONFIG_PPC_BOOK3S
+_GLOBAL(ret_from_fork_scv)
+	bl	schedule_tail
+	REST_NVGPRS(r1)
+	li	r3,0	/* fork() return value */
+	b	.Lsyscall_vectored_common_exit
+#endif
+
+_GLOBAL(ret_from_fork)
+	bl	schedule_tail
+	REST_NVGPRS(r1)
+	li	r3,0	/* fork() return value */
+	b	.Lsyscall_exit
+
+_GLOBAL(ret_from_kernel_thread)
+	bl	schedule_tail
+	REST_NVGPRS(r1)
+	mtctr	r14
+	mr	r3,r15
+#ifdef PPC64_ELF_ABI_v2
+	mr	r12,r14
+#endif
+	bctrl
+	li	r3,0
+	b	.Lsyscall_exit
-- 
2.23.0

