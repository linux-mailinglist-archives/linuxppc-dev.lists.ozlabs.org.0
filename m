Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 071752AEE9A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 11:15:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWLFp3TBlzDqnp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 21:15:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=thLafO4G; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWKZR3dw8zDql5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 20:44:31 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id gv24so438143pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 01:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IFlTTMCLQAEmoTfLVJKS5AXeABB3TRbNNdcFA09ESio=;
 b=thLafO4GTC6uZMeG2xo9O4gJVw78jZFi72mYJ0GWyg43afsLlpNZ5wlaVhwcevKBop
 Nh98gbQcb3YIas5Cvm4MLkxl+SG1umRHCZb765XkewZBvNvAChz0jJZTjAiVeiV0DhXE
 wNc2cCB4Awb+AEsKHBLnwJVjocHCmOt70JtsY1kEOnDSZMgzDIvf2/KyeX7P4ZgTqBnX
 3aTNZIvB1B73hetJmvUyC0jWqLZFawZdeM1ntBwy/7dgK/buApZGoRSfVG+Kv41YIiYf
 BU+aZgU9D+7qDsCZlELIOYCKSvkAyuH0Vr75McB3PfSHJfLnF6SUvJXIGJXqMdFP7ou9
 dLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IFlTTMCLQAEmoTfLVJKS5AXeABB3TRbNNdcFA09ESio=;
 b=at3O4s9AYkLCt8pc7bgC2NIR6xIyqD4qF1sIBtNng0K9wjWdLrE+tGPpGr2tudt8ok
 d0PMrPcmPxYDvF1Ff8BWnTXlV5CrDRHTQr8wGaJGEqn+auW+T8yX1iha3IMFMCP3dTCW
 /wIb0g0K2ausExtcnCXcJcnNoq1iXUQiKnb66EzF1OhqwRrhiozWM1IW9bi731+65Ca/
 Z/IigokosEbBDGO/QO9BhJKe4MLD1kbPFEgQNm6dzyPSF9s2XsDMFaF5ZJlCilo4+i/4
 aWSy3VSbH3ZWxPAtbA+dz81ksCFfGUcRmmGMYyIgGLXmK2YFOomowjoYE34lMG0/uZc6
 1qsg==
X-Gm-Message-State: AOAM533RKGfVAlH1SURZVrB9lkuXKYmI7Sc6/DF0vYJ6xwGhOKpzHYum
 Hcvnv427FYqTIBRydwiz0nZdhr9GD6M=
X-Google-Smtp-Source: ABdhPJywZG9vakWnkJKgBMuDV8s68z4ZFb0kOfQGX7OYXcZorJ/oTUgOZoyHNBXo0HIgbfOk6bEq0A==
X-Received: by 2002:a17:90a:5d10:: with SMTP id
 s16mr2905981pji.129.1605087869535; 
 Wed, 11 Nov 2020 01:44:29 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id a3sm2046129pfd.58.2020.11.11.01.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:44:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/19] powerpc: add interrupt wrapper entry / exit stub
 functions
Date: Wed, 11 Nov 2020 19:43:57 +1000
Message-Id: <20201111094410.3038123-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201111094410.3038123-1-npiggin@gmail.com>
References: <20201111094410.3038123-1-npiggin@gmail.com>
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

These will be used by subsequent patches.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 66 ++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 04b7bdf97a44..3a94153ff0d4 100644
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
@@ -59,7 +103,13 @@ static __always_inline void ___##func(struct pt_regs *regs);		\
 									\
 __visible noinstr void func(struct pt_regs *regs)			\
 {									\
+	struct interrupt_state state;					\
+									\
+	interrupt_enter_prepare(regs, &state);				\
+									\
 	___##func (regs);						\
+									\
+	interrupt_exit_prepare(regs, &state);				\
 }									\
 									\
 static __always_inline void ___##func(struct pt_regs *regs)
@@ -87,10 +137,15 @@ static __always_inline long ___##func(struct pt_regs *regs);		\
 									\
 __visible noinstr long func(struct pt_regs *regs)			\
 {									\
+	struct interrupt_state state;					\
 	long ret;							\
 									\
+	interrupt_enter_prepare(regs, &state);				\
+									\
 	ret = ___##func (regs);						\
 									\
+	interrupt_exit_prepare(regs, &state);				\
+									\
 	return ret;							\
 }									\
 									\
@@ -117,7 +172,13 @@ static __always_inline void ___##func(struct pt_regs *regs);		\
 									\
 __visible noinstr void func(struct pt_regs *regs)			\
 {									\
+	struct interrupt_state state;					\
+									\
+	interrupt_async_enter_prepare(regs, &state);			\
+									\
 	___##func (regs);						\
+									\
+	interrupt_async_exit_prepare(regs, &state);			\
 }									\
 									\
 static __always_inline void ___##func(struct pt_regs *regs)
@@ -145,10 +206,15 @@ static __always_inline long ___##func(struct pt_regs *regs);		\
 									\
 __visible noinstr long func(struct pt_regs *regs)			\
 {									\
+	struct interrupt_nmi_state state;				\
 	long ret;							\
 									\
+	interrupt_nmi_enter_prepare(regs, &state);			\
+									\
 	ret = ___##func (regs);						\
 									\
+	interrupt_nmi_exit_prepare(regs, &state);			\
+									\
 	return ret;							\
 }									\
 									\
-- 
2.23.0

