Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7832F4586
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 08:51:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG04Y40CpzDqB4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 18:51:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J+A4MsHl; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzgG5NtrzDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:32:42 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id 11so711334pfu.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+OJkqpdAJc91EuEzmfn11XOLUqioGn3A8NHF4wCgm0M=;
 b=J+A4MsHlsJAxIqnr7JnUqllM7AmogY6enWNNqREry7/rWIo8A9PQVgvwWBgQ3E52uR
 S6EGFC7i/qs2OHU2kiUDWucj6D0ZByCVVJ6HoxZX6havL+g9Tt95nyef/WfPBjD9Vkq0
 jM0Pgf+LNQjA+kAghS2+VBOWdjvsYHeOV9ufn72iksyqx2TiWFQSl+yMDd2ygNARpFLB
 301L3fuqDrZw4J9rwMLuixR3squnqr/xgDJ1b62Puov2otCOlDxNypJKAYyZP0MdB1ui
 QYOXbY8iDNQYGyZqH7gWzC3uAgsVhJfWWL/Z6ZiOioLCkJSsPAFrw27BWerYyGYFNoax
 tgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+OJkqpdAJc91EuEzmfn11XOLUqioGn3A8NHF4wCgm0M=;
 b=o6VtkJD4HddcFR0tSnu1VoOoByHDTW+8hQhTJ/u3JRQgnwfMFRSPgHrVkpdMAgY7r4
 dFHTa1s4G3tE+68u8EXSXqPOP+34lNmn8HQqDitZKISlxsj3f2lBsHjeM5rPs4sup2OA
 Qb5MByfaC1//EdetJ07jV29WJcIzpb6gn0dBnE3DB4Z3Yn0AIkHUJX1A/jTqUGH+pEfc
 Z0jZJ+5K3lxVdJ6dUID2beyqCLHZPCVfDd3ldRFOTe2ADuIhS78Npr9qnRMsAuumlxs+
 KCzNN2CTuaDQy0li+lQrPe7+N3mcwimw6UUT2UH702gSL1wiUfv1/E8FoUxmBArb036u
 9dOw==
X-Gm-Message-State: AOAM532Z1fN6YHp4Q8d7cMtI3Biz0zyi2QMNrlR7VEyLcis72O/Y5iS1
 ERjL+nbshR3SAiQEHy6SjDlOp2SVGIo=
X-Google-Smtp-Source: ABdhPJw8eNs63xKR6Sy3SfCsEdNgTMbNhVDHc4DrY1rQBq+nLF73BGsgZI3TOgH2OXJbh5vsLQwrmA==
X-Received: by 2002:a63:4c4f:: with SMTP id m15mr916432pgl.54.1610523160592;
 Tue, 12 Jan 2021 23:32:40 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:32:40 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 07/21] powerpc: add interrupt wrapper entry / exit stub
 functions
Date: Wed, 13 Jan 2021 17:32:01 +1000
Message-Id: <20210113073215.516986-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210113073215.516986-1-npiggin@gmail.com>
References: <20210113073215.516986-1-npiggin@gmail.com>
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
index 60363e5eeffa..7c72c91c21ce 100644
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

