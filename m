Return-Path: <linuxppc-dev+bounces-10127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEAEAFA2DC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jul 2025 05:23:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZXl36pQCz2yRD;
	Sun,  6 Jul 2025 13:23:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=136.143.188.15 arc.chain=zohomail.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751772207;
	cv=pass; b=GMSEA83kp5uxf7y7NYrhnYvnuGh6n1MlFTlzmGpR5ld2s1lOhQWkFeHiQqy7H48mWK6iFcu7AGK9Ign5yQNBiOUMeA4KFOZkhl+LrAx4GVkF8UAene1pyChOKQT4mNKL/HH02wyjUkLiG/dumkzvcyknUVJp1CydV+/dBLQ0FmawyR+hQBOcSvL4M3Wrr0AB+bjvqKbbBDJoqRJV4tMKWMklk8uzKhjsEGAkRuCES6CDLi2QZyL2mMfwZurNnDWGa75pk0QR8jb23iWLuYuprN+sc8xLy4AbVLpbMo0q8i7GZCeKNVP2GeU6XaHtyUdSn/1+nTPEeBT+YgMOe5Pm7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751772207; c=relaxed/relaxed;
	bh=jePSSp++5Batv5PK3k9r42c2ScL6/PQrLL8WfPRMBYI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DI94QrHW2aa2ehNiWOI04SGIJg68tcE/6m/ay1sRhZgX5v9bW599yT0BEySeXUjDIrRCLi22Lu8bwc3VEx5UA7KaE58mCJxuz5+Xxxdp2/hyfx1t8co+rkddri/RjI7iQtCBrJzXhQw84VBX1gvxWJLiwYhqv5L8WLxkOtmhiP/iMrioz0mcgFw73tD/5oIU0BBwX4iueMNLhGWkJF0jHZQhvUqHZUYdtPZUCoOyHgkyDqA6sALws89TN//Za1JnF9afUawxmC2moAf3Fc0UqiZQwAwzT9mpt9xFjTuR3MQYQ0QtQ3oDHlRlEjocAavD5eoeV/ADrpSZHGgRAusTzA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux.beauty; dkim=pass (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.a=rsa-sha256 header.s=zmail header.b=n/85JIut; dkim-atps=neutral; spf=pass (client-ip=136.143.188.15; helo=sender4-op-o15.zoho.com; envelope-from=me@linux.beauty; receiver=lists.ozlabs.org) smtp.mailfrom=linux.beauty
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.a=rsa-sha256 header.s=zmail header.b=n/85JIut;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.beauty (client-ip=136.143.188.15; helo=sender4-op-o15.zoho.com; envelope-from=me@linux.beauty; receiver=lists.ozlabs.org)
X-Greylist: delayed 907 seconds by postgrey-1.37 at boromir; Sun, 06 Jul 2025 13:23:26 AEST
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bZXl23Vvzz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jul 2025 13:23:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1751771224; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BANOU2jht3RDtVqHFtPKzQFFX64aZ9pNNhCxDSPZ5o4rFU3pY8BB9ufK6On5Ro7fYeO5yUfmYRP2kJ7Q7pYdXa85MLJCtmgCyytA2rnEMGwQuzJxOfuCPX8WyXa383o2V5BxMEGz4EvWL8VRqdQbyrufidet65E3MLt/uxt3Njc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751771224; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=jePSSp++5Batv5PK3k9r42c2ScL6/PQrLL8WfPRMBYI=; 
	b=HtMuRgmCMpd0TDfSFbGbgHeQEzXnZTlNfJU3Q/AGKRSSEv/dpCDQE1AXqEaulX9dzvhEi7uPm8FkKSdeqEtBKxILLNi0ot7OK8z5Sjqs+u/2JIYPZHPnqMICM4Ve0rBx9i5IzBF8Js3DTe+/vpA27WfkyOzmTIfn3WqGnlp/eCc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751771224;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=jePSSp++5Batv5PK3k9r42c2ScL6/PQrLL8WfPRMBYI=;
	b=n/85JIutx8NKp8cgQQQcnme0fbNI1Md8Bo347hSfTgCCepfJwTHYrMoXbChrSoAL
	Jw533PBuKIhVmTsAQ+EntIH+85wGK7WQWwtVpgq71Sv75bSQAIKYgWZ5mjOci6vwFQl
	xJr7g9fZSvZx7KQKUI6AZ8JQwym7AHl5Rz89i6O4=
