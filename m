Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A32003FFED8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 13:19:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1Ffz3b5Hz302D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 21:19:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1FfV3l6mz2yHW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 21:18:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H1FfM681Xz9sT4;
 Fri,  3 Sep 2021 13:18:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RWBH0N9rVwKd; Fri,  3 Sep 2021 13:18:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H1FfM4pndz9sT0;
 Fri,  3 Sep 2021 13:18:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D6F08B8E3;
 Fri,  3 Sep 2021 13:18:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AbJoHPS8LwnY; Fri,  3 Sep 2021 13:18:35 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E2EC8B764;
 Fri,  3 Sep 2021 13:18:35 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 077A263D74; Fri,  3 Sep 2021 11:18:34 +0000 (UTC)
Message-Id: <cover.1630667612.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 00/11] powerpc/machdep: Remove dust and convert to
 static calls
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  3 Sep 2021 11:18:34 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The purpose of this series is to convert machine dependent
functions in structure ppc_md into static calls.

First part of the series remove some dust in and around machdep.h

Then some helpers are defined to abstract the access to ppc_md. structure.

Then all plateforms are converted to using those helpers instead of
accessing ppc_md structure directly.

The last patch rewrites the new helpers to use static calls.

Christophe Leroy (11):
  powerpc/time: Remove generic_suspend_{dis/en}able_irqs()
  powerpc/machdep: Remove stale functions from ppc_md structure
  powerpc/machdep: Remove CONFIG_PPC_HAS_FEATURE_CALLS
  powerpc/machdep: Make probe_machine() static
  powerpc/machdep: Move sys_ctrler_t definition into pmac.h
  powerpc/machdep: Add helpers to use ppc_md. functions
  powerpc/mpc86xx_hpcn: Remove obsolete statement
  powerpc/corenet: Change criteria to set MPIC_ENABLE_COREINT
  powerpc/platforms: Use ppc_md. helpers
  powerpc/platforms: Use ppc_md_update() instead of define_machine()
  powerpc/machdep: Convert ppc_md to static calls

 arch/powerpc/include/asm/archrandom.h         |   4 +-
 arch/powerpc/include/asm/iommu.h              |   9 +-
 arch/powerpc/include/asm/kexec.h              |   1 -
 arch/powerpc/include/asm/machdep.h            | 136 +++++++++----
 arch/powerpc/include/asm/pci.h                |   4 +-
 arch/powerpc/include/asm/pmac_feature.h       |   4 +-
 arch/powerpc/kernel/dawr.c                    |   4 +-
 arch/powerpc/kernel/dma-mask.c                |   3 +-
 arch/powerpc/kernel/epapr_paravirt.c          |   2 +-
 arch/powerpc/kernel/idle.c                    |   6 +-
 arch/powerpc/kernel/irq.c                     |   5 +-
 arch/powerpc/kernel/mce.c                     |   7 +-
 arch/powerpc/kernel/mce_power.c               |   4 +-
 arch/powerpc/kernel/nvram_64.c                |  18 +-
 arch/powerpc/kernel/of_platform.c             |   4 +-
 arch/powerpc/kernel/pci-common.c              |  41 ++--
 arch/powerpc/kernel/pci_32.c                  |   6 +-
 arch/powerpc/kernel/pci_64.c                  |   5 +-
 arch/powerpc/kernel/process.c                 |   4 +-
 arch/powerpc/kernel/setup-common.c            |  33 ++--
 arch/powerpc/kernel/setup_32.c                |  12 +-
 arch/powerpc/kernel/setup_64.c                |   4 +-
 arch/powerpc/kernel/swsusp_64.c               |   5 -
 arch/powerpc/kernel/swsusp_asm64.S            |   1 -
 arch/powerpc/kernel/sysfs.c                   |  11 +-
 arch/powerpc/kernel/time.c                    |  50 ++---
 arch/powerpc/kernel/traps.c                   |  11 +-
 arch/powerpc/kexec/core.c                     |  17 +-
 arch/powerpc/kexec/core_32.c                  |   2 +-
 arch/powerpc/kexec/core_64.c                  |  11 +-
 arch/powerpc/kexec/crash.c                    |   6 +-
 arch/powerpc/kvm/book3s_hv_ras.c              |   3 +-
 arch/powerpc/mm/book3s32/mmu.c                |  10 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   2 +-
 arch/powerpc/mm/init_32.c                     |  12 +-
 arch/powerpc/mm/mem.c                         |   6 +-
 arch/powerpc/platforms/40x/ppc40x_simple.c    |  20 +-
 arch/powerpc/platforms/44x/canyonlands.c      |  21 +-
 arch/powerpc/platforms/44x/ebony.c            |  11 +-
 arch/powerpc/platforms/44x/fsp2.c             |  11 +-
 arch/powerpc/platforms/44x/idle.c             |   4 +-
 arch/powerpc/platforms/44x/iss4xx.c           |  15 +-
 arch/powerpc/platforms/44x/ppc44x_simple.c    |  11 +-
 arch/powerpc/platforms/44x/ppc476.c           |  28 +--
 arch/powerpc/platforms/44x/sam440ep.c         |  11 +-
 arch/powerpc/platforms/44x/warp.c             |  11 +-
 arch/powerpc/platforms/4xx/cpm.c              |   2 +-
 arch/powerpc/platforms/512x/mpc5121_ads.c     |  15 +-
 arch/powerpc/platforms/512x/mpc512x_generic.c |  13 +-
 arch/powerpc/platforms/512x/pdm360ng.c        |  13 +-
 arch/powerpc/platforms/52xx/efika.c           |  36 ++--
 arch/powerpc/platforms/52xx/lite5200.c        |  23 ++-
 arch/powerpc/platforms/52xx/media5200.c       |  23 ++-
 arch/powerpc/platforms/52xx/mpc5200_simple.c  |  23 ++-
 arch/powerpc/platforms/52xx/mpc52xx_pci.c     |  10 +-
 arch/powerpc/platforms/82xx/ep8248e.c         |  24 +--
 arch/powerpc/platforms/82xx/km82xx.c          |  24 +--
 arch/powerpc/platforms/82xx/mpc8272_ads.c     |  26 +--
 arch/powerpc/platforms/82xx/pq2.c             |   2 +-
 arch/powerpc/platforms/82xx/pq2fads.c         |  26 +--
 arch/powerpc/platforms/83xx/asp834x.c         |  22 ++-
 arch/powerpc/platforms/83xx/km83xx.c          |  22 ++-
 arch/powerpc/platforms/83xx/misc.c            |   3 +-
 arch/powerpc/platforms/83xx/mpc830x_rdb.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc831x_rdb.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc832x_mds.c     |  14 +-
 arch/powerpc/platforms/83xx/mpc832x_rdb.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc834x_itx.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc834x_mds.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc836x_mds.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc836x_rdk.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc837x_mds.c     |  22 ++-
 arch/powerpc/platforms/83xx/mpc837x_rdb.c     |  22 ++-
 arch/powerpc/platforms/85xx/bsc913x_qds.c     |  25 +--
 arch/powerpc/platforms/85xx/bsc913x_rdb.c     |  19 +-
 arch/powerpc/platforms/85xx/c293pcie.c        |  21 +-
 arch/powerpc/platforms/85xx/corenet_generic.c |  68 ++++---
 arch/powerpc/platforms/85xx/ge_imp3a.c        |  29 +--
 arch/powerpc/platforms/85xx/ksi8560.c         |  21 +-
 arch/powerpc/platforms/85xx/mpc8536_ds.c      |  27 +--
 arch/powerpc/platforms/85xx/mpc85xx_ads.c     |  21 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c     |  37 ++--
 arch/powerpc/platforms/85xx/mpc85xx_ds.c      |  77 ++++----
 arch/powerpc/platforms/85xx/mpc85xx_mds.c     |  74 ++++---
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c     | 184 +++++++-----------
 arch/powerpc/platforms/85xx/mvme2500.c        |  27 +--
 arch/powerpc/platforms/85xx/p1010rdb.c        |  32 +--
 arch/powerpc/platforms/85xx/p1022_ds.c        |  27 +--
 arch/powerpc/platforms/85xx/p1022_rdk.c       |  27 +--
 arch/powerpc/platforms/85xx/p1023_rdb.c       |  26 +--
 arch/powerpc/platforms/85xx/ppa8548.c         |  21 +-
 arch/powerpc/platforms/85xx/qemu_e500.c       |  26 +--
 arch/powerpc/platforms/85xx/sgy_cts1000.c     |   4 +-
 arch/powerpc/platforms/85xx/smp.c             |   7 +-
 arch/powerpc/platforms/85xx/socrates.c        |  20 +-
 arch/powerpc/platforms/85xx/stx_gp3.c         |  21 +-
 arch/powerpc/platforms/85xx/tqm85xx.c         |  21 +-
 arch/powerpc/platforms/85xx/twr_p102x.c       |  25 +--
 arch/powerpc/platforms/85xx/xes_mpc85xx.c     |  61 +++---
 arch/powerpc/platforms/86xx/gef_ppc9a.c       |  27 +--
 arch/powerpc/platforms/86xx/gef_sbc310.c      |  27 +--
 arch/powerpc/platforms/86xx/gef_sbc610.c      |  27 +--
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c    |  28 +--
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c    |  38 ++--
 arch/powerpc/platforms/86xx/mvme7100.c        |  27 +--
 arch/powerpc/platforms/8xx/adder875.c         |  18 +-
 arch/powerpc/platforms/8xx/ep88xc.c           |  18 +-
 arch/powerpc/platforms/8xx/mpc86xads_setup.c  |  22 ++-
 arch/powerpc/platforms/8xx/mpc885ads_setup.c  |  18 +-
 arch/powerpc/platforms/8xx/tqm8xx_setup.c     |  22 ++-
 arch/powerpc/platforms/amigaone/setup.c       |  47 +++--
 arch/powerpc/platforms/cell/interrupt.c       |   2 +-
 arch/powerpc/platforms/cell/pervasive.c       |   4 +-
 arch/powerpc/platforms/cell/ras.c             |   2 +-
 arch/powerpc/platforms/cell/setup.c           |  23 +--
 arch/powerpc/platforms/chrp/nvram.c           |   6 +-
 arch/powerpc/platforms/chrp/setup.c           |  48 ++---
 arch/powerpc/platforms/embedded6xx/gamecube.c |  15 +-
 arch/powerpc/platforms/embedded6xx/holly.c    |  28 +--
 .../platforms/embedded6xx/linkstation.c       |  17 +-
 .../platforms/embedded6xx/mpc7448_hpc2.c      |  29 +--
 arch/powerpc/platforms/embedded6xx/mvme5100.c |  25 +--
 .../platforms/embedded6xx/storcenter.c        |  18 +-
 arch/powerpc/platforms/embedded6xx/wii.c      |  20 +-
 arch/powerpc/platforms/maple/pci.c            |   2 +-
 arch/powerpc/platforms/maple/setup.c          |  33 ++--
 arch/powerpc/platforms/microwatt/rng.c        |   2 +-
 arch/powerpc/platforms/microwatt/setup.c      |  12 +-
 arch/powerpc/platforms/pasemi/idle.c          |   4 +-
 arch/powerpc/platforms/pasemi/setup.c         |  19 +-
 arch/powerpc/platforms/powermac/nvram.c       |  44 ++---
 arch/powerpc/platforms/powermac/pci.c         |   2 +-
 arch/powerpc/platforms/powermac/pic.c         |   4 +-
 arch/powerpc/platforms/powermac/pmac.h        |  12 ++
 arch/powerpc/platforms/powermac/setup.c       |  47 ++---
 arch/powerpc/platforms/powermac/smp.c         |  18 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c  |   2 +-
 arch/powerpc/platforms/powernv/idle.c         |   4 +-
 arch/powerpc/platforms/powernv/opal-nvram.c   |   6 +-
 arch/powerpc/platforms/powernv/pci-ioda.c     |  12 +-
 arch/powerpc/platforms/powernv/rng.c          |   4 +-
 arch/powerpc/platforms/powernv/setup.c        | 109 ++++++-----
 arch/powerpc/platforms/powernv/smp.c          |   2 +-
 arch/powerpc/platforms/ps3/interrupt.c        |   2 +-
 arch/powerpc/platforms/ps3/setup.c            |  55 +++---
 arch/powerpc/platforms/pseries/eeh_pseries.c  |   2 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |   4 +-
 arch/powerpc/platforms/pseries/msi.c          |   4 +-
 arch/powerpc/platforms/pseries/nvram.c        |   8 +-
 arch/powerpc/platforms/pseries/pci.c          |   4 +-
 arch/powerpc/platforms/pseries/rng.c          |   2 +-
 arch/powerpc/platforms/pseries/setup.c        |  80 ++++----
 arch/powerpc/sysdev/dart_iommu.c              |   2 +-
 arch/powerpc/sysdev/fsl_pci.c                 |   6 +-
 arch/powerpc/sysdev/indirect_pci.c            |   8 +-
 arch/powerpc/sysdev/mmio_nvram.c              |  10 +-
 arch/powerpc/sysdev/mpic.c                    |   6 +-
 arch/powerpc/sysdev/tsi108_pci.c              |   8 +-
 arch/powerpc/sysdev/xics/xics-common.c        |   2 +-
 arch/powerpc/sysdev/xive/common.c             |   2 +-
 arch/powerpc/xmon/xmon.c                      |   4 +-
 drivers/ata/pata_macio.c                      |  10 +-
 drivers/char/nvram.c                          |   4 +-
 drivers/macintosh/via-pmu.c                   |   4 +-
 include/linux/nvram.h                         |  19 +-
 sound/ppc/pmac.c                              |   3 +-
 166 files changed, 1685 insertions(+), 1531 deletions(-)

-- 
2.25.0

