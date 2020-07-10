Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0764521ACD2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 04:01:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2x9R3FR9zDqpL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 12:01:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Bsl6w6DS; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2x4V1X5MzDq5f
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 11:57:13 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id u5so1829515pfn.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 18:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lqgdcf4W4nyd4T+76bDWEwAQ0qL2bOb12H7iEQITiag=;
 b=Bsl6w6DS+UBvKpZoK4wXCmnQGU0ewfOBlQPrDKoCEkWv/2kDrAJwFHbd1SWqVeJdeL
 CziLht/b/KkM4NPlZlH+XmNB5vqzrMJNIcdyP2BNi9cupfGbeM6x5dM7ZMa5kucXYDM5
 l4Y9+6wiV8JPWAiCxTH0U1fsTFdcf5uc0fQsJ6G2lln4cMvpEHVB7G6bl7YQlu3OtfJ5
 cIqtTLtC2u+Va2ORstjbZ8mWnGFoxexPLae5Vz85lo5xBOXzrv1t1d8TLcZ0FWo1gICB
 jHoDDR1UFjI6izLYc6vvQkk0lFv7w2wW/z7yu9JP1RGuvI/AiQs3+3ACt4BmtlSf6eNX
 ikOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lqgdcf4W4nyd4T+76bDWEwAQ0qL2bOb12H7iEQITiag=;
 b=PJ+fm8KWpRK7q0TP6IfgfQAnhJBWH0WlkdH5HI/FF3P7U5CqRk6gjNBcWK8jt9XlI3
 WTTBp67MOvZ2geXNJIEvMKySyXyLOtCW2y3Oj53N13KYaEhr7I4n0dZW5BHydcnTx7JD
 0K1pUP+o1EiFFCCLI5fOqfUTpsbipAa0yxoTgkV3N+4VHPrzkiugUe8qxceyrBJYyu/o
 lmkeYT6v465RFQLSKBGnkv2wxMXnFeiJquUMsmXqWnOIASHWlK0XopOTFsLit/17YCtg
 7l+mEd32pDZqnfoIPOrwdbOmsN72yVU4g03wifuXJOdRmGB1y6rjj8NXMW2cTDFrCK1h
 135Q==
X-Gm-Message-State: AOAM530mZEXUtv5yG/OuLR5pBHs+2ZDtl/KkgcSvpFrjVJE8cjPnlFxm
 6uiE7FfyGMA4puMYXSuovJU=
X-Google-Smtp-Source: ABdhPJw1L2niD/P2jvytdxicFLyx/6l3tljWtgvBgnhSMhEEeF1GCsLRQuoV7KEVgNbXurGjErZj4g==
X-Received: by 2002:a63:eb55:: with SMTP id b21mr56103283pgk.433.1594346231584; 
 Thu, 09 Jul 2020 18:57:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-245-19-62.static.tpgi.com.au.
 [220.245.19.62])
 by smtp.gmail.com with ESMTPSA id 7sm3912834pgw.85.2020.07.09.18.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 18:57:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [RFC PATCH 1/7] asm-generic: add generic MMU versions of mmu context
 functions
Date: Fri, 10 Jul 2020 11:56:40 +1000
Message-Id: <20200710015646.2020871-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200710015646.2020871-1-npiggin@gmail.com>
References: <20200710015646.2020871-1-npiggin@gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Remis Lima Baima <remis.developer@googlemail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Many of these are no-ops on many architectures, so extend mmu_context.h
to cover MMU and NOMMU, and split the NOMMU bits out to nommu_context.h

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Remis Lima Baima <remis.developer@googlemail.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/microblaze/include/asm/mmu_context.h |  2 +-
 arch/sh/include/asm/mmu_context.h         |  2 +-
 include/asm-generic/mmu_context.h         | 57 +++++++++++++++++------
 include/asm-generic/nommu_context.h       | 19 ++++++++
 4 files changed, 64 insertions(+), 16 deletions(-)
 create mode 100644 include/asm-generic/nommu_context.h

diff --git a/arch/microblaze/include/asm/mmu_context.h b/arch/microblaze/include/asm/mmu_context.h
index f74f9da07fdc..34004efb3def 100644
--- a/arch/microblaze/include/asm/mmu_context.h
+++ b/arch/microblaze/include/asm/mmu_context.h
@@ -2,5 +2,5 @@
 #ifdef CONFIG_MMU
 # include <asm/mmu_context_mm.h>
 #else
