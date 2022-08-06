Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A91A558B414
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 08:43:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M0Cbs3Wf9z3bgQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 16:43:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dlHtNcrA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M0Cb808gsz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Aug 2022 16:43:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dlHtNcrA;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M0CZt6Wszz4x1R;
	Sat,  6 Aug 2022 16:43:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659768194;
	bh=C4rPTWPX8M/1IQZbHBNMihsY7xANUV3BsMg7BFE09Uo=;
	h=From:To:Cc:Subject:Date:From;
	b=dlHtNcrAW2ZT8yQ8TSLIgExYvUV8wSIIIYoJPUIKeIaPuqwFdwHcrcCPfsX+ZeBnL
	 tdsiqGqf00iAbtujOAdpJ6QPEUbao76nDACyuTq0HL5U9VATuQfaIjEFhWUwcDAL8z
	 Azgsy9nA1rMvyCvgOdHpHaGGknJseXQCRFMPXxrpshhqxkBsX98W4SNZ4XBlMh2NHH
	 CnCZel7LDNrw29meghZiT93JRWpxoYCrESEXfEq2sjUZkHsqr8SJyXLoYUgmLxGwoD
	 BlXbEtvI+Wxk526CRmX8Hsba5BgWPhX8FIRfHKSofY/uinc9bqT4ihYfa9irKZPLpX
	 9WdBdSHwxX86A==
From: mpe@ellerman.id.au
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.0-1 tag
Date: Sat, 06 Aug 2022 16:42:59 +1000
Message-ID: <877d3lan4c.fsf@mpe.ellerman.id.au>
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
Cc: Jason@zx2c4.com, aik@ozlabs.ru, linmq006@gmail.com, wangborong@cdjrlc.com, viresh.kumar@linaro.org, rashmica@linux.ibm.com, bagasdotme@gmail.com, rashmica.g@gmail.com, ldufour@linux.ibm.com, baihaowen@meizu.com, xiujianfeng@huawei.com, deller@gmx.de, nayna@linux.ibm.com, rppt@linux.ibm.com, jiangjian@cdjrlc.com, joel@jms.id.au, muriloo@linux.ibm.com, masahiroy@kernel.org, linux@roeck-us.net, ajd@linux.ibm.com, arnd@arndb.de, kjain@linux.ibm.com, u.kleine-koenig@pengutronix.de, npiggin@gmail.com, oss@buserror.net, chris.packham@alliedtelesis.co.nz, mkl@pengutronix.de, andriy.shevchenko@linux.intel.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, zhouzhouyi@gmail.com, farosas@linux.ibm.com, pali@kernel.org, cheloha@linux.ibm.com, linux-kernel@vger.kernel.org, wsa@kernel.org, broonie@kernel.org, juerg.haefliger@canonical.com, maddy@linux.ibm.com, sohu0106@126.com, linuxppc-dev@lists.ozlabs.org, damien.lemoal@opensource.wdc.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 6.0.

There's one trivial conflict between the removal of CONFIG_ARCH_RANDOM and =
a whitespace
change on our side.

There also will be a conflict in some powerpc code when you merge the bitma=
p tree, details
here:

  https://lore.kernel.org/all/87edxtaol6.fsf@mpe.ellerman.id.au/T/#m42404b0=
bef4978d3ff53c94b0fc999d421ea99cb

cheers

Notable out of area changes:
  de06fba62af6 powerpc/mpc5xxx: Switch mpc5xxx_get_bus_frequency() to use f=
wnode:
    drivers/ata/pata_mpc52xx.c
    drivers/i2c/busses/i2c-mpc.c
    drivers/spi/spi-mpc52xx.c
    drivers/tty/serial/mpc52xx_uart.c
    drivers/net/can/mscan/mpc5xxx_can.c
    drivers/net/ethernet/freescale/fec_mpc52xx.c
    drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
    drivers/net/ethernet/freescale/fs_enet/mii-fec.c

  include/linux/nmi.h			# 7c56a8733d0a watchdog: export lockup_detector_rec=
onfigure
  kernel/watchdog.c			# 7c56a8733d0a watchdog: export lockup_detector_recon=
figure
  drivers/watchdog/pseries-wdt.c	# 69472ffa6575 watchdog/pseries-wdt: initi=
al support for H_WATCHDOG-based watchdog timers
  drivers/char/hw_random/powernv-rng.c	# 978030f054ff powerpc/powernv: rena=
me remaining rng powernv_ functions to pnv_
  drivers/edac/mpc85xx_edac.c		# 4177ab2283dc EDAC/mpc85xx: Include require=
d of headers directly
  drivers/edac/ppc4xx_edac.c		# bce02f71e48f EDAC/ppc_4xx: Include required=
 of_irq header directly
  drivers/scsi/cxlflash/ocxl_hw.c	# 61657dcd528b scsi: cxlflash: Include mi=
ssing linux/irqdomain.h
  drivers/scsi/mesh.c			# d7f396461518 powerpc/powermac: Remove empty funct=
ion note_scsi_host()
  drivers/video/fbdev/offb.c		# ebef8abc963b video: fbdev: offb: Include mi=
ssing linux/platform_device.h
  scripts/remove-stale-files		# 9257971377e2 powerpc/purgatory: Omit use of=
 bin2c

