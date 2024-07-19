Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C5937810
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 14:58:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qzdfg9mx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQV9P1myMz3cgf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 22:58:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qzdfg9mx;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQV8g1fJqz30Wd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2024 22:58:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1721393890;
	bh=sXBFIv0D5B3igLCnU80exklIHi2S+/nekzIZOF/U61Q=;
	h=From:To:Cc:Subject:Date:From;
	b=Qzdfg9mxX+7VNBPzWXi0HPmGB+SU+HkOWmrrBQOS8+45yUnPnuT8/NX3D1JWXkrMm
	 cazLJrejKxzgu9Z56BrdSeBTfnoBoEaoj86cVIqlnThKzkOo4pi3wjn1yehJuNPqYn
	 bPENTKjWcq5a/lSSZF1K/fjGfPKY7KSvSC7/x8hh/hUD8qrXP0y9YsT56gANaETulb
	 UTgjDIBo5TwX1quMoAgg2xxnNl1yV9ZvPEhRv/65xRlJJ3eE/8BwN6LymS0d7fjKpt
	 Bdqmqm/1R297jjpmOyCmbkkT9tmR300z0k0MfI+zes0gWWAnxXpIuwva9r6hhkwypm
	 eVFUkmW+VMiZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WQV8c0RkMz4wxk;
	Fri, 19 Jul 2024 22:58:07 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.11-1 tag
Date: Fri, 19 Jul 2024 22:58:06 +1000
Message-ID: <87h6clwnc1.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: sbhat@linux.ibm.com, anjalik@linux.ibm.com, coelacanthushex@gmail.com, robh@kernel.org, gautam@linux.ibm.com, nilay@linux.ibm.com, haren@linux.ibm.com, christophe.leroy@csgroup.eu, nbowler@draconx.ca, krishnak@linux.ibm.com, nathanl@linux.ibm.com, naveen@kernel.org, u.kleine-koenig@baylibre.com, bhelgaas@google.com, hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, asavkov@redhat.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, gbatra@linux.ibm.com, quic_jjohnson@quicinc.com, esben@geanix.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull a few powerpc updates for 6.11.

No conflicts with your tree that I know of. There's one minor conflict with
the mm tree which should be obvious enough, if not the correct resolution is
in linux-next [1].

cheers

[1]: https://lore.kernel.org/all/20240703094857.3f489d4f@canb.auug.org.au/


The following changes since commit c3f38fa61af77b49866b006939479069cd451173:

  Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.11-1

for you to fetch changes up to 9ff0251b2eb54d17fbe4f6aff50f6edfd837adb6:

  Merge branch 'topic/ppc-kvm' into next (2024-07-18 14:32:46 +1000)

- ------------------------------------------------------------------
powerpc updates for 6.11

 - Remove support for 40x CPUs & platforms.

 - Add support to the 64-bit BPF JIT for cpu v4 instructions.

 - Fix PCI hotplug driver crash on powernv.

 - Fix doorbell emulation for KVM on PAPR guests (nestedv2).

 - Fix KVM nested guest handling of some less used SPRs.

 - Online NUMA nodes with no CPU/memory if they have a PCI device attached.

 - Reduce memory overhead of enabling kfence on 64-bit Radix MMU kernels.

 - Reimplement the iommu table_group_ops for pseries for VFIO SPAPR TCE.

Thanks to: Anjali K, Artem Savkov, Athira Rajeev, Breno Leitao, Brian King,
Celeste Liu, Christophe Leroy, Esben Haabendal, Gaurav Batra, Gautam Mengha=
ni,
Haren Myneni, Hari Bathini, Jeff Johnson, Krishna Kumar, Krzysztof Kozlowsk=
i,
Nathan Lynch, Nicholas Piggin, Nick Bowler, Nilay Shroff, Rob Herring (Arm),
Shawn Anastasio, Shivaprasad G Bhat, Sourabh Jain, Srikar Dronamraju, Timot=
hy
Pearson, Uwe Kleine-K=C3=B6nig, Vaibhav Jain.

- ------------------------------------------------------------------
Anjali K (1):
      powerpc/perf: Set cpumode flags using sample address

