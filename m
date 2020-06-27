Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8088B20C2AB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 17:18:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vHTT2LRHzDr5n
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 01:18:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oLOeSZyo; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vH9J6y3TzDrCj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 01:04:51 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id z15so969119wrl.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t2L1K2bV9m5JXikNSc3z683l0pkiswvncfWbyRpfKPA=;
 b=oLOeSZyoADa8Uzn4ECrco3+E28bJ3iIWgCZZpRW61lCMMCUtxbSmYoYz+WlsxZhgrM
 xzD/ApEKULR+rIDT5zVhZz1wEe6CclGTXjz/HE9raOzlBRPzkABq3XUz7aHTdTQjxuHy
 git1wMbeuO87z3sc4QfOsayDA+jjXnl20GktDoPspNsVLWLbCVphxlHMdjDivikPfW2e
 /14KSrdC6S9no/uqHYdRkOS84OaOdzQopRVxrOspfH1SwvVfurF1vGG2PB8hSeYrdYxs
 IGr+J0cOh1/85Q7ygULt+lKcDU/oQLVgj6JQeITJB1CwsQdIrNyYXx4fCaeA2lapGicF
 0lJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t2L1K2bV9m5JXikNSc3z683l0pkiswvncfWbyRpfKPA=;
 b=PTvzXREJ7fVcMOeYgVF9/rcVjdGS07CF4sL88C/nsKmNwjMVxHYvdpXPcXxFWIkYE/
 yFaVMexoR1I9BmuO7m4hLE024a35spSlofubmUgv5ZXxMGTPd+vftqN+MTGasVWFDp0E
 zboGcovMmv4sV8kXKB1Zl50SZlGy6I+TA9dfjcT+ujPkdZo1l35wkcbOlKt1Vt1/AbhX
 7LiZWwdv6/BJA7f3MKnZrDaYXcj5vA8/SX3fobZ2aUkZAGY9F2PK3FbdDXToeKk2hJEt
 UEJu6kPYN1U9CkutTmJTJYct/vmxsgHvK+IJSVex+rgt9ykmZ44RMQBIu4fjI3xMP3Sg
 qvKQ==
X-Gm-Message-State: AOAM530P1eAg8+7MQWVuOQLwS1lhGSNHu/b89tHMHiOYO934ZGFD8HNN
 UBV5SNikVi55JROMiDX/8RbtyxkZ
X-Google-Smtp-Source: ABdhPJw1pbtNANoOG/ZKHqn7vDo3vJRYMyn/JFl9oSRkRsdppvomcxOJioYU0V1MA+7LzbEYsqz1KQ==
X-Received: by 2002:adf:afc3:: with SMTP id y3mr9326461wrd.277.1593270286400; 
 Sat, 27 Jun 2020 08:04:46 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id d132sm21722029wmd.35.2020.06.27.08.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 08:04:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc: inline doorbell sending functions
Date: Sun, 28 Jun 2020 01:04:26 +1000
Message-Id: <20200627150428.2525192-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200627150428.2525192-1-npiggin@gmail.com>
References: <20200627150428.2525192-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
 Anton Blanchard <anton@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are only called in one place for a given platform, so inline them
for performance.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/dbell.h | 59 ++++++++++++++++++++++++++++++--
 arch/powerpc/kernel/dbell.c      | 55 -----------------------------
 2 files changed, 56 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/include/asm/dbell.h b/arch/powerpc/include/asm/dbell.h
index 4ce6808deed3..5c9625e5070b 100644
--- a/arch/powerpc/include/asm/dbell.h
+++ b/arch/powerpc/include/asm/dbell.h
@@ -13,6 +13,7 @@
 
 #include <asm/ppc-opcode.h>
 #include <asm/feature-fixups.h>
+#include <asm/kvm_ppc.h>
 
 #define PPC_DBELL_MSG_BRDCAST	(0x04000000)
 #define PPC_DBELL_TYPE(x)	(((x) & 0xf) << (63-36))
@@ -87,9 +88,6 @@ static inline void ppc_msgsync(void)
 
 #endif /* CONFIG_PPC_BOOK3S */
 
-extern void doorbell_global_ipi(int cpu);
-extern void doorbell_core_ipi(int cpu);
-extern int doorbell_try_core_ipi(int cpu);
 extern void doorbell_exception(struct pt_regs *regs);
 
 static inline void ppc_msgsnd(enum ppc_dbell type, u32 flags, u32 tag)
