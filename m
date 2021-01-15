Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC72F82EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:52:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHTJw4vjNzDsnh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:52:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RIRIH7iW; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzW1QY9zDshm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:50 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id h10so5838474pfo.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OI5vWELthZ9WXPr1HFCu3M+yjOLGxtP9BbdLHtksKPg=;
 b=RIRIH7iWe4Xt4hQ92ivYFxFDXV0+FfIs9T/qoWRaXdkSrssi8aWwNt2vj1VTuuGwlX
 sXEEhhl6XeNDAmCTTYbopG/zFI4F2Z5FTpaJOmNkV5KVEPGei/RbM4kIc8QQEW4qFFyi
 CKDrD9n4qNzIuEkqGB2xutC49YinMahRC8GU2bZnHeWLub9yGWvm6J/0OWNXHSQBATug
 K3WR6g4e+64xmGPhTmL3237YJCD3kfvbcZlQgTqtM6YAw0cOD+m7ooGSF6nthlA5vgFE
 0IZziyBQpMl9j3jnrSOevPU2dULxnxmutAc31i1tmVEmPRIfxphdr4buAIZNTZhtpSCs
 mNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OI5vWELthZ9WXPr1HFCu3M+yjOLGxtP9BbdLHtksKPg=;
 b=SJjqZfzDipZttugev1ngtCeBaDWqN24eVFc0J4alx/i9lr6EvmPM/UwxG6IYYtvNiU
 Q4WQ3MB7rg13kuwdBNETziKezgodpwxqLMHGzeoa3DM4GW1Sqnyjjgm31z8a/2SLNNBu
 knZT0L5XlnVd65YFbtPuTwFOAX2EhLIukGd5DBTJuQD3WRzU/P5p57uec0PDcjXZaMDV
 UQFfcX2pNdLDe6w7xCfqeNz9n15NFWLqMdIp4opqHTm6/srFC/Rzs43fYeF9aPpiX6uB
 dHOqeZ0tBDgjilo9xfEhGUBe/YNMj6VHUJ3AGt8sXzKlSJiDPIAfUMo7WqemAIN2RJb3
 N1CA==
X-Gm-Message-State: AOAM530mm0E3gAWEJl672Y7UTV+6fCUAAc+eG6pfBAasQFFWSvQTdC4g
 V4SAIILIT737poaeIXN8PwkxkxMXLaY=
X-Google-Smtp-Source: ABdhPJyj4OHK0PzPDCkbsU3ZQSQFxfqV9K9KhsSRQ13+VS/BTELoQP0bl6948xxWc5phqJefa/ez9Q==
X-Received: by 2002:a63:31ce:: with SMTP id
 x197mr13338593pgx.262.1610729507693; 
 Fri, 15 Jan 2021 08:51:47 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:47 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 24/39] powerpc: add interrupt wrapper entry / exit stub
 functions
Date: Sat, 16 Jan 2021 02:49:57 +1000
Message-Id: <20210115165012.1260253-25-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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

