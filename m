Return-Path: <linuxppc-dev+bounces-10955-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B04B250DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:04:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F706nSLz3cZR;
	Thu, 14 Aug 2025 03:02:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104572;
	cv=none; b=jQuGlNAZ1WLXamfCb20KmMavzbY1WhFG/bWpH1zzd+lBu3cv/+uVKM2HueuuP8/SL1l9jmpJ2652KP/HM6Rg3kdoscuc12jEPzwHzhiBrFQdqPlVAsveQzxPXVJgj94kzjWjN+cdafDZT9E9ZW0Gmkn0UG99O97M5SeaSUt9Ge8Pee8WTACYs4138FPp+kbmvt+a1ivhj64xYHjtf/5VepW7HO1SO2W+ty+U2kYMVeQcgxif87s5qIXoqjhHyXUCVg+xlbaA1FUImRAi4omvzCxi+u+ar6VjBTYpl+jRY2HCyj+8ivTTLPT4UgpBFoRoQbksbwfV/kGzOL1hHWf+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104572; c=relaxed/relaxed;
	bh=pX0PcWkAQ9H0ilxXubA6gXdCQG7wT8j6y67EqL01AWk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K0J8JXAWKlEYgMN7PnHMOYWPQ5dTrhN9eYZgCxeXPffH9TlgXArtpDmnB0tvjazP4/RlXnXdV7BGjIx7QqNk2jlIkUHLC/OXmYREpklCP63se77KFbSSgG8XpigzhafXwg5V4ZTZQER24Tk4PrqhPEE6xtNDUU3MuSDI9cG8Ym8oWyOP9iMmCR9a/ok75vqEmObQbzl2ZOF3MsFHGBI2X4Gm8CPRuKKcRwd+lrT62T5dVsip3Q5xgRM5W7GruzOsIB9DZ/qmZ3CxwpqOYsMRm/3wmTrVLVaJKQhdG+ZKQwCVpdw03bqMbly3BD4jUeGjLC9AlB382Y5FJbazkOz47Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6z4HrMz3cZN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:51 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECC861E7D;
	Wed, 13 Aug 2025 10:02:42 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF6873F738;
	Wed, 13 Aug 2025 10:02:46 -0700 (PDT)
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
Subject: [PATCH 19/19] perf: Garbage-collect event_init checks
Date: Wed, 13 Aug 2025 18:01:11 +0100
Message-Id: <ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com>
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

All these boilerplate event_init checks are now redundant. Of course
many of them were already redundant, or done in the wrong order so as to
be pointless, and what we don't see here is all the ones which were
missing, but have now been implicitly gained thanks to some of these new
core code behaviours. In summary:

- event->attr.type
	Now only relevant to PERF_TYPE_RAW PMUs or those advertising
	PERF_PMU_CAP_RAW_EVENTS.

- event->cpu < 0
	Already rejected by perf_event_alloc() unless a task is passed,
	wherein that will also set PERF_ATTACH_TASK prior to reaching
	perf_init_event(), so is always redundant with...

