Return-Path: <linuxppc-dev+bounces-10938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B2DB25096
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:02:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F603970z30T8;
	Thu, 14 Aug 2025 03:02:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104520;
	cv=none; b=QQsV/uJhzboNybwsq6nbooy3WqJfh998hBOMqPVx6m/3n7YmCmmmZFvXL4BiB0+ZGIc5XD9aNgHkVi8QoKdTv0KdwS2wE91JHG6Jodv2+iOugSldJnIzxbDKs/yZFeef+pF0Jl2QF8e4zVyjpO2vpJ7JX7stqYJy1R076Ulk0umJKfJN8p0UKrkYZY2f+ul6YGNILWde4tTLJ0c78nVIqr6HgLh0Zson6UWSWCdFI/t6O3ZcT71LwXHXVztabndcmkqNv4f+l+6JqLhZvqtpL++riuw890wt6wgBGBmpzkf5K4yTis669XI0r67M2SCr/TGmzIscJnTJxMji044AIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104520; c=relaxed/relaxed;
	bh=LaDr5orf6FTdt89gm/cP6+5HeZgnDgV25g7zZzcZjqk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iKtzQftICKs0/zxIx2avqF3WbqPNIcvJiOzL7fxACPnRP+O0ryEOHVe8rayBxH5MutSHuthtANgsU6pGyLs06qrI08MHswsjmxENjpsklfQxsY1FSyrHUO8OIwKGqwKWXd+wbyInYfTxSTBVN4Ry8mVPaWKGQqqLl7FsUl/Led5IHIY/lhWQBYbDKel/zCAqH8PQjPPNuS5ePhaXCMYdetV/oHhMJrlgtajDjABBOfoMcWP91v8aPe004YxIXkVz4L3ENYQtOQq09eVNq3bPQKxB5UIlKFcDyWIGliT823VoAqPIgpwdePiljsm9hXhiefNPxrOn17KvB8lZcXAJQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F5z29jFz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:01:57 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CD3A12FC;
	Wed, 13 Aug 2025 10:01:17 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4DF23F738;
	Wed, 13 Aug 2025 10:01:20 -0700 (PDT)
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
Subject: [PATCH 00/19] perf: Rework event_init checks
Date: Wed, 13 Aug 2025 18:00:52 +0100
Message-Id: <cover.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
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

Hi all,

[ Note I'm only CC'ing lists for now to avoid spamming nearly 100 
  individual maintainers/reviewers while we work out the basics ]

Reviving my idea from a few years back, the aim here is to minimise
the amount of event_init boilerplate that most new drivers have to
implement (and so many get wrong), while also trying to establish
some more consistent and easy-to-follow patterns for the things that
drivers should still care about (mostly group validation).

It's ended up somewhat big and ugly, so to start with I've tried to
optimise for ease of review - based on the typical "fixes, cleanup,
new development" order the split of the current patches is like so:

* Group validation rework (patches #1-#15)
  - Specific drivers with functional issues by inspection (#1-#7)
  - Specific drivers where cleanup changes were non-trivial (#8-#11)
  - Common patterns across remaining drivers (#12-#15)
* Capabilities rework (patches #16-#18)
* Giant bonfire of remaining boilerplate! (patch #19)

If the overall idea is acceptable then a more relaxed merge strategy
might be to look at landing the common parts first (#16-#18 and maybe
#13), then rearrange the rest into per-driver patches, but I'm sure
nobody wants a ~70-patch series out of the gate :)

Thanks,
Robin.


Robin Murphy (19):
  perf/arm-cmn: Fix event validation
  perf/hisilicon: Fix group validation
  perf/imx8_ddr: Fix group validation
  perf/starfive: Fix group validation
  iommu/vt-d: Fix perfmon group validation
  ARM: l2x0: Fix group validation
  ARM: imx: Fix MMDC PMU group validation
  perf/arm_smmu_v3: Improve group validation
  perf/qcom: Improve group validation
  perf/arm-ni: Improve event validation
  perf/arm-cci: Tidy up event validation
  perf: Ignore event state for group validation
  perf: Add helper for checking grouped events
  perf: Clean up redundant group validation
  perf: Simplify group validation
  perf: Introduce positive capability for sampling
  perf: Retire PERF_PMU_CAP_NO_INTERRUPT
  perf: Introduce positive capability for raw events
  perf: Garbage-collect event_init checks

 arch/alpha/kernel/perf_event.c                |  5 +-
 arch/arc/kernel/perf_event.c                  |  4 +-
 arch/arm/mach-imx/mmdc.c                      | 29 ++----
 arch/arm/mm/cache-l2x0-pmu.c                  | 19 +---
 arch/csky/kernel/perf_event.c                 |  3 +-
 arch/loongarch/kernel/perf_event.c            |  1 +
 arch/mips/kernel/perf_event_mipsxx.c          |  1 +
 arch/powerpc/perf/8xx-pmu.c                   |  3 +-
 arch/powerpc/perf/core-book3s.c               |  4 +-
 arch/powerpc/perf/core-fsl-emb.c              |  4 +-
 arch/powerpc/perf/hv-24x7.c                   | 11 ---
 arch/powerpc/perf/hv-gpci.c                   | 11 ---
 arch/powerpc/perf/imc-pmu.c                   | 31 +-----
 arch/powerpc/perf/kvm-hv-pmu.c                |  5 +-
 arch/powerpc/perf/vpa-pmu.c                   | 13 +--
 arch/powerpc/platforms/pseries/papr_scm.c     | 18 +---
 arch/s390/kernel/perf_cpum_cf.c               |  8 +-
 arch/s390/kernel/perf_cpum_sf.c               |  2 +
 arch/s390/kernel/perf_pai_crypto.c            |  1 +
 arch/s390/kernel/perf_pai_ext.c               |  1 +
 arch/sh/kernel/perf_event.c                   |  1 -
 arch/sparc/kernel/perf_event.c                |  4 +-
 arch/x86/events/amd/ibs.c                     | 32 ++-----
 arch/x86/events/amd/iommu.c                   | 15 ---
 arch/x86/events/amd/power.c                   |  7 --
 arch/x86/events/amd/uncore.c                  | 12 +--
 arch/x86/events/core.c                        |  7 +-
 arch/x86/events/intel/bts.c                   |  3 -
 arch/x86/events/intel/cstate.c                | 16 +---
 arch/x86/events/intel/pt.c                    |  3 -
 arch/x86/events/intel/uncore.c                | 16 +---
 arch/x86/events/intel/uncore_snb.c            | 18 ----
 arch/x86/events/msr.c                         |  8 +-
 arch/x86/events/rapl.c                        | 11 ---
 arch/xtensa/kernel/perf_event.c               |  1 +
 drivers/devfreq/event/rockchip-dfi.c          | 13 +--
 drivers/dma/idxd/perfmon.c                    | 17 +---
 drivers/fpga/dfl-fme-perf.c                   | 18 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c       |  4 -
 drivers/gpu/drm/i915/i915_pmu.c               | 13 ---
 drivers/gpu/drm/xe/xe_pmu.c                   | 13 ---
 .../hwtracing/coresight/coresight-etm-perf.c  |  5 -
 drivers/hwtracing/ptt/hisi_ptt.c              |  8 --
 drivers/iommu/intel/perfmon.c                 | 28 +++---
 drivers/perf/alibaba_uncore_drw_pmu.c         | 28 +-----
 drivers/perf/amlogic/meson_ddr_pmu_core.c     |  9 --
 drivers/perf/arm-cci.c                        | 56 +++--------
 drivers/perf/arm-ccn.c                        | 34 -------
 drivers/perf/arm-cmn.c                        | 15 +--
 drivers/perf/arm-ni.c                         | 35 +++----
 drivers/perf/arm_cspmu/arm_cspmu.c            | 34 +------
 drivers/perf/arm_dmc620_pmu.c                 | 28 +-----
 drivers/perf/arm_dsu_pmu.c                    | 26 +----
 drivers/perf/arm_pmu.c                        | 19 +---
 drivers/perf/arm_pmu_platform.c               |  2 +-
 drivers/perf/arm_smmuv3_pmu.c                 | 35 ++-----
 drivers/perf/arm_spe_pmu.c                    |  7 +-
 drivers/perf/cxl_pmu.c                        |  6 --
 drivers/perf/dwc_pcie_pmu.c                   | 21 +---
 drivers/perf/fsl_imx8_ddr_perf.c              | 32 +------
 drivers/perf/fsl_imx9_ddr_perf.c              | 27 ------
 drivers/perf/hisilicon/hisi_pcie_pmu.c        | 25 ++---
 drivers/perf/hisilicon/hisi_uncore_pmu.c      | 41 ++------
 drivers/perf/hisilicon/hns3_pmu.c             | 24 ++---
 drivers/perf/marvell_cn10k_ddr_pmu.c          | 18 ----
 drivers/perf/marvell_cn10k_tad_pmu.c          | 12 +--
 drivers/perf/marvell_pem_pmu.c                | 22 +----
 drivers/perf/qcom_l2_pmu.c                    | 96 ++++++-------------
 drivers/perf/qcom_l3_pmu.c                    | 33 ++-----
 drivers/perf/riscv_pmu_legacy.c               |  1 -
 drivers/perf/riscv_pmu_sbi.c                  |  3 +-
 drivers/perf/starfive_starlink_pmu.c          | 32 ++-----
 drivers/perf/thunderx2_pmu.c                  | 45 ++-------
 drivers/perf/xgene_pmu.c                      | 29 ------
 drivers/powercap/intel_rapl_common.c          |  9 +-
 include/linux/perf_event.h                    | 10 +-
 kernel/events/core.c                          | 35 +++++--
 kernel/events/hw_breakpoint.c                 |  1 +
 78 files changed, 244 insertions(+), 1053 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


