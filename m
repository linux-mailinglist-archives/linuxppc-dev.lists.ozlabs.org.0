Return-Path: <linuxppc-dev+bounces-10951-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30795B250D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:03:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6q4CfLz3cPG;
	Thu, 14 Aug 2025 03:02:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104563;
	cv=none; b=Ih+L0iAqjlEr/qDjeuq9vb2wWmVeezRMD8HEJuhWFjf9bokMA/Uk9OiTTWmLRtjXBvpmK3FZ5wr+wDhAQ/4cCVcnCkhJrGP8xPbrq5aC4rSSQR+uG/tbncIuWJpa69Ek02sZEdOLwlntI7EWkNgkTAB7Z5Bx5BbvpRVgJG17DycIaUSUiJl2qs5Dzaoc/pI76JIRUsq93jpc30VFZYiMK0QyJ6CWRLkBOFRwrdbngRKbGaDDUnaqGqJdxhB4g8r+wWOK2dszLqI4GbzSw8MPba2XQY1LP8skOpKI1THffMlL3RFCtSRtNOjuNVXZYbGpLpE0rwQ50iSRLfzEJ+RHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104563; c=relaxed/relaxed;
	bh=Nz+u1JngWsAw13fJm7/UYIPeybjCoK5Tnna+BzNIE3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DU1oAwbxgF2gyUW0Nulx7FfNX7LaXar8fJmCXiwQSOoKq5cxQuL+OTfKfJZom2KGZFrqRaPAZglEhsh/bt7PiDTbMsr6zn8gixQu/U4WCZztMUscHAeqWR+2xjnHpUPLUAN8rbOh3nngE8+xOGxf9q8Ar331C28c+AGhZCpUPl2f0Bfkc1W5EEPC+KLiApkkuHfNE7pCFbxWlPVgb1vq+72eg1HtLeobeZytq9GY6fYMqp37yCboVqIxPtb7RiF9+B27OYRbBTEb+5IvWhbVTCg2fgMCKIAl9DGiLVzE0C+GX2BoPRjLR+ly/VCV0t8BmCCyQ0g2KY9QR1BYpy5kjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6p63Wcz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:42 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07FDF1E7D;
	Wed, 13 Aug 2025 10:02:34 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE9203F738;
	Wed, 13 Aug 2025 10:02:37 -0700 (PDT)
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
Subject: [PATCH 17/19] perf: Retire PERF_PMU_CAP_NO_INTERRUPT
Date: Wed, 13 Aug 2025 18:01:09 +0100
Message-Id: <32bf39943eef7c7f516d814d749cdbe322eec204.1755096883.git.robin.murphy@arm.com>
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

Now that we have a well-defined cap for sampling support, clean up the
remains of the mildly unintuitive and inconsistently-applied
PERF_PMU_CAP_NO_INTERRUPT. Not to mention the obvious redundancy of
some of these drivers still checking for sampling in event_init too.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arc/kernel/perf_event.c              |  4 +---
 arch/csky/kernel/perf_event.c             |  1 -
 arch/powerpc/perf/8xx-pmu.c               |  3 +--
 arch/powerpc/perf/hv-24x7.c               |  3 ---
 arch/powerpc/perf/hv-gpci.c               |  3 ---
 arch/powerpc/perf/kvm-hv-pmu.c            |  2 +-
 arch/powerpc/perf/vpa-pmu.c               |  6 +-----
 arch/powerpc/platforms/pseries/papr_scm.c |  7 +------
 arch/s390/kernel/perf_cpum_cf.c           |  3 ---
 arch/sh/kernel/perf_event.c               |  1 -
 arch/x86/events/amd/uncore.c              |  6 +++---
 arch/x86/events/core.c                    |  1 -
 arch/x86/events/intel/cstate.c            |  9 +++------
 arch/x86/events/msr.c                     |  5 +----
 drivers/fpga/dfl-fme-perf.c               |  6 ++----
 drivers/perf/arm_cspmu/arm_cspmu.c        | 14 ++------------
 drivers/perf/arm_pmu_platform.c           |  1 -
 drivers/perf/marvell_cn10k_tad_pmu.c      |  3 +--
 drivers/perf/riscv_pmu_legacy.c           |  1 -
 drivers/perf/riscv_pmu_sbi.c              |  1 -
 drivers/powercap/intel_rapl_common.c      |  2 +-
 include/linux/perf_event.h                |  1 -
 22 files changed, 18 insertions(+), 65 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 1b99b0215027..7e154f6f0abd 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -816,9 +816,7 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 
 	}
 