Received: by mx.zohomail.com with SMTPS id 1751771221451549.3655482599792;
	Sat, 5 Jul 2025 20:07:01 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Li Chen  <me@linux.beauty>," Thomas Gleixner "<tglx@linutronix.de>," Ingo Molnar "<mingo@redhat.com>," Borislav Petkov "<bp@alien8.de>," Dave Hansen "<dave.hansen@linux.intel.com>,<x86@kernel.org>," H . Peter Anvin "<hpa@zytor.com>," Rafael J . Wysocki "<rafael.j.wysocki@intel.com>," Peter Zijlstra "<peterz@infradead.org>," Sohil Mehta "<sohil.mehta@intel.com>," Brian Gerst "<brgerst@gmail.com>," Patryk Wlazlyn " <patryk.wlazlyn@linux.intel.com>,
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
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Bibo Mao <maobibo@loongson.cn>,
	Li Chen <chenl311@chinatelecom.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tobias Huschle <huschle@linux.ibm.com>,
	Mete Durlu <meted@linux.ibm.com>,
	Joel Granados <joel.granados@kernel.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org
Subject: [PATCH v4 1/4] smpboot: introduce SDTL() helper to tidy sched topology setup
Date: Sun,  6 Jul 2025 11:06:29 +0800
Message-ID: <20250706030636.397197-2-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250706030636.397197-1-me@linux.beauty>
References: <20250706030636.397197-1-me@linux.beauty>
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

Define a small SDTL(maskfn, flagsfn, name) macro and use it to build the
sched_domain_topology_level. Purely a cleanup; behaviour is unchanged.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/powerpc/kernel/smp.c      | 34 +++++++++++++---------------------
 arch/s390/kernel/topology.c    | 10 +++++-----
 arch/x86/kernel/smpboot.c      | 21 ++++++---------------
 include/linux/sched/topology.h |  6 +++---
 kernel/sched/topology.c        | 16 ++++++----------
 5 files changed, 33 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5ac7084eebc0b..b05995e272134 100644
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
+			SDTL(smallcore_smt_mask, powerpc_smt_flags, SMT);
+	} else
+		powerpc_topology[i++] = SDTL(cpu_smt_mask, powerpc_smt_flags, SMT);
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
+			SDTL(shared_cache_mask, powerpc_shared_cache_flags, CACHE);
+
+	if (has_coregroup_support())
+		powerpc_topology[i++] =
+			SDTL(cpu_mc_mask, powerpc_shared_proc_flags, MC);
+
+	powerpc_topology[i++] = SDTL(cpu_cpu_mask, powerpc_shared_proc_flags, PKG);
 
 	/* There must be one trailing NULL entry left.  */
 	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index 3df048e190b11..ccf5dcc56f86d 100644
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
+	SDTL(cpu_thread_mask, cpu_smt_flags, SMT),
+	SDTL(cpu_coregroup_mask, cpu_core_flags, MC),
+	SDTL(cpu_book_mask, NULL, BOOK),
+	SDTL(cpu_drawer_mask, NULL, DRAWER),
+	SDTL(cpu_cpu_mask, NULL, PKG),
 	{ NULL, },
 };
 
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 58ede3fa6a75b..55f09946c791b 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -485,35 +485,26 @@ static void __init build_sched_topology(void)
 	int i = 0;
 
 #ifdef CONFIG_SCHED_SMT
