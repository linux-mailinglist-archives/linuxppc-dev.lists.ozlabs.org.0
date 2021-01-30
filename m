Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F074E3095DD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:23:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbyn6RwqzDr3p
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:22:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dQ+U7Fl9; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZMH1ZhbzDrTL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:35 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id y142so32711pfb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OI5vWELthZ9WXPr1HFCu3M+yjOLGxtP9BbdLHtksKPg=;
 b=dQ+U7Fl9Fi3j6/2ZRFi0t9YyqV78rfn40XIr0NPsCTXWA4CJYJg+4B8kW0afuwItwX
 aARHtCQekyKMl/7ZRr0laCsFAHJIvrQ78fRa3RbujmTj9GYgcEKa8QG39KAcqLC4cc04
 geiV6XI2hO+m5wSqvbqJJTzN314pNX5Di1U8QfEEfBcSs3W//fEwFlR956nYMZdt2Jmz
 i6r9P4DPcHXghYknTmwRIogtBME2CTlR/5Ce1xFxmTKbrBzvh29rpbSmSDdSNwoMz1L6
 NU1i0rlSvNwsIW9vZEGyL2NN6S2BWU/7FgCgHm+Z76L2ZsolLu2OCZLoW6zqgaE1Eezy
 dVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OI5vWELthZ9WXPr1HFCu3M+yjOLGxtP9BbdLHtksKPg=;
 b=UvlAjf0UIhtV5E7+BIjkcYesIi4D/JLPh02iLSVT++SYZbKIoTnOHkyNJCT/BrTz1w
 15HrkFE5xA+/4Rt+CCT7cYlAk4Ie8aKKmE0wiX2asoJtcuM+dmmoMflD2hSd0r9vnkUH
 HUZHat1jzAWJO6DEhaPaeU3bY42f9qJM5FQmcbgoVrjR6sPkYl2Dfk/0qt76UeJuhkPO
 52TU+nbjOC1C6iEDTNVuiTx+tFfyDWqD3w1Bkzy//IQO/tiXd3ectl0peHg12+jOfSub
 FL4OZfiS62ugwgqr6b46JtCMw65KBqQQAJCaXM9mYnnqnOh92YnXWT8SreS0AnzOEbr1
 xvig==
X-Gm-Message-State: AOAM532BQtYupbMZQTANnLh2FruSiUn47GoV82ZheTuiy831tRhbo9qK
 ERc+u5snuVW4Pxf0niMJlSZf6aypDX8=
X-Google-Smtp-Source: ABdhPJxLT4UwplDwK8on7EXtFt1YXnK1h4zWE9fREBna/Z9pqsVSY+nPUQ3IYr92M5IS9p+b/ZWv0A==
X-Received: by 2002:a63:3c7:: with SMTP id 190mr8748446pgd.207.1612012231539; 
 Sat, 30 Jan 2021 05:10:31 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:31 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 27/42] powerpc: add interrupt wrapper entry / exit stub
 functions
Date: Sat, 30 Jan 2021 23:08:37 +1000
Message-Id: <20210130130852.2952424-28-npiggin@gmail.com>
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

These will be used by subsequent patches.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 66 ++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 5e2526aacc52..3df1921cfda3 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -5,6 +5,50 @@
 #include <linux/context_tracking.h>
 #include <asm/ftrace.h>
 
+struct interrupt_state {
+};
+
+static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
+{
+}
+
+/*
+ * Care should be taken to note that interrupt_exit_prepare and
+ * interrupt_async_exit_prepare do not necessarily return immediately to
+ * regs context (e.g., if regs is usermode, we don't necessarily return to
+ * user mode). Other interrupts might be taken between here and return,
+ * context switch / preemption may occur in the exit path after this, or a
+ * signal may be delivered, etc.
+ *
+ * The real interrupt exit code is platform specific, e.g.,
+ * interrupt_exit_user_prepare / interrupt_exit_kernel_prepare for 64s.
+ *
+ * However interrupt_nmi_exit_prepare does return directly to regs, because
+ * NMIs do not do "exit work" or replay soft-masked interrupts.
+ */
+static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
+{
+}
+
+static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
+{
+}
+
+static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
+{
+}
+
+struct interrupt_nmi_state {
+};
+
+static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
+{
+}
+
+static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
+{
+}
+
 /**
  * DECLARE_INTERRUPT_HANDLER_RAW - Declare raw interrupt handler function
  * @func:	Function name of the entry point
@@ -71,7 +115,13 @@ static __always_inline void ____##func(struct pt_regs *regs);		\
 									\
 __visible noinstr void func(struct pt_regs *regs)			\
 {									\
+	struct interrupt_state state;					\
+									\
+	interrupt_enter_prepare(regs, &state);				\
+									\
 	____##func (regs);						\
+									\
+	interrupt_exit_prepare(regs, &state);				\
 }									\
 									\
 static __always_inline void ____##func(struct pt_regs *regs)
@@ -99,10 +149,15 @@ static __always_inline long ____##func(struct pt_regs *regs);		\
 									\
 __visible noinstr long func(struct pt_regs *regs)			\
 {									\
+	struct interrupt_state state;					\
 	long ret;							\
 									\
+	interrupt_enter_prepare(regs, &state);				\
+									\
 	ret = ____##func (regs);					\
 									\
+	interrupt_exit_prepare(regs, &state);				\
+									\
 	return ret;							\
 }									\
 									\
@@ -129,7 +184,13 @@ static __always_inline void ____##func(struct pt_regs *regs);		\
 									\
 __visible noinstr void func(struct pt_regs *regs)			\
 {									\
+	struct interrupt_state state;					\
+									\
+	interrupt_async_enter_prepare(regs, &state);			\
+									\
 	____##func (regs);						\
+									\
+	interrupt_async_exit_prepare(regs, &state);			\
 }									\
 									\
 static __always_inline void ____##func(struct pt_regs *regs)
@@ -157,10 +218,15 @@ static __always_inline long ____##func(struct pt_regs *regs);		\
 									\
 __visible noinstr long func(struct pt_regs *regs)			\
 {									\
+	struct interrupt_nmi_state state;				\
 	long ret;							\
 									\
+	interrupt_nmi_enter_prepare(regs, &state);			\
+									\
 	ret = ____##func (regs);					\
 									\
+	interrupt_nmi_exit_prepare(regs, &state);			\
+									\
 	return ret;							\
 }									\
 									\
-- 
2.23.0

