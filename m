Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 754356F1467
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 11:45:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q774X2xb6z3fQl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 19:45:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dbfyqRXw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q773d1GM5z30NN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Apr 2023 19:44:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dbfyqRXw;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q773S08dWz4x1N;
	Fri, 28 Apr 2023 19:44:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1682675049;
	bh=SyJR9xejg+hVjZOYtmRvM9o8w8bBIeGMxOVQZoaqO9c=;
	h=From:To:Cc:Subject:Date:From;
	b=dbfyqRXwJ43OgDC3xwkpR4fS5A4ov053q/B3NdjZkGBVkMhgBInTFWwjUR+Hp6VSY
	 uvK8G3gVKPsSLM5+Bc3NzPhF18BNGmw5AzDlEnpZg/mjZhlO336RVZo1cMkMF1BR6k
	 G7ebiC1z0QcbXUGOXJs0tqStpJaClpQuJokZ+eaUBr4D7R44X2v+BUStS96knsbzvr
	 ZWfRUHLNnIzpQzKMg4PKTMm++ejFZyeVYu+peOGnTbKP77f1lcG3LZ4XdSUboeC68W
	 cjjrAPpb+VHz4kfPptWlrUcLehgwBJgp3ZW/p+IS4N2Flp7OEK9zY6L9r4GdlXlGC5
	 Y8nhdnYPMxdTQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.4-1 tag
Date: Fri, 28 Apr 2023 19:44:02 +1000
Message-ID: <87fs8k734t.fsf@mail.concordia>
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
Cc: arkamar@atlas.cz, aik@ozlabs.ru, paul.gortmaker@windriver.com, bgray@linux.ibm.com, ira.weiny@intel.com, robh@kernel.org, mikey@neuling.org, windhl@126.com, tpearson@raptorengineering.com, nicholas@linux.ibm.com, joel@jms.id.au, liubo03@inspur.com, kconsul@linux.vnet.ibm.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, nathan@kernel.org, alex.williamson@redhat.com, pali@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, mcgrof@kernel.org, nysal@linux.ibm.com, seanjc@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 6.4.

A pretty small batch, but a couple of conflicts.=20

The first is in drivers/gpu/drm/amd/display/Kconfig. The correct resolution=
 is:

      select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNE=
L_MODE_NEON && !CC_IS_CLANG))

