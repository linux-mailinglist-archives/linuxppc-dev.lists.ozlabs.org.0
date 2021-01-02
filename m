Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 891CE2E8754
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 13:46:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7M7q0wqyzDqpk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 23:45:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XcN07v1L; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7LhN26BWzDqJm
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:25:40 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id t6so12054418plq.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+OJkqpdAJc91EuEzmfn11XOLUqioGn3A8NHF4wCgm0M=;
 b=XcN07v1LRmQdqNihBscQ+wkGa+4LgrhImdK6tpEpSPJp6vsvW+AmHnu8vPe7clOd7w
 fOphH+0gMj8IuLImGvt7v8jRAgLnY7NKmo7QfU4ZeJLYtEGEQAZSSjI/ChW9fCK+wTp5
 qvCoA76tWGWPhtJYI6c3+m5scu133rN8K9BP54zriy3123IV/uOvTFOi90ruxcN9mlfx
 SifMMQHgNoWU+jxiW4Tz5AmOkJzzMckkT23sIElmmpvQ/Zrbq0k0cTHYzzX6Msd8w2ou
 eBjb3cimiuregNUHAb5xWuBIbeAPczjMAk3XaUbSynwUibEfbWXg+++6ax6VCIMfvpJA
 qJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+OJkqpdAJc91EuEzmfn11XOLUqioGn3A8NHF4wCgm0M=;
 b=cmfOdqtMecrTCj57n/fUEFAoJoJIL5OiZNZFVDsloqWrvrzCasR0ZBs+JNzrrepcGQ
 HzIKTYTWhDpykpQFRYcl/fTIkg+t07rnr0YNfX/f7uIUJTXl0yPsyw3HqkbmkaG5pi5h
 6jlDj3fQQ5HYrqhrqoeLXat2uElDlmqnaXgfUPrOfJjxcZeGeoZJkpMuKTJ0FHr9pTPu
 Gpkwl/HUfZpMTYqusUWTrqPymT4D/em9WHDbOiKMDoxUb959Y0onaPs4GycA1JwSH6yO
 1eKRDrH7VG84N4XD73cprN7T6PFlhv9Y9CuaqVbH5UCJSeU/gSQOv1SMHQMcwDTQW7vS
 1o/Q==
X-Gm-Message-State: AOAM531xAkrMAaYmdRX00M9sIfAgNsfAsfXtEXWfqVKbfu/gBJLtYh6W
 9OApfj3D7dH9oe1cxyCO9HV0IjmhYIk=
X-Google-Smtp-Source: ABdhPJzYPLoibWBXN9/Sf4nqcOb0tYN+pP20sozWttdHc1Hgf0karSbGp4auOgdyRIWUnsKn8/Rqcg==
X-Received: by 2002:a17:902:ab8b:b029:da:f377:e7d7 with SMTP id
 f11-20020a170902ab8bb02900daf377e7d7mr44735361plr.4.1609590338128; 
 Sat, 02 Jan 2021 04:25:38 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:25:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 07/21] powerpc: add interrupt wrapper entry / exit stub
 functions
Date: Sat,  2 Jan 2021 22:24:54 +1000
Message-Id: <20210102122508.1950592-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210102122508.1950592-1-npiggin@gmail.com>
References: <20210102122508.1950592-1-npiggin@gmail.com>
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