@@ -100,4 +98,59 @@ static inline void ppc_msgsnd(enum ppc_dbell type, u32 flags, u32 tag)
 	_ppc_msgsnd(msg);
 }
 
+/*
+ * Doorbells must only be used if CPU_FTR_DBELL is available.
+ * msgsnd is used in HV, and msgsndp is used in !HV.
+ *
+ * These should be used by platform code that is aware of restrictions.
+ * Other arch code should use ->cause_ipi.
+ *
+ * doorbell_global_ipi() sends a dbell to any target CPU.
+ * Must be used only by architectures that address msgsnd target
+ * by PIR/get_hard_smp_processor_id.
+ */
+static inline void doorbell_global_ipi(int cpu)
+{
+	u32 tag = get_hard_smp_processor_id(cpu);
+
+	kvmppc_set_host_ipi(cpu);
+	/* Order previous accesses vs. msgsnd, which is treated as a store */
+	ppc_msgsnd_sync();
+	ppc_msgsnd(PPC_DBELL_MSGTYPE, 0, tag);
+}
+
+/*
+ * doorbell_core_ipi() sends a dbell to a target CPU in the same core.
+ * Must be used only by architectures that address msgsnd target
+ * by TIR/cpu_thread_in_core.
+ */
+static inline void doorbell_core_ipi(int cpu)
+{
+	u32 tag = cpu_thread_in_core(cpu);
+
+	kvmppc_set_host_ipi(cpu);
+	/* Order previous accesses vs. msgsnd, which is treated as a store */
+	ppc_msgsnd_sync();
+	ppc_msgsnd(PPC_DBELL_MSGTYPE, 0, tag);
+}
+
+/*
+ * Attempt to cause a core doorbell if destination is on the same core.
+ * Returns 1 on success, 0 on failure.
+ */
+static inline int doorbell_try_core_ipi(int cpu)
+{
+	int this_cpu = get_cpu();
+	int ret = 0;
+
+	if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
+		doorbell_core_ipi(cpu);
+		ret = 1;
+	}
+
+	put_cpu();
+
+	return ret;
+}
+
 #endif /* _ASM_POWERPC_DBELL_H */
diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index f17ff1200eaa..52680cf07c9d 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -18,61 +18,6 @@
 
 #ifdef CONFIG_SMP
 
-/*
- * Doorbells must only be used if CPU_FTR_DBELL is available.
- * msgsnd is used in HV, and msgsndp is used in !HV.
- *
- * These should be used by platform code that is aware of restrictions.
- * Other arch code should use ->cause_ipi.
- *
- * doorbell_global_ipi() sends a dbell to any target CPU.
- * Must be used only by architectures that address msgsnd target
- * by PIR/get_hard_smp_processor_id.
- */
-void doorbell_global_ipi(int cpu)
-{
-	u32 tag = get_hard_smp_processor_id(cpu);
-
-	kvmppc_set_host_ipi(cpu);
-	/* Order previous accesses vs. msgsnd, which is treated as a store */
-	ppc_msgsnd_sync();
-	ppc_msgsnd(PPC_DBELL_MSGTYPE, 0, tag);
-}
-
-/*
- * doorbell_core_ipi() sends a dbell to a target CPU in the same core.
- * Must be used only by architectures that address msgsnd target
- * by TIR/cpu_thread_in_core.
- */
-void doorbell_core_ipi(int cpu)
-{
-	u32 tag = cpu_thread_in_core(cpu);
-
-	kvmppc_set_host_ipi(cpu);
-	/* Order previous accesses vs. msgsnd, which is treated as a store */
-	ppc_msgsnd_sync();
-	ppc_msgsnd(PPC_DBELL_MSGTYPE, 0, tag);
-}
-
-/*
- * Attempt to cause a core doorbell if destination is on the same core.
- * Returns 1 on success, 0 on failure.
- */
-int doorbell_try_core_ipi(int cpu)
-{
-	int this_cpu = get_cpu();
-	int ret = 0;
-
-	if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
-		doorbell_core_ipi(cpu);
-		ret = 1;
-	}
-
-	put_cpu();
-
-	return ret;
-}
-
 void doorbell_exception(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
-- 
2.23.0

