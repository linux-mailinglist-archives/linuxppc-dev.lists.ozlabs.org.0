Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C55FB479D6E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 22:40:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGfQZ4Lr7z3cHC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 08:40:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JJsYWCM4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JJsYWCM4; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGdzr0SDTz2xt7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Dec 2021 08:20:22 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id t19so9371793oij.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 13:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JzsjdMdsnVfTtF2jA28Re9um5Pc1jpset8TjSm+sCCQ=;
 b=JJsYWCM4ZBrFr/QGYcVtz1O5XpwXMR8kjk5zvlx1xd9d3Bnfs+RyARM+UF2BFzbQzh
 Gtz0Jhiop3r+qa0tUyPUPAMdU6Jzy350IR0tNVuhpUl5a46wJZSSCfrlTroVV0iEzWQm
 jnatXUCyMxUjx4zPd6MbwV+jlb+bcIyfWFewnkHP1g6bfMLkxOoJnBeNiY1ltSGyKLUW
 NJO78tJlSMx+Op9iY217snQDmDuDZZGnfHCB/c9C+zObP29p/bUuiIWC4jVIoflp+GZQ
 +vsH2Ey++3hW+p7C5pzF3cKCahFFKGna42dCmd+BpNpZItDrp0SdGfIa8OEsJ5ce8y7A
 EIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JzsjdMdsnVfTtF2jA28Re9um5Pc1jpset8TjSm+sCCQ=;
 b=xWs/q3kwI1FDWJK0OM5+esTPVHQkcVuIe7b2m1mvIEfnzypdp7gBAVKCq4lqDUPGPp
 5IjVLvbGIzdvk1AIUS3PQBG/ODSqDPHThRdyYD8UUjYF1nihE+gJtT7+Qu2fPcaGOyde
 HxWu51kuj2fOMuUZXAnO/VUVpCIk505vEfGDYx97LX4DwbzbQsVcLpX4vX78a0F0ryZr
 wLhxim/MNGMHhU0PqWLr90awN4TVWCvKL7a/rxootMOp3tI9kAgaZ2qLQKq4pmh4IaDT
 kukvOP2lDNHynx4ZTTDEW3YjWABpAdpv/wNtAvQmMKAqDlax7OwbwliDJ6gAjnYwCkTg
 hP7w==
X-Gm-Message-State: AOAM533hTCfhwxoXkP+qCyy23s1kTxHO1i6tim9CRiDv42KkhD0a+EHe
 B5WcxhO3+yCiET+tda3eUsM=
X-Google-Smtp-Source: ABdhPJx5aJcpDQGi8bZmEiNIZHDj12WYIMCd+iCUv3wO5n9NxzqY0XYaFcTOfyycv/QCCz3me1Quxg==
X-Received: by 2002:a05:6808:a8f:: with SMTP id
 q15mr12338850oij.65.1639862417151; 
 Sat, 18 Dec 2021 13:20:17 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id g26sm2402061ots.25.2021.12.18.13.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:16 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
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
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, Joe Perches <joe@perches.com>,
 Jonathan Cameron <jic23@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
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
 Russell King <linux@armlinux.org.uk>, Saeed Mahameed <saeedm@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>,
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
Subject: [PATCH v2 00/17] lib/bitmap: optimize bitmap_weight() usage
Date: Sat, 18 Dec 2021 13:19:56 -0800
Message-Id: <20211218212014.1315894-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 Dec 2021 08:39:01 +1100
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

In many cases people use bitmap_weight()-based functions to compare
the result against a number of expression:

	if (cpumask_weight(...) > 1)
		do_something();

This may take considerable amount of time on many-cpus machines because
cpumask_weight(...) will traverse every word of underlying cpumask
unconditionally.

We can significantly improve on it for many real cases if stop traversing
the mask as soon as we count cpus to any number greater than 1:

	if (cpumask_weight_gt(..., 1))
		do_something();

To implement this idea, the series adds bitmap_weight_cmp() function
and bitmap_weight_{eq,gt,ge,lt,le} macros on top of it; corresponding
wrappers in cpumask and nodemask.

There are 3 cpumasks, for which weight is counted frequently: possible,
present and active. They all are read-mostly, and to optimize counting
number of set bits for them, this series adds atomic counters, similarly
to online cpumask.

v1: https://lkml.org/lkml/2021/11/27/339
v2:
  - add bitmap_weight_cmp();
  - fix bitmap_weight_le semantics and provide full set of {eq,gt,ge,lt,le}
    as wrappers around bitmap_weight_cmp();
  - don't touch small bitmaps (less than 32 bits) - optimization works
    only for large bitmaps;
  - move bitmap_weight() == 0 -> bitmap_empty() conversion to a separate
    patch, ditto cpumask_weight() and nodes_weight;
  - add counters for possible, present and active cpus;
  - drop bitmap_empty() where possible;
  - various fixes around bit counting that spotted my eyes.