- PERF_ATTACH_TASK
	Since at least commit bd2756811766 ("perf: Rewrite core context
	handling"), only relevant to PMUs using perf_hw_context or
	perf_sw_context; for uncore PMUs this is covered by
	perf_event_alloc() again, right after perf_init_event() returns,
	by virtue of the same non-NULL task which caused attach_state to
	be set in the first place.

- is_sampling_event() (and variations)
	Now only relevant to PMUs advertising PERF_PMU_CAP_SAMPLING.

- has_branch_stack()
	Now doubly-illogical for PMUs which never supported sampling
	anyway.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm/mach-imx/mmdc.c                      | 14 ---------
 arch/arm/mm/cache-l2x0-pmu.c                  | 10 -------
 arch/powerpc/perf/hv-24x7.c                   |  8 -----
 arch/powerpc/perf/hv-gpci.c                   |  8 -----
 arch/powerpc/perf/imc-pmu.c                   | 30 -------------------
 arch/powerpc/perf/kvm-hv-pmu.c                |  3 --
 arch/powerpc/perf/vpa-pmu.c                   |  7 -----
 arch/powerpc/platforms/pseries/papr_scm.c     | 11 -------
 arch/s390/kernel/perf_cpum_cf.c               |  3 +-
 arch/x86/events/amd/iommu.c                   | 15 ----------
 arch/x86/events/amd/power.c                   |  7 -----
 arch/x86/events/amd/uncore.c                  |  6 ----
 arch/x86/events/intel/bts.c                   |  3 --
 arch/x86/events/intel/cstate.c                |  7 -----
 arch/x86/events/intel/pt.c                    |  3 --
 arch/x86/events/intel/uncore.c                | 13 --------
 arch/x86/events/intel/uncore_snb.c            | 18 -----------
 arch/x86/events/msr.c                         |  3 --
 arch/x86/events/rapl.c                        | 11 -------
 drivers/devfreq/event/rockchip-dfi.c          | 12 --------
 drivers/dma/idxd/perfmon.c                    | 14 ---------
 drivers/fpga/dfl-fme-perf.c                   | 14 ---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c       |  4 ---
 drivers/gpu/drm/i915/i915_pmu.c               | 13 --------
 drivers/gpu/drm/xe/xe_pmu.c                   | 13 --------
 .../hwtracing/coresight/coresight-etm-perf.c  |  5 ----
 drivers/hwtracing/ptt/hisi_ptt.c              |  8 -----
 drivers/iommu/intel/perfmon.c                 | 10 -------
 drivers/perf/alibaba_uncore_drw_pmu.c         | 17 -----------
 drivers/perf/amlogic/meson_ddr_pmu_core.c     |  9 ------
 drivers/perf/arm-cci.c                        |  9 ------
 drivers/perf/arm-ccn.c                        | 18 -----------
 drivers/perf/arm-cmn.c                        | 10 -------
 drivers/perf/arm-ni.c                         |  6 ----
 drivers/perf/arm_cspmu/arm_cspmu.c            | 13 --------
 drivers/perf/arm_dmc620_pmu.c                 | 16 ----------
 drivers/perf/arm_dsu_pmu.c                    | 20 -------------
 drivers/perf/arm_smmuv3_pmu.c                 | 13 --------
 drivers/perf/arm_spe_pmu.c                    |  4 ---
 drivers/perf/cxl_pmu.c                        |  6 ----
 drivers/perf/dwc_pcie_pmu.c                   | 11 -------
 drivers/perf/fsl_imx8_ddr_perf.c              | 11 -------
 drivers/perf/fsl_imx9_ddr_perf.c              | 11 -------
 drivers/perf/hisilicon/hisi_pcie_pmu.c        |  8 -----
 drivers/perf/hisilicon/hisi_uncore_pmu.c      | 18 -----------
 drivers/perf/hisilicon/hns3_pmu.c             |  7 -----
 drivers/perf/marvell_cn10k_ddr_pmu.c          | 13 --------
 drivers/perf/marvell_cn10k_tad_pmu.c          |  3 --
 drivers/perf/marvell_pem_pmu.c                | 11 -------
 drivers/perf/qcom_l2_pmu.c                    | 15 ----------
 drivers/perf/qcom_l3_pmu.c                    | 19 ------------
 drivers/perf/starfive_starlink_pmu.c          | 14 ---------
 drivers/perf/thunderx2_pmu.c                  | 15 ----------
 drivers/perf/xgene_pmu.c                      | 14 ---------
 drivers/powercap/intel_rapl_common.c          |  7 -----
 55 files changed, 1 insertion(+), 590 deletions(-)

diff --git a/arch/arm/mach-imx/mmdc.c b/arch/arm/mach-imx/mmdc.c
index f9d432b385a2..9e3734e249a2 100644
--- a/arch/arm/mach-imx/mmdc.c
+++ b/arch/arm/mach-imx/mmdc.c
@@ -277,20 +277,6 @@ static int mmdc_pmu_event_init(struct perf_event *event)
 	struct mmdc_pmu *pmu_mmdc = to_mmdc_pmu(event->pmu);
 	int cfg = event->attr.config;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EOPNOTSUPP;
-
-	if (event->cpu < 0) {
-		dev_warn(pmu_mmdc->dev, "Can't provide per-task data!\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (event->attr.sample_period)
-		return -EINVAL;
-
 	if (cfg < 0 || cfg >= MMDC_NUM_COUNTERS)
 		return -EINVAL;
 
diff --git a/arch/arm/mm/cache-l2x0-pmu.c b/arch/arm/mm/cache-l2x0-pmu.c
index 6fc1171031a8..b8753463c1c4 100644
--- a/arch/arm/mm/cache-l2x0-pmu.c
+++ b/arch/arm/mm/cache-l2x0-pmu.c
@@ -294,16 +294,6 @@ static int l2x0_pmu_event_init(struct perf_event *event)
 {
 	struct hw_perf_event *hw = &event->hw;
 
-	if (event->attr.type != l2x0_pmu->type)
-		return -ENOENT;
-
-	if (is_sampling_event(event) ||
-	    event->attach_state & PERF_ATTACH_TASK)
-		return -EINVAL;
-
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	if (event->attr.config & ~L2X0_EVENT_CNT_CFG_SRC_MASK)
 		return -EINVAL;
 
diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index ab906616e570..5b03d6b34999 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -1379,10 +1379,6 @@ static int h_24x7_event_init(struct perf_event *event)
 	unsigned long hret;
 	u64 ct;
 
-	/* Not our event */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	/* Unused areas must be 0 */
 	if (event_get_reserved1(event) ||
 	    event_get_reserved2(event) ||
@@ -1397,10 +1393,6 @@ static int h_24x7_event_init(struct perf_event *event)
 		return -EINVAL;
 	}
 
-	/* no branch sampling */
-	if (has_branch_stack(event))
-		return -EOPNOTSUPP;
-
 	/* offset must be 8 byte aligned */
 	if (event_get_offset(event) % 8) {
 		pr_devel("bad alignment\n");
diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 1726690396ec..9663aa18bc45 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -775,20 +775,12 @@ static int h_gpci_event_init(struct perf_event *event)
 	u8 length;
 	unsigned long ret;
 
-	/* Not our event */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	/* config2 is unused */
 	if (event->attr.config2) {
 		pr_devel("config2 set when reserved\n");
 		return -EINVAL;
 	}
 
-	/* no branch sampling */
-	if (has_branch_stack(event))
-		return -EOPNOTSUPP;
-
 	length = event_get_length(event);
 	if (length < 1 || length > 8) {
 		pr_devel("length invalid\n");
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index f352dda3baf9..cee6390986dc 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -517,16 +517,6 @@ static int nest_imc_event_init(struct perf_event *event)
 	struct imc_pmu_ref *ref;
 	bool flag = false;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* Sampling not supported */
-	if (event->hw.sample_period)
-		return -EINVAL;
-
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	pmu = imc_event_to_pmu(event);
 
 	/* Sanity check for config (event offset) */
@@ -819,16 +809,6 @@ static int core_imc_event_init(struct perf_event *event)
 	struct imc_pmu *pmu;
 	struct imc_pmu_ref *ref;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* Sampling not supported */
-	if (event->hw.sample_period)
-		return -EINVAL;
-
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	event->hw.idx = -1;
 	pmu = imc_event_to_pmu(event);
 
@@ -983,16 +963,9 @@ static int thread_imc_event_init(struct perf_event *event)
 	struct task_struct *target;
 	struct imc_pmu *pmu;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	if (!perfmon_capable())
 		return -EACCES;
 
-	/* Sampling not supported */
-	if (event->hw.sample_period)
-		return -EINVAL;
-
 	event->hw.idx = -1;
 	pmu = imc_event_to_pmu(event);
 
@@ -1436,9 +1409,6 @@ static void trace_imc_event_del(struct perf_event *event, int flags)
 
 static int trace_imc_event_init(struct perf_event *event)
 {
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	if (!perfmon_capable())
 		return -EACCES;
 
diff --git a/arch/powerpc/perf/kvm-hv-pmu.c b/arch/powerpc/perf/kvm-hv-pmu.c
index 1c6bc65c986c..513f5b172ba6 100644
--- a/arch/powerpc/perf/kvm-hv-pmu.c
+++ b/arch/powerpc/perf/kvm-hv-pmu.c
@@ -180,9 +180,6 @@ static int kvmppc_pmu_event_init(struct perf_event *event)
 		 __func__, event, event->id, event->cpu,
 		 event->oncpu, config);
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	if (config >= KVMPPC_EVENT_MAX)
 		return -EINVAL;
 
diff --git a/arch/powerpc/perf/vpa-pmu.c b/arch/powerpc/perf/vpa-pmu.c
index 1d360b5bf67c..35883a071360 100644
--- a/arch/powerpc/perf/vpa-pmu.c
+++ b/arch/powerpc/perf/vpa-pmu.c
@@ -72,13 +72,6 @@ static const struct attribute_group *vpa_pmu_attr_groups[] = {
 
 static int vpa_pmu_event_init(struct perf_event *event)
 {
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* no branch sampling */
-	if (has_branch_stack(event))
-		return -EOPNOTSUPP;
-
 	/* Invalid event code */
 	if ((event->attr.config <= 0) || (event->attr.config > 3))
 		return -EINVAL;
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index d752cdaf8422..e6474ee0c140 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -372,17 +372,6 @@ static int papr_scm_pmu_event_init(struct perf_event *event)
 	struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
 	struct papr_scm_priv *p;
 
-	if (!nd_pmu)
-		return -EINVAL;
-
-	/* test the event attr type for PMU enumeration */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* no branch sampling */
-	if (has_branch_stack(event))
-		return -EOPNOTSUPP;
-
 	p = (struct papr_scm_priv *)nd_pmu->dev->driver_data;
 	if (!p)
 		return -EINVAL;
diff --git a/arch/s390/kernel/perf_cpum_cf.c b/arch/s390/kernel/perf_cpum_cf.c
index 782ab755ddd4..fa732e94f6e4 100644
--- a/arch/s390/kernel/perf_cpum_cf.c
+++ b/arch/s390/kernel/perf_cpum_cf.c
@@ -1788,8 +1788,7 @@ static int cfdiag_event_init(struct perf_event *event)
 	struct perf_event_attr *attr = &event->attr;
 	int err = -ENOENT;
 
-	if (event->attr.config != PERF_EVENT_CPUM_CF_DIAG ||
-	    event->attr.type != event->pmu->type)
+	if (event->attr.config != PERF_EVENT_CPUM_CF_DIAG)
 		goto out;
 
 	/* Raw events are used to access counters directly,
diff --git a/arch/x86/events/amd/iommu.c b/arch/x86/events/amd/iommu.c
index a721da9987dd..8053bec14dec 100644
--- a/arch/x86/events/amd/iommu.c
+++ b/arch/x86/events/amd/iommu.c
@@ -209,21 +209,6 @@ static int perf_iommu_event_init(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
 
-	/* test the event attr type check for PMU enumeration */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/*
-	 * IOMMU counters are shared across all cores.
-	 * Therefore, it does not support per-process mode.
-	 * Also, it does not support event sampling mode.
-	 */
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EINVAL;
-
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	/* update the hw_perf_event struct with the iommu config data */
 	hwc->conf  = event->attr.config;
 	hwc->conf1 = event->attr.config1;
diff --git a/arch/x86/events/amd/power.c b/arch/x86/events/amd/power.c
index dad42790cf7d..a5e42ee2464a 100644
--- a/arch/x86/events/amd/power.c
+++ b/arch/x86/events/amd/power.c
@@ -125,14 +125,7 @@ static int pmu_event_init(struct perf_event *event)
 {
 	u64 cfg = event->attr.config & AMD_POWER_EVENT_MASK;
 
-	/* Only look at AMD power events. */
-	if (event->attr.type != pmu_class.type)
-		return -ENOENT;
-
 	/* Unsupported modes and filters. */
-	if (event->attr.sample_period)
-		return -EINVAL;
-
 	if (cfg != AMD_POWER_EVENTSEL_PKG)
 		return -EINVAL;
 
diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
index 050a5567291a..76f58c7b4c19 100644
--- a/arch/x86/events/amd/uncore.c
+++ b/arch/x86/events/amd/uncore.c
@@ -270,12 +270,6 @@ static int amd_uncore_event_init(struct perf_event *event)
 	struct amd_uncore_ctx *ctx;
 	struct hw_perf_event *hwc = &event->hw;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	pmu = event_to_amd_uncore_pmu(event);
 	ctx = *per_cpu_ptr(pmu->ctx, event->cpu);
 	if (!ctx)
diff --git a/arch/x86/events/intel/bts.c b/arch/x86/events/intel/bts.c
index 61da6b8a3d51..27e23153ba6f 100644
--- a/arch/x86/events/intel/bts.c
+++ b/arch/x86/events/intel/bts.c
@@ -565,9 +565,6 @@ static int bts_event_init(struct perf_event *event)
 {
 	int ret;
 
-	if (event->attr.type != bts_pmu.type)
-		return -ENOENT;
-
 	/*
 	 * BTS leaks kernel addresses even when CPL0 tracing is
 	 * disabled, so disallow intel_bts driver for unprivileged
diff --git a/arch/x86/events/intel/cstate.c b/arch/x86/events/intel/cstate.c
index 2a79717b898f..90a884d77864 100644
--- a/arch/x86/events/intel/cstate.c
+++ b/arch/x86/events/intel/cstate.c
@@ -277,13 +277,6 @@ static int cstate_pmu_event_init(struct perf_event *event)
 {
 	u64 cfg = event->attr.config;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* unsupported modes and filters */
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	if (event->pmu == &cstate_core_pmu) {
 		if (cfg >= PERF_CSTATE_CORE_EVENT_MAX)
 			return -EINVAL;
diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
index e8cf29d2b10c..a5004dd7632b 100644
--- a/arch/x86/events/intel/pt.c
+++ b/arch/x86/events/intel/pt.c
@@ -1795,9 +1795,6 @@ static void pt_event_destroy(struct perf_event *event)
 
 static int pt_event_init(struct perf_event *event)
 {
-	if (event->attr.type != pt_pmu.pmu.type)
-		return -ENOENT;
-
 	if (!pt_event_valid(event))
 		return -EINVAL;
 
diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/uncore.c
index 297ff5adb667..98ffab403bb4 100644
--- a/arch/x86/events/intel/uncore.c
+++ b/arch/x86/events/intel/uncore.c
@@ -731,24 +731,11 @@ static int uncore_pmu_event_init(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int ret;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	pmu = uncore_event_to_pmu(event);
 	/* no device found for this pmu */
 	if (!pmu->registered)
 		return -ENOENT;
 
-	/* Sampling not supported yet */
-	if (hwc->sample_period)
-		return -EINVAL;
-
-	/*
-	 * Place all uncore events for a particular physical package
-	 * onto a single cpu
-	 */
-	if (event->cpu < 0)
-		return -EINVAL;
 	box = uncore_pmu_to_box(pmu, event->cpu);
 	if (!box || box->cpu < 0)
 		return -EINVAL;
diff --git a/arch/x86/events/intel/uncore_snb.c b/arch/x86/events/intel/uncore_snb.c
index 807e582b8f17..8537f61bb093 100644
--- a/arch/x86/events/intel/uncore_snb.c
+++ b/arch/x86/events/intel/uncore_snb.c
@@ -906,29 +906,11 @@ static int snb_uncore_imc_event_init(struct perf_event *event)
 	u64 cfg = event->attr.config & SNB_UNCORE_PCI_IMC_EVENT_MASK;
 	int idx, base;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	pmu = uncore_event_to_pmu(event);
 	/* no device found for this pmu */
 	if (!pmu->registered)
 		return -ENOENT;
 
-	/* Sampling not supported yet */
-	if (hwc->sample_period)
-		return -EINVAL;
-
-	/* unsupported modes and filters */
-	if (event->attr.sample_period) /* no sampling */
-		return -EINVAL;
-
-	/*
-	 * Place all uncore events for a particular physical package
-	 * onto a single cpu
-	 */
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	/* check only supported bits are set */
 	if (event->attr.config & ~SNB_UNCORE_PCI_IMC_EVENT_MASK)
 		return -EINVAL;
diff --git a/arch/x86/events/msr.c b/arch/x86/events/msr.c
index 3285c1f3bb90..cf6214849a25 100644
--- a/arch/x86/events/msr.c
+++ b/arch/x86/events/msr.c
@@ -206,9 +206,6 @@ static int msr_event_init(struct perf_event *event)
 {
 	u64 cfg = event->attr.config;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	/* unsupported modes and filters */
 	if (cfg >= PERF_MSR_EVENT_MAX)
 		return -EINVAL;
diff --git a/arch/x86/events/rapl.c b/arch/x86/events/rapl.c
index defd86137f12..5d298e371b28 100644
--- a/arch/x86/events/rapl.c
+++ b/arch/x86/events/rapl.c
@@ -370,21 +370,10 @@ static int rapl_pmu_event_init(struct perf_event *event)
 	unsigned int rapl_pmu_idx;
 	struct rapl_pmus *rapl_pmus;
 
-	/* only look at RAPL events */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* unsupported modes and filters */
-	if (event->attr.sample_period) /* no sampling */
-		return -EINVAL;
-
 	/* check only supported bits are set */
 	if (event->attr.config & ~RAPL_EVENT_MASK)
 		return -EINVAL;
 
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	rapl_pmus = container_of(event->pmu, struct rapl_pmus, pmu);
 	if (!rapl_pmus)
 		return -EINVAL;
diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 88a9ecbe96ce..87ec7bc965bd 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -401,18 +401,6 @@ static const struct attribute_group *attr_groups[] = {
 
 static int rockchip_ddr_perf_event_init(struct perf_event *event)
 {
-	struct rockchip_dfi *dfi = container_of(event->pmu, struct rockchip_dfi, pmu);
-
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	if (event->attach_state & PERF_ATTACH_TASK)
-		return -EINVAL;
-
-	if (event->cpu < 0) {
-		dev_warn(dfi->dev, "Can't provide per-task data!\n");
-		return -EINVAL;
-	}
 	/* Disallow groups since we can't start/stop/read multiple counters at once */
 	if (in_hardware_group(event))
 		return -EINVAL;
diff --git a/drivers/dma/idxd/perfmon.c b/drivers/dma/idxd/perfmon.c
index 8c539e1f11da..4d6f1fc47685 100644
--- a/drivers/dma/idxd/perfmon.c
+++ b/drivers/dma/idxd/perfmon.c
@@ -171,20 +171,6 @@ static int perfmon_pmu_event_init(struct perf_event *event)
 
 	idxd = event_to_idxd(event);
 	event->hw.idx = -1;
-
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* sampling not supported */
-	if (event->attr.sample_period)
-		return -EINVAL;
-
-	if (event->cpu < 0)
-		return -EINVAL;
-
-	if (event->pmu != &idxd->idxd_pmu->pmu)
-		return -EINVAL;
-
 	event->hw.event_base = ioread64(PERFMON_TABLE_OFFSET(idxd));
 	event->hw.config = event->attr.config;
 
diff --git a/drivers/fpga/dfl-fme-perf.c b/drivers/fpga/dfl-fme-perf.c
index a1e2e7f28a3a..0cc9538e0898 100644
--- a/drivers/fpga/dfl-fme-perf.c
+++ b/drivers/fpga/dfl-fme-perf.c
@@ -799,20 +799,6 @@ static int fme_perf_event_init(struct perf_event *event)
 	struct fme_perf_event_ops *ops;
 	u32 eventid, evtype, portid;
 
-	/* test the event attr type check for PMU enumeration */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/*
-	 * fme counters are shared across all cores.
-	 * Therefore, it does not support per-process mode.
-	 */
-	if (event->attach_state & PERF_ATTACH_TASK)
-		return -EINVAL;
-
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	if (event->cpu != priv->cpu)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
index 6e91ea1de5aa..294a7aea9aaa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
@@ -210,10 +210,6 @@ static int amdgpu_perf_event_init(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
 
-	/* test the event attr type check for PMU enumeration */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	/* update the hw_perf_event struct with config data */
 	hwc->config = event->attr.config;
 	hwc->config_base = AMDGPU_PMU_PERF_TYPE_NONE;
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 5bc696bfbb0f..193e96976782 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -626,19 +626,6 @@ static int i915_pmu_event_init(struct perf_event *event)
 	if (!pmu->registered)
 		return -ENODEV;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* unsupported modes and filters */
-	if (event->attr.sample_period) /* no sampling */
-		return -EINVAL;
-
-	if (has_branch_stack(event))
-		return -EOPNOTSUPP;
-
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	if (is_engine_event(event))
 		ret = engine_event_init(event);
 	else
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index cab51d826345..084e26728c35 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -238,24 +238,11 @@ static int xe_pmu_event_init(struct perf_event *event)
 	if (!pmu->registered)
 		return -ENODEV;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* unsupported modes and filters */
-	if (event->attr.sample_period) /* no sampling */
-		return -EINVAL;
-
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	gt = config_to_gt_id(event->attr.config);
 	id = config_to_event_id(event->attr.config);
 	if (!event_supported(pmu, gt, id))
 		return -ENOENT;
 
-	if (has_branch_stack(event))
-		return -EOPNOTSUPP;
-
 	if (!event_param_valid(event))
 		return -ENOENT;
 
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f1551c08ecb2..fd98eb6a1942 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -178,11 +178,6 @@ static int etm_event_init(struct perf_event *event)
 {
 	int ret = 0;
 
-	if (event->attr.type != etm_pmu.type) {
-		ret = -ENOENT;
-		goto out;
-	}
-
 	ret = etm_addr_filters_alloc(event);
 	if (ret)
 		goto out;
diff --git a/drivers/hwtracing/ptt/hisi_ptt.c b/drivers/hwtracing/ptt/hisi_ptt.c
index 3090479a2979..470226defa14 100644
--- a/drivers/hwtracing/ptt/hisi_ptt.c
+++ b/drivers/hwtracing/ptt/hisi_ptt.c
@@ -998,14 +998,6 @@ static int hisi_ptt_pmu_event_init(struct perf_event *event)
 	int ret;
 	u32 val;
 
-	if (event->attr.type != hisi_ptt->hisi_ptt_pmu.type)
-		return -ENOENT;
-
-	if (event->cpu < 0) {
-		dev_dbg(event->pmu->dev, "Per-task mode not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	if (event->attach_state & PERF_ATTACH_TASK)
 		return -EOPNOTSUPP;
 
diff --git a/drivers/iommu/intel/perfmon.c b/drivers/iommu/intel/perfmon.c
index c3a1ac14cb2b..2b9bb89e1fd3 100644
--- a/drivers/iommu/intel/perfmon.c
+++ b/drivers/iommu/intel/perfmon.c
@@ -284,16 +284,6 @@ static int iommu_pmu_event_init(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* sampling not supported */
-	if (event->attr.sample_period)
-		return -EINVAL;
-
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	if (iommu_pmu_validate_event(event))
 		return -EINVAL;
 
diff --git a/drivers/perf/alibaba_uncore_drw_pmu.c b/drivers/perf/alibaba_uncore_drw_pmu.c
index 0081618741c3..2404333ff902 100644
--- a/drivers/perf/alibaba_uncore_drw_pmu.c
+++ b/drivers/perf/alibaba_uncore_drw_pmu.c
@@ -528,24 +528,7 @@ static int ali_drw_pmu_event_init(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	struct device *dev = drw_pmu->pmu.dev;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	if (is_sampling_event(event)) {
-		dev_err(dev, "Sampling not supported!\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (event->attach_state & PERF_ATTACH_TASK) {
-		dev_err(dev, "Per-task counter cannot allocate!\n");
-		return -EOPNOTSUPP;
-	}
-
 	event->cpu = drw_pmu->cpu;
-	if (event->cpu < 0) {
-		dev_err(dev, "Per-task mode not supported!\n");
-		return -EOPNOTSUPP;
-	}
 
 	if (in_hardware_group(event)) {
 		dev_err(dev, "driveway only allow one event!\n");
diff --git a/drivers/perf/amlogic/meson_ddr_pmu_core.c b/drivers/perf/amlogic/meson_ddr_pmu_core.c
index c1e755c356a3..8f46cf835fb5 100644
--- a/drivers/perf/amlogic/meson_ddr_pmu_core.c
+++ b/drivers/perf/amlogic/meson_ddr_pmu_core.c
@@ -121,15 +121,6 @@ static int meson_ddr_perf_event_init(struct perf_event *event)
 	u64 config1 = event->attr.config1;
 	u64 config2 = event->attr.config2;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EOPNOTSUPP;
-
-	if (event->cpu < 0)
-		return -EOPNOTSUPP;
-
 	/* check if the number of parameters is too much */
 	if (event->attr.config != ALL_CHAN_COUNTER_ID &&
 	    hweight64(config1) + hweight64(config2) > MAX_AXI_PORTS_OF_CHANNEL)
diff --git a/drivers/perf/arm-cci.c b/drivers/perf/arm-cci.c
index 086d4363fcc8..84ba97389c65 100644
--- a/drivers/perf/arm-cci.c
+++ b/drivers/perf/arm-cci.c
@@ -1283,13 +1283,6 @@ static int cci_pmu_event_init(struct perf_event *event)
 	atomic_t *active_events = &cci_pmu->active_events;
 	int err = 0;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* Shared by all CPUs, no meaningful state to sample */
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EOPNOTSUPP;
-
 	/*
 	 * Following the example set by other "uncore" PMUs, we accept any CPU
 	 * and rewrite its affinity dynamically rather than having perf core
@@ -1299,8 +1292,6 @@ static int cci_pmu_event_init(struct perf_event *event)
 	 * the event being installed into its context, so the PMU's CPU can't
 	 * change under our feet.
 	 */
-	if (event->cpu < 0)
-		return -EINVAL;
 	event->cpu = cci_pmu->cpu;
 
 	event->destroy = hw_perf_event_destroy;
diff --git a/drivers/perf/arm-ccn.c b/drivers/perf/arm-ccn.c
index 63549aad3b99..6ec4cb9417e7 100644
--- a/drivers/perf/arm-ccn.c
+++ b/drivers/perf/arm-ccn.c
@@ -704,30 +704,12 @@ static void arm_ccn_pmu_event_release(struct perf_event *event)
 static int arm_ccn_pmu_event_init(struct perf_event *event)
 {
 	struct arm_ccn *ccn;
-	struct hw_perf_event *hw = &event->hw;
 	u32 node_xp, type, event_id;
 	int valid;
 	int i;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	ccn = pmu_to_arm_ccn(event->pmu);
 
-	if (hw->sample_period) {
-		dev_dbg(ccn->dev, "Sampling not supported!\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (has_branch_stack(event)) {
-		dev_dbg(ccn->dev, "Can't exclude execution levels!\n");
-		return -EINVAL;
-	}
-
-	if (event->cpu < 0) {
-		dev_dbg(ccn->dev, "Can't provide per-task data!\n");
-		return -EOPNOTSUPP;
-	}
 	/*
 	 * Many perf core operations (eg. events rotation) operate on a
 	 * single CPU context. This is obvious for CPU PMUs, where one
diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index f8c9be9fa6c0..0f65d28c1b7a 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -1765,16 +1765,6 @@ static int arm_cmn_event_init(struct perf_event *event)
 	bool bynodeid;
 	u16 nodeid, eventid;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EINVAL;
-
-	event->cpu = cmn->cpu;
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	type = CMN_EVENT_TYPE(event);
 	/* DTC events (i.e. cycles) already have everything they need */
 	if (type == CMN_TYPE_DTC)
diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index d6b683a0264e..c48c82097412 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -309,12 +309,6 @@ static int arm_ni_event_init(struct perf_event *event)
 {
 	struct arm_ni_cd *cd = pmu_to_cd(event->pmu);
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	if (is_sampling_event(event))
-		return -EINVAL;
-
 	event->cpu = cd_to_ni(cd)->cpu;
 	if (NI_EVENT_TYPE(event) == NI_PMU)
 		return arm_ni_validate_group(event);
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 761b438db231..47d207a97bfc 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -601,19 +601,6 @@ static int arm_cspmu_event_init(struct perf_event *event)
 
 	cspmu = to_arm_cspmu(event->pmu);
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/*
-	 * Following other "uncore" PMUs, we do not support sampling mode or
-	 * attach to a task (per-process mode).
-	 */
-	if (event->cpu < 0 || event->attach_state & PERF_ATTACH_TASK) {
-		dev_dbg(cspmu->pmu.dev,
-			"Can't support per-task counters\n");
-		return -EINVAL;
-	}
-
 	/*
 	 * Make sure the CPU assignment is on one of the CPUs associated with
 	 * this PMU.
diff --git a/drivers/perf/arm_dmc620_pmu.c b/drivers/perf/arm_dmc620_pmu.c
index 24308de80246..751a06ba5319 100644
--- a/drivers/perf/arm_dmc620_pmu.c
+++ b/drivers/perf/arm_dmc620_pmu.c
@@ -514,20 +514,6 @@ static int dmc620_pmu_event_init(struct perf_event *event)
 	struct dmc620_pmu *dmc620_pmu = to_dmc620_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/*
-	 * DMC 620 PMUs are shared across all cpus and cannot
-	 * support task bound and sampling events.
-	 */
-	if (is_sampling_event(event) ||
-		event->attach_state & PERF_ATTACH_TASK) {
-		dev_dbg(dmc620_pmu->pmu.dev,
-			"Can't support per-task counters\n");
-		return -EOPNOTSUPP;
-	}
-
 	/*
 	 * Many perf core operations (eg. events rotation) operate on a
 	 * single CPU context. This is obvious for CPU PMUs, where one
@@ -538,8 +524,6 @@ static int dmc620_pmu_event_init(struct perf_event *event)
 	 * processor.
 	 */
 	event->cpu = dmc620_pmu->irq->cpu;
-	if (event->cpu < 0)
-		return -EINVAL;
 
 	hwc->idx = -1;
 
diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
index 7480fd6fe377..eacbe1864794 100644
--- a/drivers/perf/arm_dsu_pmu.c
+++ b/drivers/perf/arm_dsu_pmu.c
@@ -524,26 +524,6 @@ static int dsu_pmu_event_init(struct perf_event *event)
 {
 	struct dsu_pmu *dsu_pmu = to_dsu_pmu(event->pmu);
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* We don't support sampling */
-	if (is_sampling_event(event)) {
-		dev_dbg(dsu_pmu->pmu.dev, "Can't support sampling events\n");
-		return -EOPNOTSUPP;
-	}
-
-	/* We cannot support task bound events */
-	if (event->cpu < 0 || event->attach_state & PERF_ATTACH_TASK) {
-		dev_dbg(dsu_pmu->pmu.dev, "Can't support per-task counters\n");
-		return -EINVAL;
-	}
-
-	if (has_branch_stack(event)) {
-		dev_dbg(dsu_pmu->pmu.dev, "Can't support filtering\n");
-		return -EINVAL;
-	}
-
 	if (!cpumask_test_cpu(event->cpu, &dsu_pmu->associated_cpus)) {
 		dev_dbg(dsu_pmu->pmu.dev,
 			 "Requested cpu is not associated with the DSU\n");
diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index 7cac380a3528..d534a4eb457a 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -398,19 +398,6 @@ static int smmu_pmu_event_init(struct perf_event *event)
 	int group_num_events = 1;
 	u16 event_id;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	if (hwc->sample_period) {
-		dev_dbg(dev, "Sampling not supported\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (event->cpu < 0) {
-		dev_dbg(dev, "Per-task mode not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	/* Verify specified event is supported on this PMU */
 	event_id = get_event(event);
 	if (event_id < SMMU_PMCG_ARCH_MAX_EVENTS &&
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index dbd52851f5c6..89001d2ceabf 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -718,10 +718,6 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	struct perf_event_attr *attr = &event->attr;
 	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
 
-	/* This is, of course, deeply driver-specific */
-	if (attr->type != event->pmu->type)
-		return -ENOENT;
-
 	if (event->cpu >= 0 &&
 	    !cpumask_test_cpu(event->cpu, &spe_pmu->supported_cpus))
 		return -ENOENT;
diff --git a/drivers/perf/cxl_pmu.c b/drivers/perf/cxl_pmu.c
index d094030220bf..c4f8d5ae45a1 100644
--- a/drivers/perf/cxl_pmu.c
+++ b/drivers/perf/cxl_pmu.c
@@ -563,12 +563,6 @@ static int cxl_pmu_event_init(struct perf_event *event)
 	struct cxl_pmu_info *info = pmu_to_cxl_pmu_info(event->pmu);
 	int rc;
 
-	/* Top level type sanity check - is this a Hardware Event being requested */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EOPNOTSUPP;
 	/* TODO: Validation of any filter */
 
 	/*
diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 78c522658d84..a0eb72c38fdb 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -355,17 +355,6 @@ static int dwc_pcie_pmu_event_init(struct perf_event *event)
 	enum dwc_pcie_event_type type = DWC_PCIE_EVENT_TYPE(event);
 	u32 lane;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* We don't support sampling */
-	if (is_sampling_event(event))
-		return -EINVAL;
-
-	/* We cannot support task bound events */
-	if (event->cpu < 0 || event->attach_state & PERF_ATTACH_TASK)
-		return -EINVAL;
-
 	/* Disallow groups since we can't start/stop/read multiple counters at once */
 	if (in_hardware_group(event))
 		return -EINVAL;
diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
index 56fe281974d2..d63d5d4d9084 100644
--- a/drivers/perf/fsl_imx8_ddr_perf.c
+++ b/drivers/perf/fsl_imx8_ddr_perf.c
@@ -401,17 +401,6 @@ static int ddr_perf_event_init(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	struct perf_event *sibling;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EOPNOTSUPP;
-
-	if (event->cpu < 0) {
-		dev_warn(pmu->dev, "Can't provide per-task data!\n");
-		return -EOPNOTSUPP;
-	}
-
 	if (event != event->group_leader &&
 	    pmu->devtype_data->quirks & DDR_CAP_AXI_ID_FILTER) {
 		if (!ddr_perf_filters_compatible(event, event->group_leader))
diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index 85874ec5ecd0..9e0b2a969481 100644
--- a/drivers/perf/fsl_imx9_ddr_perf.c
+++ b/drivers/perf/fsl_imx9_ddr_perf.c
@@ -553,17 +553,6 @@ static int ddr_perf_event_init(struct perf_event *event)
 	struct ddr_pmu *pmu = to_ddr_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EOPNOTSUPP;
-
-	if (event->cpu < 0) {
-		dev_warn(pmu->dev, "Can't provide per-task data!\n");
-		return -EOPNOTSUPP;
-	}
-
 	event->cpu = pmu->cpu;
 	hwc->idx = -1;
 
diff --git a/drivers/perf/hisilicon/hisi_pcie_pmu.c b/drivers/perf/hisilicon/hisi_pcie_pmu.c
index 3b0b2f7197d0..b0b736af82e3 100644
--- a/drivers/perf/hisilicon/hisi_pcie_pmu.c
+++ b/drivers/perf/hisilicon/hisi_pcie_pmu.c
@@ -378,19 +378,11 @@ static int hisi_pcie_pmu_event_init(struct perf_event *event)
 	struct hisi_pcie_pmu *pcie_pmu = to_pcie_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 
-	/* Check the type first before going on, otherwise it's not our event */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	if (EXT_COUNTER_IS_USED(hisi_pcie_get_event(event)))
 		hwc->event_base = HISI_PCIE_EXT_CNT;
 	else
 		hwc->event_base = HISI_PCIE_CNT;
 
-	/* Sampling is not supported. */
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EOPNOTSUPP;
-
 	if (!hisi_pcie_pmu_valid_filter(event, pcie_pmu))
 		return -EINVAL;
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index 3c531b36cf25..67d64d664b4f 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -199,24 +199,6 @@ int hisi_uncore_pmu_event_init(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	struct hisi_pmu *hisi_pmu;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/*
-	 * We do not support sampling as the counters are all
-	 * shared by all CPU cores in a CPU die(SCCL). Also we
-	 * do not support attach to a task(per-process mode)
-	 */
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EOPNOTSUPP;
-
-	/*
-	 *  The uncore counters not specific to any CPU, so cannot
-	 *  support per-task
-	 */
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	/*
 	 * Validate if the events in group does not exceed the
 	 * available counters in hardware.
diff --git a/drivers/perf/hisilicon/hns3_pmu.c b/drivers/perf/hisilicon/hns3_pmu.c
index 382e469257f9..f6996eafea5a 100644
--- a/drivers/perf/hisilicon/hns3_pmu.c
+++ b/drivers/perf/hisilicon/hns3_pmu.c
@@ -1233,13 +1233,6 @@ static int hns3_pmu_event_init(struct perf_event *event)
 	int idx;
 	int ret;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/* Sampling is not supported */
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EOPNOTSUPP;
-
 	event->cpu = hns3_pmu->on_cpu;
 
 	idx = hns3_pmu_get_event_idx(hns3_pmu);
diff --git a/drivers/perf/marvell_cn10k_ddr_pmu.c b/drivers/perf/marvell_cn10k_ddr_pmu.c
index 54e3fd206d39..26ad83cdb735 100644
--- a/drivers/perf/marvell_cn10k_ddr_pmu.c
+++ b/drivers/perf/marvell_cn10k_ddr_pmu.c
@@ -474,19 +474,6 @@ static int cn10k_ddr_perf_event_init(struct perf_event *event)
 	struct cn10k_ddr_pmu *pmu = to_cn10k_ddr_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	if (is_sampling_event(event)) {
-		dev_info(pmu->dev, "Sampling not supported!\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (event->cpu < 0) {
-		dev_warn(pmu->dev, "Can't provide per-task data!\n");
-		return -EOPNOTSUPP;
-	}
-
 	/* Set ownership of event to one CPU, same event can not be observed
 	 * on multiple cpus at same time.
 	 */
diff --git a/drivers/perf/marvell_cn10k_tad_pmu.c b/drivers/perf/marvell_cn10k_tad_pmu.c
index a162e707a639..6ed30a649ed3 100644
--- a/drivers/perf/marvell_cn10k_tad_pmu.c
+++ b/drivers/perf/marvell_cn10k_tad_pmu.c
@@ -149,9 +149,6 @@ static int tad_pmu_event_init(struct perf_event *event)
 {
 	struct tad_pmu *tad_pmu = to_tad_pmu(event->pmu);
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	/* Disallow groups since we can't start/stop/read multiple counters at once */
 	if (in_hardware_group(event))
 		return -EINVAL;
diff --git a/drivers/perf/marvell_pem_pmu.c b/drivers/perf/marvell_pem_pmu.c
index 53a35a5de7f8..5c7abae77c12 100644
--- a/drivers/perf/marvell_pem_pmu.c
+++ b/drivers/perf/marvell_pem_pmu.c
@@ -191,20 +191,9 @@ static int pem_perf_event_init(struct perf_event *event)
 	struct pem_pmu *pmu = to_pem_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	if (event->attr.config >= PEM_EVENTIDS_MAX)
 		return -EINVAL;
 
-	if (is_sampling_event(event) ||
-	    event->attach_state & PERF_ATTACH_TASK) {
-		return -EOPNOTSUPP;
-	}
-
-	if (event->cpu < 0)
-		return -EOPNOTSUPP;
-
 	/* Disallow groups since we can't start/stop/read multiple counters at once */
 	if (in_hardware_group(event))
 		return -EINVAL;
diff --git a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c
index 9c4e1d89718d..eba9a7e40293 100644
--- a/drivers/perf/qcom_l2_pmu.c
+++ b/drivers/perf/qcom_l2_pmu.c
@@ -442,23 +442,8 @@ static int l2_cache_event_init(struct perf_event *event)
 	struct perf_event *sibling;
 	struct l2cache_pmu *l2cache_pmu;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	l2cache_pmu = to_l2cache_pmu(event->pmu);
 
-	if (hwc->sample_period) {
-		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-				    "Sampling not supported\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (event->cpu < 0) {
-		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-				    "Per-task mode not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	if (((L2_EVT_GROUP(event->attr.config) > L2_EVT_GROUP_MAX) ||
 	     ((event->attr.config & ~L2_EVT_MASK) != 0)) &&
 	    (event->attr.config != L2CYCLE_CTR_RAW_CODE)) {
diff --git a/drivers/perf/qcom_l3_pmu.c b/drivers/perf/qcom_l3_pmu.c
index f0cf6c33418d..af0ced386fb1 100644
--- a/drivers/perf/qcom_l3_pmu.c
+++ b/drivers/perf/qcom_l3_pmu.c
@@ -478,25 +478,6 @@ static int qcom_l3_cache__event_init(struct perf_event *event)
 	struct l3cache_pmu *l3pmu = to_l3cache_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 
-	/*
-	 * Is the event for this PMU?
-	 */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/*
-	 * Sampling not supported since these events are not core-attributable.
-	 */
-	if (hwc->sample_period)
-		return -EINVAL;
-
-	/*
-	 * Task mode not available, we run the counters as socket counters,
-	 * not attributable to any CPU and therefore cannot attribute per-task.
-	 */
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	/* Validate the group */
 	if (!qcom_l3_cache__validate_event_group(event))
 		return -EINVAL;
diff --git a/drivers/perf/starfive_starlink_pmu.c b/drivers/perf/starfive_starlink_pmu.c
index e185f307e639..ee5216403417 100644
--- a/drivers/perf/starfive_starlink_pmu.c
+++ b/drivers/perf/starfive_starlink_pmu.c
@@ -366,20 +366,6 @@ static int starlink_pmu_event_init(struct perf_event *event)
 	struct starlink_pmu *starlink_pmu = to_starlink_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 
-	/*
-	 * Sampling is not supported, as counters are shared
-	 * by all CPU.
-	 */
-	if (hwc->sample_period)
-		return -EOPNOTSUPP;
-
-	/*
-	 * Per-task and attach to a task are not supported,
-	 * as uncore events are not specific to any CPU.
-	 */
-	if (event->cpu < 0 || event->attach_state & PERF_ATTACH_TASK)
-		return -EOPNOTSUPP;
-
 	if (!starlink_pmu_validate_event_group(event))
 		return -EINVAL;
 
diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index 472eb4494fd1..0ef85cb72289 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -553,21 +553,6 @@ static int tx2_uncore_event_init(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	struct tx2_uncore_pmu *tx2_pmu;
 
-	/* Test the event attr type check for PMU enumeration */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/*
-	 * SOC PMU counters are shared across all cores.
-	 * Therefore, it does not support per-process mode.
-	 * Also, it does not support event sampling mode.
-	 */
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EINVAL;
-
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	tx2_pmu = pmu_to_tx2_pmu(event->pmu);
 	if (tx2_pmu->cpu >= nr_cpu_ids)
 		return -EINVAL;
diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
index 5e80ae0e692d..408e69533e7a 100644
--- a/drivers/perf/xgene_pmu.c
+++ b/drivers/perf/xgene_pmu.c
@@ -878,20 +878,6 @@ static int xgene_perf_event_init(struct perf_event *event)
 	struct xgene_pmu_dev *pmu_dev = to_pmu_dev(event->pmu);
 	struct hw_perf_event *hw = &event->hw;
 
-	/* Test the event attr type check for PMU enumeration */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
-	/*
-	 * SOC PMU counters are shared across all cores.
-	 * Therefore, it does not support per-process mode.
-	 * Also, it does not support event sampling mode.
-	 */
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EINVAL;
-
-	if (event->cpu < 0)
-		return -EINVAL;
 	/*
 	 * Many perf core operations (eg. events rotation) operate on a
 	 * single CPU context. This is obvious for CPU PMUs, where one
diff --git a/drivers/powercap/intel_rapl_common.c b/drivers/powercap/intel_rapl_common.c
index 38470351217b..eff369b02773 100644
--- a/drivers/powercap/intel_rapl_common.c
+++ b/drivers/powercap/intel_rapl_common.c
@@ -1791,17 +1791,10 @@ static int rapl_pmu_event_init(struct perf_event *event)
 	u64 cfg = event->attr.config & RAPL_EVENT_MASK;
 	int domain, idx;
 
-	/* Only look at RAPL events */
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	/* Check for supported events only */
 	if (!cfg || cfg >= PERF_RAPL_MAX)
 		return -EINVAL;
 
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	/* Find out which Package the event belongs to */
 	list_for_each_entry(pos, &rapl_packages, plist) {
 		if (is_rp_pmu_cpu(pos, event->cpu)) {
-- 
2.39.2.101.g768bb238c484.dirty