The second is in our defconfigs, where e485f3a6eae0 ("ixgb: Remove ixgb
driver") removed CONFIG_IXGB which conflicts with our updates, in particula=
r in
powernv_defconfig where we added CONFIG_IGB=3Dy.

cheers

Notable out of area changes:
  drivers/cpuidle/cpuidle-pseries.c       # 88990745c934 cpuidle: pseries: =
Mark ->enter() functions as __cpuidle
  drivers/gpu/drm/amd/display/Kconfig     # 78f0929884d4 powerpc/64: Always=
 build with 128-bit long double
  drivers/vfio/vfio_iommu_spapr_tce.c     # a940904443e4 powerpc/iommu: Add=
 iommu_ops to report capabilities and allow blocking domains

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.4-1

for you to fetch changes up to 169f8997968ab620d750d9a45e15c5288d498356:

  powerpc/64s: Disable pcrel code model on Clang (2023-04-26 16:21:33 +1000)

- - ------------------------------------------------------------------
powerpc updates for 6.4

 - Add support for building the kernel using PC-relative addressing on Powe=
r10.

 - Allow HV KVM guests on Power10 to use prefixed instructions.

 - Unify support for the P2020 CPU (85xx) into a single machine description.

 - Always build the 64-bit kernel with 128-bit long double.

 - Drop support for several obsolete 2000's era development boards as
   identified by Paul Gortmaker.

 - A series fixing VFIO on Power since some generic changes.

 - Various other small features and fixes.

Thanks to: Alexey Kardashevskiy, Andrew Donnellan, Benjamin Gray, Bo Liu,
Christophe Leroy, Dan Carpenter, David Binderman, Ira Weiny, Joel Stanley,
Kajol Jain, Kautuk Consul, Liang He, Luis Chamberlain, Masahiro Yamada, Mic=
hael
Neuling, Nathan Chancellor, Nathan Lynch, Nicholas Miehlbradt, Nicholas Pig=
gin,
Nick Desaulniers, Nysal Jan K.A, Pali Roh=C3=A1r, Paul Gortmaker, Paul Mack=
erras,
Petr Van=C4=9Bk, Randy Dunlap, Rob Herring, Sachin Sant, Sean Christopherso=
n, Segher
Boessenkool, Timothy Pearson.

- - ------------------------------------------------------------------
Alexey Kardashevskiy (3):
      powerpc/iommu: Add "borrowing" iommu_table_group_ops
      powerpc/pci_64: Init pcibios subsys a bit later
      powerpc/iommu: Add iommu_ops to report capabilities and allow blockin=
g domains

Andrew Donnellan (1):
      powerpc/pseries: Add FW_FEATURE_PLPKS feature flag

Benjamin Gray (10):
      selftests/powerpc: Use CLEAN macro to fix make warning
      selftests/powerpc: Pass make context to children
      selftests/powerpc: Make dd output quiet
      selftests/powerpc/dscr: Correct typos
      selftests/powerpc: Move bind_to_cpu() to utils.h
      selftests/powerpc: Allow bind_to_cpu() to automatically pick CPU
      selftests/powerpc/dscr: Add lockstep test cases to DSCR explicit tests
      selftests/powerpc/dscr: Improve DSCR explicit random test case
      selftests/powerpc/dscr: Speed up DSCR sysfs tests
      selftests/powerpc/dscr: Restore timeout to DSCR selftests

Bo Liu (1):
      powerpc: Fix a kernel-doc warning

Christophe Leroy (15):
      powerpc/machdep: Make machine name const
      powerpc/machdep: Define 'compatible' property in ppc_md and use it
      powerpc/platforms: Use 'compatible' property for simple cases
      powerpc/47x: Split ppc47x machine in two
      powerpc/gamecube|wii : Use machine_device_initcall()
      powerpc/85xx: Fix function naming for p1023_rdb platform
      powerpc: Make generic_calibrate_decr() the default
      powerpc/perf: Properly detect mpc7450 family
      powerpc/fsl_uli1575: Misc cleanup
      powerpc/85xx: Remove DBG() macro
      powerpc/85xx: mpc85xx_{ds/rdb} compact the call to mpic_alloc()
      powerpc/85xx: mpc85xx_{ds/rdb} replace BUG_ON() by WARN_ON()
      powerpc/85xx: mpc85xx_{ds/rdb} replace prink by pr_xxx macro
      powerpc/85xx: Remove #ifdefs CONFIG_PPC_I8259 in mpc85xx_ds
      powerpc/85xx: Remove #ifdef CONFIG_QUICC_ENGINE in mpc85xx_rdb

Ira Weiny (1):
      powerpc: Remove memcpy_page_flushcache()

Joel Stanley (1):
      powerpc: Remove duplicate SPRN_HSRR definitions

Kajol Jain (1):
      selftests/powerpc/pmu: Fix sample field check in the mmcra_thresh_mar=
ked_sample_test

Kautuk Consul (1):
      KVM: PPC: Book3S HV: kvmppc_hv_entry: remove .global scope

Liang He (1):
      macintosh/windfarm_smu_sat: Add missing of_node_put()

Luis Chamberlain (2):
      powerpc: Simplify sysctl registration for powersave_nap_ctl_table
      powerpc: Simplify sysctl registration for nmi_wd_lpm_factor_ctl_table

Michael Ellerman (46):
      KVM: PPC: BookE: Fix W=3D1 warnings
      Merge branch 'topic/ppc-kvm' into next
      powerpc/64: Always build with 128-bit long double
      powerpc/corenet: Add PPC_QEMU_E500 to corenet configs
      powerpc/irq: Mark check_return_regs_valid() notrace
      powerpc/64: Mark prep_irq_for_idle() __cpuidle
      powerpc/64: Don't call trace_hardirqs_on() in prep_irq_for_idle()
      cpuidle: pseries: Mark ->enter() functions as __cpuidle
      powerpc/pseries: Always inline functions called from cpuidle
      powerpc/Makefile: Don't prefix archhelp commands with "@"
      powerpc/Makefile: Add generated defconfigs to help output
      powerpc/configs/64s: Update defconfig for symbol movement
      powerpc/configs/64s: Drop SPLPAR which is default y
      powerpc/configs/64s: Drop IPV6 which is default y
      powerpc/configs/6s: Drop obsolete crypto ALGs
      powerpc/configs/64s: Enable PAPR_SCM
      powerpc/configs/64s: Add secure boot options to defconfig
      powerpc/configs/64s: Select ARCH_WANT_DEFAULT_BPF_JIT
      powerpc/configs/64s: Enable PREEMPT_VOLUNTARY
      powerpc/configs/64s: Enable AUDIT
      powerpc/configs/64s: Enable common accounting options
      powerpc/configs/64s: Enable NO_HZ_FULL
      powerpc/configs/64s: Enable common CGROUP & related options
      powerpc/configs/64s: Enable CHECKPOINT_RESTORE
      powerpc/configs/64s: Enable ZSWAP & ZRAM
      powerpc/configs/64s: Enable SLAB hardening options
      powerpc/configs/64s: Enable YAMA, LANDLOCK & BPF LSMs
      powerpc/configs/64s: Enable SELINUX
      powerpc/configs/64s: Enable KUNIT and most tests
      powerpc/configs/64s: Enable EMULATED_STATS
      powerpc/configs/64s: Enable DEBUG_VM & other options
      powerpc/configs/64s: Enable SCHEDSTATS
      powerpc/configs/64s: Enable IO_STRICT_DEVMEM
      powerpc/configs/64s: Use SHA512 for module signatures
      powerpc/configs/64s: Drop REISERFS
      powerpc/configs/64s: Enable BLK_DEV_NVME
      powerpc/configs/64s: Enable VLAN support
      powerpc/configs/64s: Enable PSTORE
      powerpc/configs/64s: Enable Device Mapper options
      powerpc/configs: Add IBMVETH=3Dy and IBMVNIC=3Dy to guest configs
      powerpc/configs: Incorporate generic kvm_guest.config into guest conf=
igs
      powerpc/configs: Make pseries_le an alias for ppc64le_guest
      powerpc/configs: Make pseries_defconfig an alias for ppc64le_guest
      powerpc/configs/64s: Use EXT4 to mount EXT2 filesystems
      powerpc/configs/64s: Drop JFS Filesystem
      powerpc/configs/powernv: Add IGB=3Dy

Michael Neuling (1):
      selftests/powerpc: Increase timeout for vsx_signal test

Nathan Chancellor (4):
      powerpc/boot: Only use '-mabi=3Delfv2' with CONFIG_PPC64_BOOT_WRAPPER
      powerpc: Fix use of '-mabi=3Delfv2' with clang
      powerpc: Allow CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 with ld.lld 15+
      powerpc/32: Include thread_info.h in head_booke.h

Nathan Lynch (5):
      powerpc/rtas: ensure 8-byte alignment for struct rtas_args
      powerpc/rtas: use memmove for potentially overlapping buffer copy
      powerpc/rtas: rtas_call_unlocked() kerneldoc
      powerpc/rtas: fix miswording in rtas_function kerneldoc
      powerpc/rtas: lockdep annotations

Nicholas Miehlbradt (1):
      powerpc: Implement arch_within_stack_frames

Nicholas Piggin (20):
      KVM: PPC: Permit SRR1 flags in more injected interrupt types
      KVM: PPC: Book3S HV: Set SRR1[PREFIX] bit on injected interrupts
      powerpc: copy_thread remove unused pkey code
      powerpc: copy_thread make ret_from_fork register setup consistent
      powerpc: use switch frame for ret_from_kernel_thread parameters
      powerpc/64: ret_from_fork avoid restoring regs twice
      powerpc: copy_thread differentiate kthreads and user mode threads
      powerpc: differentiate kthread from user kernel thread start
      powerpc: copy_thread don't set _TIF_RESTOREALL
      powerpc: copy_thread don't set PPR in user interrupt frame regs
      powerpc/boot: Fix crt0.S current address branch form
      powerpc/boot: Fix boot wrapper code generation with CONFIG_POWER10_CPU
      powerpc/64: Move initial base and TOC pointer calculation
      powerpc/64s: Run at the kernel virtual address earlier in boot
      powerpc/64: Add support to build with prefixed instructions
      powerpc: add CFUNC assembly label annotation
      powerpc/64: vmlinux support building with PCREL addresing
      powerpc/64: modules support building with PCREL addresing
      powerpc: Fix merge conflict between pcrel and copy_thread changes
      powerpc/64s: Disable pcrel code model on Clang

Nysal Jan K.A (1):
      powerpc/atomics: Remove unused function

Pali Roh=C3=A1r (14):
      powerpc/85xx: mpc85xx_ds: Simplify mpc85xx_exclude_device() function
      powerpc/fsl_uli1575: Simplify uli_exclude_device() usage
      powerpc/85xx: mpc85xx_ds: Move uli_init() code into its own driver fi=
le
      powerpc/85xx: mpc85xx_rdb: Do not automatically select FSL_ULI1575
      powerpc/fsl_uli1575: Allow to disable FSL_ULI1575 support
      powerpc/86xx: mpc86xx_hpcn: Call uli_init() instead of explicit ppc_m=
d assignment
      powerpc/fsl_uli1575: Mark uli_exclude_device() as static
      powerpc/85xx: p2020: Move all P2020 DS machine descriptions to p2020.c
      powerpc/85xx: p2020: Move all P2020 RDB machine descriptions to p2020=
.c
      powerpc/85xx: mpc85xx_ds: Move i8259 code into own file
      powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
      powerpc/85xx: p2020: Define just one machine description
      powerpc/85xx: p2020: Enable boards by new config option CONFIG_PPC_P2=
020
      powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC" compatible string

Paul Gortmaker (10):
      powerpc: drop MPC834x_MDS platform support
      powerpc: drop MPC836x_MDS platform support
      powerpc: drop MPC837x_MDS platform support
      powerpc: drop MPC832x_MDS platform support
      powerpc: drop HPC II (MPC7448) evaluation platform support.
      powerpc: drop HPC-NET/MPC8641D evaluation platform support
      powerpc: drop HPCD/MPC8610 evaluation platform support
      powerpc: drop MPC8272_ADS platform support
      powerpc: drop PowerQUICC II Family ADS platform support
      powerpc: drop MPC8272-ADS and PowerQUICC II FADS shared code.

Paul Mackerras (3):
      KVM: PPC: Make kvmppc_get_last_inst() produce a ppc_inst_t
      KVM: PPC: Fetch prefixed instructions from the guest
      KVM: PPC: Enable prefixed instructions for HV KVM and disable for PR =
KVM

Petr Van=C4=9Bk (1):
      powerpc/pseries: Add spaces around / operator

Randy Dunlap (4):
      powerpc/mpc512x: fix resource printk format warning
      powerpc/wii: fix resource printk format warnings
      powerpc/sysdev/tsi108: fix resource printk format warnings
      macintosh: via-pmu-led: requires ATA to be set

Rob Herring (8):
      powerpc: Use of_property_present() for testing DT property presence
      powerpc: Use of_property_read_bool() for boolean properties
      macintosh: Use of_property_present() for testing DT property presence
      powerpc/isa-bridge: Remove open coded "ranges" parsing
      powerpc/xics: Use of_address_count()
      powerpc/fsl_rio: Use of_iomap()
      powerpc/usbgecko: Use of_iomap()
      powerpc: Use of_address_to_resource()

Sean Christopherson (1):
      KVM: PPC: booke: Mark three local functions "static"

Timothy Pearson (1):
      powerpc: Add myself to MAINTAINERS for Power VFIO support


 MAINTAINERS                                                               =
           |   5 +
 arch/powerpc/Kconfig                                                      =
           |  20 +-
 arch/powerpc/Makefile                                                     =
           | 105 ++--
 arch/powerpc/boot/Makefile                                                =
           |  16 +-
 arch/powerpc/boot/crt0.S                                                  =
           |   4 +-
 arch/powerpc/boot/cuboot-mpc7448hpc2.c                                    =
           |  43 --
 arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts                                =
           | 394 ---------------
 arch/powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts                            =
           | 337 -------------
 arch/powerpc/boot/dts/mpc7448hpc2.dts                                     =
           | 192 --------
 arch/powerpc/boot/dts/mpc8272ads.dts                                      =
           | 263 ----------
 arch/powerpc/boot/dts/mpc832x_mds.dts                                     =
           | 436 -----------------
 arch/powerpc/boot/dts/mpc834x_mds.dts                                     =
           | 403 ----------------
 arch/powerpc/boot/dts/mpc836x_mds.dts                                     =
           | 481 -------------------
 arch/powerpc/boot/dts/mpc8377_mds.dts                                     =
           | 505 --------------------
 arch/powerpc/boot/dts/mpc8378_mds.dts                                     =
           | 489 -------------------
 arch/powerpc/boot/dts/mpc8379_mds.dts                                     =
           | 455 ------------------
 arch/powerpc/boot/dts/mpc8610_hpcd.dts                                    =
           | 503 -------------------
 arch/powerpc/boot/dts/pq2fads.dts                                         =
           | 243 ----------
 arch/powerpc/boot/dts/turris1x.dts                                        =
           |   2 +-
 arch/powerpc/configs/83xx/mpc832x_mds_defconfig                           =
           |  59 ---
 arch/powerpc/configs/83xx/mpc834x_mds_defconfig                           =
           |  58 ---
 arch/powerpc/configs/83xx/mpc836x_mds_defconfig                           =
           |  64 ---
 arch/powerpc/configs/83xx/mpc837x_mds_defconfig                           =
           |  58 ---
 arch/powerpc/configs/corenet_base.config                                  =
           |   1 +
 arch/powerpc/configs/guest.config                                         =
           |   2 +
 arch/powerpc/configs/kvm_guest.config                                     =
           |   1 +
 arch/powerpc/configs/mpc7448_hpc2_defconfig                               =
           |  54 ---
 arch/powerpc/configs/mpc8272_ads_defconfig                                =
           |  79 ---
 arch/powerpc/configs/mpc83xx_defconfig                                    =
           |   4 -
 arch/powerpc/configs/mpc86xx_base.config                                  =
           |   2 -
 arch/powerpc/configs/powernv_defconfig                                    =
           |   1 +
 arch/powerpc/configs/ppc64_defconfig                                      =
           | 183 +++++--
 arch/powerpc/configs/ppc6xx_defconfig                                     =
           |   8 -
 arch/powerpc/configs/pq2fads_defconfig                                    =
           |  80 ----
 arch/powerpc/include/asm/atomic.h                                         =
           |  53 +-
 arch/powerpc/include/asm/firmware.h                                       =
           |   4 +-
 arch/powerpc/include/asm/idle.h                                           =
           |  12 +-
 arch/powerpc/include/asm/io.h                                             =
           |  37 ++
 arch/powerpc/include/asm/iommu.h                                          =
           |   6 +-
 arch/powerpc/include/asm/kvm_host.h                                       =
           |   4 +-
 arch/powerpc/include/asm/kvm_ppc.h                                        =
           |  64 ++-
 arch/powerpc/include/asm/machdep.h                                        =
           |   3 +-
 arch/powerpc/include/asm/module.h                                         =
           |  10 +-
 arch/powerpc/include/asm/mpc8260.h                                        =
           |   4 -
 arch/powerpc/include/asm/paca.h                                           =
           |   2 +
 arch/powerpc/include/asm/pci-bridge.h                                     =
           |   7 +
 arch/powerpc/include/asm/ppc-opcode.h                                     =
           |   8 +
 arch/powerpc/include/asm/ppc-pci.h                                        =
           |   8 +
 arch/powerpc/include/asm/ppc_asm.h                                        =
           |  32 ++
 arch/powerpc/include/asm/reg.h                                            =
           |   8 +-
 arch/powerpc/include/asm/rtas-types.h                                     =
           |   4 +-
 arch/powerpc/include/asm/sections.h                                       =
           |   5 +
 arch/powerpc/include/asm/thread_info.h                                    =
           |  40 ++
 arch/powerpc/include/asm/uaccess.h                                        =
           |  30 +-
 arch/powerpc/include/uapi/asm/elf.h                                       =
           |   4 +
 arch/powerpc/kernel/asm-offsets.c                                         =
           |   2 +
 arch/powerpc/kernel/btext.c                                               =
           |   2 +-
 arch/powerpc/kernel/entry_32.S                                            =
           |  23 +-
 arch/powerpc/kernel/exceptions-64s.S                                      =
           | 112 ++---
 arch/powerpc/kernel/head_64.S                                             =
           | 133 ++++--
 arch/powerpc/kernel/head_booke.h                                          =
           |   1 +
 arch/powerpc/kernel/idle.c                                                =
           |  10 +-
 arch/powerpc/kernel/interrupt.c                                           =
           |   2 +-
 arch/powerpc/kernel/interrupt_64.S                                        =
           |  56 ++-
 arch/powerpc/kernel/iommu.c                                               =
           | 246 +++++++++-
 arch/powerpc/kernel/irq.c                                                 =
           |   8 +
 arch/powerpc/kernel/irq_64.c                                              =
           |  10 +-
 arch/powerpc/kernel/isa-bridge.c                                          =
           | 166 ++-----
 arch/powerpc/kernel/legacy_serial.c                                       =
           |  10 +-
 arch/powerpc/kernel/misc_64.S                                             =
           |   2 +-
 arch/powerpc/kernel/module_64.c                                           =
           | 377 +++++++++++++--
 arch/powerpc/kernel/paca.c                                                =
           |   2 +
 arch/powerpc/kernel/pci_64.c                                              =
           |   2 +-
 arch/powerpc/kernel/process.c                                             =
           | 126 ++---
 arch/powerpc/kernel/rtas.c                                                =
           |  54 ++-
 arch/powerpc/kernel/setup-common.c                                        =
           |  13 +-
 arch/powerpc/kernel/time.c                                                =
           |   6 +-
 arch/powerpc/kernel/trace/ftrace.c                                        =
           |  50 +-
 arch/powerpc/kernel/vdso/gettimeofday.S                                   =
           |   6 +-
 arch/powerpc/kernel/vector.S                                              =
           |   6 +
 arch/powerpc/kernel/vmlinux.lds.S                                         =
           |   6 +
 arch/powerpc/kvm/book3s.c                                                 =
           |  64 ++-
 arch/powerpc/kvm/book3s_64_mmu_hv.c                                       =
           |  26 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c                                    =
           |  13 +-
 arch/powerpc/kvm/book3s_hv.c                                              =
           |  47 +-
 arch/powerpc/kvm/book3s_hv_nested.c                                       =
           |   9 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                                   =
           |  26 +-
 arch/powerpc/kvm/book3s_paired_singles.c                                  =
           |   4 +-
 arch/powerpc/kvm/book3s_pr.c                                              =
           |  26 +-
 arch/powerpc/kvm/book3s_rmhandlers.S                                      =
           |   1 +
 arch/powerpc/kvm/booke.c                                                  =
           |  30 +-
 arch/powerpc/kvm/booke.h                                                  =
           |   3 +
 arch/powerpc/kvm/bookehv_interrupts.S                                     =
           |   2 +-
 arch/powerpc/kvm/e500_mmu_host.c                                          =
           |   4 +-
 arch/powerpc/kvm/e500mc.c                                                 =
           |   2 +-
 arch/powerpc/kvm/emulate.c                                                =
           |   8 +-
 arch/powerpc/kvm/emulate_loadstore.c                                      =
           |  14 +-
 arch/powerpc/kvm/powerpc.c                                                =
           |   8 +-
 arch/powerpc/lib/copypage_64.S                                            =
           |  10 +
 arch/powerpc/lib/copypage_power7.S                                        =
           |   4 +-
 arch/powerpc/lib/copyuser_power7.S                                        =
           |   8 +-
 arch/powerpc/lib/hweight_64.S                                             =
           |   8 +-
 arch/powerpc/lib/memcmp_64.S                                              =
           |   4 +-
 arch/powerpc/lib/memcpy_power7.S                                          =
           |   6 +-
 arch/powerpc/lib/pmem.c                                                   =
           |   7 -
 arch/powerpc/mm/numa.c                                                    =
           |  21 +-
 arch/powerpc/net/bpf_jit.h                                                =
           |  10 +-
 arch/powerpc/net/bpf_jit_comp64.c                                         =
           |  36 +-
 arch/powerpc/perf/mpc7450-pmu.c                                           =
           |   6 +-
 arch/powerpc/platforms/40x/ppc40x_simple.c                                =
           |   1 -
 arch/powerpc/platforms/44x/canyonlands.c                                  =
           |  10 +-
 arch/powerpc/platforms/44x/ebony.c                                        =
           |   5 +-
 arch/powerpc/platforms/44x/fsp2.c                                         =
           |   1 -
 arch/powerpc/platforms/44x/iss4xx.c                                       =
           |  16 +-
 arch/powerpc/platforms/44x/ppc44x_simple.c                                =
           |   1 -
 arch/powerpc/platforms/44x/ppc476.c                                       =
           |  39 +-
 arch/powerpc/platforms/44x/sam440ep.c                                     =
           |   5 +-
 arch/powerpc/platforms/44x/warp.c                                         =
           |  11 +-
 arch/powerpc/platforms/4xx/pci.c                                          =
           |  18 +-
 arch/powerpc/platforms/512x/clock-commonclk.c                             =
           |   2 +-
 arch/powerpc/platforms/512x/mpc5121_ads.c                                 =
           |   5 +-
 arch/powerpc/platforms/512x/mpc512x_generic.c                             =
           |   1 -
 arch/powerpc/platforms/512x/pdm360ng.c                                    =
           |   5 +-
 arch/powerpc/platforms/52xx/efika.c                                       =
           |   1 -
 arch/powerpc/platforms/52xx/lite5200.c                                    =
           |   1 -
 arch/powerpc/platforms/52xx/lite5200_pm.c                                 =
           |   9 +-
 arch/powerpc/platforms/52xx/media5200.c                                   =
           |  17 +-
 arch/powerpc/platforms/52xx/mpc5200_simple.c                              =
           |   1 -
 arch/powerpc/platforms/52xx/mpc52xx_common.c                              =
           |   4 +-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c                                 =
           |   4 +-
 arch/powerpc/platforms/82xx/Kconfig                                       =
           |  27 --
 arch/powerpc/platforms/82xx/Makefile                                      =
           |   3 -
 arch/powerpc/platforms/82xx/ep8248e.c                                     =
           |  11 +-
 arch/powerpc/platforms/82xx/km82xx.c                                      =
           |  11 +-
 arch/powerpc/platforms/82xx/mpc8272_ads.c                                 =
           | 213 ---------
 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c                              =
           | 172 -------
 arch/powerpc/platforms/82xx/pq2ads.h                                      =
           |  40 --
 arch/powerpc/platforms/82xx/pq2fads.c                                     =
           | 191 --------
 arch/powerpc/platforms/83xx/Kconfig                                       =
           |  32 --
 arch/powerpc/platforms/83xx/Makefile                                      =
           |   4 -
 arch/powerpc/platforms/83xx/asp834x.c                                     =
           |  11 +-
 arch/powerpc/platforms/83xx/km83xx.c                                      =
           |   1 -
 arch/powerpc/platforms/83xx/mpc830x_rdb.c                                 =
           |   1 -
 arch/powerpc/platforms/83xx/mpc831x_rdb.c                                 =
           |   1 -
 arch/powerpc/platforms/83xx/mpc832x_mds.c                                 =
           | 110 -----
 arch/powerpc/platforms/83xx/mpc832x_rdb.c                                 =
           |  11 +-
 arch/powerpc/platforms/83xx/mpc834x_itx.c                                 =
           |  11 +-
 arch/powerpc/platforms/83xx/mpc834x_mds.c                                 =
           | 101 ----
 arch/powerpc/platforms/83xx/mpc836x_mds.c                                 =
           | 210 --------
 arch/powerpc/platforms/83xx/mpc836x_rdk.c                                 =
           |  11 +-
 arch/powerpc/platforms/83xx/mpc837x_mds.c                                 =
           | 103 ----
 arch/powerpc/platforms/83xx/mpc837x_rdb.c                                 =
           |   1 -
 arch/powerpc/platforms/85xx/Kconfig                                       =
           |  23 +-
 arch/powerpc/platforms/85xx/Makefile                                      =
           |   4 +-
 arch/powerpc/platforms/85xx/bsc913x_qds.c                                 =
           |  12 +-
 arch/powerpc/platforms/85xx/bsc913x_rdb.c                                 =
           |  12 +-
 arch/powerpc/platforms/85xx/c293pcie.c                                    =
           |  13 +-
 arch/powerpc/platforms/85xx/corenet_generic.c                             =
           |   1 -
 arch/powerpc/platforms/85xx/ge_imp3a.c                                    =
           |  11 +-
 arch/powerpc/platforms/85xx/ksi8560.c                                     =
           |  11 +-
 arch/powerpc/platforms/85xx/mpc8536_ds.c                                  =
           |  11 +-
 arch/powerpc/platforms/85xx/mpc85xx.h                                     =
           |   6 +
 arch/powerpc/platforms/85xx/mpc85xx_8259.c                                =
           |  64 +++
 arch/powerpc/platforms/85xx/mpc85xx_ads.c                                 =
           |  11 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c                                 =
           |  12 +-
 arch/powerpc/platforms/85xx/mpc85xx_ds.c                                  =
           | 157 +-----
 arch/powerpc/platforms/85xx/mpc85xx_mds.c                                 =
           |  32 +-
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c                                 =
           | 150 +-----
 arch/powerpc/platforms/85xx/mvme2500.c                                    =
           |  11 +-
 arch/powerpc/platforms/85xx/p1010rdb.c                                    =
           |   1 -
 arch/powerpc/platforms/85xx/p1022_ds.c                                    =
           |  11 +-
 arch/powerpc/platforms/85xx/p1022_rdk.c                                   =
           |  11 +-
 arch/powerpc/platforms/85xx/p1023_rdb.c                                   =
           |  17 +-
 arch/powerpc/platforms/85xx/p2020.c                                       =
           |  81 ++++
 arch/powerpc/platforms/85xx/ppa8548.c                                     =
           |  11 +-
 arch/powerpc/platforms/85xx/qemu_e500.c                                   =
           |  11 +-
 arch/powerpc/platforms/85xx/socrates.c                                    =
           |  14 +-
 arch/powerpc/platforms/85xx/stx_gp3.c                                     =
           |  11 +-
 arch/powerpc/platforms/85xx/tqm85xx.c                                     =
           |   1 -
 arch/powerpc/platforms/85xx/twr_p102x.c                                   =
           |   8 +-
 arch/powerpc/platforms/85xx/xes_mpc85xx.c                                 =
           |  27 +-
 arch/powerpc/platforms/86xx/Kconfig                                       =
           |  20 +-
 arch/powerpc/platforms/86xx/Makefile                                      =
           |   2 -
 arch/powerpc/platforms/86xx/gef_ppc9a.c                                   =
           |  19 +-
 arch/powerpc/platforms/86xx/gef_sbc310.c                                  =
           |  19 +-
 arch/powerpc/platforms/86xx/gef_sbc610.c                                  =
           |  19 +-
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c                                =
           | 333 -------------
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c                                =
           | 127 -----
 arch/powerpc/platforms/86xx/mvme7100.c                                    =
           |   1 -
 arch/powerpc/platforms/8xx/adder875.c                                     =
           |   8 +-
 arch/powerpc/platforms/8xx/ep88xc.c                                       =
           |   7 +-
 arch/powerpc/platforms/8xx/mpc86xads_setup.c                              =
           |   7 +-
 arch/powerpc/platforms/8xx/mpc885ads_setup.c                              =
           |   7 +-
 arch/powerpc/platforms/8xx/tqm8xx_setup.c                                 =
           |   7 +-
 arch/powerpc/platforms/Kconfig                                            =
           |   4 +-
 arch/powerpc/platforms/Kconfig.cputype                                    =
           |  38 ++
 arch/powerpc/platforms/amigaone/setup.c                                   =
           |  22 +-
 arch/powerpc/platforms/cell/axon_msi.c                                    =
           |   9 +-
 arch/powerpc/platforms/cell/setup.c                                       =
           |   1 -
 arch/powerpc/platforms/cell/spu_manage.c                                  =
           |   2 +-
 arch/powerpc/platforms/chrp/setup.c                                       =
           |   1 -
 arch/powerpc/platforms/embedded6xx/Kconfig                                =
           |  10 -
 arch/powerpc/platforms/embedded6xx/Makefile                               =
           |   1 -
 arch/powerpc/platforms/embedded6xx/flipper-pic.c                          =
           |   2 +-
 arch/powerpc/platforms/embedded6xx/gamecube.c                             =
           |  10 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c                             =
           |   2 +-
 arch/powerpc/platforms/embedded6xx/holly.c                                =
           |  20 +-
 arch/powerpc/platforms/embedded6xx/linkstation.c                          =
           |   5 +-
 arch/powerpc/platforms/embedded6xx/ls_uart.c                              =
           |  17 +-
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c                         =
           | 198 --------
 arch/powerpc/platforms/embedded6xx/mvme5100.c                             =
           |  11 +-
 arch/powerpc/platforms/embedded6xx/storcenter.c                           =
           |   8 +-
 arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c                        =
           |  20 +-
 arch/powerpc/platforms/embedded6xx/wii.c                                  =
           |  14 +-
 arch/powerpc/platforms/fsl_uli1575.c                                      =
           |  29 +-
 arch/powerpc/platforms/maple/setup.c                                      =
           |   3 +-
 arch/powerpc/platforms/microwatt/setup.c                                  =
           |   8 +-
 arch/powerpc/platforms/pasemi/iommu.c                                     =
           |   2 +-
 arch/powerpc/platforms/pasemi/setup.c                                     =
           |   1 -
 arch/powerpc/platforms/powermac/feature.c                                 =
           |  18 +-
 arch/powerpc/platforms/powermac/pic.c                                     =
           |   7 +-
 arch/powerpc/platforms/powermac/setup.c                                   =
           |   2 +-
 arch/powerpc/platforms/powermac/smp.c                                     =
           |   2 +-
 arch/powerpc/platforms/powernv/opal-lpc.c                                 =
           |   2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                                 =
           |  42 +-
 arch/powerpc/platforms/powernv/setup.c                                    =
           |   5 +-
 arch/powerpc/platforms/ps3/setup.c                                        =
           |   4 +-
 arch/powerpc/platforms/pseries/firmware.c                                 =
           |   1 +
 arch/powerpc/platforms/pseries/hotplug-cpu.c                              =
           |   2 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c                           =
           |  45 +-
 arch/powerpc/platforms/pseries/hvCall.S                                   =
           |   4 +-
 arch/powerpc/platforms/pseries/iommu.c                                    =
           |  51 +-
 arch/powerpc/platforms/pseries/mobility.c                                 =
           |  10 +-
 arch/powerpc/platforms/pseries/plpks.c                                    =
           |   5 +-
 arch/powerpc/platforms/pseries/pseries.h                                  =
           |   4 +
 arch/powerpc/platforms/pseries/setup.c                                    =
           |   4 +-
 arch/powerpc/platforms/pseries/vio.c                                      =
           |   4 +-
 arch/powerpc/sysdev/dcr.c                                                 =
           |   2 +-
 arch/powerpc/sysdev/ehv_pic.c                                             =
           |   6 +-
 arch/powerpc/sysdev/fsl_rio.c                                             =
           |  23 +-
 arch/powerpc/sysdev/fsl_soc.c                                             =
           |   2 +-
 arch/powerpc/sysdev/mpic.c                                                =
           |   6 +-
 arch/powerpc/sysdev/mpic_msgr.c                                           =
           |   2 +-
 arch/powerpc/sysdev/tsi108_dev.c                                          =
           |   8 +-
 arch/powerpc/sysdev/tsi108_pci.c                                          =
           |   5 +-
 arch/powerpc/sysdev/xics/icp-native.c                                     =
           |  17 +-
 arch/powerpc/sysdev/xive/native.c                                         =
           |   6 +-
 arch/powerpc/xmon/xmon.c                                                  =
           |   2 +
 drivers/cpuidle/cpuidle-pseries.c                                         =
           |  28 +-
 drivers/gpu/drm/amd/display/Kconfig                                       =
           |   2 +-
 drivers/macintosh/Kconfig                                                 =
           |   1 +
 drivers/macintosh/rack-meter.c                                            =
           |   2 +-
 drivers/macintosh/therm_adt746x.c                                         =
           |   2 +-
 drivers/macintosh/windfarm_smu_sat.c                                      =
           |   1 +
 drivers/vfio/vfio_iommu_spapr_tce.c                                       =
           |  96 +---
 tools/testing/selftests/powerpc/Makefile                                  =
           |   8 +-
 tools/testing/selftests/powerpc/copyloops/asm/ppc_asm.h                   =
           |   1 +
 tools/testing/selftests/powerpc/dscr/Makefile                             =
           |   3 +-
 tools/testing/selftests/powerpc/dscr/dscr.h                               =
           |   4 -
 tools/testing/selftests/powerpc/dscr/dscr_default_test.c                  =
           | 207 ++++----
 tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c                 =
           | 169 +++++--
 tools/testing/selftests/powerpc/dscr/dscr_inherit_test.c                  =
           |   4 +-
 tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c                    =
           |  11 +-
 tools/testing/selftests/powerpc/dscr/dscr_user_test.c                     =
           |   4 +-
 tools/testing/selftests/powerpc/dscr/settings                             =
           |   1 -
 tools/testing/selftests/powerpc/include/utils.h                           =
           |   3 +
 tools/testing/selftests/powerpc/math/vmx_signal.c                         =
           |   1 +
 tools/testing/selftests/powerpc/mm/Makefile                               =
           |   2 +-
 tools/testing/selftests/powerpc/pmu/Makefile                              =
           |  31 +-
 tools/testing/selftests/powerpc/pmu/ebb/cpu_event_pinned_vs_ebb_test.c    =
           |   3 +-
 tools/testing/selftests/powerpc/pmu/ebb/cpu_event_vs_ebb_test.c           =
           |   3 +-
 tools/testing/selftests/powerpc/pmu/ebb/ebb_vs_cpu_event_test.c           =
           |   3 +-
 tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c            =
           |   6 +-
 tools/testing/selftests/powerpc/pmu/lib.c                                 =
           |  19 +-
 tools/testing/selftests/powerpc/pmu/lib.h                                 =
           |   1 -
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sam=
ple_test.c |   4 +-
 tools/testing/selftests/powerpc/stringloops/asm/ppc_asm.h                 =
           |   1 +
 tools/testing/selftests/powerpc/utils.c                                   =
           |  23 +
 278 files changed, 2672 insertions(+), 9188 deletions(-)
 delete mode 100644 arch/powerpc/boot/cuboot-mpc7448hpc2.c
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc7448hpc2.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc8272ads.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc832x_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc834x_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc836x_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc8377_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc8378_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc8379_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc8610_hpcd.dts
 delete mode 100644 arch/powerpc/boot/dts/pq2fads.dts
 delete mode 100644 arch/powerpc/configs/83xx/mpc832x_mds_defconfig
 delete mode 100644 arch/powerpc/configs/83xx/mpc834x_mds_defconfig
 delete mode 100644 arch/powerpc/configs/83xx/mpc836x_mds_defconfig
 delete mode 100644 arch/powerpc/configs/83xx/mpc837x_mds_defconfig
 create mode 120000 arch/powerpc/configs/kvm_guest.config
 delete mode 100644 arch/powerpc/configs/mpc7448_hpc2_defconfig
 delete mode 100644 arch/powerpc/configs/mpc8272_ads_defconfig
 delete mode 100644 arch/powerpc/configs/pq2fads_defconfig
 delete mode 100644 arch/powerpc/platforms/82xx/mpc8272_ads.c
 delete mode 100644 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
 delete mode 100644 arch/powerpc/platforms/82xx/pq2ads.h
 delete mode 100644 arch/powerpc/platforms/82xx/pq2fads.c
 delete mode 100644 arch/powerpc/platforms/83xx/mpc832x_mds.c
 delete mode 100644 arch/powerpc/platforms/83xx/mpc834x_mds.c
 delete mode 100644 arch/powerpc/platforms/83xx/mpc836x_mds.c
 delete mode 100644 arch/powerpc/platforms/83xx/mpc837x_mds.c
 create mode 100644 arch/powerpc/platforms/85xx/mpc85xx_8259.c
 create mode 100644 arch/powerpc/platforms/85xx/p2020.c
 delete mode 100644 arch/powerpc/platforms/86xx/mpc8610_hpcd.c
 delete mode 100644 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
 delete mode 100644 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
 delete mode 100644 tools/testing/selftests/powerpc/dscr/settings
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmRLlS4ACgkQUevqPMjh
pYCIcBAAs8RA57wmjPeQY3HKHQz7sXYimQ0Ouzo6YGrTgg99L28DZWf790gppG4N
kx2q61kSZh8JvcpL4mPJYG3UMX/B+dGL4EKwnKdNEb/cSZdTW5B13yrMYg8mbCMV
mm8YdZVbgnIL5ik5H2fJu46fPYVxSCDsbJZDJrpz0K0KbmeUcFJnBvU++VpB3gHS
CFk73xDJrlaRhLNrrWSOmEamizypqM5U1GAJqA0xT22HwMmb3Wj5PcwC++5YGyh3
CY4Fi3b816xjIC12cjD2v6lJYyvd+qU9XaGVW5gHuzS2zHrJoJdNc2XEs3Uog3db
zmPpQ1Z5dbk1PmYdoWpBnuMGZ0LrBfbG8uG2tYFTf3K+SBh3y8QIS6wVWffLkAPH
dtb8SQoXOlJuiS33TI/woHmQtzYxWc3gx4bDN2wWpzTgic+tFHBy82g/RX3TExeU
AIldI/N73nF4kLSoRWCmA2wZzXJWzZ2OwuO15V73aWA99xPxefmgDE/gt/8DxVo4
UnAhtWcOz6cYw2DLOI4rRhZKrDfIMiyLasEAhlxo570xqaFAgCpgjDnDKWulOlVo
hA+l2FM/PG17Z1BOzzZYLSmhyqhloPb9+e+u5aGR7VBGhXmq9XuCjb0Q/cqriIEL
3Q6+L2jAZLIJ2c2666K7ZZTu8PVDiJH/Y1Y8jtBKRFep5Huo0uI=3D
=3DE2UX
-----END PGP SIGNATURE-----
