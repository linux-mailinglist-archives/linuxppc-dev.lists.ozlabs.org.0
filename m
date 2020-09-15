Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0871A26A46A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 13:52:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrM5n1Q0ZzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 21:51:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VSfKAg4b; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrM0F34PrzDqKq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 21:47:09 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id z19so1770935pfn.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 04:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZhCp6L3XlZLXkfJVf2m77bSCdGj5gQScX4QSDH6zCw=;
 b=VSfKAg4bLs221QGTVWMS9ZjX5G3ekT6lomq1vCPknPoovi2VGTfbMSKU3B9eEx/deR
 bDiT2fHRg6o6u2NxlDdaMd0aqtQqXNch39v557cunQByly4AxbsSwnCYsrmF6JaKZew2
 NAvtUs1np7iKsdOx7WFBsO/iO4VTERnpqPUpaXcwFIf9bdA3sZ9S8SdVVRia3ZMizaIC
 S7qrEmA2bkYLN4I9R/+mMM1mu3Cg0E1qKmFcrY1peKP1X/5lmuVA20Pftzh5I3sseGtq
 iHu8ZoUQr1n89EqxYuEFGaljoHd3VdPq3eJVsJEMBXmuQgWW0WzsxL450xD8xh/Y4vyr
 +LyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZhCp6L3XlZLXkfJVf2m77bSCdGj5gQScX4QSDH6zCw=;
 b=O73SO8bO0/H/zo8GmFSSYzNIXU+oWyrv6p41xSFUhzBGwb5JlA6uJQRhIpNTYyvOGD
 wTqERn+niC/J4A18cGfwNOOUAdxY+s7kpW1sFRSxPoyjZphBid1pe253nZgQAjueMVpJ
 L/dqqqr0tsWbXGhPkxBxlcpsMIujVvrbqJARzOL9Wge0BRY7xhpyqVKbp5A8kakqN4Q7
 liY1svwoVXs+jyLuYHXJ/zAE8Uon9Y/ljTqZvuBvygwZwnO6cc37IBzcXdh7R7hcVXyg
 B/AEct+G8dX/LVio2K6LwfE4bLXYXuKLtTcBc0JEV3Buh9V/ngaMEB/pA9GUkS04tM6b
 Osvw==
X-Gm-Message-State: AOAM5312LLaYA1WTkoaVKG1N7CG0rMlQ2BRHrtzKI17/WzLXGDCbX/+m
 hRsJ/wyNQ3zhyokt9Hvs2G8Kdf1phWlaSw==
X-Google-Smtp-Source: ABdhPJyZjS2jhAHXI+wzdH9KFTjpThjppn+BWuFjV/1diuM98E/dGSfcGs20RwFxD+UvcoAl8rJUbQ==
X-Received: by 2002:a63:f606:: with SMTP id m6mr14453565pgh.193.1600170426352; 
 Tue, 15 Sep 2020 04:47:06 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id u2sm12118077pji.50.2020.09.15.04.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 04:47:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc/64e: remove PACA_IRQ_EE_EDGE
Date: Tue, 15 Sep 2020 21:46:47 +1000
Message-Id: <20200915114650.3980244-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200915114650.3980244-1-npiggin@gmail.com>
References: <20200915114650.3980244-1-npiggin@gmail.com>
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

This is not used anywhere.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h    |  5 ++---
 arch/powerpc/kernel/exceptions-64e.S |  1 -
 arch/powerpc/kernel/irq.c            | 23 -----------------------
 3 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 35060be09073..50dc35711db3 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -25,9 +25,8 @@
 #define PACA_IRQ_DBELL		0x02
 #define PACA_IRQ_EE		0x04
 #define PACA_IRQ_DEC		0x08 /* Or FIT */
-#define PACA_IRQ_EE_EDGE	0x10 /* BookE only */
-#define PACA_IRQ_HMI		0x20
-#define PACA_IRQ_PMI		0x40
+#define PACA_IRQ_HMI		0x10
+#define PACA_IRQ_PMI		0x20
 
 /*
  * Some soft-masked interrupts must be hard masked until they are replayed
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index d9ed79415100..ca444ca82b8d 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -988,7 +988,6 @@ kernel_dbg_exc:
 .endm
 
 masked_interrupt_book3e_0x500:
-	// XXX When adding support for EPR, use PACA_IRQ_EE_EDGE
 	masked_interrupt_book3e PACA_IRQ_EE 1
 
 masked_interrupt_book3e_0x900:
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 3fdad9336885..736a6b56e7d6 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -181,16 +181,6 @@ notrace unsigned int __check_irq_replay(void)
 		return 0x500;
 	}
 
-	/*
-	 * Check if an EPR external interrupt happened this bit is typically
-	 * set if we need to handle another "edge" interrupt from within the
-	 * MPIC "EPR" handler.
-	 */
-	if (happened & PACA_IRQ_EE_EDGE) {
-		local_paca->irq_happened &= ~PACA_IRQ_EE_EDGE;
-		return 0x500;
-	}
-
 	if (happened & PACA_IRQ_DBELL) {
 		local_paca->irq_happened &= ~PACA_IRQ_DBELL;
 		return 0x280;
@@ -270,19 +260,6 @@ void replay_soft_interrupts(void)
 			hard_irq_disable();
 	}
 
-	/*
-	 * Check if an EPR external interrupt happened this bit is typically
-	 * set if we need to handle another "edge" interrupt from within the
-	 * MPIC "EPR" handler.
-	 */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3E) && (happened & PACA_IRQ_EE_EDGE)) {
-		local_paca->irq_happened &= ~PACA_IRQ_EE_EDGE;
-		regs.trap = 0x500;
-		do_IRQ(&regs);
-		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
-			hard_irq_disable();
-	}
-
 	if (IS_ENABLED(CONFIG_PPC_DOORBELL) && (happened & PACA_IRQ_DBELL)) {
 		local_paca->irq_happened &= ~PACA_IRQ_DBELL;
 		if (IS_ENABLED(CONFIG_PPC_BOOK3E))
-- 
2.23.0

