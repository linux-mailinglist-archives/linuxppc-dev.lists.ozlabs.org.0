Return-Path: <linuxppc-dev+bounces-10174-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C0AFFFDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jul 2025 12:59:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdBg12t4fz30VZ;
	Thu, 10 Jul 2025 20:59:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=136.143.188.15 arc.chain=zohomail.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752145149;
	cv=pass; b=me+N2gP/d9cBogzIOEonrUtD0p8YhINfpzZjR/EJewOi3DH8AjYh4M/VRy4OwJVhs9eSidVsIrl/IjEPqpNLL90ogVnGlLHbWH1SVQI125TFt8ihrfcqS7YqZn7KbK1SrVQrbqcEuNrCKm9DksEp4wBjd2GhlalKfLs7YGr8+ps9ghD5cwF2mXLpz4v0VP+uxKUQ/GvP60PGrgI28F6F6sRmrHsEWdzZB61fa4ZBUyJf5BZLJy41yVUINyn/WVroZSeta692JiUFlZJfAGZFdPI/I3TfBM6AWrIBIa3HYTV+q4eHHAy/I58lAE8hFVMIyamnwHTZOryq+QO8gyhsfA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752145149; c=relaxed/relaxed;
	bh=fovm6MYKiboCe5FxyWaHfC+A2oY5VAqlOylsUIo+kbo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qx7AslH0OJgQmXVwn7kUtqqQLoudjW7yD9g4QNC39qhNBR5eNRdugXYfRqzslG32WQW4kRMhMzO8juK9OTaMhOE+UM/7GXlVFPe2/OcuZiq9aPOoUGKFu6Bfd604zIvPwzq8Fx6YFMS8QCAq5Uv7GjumEnRG0whiA2TAYV6YK8AqoAxGGAXoAoJHJ/sCRP3dyAQ9VS3m7kQ3zzVBh7qJB9Z5mCGAExgay3ytrx2hxlSa3dveGuF/SevheiPg81kaBqgPkQdq9oQuorCljx+h7g9CwjFMbjRLrKpGd4TlKnDNolA9N7di0W3MTRhLZZccrY5dpHk442757P5+HVdd0g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux.beauty; dkim=pass (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.a=rsa-sha256 header.s=zmail header.b=XG/EuUFr; dkim-atps=neutral; spf=pass (client-ip=136.143.188.15; helo=sender4-op-o15.zoho.com; envelope-from=me@linux.beauty; receiver=lists.ozlabs.org) smtp.mailfrom=linux.beauty
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.a=rsa-sha256 header.s=zmail header.b=XG/EuUFr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.beauty (client-ip=136.143.188.15; helo=sender4-op-o15.zoho.com; envelope-from=me@linux.beauty; receiver=lists.ozlabs.org)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdBg00cCHz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jul 2025 20:59:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1752145052; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZBGAHjspqPm4xCjCCo138Zi9x3j/3l1KpbRRGtuh4JEiWlqzVu2tAkirgwQBSb4wXy2vFcXnlthtxBSroK8ovXg6uOjLK9ZP7OWGn/BxxksB9rO5lW7yz213Te8uyly/jfCAuZYo9tmJXjr4HrDvOdE0bvfVW0lD9UkZSUU5jok=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752145052; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=fovm6MYKiboCe5FxyWaHfC+A2oY5VAqlOylsUIo+kbo=; 
	b=HiYjxHRpCQmXGSXVqRWXAdSk0tmJhrIgD5hqIaOWPznJimODP5H3U6hMr3AytUzbX5y8xzzpWmGhrW/zYm6z8U5S+obDwLvDk4EiCEQfuHzczNnzhXyXWRtAtACppzYv6/tQYNLe/O1FqNWU1AlmlNpuoQIHjJHzCfBpDEf+5S4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752145052;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=fovm6MYKiboCe5FxyWaHfC+A2oY5VAqlOylsUIo+kbo=;
	b=XG/EuUFr+Dd3e5Kj/dqUEReF1ky87KXHsTziwAlxhnoYtxCWLbqWQYg1nWdAsQRs
	W3YcXaSCPPKz0C9Dzaro97Wf68bHl12Ulkxktc8R6yLHUxYCQagpjD5oistX7CGArDR
	5BdlAHAKtIJsRS3X22wefieFt+q1DMj2TvTxVfpM=
Received: by mx.zohomail.com with SMTPS id 1752145051054917.4579948465466;
	Thu, 10 Jul 2025 03:57:31 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: "Thomas Gleixner" <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"Sohil Mehta" <sohil.mehta@intel.com>,
	"Brian Gerst" <brgerst@gmail.com>,
	"Patryk Wlazlyn" <patryk.wlazlyn@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Li Chen <chenl311@chinatelecom.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>,
	Tobias Huschle <huschle@linux.ibm.com>,
	Mete Durlu <meted@linux.ibm.com>,
	Joel Granados <joel.granados@kernel.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org
Subject: [PATCH v5 1/4] smpboot: introduce SDTL_INIT() helper to tidy sched topology setup
Date: Thu, 10 Jul 2025 18:57:07 +0800
Message-ID: <20250710105715.66594-2-me@linux.beauty>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710105715.66594-1-me@linux.beauty>
References: <20250710105715.66594-1-me@linux.beauty>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Li Chen <chenl311@chinatelecom.cn>

Define a small SDTL_INIT(maskfn, flagsfn, name) macro and use it to build the
sched_domain_topology_level array. Purely a cleanup; behaviour is unchanged.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 arch/powerpc/kernel/smp.c      | 34 +++++++++++++---------------------
 arch/s390/kernel/topology.c    | 10 +++++-----
 arch/x86/kernel/smpboot.c      | 21 ++++++---------------
 include/linux/sched/topology.h |  4 ++--
 kernel/sched/topology.c        | 24 ++++++++----------------
 5 files changed, 34 insertions(+), 59 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5ac7084eebc0b..0b7ab7d2eb142 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1700,28 +1700,20 @@ static void __init build_sched_topology(void)
 #ifdef CONFIG_SCHED_SMT
 	if (has_big_cores) {
 		pr_info("Big cores detected but using small core scheduling\n");
-		powerpc_topology[i++] = (struct sched_domain_topology_level){
-			smallcore_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT)
-		};
-	} else {
-		powerpc_topology[i++] = (struct sched_domain_topology_level){
-			cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT)
-		};
-	}
+		powerpc_topology[i++] =
+			SDTL_INIT(smallcore_smt_mask, powerpc_smt_flags, SMT);
+	} else
+		powerpc_topology[i++] = SDTL_INIT(cpu_smt_mask, powerpc_smt_flags, SMT);
 #endif
