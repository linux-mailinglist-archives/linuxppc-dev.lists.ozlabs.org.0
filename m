Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 818CB4604EA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 07:25:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1z3z2svmz3cmQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 17:25:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a5JTXAi8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=a5JTXAi8; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1vnP35lPz303H
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 14:57:11 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id o17so12925737qtk.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 19:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fJ8xfnVA+NPUIa5t4yWgB58hLT4DLWUqrE9DXdtQP+o=;
 b=a5JTXAi8QEj68vc4ha+mPXa/ak1/OEEuTBec3AMtr1hEzo8fmCz3oIwEmN3K8kvQYB
 67gv/rNWFdzwHiZFz09bpXG9HR51wjgigxUHIjdtAoVE4YB1vUAdNadlYIOtRZECxgba
 qt3C1oVJF96hYIQdDKlDO0FBz0TCdg6G1jktJ3RCIVLkJZMOcXupEqyjZfFMvq2MAme6
 UgcKwKoiTAaN0noh2ql7FQQ0Jxhmh2WckqBiI0uS0tM+dBCqWKfFUMxoZTvkiS3PR3wT
 /2lsgPXrHRO/TwsRXE/k4NEjrGiabGxA6/xpgMyYfvSqIbYUO/V0Hzjl329Ng6juxWHT
 KZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fJ8xfnVA+NPUIa5t4yWgB58hLT4DLWUqrE9DXdtQP+o=;
 b=AWf3uJ6oU+VDdnFzfqsL5PoxnUz4e8hRhAcFzzZfDRGL9Lrt0B7Ay0+kq5SYUNWpUr
 vOt0cZy9dcwBr8lltMLuSjvfxCaj0ofqyFtLuzXhznpMjMqHEz3P3ZOT3kD3EEoCrcYT
 QIMRmdU+Jp2oLTPB1B1JhlQUtjaYe98HLebexy9KPNvhDYcq1QsXuTu3WBnEyk4ag/Ig
 JAb7rvb++JehWr9mtOUTy7f2ZqDASLBFAP8V3JUpBUCLfYoD9vhijhK2XYJJWoYhlB8z
 JXdsVfaVG9sccOZ9hOXGFSrfcyG81lUil9HkSXinF8O+rEEs/Ggs8B2nB1B4udrVjqb5
 lOmg==
X-Gm-Message-State: AOAM530hxGQlbn2wL74ezJHjLyHEpo2+TAg9EyrHaBFwsZPPhPCK3aWz
 xewQQOYwA87EljbjhC2fhaw=
X-Google-Smtp-Source: ABdhPJy1HODbinFYUK0hw6hMtPG5eVjRVeAWjrsAbI29+G07rR15rsN4J5IN8e01ddnXvrZIRqJNZg==
X-Received: by 2002:ac8:7fc2:: with SMTP id b2mr35277966qtk.114.1638071826940; 
 Sat, 27 Nov 2021 19:57:06 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id x17sm6473647qta.66.2021.11.27.19.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 19:57:06 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexey Klimov <aklimov@redhat.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, David Laight <David.Laight@ACULAB.COM>,
 Dennis Zhou <dennis@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, Jonathan Cameron <jic23@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>, Kalle Valo <kvalo@codeaurora.org>,
 Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Marcin Wojtas <mw@semihalf.com>, Mark Gross <markgross@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mel Gorman <mgorman@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Roy Pledge <Roy.Pledge@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Saeed Mahameed <saeedm@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Boyd <sboyd@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Steven Rostedt <rostedt@goodmis.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Sunil Goutham <sgoutham@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Tejun Heo <tj@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Vineet Gupta <vgupta@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, kvm@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Date: Sat, 27 Nov 2021 19:56:55 -0800
Message-Id: <20211128035704.270739-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Nov 2021 17:23:17 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In many cases people use bitmap_weight()-based functions like this:

	if (num_present_cpus() > 1)
		do_something();

This may take considerable amount of time on many-cpus machines because
num_present_cpus() will traverse every word of underlying cpumask
unconditionally.

We can significantly improve on it for many real cases if stop traversing
the mask as soon as we count present cpus to any number greater than 1:

	if (num_present_cpus_gt(1))
		do_something();

To implement this idea, the series adds bitmap_weight_{eq,gt,le}
functions together with corresponding wrappers in cpumask and nodemask.

