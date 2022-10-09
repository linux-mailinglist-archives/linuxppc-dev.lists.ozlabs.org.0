Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEA25F8AC7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 13:02:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlfJy2bS0z3drV
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 22:02:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BIXL6U3x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlfJ02KkJz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 22:01:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BIXL6U3x;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MlfHp5jWzz4x1F;
	Sun,  9 Oct 2022 22:01:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665313307;
	bh=c9Didb5p2ZsGttwaf9tiM0LV0TwLkOCLPdrv4T/15qY=;
	h=From:To:Cc:Subject:Date:From;
	b=BIXL6U3xesAh7EhfCcQIHc44Dg9x7RoRkU1Y6niO0WR+Ad/fGthTU5K+uF1yF4H8J
	 9H7GRmo7Y9Lhw+yPUsiXwSUBr3geI5CPMQR0B8TVp+5SoCKNbRd7UGZJE74UWdVgtu
	 Ug0UHkNuXbBYAfr/itxOtykjQqF9j/o/lbqavV6XP2SinzX8IEBs/vQBxiD7y2sn6p
	 i91BCCLI4V3SKwGGAEy/cPfCQ4grWsMCWcRzNs65xiW9QzZ2k5rgt9g0wW/P1+y/QW
	 bxvl7gI776vQ9pPBwScHhs6YxhnPeDIsiu7+Qb8gao3wNBnmodAAQ4xfbZE82+/J8W
	 qXqJWav7uU6aQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Date: Sun, 09 Oct 2022 22:01:39 +1100
Message-ID: <87edvhntv0.fsf@mpe.ellerman.id.au>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, linux@roeck-us.net, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, farosas@linux.ibm.com, geoff@infradead.org, pali@kernel.org, gustavoars@kernel.org, lihuafei1@huawei.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 6.1.

No conflicts with your tree. There will be a conflict when you merge the kb=
uild tree, due
to us renaming head_fsl_booke.S to head_85xx.S. The resolution is mostly tr=
ivial,
linux-next has the correct result if it's unclear.

cheers

Notable out of area changes:
  ec65560ad84d watchdog: booke_wdt: Replace PPC_FSL_BOOK3E by PPC_E500:
    drivers/watchdog/Kconfig
    drivers/watchdog/booke_wdt.c

  b8f3e48834fe powerpc/rtas: block error injection when locked down:
    include/linux/security.h
    security/security.c

  include/asm-generic/compat.h	# 43d5de2b67d7 asm-generic: compat: Support =
BE for long long args in 32-bit ABIs
  include/linux/hugetlb.h	# 691cdf016d3b powerpc: Rely on generic definitio=
n of hugepd_t and is_hugepd when unused
  include/math-emu/op-common.h	# 7245fc5bb7a9 powerpc/math-emu: Remove -w b=
uild flag and fix warnings
  init/Kconfig			# 02382aff7235 powerpc/64: Remove PPC64 special case for c=
putime accounting default

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.1-1

for you to fetch changes up to 376b3275c19f83d373e841e9af2d7658693190b9:

  KVM: PPC: Book3S HV: Fix stack frame regs marker (2022-10-07 21:30:25 +11=
00)

- ------------------------------------------------------------------
powerpc updates for 6.1

 - Remove our now never-true definitions for pgd_huge() and p4d_leaf().

 - Add pte_needs_flush() and huge_pmd_needs_flush() for 64-bit.

 - Add support for syscall wrappers.

 - Add support for KFENCE on 64-bit.

 - Update 64-bit HV KVM to use the new guest state entry/exit accounting AP=
I.

 - Support execute-only memory when using the Radix MMU (P9 or later).

 - Implement CONFIG_PARAVIRT_TIME_ACCOUNTING for pseries guests.

 - Updates to our linker script to move more data into read-only sections.

 - Allow the VDSO to be randomised on 32-bit.

 - Many other small features and fixes.

Thanks to: Andrew Donnellan, Aneesh Kumar K.V, Arnd Bergmann, Athira Rajeev=
, Christophe
Leroy, David Hildenbrand, Disha Goel, Fabiano Rosas, Gaosheng Cui, Gustavo =
A. R. Silva,
Haren Myneni, Hari Bathini, Jilin Yuan, Joel Stanley, Kajol Jain, Kees Cook=
, Krzysztof
Kozlowski, Laurent Dufour, Liang He, Li Huafei, Lukas Bulwahn, Madhavan Sri=
nivasan, Nathan
Chancellor, Nathan Lynch, Nicholas Miehlbradt, Nicholas Piggin, Pali Roh=C3=
=A1r, Rohan McLure,
Russell Currey, Sachin Sant, Segher Boessenkool, Shrikanth Hegde, Tyrel Dat=
wyler, Wolfram
Sang, ye xingchen, Zheng Yongjun.

- ------------------------------------------------------------------
Aneesh Kumar K.V (3):
      powerpc/mm/book3s/hash: Rename flush_tlb_pmd_range
      powerpc/mm: Always update max/min_low_pfn in mem_topology_setup()
      powerpc/mm: Fix UBSAN warning reported on hugetlb

Athira Rajeev (2):
      powerpc/perf: Fix branch_filter support for multiple filters
      selftests/powerpc: Update bhrb filter sampling test for multiple bran=
ch filters

Christophe Leroy (38):
      powerpc/vdso: Don't map VDSO at a fixed address on PPC32
      powerpc: Remove stale declarations in mmu_decl.h
      powerpc/fsl_booke: Make calc_cam_sz() static
      powerpc/code-patching: Speed up page mapping/unmapping
      powerpc/32: Drop a stale comment about reservation of gigantic pages
      powerpc/32: Allow fragmented physical memory
      powerpc/32: Remove wii_memory_fixups()
      powerpc/math-emu: Remove -w build flag and fix warnings
      powerpc/vdso: link with -z noexecstack
      powerpc/math-emu: Inhibit W=3D1 warnings
      powerpc/nohash: Remove pgd_huge() stub
      powerpc: Rely on generic definition of hugepd_t and is_hugepd when un=