-	if (shared_caches) {
-		powerpc_topology[i++] = (struct sched_domain_topology_level){
-			shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE)
-		};
-	}
-	if (has_coregroup_support()) {
-		powerpc_topology[i++] = (struct sched_domain_topology_level){
-			cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC)
-		};
-	}
-	powerpc_topology[i++] = (struct sched_domain_topology_level){
-		cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(PKG)
-	};
+	if (shared_caches)
+		powerpc_topology[i++] =
+			SDTL_INIT(shared_cache_mask, powerpc_shared_cache_flags, CACHE);
+
+	if (has_coregroup_support())
+		powerpc_topology[i++] =
+			SDTL_INIT(cpu_mc_mask, powerpc_shared_proc_flags, MC);
+
+	powerpc_topology[i++] = SDTL_INIT(cpu_cpu_mask, powerpc_shared_proc_flags, PKG);
 
 	/* There must be one trailing NULL entry left.  */
 	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index 3df048e190b11..46569b8e47dde 100644
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -531,11 +531,11 @@ static const struct cpumask *cpu_drawer_mask(int cpu)
 }
 
 static struct sched_domain_topology_level s390_topology[] = {
-	{ cpu_thread_mask, cpu_smt_flags, SD_INIT_NAME(SMT) },
-	{ cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
-	{ cpu_book_mask, SD_INIT_NAME(BOOK) },
-	{ cpu_drawer_mask, SD_INIT_NAME(DRAWER) },
-	{ cpu_cpu_mask, SD_INIT_NAME(PKG) },
+	SDTL_INIT(cpu_thread_mask, cpu_smt_flags, SMT),
+	SDTL_INIT(cpu_coregroup_mask, cpu_core_flags, MC),
+	SDTL_INIT(cpu_book_mask, NULL, BOOK),
+	SDTL_INIT(cpu_drawer_mask, NULL, DRAWER),
+	SDTL_INIT(cpu_cpu_mask, NULL, PKG),
 	{ NULL, },
 };
 
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 58ede3fa6a75b..445127df2cb19 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -485,35 +485,26 @@ static void __init build_sched_topology(void)
 	int i = 0;
 
 #ifdef CONFIG_SCHED_SMT
-	x86_topology[i++] = (struct sched_domain_topology_level){
-		cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
-	};
+	x86_topology[i++] = SDTL_INIT(cpu_smt_mask, cpu_smt_flags, SMT);
 #endif
 #ifdef CONFIG_SCHED_CLUSTER
-	x86_topology[i++] = (struct sched_domain_topology_level){
-		cpu_clustergroup_mask, x86_cluster_flags, SD_INIT_NAME(CLS)
-	};
+	x86_topology[i++] = SDTL_INIT(cpu_clustergroup_mask, x86_cluster_flags, CLS);
 #endif
 #ifdef CONFIG_SCHED_MC
-	x86_topology[i++] = (struct sched_domain_topology_level){
-		cpu_coregroup_mask, x86_core_flags, SD_INIT_NAME(MC)
-	};
+	x86_topology[i++] = SDTL_INIT(cpu_coregroup_mask, x86_core_flags, MC);
 #endif
 	/*
 	 * When there is NUMA topology inside the package skip the PKG domain
 	 * since the NUMA domains will auto-magically create the right spanning
 	 * domains based on the SLIT.
 	 */
-	if (!x86_has_numa_in_package) {
-		x86_topology[i++] = (struct sched_domain_topology_level){
-			cpu_cpu_mask, x86_sched_itmt_flags, SD_INIT_NAME(PKG)
-		};
-	}
+	if (!x86_has_numa_in_package)
+		x86_topology[i++] = SDTL_INIT(cpu_cpu_mask, x86_sched_itmt_flags, PKG);
 
 	/*
 	 * There must be one trailing NULL entry left.
 	 */
-	BUG_ON(i >= ARRAY_SIZE(x86_topology)-1);
+	BUG_ON(i >= ARRAY_SIZE(x86_topology) - 1);
 
 	set_sched_topology(x86_topology);
 }
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index e54e7fa76ba63..0d5daaa277b75 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -196,8 +196,8 @@ struct sched_domain_topology_level {
 extern void __init set_sched_topology(struct sched_domain_topology_level *tl);
 extern void sched_update_asym_prefer_cpu(int cpu, int old_prio, int new_prio);
 
-
-# define SD_INIT_NAME(type)		.name = #type
+#define SDTL_INIT(maskfn, flagsfn, dname) ((struct sched_domain_topology_level) \
+	    { .mask = maskfn, .sd_flags = flagsfn, .name = #dname })
 
 #if defined(CONFIG_ENERGY_MODEL) && defined(CONFIG_CPU_FREQ_GOV_SCHEDUTIL)
 extern void rebuild_sched_domains_energy(void);
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 8e06b1d22e91e..d01f5a49f2e7a 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1737,17 +1737,17 @@ sd_init(struct sched_domain_topology_level *tl,
  */
 static struct sched_domain_topology_level default_topology[] = {
 #ifdef CONFIG_SCHED_SMT
-	{ cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT) },
+	SDTL_INIT(cpu_smt_mask, cpu_smt_flags, SMT),
 #endif
 
 #ifdef CONFIG_SCHED_CLUSTER
-	{ cpu_clustergroup_mask, cpu_cluster_flags, SD_INIT_NAME(CLS) },
+	SDTL_INIT(cpu_clustergroup_mask, cpu_cluster_flags, CLS),
 #endif
 
 #ifdef CONFIG_SCHED_MC
-	{ cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
+	SDTL_INIT(cpu_coregroup_mask, cpu_core_flags, MC),
 #endif
-	{ cpu_cpu_mask, SD_INIT_NAME(PKG) },
+	SDTL_INIT(cpu_cpu_mask, NULL, PKG),
 	{ NULL, },
 };
 
@@ -2008,23 +2008,15 @@ void sched_init_numa(int offline_node)
 	/*
 	 * Add the NUMA identity distance, aka single NODE.
 	 */
-	tl[i++] = (struct sched_domain_topology_level){
-		.mask = sd_numa_mask,
-		.numa_level = 0,
-		SD_INIT_NAME(NODE)
-	};
+	tl[i++] = SDTL_INIT(sd_numa_mask, NULL, NODE);
 
 	/*
 	 * .. and append 'j' levels of NUMA goodness.
 	 */
 	for (j = 1; j < nr_levels; i++, j++) {
-		tl[i] = (struct sched_domain_topology_level){
-			.mask = sd_numa_mask,
-			.sd_flags = cpu_numa_flags,
-			.flags = SDTL_OVERLAP,
-			.numa_level = j,
-			SD_INIT_NAME(NUMA)
-		};
+		tl[i] = SDTL_INIT(sd_numa_mask, cpu_numa_flags, NUMA);
+		tl[i].numa_level = j;
+		tl[i].flags = SDTL_OVERLAP;
 	}
 
 	sched_domain_topology_saved = sched_domain_topology;
-- 
2.50.0


