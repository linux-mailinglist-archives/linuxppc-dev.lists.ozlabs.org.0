Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE1D5FEFEB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 16:12:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MppHS41Xjz3fFJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:12:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uPWSauTB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uPWSauTB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mpnsr2SDjz3drm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 00:53:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C45861B50;
	Fri, 14 Oct 2022 13:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F175C433D7;
	Fri, 14 Oct 2022 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665755612;
	bh=QzVQ5KDjI+IMFE8wg7PRUrF9EBCM+D3IFWiBvOCBncw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uPWSauTBG2yiwa5+ghhh8K06k2XUKRYGVPYnsLr5aDhdcCPza4xHr9FsnkdtWHsT9
	 vjkW01Qx/XYoD5HJkaGU52hF4nJ1hJanifuymkTfgQA1iJ8xkhfnFjzE0VgtdQTgXR
	 TEV/LASaEpot8r4+Os2/x/40g8S+O+KdcMGCi6SH3FUI3DLcAugLHishP7NCGg8OZw
	 CdwU3KAphKlWJw1tvQXtuORh5MkEdcp2Ase+6GGDCqkxyk08FWPOTa7mTOhiAKIhsr
	 0kYGERyox7F5PsI26Ys6Q5qbi/0EFzg3uzkrhr5YNiul7dsIAoQVny6m5xyWtJYZ7H
	 +4a27+W0UV24g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 8/8] powerpc/64: Fix msr_check_and_set/clear MSR[EE] race
Date: Fri, 14 Oct 2022 09:53:01 -0400
Message-Id: <20221014135302.2109489-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221014135302.2109489-1-sashal@kernel.org>
References: <20221014135302.2109489-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, atrajeev@linux.vnet.ibm.com, keescook@chromium.org, Nicholas Piggin <npiggin@gmail.com>, Sachin Sant <sachinp@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 0fa6831811f62cfc10415d731bcf9fde2647ad81 ]

irq soft-masking means that when Linux irqs are disabled, the MSR[EE]
value can change from 1 to 0 asynchronously: if a masked interrupt of
the PACA_IRQ_MUST_HARD_MASK variety fires while irqs are disabled,
the masked handler will return with MSR[EE]=0.

This means a sequence like mtmsr(mfmsr() | MSR_FP) is racy if it can
be called with local irqs disabled, unless a hard_irq_disable has been
done.

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20221004051157.308999-2-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/hw_irq.h | 24 ++++++++++++++++++++++++
 arch/powerpc/kernel/process.c     |  4 ++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 5c98a950eca0..8003f094e00b 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -453,6 +453,30 @@ static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, unsigned l
 }
 #endif /* CONFIG_PPC64 */
 
+static inline unsigned long mtmsr_isync_irqsafe(unsigned long msr)
+{
+#ifdef CONFIG_PPC64
+	if (arch_irqs_disabled()) {
+		/*
+		 * With soft-masking, MSR[EE] can change from 1 to 0
+		 * asynchronously when irqs are disabled, and we don't want to
+		 * set MSR[EE] back to 1 here if that has happened. A race-free
+		 * way to do this is ensure EE is already 0. Another way it
+		 * could be done is with a RESTART_TABLE handler, but that's
+		 * probably overkill here.
+		 */
+		msr &= ~MSR_EE;
+		mtmsr_isync(msr);
+		irq_soft_mask_set(IRQS_ALL_DISABLED);
+		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+	} else
+#endif
+		mtmsr_isync(msr);
+
+	return msr;
+}
+
+
 #define ARCH_IRQ_INIT_FLAGS	IRQ_NOREQUEST
 
 #endif  /* __ASSEMBLY__ */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index c590e1219913..8a45f17da0bc 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -130,7 +130,7 @@ unsigned long notrace msr_check_and_set(unsigned long bits)
 		newmsr |= MSR_VSX;
 
 	if (oldmsr != newmsr)
-		mtmsr_isync(newmsr);
+		newmsr = mtmsr_isync_irqsafe(newmsr);
 
 	return newmsr;
 }
@@ -148,7 +148,7 @@ void notrace __msr_check_and_clear(unsigned long bits)
 		newmsr &= ~MSR_VSX;
 
 	if (oldmsr != newmsr)
-		mtmsr_isync(newmsr);
+		mtmsr_isync_irqsafe(newmsr);
 }
 EXPORT_SYMBOL(__msr_check_and_clear);
 
-- 
2.35.1

