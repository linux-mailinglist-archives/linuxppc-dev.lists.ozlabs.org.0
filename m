Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9649151A77
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 13:25:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BkRM70nrzDq5y
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 23:25:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Bk7C3dPBzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 23:11:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jmNPx7co; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48Bk7B0CMczB3x3;
 Tue,  4 Feb 2020 23:11:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1580818263;
 bh=adPU4KAIM5t38zCo5n8eW6ogY8SxkETTwEm2q8DoOe0=;
 h=From:To:Cc:Subject:Date:From;
 b=jmNPx7co1KeEg0FIrbGhIGKkD7EZ1CaQVDcIm5+81ii0Qt0ISmXeRdxLq2Aiu05d1
 540oQhu3stpkN9v1HOsyqoCIkghSrYkif8Qjhkf3IxpVSFpdO9fdM325pedvdrzk4P
 vdpWp2+TzwUUULWDNIrKITbBb+EU4teG5dU//2aT4RIXHyOLeZH9EmFjStA+TIQ6qA
 fh1FGFVBIAY9MjxAsm8UEgA7YTnciUioB7BvudRJRSDzOGgYrWphpKz9vBDmhmiULK
 gtrC8f1qRmA80o25Uegol2MVzSMpMk/F47gkta2Nv6Bc4p7gPtTMnpGxduKHgeXIy3
 gm3wjldenT36A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.6-1 tag
Date: Tue, 04 Feb 2020 23:10:55 +1100
Message-ID: <878sli3640.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: aik@ozlabs.ru, jniethe5@gmail.com, bigeasy@linutronix.de,
 linuxram@us.ibm.com, kernelfans@gmail.com, oohall@gmail.com,
 sukadev@linux.ibm.com, shawn@anastas.io, alex@ghiti.fr,
 aneesh.kumar@linux.ibm.com, krzk@kernel.org, chenzhou10@huawei.com,
 anju@linux.vnet.ibm.com, joel@jms.id.au, byj.tea@gmail.com,
 sukadev@linux.vnet.ibm.com, ajd@linux.ibm.com, groug@kaod.org,
 npiggin@gmail.com, oss@buserror.net, tyreld@linux.vnet.ibm.com,
 natechancellor@gmail.com, laurentiu.tudor@nxp.com, peter.ujfalusi@ti.com,
 timur@kernel.org, rdunlap@infradead.org, mwb@linux.ibm.com,
 linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, fbarrat@linux.ibm.com,
 vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.6.

A pretty small batch for us, and apologies for it being a bit late, I wanted to
sneak Christophe's user_access_begin() series in.

No conflicts or other issues I'm aware of.

cheers


The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538:

  Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.6-1

for you to fetch changes up to 4c25df5640ae6e4491ee2c50d3f70c1559ef037d:

  Merge branch 'topic/user-access-begin' into next (2020-02-01 21:47:17 +1100)

- ------------------------------------------------------------------
powerpc updates for 5.6

 - Implement user_access_begin() and friends for our platforms that support
   controlling kernel access to userspace.

 - Enable CONFIG_VMAP_STACK on 32-bit Book3S and 8xx.

 - Some tweaks to our pseries IOMMU code to allow SVMs ("secure" virtual
   machines) to use the IOMMU.

 - Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE to the 32-bit VDSO, and
   some other improvements.

 - A series to use the PCI hotplug framework to control opencapi card's so that
   they can be reset and re-read after flashing a new FPGA image.

As well as other minor fixes and improvements as usual.

Thanks to:
 Alastair D'Silva, Alexandre Ghiti, Alexey Kardashevskiy, Andrew Donnellan,
 Aneesh Kumar K.V, Anju T Sudhakar, Bai Yingjie, Chen Zhou, Christophe Leroy,
 Frederic Barrat, Greg Kurz, Jason A. Donenfeld, Joel Stanley, Jordan Niethe,
 Julia Lawall, Krzysztof Kozlowski, Laurent Dufour, Laurentiu Tudor, Linus
 Walleij, Michael Bringmann, Nathan Chancellor, Nicholas Piggin, Nick
 Desaulniers, Oliver O'Halloran, Peter Ujfalusi, Pingfan Liu, Ram Pai, Randy
 Dunlap, Russell Currey, Sam Bobroff, Sebastian Andrzej Siewior, Shawn
 Anastasio, Stephen Rothwell, Steve Best, Sukadev Bhattiprolu, Thiago Jung
 Bauermann, Tyrel Datwyler, Vaibhav Jain.

