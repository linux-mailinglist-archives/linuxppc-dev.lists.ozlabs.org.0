Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 079933095BA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:11:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbj0596jzDrhp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:11:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=URD+Eu35; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZLw2bxRzDrVM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:15 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d13so7103440plg.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNXdIqSPUFJoj1GW+LkqYtOXe94Ojd3Zmca3aTZcCBE=;
 b=URD+Eu35gRCZ7TDGMeK9oB4kBp02bTq7Ts4nQ9alZ/mkcgNLlNHOPEeRcikdbSiBgd
 VNdzXqg18Txq95psq98quVkdHyUBh1eX4NaQWxzUYqGuETt7oks46lfw5D9JwEpt24d1
 wGHB7M03KohOvS1ZTYaTnV6d7H9mraL9tRS0wWuVYGBUBV0nwMcks5CZIYxDQIcigE26
 NXsscYiIlbZ6MoPK7gwk+8LAShqIkgs69qr7XcLjs5v3QTEUjEuOAxEMDFqjy2AwwLzR
 XL/X6uIAcJM5gQBJymzzCFrqp7JKwIsV33dQfsyEE1kj2dzDoD/FToVd9p3GFYq3jCKk
 LcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNXdIqSPUFJoj1GW+LkqYtOXe94Ojd3Zmca3aTZcCBE=;
 b=moRfPstjgfcJVhXpVe4zV9OyBBvJRiKo4+g6REY0hua1zvXOQfon0cdl1xt/c7pSWV
 YgdVHQqletNhaoffm1yZ3r6+lm40bZmvjLslF0rPXY+jge4Xh/2upHcMxE7p6MVevQrf
 XHDzrn515RmkG/uzx7waKhMWXDmbwxby4tU/wVQXb0A6u3DMHcUNljCDhHnfybM2yADP
 t/beICvytENZXIgonhmn5l+1eq4At0EjxKT5a1dJm+V8JGcYrT6aVPSazFGsY3YzDog7
 wLr4BnP9BuHai6mbrr1FHLo6yaWfGRaVJf5Qp+0w3UqO9peor6PGEKkCHMbe9jOUH44K
 fUfw==
X-Gm-Message-State: AOAM533wqHrkQMg0OFWCUzSfZHh9G0uv2FZwMwi2C7BLBOBFErTy9g8Y
 I4fM4htJx7cu/b2bKilfNsLJftoBbjg=
X-Google-Smtp-Source: ABdhPJxBMDZ2Q7G595SGVZJwA0RBQsw309GGPC/GdxjRUuRji/xL7nB59Szah3wknycppQNBegUxdw==
X-Received: by 2002:a17:902:eb12:b029:df:f561:c06b with SMTP id
 l18-20020a170902eb12b02900dff561c06bmr9633620plb.39.1612012213328; 
 Sat, 30 Jan 2021 05:10:13 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 21/42] powerpc: add and use unknown_async_exception
Date: Sat, 30 Jan 2021 23:08:31 +1000
Message-Id: <20210130130852.2952424-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is currently the same as unknown_exception, but it will diverge
after interrupt wrappers are added and code moved out of asm into the
wrappers (e.g., async handlers will check FINISH_NAP).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h    |  1 +
 arch/powerpc/kernel/exceptions-64s.S |  4 ++--
 arch/powerpc/kernel/head_book3s_32.S |  6 +++---
 arch/powerpc/kernel/traps.c          | 12 ++++++++++++
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index e5def36212cf..75c2b137fc00 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -57,6 +57,7 @@ extern void timer_interrupt(struct pt_regs *);
 extern void performance_monitor_exception(struct pt_regs *regs);
 extern void WatchdogException(struct pt_regs *regs);
 extern void unknown_exception(struct pt_regs *regs);
+void unknown_async_exception(struct pt_regs *regs);
 
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e69a912c2cc6..fe33197ea8fb 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1926,7 +1926,7 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
 #else
-	bl	unknown_exception
+	bl	unknown_async_exception
 #endif
 	b	interrupt_return
 
@@ -2312,7 +2312,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
 #else
-	bl	unknown_exception
+	bl	unknown_async_exception
 #endif
 	b	interrupt_return
 
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 1f808e1aa051..6e1eed66cdcc 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -238,8 +238,8 @@ __secondary_hold_acknowledge:
 
 /* System reset */
 /* core99 pmac starts the seconary here by changing the vector, and
-   putting it back to what it was (unknown_exception) when done.  */
-	EXCEPTION(0x100, Reset, unknown_exception, EXC_XFER_STD)
+   putting it back to what it was (unknown_async_exception) when done.  */
+	EXCEPTION(0x100, Reset, unknown_async_exception, EXC_XFER_STD)
 
 /* Machine check */
 /*
@@ -640,7 +640,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
 #endif
 
 #ifndef CONFIG_TAU_INT
-#define TAUException	unknown_exception
+#define TAUException	unknown_async_exception
 #endif
 
 	EXCEPTION(0x1300, Trap_13, instruction_breakpoint_exception, EXC_XFER_STD)
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 6da3a3642dfb..6691774fe1fb 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1073,6 +1073,18 @@ void unknown_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
+void unknown_async_exception(struct pt_regs *regs)
+{
+	enum ctx_state prev_state = exception_enter();
+
+	printk("Bad trap at PC: %lx, SR: %lx, vector=%lx\n",
+	       regs->nip, regs->msr, regs->trap);
+
+	_exception(SIGTRAP, regs, TRAP_UNK, 0);
+
+	exception_exit(prev_state);
+}
+
 void instruction_breakpoint_exception(struct pt_regs *regs)
 {
 	enum ctx_state prev_state = exception_enter();
-- 
2.23.0