-# include <asm-generic/mmu_context.h>
+# include <asm-generic/nommu_context.h>
 #endif
diff --git a/arch/sh/include/asm/mmu_context.h b/arch/sh/include/asm/mmu_context.h
index 48e67d544d53..9470d17c71c2 100644
--- a/arch/sh/include/asm/mmu_context.h
+++ b/arch/sh/include/asm/mmu_context.h
@@ -134,7 +134,7 @@ static inline void switch_mm(struct mm_struct *prev,
 #define set_TTB(pgd)			do { } while (0)
 #define get_TTB()			(0)
 
-#include <asm-generic/mmu_context.h>
+#include <asm-generic/nommu_context.h>
 
 #endif /* CONFIG_MMU */
 
diff --git a/include/asm-generic/mmu_context.h b/include/asm-generic/mmu_context.h
index 6be9106fb6fb..86cea80a50df 100644
--- a/include/asm-generic/mmu_context.h
+++ b/include/asm-generic/mmu_context.h
@@ -3,44 +3,73 @@
 #define __ASM_GENERIC_MMU_CONTEXT_H
 
 /*
- * Generic hooks for NOMMU architectures, which do not need to do
- * anything special here.
+ * Generic hooks to implement no-op functionality.
  */
 
-#include <asm-generic/mm_hooks.h>
-
 struct task_struct;
 struct mm_struct;
 
+/*
+ * enter_lazy_tlb - Called when "tsk" is about to enter lazy TLB mode.
+ *
+ * @mm:  the currently active mm context which is becoming lazy
+ * @tsk: task which is entering lazy tlb
+ *
+ * tsk->mm will be NULL
+ */
+#ifndef enter_lazy_tlb
 static inline void enter_lazy_tlb(struct mm_struct *mm,
 			struct task_struct *tsk)
 {
 }
+#endif
 
+/**
+ * init_new_context - Initialize context of a new mm_struct.
+ * @tsk: task struct for the mm
+ * @mm:  the new mm struct
+ */
+#ifndef init_new_context
 static inline int init_new_context(struct task_struct *tsk,
 			struct mm_struct *mm)
 {
 	return 0;
 }
+#endif
 
+/**
+ * destroy_context - Undo init_new_context when the mm is going away
+ * @mm: old mm struct
+ */
+#ifndef destroy_context
 static inline void destroy_context(struct mm_struct *mm)
 {
 }
+#endif
 
-static inline void deactivate_mm(struct task_struct *task,
-			struct mm_struct *mm)
-{
-}
-
-static inline void switch_mm(struct mm_struct *prev,
-			struct mm_struct *next,
-			struct task_struct *tsk)
+/**
+ * activate_mm - called after exec switches the current task to a new mm, to switch to it
+ * @prev_mm: previous mm of this task
+ * @next_mm: new mm
+ */
+#ifndef activate_mm
+static inline void activate_mm(struct mm_struct *prev_mm,
+			       struct mm_struct *next_mm)
 {
+	switch_mm(prev_mm, next_mm, current);
 }
+#endif
 
-static inline void activate_mm(struct mm_struct *prev_mm,
-			       struct mm_struct *next_mm)
+/**
+ * dectivate_mm - called when an mm is released after exit or exec switches away from it
+ * @tsk: the task
+ * @mm:  the old mm
+ */
+#ifndef deactivate_mm
+static inline void deactivate_mm(struct task_struct *tsk,
+			struct mm_struct *mm)
 {
 }
+#endif
 
 #endif /* __ASM_GENERIC_MMU_CONTEXT_H */
diff --git a/include/asm-generic/nommu_context.h b/include/asm-generic/nommu_context.h
new file mode 100644
index 000000000000..72b8d8b1d81e
--- /dev/null
+++ b/include/asm-generic/nommu_context.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_GENERIC_NOMMU_H
+#define __ASM_GENERIC_NOMMU_H
+
+/*
+ * Generic hooks for NOMMU architectures, which do not need to do
+ * anything special here.
+ */
+
+#include <asm-generic/mm_hooks.h>
+#include <asm-generic/mmu_context.h>
+
+static inline void switch_mm(struct mm_struct *prev,
+			struct mm_struct *next,
+			struct task_struct *tsk)
+{
+}
+
+#endif /* __ASM_GENERIC_NOMMU_H */
-- 
2.23.0

