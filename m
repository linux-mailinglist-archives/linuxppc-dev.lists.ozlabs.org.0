Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9397A785031
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 07:55:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BvUIc7yu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVwRC39Glz3cCg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 15:55:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BvUIc7yu;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVwPK4JfTz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 15:53:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692770005;
	bh=6zhe36UKUmBT+aimyIqtl+Kbg4x+K5mg92VyZJAmTGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BvUIc7yu8Bnf4OJVQ9ZQODcCLVPHr6I7dhPzpW6bTrydk3rsNEzBJb8a19Cu/pANr
	 v386anixoiJZqhhAoZ57oo7CX9Oi79tHhV6qWDMJPViAooaHLyh2jm7zIjFNfBg98u
	 +u2agbk/My4yT/BaPko958iaxhNU7fqBYkXUjAbVPZwA70oCfq6dggDgo9S1dSj7KF
	 xY/83C1Qh8aBB/vkmsON7GeO61epLCZDQkocAqCERn3b17GxxB/HU9IGYcQbO/w/jJ
	 YYpWBi+Q5jJvWL/COX3rjANqL75/UbVvmdKu3BFvzwI3KoUtoK0ThAEuKgKUJuKr+h
	 KFlqoo6E0NrKg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RVwPK2xWnz4x0W;
	Wed, 23 Aug 2023 15:53:25 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 4/4] powerpc/pseries: Rework lppaca_shared_proc() to avoid DEBUG_PREEMPT
Date: Wed, 23 Aug 2023 15:53:17 +1000
Message-ID: <20230823055317.751786-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823055317.751786-1-mpe@ellerman.id.au>
References: <20230823055317.751786-1-mpe@ellerman.id.au>
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
Cc: ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

lppaca_shared_proc() takes a pointer to the lppaca which is typically
accessed through get_lppaca().  With DEBUG_PREEMPT enabled, this leads
to checking if preemption is enabled, for example:

  BUG: using smp_processor_id() in preemptible [00000000] code: grep/10693
  caller is lparcfg_data+0x408/0x19a0
  CPU: 4 PID: 10693 Comm: grep Not tainted 6.5.0-rc3 #2
  Call Trace:
    dump_stack_lvl+0x154/0x200 (unreliable)
    check_preemption_disabled+0x214/0x220
    lparcfg_data+0x408/0x19a0
    ...

This isn't actually a problem however, as it does not matter which
lppaca is accessed, the shared proc state will be the same.
vcpudispatch_stats_procfs_init() already works around this by disabling
preemption, but the lparcfg code does not, erroring any time
/proc/powerpc/lparcfg is accessed with DEBUG_PREEMPT enabled.

Instead of disabling preemption on the caller side, rework
lppaca_shared_proc() to not take a pointer and instead directly access
the lppaca, bypassing any potential preemption checks.

Fixes: f13c13a00512 ("powerpc: Stop using non-architected shared_proc field in lppaca")
Signed-off-by: Russell Currey <ruscur@russell.cc>
[mpe: Rework to avoid needing a definition in paca.h and lppaca.h]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20230808005317.20374-1-ruscur@russell.cc
---
 arch/powerpc/include/asm/lppaca.h        | 11 +++++++++--
 arch/powerpc/platforms/pseries/lpar.c    | 10 +---------
 arch/powerpc/platforms/pseries/lparcfg.c |  4 ++--
 arch/powerpc/platforms/pseries/setup.c   |  2 +-
 drivers/cpuidle/cpuidle-pseries.c        |  8 +-------
 5 files changed, 14 insertions(+), 21 deletions(-)

v2: mpe, rework based on the preceeding header untangling patches.

diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index b6a63fa0965f..61ec2447dabf 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -23,6 +23,7 @@
 #include <asm/types.h>
 #include <asm/mmu.h>
 #include <asm/firmware.h>
+#include <asm/paca.h>
 
 /*
  * The lppaca is the "virtual processor area" registered with the hypervisor,
@@ -105,14 +106,20 @@ struct lppaca {
  */
 #define LPPACA_OLD_SHARED_PROC		2
 
-static inline bool lppaca_shared_proc(struct lppaca *l)
+#ifdef CONFIG_PPC_PSERIES
+/*
+ * All CPUs should have the same shared proc value, so directly access the PACA
+ * to avoid false positives from DEBUG_PREEMPT.
+ */
+static inline bool lppaca_shared_proc(void)
 {
+	struct lppaca *l = local_paca->lppaca_ptr;
+
 	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
 		return false;
 	return !!(l->__old_status & LPPACA_OLD_SHARED_PROC);
 }
 
-#ifdef CONFIG_PPC_PSERIES
 #define get_lppaca()	(get_paca()->lppaca_ptr)
 #endif
 
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 27fb656bd6ba..f2cb62148f36 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -640,16 +640,8 @@ static const struct proc_ops vcpudispatch_stats_freq_proc_ops = {
 
 static int __init vcpudispatch_stats_procfs_init(void)
 {
-	/*
-	 * Avoid smp_processor_id while preemptible. All CPUs should have
-	 * the same value for lppaca_shared_proc.
-	 */
-	preempt_disable();
-	if (!lppaca_shared_proc(get_lppaca())) {
-		preempt_enable();
+	if (!lppaca_shared_proc())
 		return 0;
-	}
-	preempt_enable();
 
 	if (!proc_create("powerpc/vcpudispatch_stats", 0600, NULL,
 					&vcpudispatch_stats_proc_ops))
diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index 8acc70509520..1c151d77e74b 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -206,7 +206,7 @@ static void parse_ppp_data(struct seq_file *m)
 	           ppp_data.active_system_procs);
 
 	/* pool related entries are appropriate for shared configs */
-	if (lppaca_shared_proc(get_lppaca())) {
+	if (lppaca_shared_proc()) {
 		unsigned long pool_idle_time, pool_procs;
 
 		seq_printf(m, "pool=%d\n", ppp_data.pool_num);
@@ -560,7 +560,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 		   partition_potential_processors);
 
 	seq_printf(m, "shared_processor_mode=%d\n",
-		   lppaca_shared_proc(get_lppaca()));
+		   lppaca_shared_proc());
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!radix_enabled())
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index bb0a9aeb50f9..ecea85c74c43 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -849,7 +849,7 @@ static void __init pSeries_setup_arch(void)
 	if (firmware_has_feature(FW_FEATURE_LPAR)) {
 		vpa_init(boot_cpuid);
 
-		if (lppaca_shared_proc(get_lppaca())) {
+		if (lppaca_shared_proc()) {
 			static_branch_enable(&shared_processor);
 			pv_spinlocks_init();
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index a7d33f3ee01e..14db9b7d985d 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -414,13 +414,7 @@ static int __init pseries_idle_probe(void)
 		return -ENODEV;
 
 	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
-		/*
-		 * Use local_paca instead of get_lppaca() since
-		 * preemption is not disabled, and it is not required in
-		 * fact, since lppaca_ptr does not need to be the value
-		 * associated to the current CPU, it can be from any CPU.
-		 */
-		if (lppaca_shared_proc(local_paca->lppaca_ptr)) {
+		if (lppaca_shared_proc()) {
 			cpuidle_state_table = shared_states;
 			max_idle_state = ARRAY_SIZE(shared_states);
 		} else {
-- 
2.41.0

