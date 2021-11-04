Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9BB4456F6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 17:13:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlTGH6lzhz3c56
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 03:13:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ia/x/79Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ia/x/79Z; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlTCS6ymhz2xtK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 03:11:16 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id t21so8008533plr.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=irRoHoDcVIoPo5Pnpm+nVKEhbytq293MLsLEgsiQD38=;
 b=ia/x/79Z0nSvK/UarrFbLnfUFNMMonPZe8Nil673V5Wojr6pRMd2l6xFCegwoa3pL0
 ulLzJ9N9xrMTjiebvb9y/XVqlUl/1oYGRyEfLJx0Y9ibjDh+swB59023AyZeKyzEe4f1
 puqRdBrLBOQS+osiDQM7onR0fOXcJys3CULn3t5ULkRyVZda5sUULFJF6loJlbFoPIXZ
 9Y2n67FnExkk05Z7DVUcgv0eb/lgjyK3+WAQxEqaF5wNXpRX8/xqcEw52RUbHr2Fs3tY
 1MQ1Ge0f18railZgsxr3/ANaB/wdtkudwufqdL6CG1Ohp+RnGaDtnp9E5a7aEi3823xz
 egfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=irRoHoDcVIoPo5Pnpm+nVKEhbytq293MLsLEgsiQD38=;
 b=5x1D/Q7r4g9AFFTFrBoZzTAOR2vn5gLNPUb69+OSBsXqfD+aXkzYstfXNp+y6WC6tO
 3Qss+vzTOHwBq/OvazQkdf3XtELaCiiW5wtiyT+gbE9vW4vgZuEFyuFfOpBCaGe9NJtV
 hGV5JL91THNyA9RZgsDN+SjR3NNtW/dPeQK7dEjF8s9UdJHj7F4/Lieg03sNegBRkp08
 XAsN0s39yRj2a4Loj5yFl5GeDxMAzhuUYUIMSw4nE3RgKXCwVRKKpa67VROzvV/SB+CG
 jm/uPp9p+sL80Gx5W0vOIxUy7aON7mpQV6X9IPa3yQrd8VC0nqor3TUI6VtBzbVX43Dr
 SK0A==
X-Gm-Message-State: AOAM530/wj9szjzh/EljsazK7MhiY/wbqw/dP93L8V3z6zIi/E1iDNWS
 TIfNN1/QLuDt9otUnJQu+7YEWjamlSQ=
X-Google-Smtp-Source: ABdhPJyxTWdb5kRUHjxuYFzOEyROq9SMJ50lw8UGwLiOV4O9d0EGZy7ZIyEKK9pO+OUMS1Hls5F/eA==
X-Received: by 2002:a17:90b:1648:: with SMTP id
 il8mr8147132pjb.246.1636042265379; 
 Thu, 04 Nov 2021 09:11:05 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 h3sm5897890pfi.207.2021.11.04.09.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 09:11:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/5] powerpc/watchdog: Fix missed watchdog reset due to
 memory ordering race
Date: Fri,  5 Nov 2021 02:10:53 +1000
Message-Id: <20211104161057.1255659-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211104161057.1255659-1-npiggin@gmail.com>
References: <20211104161057.1255659-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is possible for all CPUs to miss the pending cpumask becoming clear,
and then nobody resetting it, which will cause the lockup detector to
stop working. It will eventually expire, but watchdog_smp_panic will
avoid doing anything if the pending mask is clear and it will never be
reset.

Order the cpumask clear vs the subsequent test to close this race.

Add an extra check for an empty pending mask when the watchdog fires and
finds its bit still clear, to try to catch any other possible races or
bugs here and keep the watchdog working. The extra test in
arch_touch_nmi_watchdog is required to prevent the new warning from
firing off.

Debugged-by: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/watchdog.c | 36 +++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index f9ea0e5357f9..be80071336a4 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -135,6 +135,10 @@ static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
 {
 	cpumask_or(&wd_smp_cpus_stuck, &wd_smp_cpus_stuck, cpumask);
 	cpumask_andnot(&wd_smp_cpus_pending, &wd_smp_cpus_pending, cpumask);
+	/*
+	 * See wd_smp_clear_cpu_pending()
+	 */
+	smp_mb();
 	if (cpumask_empty(&wd_smp_cpus_pending)) {
 		wd_smp_last_reset_tb = tb;
 		cpumask_andnot(&wd_smp_cpus_pending,
@@ -215,13 +219,39 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 
 			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
 			wd_smp_unlock(&flags);
+		} else {
+			/*
+			 * The last CPU to clear pending should have reset the
+			 * watchdog, yet we find it empty here. This should not
+			 * happen but we can try to recover and avoid a false
+			 * positive if it does.
+			 */
+			if (WARN_ON_ONCE(cpumask_empty(&wd_smp_cpus_pending)))
+				goto none_pending;
 		}
 		return;
 	}
+
 	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
+
+	/*
+	 * Order the store to clear pending with the load(s) to check all
+	 * words in the pending mask to check they are all empty. This orders
+	 * with the same barrier on another CPU. This prevents two CPUs
+	 * clearing the last 2 pending bits, but neither seeing the other's
+	 * store when checking if the mask is empty, and missing an empty
+	 * mask, which ends with a false positive.
+	 */
+	smp_mb();
 	if (cpumask_empty(&wd_smp_cpus_pending)) {
 		unsigned long flags;
 
+none_pending:
+		/*
+		 * Double check under lock because more than one CPU could see
+		 * a clear mask with the lockless check after clearing their
+		 * pending bits.
+		 */
 		wd_smp_lock(&flags);
 		if (cpumask_empty(&wd_smp_cpus_pending)) {
 			wd_smp_last_reset_tb = tb;
@@ -312,8 +342,12 @@ void arch_touch_nmi_watchdog(void)
 {
 	unsigned long ticks = tb_ticks_per_usec * wd_timer_period_ms * 1000;
 	int cpu = smp_processor_id();
-	u64 tb = get_tb();
+	u64 tb;
 
+	if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
+		return;
+
+	tb = get_tb();
 	if (tb - per_cpu(wd_timer_tb, cpu) >= ticks) {
 		per_cpu(wd_timer_tb, cpu) = tb;
 		wd_smp_clear_cpu_pending(cpu, tb);
-- 
2.23.0

