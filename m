Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C5A5F3C65
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 07:13:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhQpn2GjVz3dsC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 16:13:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MlzrrgJF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MlzrrgJF;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhQmp1Tc8z2xh0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 16:12:09 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id i7-20020a17090a65c700b0020ad9666a86so823993pjs.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Oct 2022 22:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=95zd55Ltmubi7qTJF9yOnIfSuY/QQOCkfYYDc3Z8/Xs=;
        b=MlzrrgJFi/XhmBiaR15d5jtm9ClU9qa3rnunTnxO4dabfz5vmpZEDHN8hfGMLQFiZp
         3iRHb0ClMohZTqEvXE72uTkaush4MS0n5tcFyQRZRb9MywOBVT05QcGF4JFZyewLtYjL
         mckQBsf6uiabJGw2Vp+mh/XP7KLmb1i1WRxi5lfZaw+g8Y5ZBnnVKVXz610OUw0feWPI
         w0FK3F0edBRLf0LliwLE6CiP7uF7geWBlUto6HHHcx1xVg4Kgx3zWxZBCI5sKit910Vw
         seFiPVSbe2t5lV9taN8gc6dZao25sHgZ5S66m/wEONaShF2nAxaubOa/sl1w8axWm0WM
         OT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=95zd55Ltmubi7qTJF9yOnIfSuY/QQOCkfYYDc3Z8/Xs=;
        b=ThWy0pwNIVzpTSJfRL+/pzTF8so2zK2HAtL5TPoBvAFsU1hYXdRQsxEo36TBSdzrkT
         45mn4pQ8L3dIYtyJX3hO00I867iP2vJ2u5OKiKhYtMYdSb0/3NuIgCFERX9mpeglYJ0e
         cmC4JBX1OC2Z96fE9HzKGdKIuXzMN7Qs7nL6z6juNXQrYHegtHu3ra1on2jr53D9l/La
         H/4D2Pv7RRX94dhSVjm3EwiLBY2a0BYNzyItQxyWAzuq/yMmaNoLh56T3bqsRqEcwIbD
         k+Ojc2gayLVfbW7kiaIjBa/U4POuOuT+JYIYgM84hSzQ8fmag2S92SW1/YXtxrXMaulP
         UV4w==
X-Gm-Message-State: ACrzQf1exw1CAe0XZ44B7ZsLxc2N7Q956QdorWVK8+l2IansX4O3yC0Q
	PZOAhILxaladeboEpmxAB20ADsy2BnOrcg==
X-Google-Smtp-Source: AMsMyM557Vx3JjXbk2Qit6ELQeXpT9BeT12NZbsJKa7utibVj4brqZ3x7tXjY4RsOoR17xHwfCx4jw==
X-Received: by 2002:a17:903:11cc:b0:178:aec1:18c3 with SMTP id q12-20020a17090311cc00b00178aec118c3mr25669136plh.91.1664860326974;
        Mon, 03 Oct 2022 22:12:06 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (123-243-1-173.tpgi.com.au. [123.243.1.173])
        by smtp.gmail.com with ESMTPSA id e3-20020a17090301c300b001782f94f8ebsm8166534plh.3.2022.10.03.22.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 22:12:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64: Fix msr_check_and_set/clear MSR[EE] race
Date: Tue,  4 Oct 2022 15:11:57 +1000
Message-Id: <20221004051157.308999-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221004051157.308999-1-npiggin@gmail.com>
References: <20221004051157.308999-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

irq soft-masking means that when Linux irqs are disabled, the MSR[EE]
value can change from 1 to 0 asynchronously: if a masked interrupt of
the PACA_IRQ_MUST_HARD_MASK variety fires while irqs are disabled,
the masked handler will return with MSR[EE]=0.

This means a sequence like mtmsr(mfmsr() | MSR_FP) is racy if it can
be called with local irqs disabled, unless a hard_irq_disable has been
done.

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h | 24 ++++++++++++++++++++++++
 arch/powerpc/kernel/process.c     |  4 ++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 26ede09c521d..db139deb4466 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -459,6 +459,30 @@ static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, unsigned l
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
index 0fbda89cd1bb..37df0428e4fb 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -127,7 +127,7 @@ unsigned long notrace msr_check_and_set(unsigned long bits)
 		newmsr |= MSR_VSX;
 
 	if (oldmsr != newmsr)
-		mtmsr_isync(newmsr);
+		newmsr = mtmsr_isync_irqsafe(newmsr);
 
 	return newmsr;
 }
@@ -145,7 +145,7 @@ void notrace __msr_check_and_clear(unsigned long bits)
 		newmsr &= ~MSR_VSX;
 
 	if (oldmsr != newmsr)
-		mtmsr_isync(newmsr);
+		mtmsr_isync_irqsafe(newmsr);
 }
 EXPORT_SYMBOL(__msr_check_and_clear);
 
-- 
2.37.2

