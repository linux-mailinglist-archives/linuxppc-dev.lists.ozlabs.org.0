Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 444503ECF6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 09:31:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp5T51Rd1z3cVx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 17:31:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=AMXyeqEu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AMXyeqEu; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp5R21P2dz30GM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 17:30:06 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id a20so19843091plm.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 00:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m1IbMUZr64tIxxt6maNEwfTRa+n09Ar1wO7efkCJ4Ew=;
 b=AMXyeqEuHNtBMscgwnyTA78joUrPfoa2pTunC9/AnRKvb8qv+zI0fw/KmGVbq26LIb
 Bp4NCnL0hgXHK5SpB8oOCsig9bkgdeZBTtWF7CZ+yLsuecLqJZS6yzzfFYktQiUhMgif
 y/Nb7FA1mSvwaN8Vh6ZNq/AyNvMfbdjxJje2ekMq9o5I1OWDhPa489e3RfJgeL6J/Xzk
 A7fJ7cVO1ww5w8X26wqnWskKYPuzS7tmeFiRfWJ8lwHfnwCyGhkHJ5chpiWdAqTbNBUL
 LZM7BA2USlMX0WU1wesVAaSG686ySgfJt4FVZXTsMqedV3A8CJINFnlOoOW/yGNcafsx
 nSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m1IbMUZr64tIxxt6maNEwfTRa+n09Ar1wO7efkCJ4Ew=;
 b=lI5Dv4UdyLpMWapTEEIeavCAbyZPXJyYA2l9XrwpTqk7qC+jqna4alpno17zkOpFzq
 aapcp/KGTVnMYS+dYpxCZy7yRy5AEkOZKS9Wi8GEDCiNrxn+sIGJLMFUqlounmck6a4T
 3Gn7ynFvDPFzF8RQ/HS57/4n6UEwild/bd6lJ7qefUd2Iq/M0tKMccUvUv7dIoqzJJCd
 XIbq0SdeJ5cALh0fdvKBTaSpGd7EQF0g1PCauvJN+aeVzUE1yx+3v9iqwVnJFXlcN/EP
 2FhbyvviDzTbjrx3niW8TLJI0Xtr/yxUyvz7FIHRiMOOW1TvY86SVZ5LSzo4FmfF6jK3
 jzvg==
X-Gm-Message-State: AOAM530e6ijl0+8LXK8SxKRBtkKrE+X5Z6JLz/35OajYfCUDrkLpB6vQ
 4bQApM/6MetrXo7QSDYSJ8e1SfpQDXU=
X-Google-Smtp-Source: ABdhPJyfJ1YadIr6QV0wtXW8Imm31VJojJD/PoV3JIjnefR2GFvgF8H+w5d66lg0wvy/y78WcofvDw==
X-Received: by 2002:a62:ee11:0:b029:3e0:88dc:193f with SMTP id
 e17-20020a62ee110000b02903e088dc193fmr14696710pfi.78.1629099003867; 
 Mon, 16 Aug 2021 00:30:03 -0700 (PDT)
Received: from bobo.ibm.com (203-219-120-52.tpgi.com.au. [203.219.120.52])
 by smtp.gmail.com with ESMTPSA id e7sm10543887pfc.145.2021.08.16.00.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 00:30:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 2/4] powerpc/64s/perf: add power_pmu_running to query
 whether perf is being used
Date: Mon, 16 Aug 2021 17:29:51 +1000
Message-Id: <20210816072953.1165964-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210816072953.1165964-1-npiggin@gmail.com>
References: <20210816072953.1165964-1-npiggin@gmail.com>
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

Interrupt handling code would like to know whether perf is enabled, to
know whether it should enable MSR[EE] to improve PMI coverage.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h |  2 ++
 arch/powerpc/perf/core-book3s.c   | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 21cc571ea9c2..2d5c0d3ccbb6 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -306,6 +306,8 @@ static inline bool lazy_irq_pending_nocheck(void)
 	return __lazy_irq_pending(local_paca->irq_happened);
 }
 
+bool power_pmu_running(void);
+
 /*
  * This is called by asynchronous interrupts to conditionally
  * re-enable hard interrupts after having cleared the source
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index bb0ee716de91..76114a9afb2b 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2380,6 +2380,19 @@ static void perf_event_interrupt(struct pt_regs *regs)
 	perf_sample_event_took(sched_clock() - start_clock);
 }
 
+bool power_pmu_running(void)
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

