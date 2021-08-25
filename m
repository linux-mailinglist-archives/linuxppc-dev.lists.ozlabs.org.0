Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C213F7534
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 14:39:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvlsX2ZMBz3bjF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 22:39:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FcVpK6V/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FcVpK6V/; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvlqV3sMyz2yHY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 22:37:26 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 oc2-20020a17090b1c0200b00179e56772d6so4066615pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 05:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lEXsKF9hWGiU6RhM1jR2tg0EfhoLWsgwZpMwRa0ejRE=;
 b=FcVpK6V/sn7NAIu/xm+UMPfmn07y3raR9UHoAskwnV/dTOVf8XdmdSVBSQR3jMxY7P
 gW4rx/vwqD2wYKJKg4ovPA7WPyP+CSaiTCJjsY/aZRsJbLcSofr6Bx7ftYzUj9rOlczr
 qPhAl120o2DmpggtHQq8X/VQONKz1aeuutg2bAZ28wmYgcby5gZilDqTDaolmAZr5FHh
 0E63nlm7yiMk7vVScthD0Owoz6yYPoMJSVGZz1fxMchQaiZslj/R2IRMNfA6NOgl6mVV
 5SYAtuqLMdICCOJhsJhVPcIO4DmQXULrHB6AcP4EdO1XLkOUj1pKkzuUfvf/dx0KS3jb
 e0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lEXsKF9hWGiU6RhM1jR2tg0EfhoLWsgwZpMwRa0ejRE=;
 b=XIbjvBtlOLzro2qy+G8OoryVW712FQhjb7q55dPNq7UnfSeDee3B4vUQMysuMwOJxA
 RksFX9Yd3ZGNMMGlT+LvXwURq3Y3Ltq7KFxfEEm3WkjvqngL0SZctQ6oJLCS3PZRtA2/
 UrpK37/nZwzkwK1Nju99WjyfYhkslNYFSAmU5obgt+LsKL95KQB/j5uj+/+iVHvIutFQ
 4G4sbs+OQ9jovk1BZwiOaTDDBTwIzWoi0E1qYaJVXxhUKiIiuRyA5pRtFLSDufatrtvr
 NaXXMuBbt+8f5mUpYTIJMpIr+mPnWaSUsVRjuLdOdy7znptqOJtVgqBMYazVkDVU0vOl
 hqcA==
X-Gm-Message-State: AOAM533PbQqS3wQAhHcf9MjUotosMPLNzqsO1ZbnXc2cdlezVIzKvks7
 A2nkzO2+ryBTzS4esxuvYBkEF3lMld4=
X-Google-Smtp-Source: ABdhPJx7msNB/9Vq44BkJ8W/HrDIdk0NPo12RLbu6O30LzBRjc1baVnFt+gmQpgpGPGeI38tnpEWmw==
X-Received: by 2002:a17:90a:6782:: with SMTP id
 o2mr10278820pjj.165.1629895043959; 
 Wed, 25 Aug 2021 05:37:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-119-33.tpgi.com.au.
 [193.116.119.33])
 by smtp.gmail.com with ESMTPSA id j6sm22043162pfi.220.2021.08.25.05.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 05:37:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] powerpc/64s/perf: add power_pmu_wants_prompt_pmi to
 say whether perf wants PMIs to be soft-NMI
Date: Wed, 25 Aug 2021 22:37:12 +1000
Message-Id: <20210825123714.706201-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210825123714.706201-1-npiggin@gmail.com>
References: <20210825123714.706201-1-npiggin@gmail.com>
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

Interrupt code enables MSR[EE] in some irq handlers while keeping local
irqs disabled via soft-mask, allowing PMI interrupts to be taken as
soft-NMI to improve profiling of irq handlers.

When perf is not enabled, there is no point to doing this, it's
additional overhead. So provide a function that can say if PMIs should
be taken promptly if possible.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h |  2 ++
 arch/powerpc/perf/core-book3s.c   | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

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
index bb0ee716de91..771f49aea8f4 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -17,6 +17,7 @@
 #include <asm/firmware.h>
 #include <asm/ptrace.h>
 #include <asm/code-patching.h>
+#include <asm/hw_irq.h>
 #include <asm/interrupt.h>
 
 #ifdef CONFIG_PPC64
@@ -2380,6 +2381,33 @@ static void perf_event_interrupt(struct pt_regs *regs)
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
+	/* Could this simply test local_paca->pmcregs_in_use? */
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

