Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9446844BA74
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 03:52:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpqBs3pjPz2yg8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 13:52:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=paiKvltt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=paiKvltt; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpq9T6sLhz2xsW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 13:51:09 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso366355pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 18:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kEmYjox+QuDMws3phC67i9F0cfE/0cAPphSB03lwsdk=;
 b=paiKvlttzLvzhnYxkOq8WTDE4P5u0BcahdGgVAMigG1yfH+LVkZY3EzirHzUugT6cX
 ogjbvjC3MmbVSD494cYNEbe3qpfdIBnlEuasgmxEndw04FbQvX8hzBRUhttNvwWepJ5Y
 eH9SLOtKhf03m3naldgQsp/t7B8el0rrW7+zfjmpC5ryf71ppw1jAYk8Mi0yF/FoZf4U
 oFUw4dRJOwjPbrVLR6nXk9zITzt8QtMYRI2tuUw1XIfg8nypyVLTuTXTG7vo1W/DvwLW
 SK6FPohux5tjJCZM6vjcV24WJFEWcWeWiOh5vB//kz8FijJfAx9NLtOsgs4U2IQfVCEH
 n31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kEmYjox+QuDMws3phC67i9F0cfE/0cAPphSB03lwsdk=;
 b=WQjPNARnnzdEZb1JHQR40+fyPEw7OhBuPtMThg3eg+fL/O0BjeMOIagyq39h0GnELR
 m6HGWf37VhLyg6hmfszm0OM0UkEKGeKrXT4nbWWDUWVojxTYKFWe3/tXceJsL67Gu3RR
 43FYQB19CF697KMcHvD/Fx0jomxNb4Tvz4spiJl7E/5xhI1yrTqee8IFDGl2RQwJn/Pu
 NJ4eELtHugQI6H29xrOWxvshtexNVzaXCTyy2buZ2DQZsVWsjOfryMrKhMdKQEoEPceP
 oWgd/Tfq1slfsV+BIUA4/sV06ppELAWYWIPLuO+HQlVeYqVunwXC0lvwVQZRdHQg8Ym8
 ukFA==
X-Gm-Message-State: AOAM530d2ie2KCii5KW2DGjYY51f/RiqizXwTVqVKIvOSl3KRBobDcAl
 ybjfQTvJ0KVuBOg62EVNSzGxtTNOtQrYDA==
X-Google-Smtp-Source: ABdhPJwzfaffRA8oUMHq+eS/nGTDywYjXZfn0lULgw1N2vM8Qjmj8KOgWYTU1Bvnxr4ymWBzizfevw==
X-Received: by 2002:a17:90a:a513:: with SMTP id
 a19mr13132532pjq.26.1636512667197; 
 Tue, 09 Nov 2021 18:51:07 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.146.48.179])
 by smtp.gmail.com with ESMTPSA id b4sm21604406pfl.60.2021.11.09.18.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 18:51:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/4] powerpc/watchdog: Fix missed watchdog reset due to
 memory ordering race
Date: Wed, 10 Nov 2021 12:50:53 +1000
Message-Id: <20211110025056.2084347-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211110025056.2084347-1-npiggin@gmail.com>
References: <20211110025056.2084347-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/watchdog.c | 41 +++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index f9ea0e5357f9..3c60872b6a2c 100644
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
@@ -215,13 +219,44 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 
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
@@ -312,8 +347,12 @@ void arch_touch_nmi_watchdog(void)
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