Artem Savkov (5):
      powerpc64/bpf: jit support for 32bit offset jmp instruction
      powerpc64/bpf: jit support for unconditional byte swap
      powerpc64/bpf: jit support for sign extended load
      powerpc64/bpf: jit support for sign extended mov
      powerpc64/bpf: jit support for signed division and modulo

Celeste Liu (1):
      powerpc/configs: drop RT_GROUP_SCHED=3Dy from ppc6xx_defconfig

Christophe Leroy (6):
      powerpc/40x: Remove 40x platforms.
      powerpc/boot: Remove all 40x platforms from boot
      powerpc: Remove core support for 40x
      powerpc/platforms: Move files from 4xx to 44x
      powerpc: Remove 40x leftovers
      Documentation/powerpc: Mention 40x is removed

Esben Haabendal (1):
      powerpc/configs: Update defconfig with now user-visible CONFIG_FSL_IFC

Gaurav Batra (1):
      powerpc/pseries/iommu: Split Dynamic DMA Window to be used in Hybrid =
mode

Gautam Menghani (4):
      powerpc/pseries: Remove unused cede related functions
      KVM: PPC: Book3S HV nestedv2: Add support for reading VPA counters fo=
r pseries guests
      KVM: PPC: Book3S HV nestedv2: Add DPDES support in helper library for=
 Guest state buffer
      KVM: PPC: Book3S HV nestedv2: Fix doorbell emulation

Haren Myneni (1):
      powerpc/pseries/vas: Use usleep_range() to support HCALL delay

Hari Bathini (1):
      powerpc/64s/radix/kfence: map __kfence_pool at page granularity

Jeff Johnson (3):
      KVM: PPC: add missing MODULE_DESCRIPTION() macros
      macintosh/mac_hid: add MODULE_DESCRIPTION()
      powerpc: add missing MODULE_DESCRIPTION() macros

Krishna Kumar (2):
      pci/hotplug/pnv_php: Fix hotplug driver crash on Powernv
      powerpc/pci: Hotplug driver bridge support

Michael Ellerman (8):
      powerpc: Remove 40x from Kconfig and defconfig
      powerpc/4xx: Remove CONFIG_BOOKE_OR_40x
      powerpc: Replace CONFIG_4xx with CONFIG_44x
      selftests/sigaltstack: Fix ppc64 GCC build
      powerpc: Drop clang workaround for builtin constant checks
      powerpc/xmon: Fix disassembly CPU feature checks
      powerpc: Check only single values are passed to CPU/MMU feature checks
      Merge branch 'topic/ppc-kvm' into next

Nathan Lynch (3):
      powerpc/mm/drmem: Silence drmem_init() early return
      powerpc/rtas: Prevent Spectre v1 gadget construction in sys_rtas()
      powerpc/prom: Add CPU info to hardware description string later

Nick Bowler (1):
      macintosh/therm_windtunnel: fix module unload.

Nilay Shroff (1):
      powerpc/numa: Online a node if PHB is attached.

Rob Herring (Arm) (1):
      powerpc/kexec: Use of_property_read_reg()

Shivaprasad G Bhat (15):
      KVM: PPC: Book3S HV: Fix the set_one_reg for MMCR3
      KVM: PPC: Book3S HV: Fix the get_one_reg of SDAR
      KVM: PPC: Book3S HV: Add one-reg interface for DEXCR register
      KVM: PPC: Book3S HV nestedv2: Keep nested guest DEXCR in sync
      KVM: PPC: Book3S HV: Add one-reg interface for HASHKEYR register
      KVM: PPC: Book3S HV nestedv2: Keep nested guest HASHKEYR in sync
      KVM: PPC: Book3S HV: Add one-reg interface for HASHPKEYR register
      KVM: PPC: Book3S HV nestedv2: Keep nested guest HASHPKEYR in sync
      powerpc/iommu: Move pSeries specific functions to pseries/iommu.c
      powerpc/pseries/iommu: Fix the VFIO_IOMMU_SPAPR_TCE_GET_INFO ioctl ou=
tput
      powerpc/pseries/iommu: Use the iommu table[0] for IOV VF's DDW
      vfio/spapr: Always clear TCEs before unsetting the window
      powerpc/iommu: Move dev_has_iommu_table() to iommu.c
      powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries
      powerpc/pseries/iommu: Define spapr_tce_table_group_ops only with CON=
FIG_IOMMU_API

