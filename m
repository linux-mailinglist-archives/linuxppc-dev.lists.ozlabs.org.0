Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A25893AB807
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:57:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RXj1yFxz3fCl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:57:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qyzhOn95;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qyzhOn95; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPp4x84z3c5G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:51:58 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso4087957pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XokBTMplXb7v2Q3Ebet2A6oMZv4fvI8m8A6UWHKrdYI=;
 b=qyzhOn95r4b0dWIykPo+24Df9e5GToQrM+ZOVBqd5fIxjd6PG9AFoS4yXVx8F4Mjxo
 6/U07EleHlp1k1wIcB4NzkfzD7fl3SfRMltiS7Qs0yTB/FUtVX+aJx4zClG4mNv5M8Xs
 Ez3EVX5WP0hV9gfaxvjeZ5uMt13dZDnKZjUF8sro9shsnoeu1Ssv/aI3ptlqseaVipNd
 0bj8eM0ouLbriavbbsrR4WwEHYF9OeVypyfoqksWaFsRxrHmgwQSzTDO11hWwS5luWJl
 c4mI/7QRzA/I1aNoWCe7FPvqB8gqFtxTGwAdOUOQ0wJLDkheqKa8tN9eNyH3wjGSuHx8
 UOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XokBTMplXb7v2Q3Ebet2A6oMZv4fvI8m8A6UWHKrdYI=;
 b=UfGeO75Ns5emFMWSN+ZsjJ4inhyH81LSZGdZUj1gllcCOBJE6rsZdfCcdEeuNdR+c+
 DNVzhNj0CvOM6+63d6G38Q+otu1iUC4qB5Hyjv2qVvvD7ao0Y/6/CcGfjJevVx5XhddS
 xNlLvcIT3BhP0SRDppedFziMKWFvEnhvJYdfIqosA2u05j7nf2CX51BjjfpUPFk3lhbY
 OhvtAhFZ+3jHbeWIHkOpy5xJZ9512cAj0TjuQq2S5FIw3fTA69RyPdPRyBeOEt1t8L98
 4+8uz71SevABCAB7qUMRmT56YLcq67JmDqKQ3cELniNS7bHKKJwn8wrJhAMRUxKA/O4h
 sXDw==
X-Gm-Message-State: AOAM532mD5TENZkGqEq2iK6M7O34dpp88HuyQ4mQC9eD35skPFke2lqy
 p67y3Weatuo76KolvfzdmJjKFRGuVGs=
X-Google-Smtp-Source: ABdhPJw0XXCY6x8SXr6JPeeTfig502/ZHbGMLUc5aBws0jMcoGDrm+oK7EQY4J9gj3GAOrXBWyiRqA==
X-Received: by 2002:a17:90a:fb4e:: with SMTP id
 iq14mr6069227pjb.219.1623945115514; 
 Thu, 17 Jun 2021 08:51:55 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:51:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 14/17] powerpc/interrupt: Refactor
 interrupt_exit_user_prepare()
Date: Fri, 18 Jun 2021 01:51:13 +1000
Message-Id: <20210617155116.2167984-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617155116.2167984-1-npiggin@gmail.com>
References: <20210617155116.2167984-1-npiggin@gmail.com>
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

interrupt_exit_user_prepare() is a superset of
interrupt_exit_user_prepare_main().

Refactor to avoid code duplication.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 57 ++-------------------------------
 1 file changed, 3 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 5bfdf8f9b130..e946084d4906 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -404,9 +404,7 @@ notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *reg
 
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 {
-	unsigned long ti_flags;
-	unsigned long flags;
-	unsigned long ret = 0;
+	unsigned long ret;
 
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
 		BUG_ON(!(regs->msr & MSR_RI));
@@ -420,63 +418,14 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 	 */
 	kuap_assert_locked();
 
-	local_irq_save(flags);
-
-again:
-	ti_flags = READ_ONCE(current_thread_info()->flags);
-	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
-		local_irq_enable(); /* returning to user: may enable */
-		if (ti_flags & _TIF_NEED_RESCHED) {
-			schedule();
-		} else {
-			if (ti_flags & _TIF_SIGPENDING)
-				ret |= _TIF_RESTOREALL;
-			do_notify_resume(regs, ti_flags);
-		}
-		local_irq_disable();
-		ti_flags = READ_ONCE(current_thread_info()->flags);
-	}
-
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
-		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
-				unlikely((ti_flags & _TIF_RESTORE_TM))) {
-			restore_tm_state(regs);
-		} else {
-			unsigned long mathflags = MSR_FP;
-
-			if (cpu_has_feature(CPU_FTR_VSX))
-				mathflags |= MSR_VEC | MSR_VSX;
-			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
-				mathflags |= MSR_VEC;
-
-			/* See above restore_math comment */
-			if ((regs->msr & mathflags) != mathflags)
-				restore_math(regs);
-		}
-	}
-
-	if (!prep_irq_for_user_exit()) {
-		local_irq_enable();
-		local_irq_disable();
-		goto again;
-	}
-
-	booke_load_dbcr0();
-
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	local_paca->tm_scratch = regs->msr;
-#endif
+	local_irq_disable();
 
-	account_cpu_user_exit();
+	ret = interrupt_exit_user_prepare_main(0, regs);
 
 #ifdef CONFIG_PPC64
 	regs->exit_result = ret;
 #endif
 
-	/* Restore user access locks last */
-	kuap_user_restore(regs);
-	kuep_unlock();
-
 	return ret;
 }
 
-- 
2.23.0

