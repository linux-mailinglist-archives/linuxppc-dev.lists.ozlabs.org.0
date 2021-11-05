Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0EE445EDF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 04:51:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlmlQ35zCz301j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 14:51:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gWvwH233;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gWvwH233; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlmkk5x8xz2xtw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 14:50:53 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso2488409pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 20:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a9ktfIBPTIRNYfZsBFN5A8xWgwK5plAOwbdw0XcPlFE=;
 b=gWvwH233AI53D5it0HsAj+auWiUQP1Fjrq7i/gXJT52ymdEC+hmnE0mSFL36Yx9no7
 m0vyQYyN3/rCrapheRr0fM6kExe3INWYMRGUgJwI9bQNCk1vjQfWjkYEqaK1dQ1+xNxh
 9/Z93vt4hBDqJU5Cf265WM4xWM42NlnUURUnnGDup7cKypFdajqi479dmhx46pP6b9lP
 azq1Sh5ble820Aca/u9YnYxX27CqMukXbjUR8XNHopCTvo7i+LCEbTJt3e0VV5NnnwSR
 Wk40vMMV934j9QKbgSJ9q5OmS88u3hpROi48iGPdCZi+uvSbNrsf5xcVyFG8mWqqWRbY
 7YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a9ktfIBPTIRNYfZsBFN5A8xWgwK5plAOwbdw0XcPlFE=;
 b=diuMqO8KZBLKAlFl7cpnI6sepeCxURxw+sOQ+I4L7M0LV5WNHkV7mp4B//WsuzCxyb
 bxqglq8VQtf6cROLw+pYkufiGmUlBodQC11a7OrS1FnP+LkgOw/y/FBS70rRBW2/NXtD
 vR3rI7enVMI1NPw3Om8vO48ibchFyIAem2rbgCkHt7ZdYD0gRoZqErURVk1NKgm6HBQm
 PHiGTM9dPGB6Aj0nKx14wpxzdab/W/6uUDIfDlnwkCOfVLtyLMZ7sSoB0nF9uZoz4d3i
 vqyhKL5/US0V0bfIYEj/N03ERHj4J6OUlgth1XhJfubT3z1efAp1U0yogUwzMHr2imTf
 i7sQ==
X-Gm-Message-State: AOAM530/6msNB6lxyt8MAk0TcTEPb5kyaeyvTBYLFexF9M2MhBUGMvts
 oMLkpEFJR3Tg1d3gFLbZKFjPHeBSDXQ=
X-Google-Smtp-Source: ABdhPJwBnDbZUIhmr3NBLyMqrLI959OEmIO56Yf/8hOcF3npBF3qrKns7W258xn4UkuO+mLLagpHHg==
X-Received: by 2002:a17:90b:3509:: with SMTP id
 ls9mr27289629pjb.99.1636084250534; 
 Thu, 04 Nov 2021 20:50:50 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 q9sm6496222pfj.88.2021.11.04.20.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:50:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc: remove cpu_online_cores_map function
Date: Fri,  5 Nov 2021 13:50:41 +1000
Message-Id: <20211105035042.1398309-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This function builds the cores online map with on-stack cpumasks which
can cause high stack usage with large NR_CPUS.

It is not used in any performance sensitive paths, so instead just check
for first thread sibling.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/cputhreads.h     | 33 -----------------------
 arch/powerpc/platforms/powernv/idle.c     | 10 +++----
 arch/powerpc/platforms/powernv/opal-imc.c |  6 ++---
 3 files changed, 8 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/include/asm/cputhreads.h b/arch/powerpc/include/asm/cputhreads.h
index b167186aaee4..f26c430f3982 100644
--- a/arch/powerpc/include/asm/cputhreads.h
+++ b/arch/powerpc/include/asm/cputhreads.h
@@ -32,44 +32,11 @@ extern cpumask_t threads_core_mask;
 #define threads_core_mask	(*get_cpu_mask(0))
 #endif
 