- ------------------------------------------------------------------
Alexandre Ghiti (1):
      powerpc: Do not consider weak unresolved symbol relocations as bad

Alexey Kardashevskiy (3):
      powerpc/pseries: Allow not having ibm, hypertas-functions::hcall-multi-tce for DDW
      powerpc/pseries/iommu: Separate FW_FEATURE_MULTITCE to put/stuff features
      powerpc/pseries/svm: Allow IOMMU to work in SVM

Aneesh Kumar K.V (2):
      powerpc/papr_scm: Update debug message
      powerpc/papr_scm: Don't enable direct map for a region by default

Anju T Sudhakar (1):
      powerpc/imc: Add documentation for IMC and trace-mode

Bai Yingjie (2):
      powerpc32/booke: consistently return phys_addr_t in __pa()
      powerpc/mpc85xx: also write addr_h to spin table for 64bit boot entry

Chen Zhou (1):
      powerpc/maple: Fix comparing pointer to 0

Christophe Leroy (47):
      powerpc/ptdump: don't entirely rebuild kernel when selecting CONFIG_PPC_DEBUG_WX
      powerpc/ptdump: Fix W+X verification call in mark_rodata_ro()
      powerpc/ptdump: Fix W+X verification
      powerpc/ptdump: Only enable PPC_CHECK_WX with STRICT_KERNEL_RWX
      powerpc/8xx: Fix permanently mapped IMMR region.
      powerpc/hw_breakpoints: Rewrite 8xx breakpoints to allow any address range size.
      selftests/powerpc: Enable range tests on 8xx in ptrace-hwbreak.c selftest
      powerpc/devicetrees: Change 'gpios' to 'cs-gpios' on fsl, spi nodes
      powerpc/32: Add VDSO version of getcpu on non SMP
      powerpc/vdso32: Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE
      powerpc/vdso32: inline __get_datapage()
      powerpc/vdso32: Don't read cache line size from the datapage on PPC32.
      powerpc/vdso32: use LOAD_REG_IMMEDIATE()
      powerpc/vdso32: implement clock_getres entirely
      powerpc/vdso32: miscellaneous optimisations
      powerpc: use probe_user_read() and probe_user_write()
      powerpc/32: replace MTMSRD() by mtmsr
      powerpc/32: Add EXCEPTION_PROLOG_0 in head_32.h
      powerpc/32: save DEAR/DAR before calling handle_page_fault
      powerpc/32: move MSR_PR test into EXCEPTION_PROLOG_0
      powerpc/32: add a macro to get and/or save DAR and DSISR on stack.
      powerpc/32: prepare for CONFIG_VMAP_STACK
      powerpc: align stack to 2 * THREAD_SIZE with VMAP_STACK
      powerpc/32: Add early stack overflow detection with VMAP stack.
      powerpc/32: Use vmapped stacks for interrupts
      powerpc/8xx: Use alternative scratch registers in DTLB miss handler
      powerpc/8xx: Drop exception entries for non-existing exceptions
      powerpc/8xx: Move DataStoreTLBMiss perf handler
      powerpc/8xx: Split breakpoint exception
      powerpc/8xx: Enable CONFIG_VMAP_STACK
      powerpc/32s: Reorganise DSI handler.
      powerpc/32s: Avoid crossing page boundary while changing SRR0/1.
      powerpc/32s: Enable CONFIG_VMAP_STACK
      powerpc/mm: Don't log user reads to 0xffffffff
      powerpc/32: Add support of KASAN_VMALLOC
      powerpc/kconfig: Move CONFIG_PPC32 into Kconfig.cputype
      powerpc/32: Force KASAN_VMALLOC for modules
      powerpc/32: Simplify KASAN init
      powerpc/32: Reuse orphaned memblocks in kasan_init_shadow_page_tables()
      powerpc/32s: Fix CPU wake-up from sleep mode
      powerpc/32s: Fix bad_kuap_fault()
      powerpc/kuap: Fix set direction in allow/prevent_user_access()
      powerpc/32s: Drop NULL addr verification
      powerpc/32s: Prepare prevent_user_access() for user_access_end()
      powerpc: Implement user_access_begin and friends
      powerpc: Implement user_access_save() and user_access_restore()
      powerpc/32s: Fix kasan_early_hash_table() for CONFIG_VMAP_STACK