used
      powerpc/book3s: Inline first level of update_mmu_cache()
      powerpc/mm: Reduce redundancy in pgtable.h
      powerpc/mm: Make PAGE_KERNEL_xxx macros grep-friendly
      powerpc/highmem: Properly handle fragmented memory
      powerpc/Kconfig: Fix non existing CONFIG_PPC_FSL_BOOKE
      powerpc/64e: Tie PPC_BOOK3E_64 to PPC_E500MC
      powerpc/64e: Remove unnecessary #ifdef CONFIG_PPC_FSL_BOOK3E
      powerpc/cputable: Remove __machine_check_early_realmode_p{7/8/9} prot=
otypes
      powerpc/cputable: Move __cpu_setup() prototypes out of cputable.h
      powerpc/cputable: Split cpu_specs[] out of cputable.h
      powerpc: Remove CONFIG_FSL_BOOKE
      powerpc/cputable: Split cpu_specs[] for mpc85xx and e500mc
      powerpc: Remove CONFIG_PPC_BOOK3E
      powerpc: Remove redundant selection of E500 and E500MC
      powerpc: Change CONFIG_E500 to CONFIG_PPC_E500
      Documentation: Rename PPC_FSL_BOOK3E to PPC_E500
      watchdog: booke_wdt: Replace PPC_FSL_BOOK3E by PPC_E500
      powerpc: Remove CONFIG_PPC_FSL_BOOK3E
      powerpc: Remove CONFIG_PPC_BOOK3E_MMU
      powerpc: Replace PPC_85xx || PPC_BOOKE_64 by PPC_E500
      powerpc: Simplify redundant Kconfig tests
      powerpc: Cleanup idle for e500
      powerpc: Remove impossible mmu_psize_defs[] on nohash
      powerpc/irq: Refactor irq_soft_mask_{set,or}_return()
      powerpc/64s: Remove unneeded #ifdef CONFIG_DEBUG_PAGEALLOC in hash_ut=
ils
      powerpc/64s: Allow double call of kernel_[un]map_linear_page()

David Hildenbrand (1):
      powerpc/prom_init: drop PROM_BUG()

Fabiano Rosas (1):
      KVM: PPC: Book3S HV: Fix decrementer migration

Gaosheng Cui (9):
      powerpc/xmon: remove unused ppc_parse_cpu() declaration
      powerpc/spufs: remove orphan declarations from spufs.h
      powerpc: remove unused chrp_event_scan() declaration
      powerpc: remove unused udbg_init_debug_beat() declaration
      powerpc/mm: remove orphan declarations from mmu_context.h
      powerpc/powernv: remove orphan declarations from opal.h
      powerpc/sysdev: remove unused xics_ipi_dispatch() declaration
      powerpc/ps3: remove orphan declarations from ps3av.h
      KVM: PPC: remove orphan declarations from kvm_ppc.h

Gustavo A. R. Silva (1):
      powerpc/85xx: Fix fall-through warning for Clang

Haren Myneni (3):
      powerpc/pseries: Move vas_migration_handler early during migration
      powerpc: Ignore DSI error caused by the copy/paste instruction
      powerpc/pseries/vas: Pass hw_cpu_id to node associativity HCALL

Hari Bathini (1):
      powerpc/64/kdump: Limit kdump base to 512MB

Jilin Yuan (3):
      powerpc/mobility: fix repeated words in comments
      powerpc/vas: fix repeated words in comments
      powerpc/xive: fix repeated words in comments

Joel Stanley (1):
      powerpc/microwatt: Add LiteX MMC driver

Li Huafei (1):
      powerpc/kprobes: Fix null pointer reference in arch_prepare_kprobe()

Liang He (31):
      powerpc/512x: Add missing of_node_put() in mpc5121_clk_init()
      powerpc/85xx: Add missing of_node_put() in ksi8560.c
      powerpc/52xx: Add missing of_node_put() in media5200.c
      powerpc/85xx: Add missing of_node_put() in sgy_cst1000
      powerpc/maple: Add missing of_node_put() in time.c
      powerpc/8xx: Add missing of_node_put() in tqm8xx_setup.c
      powerpc/embedded6xx: Add missing of_node_put()s
      powerpc/perf: Add missing of_node_put()s in imc-pmu.c
      powerpc/kernel: Add missing of_node_put() in legacy_serial.c
      powerpc/cell: Add missing of_node_put()s
      powerpc/cell: Add missing of_node_put()s in cbe_regs.c
      powerpc/cell: Add missing of_node_put() in iommu.c
      powerpc/pseries: Add missing of_node_put() in ibmebus
      powerpc/embedded6xx/ls_uart: Add missing of_node_put()
      powerpc/sysdev: Add missing of_node_put()s
      powerpc/sysdev/fsl_msi: Add missing of_node_put()
      powerpc/powermac: Add missing of_node_put() in smp_core99_setup()
      powerpc/512x: Add missing of_node_put() in clock-commonclk.c
      powerpc/83xx: Add missing of_node_put() in mpc832x_spi_init()
      macintosh: Add missing of_node_get() in do_attach()
      powerpc/pseries: Add missing of_node_put()s in hotplug-cpu.c
      powerpc/pci_dn: Add missing of_node_put()
      powerpc/44x: Add of_node_put() when break out from for_each
      powerpc/85xx: Add missing of_node_get/put() in ge_imp3a_pci_assign_pr=
imary()
      powerpc/fsl_pci: Remove of_node_put() when reference escaped out
      powerpc/powernv: Add missing of_node_put()s
      powerpc/pci-common: Fix refcount bug for 'phb->dn'
      powerpc/powermac/feature: Add missing of_node_put()
      powerpc/powermac/low_i2c: Add missing of_node_put() in kw_i2c_probe()
      powerpc/powermac/pfunc_base: Add missing of_node_put() in macio_gpio_=
init_one()
      powerpc/powermac/udbg_scc: Add missing of_node_put()s in udbg_scc_ini=
t()

Lukas Bulwahn (1):
      powerpc/configs: Update config files for removed/renamed symbols

