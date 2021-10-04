Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8E242122B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 17:00:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNP5W6mDdz3cGq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 01:59:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PX6bTdAM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PX6bTdAM; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNP226DJ8z2yQL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:56:58 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 66so16370790pgc.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kLVl9JYGgZc2fpxw+pb+YlHggQXwIROppZlECMAzg14=;
 b=PX6bTdAMP+TaWzEIJvQ3SLeig6tRKDDXjjqLfWrlR7PIku+HLdgxl4Rht9/MD20lOj
 W5FoX8TjYCXi4nuWy9GMOz/LDHc7vv7d/ObW46n/0rkhewPI+fnM7UeevTL6wXegbzgI
 5aZNSr1hTPTuCty6iOUWEJUE+rxv+r2YSwuL58QgqjgQ1u9w5PwApYU0kQmFPmIVE9RB
 VVeQOdmIOgnahGtZ2o20aGcGr+K/N/5x76VbT0FtE2hs9/lyIlLSkNwOyHI5R0VuZucC
 T76YVivrcUBix/Z1yy4ZuH361z5ANgoB0d9Zet6ibqNEJwydbzbWS6N7GzUNlVkjBz+h
 LBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kLVl9JYGgZc2fpxw+pb+YlHggQXwIROppZlECMAzg14=;
 b=OOsxpA/xg6FIZKTLEo3zTLgM0kcKbtAKoHoumfHU46THEisDsWeLS/50iSzMQHyORK
 yxaujwZDj7Dzo4tYdLZL6A5Y2yTKmkgJxJ5Xl3jYaMpFdznv2OtGtZ+1jNy4Oq8Y3RgH
 gxGkFc2mmatF9l7Bd7YXIxkunxgogs/7FcjWZI6ITbjlfeH5enpqTP0vw1U8Eqmn/Jw1
 c3cBrUj+dy46rkB8TzZPvtXywSosz6fqeqSbquYoaiYd0UdZ0QfreqcyC1lFJfpI8szu
 enPFLyl/qoaTM4PKXONwju3YlVN2xdrpjsyGlS+HWf3nfB7z/Ey7XtJ+9wDEZif8pNss
 NBTA==
X-Gm-Message-State: AOAM530kO2JdFbrvpJmVo6fVey3HAOnp0z43L71j4I/EXVeELAuILXOR
 EdAZCgnsl5xCNO7JDbnFJrAij/RmX/c=
X-Google-Smtp-Source: ABdhPJw1Ou3hQq0bqTd2VqCMaX8p1O6YTyAJ9lIuelAhoSfbMaiM78eQ5nk4y9wcan9RIw471I5mfg==
X-Received: by 2002:a63:101c:: with SMTP id f28mr11150320pgl.330.1633359416539; 
 Mon, 04 Oct 2021 07:56:56 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id f16sm13194903pjj.56.2021.10.04.07.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:56:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] powerpc/64/interrupt: Reconcile soft-mask state in NMI
 and fix false BUG
Date: Tue,  5 Oct 2021 00:56:41 +1000
Message-Id: <20211004145642.1331214-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004145642.1331214-1-npiggin@gmail.com>
References: <20211004145642.1331214-1-npiggin@gmail.com>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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

This doesn't fix a known problem -- the change that was fixed by commit
4ec5feec1ad02 ("powerpc/64s: Make NMI record implicitly soft-masked code
as irqs disabled") was the addition of a warning in the soft-nmi
watchdog interrupt which can never actually fire when MSR[EE]=0. However
it may be important if NMI handlers grow more code, and it's less
surprising to anything using 'regs' - (I tripped over this when working
in the area).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 6b800d3e2681..b894b7169706 100644
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