Yury Norov (9):
  lib/bitmap: add bitmap_weight_{eq,gt,le}
  lib/bitmap: implement bitmap_{empty,full} with bitmap_weight_eq()
  all: replace bitmap_weigth() with bitmap_{empty,full,eq,gt,le}
  tools: sync bitmap_weight() usage with the kernel
  lib/cpumask: add cpumask_weight_{eq,gt,le}
  lib/nodemask: add nodemask_weight_{eq,gt,le}
  lib/cpumask: add num_{possible,present,active}_cpus_{eq,gt,le}
  lib/nodemask: add num_node_state_eq()
  MAINTAINERS: add cpumask and nodemask files to BITMAP_API

 MAINTAINERS                                   |  4 ++
 arch/alpha/kernel/process.c                   |  2 +-
 arch/arc/kernel/smp.c                         |  2 +-
 arch/arm/kernel/machine_kexec.c               |  2 +-
 arch/arm/mach-exynos/exynos.c                 |  2 +-
 arch/arm/mm/cache-b15-rac.c                   |  2 +-
 arch/arm64/kernel/smp.c                       |  2 +-
 arch/arm64/mm/context.c                       |  2 +-
 arch/csky/mm/asid.c                           |  2 +-
 arch/csky/mm/context.c                        |  2 +-
 arch/ia64/kernel/setup.c                      |  2 +-
 arch/ia64/mm/tlb.c                            |  8 +--
 arch/mips/cavium-octeon/octeon-irq.c          |  4 +-
 arch/mips/kernel/crash.c                      |  2 +-
 arch/mips/kernel/i8253.c                      |  2 +-
 arch/mips/kernel/perf_event_mipsxx.c          |  4 +-
 arch/mips/kernel/rtlx-cmp.c                   |  2 +-
 arch/mips/kernel/smp.c                        |  4 +-
 arch/mips/kernel/vpe-cmp.c                    |  2 +-
 .../loongson2ef/common/cs5536/cs5536_mfgpt.c  |  2 +-
 arch/mips/mm/context.c                        |  2 +-
 arch/mips/mm/tlbex.c                          |  2 +-
 arch/nds32/kernel/perf_event_cpu.c            |  4 +-
 arch/nios2/kernel/cpuinfo.c                   |  2 +-
 arch/powerpc/kernel/smp.c                     |  2 +-
 arch/powerpc/kernel/watchdog.c                |  4 +-
 arch/powerpc/platforms/85xx/smp.c             |  2 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |  4 +-
 arch/powerpc/sysdev/mpic.c                    |  2 +-
 arch/powerpc/xmon/xmon.c                      | 10 +--
 arch/riscv/kvm/vmid.c                         |  2 +-
 arch/s390/kernel/perf_cpum_cf.c               |  2 +-
 arch/sparc/kernel/mdesc.c                     |  6 +-
 arch/x86/events/amd/core.c                    |  2 +-
 arch/x86/kernel/alternative.c                 |  8 +--
 arch/x86/kernel/apic/apic.c                   |  4 +-
 arch/x86/kernel/apic/apic_flat_64.c           |  2 +-
 arch/x86/kernel/apic/probe_32.c               |  2 +-
 arch/x86/kernel/cpu/mce/dev-mcelog.c          |  2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 18 +++---
 arch/x86/kernel/hpet.c                        |  2 +-
 arch/x86/kernel/i8253.c                       |  2 +-
 arch/x86/kernel/kvm.c                         |  2 +-
 arch/x86/kernel/kvmclock.c                    |  2 +-
 arch/x86/kernel/smpboot.c                     |  4 +-
 arch/x86/kernel/tsc.c                         |  2 +-
 arch/x86/kvm/hyperv.c                         |  8 +--
 arch/x86/mm/amdtopology.c                     |  2 +-
 arch/x86/mm/mmio-mod.c                        |  2 +-
 arch/x86/mm/numa_emulation.c                  |  4 +-
 arch/x86/platform/uv/uv_nmi.c                 |  2 +-
 arch/x86/xen/smp_pv.c                         |  2 +-
 arch/x86/xen/spinlock.c                       |  2 +-
 drivers/acpi/numa/srat.c                      |  2 +-
 drivers/clk/samsung/clk-exynos4.c             |  2 +-
 drivers/clocksource/ingenic-timer.c           |  3 +-
 drivers/cpufreq/pcc-cpufreq.c                 |  2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c             |  2 +-
 drivers/cpufreq/scmi-cpufreq.c                |  2 +-
 drivers/crypto/ccp/ccp-dev-v5.c               |  5 +-
 drivers/dma/mv_xor.c                          |  5 +-
 drivers/firmware/psci/psci_checker.c          |  2 +-
 drivers/gpu/drm/i810/i810_drv.c               |  2 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c      |  2 +-
 drivers/hv/channel_mgmt.c                     |  4 +-
 drivers/iio/adc/mxs-lradc-adc.c               |  3 +-
 drivers/iio/dummy/iio_simple_dummy_buffer.c   |  4 +-
 drivers/iio/industrialio-buffer.c             |  2 +-
 drivers/iio/industrialio-trigger.c            |  2 +-
 drivers/infiniband/hw/hfi1/affinity.c         | 13 ++--
 drivers/infiniband/hw/qib/qib_file_ops.c      |  2 +-
 drivers/infiniband/hw/qib/qib_iba7322.c       |  2 +-
 drivers/infiniband/sw/siw/siw_main.c          |  3 +-
 drivers/irqchip/irq-bcm6345-l1.c              |  2 +-
 drivers/irqchip/irq-gic.c                     |  2 +-
 drivers/memstick/core/ms_block.c              |  4 +-
 drivers/net/caif/caif_virtio.c                |  2 +-
 drivers/net/dsa/b53/b53_common.c              |  2 +-
 drivers/net/ethernet/broadcom/bcmsysport.c    |  6 +-
 .../cavium/liquidio/cn23xx_vf_device.c        |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c |  2 +-
 .../net/ethernet/intel/ice/ice_virtchnl_pf.c  |  4 +-
 .../net/ethernet/intel/ixgbe/ixgbe_sriov.c    |  2 +-
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  2 +-
 .../marvell/octeontx2/nic/otx2_ethtool.c      |  2 +-
 .../marvell/octeontx2/nic/otx2_flows.c        |  8 +--
 .../ethernet/marvell/octeontx2/nic/otx2_pf.c  |  2 +-
 drivers/net/ethernet/mellanox/mlx4/cmd.c      | 10 +--
 drivers/net/ethernet/mellanox/mlx4/eq.c       |  4 +-
 drivers/net/ethernet/mellanox/mlx4/main.c     |  2 +-
 .../ethernet/mellanox/mlx5/core/en_ethtool.c  |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_dev.c     |  3 +-
 drivers/net/ethernet/qlogic/qed/qed_rdma.c    |  4 +-
 drivers/net/ethernet/qlogic/qed/qed_roce.c    |  2 +-
 drivers/net/wireless/ath/ath9k/hw.c           |  2 +-
 drivers/net/wireless/marvell/mwifiex/main.c   |  4 +-
 drivers/net/wireless/st/cw1200/queue.c        |  3 +-
 drivers/nvdimm/region.c                       |  2 +-
 drivers/nvme/host/pci.c                       |  2 +-
 drivers/perf/arm-cci.c                        |  2 +-
 drivers/perf/arm_pmu.c                        |  6 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.c      |  2 +-
 drivers/perf/thunderx2_pmu.c                  |  3 +-
 drivers/perf/xgene_pmu.c                      |  2 +-
 .../intel/speed_select_if/isst_if_common.c    |  6 +-
 drivers/pwm/pwm-pca9685.c                     |  2 +-
 drivers/scsi/lpfc/lpfc_init.c                 |  2 +-
 drivers/soc/bcm/brcmstb/biuctrl.c             |  2 +-
 drivers/soc/fsl/dpio/dpio-service.c           |  4 +-
 drivers/soc/fsl/qbman/qman_test_stash.c       |  2 +-
 drivers/spi/spi-dw-bt1.c                      |  2 +-
 drivers/staging/media/tegra-video/vi.c        |  2 +-
 drivers/thermal/intel/intel_powerclamp.c      | 10 ++-
 drivers/virt/acrn/hsm.c                       |  2 +-
 fs/ocfs2/cluster/heartbeat.c                  | 14 ++---
 fs/xfs/xfs_sysfs.c                            |  2 +-
 include/linux/bitmap.h                        | 45 ++++++++++---
 include/linux/cpumask.h                       | 55 ++++++++++++++++
 include/linux/kdb.h                           |  2 +-
 include/linux/nodemask.h                      | 29 +++++++++
 kernel/debug/kdb/kdb_bt.c                     |  2 +-
 kernel/irq/affinity.c                         |  2 +-
 kernel/padata.c                               |  2 +-
 kernel/printk/printk.c                        |  2 +-
 kernel/rcu/tree_nocb.h                        |  4 +-
 kernel/rcu/tree_plugin.h                      |  2 +-
 kernel/reboot.c                               |  4 +-
 kernel/sched/core.c                           | 10 +--
 kernel/sched/topology.c                       |  4 +-
 kernel/time/clockevents.c                     |  4 +-
 kernel/time/clocksource.c                     |  2 +-
 lib/bitmap.c                                  | 63 +++++++++++++++++++
 mm/mempolicy.c                                |  2 +-
 mm/page_alloc.c                               |  2 +-
 mm/percpu.c                                   |  6 +-
 mm/slab.c                                     |  2 +-
 mm/vmstat.c                                   |  4 +-
 tools/include/linux/bitmap.h                  | 42 ++++++++++---
 tools/lib/bitmap.c                            | 60 ++++++++++++++++++
 tools/perf/builtin-c2c.c                      |  4 +-
 tools/perf/util/pmu.c                         |  2 +-
 142 files changed, 490 insertions(+), 251 deletions(-)

-- 
2.25.1

