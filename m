Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 621262151D3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 06:42:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0Xwb27DbzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 14:42:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SNkTb7pS; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0Xnj0VJhzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 14:36:08 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id l2so38928671wmf.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 21:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c7no+9nj4ki/bMOC81yoyKciU109ZEB92uhR/9nSW+8=;
 b=SNkTb7pShbLJmAwc/t89XTpTW8r7i60u6UxcRsURjQmOPLdBx4pkkEiDRywSn4LFdG
 PsxlRdy9XsHZPtSyMmgu9QQgUg45IlDpE2I30IGIjjlEu4NAOMBu5gOPgAH/kry91O0T
 W6n8ABVn2oyr4SdyF+dpi1cdGIlBZX8hdkocJB2EM8n0wcca++44qKwhP3tl+Zf8VSJw
 D6tGjL724Cp+3wUL745lH01+4VyPujJ0dAgcZpHwbiZGIdLfaVG4DpSsyBbjo6cLx5B9
 +PAiUa0/W/t2AnLdnPneBnqh56a4QQSgFEfmMMHR6XRza3xhQjCsMwZ5HXtY9ml3CSMH
 4iyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c7no+9nj4ki/bMOC81yoyKciU109ZEB92uhR/9nSW+8=;
 b=lLYDBUe7Mmo/wEObbAFic/v30Z59O1oLz25CrURmdQIZqWaeXnAIceVGWIuywS1s7C
 QkVI8YIW3wcH76LNTJsTJYp00L40ogBPf+sOKuevTou3K62CzVYSJoLrKNVTCV3QD5eL
 iYn365bWAVZwCBu1DnRNvdQVUb5KgL2h6nR+q6VISRJymb8p6/ErNqVdBgYnOlw/ksUm
 Sk5y4+QqpugpXW7RL/jNM0xeiP9QXAeJ9A2z3/OmJedKWRpIHk6iSgPQSYFj0NeQDoyH
 rrkTXkiaKCc5ODisBHzmME1KouygGfxnJGWkKbrviiQKnEGx4/seTOTa7GVyCzGuDkKD
 LDtw==
X-Gm-Message-State: AOAM53098MExN1b47GTvWXBx3ZpwpJvVAsdvdzG/nkcjW6FkFi174bJQ
 Y1tnsQku4n8kkDe/2ipcwACHsSKY
X-Google-Smtp-Source: ABdhPJzzBH+bozqHfASMpIXMv8DBKlveHr6OC1zs3DG+rZlrvPO/THgIvWvxbaccX9CeNAK+uXDUQQ==
X-Received: by 2002:a1c:4086:: with SMTP id
 n128mr49059712wma.118.1594010164390; 
 Sun, 05 Jul 2020 21:36:04 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id r10sm22202309wrm.17.2020.07.05.21.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 21:36:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/6] powerpc/pseries: move some PAPR paravirt functions to
 their own file
Date: Mon,  6 Jul 2020 14:35:36 +1000
Message-Id: <20200706043540.1563616-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200706043540.1563616-1-npiggin@gmail.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/paravirt.h | 61 +++++++++++++++++++++++++++++
 arch/powerpc/include/asm/spinlock.h | 24 +-----------
 arch/powerpc/lib/locks.c            | 12 +++---
 3 files changed, 68 insertions(+), 29 deletions(-)
 create mode 100644 arch/powerpc/include/asm/paravirt.h

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
new file mode 100644
index 000000000000..7a8546660a63
--- /dev/null
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __ASM_PARAVIRT_H
+#define __ASM_PARAVIRT_H
+#ifdef __KERNEL__
+
+#include <linux/jump_label.h>
+#include <asm/smp.h>
+#ifdef CONFIG_PPC64
+#include <asm/paca.h>
+#include <asm/hvcall.h>
+#endif
+
+#ifdef CONFIG_PPC_SPLPAR
+DECLARE_STATIC_KEY_FALSE(shared_processor);
+
+static inline bool is_shared_processor(void)
+{
+	return static_branch_unlikely(&shared_processor);
+}
+
+/* If bit 0 is set, the cpu has been preempted */
+static inline u32 yield_count_of(int cpu)
+{
+	__be32 yield_count = READ_ONCE(lppaca_of(cpu).yield_count);
+	return be32_to_cpu(yield_count);
+}
+
+static inline void yield_to_preempted(int cpu, u32 yield_count)
+{
+	plpar_hcall_norets(H_CONFER, get_hard_smp_processor_id(cpu), yield_count);
+}
+#else
+static inline bool is_shared_processor(void)
+{
+	return false;
+}
+
+static inline u32 yield_count_of(int cpu)
+{
+	return 0;
+}
+
+extern void ___bad_yield_to_preempted(void);
+static inline void yield_to_preempted(int cpu, u32 yield_count)
+{
+	___bad_yield_to_preempted(); /* This would be a bug */
+}
+#endif
+
+#define vcpu_is_preempted vcpu_is_preempted
+static inline bool vcpu_is_preempted(int cpu)
+{
+	if (!is_shared_processor())
+		return false;
+	if (yield_count_of(cpu) & 1)
+		return true;
+	return false;
+}
+
+#endif /* __KERNEL__ */
+#endif /* __ASM_PARAVIRT_H */
diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index 2d620896cdae..79be9bb10bbb 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -15,11 +15,10 @@
  *
  * (the type definitions are in asm/spinlock_types.h)
  */
