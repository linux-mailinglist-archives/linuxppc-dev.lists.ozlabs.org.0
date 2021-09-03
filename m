Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5831540009E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 15:37:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1Jkz1hm2z2ymN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 23:37:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fv/OMfgi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fv/OMfgi; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1JkH2Tnmz2yHS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 23:37:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630676229;
 bh=1Qx364O8Logu6vWkIu10BnV2ugy3gB8HutcLJeUQmTQ=;
 h=From:To:Cc:Subject:Date:From;
 b=fv/OMfgicn07eiMvDJvrQ6oox6oCGd2kKfXyG/v1vHqE8kFi6lU0qUHJSXTRCq59o
 94Kw1hCbganPNnktzGj5B/l9EX5DFSNxsF2uUtHTBSpv+bDsWJ9vlTzluUsu95WIFS
 rF/MIu30M6rx+0brtDI0a0k3TrIaJ0gks2vd63JWgLQDNzOIw1O5u6aBRVWBIqUsDs
 /NOzYwvHa4kOlkGF+4/bsTmhdnfagVyHg77KX7QjBWaQE95+Ycy+wGqoewpBZ+S7/x
 kpOcaWrRdk17aV2Ny7AD6E5BwarDzbwf4haH/2+7YaltYmXohOXaU6lUFrV8WuzyWQ
 J0Ie/Q6dJOFKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H1Jk71tqfz9sPf;
 Fri,  3 Sep 2021 23:37:03 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.15-1 tag
Date: Fri, 03 Sep 2021 23:36:57 +1000
Message-ID: <87pmtppypy.fsf@mpe.ellerman.id.au>
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
Cc: ego@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com, parth@linux.ibm.com,
 aik@ozlabs.ru, jniethe5@gmail.com, bigeasy@linutronix.de,
 psampat@linux.ibm.com, paul.gortmaker@windriver.com, leobras.c@gmail.com,
 wanjiabing@vivo.com, lkp@intel.com, maskray@google.com, linkmauve@linkmauve.fr,
 aneesh.kumar@linux.ibm.com, masahiroy@kernel.org, joel@jms.id.au,
 lukas.bulwahn@gmail.com, kjain@linux.ibm.com, npiggin@gmail.com,
 nathan@kernel.org, clg@kaod.org, Thomas Gleixner <tglx@linutronix.de>,
 ldufour@linux.ibm.com, hbathini@linux.ibm.com, oss@buserror.net,
 msuchanek@suse.de, fthain@linux-m68k.org, farosas@linux.ibm.com,
 sxwjean@gmail.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, zhengyongjun3@huawei.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.15.

A bit of a small batch this time.

There was one conflict against my own fixes branch, and the resolution was =
a little bit
messy, so I just did a merge of fixes myself to resolve the conflict. I did=
n't think there
was any value in having you resolve a conflict between two of my own branch=
es.

Notable out of area changes:
  scripts/mod/modpost.c		# 1e688dd2a3d6 powerpc/bug: Provide better flexibi=
lity to WARN_ON/__WARN_FLAGS() with asm goto
  kernel/irq/irqdomain.c	# 51be9e51a800 KVM: PPC: Book3S HV: XIVE: Fix mapp=
ing of passthrough interrupts

That second one generated a bit of discussion[1] with tglx and maz, who ask=
ed if we could
avoid adding the export of irq_get_default_host(). C=C3=A9dric replied expl=
aining that we don't
really have good way to avoid it, but we never heard back from them, so in =
the end I
decided to merge it.

[1]: https://lore.kernel.org/all/878s4g5lfs.wl-maz@kernel.org/

cheers


