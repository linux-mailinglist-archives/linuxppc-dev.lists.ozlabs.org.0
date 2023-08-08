Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E160F773594
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 02:54:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=SUvvBPxW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Pf6G8+kx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKZTQ4y33z3bYg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:54:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=SUvvBPxW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Pf6G8+kx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=lists.ozlabs.org)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKZSM2Bhyz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 10:53:38 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 0D2BF5C00CA;
	Mon,  7 Aug 2023 20:53:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 07 Aug 2023 20:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1691456012; x=1691542412; bh=qBMMrh7VrW
	7fjEYBm2m0oQsOcjSmEBabbV0yY+gnnII=; b=SUvvBPxWqPleUqgZvKeDrds7n6
	PV9TiZeGA9ZgtCE8usQcn/jX+Sk4zosTNZPcV+yvV+1MVXf7XOgho9kfdoL2HV4j
	Lt9eefaW/ZphgeLwjurKhGhJ50ZM90qXpYluejDNuP6Y+gdHTIW4DCGfCe2dOWkX
	A8u6sA7kBukaC0sDeSTqY8GnFRufwIIseaz9ck3yQHH31pRsbSwXb5KjUSGrEnst
	omHLqRbX9jq0IhgxQnYSF6HBAL/G62ZEv4wCcHDcSzX+HhLPARHiHLQ0+Z8L1PRs
	PR5CYRm9xV79WXJfIh0gKmlaZlbTXpZgSe+mMT7Gp3XKi2FnXLsRw8zZZBtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691456012; x=1691542412; bh=qBMMrh7VrW7fj
	EYBm2m0oQsOcjSmEBabbV0yY+gnnII=; b=Pf6G8+kxqQauAKrh4ZhBVUE37JAky
	p6JDGoBNXf06+3oDA2bulEGAyLPCKyrM+rvVqhyvzvvIZKZ70zb9jabTzCCNPWbF
	18Qd16fWLx6NGKxsnKI5SL22jC0iTd6fJ/unDKvZzhI6Iqnym95+Z+yUayzLgCAU
	s8Ice632qaxgVbk7u2Pxe0XKvFDplY/OQ1yVkZm+V9noBA1KR5mwTyhsiZuBAUnd
	h28D+OjdakSSluXWXZWF4nJrsARZS48dV6Tm52a6l8uYFYglr7GmVIi8qBt76/mj
	PDgMzcr6lnOnnD0rGVh5PyfA4yjtpKKh1553zeoWDGn9Km0BRkbf9cCiw==
X-ME-Sender: <xms:C5LRZDd8WvUh6PYALIXfS_T4Cc7Xv1GSSrLrzN47OM7lHCnQL9Qd-w>
    <xme:C5LRZJNpyj_1B5tMnrhySRfiof2OlasYQgfm3iMbIaSUcu8aIWdyHy7ps5z7nYXlh
    n3XDYOD7CrOCS5qeQ>
X-ME-Received: <xmr:C5LRZMhd7chCA6oj_UCll77rcHCfOCJPSnahF3uV_GsqiKNJoYrcQJ4duYAooM4ojmLyfe__Mdx9EvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrledugdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgih
    uceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepvdegud
    etjefgveevvedutdeigeelueffvefhfeeuheeuffekhfffheegheejhfdtnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruh
    hsshgvlhhlrdgttg
X-ME-Proxy: <xmx:C5LRZE8KlvgPJ8AwHt1bLNO27WP6SdMpoHZA9QOHUTcUhEr1jkyJ7g>
    <xmx:C5LRZPshPeS0WCHaLfhfOgnC84i3pMEA2jAwYyyk7yse4dCwb1IicQ>
    <xmx:C5LRZDGW2ZiCm-HBp_3eJHmR2wCc58YPTNL2BrdlxlXW_90KbxyfNQ>
    <xmx:DJLRZN1rDUL0LKIxpnusfh5Lh6--VDYZgUwC2Dv_BYOLm1j6uiw_6A>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Aug 2023 20:53:30 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: Rework lppaca_shared_proc() to avoid DEBUG_PREEMPT
Date: Tue,  8 Aug 2023 10:53:17 +1000
Message-ID: <20230808005317.20374-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.41.0
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
Cc: Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
---
Fixes tag might be a bit overkill.
---
 arch/powerpc/include/asm/lppaca.h        |  9 ++++++++-
 arch/powerpc/include/asm/paca.h          |  5 +++++
 arch/powerpc/platforms/pseries/lpar.c    | 10 +---------
 arch/powerpc/platforms/pseries/lparcfg.c |  4 ++--
 arch/powerpc/platforms/pseries/setup.c   |  2 +-
 drivers/cpuidle/cpuidle-pseries.c        |  8 +-------
 6 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index 34d44cb17c87..c12e1a6e3595 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -127,7 +127,14 @@ struct lppaca {
  */
 #define LPPACA_OLD_SHARED_PROC		2
 
-static inline bool lppaca_shared_proc(struct lppaca *l)
+/*
+ * All CPUs should have the same shared proc value, so directly access the PACA
+ * to avoid false positives from DEBUG_PREEMPT.
+ *
+ * local_paca can't be referenced directly from lppaca.h, hence the macro.
+ */
+#define lppaca_shared_proc() (__lppaca_shared_proc(local_paca->lppaca_ptr))
+static inline bool __lppaca_shared_proc(struct lppaca *l)
 {
 	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
 		return false;
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index cb325938766a..f77337b92ccf 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -49,6 +49,11 @@ extern unsigned int debug_smp_processor_id(void); /* from linux/smp.h */
 
 #ifdef CONFIG_PPC_PSERIES
 #define get_lppaca()	(get_paca()->lppaca_ptr)
+/*
+ * All CPUs should have the same shared proc value, so directly access the PACA
+ * to avoid false positives from DEBUG_PREEMPT.
+ */
+#define lppaca_shared_proc() (__lppaca_shared_proc(local_paca->lppaca_ptr))
 #endif
 
 #define get_slb_shadow()	(get_paca()->slb_shadow_ptr)
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 2eab323f6970..cb2f1211f7eb 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -639,16 +639,8 @@ static const struct proc_ops vcpudispatch_stats_freq_proc_ops = {
 
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
index e2a57cfa6c83..0ef2a7e014aa 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -847,7 +847,7 @@ static void __init pSeries_setup_arch(void)
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