Sourabh Jain (2):
      powerpc/kexec_file: fix extra size calculation for kexec FDT
      powerpc/kexec_file: fix cpus node update to FDT

Uwe Kleine-K=C3=B6nig (1):
      macintosh: Drop explicit initialization of struct i2c_device_id::driv=
er_data to 0


 Documentation/arch/powerpc/cpu_families.rst                 |  18 -
 Documentation/arch/powerpc/elf_hwcaps.rst                   |   1 +
 Documentation/arch/powerpc/kvm-nested.rst                   |   4 +-
 Documentation/virt/kvm/api.rst                              |   3 +
 MAINTAINERS                                                 |   1 -
 arch/powerpc/Kconfig                                        |  17 +-
 arch/powerpc/Kconfig.debug                                  |  13 -
 arch/powerpc/Makefile                                       |   5 -
 arch/powerpc/boot/4xx.c                                     | 266 -------
 arch/powerpc/boot/4xx.h                                     |   4 -
 arch/powerpc/boot/Makefile                                  |  11 -
 arch/powerpc/boot/cuboot-acadia.c                           | 171 -----
 arch/powerpc/boot/cuboot-hotfoot.c                          | 139 ----
 arch/powerpc/boot/cuboot-kilauea.c                          |  46 --
 arch/powerpc/boot/dcr.h                                     |  11 -
 arch/powerpc/boot/dts/acadia.dts                            | 224 ------
 arch/powerpc/boot/dts/haleakala.dts                         | 281 -------
 arch/powerpc/boot/dts/hotfoot.dts                           | 296 --------
 arch/powerpc/boot/dts/kilauea.dts                           | 407 --------=
--
 arch/powerpc/boot/dts/klondike.dts                          | 212 ------
 arch/powerpc/boot/dts/makalu.dts                            | 353 ---------
 arch/powerpc/boot/dts/obs600.dts                            | 314 --------
 arch/powerpc/boot/ppcboot-hotfoot.h                         | 119 ---
 arch/powerpc/boot/ppcboot.h                                 |   2 +-
 arch/powerpc/boot/wrapper                                   |  22 +-
 arch/powerpc/configs/40x.config                             |   2 -
 arch/powerpc/configs/40x/acadia_defconfig                   |  61 --
 arch/powerpc/configs/40x/kilauea_defconfig                  |  69 --
 arch/powerpc/configs/40x/klondike_defconfig                 |  43 --
 arch/powerpc/configs/40x/makalu_defconfig                   |  59 --
 arch/powerpc/configs/40x/obs600_defconfig                   |  69 --
 arch/powerpc/configs/40x/walnut_defconfig                   |  55 --
 arch/powerpc/configs/85xx-hw.config                         |   2 +
 arch/powerpc/configs/ppc40x_defconfig                       |  74 --
 arch/powerpc/configs/ppc6xx_defconfig                       |   1 -
 arch/powerpc/include/asm/cacheflush.h                       |   2 +-
 arch/powerpc/include/asm/cpu_has_feature.h                  |   3 +-
 arch/powerpc/include/asm/cputable.h                         |   7 -
 arch/powerpc/include/asm/guest-state-buffer.h               |   3 +-
 arch/powerpc/include/asm/hw_irq.h                           |   8 +-
 arch/powerpc/include/asm/iommu.h                            |  16 +-
 arch/powerpc/include/asm/irq.h                              |   2 +-
 arch/powerpc/include/asm/kexec.h                            |   6 +-
 arch/powerpc/include/asm/kfence.h                           |  11 +-
 arch/powerpc/include/asm/kup.h                              |   2 +-
 arch/powerpc/include/asm/kvm_book3s.h                       |   1 +
 arch/powerpc/include/asm/kvm_book3s_64.h                    |   5 +
 arch/powerpc/include/asm/kvm_host.h                         |   3 +
 arch/powerpc/include/asm/lppaca.h                           |  11 +-
 arch/powerpc/include/asm/mmu.h                              |  10 +-
 arch/powerpc/include/asm/nohash/32/mmu-40x.h                |  68 --
 arch/powerpc/include/asm/nohash/32/pgtable.h                |   4 +-
 arch/powerpc/include/asm/nohash/32/pte-40x.h                |  73 --
 arch/powerpc/include/asm/nohash/mmu.h                       |   5 +-
 arch/powerpc/include/asm/perf_event_server.h                |   3 +-
 arch/powerpc/include/asm/plpar_wrappers.h                   |  28 -
 arch/powerpc/include/asm/ppc-opcode.h                       |   2 +
 arch/powerpc/include/asm/ppc_asm.h                          |   2 +-
 arch/powerpc/include/asm/processor.h                        |   2 +-
 arch/powerpc/include/asm/ptrace.h                           |   2 +-
 arch/powerpc/include/asm/reg.h                              |  27 +-
 arch/powerpc/include/asm/reg_booke.h                        | 113 +--
 arch/powerpc/include/asm/time.h                             |   7 +-
 arch/powerpc/include/asm/udbg.h                             |   1 -
 arch/powerpc/include/uapi/asm/kvm.h                         |   3 +
 arch/powerpc/kernel/Makefile                                |   1 -
 arch/powerpc/kernel/asm-offsets.c                           |   2 +-
 arch/powerpc/kernel/cpu_specs.h                             |   4 -
 arch/powerpc/kernel/cpu_specs_40x.h                         | 280 -------
 arch/powerpc/kernel/eeh.c                                   |  16 -
 arch/powerpc/kernel/entry_32.S                              |  48 +-
 arch/powerpc/kernel/epapr_hcalls.S                          |   2 +-
 arch/powerpc/kernel/head_32.h                               |  12 +-
 arch/powerpc/kernel/head_40x.S                              | 721 --------=