Michael Ellerman (30):
      powerpc/boot: Convert more files to use SPDX tags
      powerpc/boot: Drop unused dummy.c
      powerpc: Move patch sites out of asm-prototypes.h
      powerpc: Update ISA versions to mention e5500/e6500
      powerpc/configs: Properly enable PAPR_SCM in pseries_defconfig
      selftests/powerpc: Skip 4PB test on 4K PAGE_SIZE systems
      powerpc/pasemi: Use of_root in pas_pci_init()
      Merge branch 'fixes' into next
      powerpc/64: Remove unused prom_init_toc symbols
      powerpc/vmlinux.lds: Ensure STRICT_ALIGN_SIZE is at least page aligned
      powerpc/vmlinux.lds: Add an explicit symbol for the SRWX boundary
      powerpc/64: Remove unused SYS_CALL_TABLE symbol
      powerpc/microwatt: Remove unused early debug code
      powerpc/mm/64s: Drop pgd_huge()
      powerpc/mm/64s: Drop p4d_leaf()
      powerpc: Always select HAVE_EFFICIENT_UNALIGNED_ACCESS
      powerpc: Make stack frame marker upper case
      powerpc: Reverse stack frame marker on little endian
      Merge branch 'topic/ppc-kvm' into next
      powerpc/64s: Remove old STAB comment
      powerpc/64s: Remove lost/old comment
      powerpc: Drops STABS_DEBUG from linker scripts
      powerpc/configs: Enable PPC_UV in powernv_defconfig
      powerpc: Add hardware description string
      powerpc: Add PVR & CPU name to hardware description
      powerpc/64: Add logical PVR to the hardware description
      powerpc: Add device-tree model to the hardware description
      powerpc/powernv: Add opal details to the hardware description
      powerpc/pseries: Add firmware details to the hardware description
      powerpc: Don't add __powerpc_ prefix to syscall entry points

Nathan Chancellor (1):
      powerpc/math_emu/efp: Include module.h

Nathan Lynch (4):
      Revert "powerpc/rtas: Implement reentrant rtas call"
      powerpc/pseries: block untrusted device tree changes when locked down
      powerpc/rtas: block error injection when locked down
      powerpc/smp: poll cpu_callin_map more aggressively in __cpu_up()

Nicholas Miehlbradt (3):
      selftests/powerpc: Add a test for execute-only memory
      powerpc/64s: Add DEBUG_PAGEALLOC for radix
      powerpc/64s: Enable KFENCE on book3s64

Nicholas Piggin (46):
      powerpc/pseries: Add wait interval counter definitions to struct lppa=
ca
      powerpc/pseries: Implement CONFIG_PARAVIRT_TIME_ACCOUNTING
      powerpc/64: Remove PPC64 special case for cputime accounting default
      powerpc/pseries: Move dtl scanning and steal time accounting to pseri=
es platform
      powerpc/64s: add pte_needs_flush and huge_pmd_needs_flush
      powerpc/pseries: move hcall_tracepoint_refcount out of .toc
      powerpc: move __end_rodata to cover arch read-only sections
      powerpc/32/build: move got1/got2 sections out of text
      powerpc/build: move got, toc, plt, branch_lt sections to read-only
      powerpc/build: move .data.rel.ro, .sdata2 to read-only
      powerpc/64/build: only include .opd with ELFv1
      powerpc/64/build: merge .got and .toc input sections
      powerpc/build: put sys_call_table in .data.rel.ro if RELOCATABLE
      KVM: PPC: Book3S HV P9: Clear vcpu cpu fields before enabling host ir=
qs
      KVM: PPC: Book3S HV P9: Fix irq disabling in tick accounting
      KVM: PPC: Book3S HV: Update guest state entry/exit accounting to new =
API
      KVM: PPC: Book3S HV P9: Restore stolen time logging in dtl
      powerpc/time: avoid programming DEC at the start of the timer interru=
pt
      powerpc: add ISA v3.0 / v3.1 wait opcode macro
      powerpc/64s: Make POWER10 and later use pause_short in cpu_relax loops
      powerpc/64s: Fix GENERIC_CPU build flags for PPC970 / G5
      powerpc/64s: update cpu selection options
      powerpc/64/interrupt: Fix false warning in context tracking due to id=
le state
      powerpc/64: mark irqs hard disabled in boot paca
      powerpc/64/interrupt: Fix return to masked context after hard-mask ir=
q becomes pending
      powerpc/64s: Fix irq state management in runlatch functions
      powerpc/64s/interrupt: masked handler debug check for previous hard d=
isable
      powerpc/64/interrupt: avoid BUG/WARN recursion in interrupt entry
      powerpc/64/irq: tidy soft-masked irq replay and improve documentation
      powerpc/64s: POWER10 CPU Kconfig build option
      powerpc/64: use 32-bit immediate for STACK_FRAME_REGS_MARKER
      powerpc/64: asm use consistent global variable declaration and access
      powerpc/64: switch asm helpers from GOT to TOC relative addressing
      powerpc/64: provide a helper macro to load r2 with the kernel TOC
      powerpc/64e: provide an addressing macro for use with TOC in alternat=
e register
      powerpc/64s/interrupt: move early boot ILE fixup into a macro
      powerpc/64s: early boot machine check handler
      powerpc/64: avoid using r13 in relocate
      powerpc/64: don't set boot CPU's r13 to paca until the structure is s=
et up
      powerpc/64s/interrupt: halt early boot interrupts if paca is not set =
up
      KVM: PPC: Book3S HV: Implement scheduling wait interval counters in t=
he VPA
      powerpc: remove orphan systbl_chk.sh
      powerpc/64s/interrupt: Change must-hard-mask interrupt check from BUG=
 to WARN
      powerpc/64: Fix msr_check_and_set/clear MSR[EE] race
      powerpc/64s/interrupt: Fix stack frame regs marker
      KVM: PPC: Book3S HV: Fix stack frame regs marker

Pali Roh=C3=A1r (7):
      powerpc: dts: turris1x.dts: Fix NOR partitions labels
      powerpc: dts: turris1x.dts: Fix labels in DSA cpu port nodes
      powerpc: Add support for early debugging via Serial 16550 console
      powerpc: Fix SPE Power ISA properties for e500v1 platforms
      powerpc: Include e500v1_power_isa.dtsi for remaining e500v1 platforms
      powerpc/boot: Explicitly disable usage of SPE instructions
      powerpc/udbg: Remove extern function prototypes

Rohan McLure (20):
      powerpc: Remove asmlinkage from syscall handler definitions
      powerpc: Save caller r3 prior to system_call_exception
      powerpc: Add ZEROIZE_GPRS macros for register clears
      powerpc/64s: Use {ZEROIZE,SAVE,REST}_GPRS macros in sc, scv 0 handlers
      powerpc/32: Clarify interrupt restores with REST_GPR macro in entry_3=