-	x86_topology[i++] = (struct sched_domain_topology_level){
-		cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
-	};
+	x86_topology[i++] = SDTL(cpu_smt_mask, cpu_smt_flags, SMT);
 #endif
 #ifdef CONFIG_SCHED_CLUSTER
-	x86_topology[i++] = (struct sched_domain_topology_level){
-		cpu_clustergroup_mask, x86_cluster_flags, SD_INIT_NAME(CLS)
-	};
+	x86_topology[i++] = SDTL(cpu_clustergroup_mask, x86_cluster_flags, CLS);
 #endif
 #ifdef CONFIG_SCHED_MC
-	x86_topology[i++] = (struct sched_domain_topology_level){
-		cpu_coregroup_mask, x86_core_flags, SD_INIT_NAME(MC)
-	};
+	x86_topology[i++] = SDTL(cpu_coregroup_mask, x86_core_flags, MC);
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
+		x86_topology[i++] = SDTL(cpu_cpu_mask, x86_sched_itmt_flags, PKG);
 
 	/*
 	 * There must be one trailing NULL entry left.
 	 */
-	BUG_ON(i >= ARRAY_SIZE(x86_topology)-1);
+	BUG_ON(i >= ARRAY_SIZE(x86_topology) - 1);
 
 	set_sched_topology(x86_topology);
 }
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 198bb5cc1774b..0b53e372c445c 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -197,9 +197,9 @@ struct sched_domain_topology_level {
 extern void __init set_sched_topology(struct sched_domain_topology_level *tl);
 extern void sched_update_asym_prefer_cpu(int cpu, int old_prio, int new_prio);
 
-
-# define SD_INIT_NAME(type)		.name = #type
-
+#define SDTL(maskfn, flagsfn, dname) \
+	((struct sched_domain_topology_level) \
+	    { .mask = maskfn, .sd_flags = flagsfn, .name = #dname, .numa_level = 0 })
 #else /* CONFIG_SMP */
 
 struct sched_domain_attr;
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index b958fe48e0205..e6ec65ae4b75d 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1739,17 +1739,17 @@ sd_init(struct sched_domain_topology_level *tl,
  */
 static struct sched_domain_topology_level default_topology[] = {
 #ifdef CONFIG_SCHED_SMT
-	{ cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT) },
+	SDTL(cpu_smt_mask, cpu_smt_flags, SMT),
 #endif
 
 #ifdef CONFIG_SCHED_CLUSTER
-	{ cpu_clustergroup_mask, cpu_cluster_flags, SD_INIT_NAME(CLS) },
+	SDTL(cpu_clustergroup_mask, cpu_cluster_flags, CLS),
 #endif
 
 #ifdef CONFIG_SCHED_MC
-	{ cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
+	SDTL(cpu_coregroup_mask, cpu_core_flags, MC),
 #endif
-	{ cpu_cpu_mask, SD_INIT_NAME(PKG) },
+	SDTL(cpu_cpu_mask, NULL, PKG),
 	{ NULL, },
 };
 
@@ -2010,11 +2010,7 @@ void sched_init_numa(int offline_node)
 	/*
 	 * Add the NUMA identity distance, aka single NODE.
 	 */
-	tl[i++] = (struct sched_domain_topology_level){
-		.mask = sd_numa_mask,
-		.numa_level = 0,
-		SD_INIT_NAME(NODE)
-	};
+	tl[i++] = SDTL(sd_numa_mask, NULL, NODE);
 
 	/*
 	 * .. and append 'j' levels of NUMA goodness.
@@ -2025,7 +2021,7 @@ void sched_init_numa(int offline_node)
 			.sd_flags = cpu_numa_flags,
 			.flags = SDTL_OVERLAP,
 			.numa_level = j,
-			SD_INIT_NAME(NUMA)
+			.name = "NUMA",
 		};
 	}
 
-- 
2.49.0