Frederic Barrat (11):
      powerpc/powernv/ioda: Fix ref count for devices with their own PE
      powerpc/powernv/ioda: Protect PE list
      powerpc/powernv/ioda: set up PE on opencapi device when enabling
      powerpc/powernv/ioda: Release opencapi device
      powerpc/powernv/ioda: Find opencapi slot for a device node
      pci/hotplug/pnv-php: Remove erroneous warning
      pci/hotplug/pnv-php: Improve error msg on power state change failure
      pci/hotplug/pnv-php: Register opencapi slots
      pci/hotplug/pnv-php: Relax check when disabling slot
      pci/hotplug/pnv-php: Wrap warnings in macro
      ocxl: Add PCI hotplug dependency to Kconfig

Greg Kurz (2):
      KVM: PPC: Book3S HV: XIVE: Fix typo in comment
      powerpc/xive: Drop extern qualifiers from header function prototypes

Joel Stanley (1):
      powerpc/configs/skiroot: Enable security features

Jordan Niethe (2):
      powerpc/64: Use {SAVE,REST}_NVGPRS macros
      powerpc/mm: Remove kvm radix prefetch workaround for Power9 DD2.2

Julia Lawall (4):
      powerpc/mpic: constify copied structure
      powerpc/83xx: use resource_size
      powerpc/powernv: use resource_size
      misc: cxl: use mmgrab

Krzysztof Kozlowski (2):
      macintosh: Fix Kconfig indentation
      powerpc: configs: Cleanup old Kconfig options

Laurentiu Tudor (1):
      MAINTAINERS: Add myself as maintainer of ehv_bytechan tty driver

Michael Bringmann (1):
      powerpc/pseries/lparcfg: Fix display of Maximum Memory

Michael Ellerman (12):
      selftests/powerpc: Add a test of bad (out-of-range) accesses
      powerpc/pseries: Remove redundant select of PPC_DOORBELL
      powerpc/8xx: Move tail of alignment exception out of line
      powerpc/configs: Drop CONFIG_QLGE which moved to staging
      powerpc/configs: NET_CADENCE became NET_VENDOR_CADENCE
      powerpc/configs: Drop NET_VENDOR_HP which moved to staging
      powerpc/configs/skiroot: Drop HID_LOGITECH
      powerpc/configs/skiroot: Drop default n CONFIG_CRYPTO_ECHAINIV
      powerpc/configs/skiroot: Update for symbol movement only
      powerpc/configs/skiroot: Disable xmon default & enable reboot on panic
      powerpc/configs/skiroot: Enable some more hardening options
      Merge branch 'topic/user-access-begin' into next

Nathan Chancellor (1):
      powerpc/44x: Adjust indentation in ibm4xx_denali_fixup_memsize

Nicholas Piggin (1):
      powerpc/64s: Reimplement power4_idle code in C

Oliver O'Halloran (24):
      powerpc/powernv/iov: Ensure the pdn for VFs always contains a valid PE number
      powerpc/pci: Remove pcibios_setup_bus_devices()
      powerpc/eeh_cache: Don't use pci_dn when inserting new ranges
      powerpc/eeh_sysfs: Fix incorrect comment
      powerpc/eeh_sysfs: ifdef pseries sr-iov sysfs properties
      powerpc/eeh_sysfs: Remove double pci_dn lookup.
      powerpc/eeh_sysfs: Make clearing EEH_DEV_SYSFS saner
      powerpc/sriov: Remove VF eeh_dev state when disabling SR-IOV
      powerpc/pcidn: Make VF pci_dn management CONFIG_PCI_IOV specific
      powerpc/pcidn: Warn when sriov pci_dn management is used incorrectly
      powernv/pci: Use pnv_phb as the private data for debugfs entries
      powernv/pci: Allow any write trigger the diag dump
      powernv/pci: Add a debugfs entry to dump PHB's IODA PE state
      powerpc/eeh: Only dump stack once if an MMIO loop is detected
      powerpc/powernv: Rework exports to support subnodes
      powerpc/powernv: Use common code for the symbol_map export
      powerpc/xmon: Allow passing an argument to ppc_md.restart()
      powerpc/powernv: Allow manually invoking special reboots
      powerpc/pci: Fold pcibios_setup_device() into pcibios_bus_add_device()
      powernv/pci: Remove dma_dev_setup() for NPU PHBs
      powerpc/iov: Move VF pdev fixup into pcibios_fixup_iov()
      powernv/pci: Fold pnv_pci_dma_dev_setup() into the pci-ioda.c version
      powernv/pci: Move pnv_pci_dma_bus_setup() to pci-ioda.c
      selftests/eeh: Bump EEH wait time to 60s