2.S
      powerpc/64e: Clarify register saves and clears with {SAVE,ZEROIZE}_GP=
RS
      powerpc/64s: Fix comment on interrupt handler prologue
      powerpc: Fix fallocate and fadvise64_64 compat parameter combination
      asm-generic: compat: Support BE for long long args in 32-bit ABIs
      powerpc: Use generic fallocate compatibility syscall
      powerpc/32: Remove powerpc select specialisation
      powerpc: Remove direct call to personality syscall handler
      powerpc: Remove direct call to mmap2 syscall handlers
      powerpc: Provide do_ppc64_personality helper
      powerpc: Adopt SYSCALL_DEFINE for arch-specific syscall handlers
      powerpc: Include all arch-specific syscall prototypes
      powerpc: Enable compile-time check for syscall handlers
      powerpc: Use common syscall handler type
      powerpc: Change system_call_exception calling convention
      powerpc: Provide syscall wrapper

Russell Currey (2):
      powerpc/mm: Support execute-only memory on the Radix MMU
      powerpc/pasemi: Use strscpy instead of strlcpy

Wolfram Sang (3):
      powerpc: move from strlcpy with unused retval to strscpy
      macintosh: move from strlcpy with unused retval to strscpy
      powerpc/82xx: remove spidev node from mgcoge

Zheng Yongjun (1):
      powerpc/powernv: add missing of_node_put() in opal_export_attrs()

ye xingchen (3):
      powerpc/selftests: Use timersub() for gettimeofday()
      powerpc/pseries/vas: Remove the unneeded result variable
      ocxl: Remove the unneeded result variable


 Documentation/admin-guide/kernel-parameters.txt                           =
|    8 +-
 Documentation/powerpc/isa-versions.rst                                    =
|   22 +
 arch/powerpc/Kconfig                                                      =
|   35 +-
 arch/powerpc/Kconfig.debug                                                =
|   15 +
 arch/powerpc/Makefile                                                     =
|   18 +-
 arch/powerpc/boot/44x.h                                                   =
|    5 +-
 arch/powerpc/boot/4xx.h                                                   =
|    5 +-
 arch/powerpc/boot/Makefile                                                =
|    1 +
 arch/powerpc/boot/dts/fsl/e500v1_power_isa.dtsi                           =
|   51 +
 arch/powerpc/boot/dts/fsl/mpc8540ads.dts                                  =
|    2 +-
 arch/powerpc/boot/dts/fsl/mpc8541cds.dts                                  =
|    2 +-
 arch/powerpc/boot/dts/fsl/mpc8555cds.dts                                  =
|    2 +-
 arch/powerpc/boot/dts/fsl/mpc8560ads.dts                                  =
|    2 +-
 arch/powerpc/boot/dts/ksi8560.dts                                         =
|    2 +
 arch/powerpc/boot/dts/mgcoge.dts                                          =
|    7 -
 arch/powerpc/boot/dts/stx_gp3_8560.dts                                    =
|    2 +
 arch/powerpc/boot/dts/stxssa8555.dts                                      =
|    2 +
 arch/powerpc/boot/dts/tqm8540.dts                                         =
|    2 +
 arch/powerpc/boot/dts/tqm8541.dts                                         =
|    2 +
 arch/powerpc/boot/dts/tqm8555.dts                                         =
|    2 +
 arch/powerpc/boot/dts/tqm8560.dts                                         =
|    2 +
 arch/powerpc/boot/dts/turris1x.dts                                        =
|   14 +-
 arch/powerpc/boot/dummy.c                                                 =
|    4 -
 arch/powerpc/boot/opal-calls.S                                            =
|    6 +-
 arch/powerpc/boot/ops.h                                                   =
|    6 +-
 arch/powerpc/boot/ppc_asm.h                                               =
|   10 +
 arch/powerpc/boot/serial.c                                                =
|    6 +-
 arch/powerpc/boot/simple_alloc.c                                          =
|    6 +-
 arch/powerpc/configs/83xx/mpc837x_rdb_defconfig                           =
|    1 -
 arch/powerpc/configs/85xx/ge_imp3a_defconfig                              =
|    1 -
 arch/powerpc/configs/85xx/ppa8548_defconfig                               =
|    2 -
 arch/powerpc/configs/cell_defconfig                                       =
|    1 -
 arch/powerpc/configs/g5_defconfig                                         =
|    1 -
 arch/powerpc/configs/microwatt_defconfig                                  =
|    5 +
 arch/powerpc/configs/mpc512x_defconfig                                    =
|    1 -
 arch/powerpc/configs/mpc885_ads_defconfig                                 =
|    2 +-
 arch/powerpc/configs/pasemi_defconfig                                     =
|    1 -
 arch/powerpc/configs/pmac32_defconfig                                     =
|    1 -
 arch/powerpc/configs/powernv_defconfig                                    =
|    6 +-
 arch/powerpc/configs/ppc64_defconfig                                      =
|    5 +-
 arch/powerpc/configs/ppc64e_defconfig                                     =
|    3 -
 arch/powerpc/configs/ppc6xx_defconfig                                     =
|    7 -
 arch/powerpc/configs/ps3_defconfig                                        =
|    1 -
 arch/powerpc/configs/pseries_defconfig                                    =
|    6 +-
 arch/powerpc/configs/skiroot_defconfig                                    =
|    2 -
 arch/powerpc/configs/storcenter_defconfig                                 =
|    1 -
 arch/powerpc/include/asm/asm-prototypes.h                                 =
|   14 +-
 arch/powerpc/include/asm/barrier.h                                        =
|    2 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h                              =
|   22 +-
 arch/powerpc/include/asm/book3s/64/pgalloc.h                              =
|    6 +-
 arch/powerpc/include/asm/book3s/64/pgtable-4k.h                           =
|   10 -
 arch/powerpc/include/asm/book3s/64/pgtable-64k.h                          =
|    9 -
 arch/powerpc/include/asm/book3s/64/pgtable.h                              =
|   42 +-
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h                        =
|    4 +-
 arch/powerpc/include/asm/book3s/64/tlbflush.h                             =
|   56 +
 arch/powerpc/include/asm/book3s/pgtable.h                                 =