-	if (irq == -1)
-		arc_pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
-	else
+	if (irq != -1)
 		arc_pmu->pmu.capabilities |= PERF_PMU_CAP_SAMPLING;
 
 	/*
diff --git a/arch/csky/kernel/perf_event.c b/arch/csky/kernel/perf_event.c
index c5ba6e235a6f..ecf4b2863f78 100644
--- a/arch/csky/kernel/perf_event.c
+++ b/arch/csky/kernel/perf_event.c
@@ -1316,7 +1316,6 @@ int csky_pmu_device_probe(struct platform_device *pdev,
 	ret = csky_pmu_request_irq(csky_pmu_handle_irq);
 	if (ret) {
 		csky_pmu.pmu.capabilities &= ~PERF_PMU_CAP_SAMPLING;
-		csky_pmu.pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 		pr_notice("[perf] PMU request irq fail!\n");
 	}
 
diff --git a/arch/powerpc/perf/8xx-pmu.c b/arch/powerpc/perf/8xx-pmu.c
index 1d2972229e3a..71c35bd72eae 100644
--- a/arch/powerpc/perf/8xx-pmu.c
+++ b/arch/powerpc/perf/8xx-pmu.c
@@ -181,8 +181,7 @@ static struct pmu mpc8xx_pmu = {
 	.add		= mpc8xx_pmu_add,
 	.del		= mpc8xx_pmu_del,
 	.read		= mpc8xx_pmu_read,
-	.capabilities	= PERF_PMU_CAP_NO_INTERRUPT |
-			  PERF_PMU_CAP_NO_NMI,
+	.capabilities	= PERF_PMU_CAP_NO_NMI,
 };
 
 static int init_mpc8xx_pmu(void)
diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index e42677cc254a..ab906616e570 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -1726,9 +1726,6 @@ static int hv_24x7_init(void)
 	if (!hv_page_cache)
 		return -ENOMEM;
 
-	/* sampling not supported */
-	h_24x7_pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
-
 	r = create_events_from_catalog(&event_group.attrs,
 				   &event_desc_group.attrs,
 				   &event_long_desc_group.attrs);
diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 241551d1282f..1726690396ec 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -1008,9 +1008,6 @@ static int hv_gpci_init(void)
 	if (r)
 		return r;
 
-	/* sampling not supported */
-	h_gpci_pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
-
 	arg = (void *)get_cpu_var(hv_gpci_reqb);
 	memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
 
diff --git a/arch/powerpc/perf/kvm-hv-pmu.c b/arch/powerpc/perf/kvm-hv-pmu.c
index ae264c9080ef..1c6bc65c986c 100644
--- a/arch/powerpc/perf/kvm-hv-pmu.c
+++ b/arch/powerpc/perf/kvm-hv-pmu.c
@@ -391,7 +391,7 @@ static struct pmu kvmppc_pmu = {
 	.attr_groups = kvmppc_pmu_attr_groups,
 	.type = -1,
 	.scope = PERF_PMU_SCOPE_SYS_WIDE,
-	.capabilities = PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT,
+	.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
 };
 
 static int __init kvmppc_register_pmu(void)
diff --git a/arch/powerpc/perf/vpa-pmu.c b/arch/powerpc/perf/vpa-pmu.c
index 840733468959..1d360b5bf67c 100644
--- a/arch/powerpc/perf/vpa-pmu.c
+++ b/arch/powerpc/perf/vpa-pmu.c
@@ -75,10 +75,6 @@ static int vpa_pmu_event_init(struct perf_event *event)
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
 
-	/* it does not support event sampling mode */
-	if (is_sampling_event(event))
-		return -EOPNOTSUPP;
-
 	/* no branch sampling */
 	if (has_branch_stack(event))
 		return -EOPNOTSUPP;
@@ -164,7 +160,7 @@ static struct pmu vpa_pmu = {
 	.del		= vpa_pmu_del,
 	.read		= vpa_pmu_read,
 	.attr_groups	= vpa_pmu_attr_groups,
-	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT,
+	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 };
 
 static int __init pseries_vpa_pmu_init(void)
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index f7c9271bda58..d752cdaf8422 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -379,10 +379,6 @@ static int papr_scm_pmu_event_init(struct perf_event *event)
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
 
-	/* it does not support event sampling mode */
-	if (is_sampling_event(event))
-		return -EOPNOTSUPP;
-
 	/* no branch sampling */
 	if (has_branch_stack(event))
 		return -EOPNOTSUPP;