Peter Ujfalusi (1):
      powerpc/512x: Use dma_request_chan() instead dma_request_slave_channel()

Pingfan Liu (1):
      powerpc/pseries: Advance pfn if section is not present in lmb_is_removable()

Ram Pai (1):
      Revert "powerpc/pseries/iommu: Don't use dma_iommu_ops on secure guests"

Randy Dunlap (1):
      powerpc: indent to improve Kconfig readability

Russell Currey (2):
      powerpc/book3s64/hash: Disable 16M linear mapping size if not aligned
      powerpc: Remove STRICT_KERNEL_RWX incompatibility with RELOCATABLE

Sebastian Andrzej Siewior (1):
      powerpc/85xx: Get twr_p102x to compile again

Shawn Anastasio (1):
      powerpc/pci: Fix pcibios_setup_device() ordering

Sukadev Bhattiprolu (2):
      powerpc/xmon: don't access ASDR in VMs
      powerpc/xmon: Fix compile error in print_insn* functions

Tyrel Datwyler (1):
      powerpc/pseries/vio: Fix iommu_table use-after-free refcount warning

Vaibhav Jain (2):
      powerpc/papr_scm: Fix leaking 'bus_desc.provider_name' in some paths
      powerpc: Provide initial documentation for PAPR hcalls


 Documentation/devicetree/bindings/spi/fsl-spi.txt       |   8 +-
 Documentation/powerpc/imc.rst                           | 199 ++++++++++++++++
 Documentation/powerpc/index.rst                         |   2 +
 Documentation/powerpc/papr_hcalls.rst                   | 250 ++++++++++++++++++++
 arch/powerpc/Kconfig                                    |   9 +-
 arch/powerpc/Kconfig.debug                              |   2 +-
 arch/powerpc/Makefile.postlink                          |   4 +-
 arch/powerpc/boot/4xx.c                                 |   2 +-
 arch/powerpc/boot/dts/mgcoge.dts                        |   2 +-
 arch/powerpc/boot/dts/mpc832x_rdb.dts                   |   2 +-
 arch/powerpc/boot/dts/mpc8610_hpcd.dts                  |   2 +-
 arch/powerpc/configs/44x/akebono_defconfig              |   1 -
 arch/powerpc/configs/44x/sam440ep_defconfig             |   2 -
 arch/powerpc/configs/52xx/pcm030_defconfig              |   2 -
 arch/powerpc/configs/83xx/kmeter1_defconfig             |   2 -
 arch/powerpc/configs/adder875_defconfig                 |   1 -
 arch/powerpc/configs/ep8248e_defconfig                  |   1 -
 arch/powerpc/configs/ep88xc_defconfig                   |   1 -
 arch/powerpc/configs/mgcoge_defconfig                   |   1 -
 arch/powerpc/configs/mpc512x_defconfig                  |   1 -
 arch/powerpc/configs/mpc885_ads_defconfig               |   1 -
 arch/powerpc/configs/powernv_defconfig                  |   1 -
 arch/powerpc/configs/ppc64_defconfig                    |   1 -
 arch/powerpc/configs/ppc6xx_defconfig                   |   1 -
 arch/powerpc/configs/pseries_defconfig                  |   1 -
 arch/powerpc/configs/skiroot_defconfig                  |  68 +++---
 arch/powerpc/configs/storcenter_defconfig               |   1 -
 arch/powerpc/configs/tqm8xx_defconfig                   |   1 -
 arch/powerpc/include/asm/book3s/32/kup.h                |  68 +++++-
 arch/powerpc/include/asm/book3s/32/pgtable.h            |   5 +
 arch/powerpc/include/asm/book3s/64/kup-radix.h          |  40 +++-
 arch/powerpc/include/asm/cputable.h                     |   7 +-
 arch/powerpc/include/asm/firmware.h                     |   6 +-
 arch/powerpc/include/asm/hw_breakpoint.h                |   4 +
 arch/powerpc/include/asm/kasan.h                        |   2 +
 arch/powerpc/include/asm/kup.h                          |  49 +++-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h            |  21 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h            |   5 +
 arch/powerpc/include/asm/page.h                         |   2 +-
 arch/powerpc/include/asm/pci-bridge.h                   |   7 +-
 arch/powerpc/include/asm/pci.h                          |   1 -
 arch/powerpc/include/asm/pgtable.h                      |   6 -
 arch/powerpc/include/asm/pnv-pci.h                      |   1 +
 arch/powerpc/include/asm/processor.h                    |   9 +
 arch/powerpc/include/asm/reg_8xx.h                      |  14 ++
 arch/powerpc/include/asm/thread_info.h                  |  18 ++
 arch/powerpc/include/asm/uaccess.h                      |  88 +++++--
 arch/powerpc/include/asm/vdso_datapage.h                |  14 +-
 arch/powerpc/include/asm/xive.h                         |  92 +++----
 arch/powerpc/kernel/Makefile                            |   3 +-
 arch/powerpc/kernel/asm-offsets.c                       |  11 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c                       |  13 +-
 arch/powerpc/kernel/eeh.c                               |  32 +--
 arch/powerpc/kernel/eeh_cache.c                         |  10 +-
 arch/powerpc/kernel/eeh_driver.c                        |   6 -
 arch/powerpc/kernel/eeh_sysfs.c                         |  22 +-
 arch/powerpc/kernel/entry_32.S                          |  32 ++-
 arch/powerpc/kernel/entry_64.S                          |  18 +-
 arch/powerpc/kernel/exceptions-64s.S                    |  32 ++-
 arch/powerpc/kernel/fpu.S                               |   3 +
 arch/powerpc/kernel/head_32.S                           |  62 +++--
 arch/powerpc/kernel/head_32.h                           | 180 ++++++++++++--
 arch/powerpc/kernel/head_40x.S                          |   2 +
 arch/powerpc/kernel/head_8xx.S                          | 189 +++++++--------
 arch/powerpc/kernel/head_booke.h                        |   2 +
 arch/powerpc/kernel/head_fsl_booke.S                    |   1 +
 arch/powerpc/kernel/hw_breakpoint.c                     |  15 +-
 arch/powerpc/kernel/idle.c                              |  25 ++
 arch/powerpc/kernel/idle_book3s.S                       |  20 ++
 arch/powerpc/kernel/idle_power4.S                       |  83 -------
 arch/powerpc/kernel/irq.c                               |  22 ++
 arch/powerpc/kernel/pci-common.c                        |  46 +---
 arch/powerpc/kernel/pci-hotplug.c                       |   1 -
 arch/powerpc/kernel/pci_dn.c                            |  47 ++--
 arch/powerpc/kernel/pci_of_scan.c                       |   1 -
 arch/powerpc/kernel/process.c                           |  69 +++---
 arch/powerpc/kernel/setup.h                             |   2 +-
 arch/powerpc/kernel/setup_32.c                          |  17 +-
 arch/powerpc/kernel/setup_64.c                          |   2 +-
 arch/powerpc/kernel/traps.c                             |   9 +
 arch/powerpc/kernel/vdso.c                              |   5 -
 arch/powerpc/kernel/vdso32/Makefile                     |   4 +-
 arch/powerpc/kernel/vdso32/cacheflush.S                 |  32 ++-
 arch/powerpc/kernel/vdso32/datapage.S                   |  31 +--
 arch/powerpc/kernel/vdso32/getcpu.S                     |  23 +-
 arch/powerpc/kernel/vdso32/gettimeofday.S               | 119 +++++++---
 arch/powerpc/kernel/vdso32/vdso32.lds.S                 |   2 +-
 arch/powerpc/kernel/vector.S                            |   3 +
 arch/powerpc/kernel/vmlinux.lds.S                       |   2 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c                  |   6 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                 |   2 +
 arch/powerpc/kvm/book3s_xive.c                          |   2 +-
 arch/powerpc/mm/book3s32/hash_low.S                     |  46 ++--
 arch/powerpc/mm/book3s32/mmu.c                          |   9 +-
 arch/powerpc/mm/book3s64/hash_utils.c                   |  11 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c                |   6 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                    |   3 +
 arch/powerpc/mm/fault.c                                 |  11 +-
 arch/powerpc/mm/kasan/kasan_init_32.c                   |  89 ++++---
 arch/powerpc/mm/mem.c                                   |   4 +
 arch/powerpc/mm/mmu_decl.h                              |   6 +
 arch/powerpc/mm/nohash/8xx.c                            |  13 +-
 arch/powerpc/mm/pgtable_32.c                            |   1 +
 arch/powerpc/mm/ptdump/ptdump.c                         |   6 +-
 arch/powerpc/oprofile/backtrace.c                       |  14 +-
 arch/powerpc/perf/8xx-pmu.c                             |  12 +-
 arch/powerpc/perf/callchain.c                           |  20 +-
 arch/powerpc/perf/core-book3s.c                         |   8 +-
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c           |   6 +-
 arch/powerpc/platforms/83xx/km83xx.c                    |   2 +-
 arch/powerpc/platforms/85xx/smp.c                       |   9 +
 arch/powerpc/platforms/85xx/twr_p102x.c                 |   5 +-
 arch/powerpc/platforms/Kconfig                          |   4 +
 arch/powerpc/platforms/Kconfig.cputype                  |   8 +
 arch/powerpc/platforms/maple/setup.c                    |   2 +-
 arch/powerpc/platforms/powernv/opal.c                   | 144 +++++------
 arch/powerpc/platforms/powernv/pci-ioda.c               | 244 ++++++++++++++-----
 arch/powerpc/platforms/powernv/pci.c                    |  71 ++----
 arch/powerpc/platforms/powernv/pci.h                    |   3 -
 arch/powerpc/platforms/powernv/setup.c                  |   4 +
 arch/powerpc/platforms/pseries/Kconfig                  |   1 -
 arch/powerpc/platforms/pseries/firmware.c               |  10 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c         |   4 +-
 arch/powerpc/platforms/pseries/iommu.c                  |  64 ++---
 arch/powerpc/platforms/pseries/lparcfg.c                |   4 +-
 arch/powerpc/platforms/pseries/papr_scm.c               |   8 +-
 arch/powerpc/platforms/pseries/pci.c                    |   4 +-
 arch/powerpc/platforms/pseries/vio.c                    |   2 +
 arch/powerpc/sysdev/fsl_pci.c                           |  10 +-
 arch/powerpc/sysdev/mpic.c                              |   4 +-
 arch/powerpc/tools/relocs_check.sh                      |  20 +-
 arch/powerpc/xmon/dis-asm.h                             |   4 +-
 arch/powerpc/xmon/xmon.c                                |  20 +-
 drivers/macintosh/Kconfig                               |   6 +-
 drivers/misc/ocxl/Kconfig                               |   1 +
 drivers/pci/hotplug/pnv_php.c                           |  82 ++++---
 tools/testing/selftests/powerpc/eeh/eeh-functions.sh    |  10 +-
 tools/testing/selftests/powerpc/mm/.gitignore           |   1 +
 tools/testing/selftests/powerpc/mm/Makefile             |   3 +-
 tools/testing/selftests/powerpc/mm/bad_accesses.c       | 171 +++++++++++++
 tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c |   5 +-
 141 files changed, 2310 insertions(+), 1121 deletions(-)
 create mode 100644 Documentation/powerpc/imc.rst
 create mode 100644 Documentation/powerpc/papr_hcalls.rst
 delete mode 100644 arch/powerpc/kernel/idle_power4.S
 create mode 100644 tools/testing/selftests/powerpc/mm/bad_accesses.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl45XtUACgkQUevqPMjh
