Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDD4456E3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 12:33:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwZKf1m14z3c9T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 22:33:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qCT1kEhD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qCT1kEhD; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwZJH1V2Xz2yw7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 22:31:58 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id g18so9143257pfk.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 03:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P8cKd/ap7gRxKSNxNnKNhjT9PDh6i5QuBJKJNrshI1I=;
 b=qCT1kEhD3At4G7r33uxKXw3zuGWT9mVaOAmvgdy7CJHEVEtfkhROvFQmqoBFt6kdQs
 G44Whig+McXv/v0WI1n/fGYkHPQWcQazOHpHnguesZca1pWQVz87OYdnOR752tNqJ8fb
 zfxNOijCBVhr7dh8TfZcIVphHbUNW0UxOb07FpgTL0dzIg2URSc5xu4Y27OIlz/cA0SG
 MLqMlmf+pA2O6iOhEYvLr6/QFIOdiXAzVwVqKI4VEVtPJ8yMM33KK2KwKsPLNk4p8muv
 QOK0AmIEPfaml9290HAHLtdUJhQUGcr8sAmbAjUIrGGFEf1WzQCx3QX7OMIrDyLEZH4R
 qOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P8cKd/ap7gRxKSNxNnKNhjT9PDh6i5QuBJKJNrshI1I=;
 b=I9vN4tsXDvBJVYwE1GcuY4GscTli0AZuAfoVvBk7PcglWnp0M/P44nvIn1/6PoPASb
 Ds/8/mkQ+el7KnLIC3zfBZJw8BtJdS1rzeN72xP/YmeSH/FY3Xzjf0N9pGcqze34+Lji
 9bBqKwjxR5p6hULd8Zg7KtlDzkWL7Tgpg0QhCz9FDt4fMedKt8kNxsBRW9du6lu8I2xA
 57OyWmwbAngjVHdUw99UwlXeeMuXTY3KAZd2xBM3jc9v+SniP0ij64mIU0KWec3TxEF7
 u1SwTa0p5oZ05+i1FFw6of4bmBwC4bwdrtoP9PZxDJwUT93P1kG4vV/edlS8k2XQviBD
 x4/Q==
X-Gm-Message-State: AOAM532jBZ0yJpFQg1s2L51RTyg/2JDqUf0irPS5TNYnGHCvwJyI/C3W
 n8FY9So9vvWCMInzaZn45HKoHRKpp+o=
X-Google-Smtp-Source: ABdhPJwq2Wsowms5H9lkM6y9y2hMqSccgV0RTuXCYdo6+2nWCioTt3g6MEEUoNXVVFidm90JSNLD6A==
X-Received: by 2002:a62:8f93:0:b0:49f:ed44:54ac with SMTP id
 n141-20020a628f93000000b0049fed4454acmr63589331pfd.72.1637321516298; 
 Fri, 19 Nov 2021 03:31:56 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-240-2-228.tpgi.com.au. [60.240.2.228])
 by smtp.gmail.com with ESMTPSA id
 g17sm2632626pfv.136.2021.11.19.03.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 03:31:56 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 1/5] powerpc/watchdog: Fix missed watchdog reset due to
 memory ordering race
Date: Fri, 19 Nov 2021 21:31:42 +1000
Message-Id: <20211119113146.752759-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211119113146.752759-1-npiggin@gmail.com>
References: <20211119113146.752759-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
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
Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/watchdog.c | 41 +++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 3fa6d240bade..ad94a2c6b733 100644
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
@@ -221,13 +225,44 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 
 			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
 			wd_smp_unlock(&flags);
+		} else {
+			/*
+			 * The last CPU to clear pending should have reset the
+			 * watchdog so we generally should not find it empty
+			 * here if our CPU was clear. However it could happen
+			 * due to a rare race with another CPU taking the
+			 * last CPU out of the mask concurrently.
+			 *
+			 * We can't add a warning for it. But just in case
+			 * there is a problem with the watchdog that is causing
+			 * the mask to not be reset, try to kick it along here.
+			 */
+			if (unlikely(cpumask_empty(&wd_smp_cpus_pending)))
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
@@ -318,8 +353,12 @@ void arch_touch_nmi_watchdog(void)
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