The following changes since commit b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3:

  Linux 5.19-rc2 (2022-06-12 16:11:37 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.0-1

for you to fetch changes up to 4cfa6ff24a9744ba484521c38bea613134fbfcb3:

  powerpc/64e: Fix kexec build error (2022-08-03 16:32:18 +1000)

- ------------------------------------------------------------------
powerpc updates for 6.0

 - Add support for syscall stack randomization.

 - Add support for atomic operations to the 32 & 64-bit BPF JIT.

 - Full support for KASAN on 64-bit Book3E.

 - Add a watchdog driver for the new PowerVM hypervisor watchdog.

 - Add a number of new selftests for the Power10 PMU support.

 - Add a driver for the PowerVM Platform KeyStore.

 - Increase the NMI watchdog timeout during live partition migration, to av=
oid timeouts
   due to increased memory access latency.

 - Add support for using the 'linux,pci-domain' device tree property for PC=
I domain
   assignment.

 - Many other small features and fixes.

Thanks to: Alexey Kardashevskiy, Andy Shevchenko, Arnd Bergmann, Athira Raj=
eev, Bagas
Sanjaya, Christophe Leroy, Erhard Furtner, Fabiano Rosas, Greg Kroah-Hartma=
n, Greg Kurz,
Haowen Bai, Hari Bathini, Jason A. Donenfeld, Jason Wang, Jiang Jian, Joel =
Stanley, Juerg
Haefliger, Kajol Jain, Kees Cook, Laurent Dufour, Madhavan Srinivasan, Masa=
hiro Yamada,
Maxime Bizon, Miaoqian Lin, Murilo Opsfelder Ara=C3=BAjo, Nathan Lynch, Nav=
een N. Rao, Nayna
Jain, Nicholas Piggin, Ning Qiang, Pali Roh=C3=A1r, Petr Mladek, Rashmica G=
upta, Sachin Sant,
Scott Cheloha, Segher Boessenkool, Stephen Rothwell, Uwe Kleine-K=C3=B6nig,=
 Wolfram Sang, Xiu
Jianfeng, Zhouyi Zhou.

- ------------------------------------------------------------------
Alexey Kardashevskiy (6):
      KVM: PPC: Book3s: Fix warning about xics_rm_h_xirr_x
      KVM: PPC: Do not warn when userspace asked for too big TCE table
      powerpc/pseries/iommu: Print ibm,query-pe-dma-windows parameters
      pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window
      powerpc/ioda/iommu/debugfs: Generate unique debugfs entries
      powerpc/iommu: Fix iommu_table_in_use for a small default DMA window =
case

Andy Shevchenko (3):
      powerpc/52xx: Remove dead code, i.e. mpc52xx_get_xtal_freq()
      powerpc/mpc5xxx: Switch mpc5xxx_get_bus_frequency() to use fwnode
      powerpc/52xx: Get rid of of_node assignment

Athira Rajeev (24):
      powerpc/perf: Optimize clearing the pending PMI and remove WARN_ON fo=
r PMI check in power_pmu_disable
      selftests/powerpc: Add support to fetch "platform" and "base platform=
" from auxv to detect platform.
      selftests/powerpc/pmu: Refactor the platform check and add macros to =
find array size/PVR
      selftests/powerpc/pmu: Add selftest to check branch stack enablement =
will not crash on any platforms
      selftests/powerpc/pmu: Add selftest to check PERF_SAMPLE_REGS_INTR op=
tion will not crash on any platforms
      selftests/powerpc/pmu: Add selftest for checking valid and invalid bh=
rb filter maps
      selftests/powerpc/pmu: Add selftest for mmcr1 pmcxsel/unit/cache fiel=
ds
      selftests/powerpc/pmu: Add support for perf event code tests
      selftests/powerpc/pmu: Add selftest for group constraint check for PM=
C5 and PMC6
      selftests/powerpc/pmu: Add selftest to check PMC5/6 is excluded from =
some constraint checks
      selftests/powerpc/pmu: Add selftest to check constraint for number of=
 counters in use.
      selftests/powerpc/pmu: Add selftest for group constraint check when u=
sing same PMC
      selftests/powerpc/pmu: Add selftest for group constraint check for ra=
dix_scope_qual field
      selftests/powerpc/pmu: Add selftest for group constraint for MMCRA Sa=
mpling Mode field
      selftests/powerpc/pmu: Add selftest for group constraint check MMCRA =
sample bits
      selftests/powerpc/pmu: Add selftest for checking invalid bits in even=
t code
      selftests/powerpc/pmu: Add selftest for reserved bit check for MMCRA =
thresh_ctl field
      selftests/powerpc/pmu: Add selftest for blacklist events check in pow=
er9
      selftests/powerpc/pmu: Add selftest for event alternatives for power9
      selftests/powerpc/pmu: Add selftest for event alternatives for power10
      selftests/powerpc/pmu: Add selftest for PERF_TYPE_HARDWARE events val=
id check
      powerpc/perf: Add support for caps under sysfs in powerpc
      docs: ABI: sysfs-bus-event_source-devices: Document sysfs caps entry =
for PMU
      powerpc/perf: Include caps feature for power10 DD1 version

Bagas Sanjaya (3):
      docs: powerpc: fix indentation warnings
      docs: powerpc: use different label name for elf_hwcaps.rst
      docs: powerpc: add elf_hwcaps to table of contents

Christophe Leroy (44):
      powerpc: Don't include asm/setup.h in asm/machdep.h
      powerpc: Move prom_init() out of asm-prototypes.h
      powerpc/powermac: Remove empty function note_scsi_host()
      powerpc: Include asm/firmware.h in all users of firmware_has_feature()
      powerpc: Don't include asm/ppc_asm.h in other headers
      powerpc/irq: Split irq.c
      powerpc/irq64: Remove get_irq_happened()
      powerpc/irq: Don't open code irq_soft_mask helpers
      powerpc/irq: Replace #ifdefs by IS_ENABLED()
      powerpc/irq: remove inline assembly in hard_irq_disable macro
      powerpc/irq: Increase stack_overflow detection limit when KASAN is en=
abled
      powerpc/irq: Make __do_irq() static
      powerpc/irq: Perform stack_overflow detection after switching to IRQ =
stack
      powerpc/irq: Simplify __do_irq()
      powerpc: Restore CONFIG_DEBUG_INFO in defconfigs
      powerpc/32: Remove the 'nobats' kernel parameter
      powerpc/32: Remove 'noltlbs' kernel parameter
      powerpc/32: Remove __map_without_ltlbs
      powerpc: Remove _PAGE_SAO stub for book3e/64
      powerpc/64e: Rewrite p4d_populate() as a static inline function
      powerpc/ptdump: Fix display of RW pages on FSL_BOOK3E
      powerpc/64e: Fix early TLB miss with KUAP
      powerpc/64e: Remove MMU_FTR_USE_TLBRSRV and MMU_FTR_USE_PAIRED_MAS
      powerpc/64e: Remove unused REGION related macros
      powerpc/64e: Move virtual memory closer to linear memory
      powerpc/64e: Reorganise virtual memory
      powerpc/64e: KASAN Full support for BOOK3E/64
      powerpc/32: Call mmu_mark_initmem_nx() regardless of data block mappi=
ng.
      powerpc/32: Set an IBAT covering up to _einittext during init
      powerpc/32s: Fix boot failure with KASAN + SMP + JUMP_LABEL_FEATURE_C=
HECK_DEBUG
      powerpc: Remove remaining parts of oprofile
      powerpc/probes: Remove ppc_opcode_t
      powerpc/ppc-opcode: Define and use PPC_RAW_TRAP() and PPC_RAW_TW()
      powerpc/ppc-opcode: Define and use PPC_RAW_SETB()
      powerpc/32: Do not allow selection of e5500 or e6500 CPUs on PPC32
      powerpc/32: Don't always pass -mcpu=3Dpowerpc to the compiler
      powerpc/405: Fix build failure with GCC 12 (unrecognized opcode: `wrt=
eei')
      powerpc/44x: Fix build failure with GCC 12 (unrecognized opcode: `wrt=
eei')
      powerpc/64e: Fix build failure with GCC 12 (unrecognized opcode: `wrt=
eei')
      video: fbdev: offb: Include missing linux/platform_device.h
      scsi: cxlflash: Include missing linux/irqdomain.h
      powerpc: Remove asm/prom.h from asm/mpc52xx.h and asm/pci.h
      powerpc: Finally remove unnecessary headers from asm/prom.h
      EDAC/ppc_4xx: Include required of_irq header directly

Fabiano Rosas (7):
      KVM: PPC: Book3S HV: Fix "rm_exit" entry in debugfs timings
      KVM: PPC: Book3S HV: Add a new config for P8 debug timing
      KVM: PPC: Book3S HV: Decouple the debug timing from the P8 entry path
      KVM: PPC: Book3S HV: Expose timing functions to module code
      KVM: PPC: Book3S HV: Provide more detailed timings for P9 entry path
      KVM: PPC: Book3S HV: tracing: Add missing hcall names
      KVM: PPC: Align pt_regs in kvm_vcpu_arch structure

Haowen Bai (1):
      powerpc/papr_scm: use dev_get_drvdata

Hari Bathini (6):
      powerpc/bpf/64: add support for BPF_ATOMIC bitwise operations
      powerpc/bpf/64: add support for atomic fetch operations
      powerpc/bpf/64: Add instructions for atomic_[cmp]xchg
      powerpc/bpf/32: add support for BPF_ATOMIC bitwise operations
      powerpc/bpf/32: Add instructions for atomic_[cmp]xchg
      powerpc/crash: save cpu register data in crash_smp_send_stop()

Jason A. Donenfeld (2):
      powerpc/powernv/kvm: Use darn for H_RANDOM on Power9
      powerpc/powernv: rename remaining rng powernv_ functions to pnv_

Jason Wang (2):
      powerpc/pseries/vas: Fix comment typo
      powerpc/sysdev: Fix comment typo

Jiang Jian (1):
      cxl: drop unexpected word "the" in the comments

Joel Stanley (1):
      powerpc/perf: Give generic PMU a nice name

Juerg Haefliger (4):
      powerpc: Kconfig: Replace tabs with whitespaces
      powerpc: Kconfig.debug: Remove extra empty line
      powerpc/powernv: Kconfig: Replace single quotes
      KVM: PPC: Kconfig: Fix indentation

Kajol Jain (17):
      selftests/powerpc/pmu: Add mask/shift bits for extracting threshold c=
ompare field
      selftests/powerpc/pmu: Add interface test for mmcra_thresh_cmp fields
      selftests/powerpc/pmu: Add support for branch sampling in get_intr_re=
gs function
      selftests/powerpc/pmu: Add interface test for mmcra_ifm field of indi=
rect call type
      selftests/powerpc/pmu: Add interface test for mmcra_ifm field for any=
 branch type
      selftests/powerpc/pmu: Add interface test for mmcra_ifm field for con=
ditional branch type
      selftests/powerpc/pmu: Add interface test for bhrb disable field
      selftests/powerpc/pmu: Add interface test for bhrb disable field for =
non-branch samples
      selftests/powerpc/pmu: Add selftest for group constraint check for MM=
CR0 l2l3_sel bits
      selftests/powerpc/pmu: Add selftest for group constraint check for MM=
CR1 cache bits
      selftests/powerpc/pmu: Add selftest for group constraint check for MM=
CRA thresh_cmp field
      selftests/powerpc/pmu: Add selftest for group constraint for unit and=
 pmc field in p9
      selftests/powerpc/pmu: Add selftest for group constraint check for MM=
CRA thresh_ctl field
      selftests/powerpc/pmu: Add selftest for group constraint check for MM=
CRA thresh_sel field
      selftests/powerpc/pmu: Add test for hardware cache events
      powerpc/kvm: Move pmu code in kvm folder to separate file for power9 =
and later platforms
      powerpc/kvm: Remove comment related to moving PMU code to perf subsys=
tem

Laurent Dufour (5):
      powerpc/64s: Don't read H_BLOCK_REMOVE characteristics in radix mode
      powerpc/mobility: wait for memory transfer to complete
      watchdog: export lockup_detector_reconfigure
      powerpc/watchdog: introduce a NMI watchdog's factor
      powerpc/pseries/mobility: set NMI watchdog factor during an LPM

Madhavan Srinivasan (1):
      powerpc/perf: Update MMCR2 to support event exclude_idle

Masahiro Yamada (1):
      powerpc/purgatory: Omit use of bin2c

Miaoqian Lin (3):
      powerpc/spufs: Fix refcount leak in spufs_init_isolated_loader
      powerpc/xive: Fix refcount leak in xive_get_max_prio
      powerpc/cell/axon_msi: Fix refcount leak in setup_msi_msg_address

Michael Ellerman (28):
      selftests/powerpc: Skip energy_scale_info test on older firmware
      powerpc: Update asm-prototypes.h comment
      selftests/powerpc: Add missing files to .gitignores
      powerpc/64: Drop ppc_inst_as_str()
      Merge branch 'fixes' into next
      Merge branch 'topic/ppc-kvm' into next
      Merge branch 'fixes' into next
      powerpc: Fix all occurences of duplicate words
      selftests/powerpc: Ensure 16-byte stack pointer alignment
      selftests/powerpc/ptrace: Set LOCAL_HDRS
      selftests/powerpc/ptrace: Split CFLAGS better
      selftests/powerpc: Don't save CR by default in asm helpers
      selftests/powerpc: Don't save TOC by default in asm helpers
      selftests/powerpc: Add 32-bit support to asm helpers
      selftests/powerpc/ptrace: Drop unused load_fpr_single_precision()
      selftests/powerpc/ptrace: Convert to load/store doubles
      selftests/powerpc/ptrace: Build the ptrace-gpr test as 32-bit when po=
ssible
      selftests/powerpc/ptrace: Do more of ptrace-gpr in asm
      selftests/powerpc/ptrace: Make child errors more obvious
      selftests/powerpc/ptrace: Use more interesting values
      selftests/powerpc/ptrace: Add peek/poke of FPRs
      EDAC/mpc85xx: Include required of headers directly
      powerpc: Update reviewers
      powerpc/powernv: Avoid crashing if rng is NULL
      Merge branch 'topic/ppc-kvm' into next
      selftests/powerpc: Avoid GCC 12 uninitialised variable warning
      powerpc/pci: Fix PHB numbering when using opal-phbid
      powerpc/64e: Fix kexec build error

Murilo Opsfelder Araujo (2):
      KVM: PPC: Book3S HV: Remove kvmhv_p9_[set,restore]_lpcr declarations
      KVM: PPC: Book3s HV: Remove unused function kvmppc_bad_interrupt

Nayna Jain (1):
      powerpc/pseries: define driver for Platform KeyStore

Nicholas Piggin (6):
      powerpc/vdso: Fix __kernel_sync_dicache sequence with coherent icache
      powerpc: add documentation for HWCAPs
      powerpc/64s: POWER10 nest MMU does not require flush escalation worka=
round
      powerpc/64s: POWER10 nest MMU can upgrade PTE access authority withou=
t TLB flush
      powerpc/64s: Remove spurious fault flushing for NMMU
      powerpc/mce: use early_cpu_to_node() in mce_init()

Ning Qiang (1):
      macintosh/adb: fix oob read in do_adb_query() function

Pali Roh=C3=A1r (11):
      powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers
      powerpc/fsl-pci: Fix Class Code of PCIe Root Port
      powerpc: dts: turris1x.dts: Add CPLD reboot node
      powerpc/pci: Hide pci_device_from_OF_node() for non-powermac code
      powerpc/pci: Make pcibios_make_OF_bus_map() static
      powerpc/pci: Hide pci_create_OF_bus_map() for non-chrp code
      powerpc/pci: Disable filling pci-OF-bus-map for non-chrp/powermac
      powerpc/pci: Add config option for using all 256 PCI buses
      powerpc/85xx: Fix description of MPC85xx and P1/P2 boards options
      powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' a=
nd alias
      powerpc/85xx: P2020: Add law_trgt_if property to PCIe DT nodes

Rashmica Gupta (4):
      powerpc/perf: Use PVR rather than oprofile field to determine CPU ver=
sion
      powerpc: make facility_unavailable_exception 64s
      powerpc/signal: Update comment for clarity
      selftests/powerpc: Fix matrix multiply assist test

Scott Cheloha (4):
      powerpc/pseries: hvcall.h: add H_WATCHDOG opcode, H_NOOP return code
      powerpc/pseries: add FW_FEATURE_WATCHDOG flag
      powerpc/pseries: register pseries-wdt device with platform bus
      watchdog/pseries-wdt: initial support for H_WATCHDOG-based watchdog t=
imers

Uwe Kleine-K=C3=B6nig (4):
      powerpc/52xx: Mark gpt driver as not removable
      powerpc/platforms/83xx/suspend: Reorder to get rid of a forward decla=
ration
      powerpc/platforms/83xx/suspend: Prevent unloading the driver
      powerpc/platforms/83xx/suspend: Remove write-only global variable

Xiu Jianfeng (2):
      powerpc: Move system_call_exception() to syscall.c
      powerpc: add support for syscall stack randomization

Zhouyi Zhou (1):
      powerpc/64: Init jump labels before parse_early_param()


 Documentation/ABI/testing/sysfs-bus-event_source-devices-caps             =
                       |  18 +
 Documentation/admin-guide/kernel-parameters.txt                           =
                       |   6 -
 Documentation/admin-guide/sysctl/kernel.rst                               =
                       |  12 +
 Documentation/powerpc/elf_hwcaps.rst                                      =
                       | 231 +++++++++
 Documentation/powerpc/index.rst                                           =
                       |   1 +
 Documentation/watchdog/watchdog-parameters.rst                            =
                       |  12 +
 MAINTAINERS                                                               =
                       |   4 +-
 arch/powerpc/Kconfig                                                      =
                       |  19 +-
 arch/powerpc/Kconfig.debug                                                =
                       |   4 +-
 arch/powerpc/Makefile                                                     =
                       |  34 +-
 arch/powerpc/boot/dts/fsl/p2020si-post.dtsi                               =
                       |   3 +
 arch/powerpc/boot/dts/turris1x.dts                                        =
                       | 483 +++++++++++++++++++
 arch/powerpc/configs/44x/akebono_defconfig                                =
                       |   2 +-
 arch/powerpc/configs/44x/currituck_defconfig                              =
                       |   2 +-
 arch/powerpc/configs/44x/fsp2_defconfig                                   =
                       |   2 +-
 arch/powerpc/configs/44x/iss476-smp_defconfig                             =
                       |   2 +-
 arch/powerpc/configs/44x/warp_defconfig                                   =
                       |   2 +-
 arch/powerpc/configs/52xx/lite5200b_defconfig                             =
                       |   2 +-
 arch/powerpc/configs/52xx/motionpro_defconfig                             =
                       |   2 +-
 arch/powerpc/configs/52xx/tqm5200_defconfig                               =
                       |   2 +-
 arch/powerpc/configs/adder875_defconfig                                   =
                       |   2 +-
 arch/powerpc/configs/ep8248e_defconfig                                    =
                       |   2 +-
 arch/powerpc/configs/ep88xc_defconfig                                     =
                       |   2 +-
 arch/powerpc/configs/fsl-emb-nonhw.config                                 =
                       |   2 +-
 arch/powerpc/configs/mgcoge_defconfig                                     =
                       |   2 +-
 arch/powerpc/configs/mpc5200_defconfig                                    =
                       |   2 +-
 arch/powerpc/configs/mpc8272_ads_defconfig                                =
                       |   2 +-
 arch/powerpc/configs/mpc885_ads_defconfig                                 =
                       |   2 +-
 arch/powerpc/configs/ppc6xx_defconfig                                     =
                       |   2 +-
 arch/powerpc/configs/pq2fads_defconfig                                    =
                       |   2 +-
 arch/powerpc/configs/ps3_defconfig                                        =
                       |   2 +-
 arch/powerpc/configs/tqm8xx_defconfig                                     =
                       |   2 +-
 arch/powerpc/include/asm/archrandom.h                                     =
                       |   7 +-
 arch/powerpc/include/asm/asm-prototypes.h                                 =
                       |  11 +-
 arch/powerpc/include/asm/barrier.h                                        =
                       |   2 +
 arch/powerpc/include/asm/book3s/64/hugetlb.h                              =
                       |   3 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h                             =
                       |  26 +-
 arch/powerpc/include/asm/cputable.h                                       =
                       |   3 -
 arch/powerpc/include/asm/cputime.h                                        =
                       |   1 +
 arch/powerpc/include/asm/firmware.h                                       =
                       |   3 +-
 arch/powerpc/include/asm/hvcall.h                                         =
                       |  23 +-
 arch/powerpc/include/asm/hw_irq.h                                         =
                       |  77 +--
 arch/powerpc/include/asm/inst.h                                           =
                       |  19 -
 arch/powerpc/include/asm/interrupt.h                                      =
                       |   1 +
 arch/powerpc/include/asm/io.h                                             =
                       |   1 -
 arch/powerpc/include/asm/irq.h                                            =
                       |   1 -
 arch/powerpc/include/asm/kasan.h                                          =
                       |  13 +-
 arch/powerpc/include/asm/kexec.h                                          =
                       |   1 +
 arch/powerpc/include/asm/kprobes.h                                        =
                       |   2 +-
 arch/powerpc/include/asm/kvm_book3s.h                                     =
                       |   3 -
 arch/powerpc/include/asm/kvm_host.h                                       =
                       |  16 +-
 arch/powerpc/include/asm/machdep.h                                        =
                       |   2 -
 arch/powerpc/include/asm/mman.h                                           =
                       |   1 +
 arch/powerpc/include/asm/mmu.h                                            =
                       |  12 -
 arch/powerpc/include/asm/mpc52xx.h                                        =
                       |   4 +-
 arch/powerpc/include/asm/mpc5xxx.h                                        =
                       |   9 +-
 arch/powerpc/include/asm/nmi.h                                            =
                       |   2 +
 arch/powerpc/include/asm/nohash/64/pgalloc.h                              =
                       |   5 +-
 arch/powerpc/include/asm/nohash/64/pgtable.h                              =
                       |  23 +-
 arch/powerpc/include/asm/nohash/pgtable.h                                 =
                       |   2 +-
 arch/powerpc/include/asm/pci-bridge.h                                     =
                       |   4 +
 arch/powerpc/include/asm/pci.h                                            =
                       |   1 -
 arch/powerpc/include/asm/plpar_wrappers.h                                 =
                       |   5 +-
 arch/powerpc/include/asm/ppc-opcode.h                                     =
                       |   4 +-
 arch/powerpc/include/asm/probes.h                                         =
                       |   4 +-
 arch/powerpc/include/asm/prom.h                                           =
                       |  13 +-
 arch/powerpc/include/asm/setup.h                                          =
                       |   6 +-
 arch/powerpc/include/asm/synch.h                                          =
                       |   5 +-
 arch/powerpc/include/asm/uaccess.h                                        =
                       |   1 -
 arch/powerpc/include/asm/uprobes.h                                        =
                       |   2 +-
 arch/powerpc/include/asm/word-at-a-time.h                                 =
                       |   2 +-
 arch/powerpc/kernel/Makefile                                              =
                       |  11 +-
 arch/powerpc/kernel/asm-offsets.c                                         =
                       |   2 +-
 arch/powerpc/kernel/btext.c                                               =
                       |   2 +-
 arch/powerpc/kernel/cputable.c                                            =
                       |  67 +--
 arch/powerpc/kernel/dawr.c                                                =
                       |   1 +
 arch/powerpc/kernel/dt_cpu_ftrs.c                                         =
                       |   4 -
 arch/powerpc/kernel/eeh_driver.c                                          =
                       |   2 +-
 arch/powerpc/kernel/exceptions-64s.S                                      =
                       |   2 +-
 arch/powerpc/kernel/head_64.S                                             =
                       |   3 +
 arch/powerpc/kernel/head_book3s_32.S                                      =
                       |   4 +-
 arch/powerpc/kernel/interrupt.c                                           =
                       | 161 -------
 arch/powerpc/kernel/iommu.c                                               =
                       |   5 +
 arch/powerpc/kernel/irq.c                                                 =
                       | 496 ++------------------
 arch/powerpc/kernel/irq_64.c                                              =
                       | 466 ++++++++++++++++++
 arch/powerpc/kernel/kprobes.c                                             =
                       |   2 +-
 arch/powerpc/kernel/mce.c                                                 =
                       |   2 +-
 arch/powerpc/kernel/pci-common.c                                          =
                       |  32 +-
 arch/powerpc/kernel/pci_32.c                                              =
                       |  27 +-
 arch/powerpc/kernel/pci_64.c                                              =
                       |   2 +
 arch/powerpc/kernel/pci_dn.c                                              =
                       |   2 +-
 arch/powerpc/kernel/prom.c                                                =
                       |  10 +-
 arch/powerpc/kernel/prom_init.c                                           =
                       |   2 +-
 arch/powerpc/kernel/ptrace/ptrace-vsx.c                                   =
                       |   2 +-
 arch/powerpc/kernel/setup_64.c                                            =
                       |   1 -
 arch/powerpc/kernel/signal_64.c                                           =
                       |   9 +-
 arch/powerpc/kernel/smp.c                                                 =
                       |  29 +-
 arch/powerpc/kernel/syscall.c                                             =
                       | 190 ++++++++
 arch/powerpc/kernel/trace/ftrace.c                                        =
                       |  30 +-
 arch/powerpc/kernel/traps.c                                               =
                       |   2 +-
 arch/powerpc/kernel/vdso/cacheflush.S                                     =
                       |   1 +
 arch/powerpc/kernel/watchdog.c                                            =
                       |  23 +-
 arch/powerpc/kexec/core.c                                                 =
                       |   2 +
 arch/powerpc/kexec/crash.c                                                =
                       |  77 +--
 arch/powerpc/kexec/file_load_64.c                                         =
                       |  55 +++
 arch/powerpc/kvm/Kconfig                                                  =
                       |  21 +-
 arch/powerpc/kvm/Makefile                                                 =
                       |   1 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c                                    =
                       |   1 +
 arch/powerpc/kvm/book3s_64_vio.c                                          =
                       |   2 +-
 arch/powerpc/kvm/book3s_hv.c                                              =
                       |  28 +-
 arch/powerpc/kvm/book3s_hv.h                                              =
                       |  10 +
 arch/powerpc/kvm/book3s_hv_builtin.c                                      =
                       |  25 +-
 arch/powerpc/kvm/book3s_hv_nested.c                                       =
                       |   1 +
 arch/powerpc/kvm/book3s_hv_p9_entry.c                                     =
                       | 257 +---------
 arch/powerpc/kvm/book3s_hv_p9_perf.c                                      =
                       | 219 +++++++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                                   =
                       |  24 +-
 arch/powerpc/kvm/book3s_xics.h                                            =
                       |   1 +
 arch/powerpc/kvm/powerpc.c                                                =
                       |   1 +
 arch/powerpc/kvm/trace_hv.h                                               =
                       |  21 +-
 arch/powerpc/lib/test_emulate_step.c                                      =
                       |  15 +-
 arch/powerpc/mm/book3s32/mmu.c                                            =
                       |  12 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c                                   =
                       |   1 +
 arch/powerpc/mm/book3s64/hash_utils.c                                     =
                       |   2 +-
 arch/powerpc/mm/book3s64/pkeys.c                                          =
                       |   1 +
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c                              =
                       |  10 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c                                  =
                       |  35 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                                      =
                       |  14 +-
 arch/powerpc/mm/hugetlbpage.c                                             =
                       |   1 +
 arch/powerpc/mm/init_32.c                                                 =
                       |  37 --
 arch/powerpc/mm/kasan/Makefile                                            =
                       |   1 +
 arch/powerpc/mm/kasan/init_32.c                                           =
                       |   2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c                                    =
                       | 133 ++++++
 arch/powerpc/mm/kasan/init_book3s_64.c                                    =
                       |   2 +
 arch/powerpc/mm/mem.c                                                     =
                       |   1 +
 arch/powerpc/mm/mmu_decl.h                                                =
                       |   1 -
 arch/powerpc/mm/nohash/40x.c                                              =
                       |   9 +-
 arch/powerpc/mm/nohash/8xx.c                                              =
                       |  13 +-
 arch/powerpc/mm/nohash/book3e_hugetlbpage.c                               =
                       |  30 +-
 arch/powerpc/mm/nohash/tlb_low.S                                          =
                       |   4 +-
 arch/powerpc/mm/nohash/tlb_low_64e.S                                      =
                       | 147 ++----
 arch/powerpc/mm/pgtable_32.c                                              =
                       |   6 +-
 arch/powerpc/mm/ptdump/shared.c                                           =
                       |   6 +-
 arch/powerpc/net/bpf_jit_comp32.c                                         =
                       |  72 ++-
 arch/powerpc/net/bpf_jit_comp64.c                                         =
                       |  96 ++--
 arch/powerpc/perf/core-book3s.c                                           =
                       |  66 ++-
 arch/powerpc/perf/e500-pmu.c                                              =
                       |   9 +-
 arch/powerpc/perf/e6500-pmu.c                                             =
                       |   5 +-
 arch/powerpc/perf/generic-compat-pmu.c                                    =
                       |  12 +-
 arch/powerpc/perf/hv-24x7.c                                               =
                       |   6 +-
 arch/powerpc/perf/isa207-common.c                                         =
                       |   3 +
 arch/powerpc/perf/isa207-common.h                                         =
                       |   1 +
 arch/powerpc/perf/mpc7450-pmu.c                                           =
                       |   5 +-
 arch/powerpc/perf/power10-pmu.c                                           =
                       |  17 +-
 arch/powerpc/perf/power5+-pmu.c                                           =
                       |   6 +-
 arch/powerpc/perf/power5-pmu.c                                            =
                       |   5 +-
 arch/powerpc/perf/power6-pmu.c                                            =
                       |   5 +-
 arch/powerpc/perf/power7-pmu.c                                            =
                       |   7 +-
 arch/powerpc/perf/power8-pmu.c                                            =
                       |  15 +-
 arch/powerpc/perf/power9-pmu.c                                            =
                       |  14 +-
 arch/powerpc/perf/ppc970-pmu.c                                            =
                       |   7 +-
 arch/powerpc/platforms/4xx/cpm.c                                          =
                       |   2 +-
 arch/powerpc/platforms/52xx/mpc52xx_common.c                              =
                       |  37 --
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c                                 =
                       |  27 +-
 arch/powerpc/platforms/83xx/misc.c                                        =
                       |  14 +-
 arch/powerpc/platforms/83xx/suspend.c                                     =
                       |  52 +-
 arch/powerpc/platforms/85xx/Kconfig                                       =
                       |  18 +-
 arch/powerpc/platforms/Kconfig.cputype                                    =
                       |  54 ++-
 arch/powerpc/platforms/cell/axon_msi.c                                    =
                       |   1 +
 arch/powerpc/platforms/cell/spufs/inode.c                                 =
                       |   1 +
 arch/powerpc/platforms/cell/spufs/spufs.h                                 =
                       |   2 +-
 arch/powerpc/platforms/powermac/setup.c                                   =
                       |   7 -
 arch/powerpc/platforms/powernv/Kconfig                                    =
                       |   2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                                 =
                       |   2 +
 arch/powerpc/platforms/powernv/rng.c                                      =
                       |  66 +--
 arch/powerpc/platforms/powernv/vas-fault.c                                =
                       |   2 +-
 arch/powerpc/platforms/ps3/Kconfig                                        =
                       |   2 +-
 arch/powerpc/platforms/pseries/Kconfig                                    =
                       |  13 +
 arch/powerpc/platforms/pseries/Makefile                                   =
                       |   1 +
 arch/powerpc/platforms/pseries/eeh_pseries.c                              =
                       |   2 +-
 arch/powerpc/platforms/pseries/firmware.c                                 =
                       |   1 +
 arch/powerpc/platforms/pseries/iommu.c                                    =
                       |  97 ++--
 arch/powerpc/platforms/pseries/kexec.c                                    =
                       |   2 +-
 arch/powerpc/platforms/pseries/lpar.c                                     =
                       |   2 +-
 arch/powerpc/platforms/pseries/mobility.c                                 =
                       |  91 +++-
 arch/powerpc/platforms/pseries/papr_platform_attributes.c                 =
                       |   1 +
 arch/powerpc/platforms/pseries/papr_scm.c                                 =
                       |   4 +-
 arch/powerpc/platforms/pseries/plpks.c                                    =
                       | 460 ++++++++++++++++++
 arch/powerpc/platforms/pseries/plpks.h                                    =
                       |  71 +++
 arch/powerpc/platforms/pseries/setup.c                                    =
                       |  19 +-
 arch/powerpc/platforms/pseries/vas.c                                      =
                       |   3 +-
 arch/powerpc/purgatory/.gitignore                                         =
                       |   1 -
 arch/powerpc/purgatory/Makefile                                           =
                       |   8 +-
 arch/powerpc/purgatory/kexec-purgatory.S                                  =
                       |  14 +
 arch/powerpc/sysdev/cpm2.c                                                =
                       |   2 +-
 arch/powerpc/sysdev/fsl_pci.c                                             =
                       |   9 +
 arch/powerpc/sysdev/fsl_pci.h                                             =
                       |   1 +
 arch/powerpc/sysdev/fsl_rio.c                                             =
                       |  12 +-
 arch/powerpc/sysdev/mpc5xxx_clocks.c                                      =
                       |  41 +-
 arch/powerpc/sysdev/of_rtc.c                                              =
                       |   2 +
 arch/powerpc/sysdev/xive/spapr.c                                          =
                       |   1 +
 arch/powerpc/xmon/xmon.c                                                  =
                       |   4 +-
 drivers/ata/pata_mpc52xx.c                                                =
                       |   2 +-
 drivers/char/hw_random/powernv-rng.c                                      =
                       |   2 +-
 drivers/edac/mpc85xx_edac.c                                               =
                       |   2 +
 drivers/edac/ppc4xx_edac.c                                                =
                       |   1 +
 drivers/i2c/busses/i2c-mpc.c                                              =
                       |   7 +-
 drivers/macintosh/adb.c                                                   =
                       |   2 +-
 drivers/net/can/mscan/mpc5xxx_can.c                                       =
                       |   2 +-
 drivers/net/ethernet/freescale/fec_mpc52xx.c                              =
                       |   2 +-
 drivers/net/ethernet/freescale/fec_mpc52xx_phy.c                          =
                       |   3 +-
 drivers/net/ethernet/freescale/fs_enet/mii-fec.c                          =
                       |   4 +-
 drivers/scsi/cxlflash/ocxl_hw.c                                           =
                       |   1 +
 drivers/scsi/mesh.c                                                       =
                       |   7 +-
 drivers/spi/spi-mpc52xx.c                                                 =
                       |   2 +-
 drivers/tty/serial/mpc52xx_uart.c                                         =
                       |   4 +-
 drivers/video/fbdev/offb.c                                                =
                       |   1 +
 drivers/watchdog/Kconfig                                                  =
                       |   8 +
 drivers/watchdog/Makefile                                                 =
                       |   1 +
 drivers/watchdog/pseries-wdt.c                                            =
                       | 239 ++++++++++
 include/linux/nmi.h                                                       =
                       |   2 +
 kernel/watchdog.c                                                         =
                       |  21 +-
 scripts/remove-stale-files                                                =
                       |   2 +
 tools/testing/selftests/powerpc/include/basic_asm.h                       =
                       |  63 ++-
 tools/testing/selftests/powerpc/include/reg.h                             =
                       |  73 +--
 tools/testing/selftests/powerpc/include/utils.h                           =
                       |  10 +
 tools/testing/selftests/powerpc/lib/reg.S                                 =
                       | 107 ++---
 tools/testing/selftests/powerpc/math/.gitignore                           =
                       |   1 +
 tools/testing/selftests/powerpc/math/mma.S                                =
                       |   3 +
 tools/testing/selftests/powerpc/mce/.gitignore                            =
                       |   1 +
 tools/testing/selftests/powerpc/papr_attributes/attr_test.c               =
                       |  30 +-
 tools/testing/selftests/powerpc/pmu/Makefile                              =
                       |  11 +-
 tools/testing/selftests/powerpc/pmu/branch_loops.S                        =
                       |  28 ++
 tools/testing/selftests/powerpc/pmu/ebb/.gitignore                        =
                       |   1 +
 tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c          =
                       |   1 +
 tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile             =
                       |  15 +
 tools/testing/selftests/powerpc/pmu/event_code_tests/blacklisted_events_te=
st.c                   | 132 ++++++
 tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_te=
sts_p10.c              | 109 +++++
 tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_te=
sts_p9.c               | 116 +++++
 tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_=
test.c                 | 130 +++++
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_cach=
e_test.c               |  60 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3=
_sel_test.c            |  64 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_mmcr=
a_sample_test.c        |  54 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc5=
6_test.c               |  63 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc_=
count_test.c           |  70 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_radi=
x_scope_qual_test.c    |  56 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_repe=
at_test.c              |  56 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thre=
sh_cmp_test.c          |  96 ++++
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thre=
sh_ctl_test.c          |  64 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thre=
sh_sel_test.c          |  63 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit=
_test.c                |  74 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_pmc56_exclude_c=
onstraints_test.c      |  64 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/hw_cache_event_type_t=
est.c                  |  88 ++++
 tools/testing/selftests/powerpc/pmu/event_code_tests/invalid_event_code_te=
st.c                   |  67 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_s=
ample_elig_mode_test.c |  77 +++
 tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_t=
hresh_ctl_test.c       |  44 ++
 tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile               =
                       |   7 +-
 tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c =
                       | 105 +++++
 tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_no_crash_wo_pmu_te=
st.c                   |  59 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/intr_regs_no_crash_wo_p=
mu_test.c              |  57 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c                 =
                       | 135 +++++-
 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h                 =
                       |   9 +-
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_te=
st.c                   |  77 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_any_test.c  =
                       |  65 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c =
                       |  69 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_b=
ranch_test.c           |  64 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test=
.c                     |  66 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_tes=
t.c                    |  69 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_cmp_test.c=
                       |  74 +++
 tools/testing/selftests/powerpc/ptrace/Makefile                           =
                       |  40 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-gpr.S                       =
                       |  52 ++
 tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c                       =
                       | 125 +++--
 tools/testing/selftests/powerpc/ptrace/ptrace-gpr.h                       =
                       |  14 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c                    =
                       |  18 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c                =
                       |  20 +-
 tools/testing/selftests/powerpc/ptrace/ptrace.h                           =
                       |  79 +++-
 tools/testing/selftests/powerpc/security/.gitignore                       =
                       |   1 +
 276 files changed, 6805 insertions(+), 2116 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-event_source-device=
s-caps
 create mode 100644 Documentation/powerpc/elf_hwcaps.rst
 create mode 100644 arch/powerpc/boot/dts/turris1x.dts
 create mode 100644 arch/powerpc/kernel/irq_64.c
 create mode 100644 arch/powerpc/kernel/syscall.c
 create mode 100644 arch/powerpc/kvm/book3s_hv_p9_perf.c
 create mode 100644 arch/powerpc/mm/kasan/init_book3e_64.c
 create mode 100644 arch/powerpc/platforms/pseries/plpks.c
 create mode 100644 arch/powerpc/platforms/pseries/plpks.h
 create mode 100644 arch/powerpc/purgatory/kexec-purgatory.S
 create mode 100644 drivers/watchdog/pseries-wdt.c
 create mode 100644 tools/testing/selftests/powerpc/mce/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/pmu/branch_loops.S
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/Ma=
kefile
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/bl=
acklisted_events_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/ev=
ent_alternatives_tests_p10.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/ev=
ent_alternatives_tests_p9.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/ge=
neric_events_valid_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/gr=
oup_constraint_cache_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/gr=
oup_constraint_l2l3_sel_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/gr=
oup_constraint_mmcra_sample_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/gr=
oup_constraint_pmc56_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/gr=
oup_constraint_pmc_count_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/gr=
oup_constraint_radix_scope_qual_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/gr=
oup_constraint_repeat_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/gr=
oup_constraint_thresh_cmp_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/gr=
oup_constraint_thresh_ctl_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/gr=
oup_constraint_thresh_sel_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/gr=
oup_constraint_unit_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/gr=
oup_pmc56_exclude_constraints_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/hw=
_cache_event_type_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/in=
valid_event_code_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/re=
served_bits_mmcra_sample_elig_mode_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/re=
served_bits_mmcra_thresh_ctl_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb=
_filter_map_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb=
_no_crash_wo_pmu_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/intr=
_regs_no_crash_wo_pmu_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
1_sel_unit_cache_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
a_bhrb_any_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
a_bhrb_cond_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
a_bhrb_disable_no_branch_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
a_bhrb_disable_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
a_bhrb_ind_call_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
a_thresh_cmp_test.c
 create mode 100644 tools/testing/selftests/powerpc/ptrace/ptrace-gpr.S
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmLuDLwACgkQUevqPMjh
pYCvWhAAn2jIQq0s/YRXDGT6pttuLfsdIsxR8/+4g33xGCMrclIFoR8vr0QRVY41
2lzRQBpzNaFxI3wgj2MpaBKtjL2P0I7ZtRscLIAyl4cyW7b+oKInUye2AOKWTfwr
S7Ub4XLGwPNQ070wSaY04qq7h9wBfL2yt1rPMPR/gg57KTxf08j1mVhdRi9Y51zs
9eY/CEmhOIjJ7FSheneoeY08XR1Ct8JwqGaErvKurFcoOJVtVHaxsYcTJPliZr6C
ZWsmjCtbDuriB7dbEZw5mADzITa1qJ1qyx9I6N+j+/rkc/KD4QIFCnQmSmqk5KqA
FfdnFHix8DwkwaUQoOJGzwGKztIZWHBgfbGiPuOrvYkaVjN1lviqJAepf2j09/mR
zv/L0DGxezuNgeG4L19S5RU465i3cbd5xjTOHQmYkc17cQsQwMQiQznakzwEt+p5
pHsoSqc+pN5+lfWwJes2qji5rdF4LteRHVsFCrgGKF0u8gsQVLmZMKmcunryY9K8
22/n624xa6m7a14/a1SDR7kCYvGrhhfgh3wHp92mPY6FrapGCjTSAgZRHQeyol2T
wVg0x2rxTgtMMmyJi1zvDEA1iWUjCoNv4q2M06sO75St3CM/2MAibucxH7yU0fVC
FzjnkPGeTEF6bJPupFnzGejS+mtTQmULh0rtj2J4qOT5Xq++KVo=3D
=3DO9OK
-----END PGP SIGNATURE-----
