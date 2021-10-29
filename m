Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0E43F90E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 10:39:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgbTP2bzBz3c8m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 19:39:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ASGzRmud;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ASGzRmud; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgbSm51k5z2xDC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 19:39:19 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id oa4so6722709pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 01:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z1LMjtf6sv3VduBDcLz/rWi/ykb31MiONeeu/3Mt8/M=;
 b=ASGzRmudDEB4hA5uE6MyDaAYocz5xIuLwzMnMSzmrNYwfTcJx6Ca+V/WarRjIlv7b6
 PwVyglusPoK8OS3JOrz4TH9hpMkTz2wcMfG699sUVuMCp/5j6CBM1RXFK533fseYVb27
 o3tmEc+MKYvwtmnJ5RkqtzjhM2cv2eRJfw6za8UHn6hf3sFNK47Y2yVxR4sPxF0fQogo
 F1mKn7CZleOpWlWnwPHpC2Ib7L1yJMbNRukzk8u0YQf8rG5BXHn6eZ1RVUO5I4BdJEMm
 ACaOO7jMkmW1G4R8JaqrKNg5QKLEsPJdEw8jZHJJ4ssRANNDQx6gDL9jFSrw7SIT/dzE
 cdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z1LMjtf6sv3VduBDcLz/rWi/ykb31MiONeeu/3Mt8/M=;
 b=bHrbFxhsqgYyXzMGCCRo9K+rK66BmkY+7lQALwkLTW1HezbRVq1KRLgjvWotRxZLXI
 F10s1f7wYoYyqJZYqbwFz9ymI66JSmwA7OCTNZVD2Yk9DcFSjiGrsc32Cnd8ZZT7U10m
 2CEle0tJWxYKXJwM/GgPyKE87FfOyy2HvhLAQ7soKI3yJRv9b0q/yG6JHLA0DI7jqtj5
 jJe46Pe/Zn0dzicM2hca3/cHrdP1H9xp5YUW7Ev5Tq6H8JfUUR049kZeydooUdFnWW54
 KsLsnSbD7PGe7VHfD7p1VZCFHLmEAq1KnTTlkoekV1YSvtcRfNayTxoXkO0PPEVerau+
 5wgA==
X-Gm-Message-State: AOAM533w+9nuNyYtcdItWalLfvSqOPFt4jvsHYXdAPOK4VkbNmPLErif
 PqX71n+rUThsraumF+n8Q6WtfS7ozpw=
X-Google-Smtp-Source: ABdhPJzGAW4mCoeGlNd1buWWShR+sSnvGopgZHdo0Ud3WQCeTXJqpF8JJ9fXF4uP88wBUApjl9Ux5A==
X-Received: by 2002:a17:90a:9a8e:: with SMTP id
 e14mr9213376pjp.231.1635496754739; 
 Fri, 29 Oct 2021 01:39:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id g8sm6211765pfv.123.2021.10.29.01.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 01:39:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/watchdog: Fix missed watchdog reset due to memory
 ordering race
Date: Fri, 29 Oct 2021 18:39:07 +1000
Message-Id: <20211029083908.87931-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
 arch/powerpc/kernel/watchdog.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index f9ea0e5357f9..4bb7c8e371a2 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -215,13 +215,38 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 
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
@@ -312,8 +337,12 @@ void arch_touch_nmi_watchdog(void)
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

