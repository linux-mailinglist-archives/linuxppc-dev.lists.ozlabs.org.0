Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C043B5A14
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 09:52:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD0F426Qhz3bdT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 17:52:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=q4dT7k6d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q4dT7k6d; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD0BT0351z30L3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 17:49:52 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id h1so8458284plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ttSgM1WjAPCRYvsrlu7lENde5WK16e+xYfj5Z3JpuDg=;
 b=q4dT7k6d6nHQkPwym4p6h+d+h5UYySP3L4kcaFvQ8bWyJedVqOWGDIPXpKhp6aOToE
 0kkDEOWq2N9r1Q25z6TbvaAx4Hw6I9SA4nMoap9HDXqu8aoutXuqIJLn0yEKPd8DVPLt
 EV3C1Dkiol68QgOv12EqeNG4xa85bgUTRF9mN/sR48+As+xkDo+ZcRdzYOY8mRwHRQik
 2M33LH/RYOiwk4IxnU+2dnI/gu5HIgETOuqayoHw4ius1b/ltGQwtMnf7Vh60M/SNoZZ
 UyK4eQB7ZaRluGkr8TRDmPGQzpqAMyjINMg/15aHdCiIDkoM41egBaLJYrcjD7Uv84YL
 fstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ttSgM1WjAPCRYvsrlu7lENde5WK16e+xYfj5Z3JpuDg=;
 b=g0f0CboclC6vLxFvMSe2OqOlXurzXvvEBDk77gZNH6T1uO4lqPZRs560MI/flbxGtS
 iSMksiUajmcg52fFeB8mKZclaio/w5ME4O0PvjQKxSzU/tkxgNjSnu0o/Jsek16O7fto
 IL4UGTC3AAAeyCTDApIDGY7chLBGg/yP2DdO/c07n2KHYfga5cLe0FLQkUnEA1DSMMhU
 W6NKKio4rscMPB3yHAA2ZpV0lqllzdvheJwhlxk84zmFphWUaO0pxHLEh0vxLbc7DxT5
 sd2AJHy01Nn2Qk/BMrgGBlDgsC+Uow+4Cb7Tv4os4LONfYSuFojwbcmZRg14jhqk8ehp
 9KSA==
X-Gm-Message-State: AOAM5315ZOBfW29HNbwhpauv1QMjMeO67DxMARMpb/8aOAd/Hqu1Z0Lw
 z2uBppiLdba6vxzCuBtYvh+lbHjvr0w=
X-Google-Smtp-Source: ABdhPJwO1Rkvg8q2gkqMsfS41nLodX6IqrxEWwhQCe+LywEHQ58P2LjnNYT/k4Rkn50rhEqJKsHEwQ==
X-Received: by 2002:a17:90a:cb0d:: with SMTP id
 z13mr26878695pjt.194.1624866590494; 
 Mon, 28 Jun 2021 00:49:50 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id b22sm5264962pfp.20.2021.06.28.00.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 00:49:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/8] powerpc/64: enable MSR[EE] in irq replay pt_regs
Date: Mon, 28 Jun 2021 17:49:29 +1000
Message-Id: <20210628074932.1499554-6-npiggin@gmail.com>
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

Similar to 2b48e96be2f9f ("powerpc/64: fix irq replay pt_regs->softe
value"), enable MSR_EE in pt_regs->msr, which makes the regs look a
bit more normal and allows the extra debug checks to be added to
interrupt handler entry.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 4 ++++
 arch/powerpc/kernel/irq.c            | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 789311d1e283..d4bdf7d274ac 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -173,6 +173,8 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 			BUG_ON(search_kernel_restart_table(regs->nip));
 #endif
 	}
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		BUG_ON(!arch_irq_disabled_regs(regs) && !(regs->msr & MSR_EE));
 #endif
 
 	booke_restore_dbcr0();
@@ -268,6 +270,8 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 		// arch_irq_disabled_regs(regs) behaves as expected.
 		regs->softe = IRQS_ALL_DISABLED;
 	}
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		BUG_ON(!arch_irq_disabled_regs(regs) && !(regs->msr & MSR_EE));
 
 	/* Don't do any per-CPU operations until interrupt state is fixed */
 
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 8428caf3194e..91e63eac4e8f 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -121,6 +121,7 @@ void replay_soft_interrupts(void)
 
 	ppc_save_regs(&regs);
 	regs.softe = IRQS_ENABLED;
+	regs.msr |= MSR_EE;
 
 again:
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-- 
2.23.0