@@ -463,8 +459,7 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 	nd_pmu->pmu.add = papr_scm_pmu_add;
 	nd_pmu->pmu.del = papr_scm_pmu_del;
 
-	nd_pmu->pmu.capabilities = PERF_PMU_CAP_NO_INTERRUPT |
-				PERF_PMU_CAP_NO_EXCLUDE;
+	nd_pmu->pmu.capabilities = PERF_PMU_CAP_NO_EXCLUDE;
 
 	/*updating the cpumask variable */
 	nodeid = numa_map_to_online_node(dev_to_node(&p->pdev->dev));
diff --git a/arch/s390/kernel/perf_cpum_cf.c b/arch/s390/kernel/perf_cpum_cf.c
index 7d10842d54f0..1a94e0944bc5 100644
--- a/arch/s390/kernel/perf_cpum_cf.c
+++ b/arch/s390/kernel/perf_cpum_cf.c
@@ -760,8 +760,6 @@ static int __hw_perf_event_init(struct perf_event *event, unsigned int type)
 		break;
 
 	case PERF_TYPE_HARDWARE:
-		if (is_sampling_event(event))	/* No sampling support */
-			return -ENOENT;
 		ev = attr->config;
 		if (!attr->exclude_user && attr->exclude_kernel) {
 			/*
@@ -1056,7 +1054,6 @@ static void cpumf_pmu_del(struct perf_event *event, int flags)
 /* Performance monitoring unit for s390x */
 static struct pmu cpumf_pmu = {
 	.task_ctx_nr  = perf_sw_context,
-	.capabilities = PERF_PMU_CAP_NO_INTERRUPT,
 	.pmu_enable   = cpumf_pmu_enable,
 	.pmu_disable  = cpumf_pmu_disable,
 	.event_init   = cpumf_pmu_event_init,
diff --git a/arch/sh/kernel/perf_event.c b/arch/sh/kernel/perf_event.c
index 1d2507f22437..d1b534538524 100644
--- a/arch/sh/kernel/perf_event.c
+++ b/arch/sh/kernel/perf_event.c
@@ -352,7 +352,6 @@ int register_sh_pmu(struct sh_pmu *_pmu)
 	 * no interrupts, and are therefore unable to do sampling without
 	 * further work and timer assistance.
 	 */
-	pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 
 	WARN_ON(_pmu->num_events > MAX_HWEVENTS);
 
diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
index e8b6af199c73..050a5567291a 100644
--- a/arch/x86/events/amd/uncore.c
+++ b/arch/x86/events/amd/uncore.c
@@ -767,7 +767,7 @@ int amd_uncore_df_ctx_init(struct amd_uncore *uncore, unsigned int cpu)
 		.start		= amd_uncore_start,
 		.stop		= amd_uncore_stop,
 		.read		= amd_uncore_read,
-		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 		.module		= THIS_MODULE,
 	};
 
@@ -903,7 +903,7 @@ int amd_uncore_l3_ctx_init(struct amd_uncore *uncore, unsigned int cpu)
 		.start		= amd_uncore_start,
 		.stop		= amd_uncore_stop,
 		.read		= amd_uncore_read,
-		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 		.module		= THIS_MODULE,
 	};
 
@@ -1068,7 +1068,7 @@ int amd_uncore_umc_ctx_init(struct amd_uncore *uncore, unsigned int cpu)
 				.start		= amd_uncore_umc_start,
 				.stop		= amd_uncore_stop,
 				.read		= amd_uncore_umc_read,
-				.capabilities	= PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT,
+				.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 				.module		= THIS_MODULE,
 			};
 
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 72a4c43951ee..789dfca2fa67 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -1836,7 +1836,6 @@ static void __init pmu_check_apic(void)
 	 * events (user-space has to fall back and
 	 * sample via a hrtimer based software event):
 	 */
-	pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 	pmu.capabilities &= ~PERF_PMU_CAP_SAMPLING;
 }
 
diff --git a/arch/x86/events/intel/cstate.c b/arch/x86/events/intel/cstate.c
index ec753e39b007..2a79717b898f 100644
--- a/arch/x86/events/intel/cstate.c
+++ b/arch/x86/events/intel/cstate.c
@@ -281,9 +281,6 @@ static int cstate_pmu_event_init(struct perf_event *event)
 		return -ENOENT;
 
 	/* unsupported modes and filters */
-	if (event->attr.sample_period) /* no sampling */
-		return -EINVAL;
-
 	if (event->cpu < 0)
 		return -EINVAL;
 