pYCBsxAAmof6budLg515kNyZTrl8TLVdZ3hFD8H7mHAufrK73z6n0fn0O+8n80lt
zILgL6J4VVCxgwjRsdhSaWOL58CTxqESj8D4MO7BbVr+epDOXPkvFs3Jc7CfdJWS
cHLaS/FO7Ou3LSOVf73OjKQszLYsz+mIgx+LVeVi8wxfNf+5WRhsnehORn/DylYN
t6TUPA9X1YmIpOuCLBw9g70xP211+OA+zqj5QSxhQQ/9p3IJw2mKQP5A+gCJVw6C
x8V/l0srAvdtegggzISH395QD8+pLg4MYpU9TCS/mdW3R9zCqD14qZgOGVLY6WFw
Mpi/UKqbGzvQcNl94BQEoXHjxV0/NwBtEiAhi1I1/zN42Z1NA2YhSTcu+pa9Ekgr
mrMl4ijSznmaKzaV9vt3khZpJYZUEQB8r89EIZbKmDD2zJVOrHSG/WPprTwf6meH
8ubke/Y6k1nf1rfEII5G9xFd2RJD2XIkJbVgqpXY3CZOZ8sMT5hzDfvOQiaVN2Oj
Kc7z6fTlIM6dB2lvYMltIk5uum4YHCTYDHpTGdfk5cZNi2V5QaXNZ6xcMRbIWTIQ
EXap44qqg9YPPQmJwzfZaxZ/Vo7ze0BS6iMdcv/UZFOOfe211IsFG7YHnVvryjiU
eG/f5LhaeIpfV+UMsJX048iLYTBzUm8CLQUam0fny+/sqBeThy0=
=5fUM
-----END PGP SIGNATURE-----