----------
 arch/powerpc/kernel/head_booke.h                            |   3 +-
 arch/powerpc/kernel/iommu.c                                 | 170 +----
 arch/powerpc/kernel/irq.c                                   |   2 +-
 arch/powerpc/kernel/kgdb.c                                  |   4 +-
 arch/powerpc/kernel/misc_32.S                               |  40 -
 arch/powerpc/kernel/pci-hotplug.c                           |  35 +-
 arch/powerpc/kernel/process.c                               |   4 +-
 arch/powerpc/kernel/prom.c                                  |  12 +-
 arch/powerpc/kernel/rtas.c                                  |   4 +
 arch/powerpc/kernel/rtas_flash.c                            |   1 +
 arch/powerpc/kernel/setup.h                                 |   2 +-
 arch/powerpc/kernel/setup_32.c                              |   2 +-
 arch/powerpc/kernel/time.c                                  |   2 +-
 arch/powerpc/kernel/traps.c                                 |   2 +-
 arch/powerpc/kernel/udbg.c                                  |   3 -
 arch/powerpc/kernel/udbg_16550.c                            |  23 -
 arch/powerpc/kexec/core_64.c                                |  53 +-
 arch/powerpc/kexec/elf_64.c                                 |  12 +-
 arch/powerpc/kexec/file_load_64.c                           |  90 +--
 arch/powerpc/kvm/book3s_hv.c                                | 103 ++-
 arch/powerpc/kvm/book3s_hv.h                                |   3 +
 arch/powerpc/kvm/book3s_hv_nestedv2.c                       |  25 +
 arch/powerpc/kvm/book3s_pr.c                                |   1 +
 arch/powerpc/kvm/test-guest-state-buffer.c                  |   3 +-
 arch/powerpc/kvm/trace_hv.h                                 |  29 +
 arch/powerpc/mm/book3s64/radix_pgtable.c                    |  84 ++-
 arch/powerpc/mm/drmem.c                                     |   4 +-
 arch/powerpc/mm/fault.c                                     |   4 +-
 arch/powerpc/mm/init-common.c                               |   3 +
 arch/powerpc/mm/mmu_context.c                               |   2 +-
 arch/powerpc/mm/mmu_decl.h                                  |   8 +-
 arch/powerpc/mm/nohash/40x.c                                | 161 ----
 arch/powerpc/mm/nohash/Makefile                             |   1 -
 arch/powerpc/mm/nohash/kup.c                                |   2 -
 arch/powerpc/mm/nohash/mmu_context.c                        |   5 +-
 arch/powerpc/mm/nohash/tlb_low.S                            |  27 +-
 arch/powerpc/mm/numa.c                                      |  14 +-
 arch/powerpc/mm/ptdump/Makefile                             |   2 +-
 arch/powerpc/net/bpf_jit_comp64.c                           | 118 ++-
 arch/powerpc/perf/core-book3s.c                             |  45 +-
 arch/powerpc/perf/power10-pmu.c                             |   3 +-
 arch/powerpc/platforms/40x/Kconfig                          |  78 --
 arch/powerpc/platforms/40x/Makefile                         |   2 -
 arch/powerpc/platforms/40x/ppc40x_simple.c                  |  74 --
 arch/powerpc/platforms/44x/Makefile                         |   6 +-
 arch/powerpc/platforms/{4xx =3D> 44x}/cpm.c                   |   0
 arch/powerpc/platforms/{4xx =3D> 44x}/gpio.c                  |   0
 arch/powerpc/platforms/{4xx =3D> 44x}/hsta_msi.c              |   0
 arch/powerpc/platforms/44x/machine_check.c                  |  15 +
 arch/powerpc/platforms/{4xx =3D> 44x}/pci.c                   | 100 ---
 arch/powerpc/platforms/{4xx =3D> 44x}/pci.h                   |   0
 arch/powerpc/platforms/{4xx =3D> 44x}/soc.c                   |   0
 arch/powerpc/platforms/{4xx =3D> 44x}/uic.c                   |   0
 arch/powerpc/platforms/4xx/Makefile                         |   7 -
 arch/powerpc/platforms/4xx/machine_check.c                  |  23 -
 arch/powerpc/platforms/85xx/t1042rdb_diu.c                  |   1 +
 arch/powerpc/platforms/Kconfig                              |   1 -
 arch/powerpc/platforms/Kconfig.cputype                      |  28 +-
 arch/powerpc/platforms/Makefile                             |   2 -
 arch/powerpc/platforms/cell/cbe_powerbutton.c               |   1 +
 arch/powerpc/platforms/cell/cbe_thermal.c                   |   1 +
 arch/powerpc/platforms/cell/cpufreq_spudemand.c             |   1 +
 arch/powerpc/platforms/cell/spufs/inode.c                   |   1 +
 arch/powerpc/platforms/chrp/nvram.c                         |   1 +
 arch/powerpc/platforms/powernv/pci-ioda.c                   |   6 +-
 arch/powerpc/platforms/pseries/iommu.c                      | 781 ++++++++=
