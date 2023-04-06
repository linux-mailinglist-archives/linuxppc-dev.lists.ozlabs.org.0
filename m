Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C8E6D9B27
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 16:51:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pskw16cSWz3g8V
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 00:51:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dzSZ31Zx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Psknv1T5tz3gFs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 00:45:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dzSZ31Zx;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pskns2WsXz4xDt;
	Fri,  7 Apr 2023 00:45:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680792353;
	bh=K5G4sSTXgNXS7YdhIg4VtzOB7UwPzbyCN9hXlUrIQvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dzSZ31ZxAODsLSMGjrCaYgfR9gKyzhjdYKrfNIMn0CDQndzCxdPFO8KHIitb0bX4M
	 GJASLOjAAAgJgqy3T7w8jhoi8tkKS6k5i9OYrfsCn6N4alSJvviCIZbr79a5MhzLRq
	 GAl/hha49Aj5oMACTF5mFPJ+LjP382+LIJoE/9EYFjf3w8imVlvYO4WNmz4WdOa+R9
	 swSg9tVF4Owh6a+dAldDRH3NgwMdWQjNk5teVP/IRKP5LdlKN4B65/hDNMgMOFGr+d
	 R/5xFryNVv+HkHxlHJOxRGxqyL6GQPmMJduocioTeJ2al9LUOWgj8K6ay5IeyXTAe+
	 PptM3lvbmt23Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/4] cpuidle: pseries: Mark ->enter() functions as __cpuidle
Date: Fri,  7 Apr 2023 00:45:34 +1000
Message-Id: <20230406144535.3786008-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406144535.3786008-1-mpe@ellerman.id.au>
References: <20230406144535.3786008-1-mpe@ellerman.id.au>
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Code in the idle path is not allowed to be instrumented because RCU is
disabled, see commit 0e985e9d2286 ("cpuidle: Add comments about
noinstr/__cpuidle usage").

Mark the cpuidle ->enter() callbacks as __cpuidle and use the
raw_local_irq_*() routines to ensure that is the case.

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/cpuidle/cpuidle-pseries.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index 1bad4d2b7be3..a7d33f3ee01e 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -33,16 +33,16 @@ static struct cpuidle_state *cpuidle_state_table __read_mostly;
 static u64 snooze_timeout __read_mostly;
 static bool snooze_timeout_en __read_mostly;
 
-static int snooze_loop(struct cpuidle_device *dev,
-			struct cpuidle_driver *drv,
-			int index)
+static __cpuidle
+int snooze_loop(struct cpuidle_device *dev, struct cpuidle_driver *drv,
+		int index)
 {
 	u64 snooze_exit_time;
 
 	set_thread_flag(TIF_POLLING_NRFLAG);
 
 	pseries_idle_prolog();
-	local_irq_enable();
+	raw_local_irq_enable();
 	snooze_exit_time = get_tb() + snooze_timeout;
 	dev->poll_time_limit = false;
 
@@ -65,14 +65,14 @@ static int snooze_loop(struct cpuidle_device *dev,
 	HMT_medium();
 	clear_thread_flag(TIF_POLLING_NRFLAG);
 
-	local_irq_disable();
+	raw_local_irq_disable();
 
 	pseries_idle_epilog();
 
 	return index;
 }
 
-static void check_and_cede_processor(void)
+static __cpuidle void check_and_cede_processor(void)
 {
 	/*
 	 * Ensure our interrupt state is properly tracked,
@@ -216,9 +216,9 @@ static int __init parse_cede_parameters(void)
 #define NR_DEDICATED_STATES	2 /* snooze, CEDE */
 static u8 cede_latency_hint[NR_DEDICATED_STATES];
 
-static int dedicated_cede_loop(struct cpuidle_device *dev,
-				struct cpuidle_driver *drv,
-				int index)
+static __cpuidle
+int dedicated_cede_loop(struct cpuidle_device *dev, struct cpuidle_driver *drv,
+			int index)
 {
 	u8 old_latency_hint;
 
@@ -230,7 +230,7 @@ static int dedicated_cede_loop(struct cpuidle_device *dev,
 	HMT_medium();
 	check_and_cede_processor();
 
-	local_irq_disable();
+	raw_local_irq_disable();
 	get_lppaca()->donate_dedicated_cpu = 0;
 	get_lppaca()->cede_latency_hint = old_latency_hint;
 
@@ -239,9 +239,9 @@ static int dedicated_cede_loop(struct cpuidle_device *dev,
 	return index;
 }
 
-static int shared_cede_loop(struct cpuidle_device *dev,
-			struct cpuidle_driver *drv,
-			int index)
+static __cpuidle
+int shared_cede_loop(struct cpuidle_device *dev, struct cpuidle_driver *drv,
+		     int index)
 {
 
 	pseries_idle_prolog();
@@ -255,7 +255,7 @@ static int shared_cede_loop(struct cpuidle_device *dev,
 	 */
 	check_and_cede_processor();
 
-	local_irq_disable();
+	raw_local_irq_disable();
 	pseries_idle_epilog();
 
 	return index;
-- 
2.39.2

