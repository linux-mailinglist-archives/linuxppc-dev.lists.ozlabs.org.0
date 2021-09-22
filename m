Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD40414C72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF1SK6kRKz308C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 00:50:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D6ym+NLQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=D6ym+NLQ; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF1Rc4XDrz2yP3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 00:50:03 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 nn5-20020a17090b38c500b0019af1c4b31fso2486169pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/YujYRJMOJBacdkRVc3iHNwX/GUEPkOf6P3YJogb9hk=;
 b=D6ym+NLQn7vc76ZO6JD7EeKaNm+AGrUQysirr/tkfSA9w7uTtXaMNTNgZG90EsDvb/
 XRuRvagVq60kww70QkJ+2JrB+CH5iw598U2fe/waxWK3NbrCNtWWZJ81Bbw1sSsHcrv4
 UwGhwEJe7O96jRXMOb8Yepp36w/6RgsXQuBBUUfNp5f06IZh7a2g9wXIgyiiNH+NToKr
 0NZ10T8TsxMbUGL32y5oUHwX4mtpYb8ZpiBkVOmJl/Z3eJh6ceQ8PiEl6ZBlxJtnK9+G
 hEX42VJNfuBGQxjnUH3hfjkLBFBfOng3rvDvAf9SsVTpqL5UsuzxJSctAfCtG5oEqtQ4
 ocEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/YujYRJMOJBacdkRVc3iHNwX/GUEPkOf6P3YJogb9hk=;
 b=HAnSqRAJ7neVrIqOSnrHomv+fGQuuX9s/V+QPaAx9bmHhPu8pGWjUd8Vaazyi8ipFy
 68E8Dz2xocfzUpXlnqlog4kNzvWKSmTE+5WBTGS4XutZPPEioE5qwkDO8BrLVe7iOsqd
 SWe/MAdaiU2/cgf0XVI/zz045O/UERirTTOR8rgAkMS90YC5DgLe4l9iJpC0Ggc8PMv+
 xwO6Do5Ayt7lLx4BnJrJrCrStg1pu6Q1SJDovAiDI/AYZ+a9sKV3oINnfNc4cR2b1+KM
 mAClge+09Xu6uRUv2eRFPAU2dZSDLHQKSnae7LPb8b8cKR091jdxbF9A1AFyZpUKzUqX
 Ka/g==
X-Gm-Message-State: AOAM5330gPTdr7FXp/Zz8BIE2ED1ErRhzX6K6woEG/SaPJ7Ii/BfikVO
 w/0jexNXH+PhVgwG09YDB8YB1+q/iF0=
X-Google-Smtp-Source: ABdhPJyn16LGo9KcQG1C/W0tRN0edXuCQagtTHdabSXkBYAwpnyb395efUTVXrFnOH9S+wk1adVv4w==
X-Received: by 2002:a17:90a:af86:: with SMTP id
 w6mr11937961pjq.8.1632322199782; 
 Wed, 22 Sep 2021 07:49:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id b13sm2245845pfp.82.2021.09.22.07.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:49:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1] powerpc/64/interrupt: Reconcile soft-mask state in NMI and
 fix false BUG
Date: Thu, 23 Sep 2021 00:49:53 +1000
Message-Id: <20210922144953.352067-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a NMI hits early in an interrupt handler before the irq soft-mask
state is reconciled, that can cause a false-positive BUG with a
CONFIG_PPC_IRQ_SOFT_MASK_DEBUG assertion.

Remove that assertion and instead check the case that if regs->msr has
EE clear, then regs->softe should be marked as disabled so the irq state
looks correct to NMI handlers, the same as how it's fixed up in the
case it was implicit soft-masked.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index b32ed910a8cf..b76ab848aa0d 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -265,13 +265,16 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	local_paca->irq_soft_mask = IRQS_ALL_DISABLED;
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 
-	if (is_implicit_soft_masked(regs)) {
-		// Adjust regs->softe soft implicit soft-mask, so
-		// arch_irq_disabled_regs(regs) behaves as expected.
+	if (!(regs->msr & MSR_EE) || is_implicit_soft_masked(regs)) {
+		/*
+		 * Adjust regs->softe to be soft-masked if it had not been
+		 * reconcied (e.g., interrupt entry with MSR[EE]=0 but softe
+		 * not yet set disabled), or if it was in an implicit soft
+		 * masked state. This makes arch_irq_disabled_regs(regs)
+		 * behave as expected.
+		 */
 		regs->softe = IRQS_ALL_DISABLED;
 	}
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-		BUG_ON(!arch_irq_disabled_regs(regs) && !(regs->msr & MSR_EE));
 
 	/* Don't do any per-CPU operations until interrupt state is fixed */
 
-- 
2.23.0