|   15 +-
 arch/powerpc/include/asm/cpu_setup.h                                      =
|   49 +
 arch/powerpc/include/asm/cpu_setup_power.h                                =
|   12 -
 arch/powerpc/include/asm/cputable.h                                       =
|    8 +-
 arch/powerpc/include/asm/cputime.h                                        =
|    2 +-
 arch/powerpc/include/asm/dtl.h                                            =
|    8 -
 arch/powerpc/include/asm/hugetlb.h                                        =
|    4 +-
 arch/powerpc/include/asm/hw_irq.h                                         =
|   50 +-
 arch/powerpc/include/asm/interrupt.h                                      =
|   41 +-
 arch/powerpc/include/asm/kexec.h                                          =
|    2 +-
 arch/powerpc/include/asm/kfence.h                                         =
|   15 +
 arch/powerpc/include/asm/kgdb.h                                           =
|    2 +-
 arch/powerpc/include/asm/kvm_host.h                                       =
|    2 +-
 arch/powerpc/include/asm/kvm_ppc.h                                        =
|    4 -
 arch/powerpc/include/asm/lppaca.h                                         =
|   10 +-
 arch/powerpc/include/asm/machdep.h                                        =
|    1 -
 arch/powerpc/include/asm/mmu.h                                            =
|   11 +-
 arch/powerpc/include/asm/mmu_context.h                                    =
|    2 -
 arch/powerpc/include/asm/nohash/32/pgtable.h                              =
|    8 +-
 arch/powerpc/include/asm/nohash/32/{pte-fsl-booke.h =3D> pte-85xx.h}      =
  |    6 +-
 arch/powerpc/include/asm/nohash/64/pgtable.h                              =
|    2 +-
 arch/powerpc/include/asm/nohash/{hugetlb-book3e.h =3D> hugetlb-e500.h}    =
  |    8 +-
 arch/powerpc/include/asm/nohash/{mmu-book3e.h =3D> mmu-e500.h}            =
  |    0
 arch/powerpc/include/asm/nohash/mmu.h                                     =
|    4 +-
 arch/powerpc/include/asm/nohash/pgalloc.h                                 =
|    2 +-
 arch/powerpc/include/asm/nohash/pgtable.h                                 =
|   30 +-
 arch/powerpc/include/asm/nohash/{pte-book3e.h =3D> pte-e500.h}            =
  |    6 +-
 arch/powerpc/include/asm/nohash/tlbflush.h                                =
|    2 +-
 arch/powerpc/include/asm/opal.h                                           =
|    6 -
 arch/powerpc/include/asm/paca.h                                           =
|    9 +-
 arch/powerpc/include/asm/page.h                                           =
|    8 +-
 arch/powerpc/include/asm/paravirt.h                                       =
|   12 +
 arch/powerpc/include/asm/paravirt_api_clock.h                             =
|    2 +
 arch/powerpc/include/asm/pgtable-be-types.h                               =
|    2 +
 arch/powerpc/include/asm/pgtable-types.h                                  =
|    2 +
 arch/powerpc/include/asm/pgtable.h                                        =
|   19 +
 arch/powerpc/include/asm/ppc-opcode.h                                     =
|    7 +-
 arch/powerpc/include/asm/ppc_asm.h                                        =
|   52 +-
 arch/powerpc/include/asm/processor.h                                      =
|   24 +-
 arch/powerpc/include/asm/ps3av.h                                          =
|    2 -
 arch/powerpc/include/asm/ptrace.h                                         =
|    9 +-
 arch/powerpc/include/asm/reg_booke.h                                      =
|    6 +-
 arch/powerpc/include/asm/rtas.h                                           =
|    1 -
 arch/powerpc/include/asm/runlatch.h                                       =
|    6 +-
 arch/powerpc/include/asm/sections.h                                       =
|   17 +-
 arch/powerpc/include/asm/setup.h                                          =
|    5 +-
 arch/powerpc/include/asm/synch.h                                          =
|    2 +-
 arch/powerpc/include/asm/syscall.h                                        =
|   11 +-
 arch/powerpc/include/asm/syscall_wrapper.h                                =
|   49 +
 arch/powerpc/include/asm/syscalls.h                                       =
|  142 +-
 arch/powerpc/{kernel/ppc32.h =3D> include/asm/syscalls_32.h}              =
  |    6 +-
 arch/powerpc/include/asm/time.h                                           =
|    5 +-
 arch/powerpc/include/asm/udbg.h                                           =
|   54 +-
 arch/powerpc/include/asm/unistd.h                                         =
|    1 +
 arch/powerpc/include/asm/vdso.h                                           =
|    3 -
 arch/powerpc/include/asm/vdso/processor.h                                 =
|    8 +-
 arch/powerpc/include/asm/vdso/timebase.h                                  =
|    2 +-
 arch/powerpc/include/asm/xics.h                                           =
|    1 -
 arch/powerpc/kernel/{fsl_booke_entry_mapping.S =3D> 85xx_entry_mapping.S} =
  |    0
 arch/powerpc/kernel/Makefile                                              =
|   14 +-
 arch/powerpc/kernel/asm-offsets.c                                         =
|   10 +-
 arch/powerpc/kernel/{cpu_setup_fsl_booke.S =3D> cpu_setup_e500.S}         =
  |    6 +-
 arch/powerpc/kernel/cpu_setup_power.c                                     =
|    2 +-
 arch/powerpc/kernel/cpu_specs.h                                           =
|   29 +
 arch/powerpc/kernel/cpu_specs_40x.h                                       =
|  280 +++
 arch/powerpc/kernel/cpu_specs_44x.h                                       =
|  304 ++++
 arch/powerpc/kernel/cpu_specs_47x.h                                       =
|   74 +
 arch/powerpc/kernel/cpu_specs_85xx.h                                      =
|   57 +
 arch/powerpc/kernel/cpu_specs_8xx.h                                       =
|   23 +
 arch/powerpc/kernel/cpu_specs_book3s_32.h                                 =
|  605 ++++++
 arch/powerpc/kernel/cpu_specs_book3s_64.h                                 =
|  481 +++++
 arch/powerpc/kernel/cpu_specs_e500mc.h                                    =
|   75 +
 arch/powerpc/kernel/cputable.c                                            =
