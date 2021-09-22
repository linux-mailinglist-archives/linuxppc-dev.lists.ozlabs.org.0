Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED0414C89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:57:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF1cF4HL9z3cD4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 00:57:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hi4Kpr7l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Hi4Kpr7l; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF1YR0Sykz2ywg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 00:55:06 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id h3so2933389pgb.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g97nyFThQQusqlUxZ+4klENb7cyN96KFoEsUZjx7+gU=;
 b=Hi4Kpr7lIq25jpRztznPuLwLQBdweXjMa16bEqDs/TSPeIP5X/mEtLbqftbHk8TEAO
 vJ/asKDF1Ql8xZ+bj/G/qyNFWEU0l6J77AB7W+SwZavxO46o/TlBrlkNF4T3tNda2QIg
 JYBd9Jw1AA3hcYqpg0RabKeRHuPzQDJSsd1beIAR5xufklBMUf/4vbztIB8bMyFgAZn7
 KsGyMpz4tKKxdeAmmzB5M9H5p5diAScBOeCN3dH7iqmRVdM4djMsvthc54B8LtHap9Um
 NaZp9nOdKuM05vtWLLzzsl9Ev7rpg7fqdbVNeLuiMHHowY4d37ANcl5R/8uGrYE+t/6E
 0k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g97nyFThQQusqlUxZ+4klENb7cyN96KFoEsUZjx7+gU=;
 b=N8Gb0kjppLpu/nqr5PZmxH2pN0mGQ8hxUar9dtb5Js1/XcySJeVvMf5G579mIcSAEI
 COPE7oqNtE1h4d7oRYYIEyxtZmzqCom17tD/Wk0Gb5xSrEw8fjbnCuGxzxGbxcb4FcPB
 xZESnkknwhSCoprDlK83GOPpM7t6joYcc3IbPggVcTfm7/m4VuH0OTf6RLgY2ZanHF4u
 MMvn9XXtdlr+qPn0prYixg+Oc3u9t/zNd/SbdaUw8WktRV4L8QOHF0EJCwbKjR7FZW17
 QgeQwBXrjLRWrPhuHUGxIy7FbzDKDYytnHZuHeVkckaA+6SPXwOA8yIrvUOrlQrk6VTZ
 qnVw==
X-Gm-Message-State: AOAM532NtkmRag9pYdrBWyONtFXKQgg7J4y6puqkG/uzsXoSZwe8HQIc
 plcKROXHleWXVJhEWw/UervunmklEvc=
X-Google-Smtp-Source: ABdhPJwFJWxy4qMqH5CriW+d5Ja8Z0EZQfFWDWhSytcwaA1ImfqO1SK4J23ZjwBTCMtL/RKPCt5D3A==
X-Received: by 2002:a65:6084:: with SMTP id t4mr52918pgu.25.1632322503747;
 Wed, 22 Sep 2021 07:55:03 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id o14sm2856211pfh.145.2021.09.22.07.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:55:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/6] powerpc/64s/perf: add power_pmu_wants_prompt_pmi to
 say whether perf wants PMIs to be soft-NMI
Date: Thu, 23 Sep 2021 00:54:49 +1000
Message-Id: <20210922145452.352571-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210922145452.352571-1-npiggin@gmail.com>
References: <20210922145452.352571-1-npiggin@gmail.com>
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
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Interrupt code enables MSR[EE] in some irq handlers while keeping local
irqs disabled via soft-mask, allowing PMI interrupts to be taken as
soft-NMI to improve profiling of irq handlers.

When perf is not enabled, there is no point to doing this, it's
additional overhead. So provide a function that can say if PMIs should
be taken promptly if possible.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h |  2 ++
 arch/powerpc/perf/core-book3s.c   | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 21cc571ea9c2..b987822e552e 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -306,6 +306,8 @@ static inline bool lazy_irq_pending_nocheck(void)
 	return __lazy_irq_pending(local_paca->irq_happened);
 }
 
+bool power_pmu_wants_prompt_pmi(void);
+
 /*
  * This is called by asynchronous interrupts to conditionally
  * re-enable hard interrupts after having cleared the source
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 73e62e9b179b..773d07d68b6d 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -17,6 +17,7 @@
 #include <asm/firmware.h>
 #include <asm/ptrace.h>
 #include <asm/code-patching.h>
+#include <asm/hw_irq.h>
 #include <asm/interrupt.h>
 
 #ifdef CONFIG_PPC64
@@ -2381,6 +2382,36 @@ static void perf_event_interrupt(struct pt_regs *regs)
 	perf_sample_event_took(sched_clock() - start_clock);
 }
 
+/*
+ * If the perf subsystem wants performance monitor interrupts as soon as
+ * possible (e.g., to sample the instruction address and stack chain),
+ * this should return true. The IRQ masking code can then enable MSR[EE]
+ * in some places (e.g., interrupt handlers) that allows PMI interrupts
+ * though to improve accuracy of profiles, at the cost of some performance.
+ *
+ * The PMU counters can be enabled by other means (e.g., sysfs raw SPR
+ * access), but in that case there is no need for prompt PMI handling.
+ *
+ * This currently returns true if any perf counter is being used. It
+ * could possibly return false if only events are being counted rather than
+ * samples being taken, but for now this is good enough.
+ */
+bool power_pmu_wants_prompt_pmi(void)
+{
+	struct cpu_hw_events *cpuhw;
+
+	/*
+	 * This could simply test local_paca->pmcregs_in_use if that were not
+	 * under ifdef KVM.
+	 */
+
+	if (!ppmu)
+		return false;
+
+	cpuhw = this_cpu_ptr(&cpu_hw_events);
+	return cpuhw->n_events;
+}
+
 static int power_pmu_prepare_cpu(unsigned int cpu)
 {
 	struct cpu_hw_events *cpuhw = &per_cpu(cpu_hw_events, cpu);
-- 
2.23.0

