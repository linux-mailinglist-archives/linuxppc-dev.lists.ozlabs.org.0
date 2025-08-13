Return-Path: <linuxppc-dev+bounces-10949-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 602CDB250CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:03:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6k4bBtz3cYR;
	Thu, 14 Aug 2025 03:02:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104558;
	cv=none; b=Fe2YdhRYXZw/H+oDYth0Pqj2N0Ak3MAbf0I+RbNLj4cG+SY8ap6idck00Iw3sf9vv0hDzdyYbugi+6QSJfoiOpvD7B+6ySKv1VeEahhxMdSrjgsHUCekLuz+rjHlWWRMSTwATBFjOWq3k3ZhT9EVdoYPTEY5sKG6CNjJAn/qf1rGGB3HRMXORzyK62Gu80UBTYTt1DskwkZ/4kpt5UIJQLTzEbFrUWPtGshLkSeCWoBwvRn3xNY/u0l4SoSw0jLYZpyMmCuF2P+LbSOPBdqn2Z5HEg6dnV7pKqw940B0cIPmyKYB8XBkZMJydPocdEhEkm2WXtXKIF7F9ZJOx08WXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104558; c=relaxed/relaxed;
	bh=9leDqlTwloKcsFxYAmKVFGK4PesEjHuq0/P+M58cvtI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K6S+u6cROx9mRRskQUX5djQyYghgxsjzjy12bwpi7qrm7JU3JK9L1g6jZEs0beRedSM6neZaf145GFaNoh/hbaVvQEEaJQllY9f15XBgTuH/1qStuWHMTqxpJxnEgm+4xGjugt0fF7zgHJJte3/QS70SAnCZ6WlHGmkGkXXrod0fUV1MMTySztIp4fHSIRlgev0cDKS1O22+MPIo9x6RCMEnjvBcAhJ0sPidBt270YacfN1JfnqFSBtJQOlfW4Jr+j6aqH250OtRH7UTWNmvFPHyInsXChMK7KijZViOl1oPD+VoXPoMPuaUEe7S1pi1ZCNhSEfgrN35rNHSKLUflw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6j6cxZz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:37 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 497041E7D;
	Wed, 13 Aug 2025 10:02:29 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 304C73F738;
	Wed, 13 Aug 2025 10:02:33 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	mark.rutland@arm.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	coresight@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 16/19] perf: Introduce positive capability for sampling
Date: Wed, 13 Aug 2025 18:01:08 +0100
Message-Id: <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Sampling is inherently a feature for CPU PMUs, given that the thing
to be sampled is a CPU context. These days, we have many more
uncore/system PMUs than CPU PMUs, so it no longer makes much sense to
assume sampling support by default and force the ever-growing majority
of drivers to opt out of it (or erroneously fail to). Instead, let's
introduce a positive opt-in capability that's more obvious and easier to
maintain.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/alpha/kernel/perf_event.c       |  3 ++-
 arch/arc/kernel/perf_event.c         |  2 ++
 arch/csky/kernel/perf_event.c        |  2 ++
 arch/loongarch/kernel/perf_event.c   |  1 +
 arch/mips/kernel/perf_event_mipsxx.c |  1 +
 arch/powerpc/perf/core-book3s.c      |  1 +
 arch/powerpc/perf/core-fsl-emb.c     |  1 +
 arch/powerpc/perf/imc-pmu.c          |  1 +
 arch/s390/kernel/perf_cpum_cf.c      |  1 +
 arch/s390/kernel/perf_cpum_sf.c      |  2 ++
 arch/s390/kernel/perf_pai_crypto.c   |  1 +
 arch/s390/kernel/perf_pai_ext.c      |  1 +
 arch/sparc/kernel/perf_event.c       |  1 +
 arch/x86/events/amd/ibs.c            |  2 ++
 arch/x86/events/core.c               |  4 +++-
 arch/xtensa/kernel/perf_event.c      |  1 +
 drivers/perf/arm_pmu.c               |  3 ++-
 drivers/perf/arm_pmu_platform.c      |  1 +
 drivers/perf/arm_spe_pmu.c           |  3 ++-
 drivers/perf/riscv_pmu_sbi.c         |  2 ++
 include/linux/perf_event.h           |  3 ++-
 kernel/events/core.c                 | 20 +++++++++++---------
 kernel/events/hw_breakpoint.c        |  1 +
 23 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 8557165e64c0..4de1802d249f 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -761,7 +761,8 @@ static struct pmu pmu = {
 	.start		= alpha_pmu_start,
 	.stop		= alpha_pmu_stop,
 	.read		= alpha_pmu_read,
-	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
+	.capabilities	= PERF_PMU_CAP_SAMPLING |
+			  PERF_PMU_CAP_NO_EXCLUDE,
 };
 
 
diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index ed6d4f0cd621..1b99b0215027 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -818,6 +818,8 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 
 	if (irq == -1)
 		arc_pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
+	else
+		arc_pmu->pmu.capabilities |= PERF_PMU_CAP_SAMPLING;
 
 	/*
 	 * perf parser doesn't really like '-' symbol in events name, so let's
diff --git a/arch/csky/kernel/perf_event.c b/arch/csky/kernel/perf_event.c
index e0a36acd265b..c5ba6e235a6f 100644
--- a/arch/csky/kernel/perf_event.c
+++ b/arch/csky/kernel/perf_event.c
@@ -1204,6 +1204,7 @@ int init_hw_perf_events(void)
 	}
 
 	csky_pmu.pmu = (struct pmu) {
+		.capabilities	= PERF_PMU_CAP_SAMPLING,
 		.pmu_enable	= csky_pmu_enable,
 		.pmu_disable	= csky_pmu_disable,
 		.event_init	= csky_pmu_event_init,
@@ -1314,6 +1315,7 @@ int csky_pmu_device_probe(struct platform_device *pdev,
 
 	ret = csky_pmu_request_irq(csky_pmu_handle_irq);
 	if (ret) {
+		csky_pmu.pmu.capabilities &= ~PERF_PMU_CAP_SAMPLING;
 		csky_pmu.pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 		pr_notice("[perf] PMU request irq fail!\n");
 	}
diff --git a/arch/loongarch/kernel/perf_event.c b/arch/loongarch/kernel/perf_event.c
index 8ad098703488..341b17bedd0e 100644
--- a/arch/loongarch/kernel/perf_event.c
+++ b/arch/loongarch/kernel/perf_event.c
@@ -571,6 +571,7 @@ static int loongarch_pmu_event_init(struct perf_event *event)
 }
 
 static struct pmu pmu = {
+	.capabilities	= PERF_PMU_CAP_SAMPLING,
 	.pmu_enable	= loongarch_pmu_enable,
 	.pmu_disable	= loongarch_pmu_disable,
 	.event_init	= loongarch_pmu_event_init,
diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 196a070349b0..4c5d64d1158e 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -687,6 +687,7 @@ static int mipspmu_event_init(struct perf_event *event)
 }
 
 static struct pmu pmu = {
+	.capabilities	= PERF_PMU_CAP_SAMPLING,
 	.pmu_enable	= mipspmu_enable,
 	.pmu_disable	= mipspmu_disable,
 	.event_init	= mipspmu_event_init,
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index d67f7d511f13..cfe7d3c120e1 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2207,6 +2207,7 @@ ssize_t power_events_sysfs_show(struct device *dev,
 }
 
 static struct pmu power_pmu = {
+	.capabilities	= PERF_PMU_CAP_SAMPLING,
 	.pmu_enable	= power_pmu_enable,
 	.pmu_disable	= power_pmu_disable,
 	.event_init	= power_pmu_event_init,
diff --git a/arch/powerpc/perf/core-fsl-emb.c b/arch/powerpc/perf/core-fsl-emb.c
index 509932b91b75..62038ff3663f 100644
--- a/arch/powerpc/perf/core-fsl-emb.c
+++ b/arch/powerpc/perf/core-fsl-emb.c
@@ -570,6 +570,7 @@ static int fsl_emb_pmu_event_init(struct perf_event *event)
 }
 
 static struct pmu fsl_emb_pmu = {
+	.capabilities	= PERF_PMU_CAP_SAMPLING,
 	.pmu_enable	= fsl_emb_pmu_enable,
 	.pmu_disable	= fsl_emb_pmu_disable,
 	.event_init	= fsl_emb_pmu_event_init,
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 8664a7d297ad..f352dda3baf9 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -1507,6 +1507,7 @@ static int update_pmu_ops(struct imc_pmu *pmu)
 		pmu->pmu.commit_txn = thread_imc_pmu_commit_txn;
 		break;
 	case IMC_DOMAIN_TRACE:
+		pmu->pmu.capabilities |= PERF_PMU_CAP_SAMPLING;
 		pmu->pmu.event_init = trace_imc_event_init;
 		pmu->pmu.add = trace_imc_event_add;
 		pmu->pmu.del = trace_imc_event_del;
diff --git a/arch/s390/kernel/perf_cpum_cf.c b/arch/s390/kernel/perf_cpum_cf.c
index 4d09954ebf49..7d10842d54f0 100644
--- a/arch/s390/kernel/perf_cpum_cf.c
+++ b/arch/s390/kernel/perf_cpum_cf.c
@@ -1861,6 +1861,7 @@ static const struct attribute_group *cfdiag_attr_groups[] = {
  */
 static struct pmu cf_diag = {
 	.task_ctx_nr  = perf_sw_context,
+	.capabilities = PERF_PMU_CAP_SAMPLING,
 	.event_init   = cfdiag_event_init,
 	.pmu_enable   = cpumf_pmu_enable,
 	.pmu_disable  = cpumf_pmu_disable,
diff --git a/arch/s390/kernel/perf_cpum_sf.c b/arch/s390/kernel/perf_cpum_sf.c
index f432869f8921..3d2c400f0aaa 100644
--- a/arch/s390/kernel/perf_cpum_sf.c
+++ b/arch/s390/kernel/perf_cpum_sf.c
@@ -1892,6 +1892,8 @@ static const struct attribute_group *cpumsf_pmu_attr_groups[] = {
 };
 
 static struct pmu cpumf_sampling = {
+	.capabilities = PERF_PMU_CAP_SAMPLING,
+
 	.pmu_enable   = cpumsf_pmu_enable,
 	.pmu_disable  = cpumsf_pmu_disable,
 
diff --git a/arch/s390/kernel/perf_pai_crypto.c b/arch/s390/kernel/perf_pai_crypto.c
index f373a1009c45..a64b6b056a21 100644
--- a/arch/s390/kernel/perf_pai_crypto.c
+++ b/arch/s390/kernel/perf_pai_crypto.c
@@ -569,6 +569,7 @@ static const struct attribute_group *paicrypt_attr_groups[] = {
 /* Performance monitoring unit for mapped counters */
 static struct pmu paicrypt = {
 	.task_ctx_nr  = perf_hw_context,
+	.capabilities = PERF_PMU_CAP_SAMPLING,
 	.event_init   = paicrypt_event_init,
 	.add	      = paicrypt_add,
 	.del	      = paicrypt_del,
diff --git a/arch/s390/kernel/perf_pai_ext.c b/arch/s390/kernel/perf_pai_ext.c
index d827473e7f87..1261f80c6d52 100644
--- a/arch/s390/kernel/perf_pai_ext.c
+++ b/arch/s390/kernel/perf_pai_ext.c
@@ -595,6 +595,7 @@ static const struct attribute_group *paiext_attr_groups[] = {
 /* Performance monitoring unit for mapped counters */
 static struct pmu paiext = {
 	.task_ctx_nr  = perf_hw_context,
+	.capabilities = PERF_PMU_CAP_SAMPLING,
 	.event_init   = paiext_event_init,
 	.add	      = paiext_add,
 	.del	      = paiext_del,
diff --git a/arch/sparc/kernel/perf_event.c b/arch/sparc/kernel/perf_event.c
index 706127749c66..6ecea8e7b592 100644
--- a/arch/sparc/kernel/perf_event.c
+++ b/arch/sparc/kernel/perf_event.c
@@ -1573,6 +1573,7 @@ static int sparc_pmu_commit_txn(struct pmu *pmu)
 }
 
 static struct pmu pmu = {
+	.capabilities	= PERF_PMU_CAP_SAMPLING,
 	.pmu_enable	= sparc_pmu_enable,
 	.pmu_disable	= sparc_pmu_disable,
 	.event_init	= sparc_pmu_event_init,
diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 95de309fc7d5..ed07d80b6fe0 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -768,6 +768,7 @@ static struct perf_ibs perf_ibs_fetch = {
 	.pmu = {
 		.task_ctx_nr	= perf_hw_context,
 
+		.capabilities	= PERF_PMU_CAP_SAMPLING,
 		.event_init	= perf_ibs_init,
 		.add		= perf_ibs_add,
 		.del		= perf_ibs_del,
@@ -793,6 +794,7 @@ static struct perf_ibs perf_ibs_op = {
 	.pmu = {
 		.task_ctx_nr	= perf_hw_context,
 
+		.capabilities	= PERF_PMU_CAP_SAMPLING,
 		.event_init	= perf_ibs_init,
 		.add		= perf_ibs_add,
 		.del		= perf_ibs_del,
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index eca5bb49aa85..72a4c43951ee 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -1837,7 +1837,7 @@ static void __init pmu_check_apic(void)
 	 * sample via a hrtimer based software event):
 	 */
 	pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
-
+	pmu.capabilities &= ~PERF_PMU_CAP_SAMPLING;
 }
 
 static struct attribute_group x86_pmu_format_group __ro_after_init = {
@@ -2698,6 +2698,8 @@ static bool x86_pmu_filter(struct pmu *pmu, int cpu)
 }
 
 static struct pmu pmu = {
+	.capabilities		= PERF_PMU_CAP_SAMPLING,
+
 	.pmu_enable		= x86_pmu_enable,
 	.pmu_disable		= x86_pmu_disable,
 
diff --git a/arch/xtensa/kernel/perf_event.c b/arch/xtensa/kernel/perf_event.c
index 223f1d452310..b03a2feb0f92 100644
--- a/arch/xtensa/kernel/perf_event.c
+++ b/arch/xtensa/kernel/perf_event.c
@@ -397,6 +397,7 @@ irqreturn_t xtensa_pmu_irq_handler(int irq, void *dev_id)
 }
 
 static struct pmu xtensa_pmu = {
+	.capabilities = PERF_PMU_CAP_SAMPLING,
 	.pmu_enable = xtensa_pmu_enable,
 	.pmu_disable = xtensa_pmu_disable,
 	.event_init = xtensa_pmu_event_init,
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 2c1af3a0207c..72d8f38d0aa5 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -876,7 +876,8 @@ struct arm_pmu *armpmu_alloc(void)
 		 * PERF_TYPE_HARDWARE and PERF_TYPE_HW_CACHE events on a
 		 * specific PMU.
 		 */
-		.capabilities	= PERF_PMU_CAP_EXTENDED_REGS |
+		.capabilities	= PERF_PMU_CAP_SAMPLING |
+				  PERF_PMU_CAP_EXTENDED_REGS |
 				  PERF_PMU_CAP_EXTENDED_HW_TYPE,
 	};
 
diff --git a/drivers/perf/arm_pmu_platform.c b/drivers/perf/arm_pmu_platform.c
index 118170a5cede..ab7a802cd0d6 100644
--- a/drivers/perf/arm_pmu_platform.c
+++ b/drivers/perf/arm_pmu_platform.c
@@ -109,6 +109,7 @@ static int pmu_parse_irqs(struct arm_pmu *pmu)
 	 */
 	if (num_irqs == 0) {
 		dev_warn(dev, "no irqs for PMU, sampling events not supported\n");
+		pmu->pmu.capabilities &= ~PERF_PMU_CAP_SAMPLING;
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 		cpumask_setall(&pmu->supported_cpus);
 		return 0;
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 369e77ad5f13..dbd52851f5c6 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -955,7 +955,8 @@ static int arm_spe_pmu_perf_init(struct arm_spe_pmu *spe_pmu)
 	spe_pmu->pmu = (struct pmu) {
 		.module = THIS_MODULE,
 		.parent		= &spe_pmu->pdev->dev,
-		.capabilities	= PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE,
+		.capabilities	= PERF_PMU_CAP_SAMPLING |
+				  PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE,
 		.attr_groups	= arm_spe_pmu_attr_groups,
 		/*
 		 * We hitch a ride on the software context here, so that
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895..d185ea8c47ba 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1361,6 +1361,8 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 		pr_info("Perf sampling/filtering is not supported as sscof extension is not available\n");
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
+	} else {
+		pmu->pmu.capabilities |= PERF_PMU_CAP_SAMPLING;
 	}
 
 	pmu->pmu.attr_groups = riscv_pmu_attr_groups;
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 4d439c24c901..bf2cfbeabba2 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -294,7 +294,7 @@ struct perf_event_pmu_context;
 /**
  * pmu::capabilities flags
  */
-#define PERF_PMU_CAP_NO_INTERRUPT	0x0001
+#define PERF_PMU_CAP_SAMPLING		0x0001
 #define PERF_PMU_CAP_NO_NMI		0x0002
 #define PERF_PMU_CAP_AUX_NO_SG		0x0004
 #define PERF_PMU_CAP_EXTENDED_REGS	0x0008
@@ -305,6 +305,7 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
 #define PERF_PMU_CAP_AUX_PAUSE		0x0200
 #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
+#define PERF_PMU_CAP_NO_INTERRUPT	0x0800
 
 /**
  * pmu::scope
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 8060c2857bb2..71b2a6730705 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4359,7 +4359,7 @@ perf_adjust_freq_unthr_context(struct perf_event_context *ctx, bool unthrottle)
 			continue;
 		if (!perf_pmu_ctx_is_active(pmu_ctx))
 			continue;
-		if (pmu_ctx->pmu->capabilities & PERF_PMU_CAP_NO_INTERRUPT)
+		if (!(pmu_ctx->pmu->capabilities & PERF_PMU_CAP_SAMPLING))
 			continue;
 
 		perf_pmu_disable(pmu_ctx->pmu);
@@ -10819,7 +10819,7 @@ static int perf_swevent_init(struct perf_event *event)
 static struct pmu perf_swevent = {
 	.task_ctx_nr	= perf_sw_context,
 
-	.capabilities	= PERF_PMU_CAP_NO_NMI,
+	.capabilities	= PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_NO_NMI,
 
 	.event_init	= perf_swevent_init,
 	.add		= perf_swevent_add,
@@ -10861,6 +10861,7 @@ static int perf_tp_event_init(struct perf_event *event)
 static struct pmu perf_tracepoint = {
 	.task_ctx_nr	= perf_sw_context,
 
+	.capabilities	= PERF_PMU_CAP_SAMPLING,
 	.event_init	= perf_tp_event_init,
 	.add		= perf_trace_add,
 	.del		= perf_trace_del,
@@ -11066,6 +11067,7 @@ static struct pmu perf_kprobe = {
 	.stop		= perf_swevent_stop,
 	.read		= perf_swevent_read,
 	.attr_groups	= kprobe_attr_groups,
+	.capabilities	= PERF_PMU_CAP_SAMPLING,
 };
 
 static int perf_kprobe_event_init(struct perf_event *event)
@@ -11125,6 +11127,7 @@ static struct pmu perf_uprobe = {
 	.stop		= perf_swevent_stop,
 	.read		= perf_swevent_read,
 	.attr_groups	= uprobe_attr_groups,
+	.capabilities	= PERF_PMU_CAP_SAMPLING,
 };
 
 static int perf_uprobe_event_init(struct perf_event *event)
@@ -11899,7 +11902,7 @@ static int cpu_clock_event_init(struct perf_event *event)
 static struct pmu perf_cpu_clock = {
 	.task_ctx_nr	= perf_sw_context,
 
-	.capabilities	= PERF_PMU_CAP_NO_NMI,
+	.capabilities	= PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_NO_NMI,
 	.dev		= PMU_NULL_DEV,
 
 	.event_init	= cpu_clock_event_init,
@@ -11982,7 +11985,7 @@ static int task_clock_event_init(struct perf_event *event)
 static struct pmu perf_task_clock = {
 	.task_ctx_nr	= perf_sw_context,
 
-	.capabilities	= PERF_PMU_CAP_NO_NMI,
+	.capabilities	= PERF_PMU_CAP_SAMPLING | PERF_PMU_CAP_NO_NMI,
 	.dev		= PMU_NULL_DEV,
 
 	.event_init	= task_clock_event_init,
@@ -13476,11 +13479,10 @@ SYSCALL_DEFINE5(perf_event_open,
 		goto err_task;
 	}
 
-	if (is_sampling_event(event)) {
-		if (event->pmu->capabilities & PERF_PMU_CAP_NO_INTERRUPT) {
-			err = -EOPNOTSUPP;
-			goto err_alloc;
-		}
+	if (is_sampling_event(event) &&
+	    !(event->pmu->capabilities & PERF_PMU_CAP_SAMPLING)) {
+		err = -EOPNOTSUPP;
+		goto err_alloc;
 	}
 
 	/*
diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 8ec2cb688903..604be7d7aecf 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -996,6 +996,7 @@ static void hw_breakpoint_stop(struct perf_event *bp, int flags)
 static struct pmu perf_breakpoint = {
 	.task_ctx_nr	= perf_sw_context, /* could eventually get its own */
 
+	.capabilities	= PERF_PMU_CAP_SAMPLING,
 	.event_init	= hw_breakpoint_event_init,
 	.add		= hw_breakpoint_add,
 	.del		= hw_breakpoint_del,
-- 
2.39.2.101.g768bb238c484.dirty