Yury Norov (17):
  all: don't use bitmap_weight() where possible
  drivers: rename num_*_cpus variables
  fix open-coded for_each_set_bit()
  all: replace bitmap_weight with bitmap_empty where appropriate
  all: replace cpumask_weight with cpumask_empty where appropriate
  all: replace nodes_weight with nodes_empty where appropriate
  lib/bitmap: add bitmap_weight_{cmp,eq,gt,ge,lt,le} functions
  all: replace bitmap_weight with bitmap_weight_{eq,gt,ge,lt,le} where
    appropriate
  lib/cpumask: add cpumask_weight_{eq,gt,ge,lt,le}
  lib/nodemask: add nodemask_weight_{eq,gt,ge,lt,le}
  lib/nodemask: add num_node_state_eq()
  kernel/cpu.c: fix init_cpu_online
  kernel/cpu: add num_possible_cpus counter
  kernel/cpu: add num_present_cpu counter
  kernel/cpu: add num_active_cpu counter
  tools/bitmap: sync bitmap_weight
  MAINTAINERS: add cpumask and nodemask files to BITMAP_API

 MAINTAINERS                                   |   4 +
 arch/alpha/kernel/process.c                   |   2 +-
 arch/ia64/kernel/setup.c                      |   2 +-
 arch/ia64/mm/tlb.c                            |   2 +-
 arch/mips/cavium-octeon/octeon-irq.c          |   4 +-
 arch/mips/kernel/crash.c                      |   2 +-
 arch/nds32/kernel/perf_event_cpu.c            |   2 +-
 arch/powerpc/kernel/smp.c                     |   2 +-
 arch/powerpc/kernel/watchdog.c                |   2 +-
 arch/powerpc/xmon/xmon.c                      |   4 +-
 arch/s390/kernel/perf_cpum_cf.c               |   2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        |  16 +--
 arch/x86/kernel/smpboot.c                     |   4 +-
 arch/x86/kvm/hyperv.c                         |   8 +-
 arch/x86/mm/amdtopology.c                     |   2 +-
 arch/x86/mm/mmio-mod.c                        |   2 +-
 arch/x86/mm/numa_emulation.c                  |   4 +-
 arch/x86/platform/uv/uv_nmi.c                 |   2 +-
 drivers/acpi/numa/srat.c                      |   2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c             |   2 +-
 drivers/cpufreq/scmi-cpufreq.c                |   2 +-
 drivers/firmware/psci/psci_checker.c          |   2 +-
 drivers/gpu/drm/i915/i915_pmu.c               |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c      |   2 +-
 drivers/hv/channel_mgmt.c                     |   4 +-
 drivers/iio/dummy/iio_simple_dummy_buffer.c   |   4 +-
 drivers/iio/industrialio-trigger.c            |   2 +-
 drivers/infiniband/hw/hfi1/affinity.c         |  13 +-
 drivers/infiniband/hw/qib/qib_file_ops.c      |   2 +-
 drivers/infiniband/hw/qib/qib_iba7322.c       |   2 +-
 drivers/irqchip/irq-bcm6345-l1.c              |   2 +-
 drivers/leds/trigger/ledtrig-cpu.c            |   6 +-
 drivers/memstick/core/ms_block.c              |   4 +-
 drivers/net/dsa/b53/b53_common.c              |   6 +-
 drivers/net/ethernet/broadcom/bcmsysport.c    |   6 +-
 .../net/ethernet/intel/ice/ice_virtchnl_pf.c  |   4 +-
 .../net/ethernet/intel/ixgbe/ixgbe_sriov.c    |   2 +-
 .../marvell/octeontx2/nic/otx2_ethtool.c      |   2 +-
 .../marvell/octeontx2/nic/otx2_flows.c        |   8 +-
 .../ethernet/marvell/octeontx2/nic/otx2_pf.c  |   2 +-
 drivers/net/ethernet/mellanox/mlx4/cmd.c      |  33 ++---
 drivers/net/ethernet/mellanox/mlx4/eq.c       |   4 +-
 drivers/net/ethernet/mellanox/mlx4/fw.c       |   4 +-
 drivers/net/ethernet/mellanox/mlx4/main.c     |   2 +-
 drivers/net/ethernet/qlogic/qed/qed_rdma.c    |   4 +-
 drivers/net/ethernet/qlogic/qed/qed_roce.c    |   2 +-
 drivers/perf/arm-cci.c                        |   2 +-
 drivers/perf/arm_pmu.c                        |   4 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.c      |   2 +-
 drivers/perf/thunderx2_pmu.c                  |   4 +-
 drivers/perf/xgene_pmu.c                      |   2 +-
 drivers/scsi/lpfc/lpfc_init.c                 |   2 +-
 drivers/scsi/storvsc_drv.c                    |   6 +-
 drivers/soc/fsl/qbman/qman_test_stash.c       |   2 +-
 drivers/staging/media/tegra-video/vi.c        |   2 +-
 drivers/thermal/intel/intel_powerclamp.c      |   9 +-
 include/linux/bitmap.h                        |  80 +++++++++++
 include/linux/cpumask.h                       | 131 +++++++++++++-----
 include/linux/nodemask.h                      |  40 ++++++
 kernel/cpu.c                                  |  54 ++++++++
 kernel/irq/affinity.c                         |   2 +-
 kernel/padata.c                               |   2 +-
 kernel/rcu/tree_nocb.h                        |   4 +-
 kernel/rcu/tree_plugin.h                      |   2 +-
 kernel/sched/core.c                           |  10 +-
 kernel/sched/topology.c                       |   4 +-
 kernel/time/clockevents.c                     |   2 +-
 kernel/time/clocksource.c                     |   2 +-
 lib/bitmap.c                                  |  21 +++
 mm/mempolicy.c                                |   2 +-
 mm/page_alloc.c                               |   2 +-
 mm/vmstat.c                                   |   4 +-
 tools/include/linux/bitmap.h                  |  44 ++++++
 tools/lib/bitmap.c                            |  20 +++
 tools/perf/builtin-c2c.c                      |   4 +-
 tools/perf/util/pmu.c                         |   2 +-
 76 files changed, 480 insertions(+), 183 deletions(-)

-- 
2.30.2