++++++++++--
 arch/powerpc/platforms/pseries/papr_scm.c                   |   1 +
 arch/powerpc/platforms/pseries/pci_dlpar.c                  |  14 +
 arch/powerpc/platforms/pseries/vas.c                        |  22 +-
 arch/powerpc/sysdev/Kconfig                                 |   4 +-
 arch/powerpc/sysdev/rtc_cmos_setup.c                        |   1 +
 arch/powerpc/xmon/ppc-dis.c                                 |  33 +-
 drivers/macintosh/ams/ams-i2c.c                             |   2 +-
 drivers/macintosh/mac_hid.c                                 |   1 +
 drivers/macintosh/therm_windtunnel.c                        |   2 +-
 drivers/macintosh/windfarm_ad7417_sensor.c                  |   2 +-
 drivers/macintosh/windfarm_fcu_controls.c                   |   2 +-
 drivers/macintosh/windfarm_lm87_sensor.c                    |   2 +-
 drivers/macintosh/windfarm_max6690_sensor.c                 |   2 +-
 drivers/macintosh/windfarm_smu_sat.c                        |   2 +-
 drivers/pci/hotplug/pnv_php.c                               |   3 +-
 drivers/vfio/vfio_iommu_spapr_tce.c                         |  13 +-
 scripts/head-object-list.txt                                |   1 -
 tools/testing/selftests/sigaltstack/current_stack_pointer.h |   2 +-
 158 files changed, 1464 insertions(+), 5776 deletions(-)
 delete mode 100644 arch/powerpc/boot/cuboot-acadia.c
 delete mode 100644 arch/powerpc/boot/cuboot-hotfoot.c
 delete mode 100644 arch/powerpc/boot/cuboot-kilauea.c
 delete mode 100644 arch/powerpc/boot/dts/acadia.dts
 delete mode 100644 arch/powerpc/boot/dts/haleakala.dts
 delete mode 100644 arch/powerpc/boot/dts/hotfoot.dts
 delete mode 100644 arch/powerpc/boot/dts/kilauea.dts
 delete mode 100644 arch/powerpc/boot/dts/klondike.dts
 delete mode 100644 arch/powerpc/boot/dts/makalu.dts
 delete mode 100644 arch/powerpc/boot/dts/obs600.dts
 delete mode 100644 arch/powerpc/boot/ppcboot-hotfoot.h
 delete mode 100644 arch/powerpc/configs/40x.config
 delete mode 100644 arch/powerpc/configs/40x/acadia_defconfig
 delete mode 100644 arch/powerpc/configs/40x/kilauea_defconfig
 delete mode 100644 arch/powerpc/configs/40x/klondike_defconfig
 delete mode 100644 arch/powerpc/configs/40x/makalu_defconfig
 delete mode 100644 arch/powerpc/configs/40x/obs600_defconfig
 delete mode 100644 arch/powerpc/configs/40x/walnut_defconfig
 delete mode 100644 arch/powerpc/configs/ppc40x_defconfig
 delete mode 100644 arch/powerpc/include/asm/nohash/32/mmu-40x.h
 delete mode 100644 arch/powerpc/include/asm/nohash/32/pte-40x.h
 delete mode 100644 arch/powerpc/kernel/cpu_specs_40x.h
 delete mode 100644 arch/powerpc/kernel/head_40x.S
 delete mode 100644 arch/powerpc/mm/nohash/40x.c
 delete mode 100644 arch/powerpc/platforms/40x/Kconfig
 delete mode 100644 arch/powerpc/platforms/40x/Makefile
 delete mode 100644 arch/powerpc/platforms/40x/ppc40x_simple.c
 rename arch/powerpc/platforms/{4xx =3D> 44x}/cpm.c (100%)
 rename arch/powerpc/platforms/{4xx =3D> 44x}/gpio.c (100%)
 rename arch/powerpc/platforms/{4xx =3D> 44x}/hsta_msi.c (100%)
 rename arch/powerpc/platforms/{4xx =3D> 44x}/pci.c (95%)
 rename arch/powerpc/platforms/{4xx =3D> 44x}/pci.h (100%)
 rename arch/powerpc/platforms/{4xx =3D> 44x}/soc.c (100%)
 rename arch/powerpc/platforms/{4xx =3D> 44x}/uic.c (100%)
 delete mode 100644 arch/powerpc/platforms/4xx/Makefile
 delete mode 100644 arch/powerpc/platforms/4xx/machine_check.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmaaYQ0ACgkQUevqPMjh