The following changes since commit e1ab9a730b426fadc018f91b7c98412473e542fb:

  Merge branch 'fixes' into next (2021-07-26 20:37:53 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.15-1

for you to fetch changes up to a3314262eede9c909a0c797f16f25f941d12c78d:

  Merge branch 'fixes' into next (2021-09-03 22:54:12 +1000)

- ------------------------------------------------------------------
powerpc updates for 5.15

 - Convert pseries & powernv to use MSI IRQ domains.

 - Rework the pseries CPU numbering so that CPUs that are removed, and late=
r re-added, are
   given a CPU number on the same node as previously, when possible.

 - Add support for a new more flexible device-tree format for specifying NU=
MA distances.

 - Convert powerpc to GENERIC_PTDUMP.

 - Retire sbc8548 and sbc8641d board support.

 - Various other small features and fixes.

Thanks to: Alexey Kardashevskiy, Aneesh Kumar K.V, Anton Blanchard, C=C3=A9=
dric Le Goater,
Christophe Leroy, Emmanuel Gil Peyrot, Fabiano Rosas, Fangrui Song, Finn Th=
ain, Gautham R.
Shenoy, Hari Bathini, Joel Stanley, Jordan Niethe, Kajol Jain, Laurent Dufo=
ur, Leonardo
Bras, Lukas Bulwahn, Marc Zyngier, Masahiro Yamada, Michal Suchanek, Nathan=
 Chancellor,
Nicholas Piggin, Parth Shah, Paul Gortmaker, Pratik R. Sampat, Randy Dunlap=
, Sebastian
Andrzej Siewior, Srikar Dronamraju, Wan Jiabing, Xiongwei Song, Zheng Yongj=
un.

- ------------------------------------------------------------------
Alexey Kardashevskiy (2):
      KVM: PPC: Use arch_get_random_seed_long instead of powernv variant
      KVM: PPC: Fix clearing never mapped TCEs in realmode

Aneesh Kumar K.V (8):
      powerpc/book3s64/radix: make tlb_single_page_flush_ceiling a debugfs =
entry
      powerpc: rename powerpc_debugfs_root to arch_debugfs_dir
      powerpc/pseries: rename min_common_depth to primary_domain_index
      powerpc/pseries: Rename TYPE1_AFFINITY to FORM1_AFFINITY
      powerpc/pseries: Consolidate different NUMA distance update code paths
      powerpc/pseries: Add a helper for form1 cpu distance
      powerpc/pseries: Add support for FORM2 associativity
      powerpc/doc: Fix htmldocs errors

Anton Blanchard (1):
      powerpc/configs: Disable legacy ptys on microwatt defconfig

Christophe Leroy (21):
      powerpc: Remove in_kernel_text()
      powerpc/non-smp: Unconditionaly call smp_mb() on switch_mm
      powerpc/bug: Remove specific powerpc BUG_ON() and WARN_ON() on PPC32
      powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() wit=
h asm goto
      powerpc/32: Remove unneccessary calculations in load_up_{fpu/altivec}
      powerpc/audit: Avoid unneccessary #ifdef in syscall_get_arguments()
      powerpc/audit: Simplify syscall_get_arch()
      powerpc/syscalls: Remove __NR__exit
      powerpc/32: indirect function call use bctrl rather than blrl in ret_=
from_kernel_thread
      powerpc/booke: Avoid link stack corruption in several places
      powerpc: Avoid link stack corruption in misc asm functions
      powerpc/ptdump: Use DEFINE_SHOW_ATTRIBUTE()
      powerpc/ptdump: Remove unused 'page_size' parameter
      powerpc/ptdump: Reduce level numbers by 1 in note_page() and add p4d =
level
      powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP
      powerpc/syscalls: Simplify do_mmap2()
      powerpc/ptrace: Make user_mode() common to PPC32 and PPC64
      powerpc: Use lwarx/ldarx directly instead of PPC_LWARX/LDARX macros
      powerpc: Remove MSR_PR check in interrupt_exit_{user/kernel}_prepare()
      powerpc: Refactor verification of MSR_RI
      powerpc: Redefine HMT_xxx macros as empty on PPC32

C=C3=A9dric Le Goater (39):
      powerpc/pseries/pci: Introduce __find_pe_total_msi()
      powerpc/pseries/pci: Introduce rtas_prepare_msi_irqs()
      powerpc/xive: Add support for IRQ domain hierarchy
      powerpc/xive: Ease debugging of xive_irq_set_affinity()
      powerpc/pseries/pci: Add MSI domains
      powerpc/xive: Drop unmask of MSIs at startup
      powerpc/xive: Remove irqd_is_started() check when setting the affinity
      powerpc/pseries/pci: Add a domain_free_irqs() handler
      powerpc/pseries/pci: Add a msi_free() handler to clear XIVE data
      powerpc/pseries/pci: Add support of MSI domains to PHB hotplug
      powerpc/powernv/pci: Introduce __pnv_pci_ioda_msi_setup()
      powerpc/powernv/pci: Add MSI domains
      KVM: PPC: Book3S HV: Use the new IRQ chip to detect passthrough inter=
rupts
      KVM: PPC: Book3S HV: XIVE: Change interface of passthrough interrupt =
routines
      KVM: PPC: Book3S HV: XIVE: Fix mapping of passthrough interrupts
      powerpc/xics: Remove ICS list
      powerpc/xics: Rename the map handler in a check handler
      powerpc/xics: Give a name to the default XICS IRQ domain
      powerpc/xics: Add debug logging to the set_irq_affinity handlers
      powerpc/xics: Add support for IRQ domain hierarchy
      powerpc/powernv/pci: Customize the MSI EOI handler to support PHB3
      powerpc/pci: Drop XIVE restriction on MSI domains
      powerpc/xics: Drop unmask of MSIs at startup
      powerpc/pseries/pci: Drop unused MSI code
      powerpc/powernv/pci: Drop unused MSI code
      powerpc/powernv/pci: Adapt is_pnv_opal_msi() to detect passthrough in=
terrupt
      powerpc/xics: Fix IRQ migration
      powerpc/powernv/pci: Set the IRQ chip data for P8/CXL devices
      powerpc/powernv/pci: Rework pnv_opal_pci_msi_eoi()
      KVM: PPC: Book3S HV: XICS: Fix mapping of passthrough interrupts
      powerpc/xive: Use XIVE domain under xmon and debugfs
      powerpc: use IRQF_NO_DEBUG for IPIs
      KVM: PPC: Book3S HV: XIVE: Add a 'flags' field
      KVM: PPC: Book3S HV: XIVE: Add support for automatic save-restore
      powerpc/pseries/vas: Declare pseries_vas_fault_thread_fn() as static
      KVM: PPC: Book3S PR: Declare kvmppc_handle_exit_pr()
      KVM: PPC: Book3S PR: Remove unused variable
      powerpc/prom: Fix unused variable =E2=80=98reserve_map=E2=80=99 when =
CONFIG_PPC32 is not set
      powerpc/compat_sys: Declare syscalls

Emmanuel Gil Peyrot (3):
      powerpc: wii.dts: Reduce the size of the control area
      powerpc: wii.dts: Expose the OTP on this platform
      powerpc: wii_defconfig: Enable OTP by default

Fabiano Rosas (6):
      KVM: PPC: Book3S HV: Fix copy_tofrom_guest routines
      KVM: PPC: Book3S HV: Add sanity check to copy_tofrom_guest
      KVM: PPC: Book3S HV: Stop exporting symbols from book3s_64_mmu_radix
      KVM: PPC: Book3S HV Nested: Sanitise vcpu registers
      KVM: PPC: Book3S HV Nested: Stop forwarding all HFUs to L1
      KVM: PPC: Book3S HV Nested: save_hv_return_state does not require tra=
p argument

Fangrui Song (1):
      powerpc: Add "-z notext" flag to disable diagnostic

Finn Thain (1):
      powerpc/tau: Add 'static' storage qualifier to 'tau_work' definition

Gautham R. Shenoy (4):
      cpuidle: pseries: Fixup CEDE0 latency only for POWER10 onwards
      cpuidle: pseries: Do not cap the CEDE0 latency in fixup_cede0_latency=
()
      powerpc/cacheinfo: Lookup cache by dt node and thread-group id
      powerpc/cacheinfo: Remove the redundant get_shared_cpu_map()

Hari Bathini (1):
      powerpc/kexec: blacklist functions called in real mode for kprobe

Joel Stanley (6):
      powerpc/config: Fix IPV6 warning in mpc855_ads
      powerpc/config: Renable MTD_PHYSMAP_OF
      powerpc/configs: Regenerate mpc885_ads_defconfig
      powerpc/microwatt: Add Ethernet to device tree
      powerpc/configs/microwattt: Enable Liteeth
      powerpc/configs/microwatt: Enable options for systemd

Jordan Niethe (3):
      powerpc: Always inline radix_enabled() to fix build failure
      selftests/powerpc: Add missing clobbered register to to ptrace TM tes=
ts
      selftests: Skip TM tests on synthetic TM implementations

Kajol Jain (4):
      powerpc/perf/hv-gpci: Fix counter value parsing
      powerpc/perf: Use stack siar instead of mfspr
      powerpc/perf: Drop the case of returning 0 as instruction pointer
      powerpc/perf: Fix the check for SIAR value

Laurent Dufour (3):
      powerpc/numa: Consider the max NUMA node for migratable LPAR
      pseries/drmem: update LMBs after LPM
      powerpc/pseries: Prevent free CPU ids being reused on another node

Leonardo Bras (11):
      powerpc/pseries/iommu: Replace hard-coded page shift
      powerpc/kernel/iommu: Add new iommu_table_in_use() helper
      powerpc/pseries/iommu: Add iommu_pseries_alloc_table() helper
      powerpc/pseries/iommu: Add ddw_list_new_entry() helper
      powerpc/pseries/iommu: Allow DDW windows starting at 0x00
      powerpc/pseries/iommu: Add ddw_property_create() and refactor enable_=
ddw()
      powerpc/pseries/iommu: Reorganize iommu_table_setparms*() with new he=
lper
      powerpc/pseries/iommu: Update remove_dma_window() to accept property =
name
      powerpc/pseries/iommu: Find existing DDW with given property name
      powerpc/pseries/iommu: Make use of DDW for indirect mapping
      powerpc/pseries/iommu: Rename "direct window" to "dma window"

Lukas Bulwahn (1):
      powerpc/kvm: Remove obsolete and unneeded select

Marc Zyngier (1):
      powerpc: Bulk conversion to generic_handle_domain_irq()

Masahiro Yamada (3):
      powerpc: remove unused zInstall target from arch/powerpc/boot/Makefile
      powerpc: make the install target not depend on any build artifact
      powerpc: move the install rule to arch/powerpc/Makefile

Michael Ellerman (7):
      powerpc/pseries: Fix build error when NUMA=3Dn
      powerpc/head_check: Fix shellcheck errors
      Merge branch 'topic/ppc-kvm' into next
      Merge changes from Paul Gortmaker
      powerpc/ptdump: Fix generic ptdump for 64-bit
      powerpc/bug: Cast to unsigned long before passing to inline asm
      Merge branch 'fixes' into next

Michal Suchanek (1):
      powerpc/stacktrace: Include linux/delay.h

Nathan Chancellor (1):
      cpuidle: pseries: Mark pseries_idle_proble() as __init

Nicholas Piggin (8):
      powerpc/64s/perf: Always use SIAR for kernel interrupts
      KVM: PPC: Book3S HV: Initialise vcpu MSR with MSR_ME
      KVM: PPC: Book3S HV: Remove TM emulation from POWER7/8 path
      KVM: PPC: Book3S HV P9: Fixes for TM softpatch interrupt NIP
      KVM: PPC: Book3S HV Nested: Fix TM softpatch HFAC interrupt emulation
      KVM: PPC: Book3S HV Nested: Make nested HFSCR state accessible
      KVM: PPC: Book3S HV Nested: Reflect guest PMU in-use to L0 when guest=
 SPRs are live
      powerpc/64s: Remove WORT SPR from POWER9/10

Parth Shah (1):
      powerpc/smp: Use existing L2 cache_map cpumask to find L3 cache sibli=
ngs

Paul Gortmaker (3):
      powerpc: retire sbc8548 board support
      powerpc: retire sbc8641d board support
      MAINTAINERS: update for Paul Gortmaker

Pratik R. Sampat (1):
      cpufreq: powernv: Fix init_chip_info initialization in numa=3Doff

Randy Dunlap (1):
      powerpc/head_check: use stdout for error messages

Sebastian Andrzej Siewior (1):
      powerpc: Replace deprecated CPU-hotplug functions.

Srikar Dronamraju (7):
      powerpc/smp: Fix a crash while booting kvm guest with nr_cpus=3D2
      powerpc/smp: Update cpu_core_map on all PowerPc systems
      powerpc/smp: Enable CACHE domain for shared processor
      powerpc/numa: Drop dbg in favour of pr_debug
      powerpc/numa: convert printk to pr_xxx
      powerpc/numa: Print debug statements only when required
      powerpc/numa: Update cpu_cpu_map on CPU online/offline

Wan Jiabing (1):
      powerpc: Remove duplicate includes

Xiongwei Song (4):
      powerpc: Add esr as a synonym for pt_regs.dsisr
      powerpc/64e: Get esr offset with _ESR macro
      powerpc: Add dear as a synonym for pt_regs.dar register
      powerpc/64e: Get dear offset with _DEAR macro

Zheng Yongjun (1):
      selftests/powerpc: Remove duplicated include from tm-poison.c

kernel test robot (1):
      powerpc/kexec: fix for_each_child.cocci warning


 Documentation/powerpc/associativity.rst                        | 105 ++++
 Documentation/powerpc/index.rst                                |   1 +
 MAINTAINERS                                                    |   1 -
 arch/powerpc/Kconfig                                           |   2 +
 arch/powerpc/Kconfig.debug                                     |  30 --
 arch/powerpc/Makefile                                          |   4 +-
 arch/powerpc/boot/Makefile                                     |  11 -
 arch/powerpc/boot/dts/fsl/sbc8641d.dts                         | 176 -----=
--
 arch/powerpc/boot/dts/microwatt.dts                            |  12 +
 arch/powerpc/boot/dts/sbc8548-altflash.dts                     | 111 -----
 arch/powerpc/boot/dts/sbc8548-post.dtsi                        | 289 -----=
------
 arch/powerpc/boot/dts/sbc8548-pre.dtsi                         |  48 --
 arch/powerpc/boot/dts/sbc8548.dts                              | 106 ----
 arch/powerpc/boot/dts/wii.dts                                  |  13 +-
 arch/powerpc/boot/install.sh                                   |  27 +-
 arch/powerpc/boot/wrapper                                      |   2 +-
 arch/powerpc/configs/85xx/sbc8548_defconfig                    |  50 --
 arch/powerpc/configs/microwatt_defconfig                       |   7 +-
 arch/powerpc/configs/mpc85xx_base.config                       |   1 -
 arch/powerpc/configs/mpc86xx_base.config                       |   1 -
 arch/powerpc/configs/mpc885_ads_defconfig                      |  49 +-
 arch/powerpc/configs/ppc6xx_defconfig                          |   1 -
 arch/powerpc/configs/wii_defconfig                             |   1 +
 arch/powerpc/include/asm/asm-compat.h                          |   4 +-
 arch/powerpc/include/asm/atomic.h                              |   4 +-
 arch/powerpc/include/asm/bitops.h                              |   8 +-
 arch/powerpc/include/asm/book3s/64/kup.h                       |   2 +-
 arch/powerpc/include/asm/bug.h                                 |  62 ++-
 arch/powerpc/include/asm/debugfs.h                             |  13 -
 arch/powerpc/include/asm/drmem.h                               |   1 +
 arch/powerpc/include/asm/extable.h                             |  14 +
 arch/powerpc/include/asm/firmware.h                            |   7 +-
 arch/powerpc/include/asm/iommu.h                               |   1 +
 arch/powerpc/include/asm/kvm_book3s_64.h                       |   1 +
 arch/powerpc/include/asm/kvm_host.h                            |   2 +
 arch/powerpc/include/asm/kvm_ppc.h                             |   4 +-
 arch/powerpc/include/asm/membarrier.h                          |   3 +-
 arch/powerpc/include/asm/mmu.h                                 |   2 +-
 arch/powerpc/include/asm/pci-bridge.h                          |   5 +
 arch/powerpc/include/asm/pmc.h                                 |   7 +
 arch/powerpc/include/asm/pnv-pci.h                             |   2 +-
 arch/powerpc/include/asm/ppc-opcode.h                          |   2 -
 arch/powerpc/include/asm/ppc_asm.h                             |  13 +-
 arch/powerpc/include/asm/prom.h                                |   3 +-
 arch/powerpc/include/asm/ptrace.h                              |  37 +-
 arch/powerpc/include/asm/reg.h                                 |   3 +-
 arch/powerpc/include/asm/sections.h                            |   8 -
 arch/powerpc/include/asm/simple_spinlock.h                     |   6 +-
 arch/powerpc/include/asm/smp.h                                 |   6 +
 arch/powerpc/include/asm/syscall.h                             |  20 +-
 arch/powerpc/include/asm/syscalls.h                            |  30 ++
 arch/powerpc/include/asm/tce.h                                 |   8 -
 arch/powerpc/include/asm/topology.h                            |  19 +-
 arch/powerpc/include/asm/unistd.h                              |   2 -
 arch/powerpc/include/asm/vdso/processor.h                      |   9 +
 arch/powerpc/include/asm/xics.h                                |   3 +-
 arch/powerpc/include/asm/xive-regs.h                           |   3 +
 arch/powerpc/include/asm/xive.h                                |   2 +
 arch/powerpc/kernel/Makefile                                   |   3 +-
 arch/powerpc/kernel/asm-offsets.c                              |  15 +-
 arch/powerpc/kernel/cacheinfo.c                                | 124 ++---
 arch/powerpc/kernel/dawr.c                                     |   3 +-
 arch/powerpc/kernel/eeh.c                                      |  16 +-
 arch/powerpc/kernel/eeh_cache.c                                |   4 +-
 arch/powerpc/kernel/entry_32.S                                 |   4 +-
 arch/powerpc/kernel/entry_64.S                                 |   2 +-
 arch/powerpc/kernel/exceptions-64e.S                           |  24 +-
 arch/powerpc/kernel/fadump.c                                   |   4 +-
 arch/powerpc/kernel/fpu.S                                      |   3 +-
 arch/powerpc/kernel/fsl_booke_entry_mapping.S                  |   8 +-
 arch/powerpc/kernel/head_44x.S                                 |   6 +-
 arch/powerpc/kernel/head_64.S                                  |   2 +
 arch/powerpc/kernel/head_fsl_booke.S                           |   6 +-
 arch/powerpc/kernel/hw_breakpoint.c                            |   1 -
 arch/powerpc/kernel/interrupt.c                                |  12 +-
 arch/powerpc/kernel/iommu.c                                    |  61 +--
 arch/powerpc/kernel/kdebugfs.c                                 |  14 +
 arch/powerpc/kernel/misc.S                                     |   2 +-
 arch/powerpc/kernel/misc_32.S                                  |   4 +-
 arch/powerpc/kernel/misc_64.S                                  |   2 +-
 arch/powerpc/kernel/pci-common.c                               |   6 +
 arch/powerpc/kernel/process.c                                  |   2 +-
 arch/powerpc/kernel/prom.c                                     |   5 +-
 arch/powerpc/kernel/prom_init.c                                |   3 +-
 arch/powerpc/kernel/ptrace/ptrace.c                            |   4 +
 arch/powerpc/kernel/reloc_32.S                                 |   2 +-
 arch/powerpc/kernel/rtasd.c                                    |   4 +-
 arch/powerpc/kernel/security.c                                 |  16 +-
 arch/powerpc/kernel/setup-common.c                             |  13 -
 arch/powerpc/kernel/setup_64.c                                 |   1 -
 arch/powerpc/kernel/smp.c                                      |  88 ++--
 arch/powerpc/kernel/stacktrace.c                               |   1 +
 arch/powerpc/kernel/syscalls.c                                 |  15 +-
 arch/powerpc/kernel/tau_6xx.c                                  |   2 +-
 arch/powerpc/kernel/time.c                                     |   3 +-
 arch/powerpc/kernel/traps.c                                    |  23 +-
 arch/powerpc/kernel/vector.S                                   |   4 +-
 arch/powerpc/kexec/core_64.c                                   |  10 +-
 arch/powerpc/kexec/relocate_32.S                               |  12 +-
 arch/powerpc/kvm/Kconfig                                       |   1 -
 arch/powerpc/kvm/book3s.h                                      |   3 +-
 arch/powerpc/kvm/book3s_64_mmu.c                               |   3 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c                         |  12 +-
 arch/powerpc/kvm/book3s_64_vio_hv.c                            |   9 +-
 arch/powerpc/kvm/book3s_hv.c                                   | 108 +++-
 arch/powerpc/kvm/book3s_hv_builtin.c                           |  10 +-
 arch/powerpc/kvm/book3s_hv_nested.c                            | 101 ++--
 arch/powerpc/kvm/book3s_hv_rm_xics.c                           |   8 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                        |  42 --
 arch/powerpc/kvm/book3s_hv_tm.c                                |  61 ++-
 arch/powerpc/kvm/book3s_xics.c                                 |   6 +-
 arch/powerpc/kvm/book3s_xive.c                                 |  74 ++-
 arch/powerpc/kvm/book3s_xive.h                                 |  11 +-
 arch/powerpc/kvm/book3s_xive_native.c                          |  24 +-
 arch/powerpc/mm/Makefile                                       |   2 +-
 arch/powerpc/mm/book3s64/hash_native.c                         |   2 +-
 arch/powerpc/mm/book3s64/hash_utils.c                          |   4 +-
 arch/powerpc/mm/book3s64/pgtable.c                             |   8 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c                       |   3 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                           |  16 +-
 arch/powerpc/mm/book3s64/slb.c                                 |   2 +-
 arch/powerpc/mm/drmem.c                                        |  46 ++
 arch/powerpc/mm/mmu_decl.h                                     |   2 +-
 arch/powerpc/mm/nohash/tlb_low.S                               |   4 +-
 arch/powerpc/mm/numa.c                                         | 491 +++++=
+++++++++-----
 arch/powerpc/mm/ptdump/8xx.c                                   |   6 +-
 arch/powerpc/mm/ptdump/Makefile                                |   9 +-
 arch/powerpc/mm/ptdump/bats.c                                  |  18 +-
 arch/powerpc/mm/ptdump/book3s64.c                              |   6 +-
 arch/powerpc/mm/ptdump/hashpagetable.c                         |  12 +-
 arch/powerpc/mm/ptdump/ptdump.c                                | 178 ++---=
--
 arch/powerpc/mm/ptdump/segment_regs.c                          |  16 +-
 arch/powerpc/mm/ptdump/shared.c                                |   6 +-
 arch/powerpc/perf/core-book3s.c                                |  21 +-
 arch/powerpc/perf/hv-gpci.c                                    |   2 +-
 arch/powerpc/platforms/44x/machine_check.c                     |   4 +-
 arch/powerpc/platforms/4xx/machine_check.c                     |   2 +-
 arch/powerpc/platforms/85xx/Kconfig                            |   6 -
 arch/powerpc/platforms/85xx/Makefile                           |   1 -
 arch/powerpc/platforms/85xx/sbc8548.c                          | 134 -----
 arch/powerpc/platforms/86xx/Kconfig                            |   8 +-
 arch/powerpc/platforms/86xx/Makefile                           |   1 -
 arch/powerpc/platforms/86xx/sbc8641d.c                         |  87 ----
 arch/powerpc/platforms/cell/axon_msi.c                         |   4 +-
 arch/powerpc/platforms/embedded6xx/holly.c                     |   2 +-
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c              |   2 +-
 arch/powerpc/platforms/pasemi/idle.c                           |   2 +-
 arch/powerpc/platforms/powernv/idle.c                          |   6 +-
 arch/powerpc/platforms/powernv/memtrace.c                      |   3 +-
 arch/powerpc/platforms/powernv/opal-imc.c                      |  12 +-
 arch/powerpc/platforms/powernv/opal-lpc.c                      |   4 +-
 arch/powerpc/platforms/powernv/opal-xscom.c                    |   4 +-
 arch/powerpc/platforms/powernv/opal.c                          |   2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                      | 260 +++++=
++++-
 arch/powerpc/platforms/powernv/pci.c                           |  67 ---
 arch/powerpc/platforms/powernv/pci.h                           |   6 -
 arch/powerpc/platforms/ps3/htab.c                              |   3 +-
 arch/powerpc/platforms/ps3/mm.c                                |   8 +-
 arch/powerpc/platforms/pseries/dtl.c                           |   4 +-
 arch/powerpc/platforms/pseries/firmware.c                      |   3 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c                   | 173 +++++=
--
 arch/powerpc/platforms/pseries/hotplug-memory.c                |   6 +
 arch/powerpc/platforms/pseries/iommu.c                         | 514 +++++=
+++++++--------
 arch/powerpc/platforms/pseries/lpar.c                          |  18 +-
 arch/powerpc/platforms/pseries/msi.c                           | 296 +++++=
+++---
 arch/powerpc/platforms/pseries/pci_dlpar.c                     |   4 +
 arch/powerpc/platforms/pseries/pseries.h                       |   2 +
 arch/powerpc/platforms/pseries/ras.c                           |   2 +-
 arch/powerpc/platforms/pseries/setup.c                         |   2 +
 arch/powerpc/platforms/pseries/vas.c                           |   2 +-
 arch/powerpc/sysdev/fsl_rio.c                                  |   2 +-
 arch/powerpc/sysdev/xics/ics-native.c                          |  13 +-
 arch/powerpc/sysdev/xics/ics-opal.c                            |  40 +-
 arch/powerpc/sysdev/xics/ics-rtas.c                            |  40 +-
 arch/powerpc/sysdev/xics/xics-common.c                         | 131 +++--
 arch/powerpc/sysdev/xive/common.c                              | 103 +++-
 arch/powerpc/sysdev/xive/native.c                              |  10 +
 arch/powerpc/tools/head_check.sh                               |  24 +-
 arch/powerpc/xmon/xmon.c                                       |  22 +-
 drivers/cpufreq/powernv-cpufreq.c                              |  16 +-
 drivers/cpuidle/cpuidle-pseries.c                              |  77 +--
 kernel/irq/irqdomain.c                                         |   1 +
 scripts/mod/modpost.c                                          |   2 +-
 tools/testing/selftests/powerpc/primitives/asm/extable.h       |   1 +
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c         |   3 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c     |   3 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c     |   1 +
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c     |   1 +
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spr.c         |   1 +
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c         |   1 +
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c         |   1 +
 tools/testing/selftests/powerpc/signal/signal_tm.c             |   1 +
 tools/testing/selftests/powerpc/tm/tm-exec.c                   |   1 +
 tools/testing/selftests/powerpc/tm/tm-fork.c                   |   1 +
 tools/testing/selftests/powerpc/tm/tm-poison.c                 |   2 +-
 tools/testing/selftests/powerpc/tm/tm-resched-dscr.c           |   1 +
 tools/testing/selftests/powerpc/tm/tm-signal-context-chk-fpu.c |   1 +
 tools/testing/selftests/powerpc/tm/tm-signal-context-chk-gpr.c |   1 +
 tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vmx.c |   1 +
 tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vsx.c |   1 +
 tools/testing/selftests/powerpc/tm/tm-signal-pagefault.c       |   1 +
 tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c    |   1 +
 tools/testing/selftests/powerpc/tm/tm-signal-stack.c           |   1 +
 tools/testing/selftests/powerpc/tm/tm-sigreturn.c              |   1 +
 tools/testing/selftests/powerpc/tm/tm-syscall.c                |   2 +-
 tools/testing/selftests/powerpc/tm/tm-tar.c                    |   1 +
 tools/testing/selftests/powerpc/tm/tm-tmspr.c                  |   1 +
 tools/testing/selftests/powerpc/tm/tm-trap.c                   |   1 +
 tools/testing/selftests/powerpc/tm/tm-unavailable.c            |   1 +
 tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c            |   1 +
 tools/testing/selftests/powerpc/tm/tm-vmxcopy.c                |   1 +
 tools/testing/selftests/powerpc/tm/tm.h                        |  36 ++
 212 files changed, 2814 insertions(+), 2616 deletions(-)
 create mode 100644 Documentation/powerpc/associativity.rst
 delete mode 100644 arch/powerpc/boot/dts/fsl/sbc8641d.dts
 delete mode 100644 arch/powerpc/boot/dts/sbc8548-altflash.dts
 delete mode 100644 arch/powerpc/boot/dts/sbc8548-post.dtsi
 delete mode 100644 arch/powerpc/boot/dts/sbc8548-pre.dtsi
 delete mode 100644 arch/powerpc/boot/dts/sbc8548.dts
 delete mode 100644 arch/powerpc/configs/85xx/sbc8548_defconfig
 delete mode 100644 arch/powerpc/include/asm/debugfs.h
 create mode 100644 arch/powerpc/kernel/kdebugfs.c
 delete mode 100644 arch/powerpc/platforms/85xx/sbc8548.c
 delete mode 100644 arch/powerpc/platforms/86xx/sbc8641d.c
 create mode 120000 tools/testing/selftests/powerpc/primitives/asm/extable.h
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmEyJC4ACgkQUevqPMjh
pYBfNw//arvzXcFd8WvnogaR4X/oCo5kYIOTsP/5zfVNX+PUe0k65BgXjAr+NoNG
XYZn9/LXpzhi6q05lzJPvAE1jmn7XF2S5muv6OfWcLwDACq1/vOY9scwT+WtaZQ1
hDqKueC3k7ds4IAicfUh8liXd58QzWPSClhzjSHApHtx0Upb9w5W0yAwG+Y+DLpm
pvTsScbymvFJUEe9HVXkGUGP3YNciHNN68cHqhOPN4ha/B9SZ/vOGGtRu8JOa+lj
Aev6g5eQDiHK+9UgXnqXzteG9eMcpu3gF6VtUUEDZZRNo++GTNZ38hlBkJacwfOO
hCj3BiauEJP/G1jM2BlrHolgZoMt+jVnuYnaZWFxe5uifrFhK5j/CysTkZR5NEmQ
3OLutbFrJ8C6r8o/kuiA6wt63JzR0Ya8+o8g2GjBdUpepIook6NyfqE7W4o7Qw5U
pWefvwTJaebejMjxp42nyRQ8EitWz/U/2kZY1JdreEAlPF0MOzldTZwIRDgDCnhe
CFIUKjRHXf43CseUryA2iK5UyJ6oJ6Yl1A04v5Z8HYlXtMMKBXjwRwSilQq9RUb9
+k8uj44ChtwNs3Dgjov9NtZDBBcBa/fO6u/LjMvRwtN5KmEUby0/KW1nq/aQfoCh
Ek3sk9rGnr4u4DnOPaCNx7Km0XgcnzHQgeg72k0GBNhUxtwevv8=3D
=3D9/Eq
-----END PGP SIGNATURE-----
