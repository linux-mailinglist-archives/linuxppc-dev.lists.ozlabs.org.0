Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D92EF2A8167
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 15:52:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRmgx6xDVzDr1g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 01:51:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YcOJAuFx; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmJN4Yt4zDqyX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 01:35:00 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id t22so863370plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 06:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w/bocTKQSwlJxL8Ztnsvq5bI5RkXbQ4p8iwHSmXZ8xg=;
 b=YcOJAuFx/Kd/bQhhW1x9QxVd2yKbASjBBZaSP83KJLC8ei06IkrFFuN/0cwOyXLFuL
 nlrPwt/pVdFEgLDpKRq0aoZUdXIpx7z5Dh2cjB19bVKADPj/3o6gYfZ1lqyz/dY2OZNi
 0mDNyEuXQpPSMHurnRMQ8DMAsXXtuzX9+TniQh8b0fcfSd7pEZ8L66JIhzYWWQ6dOwMj
 Nja81uFEyMgPUtK6kpgfPNprWc9MB36K4da8CwagfiZbU/31uiEmylnHgF1eE9Mj/msd
 obEQxCawAavejwFTKyk4rxFm54TttPrN7WXdPbURHArYxEfPjcv1FfZ0KgMPOZoO5m0G
 ygzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w/bocTKQSwlJxL8Ztnsvq5bI5RkXbQ4p8iwHSmXZ8xg=;
 b=CWfKR8aJM9TUHSiJGYyalHo+qB3DZYvCQRgvBqLXxDN6bTI7Sy+j+AymhJMA3Nut+j
 qoFpgj5FnWDzG0p5flOVfRfEIgQz/HPQy+/pAI01aLKKXCoR/noZUNe20SBd4s+F5GzK
 KjzElfGjolm5ue6b6oApm1OMYKudGi723VWRfE1rsMbpbBvpKR2j48kwGOE2kaH4+Wh7
 22UrnXZcYHVUGHsTOtFv9JhHXzGe8uRCUAHPkdmA9pHYFFH1//h2soNIf85A6fwdh+0f
 T6YQRoIx00BUtx3in20z0p/mB+ZAr9S7cktu7xCpEFq1SMyqfCLSDWL017uJgp5IA/9h
 SHRg==
X-Gm-Message-State: AOAM532413qXjFcD33//+iY9fJZtyNxfSi+AbUwPTZtV0KTjrDoIeneA
 LHBo2E4fZxY2nGjv5qUShhnBwYPuMEIwMg==
X-Google-Smtp-Source: ABdhPJzci6LceNYSr2A5TqX6ROn3GemsSGMnWinWXiwxKE3Hte9jhUntxKXwsUvODT/Wu6zPa4BlRg==
X-Received: by 2002:a17:90a:ea16:: with SMTP id
 w22mr2744211pjy.64.1604586897008; 
 Thu, 05 Nov 2020 06:34:57 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id n15sm2876771pgt.75.2020.11.05.06.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:34:56 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/18] powerpc: add interrupt wrapper entry / exit stub
 functions
Date: Fri,  6 Nov 2020 00:34:18 +1000
Message-Id: <20201105143431.1874789-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201105143431.1874789-1-npiggin@gmail.com>
References: <20201105143431.1874789-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/interrupt.h | 52 ++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 3292f5094085..c5ffcf144bbd 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -5,6 +5,36 @@
 #include <linux/context_tracking.h>
 #include <asm/ftrace.h>
 
+struct interrupt_state {
+};
+
+static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
+{
+}
+
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
@@ -59,7 +89,13 @@ static __always_inline void ___##func(struct pt_regs *regs);		\
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
@@ -87,10 +123,15 @@ static __always_inline long ___##func(struct pt_regs *regs);		\
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
@@ -117,7 +158,13 @@ static __always_inline void ___##func(struct pt_regs *regs);		\
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
@@ -145,10 +192,15 @@ static __always_inline long ___##func(struct pt_regs *regs);		\
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