@@ -397,7 +394,7 @@ static struct pmu cstate_core_pmu = {
 	.start		= cstate_pmu_event_start,
 	.stop		= cstate_pmu_event_stop,
 	.read		= cstate_pmu_event_update,
-	.capabilities	= PERF_PMU_CAP_NO_INTERRUPT | PERF_PMU_CAP_NO_EXCLUDE,
+	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	.scope		= PERF_PMU_SCOPE_CORE,
 	.module		= THIS_MODULE,
 };
@@ -413,7 +410,7 @@ static struct pmu cstate_pkg_pmu = {
 	.start		= cstate_pmu_event_start,
 	.stop		= cstate_pmu_event_stop,
 	.read		= cstate_pmu_event_update,
-	.capabilities	= PERF_PMU_CAP_NO_INTERRUPT | PERF_PMU_CAP_NO_EXCLUDE,
+	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	.scope		= PERF_PMU_SCOPE_PKG,
 	.module		= THIS_MODULE,
 };
@@ -429,7 +426,7 @@ static struct pmu cstate_module_pmu = {
 	.start		= cstate_pmu_event_start,
 	.stop		= cstate_pmu_event_stop,
 	.read		= cstate_pmu_event_update,
-	.capabilities	= PERF_PMU_CAP_NO_INTERRUPT | PERF_PMU_CAP_NO_EXCLUDE,
+	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	.scope		= PERF_PMU_SCOPE_CLUSTER,
 	.module		= THIS_MODULE,
 };
diff --git a/arch/x86/events/msr.c b/arch/x86/events/msr.c
index 7f5007a4752a..3285c1f3bb90 100644
--- a/arch/x86/events/msr.c
+++ b/arch/x86/events/msr.c
@@ -210,9 +210,6 @@ static int msr_event_init(struct perf_event *event)
 		return -ENOENT;
 
 	/* unsupported modes and filters */
-	if (event->attr.sample_period) /* no sampling */
-		return -EINVAL;
-
 	if (cfg >= PERF_MSR_EVENT_MAX)
 		return -EINVAL;
 
@@ -298,7 +295,7 @@ static struct pmu pmu_msr = {
 	.start		= msr_event_start,
 	.stop		= msr_event_stop,
 	.read		= msr_event_update,
-	.capabilities	= PERF_PMU_CAP_NO_INTERRUPT | PERF_PMU_CAP_NO_EXCLUDE,
+	.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	.attr_update	= attr_update,
 };
 
diff --git a/drivers/fpga/dfl-fme-perf.c b/drivers/fpga/dfl-fme-perf.c
index 7422d2bc6f37..a1e2e7f28a3a 100644
--- a/drivers/fpga/dfl-fme-perf.c
+++ b/drivers/fpga/dfl-fme-perf.c
@@ -806,9 +806,8 @@ static int fme_perf_event_init(struct perf_event *event)
 	/*
 	 * fme counters are shared across all cores.
 	 * Therefore, it does not support per-process mode.
-	 * Also, it does not support event sampling mode.
 	 */
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
+	if (event->attach_state & PERF_ATTACH_TASK)
 		return -EINVAL;
 
 	if (event->cpu < 0)