-#include <linux/jump_label.h>
 #include <linux/irqflags.h>
+#include <asm/paravirt.h>
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
-#include <asm/hvcall.h>
 #endif
 #include <asm/synch.h>
 #include <asm/ppc-opcode.h>
@@ -35,18 +34,6 @@
 #define LOCK_TOKEN	1
 #endif
 
-#ifdef CONFIG_PPC_PSERIES
-DECLARE_STATIC_KEY_FALSE(shared_processor);
-
-#define vcpu_is_preempted vcpu_is_preempted
-static inline bool vcpu_is_preempted(int cpu)
-{
-	if (!static_branch_unlikely(&shared_processor))
-		return false;
-	return !!(be32_to_cpu(lppaca_of(cpu).yield_count) & 1);
-}
-#endif
-
 static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
 {
 	return lock.slock == 0;
@@ -110,15 +97,6 @@ static inline void splpar_spin_yield(arch_spinlock_t *lock) {};
 static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
 #endif
 
-static inline bool is_shared_processor(void)
-{
-#ifdef CONFIG_PPC_SPLPAR
-	return static_branch_unlikely(&shared_processor);
-#else
-	return false;
-#endif
-}
-
 static inline void spin_yield(arch_spinlock_t *lock)
 {
 	if (is_shared_processor())
diff --git a/arch/powerpc/lib/locks.c b/arch/powerpc/lib/locks.c
index 6440d5943c00..04165b7a163f 100644
--- a/arch/powerpc/lib/locks.c
+++ b/arch/powerpc/lib/locks.c
@@ -27,14 +27,14 @@ void splpar_spin_yield(arch_spinlock_t *lock)
 		return;
 	holder_cpu = lock_value & 0xffff;
 	BUG_ON(holder_cpu >= NR_CPUS);
-	yield_count = be32_to_cpu(lppaca_of(holder_cpu).yield_count);
+
+	yield_count = yield_count_of(holder_cpu);
 	if ((yield_count & 1) == 0)
 		return;		/* virtual cpu is currently running */
 	rmb();
 	if (lock->slock != lock_value)
 		return;		/* something has changed */
-	plpar_hcall_norets(H_CONFER,
-		get_hard_smp_processor_id(holder_cpu), yield_count);
+	yield_to_preempted(holder_cpu, yield_count);
 }
 EXPORT_SYMBOL_GPL(splpar_spin_yield);
 
@@ -53,13 +53,13 @@ void splpar_rw_yield(arch_rwlock_t *rw)
 		return;		/* no write lock at present */
 	holder_cpu = lock_value & 0xffff;
 	BUG_ON(holder_cpu >= NR_CPUS);
-	yield_count = be32_to_cpu(lppaca_of(holder_cpu).yield_count);
+
+	yield_count = yield_count_of(holder_cpu);
 	if ((yield_count & 1) == 0)
 		return;		/* virtual cpu is currently running */
 	rmb();
 	if (rw->lock != lock_value)
 		return;		/* something has changed */
-	plpar_hcall_norets(H_CONFER,
-		get_hard_smp_processor_id(holder_cpu), yield_count);
+	yield_to_preempted(holder_cpu, yield_count);
 }
 #endif
-- 
2.23.0

