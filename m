Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 419233B7A63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 00:22:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDzWM0ngXz3dVb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 08:22:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=n0g2jjdZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n0g2jjdZ; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDzSM3n3kz2yhF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 08:20:19 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id s14so623400pfg.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 15:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ttSgM1WjAPCRYvsrlu7lENde5WK16e+xYfj5Z3JpuDg=;
 b=n0g2jjdZAoCkJMoqd+u0S48VKiD05ArLDsaU/+GryjaNFxdbzDVS2jBtchJUH/CuZH
 VVRntBt7NKCaVHj3ql90/S1/GW25czHUGyZdp2LbVt30sjnjLvfgm5d14YeofOXtB42V
 niTaRJghNFereoG3VYzcRLKWzBlA9YFPyRPOBm/7bm2FqRx9FcGEZyGkilYuWc0gve7v
 DcFZDxgtK7aGCzgdmLxjyelhhlUvkewslYpGnEbRwpoPJXgwVqf6NXdYwTRaE0wy8BNK
 CUco0e8bZI8axSZ5+Q8lAKirzw0giIv7joN8YOE6BRFuJJUhE9RDeOswNd4E+so/ih9l
 2Ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ttSgM1WjAPCRYvsrlu7lENde5WK16e+xYfj5Z3JpuDg=;
 b=BAZagUyUHDupsZImeCYN0/UYonnPy2S8LqZYN0QUHWf84SPBEBkxrIFefU8aKcgjNJ
 qnCi1ByZ5VcDHF/2SDJxMO5RN2oQDNsHj0iMRzMdbCRF7HdT+eKrtTJXwvxyKpqK8ObV
 VM7UelN6loUszZqce7UlKJ6if5UYUJ2fI7dEzPOUCTi/HBHYc2PdoMEIaaWGA15bWqz/
 +bR+bHtMTbOEKQZquXXSIWsZ65S6RLTGdbFad+Jc+PjW/9Bar8U2512CPZS+Y5okFhXz
 L/R+WdHeMy2Ja6yauhGcq7JPCTGQDO2f+dAos2pfDBc6DE2WOx3lNCwUQL5U4b24v6aZ
 zy0A==
X-Gm-Message-State: AOAM533oK1MDcCkp9mQHPpSvKQZtV8LVnMGjurZ1BP7EVWOGDahazzTf
 jVpHJ0j/eB0Gd9/5bUt779G2X92WmpU=
X-Google-Smtp-Source: ABdhPJwRv83ZrKm0ut2Sy1Omo+gHDrKg5l4H6oNn9LYKlqnQkprffXaeXLRBC9zDo603TySQXvkiJg==
X-Received: by 2002:a63:5302:: with SMTP id h2mr20833929pgb.262.1625005217250; 
 Tue, 29 Jun 2021 15:20:17 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id l7sm19316583pgb.19.2021.06.29.15.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 15:20:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 6/9] powerpc/64: enable MSR[EE] in irq replay pt_regs
Date: Wed, 30 Jun 2021 08:19:54 +1000
Message-Id: <20210629221957.1947577-7-npiggin@gmail.com>
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