@@ -921,8 +920,7 @@ static int fme_perf_pmu_register(struct platform_device *pdev,
 	pmu->start =		fme_perf_event_start;
 	pmu->stop =		fme_perf_event_stop;
 	pmu->read =		fme_perf_event_read;
-	pmu->capabilities =	PERF_PMU_CAP_NO_INTERRUPT |
-				PERF_PMU_CAP_NO_EXCLUDE;
+	pmu->capabilities =	PERF_PMU_CAP_NO_EXCLUDE;
 
 	name = devm_kasprintf(priv->dev, GFP_KERNEL, "dfl_fme%d", pdev->id);
 
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 7f5ea749b85c..761b438db231 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -608,12 +608,6 @@ static int arm_cspmu_event_init(struct perf_event *event)
 	 * Following other "uncore" PMUs, we do not support sampling mode or
 	 * attach to a task (per-process mode).
 	 */
-	if (is_sampling_event(event)) {
-		dev_dbg(cspmu->pmu.dev,
-			"Can't support sampling events\n");
-		return -EOPNOTSUPP;
-	}
-
 	if (event->cpu < 0 || event->attach_state & PERF_ATTACH_TASK) {
 		dev_dbg(cspmu->pmu.dev,
 			"Can't support per-task counters\n");
@@ -1128,7 +1122,7 @@ static int arm_cspmu_get_cpus(struct arm_cspmu *cspmu)
 
 static int arm_cspmu_register_pmu(struct arm_cspmu *cspmu)
 {
-	int ret, capabilities;
+	int ret;
 
 	ret = arm_cspmu_alloc_attr_groups(cspmu);
 	if (ret)
@@ -1139,10 +1133,6 @@ static int arm_cspmu_register_pmu(struct arm_cspmu *cspmu)
 	if (ret)
 		return ret;
 
-	capabilities = PERF_PMU_CAP_NO_EXCLUDE;
-	if (cspmu->irq == 0)
-		capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
-
 	cspmu->pmu = (struct pmu){
 		.task_ctx_nr	= perf_invalid_context,
 		.module		= cspmu->impl.module,
@@ -1156,7 +1146,7 @@ static int arm_cspmu_register_pmu(struct arm_cspmu *cspmu)
 		.stop		= arm_cspmu_stop,
 		.read		= arm_cspmu_read,
 		.attr_groups	= cspmu->attr_groups,
-		.capabilities	= capabilities,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
 	/* Hardware counter init */
diff --git a/drivers/perf/arm_pmu_platform.c b/drivers/perf/arm_pmu_platform.c
index ab7a802cd0d6..754dba9e4528 100644
--- a/drivers/perf/arm_pmu_platform.c
+++ b/drivers/perf/arm_pmu_platform.c
@@ -110,7 +110,6 @@ static int pmu_parse_irqs(struct arm_pmu *pmu)
 	if (num_irqs == 0) {
 		dev_warn(dev, "no irqs for PMU, sampling events not supported\n");
 		pmu->pmu.capabilities &= ~PERF_PMU_CAP_SAMPLING;
-		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 		cpumask_setall(&pmu->supported_cpus);
 		return 0;
 	}
diff --git a/drivers/perf/marvell_cn10k_tad_pmu.c b/drivers/perf/marvell_cn10k_tad_pmu.c
index ee6505cb01a7..a162e707a639 100644
--- a/drivers/perf/marvell_cn10k_tad_pmu.c
+++ b/drivers/perf/marvell_cn10k_tad_pmu.c
@@ -360,8 +360,7 @@ static int tad_pmu_probe(struct platform_device *pdev)
 	tad_pmu->pmu = (struct pmu) {
 
 		.module		= THIS_MODULE,
-		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE |
-				  PERF_PMU_CAP_NO_INTERRUPT,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 		.task_ctx_nr	= perf_invalid_context,
 
 		.event_init	= tad_pmu_event_init,
diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 93c8e0fdb589..40140e457454 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -123,7 +123,6 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 	pmu->event_mapped = pmu_legacy_event_mapped;
 	pmu->event_unmapped = pmu_legacy_event_unmapped;
 	pmu->csr_index = pmu_legacy_csr_index;
-	pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 	pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
 
 	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index d185ea8c47ba..4fb1aab0b547 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1359,7 +1359,6 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	ret = pmu_sbi_setup_irqs(pmu, pdev);
 	if (ret < 0) {
 		pr_info("Perf sampling/filtering is not supported as sscof extension is not available\n");
-		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
 	} else {
 		pmu->pmu.capabilities |= PERF_PMU_CAP_SAMPLING;
diff --git a/drivers/powercap/intel_rapl_common.c b/drivers/powercap/intel_rapl_common.c
index c7e7f9bf5313..38470351217b 100644
--- a/drivers/powercap/intel_rapl_common.c
+++ b/drivers/powercap/intel_rapl_common.c
@@ -2014,7 +2014,7 @@ static int rapl_pmu_update(struct rapl_package *rp)
 	rapl_pmu.pmu.stop = rapl_pmu_event_stop;
 	rapl_pmu.pmu.read = rapl_pmu_event_read;
 	rapl_pmu.pmu.module = THIS_MODULE;
-	rapl_pmu.pmu.capabilities = PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT;
+	rapl_pmu.pmu.capabilities = PERF_PMU_CAP_NO_EXCLUDE;
 	ret = perf_pmu_register(&rapl_pmu.pmu, "power", -1);
 	if (ret) {
 		pr_info("Failed to register PMU\n");
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index bf2cfbeabba2..183b7c48b329 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -305,7 +305,6 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
 #define PERF_PMU_CAP_AUX_PAUSE		0x0200
 #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
-#define PERF_PMU_CAP_NO_INTERRUPT	0x0800
 
 /**
  * pmu::scope
-- 
2.39.2.101.g768bb238c484.dirty