| 1920 +-------------------
 arch/powerpc/kernel/dt_cpu_ftrs.c                                         =
|    2 +-
 arch/powerpc/kernel/entry_32.S                                            =
|   52 +-
 arch/powerpc/kernel/entry_64.S                                            =
|    6 +-
 arch/powerpc/kernel/exceptions-64e.S                                      =
|   70 +-
 arch/powerpc/kernel/exceptions-64s.S                                      =
|  159 +-
 arch/powerpc/kernel/head_64.S                                             =
|   54 +-
 arch/powerpc/kernel/{head_fsl_booke.S =3D> head_85xx.S}                   =
  |    8 +-
 arch/powerpc/kernel/head_booke.h                                          =
|    8 +-
 arch/powerpc/kernel/{idle_book3e.S =3D> idle_64e.S}                       =
  |   10 +-
 arch/powerpc/kernel/{idle_e500.S =3D> idle_85xx.S}                        =
  |    0
 arch/powerpc/kernel/interrupt.c                                           =
|   10 -
 arch/powerpc/kernel/interrupt_64.S                                        =
|  129 +-
 arch/powerpc/kernel/irq_64.c                                              =
|   93 +-
 arch/powerpc/kernel/kgdb.c                                                =
|   12 +-
 arch/powerpc/kernel/kprobes.c                                             =
|    8 +-
 arch/powerpc/kernel/kvm.c                                                 =
|    8 +-
 arch/powerpc/kernel/legacy_serial.c                                       =
|    2 +
 arch/powerpc/kernel/misc_64.S                                             =
|    6 +-
 arch/powerpc/kernel/optprobes_head.S                                      =
|    2 +-
 arch/powerpc/kernel/paca.c                                                =
|   38 +-
 arch/powerpc/kernel/pci-common.c                                          =
|    4 +-
 arch/powerpc/kernel/pci_dn.c                                              =
|    1 +
 arch/powerpc/kernel/process.c                                             =
|    4 +-
 arch/powerpc/kernel/prom.c                                                =
|   63 +-
 arch/powerpc/kernel/prom_init.c                                           =
|    6 -
 arch/powerpc/kernel/prom_init_check.sh                                    =
|    3 +-
 arch/powerpc/kernel/reloc_64.S                                            =
|   14 +-
 arch/powerpc/kernel/rtas.c                                                =
|   79 +-
 arch/powerpc/kernel/security.c                                            =
|   11 +-
 arch/powerpc/kernel/setup-common.c                                        =
|   19 +-
 arch/powerpc/kernel/setup.h                                               =
|    2 +-
 arch/powerpc/kernel/setup_32.c                                            =
|    2 +-
 arch/powerpc/kernel/setup_64.c                                            =
|   43 +-
 arch/powerpc/kernel/signal.h                                              =
|    3 -
 arch/powerpc/kernel/signal_32.c                                           =
|    2 +-
 arch/powerpc/kernel/smp.c                                                 =
|   40 +-
 arch/powerpc/kernel/{swsusp_booke.S =3D> swsusp_85xx.S}                   =
  |    0
 arch/powerpc/kernel/swsusp_asm64.S                                        =
|   16 +-
 arch/powerpc/kernel/sys_ppc32.c                                           =
|   66 +-
 arch/powerpc/kernel/syscall.c                                             =
|   39 +-
 arch/powerpc/kernel/syscalls.c                                            =
|   60 +-
 arch/powerpc/kernel/syscalls/syscall.tbl                                  =
|   24 +-
 arch/powerpc/kernel/sysfs.c                                               =
|    6 +-
 arch/powerpc/kernel/{systbl.S =3D> systbl.c}                              =
  |   33 +-
 arch/powerpc/kernel/systbl_chk.sh                                         =
|   30 -
 arch/powerpc/kernel/time.c                                                =
|  121 +-
 arch/powerpc/kernel/trace/ftrace_low.S                                    =
|    2 +-
 arch/powerpc/kernel/trace/ftrace_mprofile.S                               =
|    6 +-
 arch/powerpc/kernel/traps.c                                               =
|   22 +-
 arch/powerpc/kernel/udbg.c                                                =
|    2 +
 arch/powerpc/kernel/udbg_16550.c                                          =
|   52 +-
 arch/powerpc/kernel/vdso.c                                                =
|   19 +-
 arch/powerpc/kernel/vdso/Makefile                                         =
|    4 +-
 arch/powerpc/kernel/vdso/vdso32.lds.S                                     =
|    1 -
 arch/powerpc/kernel/vdso/vdso64.lds.S                                     =
|    1 -
 arch/powerpc/kernel/vector.S                                              =
|   15 +-
 arch/powerpc/kernel/vmlinux.lds.S                                         =
|   97 +-
 arch/powerpc/kexec/core.c                                                 =
|    6 +-
 arch/powerpc/kexec/core_32.c                                              =
|    2 +-
 arch/powerpc/kexec/core_64.c                                              =
|    2 +-
 arch/powerpc/kexec/relocate_32.S                                          =
|    4 +-
 arch/powerpc/kvm/Kconfig                                                  =
|    4 +-
 arch/powerpc/kvm/book3s_64_entry.S                                        =
|    2 +-
 arch/powerpc/kvm/book3s_hv.c                                              =
|  146 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                                   =
|    6 +-
 arch/powerpc/kvm/booke_interrupts.S                                       =
|    4 +-
 arch/powerpc/kvm/e500.h                                                   =
|    2 +-
 arch/powerpc/kvm/powerpc.c                                                =
|    1 -
 arch/powerpc/kvm/tm.S                                                     =
|    2 +-
 arch/powerpc/lib/code-patching.c                                          =
|   30 +-
 arch/powerpc/lib/copypage_64.S                                            =
|    7 +-
 arch/powerpc/lib/feature-fixups.c                                         =
|    4 +-
 arch/powerpc/lib/string_64.S                                              =
|    7 +-
 arch/powerpc/math-emu/Makefile                                            =
|    7 +-
 arch/powerpc/math-emu/math.c                                              =
|   18 +-
 arch/powerpc/math-emu/math_efp.c                                          =
|   60 +-
 arch/powerpc/mm/book3s32/mmu.c                                            =
|    8 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c                                   =
|    4 +-
 arch/powerpc/mm/book3s64/hash_tlb.c                                       =