pYDIOBAAk+9+CijSRd5plF6moCRgmMGR6qxz/dEHc9390Qj4vtGrkDeRqhSMuV0/
h00hQ08trMGVbL5ZPZ6UXrQnwAMAK+/K/wsNiGDPjrmrKUrylsb6pieTzJHQG6kC
G8xHf7HTS/CaJQxwb0cXhzXl502l+cBk1r9lYe9xUpogJ7xL8LYl+1ghv3tVCd5I
4cKOrw2fCjugXzFzC1awyxlF7sE3D9b+nnKbUM3iCyTLrW7DuPKnQs3fTRkcszhX
AL2Dl3h+49qARJcJkUUvFdUIFhkD+V1wEf8pPghrFz7ikndEMymHw/TEZN0DjqHM
/omTIUS8hn9GdYJPOXtGaYjNXdkt/dJs68W1Jx/TKHJ1UctYWyzc1EpyiiH+HlVq
561YiMoc5w3/OW+eWj4Gv19i/uEAvegv7at5Dl1NGvQDKYCedOjUme2fc43psH3D
GBt89w52WNHfDDLhMf4gI05TW0dDhN63CTZsdF0VsYclHK38mjH+S1WemFyqv6yb
q+xSL2XSgnQ2D95s+iP258Da8XcajQzpSif/52mYRk1AadG0zSB/PiALZ5qlMg4z
y088Kz1nxXqhwzOD5DHc+jzuiRoqBOp9EhKFk3WhQbhjK5cvEYzz9IHvNlHRaO85
1zIttW7C6W4AgH0EANDRCrRCKSJbtFpgzIGPKdPkTJFbalOTccg=3D
=3DjOsa
-----END PGP SIGNATURE-----
