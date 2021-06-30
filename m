Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E743B7E5C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 09:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFD6W0Wdnz3brR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 17:50:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bSYQHH1O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bSYQHH1O; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFD222QxYz304T
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 17:46:50 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id o18so798731pgu.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QYaZltRaZgDkjpeVbKd7iwfeInjmMRYrUqsZXqNkK9w=;
 b=bSYQHH1O7Pn8h43ub4lo+Hu5egt7clZOxAvMgfj942ym/HzbBPsPJXmtafuk20oq2u
 dp1ZU8FqnAIYEpLbCUxI7i1MgcvPrg8Lulhs0ohZ4PVFZra+lBZgNuqCSebSO9lU0tu3
 JUkZp8dXdr8ShCJgGIVautGYojryLliNxjevTxnQUWsP/v6FZpGhqcM/fbNmy14GmFY5
 ShDe0e+4aC4IGAFk8L1tx4syjD5E54C8GgTyk4KMRpSg9slE2ZTusxJIPSxYMFRVOTpv
 f5y1C92ZSUWxu6zIuEWwHGID4959sbMXePuwWJiyz0DW10mV/MeRX6+uc77qxS0Tg52C
 ALRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QYaZltRaZgDkjpeVbKd7iwfeInjmMRYrUqsZXqNkK9w=;
 b=mUPGmWoAjx8Zyj+MNrNJaOYsV2UelAO7W3MJjN8LUT0KeTIQznog917ffzFSe26yKA
 Srr2iPkZCzgLN89QbFpTqzuM/fLYzzBOpvpUnSU6pxbIKoW+aK5Qvo4nvw0vPDp16poE
 i75ZnyXAI8fb+EJHioEmzwm/nkKo0ASg2nCcSEAMLFbokD2bIWHnmPC38R6L13j/tSEm
 977wItpw/Sf83/+0dWwRl+icSLlqybLQCE208T7KJkAAHtA9OQlEm4uhjB0YcBXvpcpq
 K9RytqjyPN4+Dq9r4V9S42HiT44/6jRp4TKKZY2MOMZb16BNZr7gd7onQz7FFTQQo/PB
 k8ug==
X-Gm-Message-State: AOAM531l8K5UIURUz1hePadbpiGyLeZabyFipj9nE+lxmIvmRm//3N6T
 +DKGgpbbeiwq+A10vMHFc2yUi+MucBE=
X-Google-Smtp-Source: ABdhPJwLr/VAcjp0FDkfXvy+cwuHCt3lYOctId4yQGwjUJoVYvhl0KtfV71yCRTjXWpv2OXttRfdMQ==
X-Received: by 2002:a63:4d58:: with SMTP id n24mr23115652pgl.183.1625039208234; 
 Wed, 30 Jun 2021 00:46:48 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id g4sm20503369pfu.134.2021.06.30.00.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 00:46:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 9/9] powerpc/64s: move ret_from_fork etc above
 __end_soft_masked
Date: Wed, 30 Jun 2021 17:46:21 +1000
Message-Id: <20210630074621.2109197-10-npiggin@gmail.com>
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

Code which runs with interrupts enabled should be moved above
__end_soft_masked where possible, because maskable interrupts that hit
below that symbol will need to consult the soft mask table, which is an
extra cost.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 52 +++++++++++++++---------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index c4336e2e2ce8..4063e8a3f704 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -449,32 +449,6 @@ _ASM_NOKPROBE_SYMBOL(tabort_syscall)
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
@@ -768,3 +742,29 @@ interrupt_return_macro hsrr
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