|    2 +-
 arch/powerpc/mm/book3s64/hash_utils.c                                     =
|   32 +-
 arch/powerpc/mm/book3s64/pgtable.c                                        =
|   11 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c                                  =
|   28 +-
 arch/powerpc/mm/fault.c                                                   =
|   23 +-
 arch/powerpc/mm/hugetlbpage.c                                             =
|    8 +-
 arch/powerpc/mm/init_32.c                                                 =
|   17 +-
 arch/powerpc/mm/mem.c                                                     =
|    4 +-
 arch/powerpc/mm/mmu_decl.h                                                =
|   28 +-
 arch/powerpc/mm/nohash/Makefile                                           =
|    6 +-
 arch/powerpc/mm/nohash/{fsl_book3e.c =3D> e500.c}                         =
  |    6 +-
 arch/powerpc/mm/nohash/{book3e_hugetlbpage.c =3D> e500_hugetlbpage.c}     =
  |    0
 arch/powerpc/mm/nohash/tlb.c                                              =
|   80 +-
 arch/powerpc/mm/nohash/tlb_low.S                                          =
|    6 +-
 arch/powerpc/mm/nohash/tlb_low_64e.S                                      =
|   10 +-
 arch/powerpc/mm/numa.c                                                    =
|    6 +-
 arch/powerpc/mm/pgtable_32.c                                              =
|    7 +-
 arch/powerpc/mm/ptdump/Makefile                                           =
|    2 +-
 arch/powerpc/perf/bhrb.S                                                  =
|    2 +-
 arch/powerpc/perf/callchain_32.c                                          =
|    2 +-
 arch/powerpc/perf/core-book3s.c                                           =
|   17 +
 arch/powerpc/perf/imc-pmu.c                                               =
|   10 +-
 arch/powerpc/platforms/44x/ppc476.c                                       =
|    2 +
 arch/powerpc/platforms/512x/clock-commonclk.c                             =
|    8 +-
 arch/powerpc/platforms/52xx/media5200.c                                   =
|    3 +
 arch/powerpc/platforms/83xx/mpc832x_rdb.c                                 =
|    6 +-
 arch/powerpc/platforms/85xx/Kconfig                                       =
|    5 +-
 arch/powerpc/platforms/85xx/corenet_generic.c                             =
|    4 -
 arch/powerpc/platforms/85xx/ge_imp3a.c                                    =
|    6 +-
 arch/powerpc/platforms/85xx/ksi8560.c                                     =
|    2 +
 arch/powerpc/platforms/85xx/mpc85xx_cds.c                                 =
|    1 +
 arch/powerpc/platforms/85xx/qemu_e500.c                                   =
|    4 -
 arch/powerpc/platforms/85xx/sgy_cts1000.c                                 =
|   35 +-
 arch/powerpc/platforms/8xx/tqm8xx_setup.c                                 =
|    3 +
 arch/powerpc/platforms/Kconfig.cputype                                    =
|   71 +-
 arch/powerpc/platforms/book3s/vas-api.c                                   =
|    2 +-
 arch/powerpc/platforms/cell/cbe_regs.c                                    =
|   37 +-
 arch/powerpc/platforms/cell/iommu.c                                       =
|    4 +-
 arch/powerpc/platforms/cell/setup.c                                       =
|    2 +
 arch/powerpc/platforms/cell/spu_callbacks.c                               =
|    6 +-
 arch/powerpc/platforms/cell/spu_manage.c                                  =
|    2 +
 arch/powerpc/platforms/cell/spufs/spufs.h                                 =
|    2 -
 arch/powerpc/platforms/chrp/chrp.h                                        =
|    1 -
 arch/powerpc/platforms/embedded6xx/holly.c                                =
|    6 +
 arch/powerpc/platforms/embedded6xx/ls_uart.c                              =
|    2 +
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c                         =
|    3 +
 arch/powerpc/platforms/embedded6xx/wii.c                                  =
|   15 -
 arch/powerpc/platforms/maple/time.c                                       =
|    1 +
 arch/powerpc/platforms/pasemi/misc.c                                      =
|    3 +-
 arch/powerpc/platforms/pasemi/pci.c                                       =
|   10 +-
 arch/powerpc/platforms/powermac/feature.c                                 =
|   15 +-
 arch/powerpc/platforms/powermac/low_i2c.c                                 =
|    1 +
 arch/powerpc/platforms/powermac/pfunc_base.c                              =
|    2 +
 arch/powerpc/platforms/powermac/smp.c                                     =
|    1 +
 arch/powerpc/platforms/powermac/udbg_scc.c                                =
|    8 +-
 arch/powerpc/platforms/powernv/idle.c                                     =
|    3 +-
 arch/powerpc/platforms/powernv/ocxl.c                                     =
|    4 +-
 arch/powerpc/platforms/powernv/opal-core.c                                =
|    2 +
 arch/powerpc/platforms/powernv/opal-powercap.c                            =
|    6 +-
 arch/powerpc/platforms/powernv/opal-psr.c                                 =
|    6 +-
 arch/powerpc/platforms/powernv/opal-sensor-groups.c                       =
|    6 +-
 arch/powerpc/platforms/powernv/opal-wrappers.S                            =
|    2 +-
 arch/powerpc/platforms/powernv/opal.c                                     =
|    3 +
 arch/powerpc/platforms/powernv/pci-ioda.c                                 =
|    2 +-
 arch/powerpc/platforms/powernv/setup.c                                    =
|   22 +
 arch/powerpc/platforms/pseries/Kconfig                                    =
|    8 +
 arch/powerpc/platforms/pseries/dtl.c                                      =
|   81 +
 arch/powerpc/platforms/pseries/hotplug-cpu.c                              =
|   15 +-
 arch/powerpc/platforms/pseries/hvCall.S                                   =
|    4 +-
 arch/powerpc/platforms/pseries/hvcserver.c                                =
|    2 +-
 arch/powerpc/platforms/pseries/ibmebus.c                                  =
|    6 +-
 arch/powerpc/platforms/pseries/lpar.c                                     =
|   11 +
 arch/powerpc/platforms/pseries/mobility.c                                 =
|   17 +-
 arch/powerpc/platforms/pseries/reconfig.c                                 =
|    5 +
 arch/powerpc/platforms/pseries/setup.c                                    =