-/* cpu_thread_mask_to_cores - Return a cpumask of one per cores
- *                            hit by the argument
- *
- * @threads:	a cpumask of online threads
- *
- * This function returns a cpumask which will have one online cpu's
- * bit set for each core that has at least one thread set in the argument.
- *
- * This can typically be used for things like IPI for tlb invalidations
- * since those need to be done only once per core/TLB
- */
-static inline cpumask_t cpu_thread_mask_to_cores(const struct cpumask *threads)
-{
-	cpumask_t	tmp, res;
-	int		i, cpu;
-
-	cpumask_clear(&res);
-	for (i = 0; i < NR_CPUS; i += threads_per_core) {
-		cpumask_shift_left(&tmp, &threads_core_mask, i);
-		if (cpumask_intersects(threads, &tmp)) {
-			cpu = cpumask_next_and(-1, &tmp, cpu_online_mask);
-			if (cpu < nr_cpu_ids)
-				cpumask_set_cpu(cpu, &res);
-		}
-	}
-	return res;
-}
-
 static inline int cpu_nr_cores(void)
 {
 	return nr_cpu_ids >> threads_shift;
 }
 
-static inline cpumask_t cpu_online_cores_map(void)
-{
-	return cpu_thread_mask_to_cores(cpu_online_mask);
-}
-
 #ifdef CONFIG_SMP
 int cpu_core_index_of_thread(int cpu);
 int cpu_first_thread_of_core(int core);
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index e3ffdc8e8567..70da314fd2d7 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -146,9 +146,13 @@ EXPORT_SYMBOL_GPL(pnv_get_supported_cpuidle_states);
 static void pnv_fastsleep_workaround_apply(void *info)
 
 {
+	int cpu = smp_processor_id();
 	int rc;
 	int *err = info;
 
+	if (cpu_first_thread_sibling(cpu) != cpu)
+		return;
+
 	rc = opal_config_cpu_idle_state(OPAL_CONFIG_IDLE_FASTSLEEP,
 					OPAL_CONFIG_IDLE_APPLY);
 	if (rc)
@@ -175,7 +179,6 @@ static ssize_t store_fastsleep_workaround_applyonce(struct device *dev,
 		struct device_attribute *attr, const char *buf,
 		size_t count)
 {
-	cpumask_t primary_thread_mask;
 	int err;
 	u8 val;
 
@@ -200,10 +203,7 @@ static ssize_t store_fastsleep_workaround_applyonce(struct device *dev,
 	power7_fastsleep_workaround_exit = false;
 
 	cpus_read_lock();
-	primary_thread_mask = cpu_online_cores_map();
-	on_each_cpu_mask(&primary_thread_mask,
-				pnv_fastsleep_workaround_apply,
-				&err, 1);
+	on_each_cpu(pnv_fastsleep_workaround_apply, &err, 1);
 	cpus_read_unlock();
 	if (err) {
 		pr_err("fastsleep_workaround_applyonce change failed while running pnv_fastsleep_workaround_apply");
diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
index 05d3832019b9..3fea5da6d1b3 100644
--- a/arch/powerpc/platforms/powernv/opal-imc.c
+++ b/arch/powerpc/platforms/powernv/opal-imc.c
@@ -200,13 +200,13 @@ static void disable_nest_pmu_counters(void)
 
 static void disable_core_pmu_counters(void)
 {
-	cpumask_t cores_map;
 	int cpu, rc;
 
 	cpus_read_lock();
 	/* Disable the IMC Core functions */
-	cores_map = cpu_online_cores_map();
-	for_each_cpu(cpu, &cores_map) {
+	for_each_online_cpu(cpu) {
+		if (cpu_first_thread_sibling(cpu) != cpu)
+			continue;
 		rc = opal_imc_counters_stop(OPAL_IMC_COUNTERS_CORE,
 					    get_hard_smp_processor_id(cpu));
 		if (rc)
-- 
2.23.0