|   49 +
 arch/powerpc/platforms/pseries/vas.c                                      =
|    8 +-
 arch/powerpc/sysdev/fsl_msi.c                                             =
|    2 +
 arch/powerpc/sysdev/fsl_pci.c                                             =
|    9 +-
 arch/powerpc/sysdev/fsl_rio.c                                             =
|    2 +-
 arch/powerpc/sysdev/mpic_msgr.c                                           =
|    9 +-
 arch/powerpc/sysdev/xics/ics-rtas.c                                       =
|   22 +-
 arch/powerpc/sysdev/xive/common.c                                         =
|    2 +-
 arch/powerpc/sysdev/xive/native.c                                         =
|   15 +-
 arch/powerpc/xmon/ppc.h                                                   =
|    2 -
 arch/powerpc/xmon/spr_access.S                                            =
|    4 +-
 arch/powerpc/xmon/xmon.c                                                  =
|   16 +-
 drivers/macintosh/therm_windtunnel.c                                      =
|    6 +-
 drivers/watchdog/Kconfig                                                  =
|    8 +-
 drivers/watchdog/booke_wdt.c                                              =
|    8 +-
 include/asm-generic/compat.h                                              =
|    9 +-
 include/linux/hugetlb.h                                                   =
|    2 +-
 include/linux/security.h                                                  =
|    2 +
 include/math-emu/op-common.h                                              =
|    3 +
 init/Kconfig                                                              =
|    3 +-
 security/security.c                                                       =
|    2 +
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl                        =
|   24 +-
 tools/testing/selftests/powerpc/benchmarks/gettimeofday.c                 =
|    6 +-
 tools/testing/selftests/powerpc/mm/Makefile                               =
|    3 +-
 tools/testing/selftests/powerpc/mm/exec_prot.c                            =
|  231 +++
 tools/testing/selftests/powerpc/mm/large_vm_gpr_corruption.c              =
|    2 +
 tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c =
|    9 +
 307 files changed, 4550 insertions(+), 3720 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/fsl/e500v1_power_isa.dtsi
 delete mode 100644 arch/powerpc/boot/dummy.c
 create mode 100644 arch/powerpc/include/asm/cpu_setup.h
 delete mode 100644 arch/powerpc/include/asm/cpu_setup_power.h
 rename arch/powerpc/include/asm/nohash/32/{pte-fsl-booke.h =3D> pte-85xx.h=
} (94%)
 rename arch/powerpc/include/asm/nohash/{hugetlb-book3e.h =3D> hugetlb-e500=
.h} (84%)
 rename arch/powerpc/include/asm/nohash/{mmu-book3e.h =3D> mmu-e500.h} (100=
%)
 rename arch/powerpc/include/asm/nohash/{pte-book3e.h =3D> pte-e500.h} (96%)
 create mode 100644 arch/powerpc/include/asm/paravirt_api_clock.h
 create mode 100644 arch/powerpc/include/asm/syscall_wrapper.h
 rename arch/powerpc/{kernel/ppc32.h =3D> include/asm/syscalls_32.h} (93%)
 rename arch/powerpc/kernel/{fsl_booke_entry_mapping.S =3D> 85xx_entry_mapp=
ing.S} (100%)
 rename arch/powerpc/kernel/{cpu_setup_fsl_booke.S =3D> cpu_setup_e500.S} (=
98%)
 create mode 100644 arch/powerpc/kernel/cpu_specs.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_40x.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_44x.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_47x.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_85xx.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_8xx.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_book3s_32.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_book3s_64.h
 create mode 100644 arch/powerpc/kernel/cpu_specs_e500mc.h
 rename arch/powerpc/kernel/{head_fsl_booke.S =3D> head_85xx.S} (99%)
 rename arch/powerpc/kernel/{idle_book3e.S =3D> idle_64e.S} (93%)
 rename arch/powerpc/kernel/{idle_e500.S =3D> idle_85xx.S} (100%)
 rename arch/powerpc/kernel/{swsusp_booke.S =3D> swsusp_85xx.S} (100%)
 rename arch/powerpc/kernel/{systbl.S =3D> systbl.c} (52%)
 delete mode 100644 arch/powerpc/kernel/systbl_chk.sh
 rename arch/powerpc/mm/nohash/{fsl_book3e.c =3D> e500.c} (98%)
 rename arch/powerpc/mm/nohash/{book3e_hugetlbpage.c =3D> e500_hugetlbpage.=
c} (100%)
 create mode 100644 tools/testing/selftests/powerpc/mm/exec_prot.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmNCqSwACgkQUevqPMjh
pYBYUw//Ul2eM4UBiuMvRRyVCy1jFnreUAaqnYmTXkleA3f8sJnu/yL/dS+eI6ok
rI0rgbG+Q1IFBdVny5OShEVyY+uNfZz1Q/XnGSX9S2LzYbNp0dM2KNaMNztIIn/s
Rx4wu7zO5HC6UVtKt5tLtkatyOE3c2Dwkz0T+tBYBlQp98JwnII2awiC26Fo9w1j
HKBij2cPeVgrKUsMIzlsbFAlExKGIJEDP45Bl0KB0o35X9FWc4JbBviijNZYqAEx
fioYGnSTX0dsi8VWpwcc0Tft09gfdG9mOvISbiXmKx2NWEtMB9gf43t7hISZRQsh
PflEdIu3AjDDel7pF2w0JRp011DjJialTm5qkF3n+gN81S3RzFSVo+tgqJIt//gv
Xk17EkV/vbLQkMDWQ68g6HXN8yfXAHMxRRe6vIONDDWTDDQ4u/qqlZTKEIA5Yuje
3i2t+YNbqtWBwrsTmmeNaXMf6X4xtBcRwfFlHQxddyuQJ2LI6LeyFdkM7VzUMA2+
+lBvqzCUrp+4Fo2vYCefNJwny4S3dh7nqM5j7kWGo8tqlD7JIF+oGAL5vaF1939g
O7pJGro8VpxbxuRwMoYbfTsBthDFYLiIrxz7gnmxzjH0pDHHsG72J8iL1Rn/+QX1
AWYINpL/wx/lznJ7a2/aunRG2mbU62Wbo8KES5fmHS5gXT8L+Mg=3D
=3DL2a+
-----END PGP SIGNATURE-----
