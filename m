Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E06C03BA205
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 16:13:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGcW46FTzz3074
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 00:13:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kzPqVjRv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kzPqVjRv; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGcVZ1wlVz2yLc
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jul 2021 00:12:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GGcVJ45l6z9shx;
 Sat,  3 Jul 2021 00:12:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1625235166;
 bh=zjW3ULCAlD/3Fr5Mi1MWKR297Hg2+5kB6zsV3zQ5ELY=;
 h=From:To:Cc:Subject:Date:From;
 b=kzPqVjRvAPuLjFyZdYi9KoB5c5AROWXctVvIb2ZCrpvGjvfR3SmcA93waZ/b89EOU
 xX4wLPjzotaqqxzz7DSYHQowy6YfMQXVxws53CgQSe3ukOPAqcRDBp8YzRFcDrzZIj
 OeJr0b6jLvPHEik7CDy65pY9RVWLBAQ1jZjO7q4iCGik/YzKjXf1jrvewCDdKDXzu8
 0UiBsmDsEeep0IQ6hWp4l48qDdPFGImBOy6gSEeW3f4b93kDOgKk7wZ+3UbOTEJ75Z
 TqA+EEVj5JGzHZKQ7DINRNyLkigQ58zVY6fmTrBcVIxUQw1eVBuyJMdIMGUfcsP9ud
 PUoe2A468+KAA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.14-1 tag
Date: Sat, 03 Jul 2021 00:12:30 +1000
Message-ID: <87o8bk7qk1.fsf@mpe.ellerman.id.au>
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
Cc: wangborong@cdjrlc.com, jiapeng.chong@linux.alibaba.com,
 herbert@gondor.apana.org.au, sathvika@linux.vnet.ibm.com,
 aneesh.kumar@linux.ibm.com, danielhb413@gmail.com, haren@linux.ibm.com,
 joel@jms.id.au, jniethe5@gmail.com, naveen.n.rao@linux.vnet.ibm.com,
 chris.zjh@huawei.com, nathanl@linux.ibm.com, yuehaibing@huawei.com,
 arnd@arndb.de, kjain@linux.ibm.com, trix@redhat.com, npiggin@gmail.com,
 nathan@kernel.org, thunder.leizhen@huawei.com,
 andriy.shevchenko@linux.intel.com, dja@axtens.net, zhangshaokun@hisilicon.com,
 atrajeev@linux.vnet.ibm.com, fthain@linux-m68k.org, geoff@infradead.org,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org, libaokun1@huawei.com,
 mhiramat@kernel.org, sudeep.holla@arm.com, vaibhav@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.14.

You already have the KVM changes mentioned below via the KVM tree.

Notable out of area changes:
  7ee3e97e00a3 kprobes: Allow architectures to override optinsn page alloca=
tion
    include/linux/kprobes.h
    kernel/kprobes.c

cheers


The following changes since commit d07f6ca923ea0927a1024dfccafc5b53b61cfecc:

  Linux 5.13-rc2 (2021-05-16 15:27:44 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.14-1

for you to fetch changes up to 4ebbbaa4ce8524b853dd6febf0176a6efa3482d7:

  powerpc: Only build restart_table.c for 64s (2021-07-01 22:50:54 +1000)

- ------------------------------------------------------------------
powerpc updates for 5.14

 - A big series refactoring parts of our KVM code, and converting some to C.

 - Support for ARCH_HAS_SET_MEMORY, and ARCH_HAS_STRICT_MODULE_RWX on some =
CPUs.

 - Support for the Microwatt soft-core.

 - Optimisations to our interrupt return path on 64-bit.

 - Support for userspace access to the NX GZIP accelerator on PowerVM on Po=
wer10.

 - Enable KUAP and KUEP by default on 32-bit Book3S CPUs.

 - Other smaller features, fixes & cleanups.

Thanks to: Andy Shevchenko, Aneesh Kumar K.V, Arnd Bergmann, Athira Rajeev,=
 Baokun Li,
Benjamin Herrenschmidt, Bharata B Rao, Christophe Leroy, Daniel Axtens, Dan=
iel Henrique
Barboza, Finn Thain, Geoff Levand, Haren Myneni, Jason Wang, Jiapeng Chong,=
 Joel Stanley,
Jordan Niethe, Kajol Jain, Nathan Chancellor, Nathan Lynch, Naveen N. Rao, =
Nicholas
Piggin, Nick Desaulniers, Paul Mackerras, Russell Currey, Sathvika Vasiredd=
y, Shaokun
Zhang, Stephen Rothwell, Sudeep Holla, Suraj Jitindar Singh, Tom Rix, Vaibh=
av Jain,
YueHaibing, Zhang Jianhua, Zhen Lei.

- ------------------------------------------------------------------
Andy Shevchenko (2):
      powerpc/prom_init: Move custom isspace() to its own namespace
      powerpc/papr_scm: Properly handle UUID types and API

Aneesh Kumar K.V (1):
      powerpc/mm/book3s64: Fix possible build error

Arnd Bergmann (1):
      powerpc: mark local variables around longjmp as volatile

Athira Rajeev (2):
      selftests/powerpc: Fix "no_handler" EBB selftest
      selftests/powerpc: EBB selftest for MMCR0 control for PMU SPRs in ISA=
 v3.1

Baokun Li (2):
      powerpc/spufs: Remove set but not used variable 'dummy'
      powerpc/spider-pci: Remove set but not used variable 'val'

Benjamin Herrenschmidt (4):
      powerpc/microwatt: Populate platform bus from device-tree
      powerpc/xics: Add a native ICS backend for microwatt
      powerpc/microwatt: Use standard 16550 UART for console
      powerpc/boot: Fixup device-tree on little endian

Christophe Leroy (92):
      powerpc/32s: Remove m8260_gorom()
      powerpc/asm-offset: Remove unused items
      powerpc/paca: Remove mm_ctx_id and mm_ctx_slb_addr_limit
      powerpc/8xx: Update mpc885_ads_defconfig to improve CI
      powerpc: Define NR_CPUS all the time
      powerpc/603: Avoid a pile of NOPs when not using SW LRU in TLB except=
ions
      powerpc/mmu: Don't duplicate radix_enabled()
      powerpc/mmu: Remove leftover CONFIG_E200
      powerpc/32s: Speed up likely path of kuap_update_sr()
      powerpc: Only pad struct pt_regs when needed
      powerpc/32s: Remove asm/book3s/32/hash.h
      kprobes: Allow architectures to override optinsn page allocation
      powerpc/kprobes: Replace ppc_optinsn by common optinsn
      powerpc/perf: Simplify Makefile
      powerpc: Force inlining of csum_add()
      powerpc: Don't handle ALTIVEC/SPE in ASM in _switch(). Do it in C.
      powerpc: Rework PPC_RAW_xxx() macros for prefixed instructions
      powerpc/opcodes: Add shorter macros for registers for use with PPC_RA=
W_xx()
      powerpc/lib/code-patching: Use PPC_RAW_() macros
      powerpc/signal: Use PPC_RAW_xx() macros
      powerpc/modules: Use PPC_RAW_xx() macros
      powerpc/security: Use PPC_RAW_BLR() and PPC_RAW_NOP()
      powerpc/ftrace: Use PPC_RAW_MFLR() and PPC_RAW_NOP()
      powerpc/ebpf64: Use PPC_RAW_MFLR()
      powerpc/ebpf32: Use _Rx macros instead of __REG_Rx ones
      powerpc/lib/feature-fixups: Use PPC_RAW_xxx() macros
      powerpc/traps: Start using PPC_RAW_xx() macros
      powerpc: Replace PPC_INST_NOP by PPC_RAW_NOP()
      powerpc/inst: Fix sparse detection on get_user_instr()
      powerpc/inst: Reduce casts in get_user_instr()
      powerpc/inst: Improve readability of get_user_instr() and friends
      powerpc/inst: Avoid pointer dereferencing in ppc_inst_equal()
      powerpc: Do not dereference code as 'struct ppc_inst' (uprobe, code-p=
atching, feature-fixups)
      powerpc/lib/code-patching: Make instr_is_branch_to_addr() static
      powerpc/lib/code-patching: Don't use struct 'ppc_inst' for runnable c=
ode in tests.
      powerpc: Don't use 'struct ppc_inst' to reference instruction location
      powerpc/inst: Refactor PPC32 and PPC64 versions
      powerpc/optprobes: Minimise casts
      powerpc/optprobes: Compact code source a bit.
      powerpc/optprobes: use PPC_RAW_ macros
      powerpc: Remove CONFIG_PPC_MMU_NOHASH_32
      powerpc/44x: Implement Kernel Userspace Exec Protection (KUEP)
      powerpc/8xx: Allow disabling KUAP at boot time
      powerpc/32s: Move setup_{kuep/kuap}() into {kuep/kuap}.c
      powerpc/32s: Refactor update of user segment registers
      powerpc/32s: move CTX_TO_VSID() into mmu-hash.h
      powerpc/32s: Convert switch_mmu_context() to C
      powerpc/32s: Simplify calculation of segment register content
      powerpc/32s: Initialise KUAP and KUEP in C
      powerpc/32s: Allow disabling KUEP at boot time
      powerpc/32s: Allow disabling KUAP at boot time
      powerpc/32s: Rework Kernel Userspace Access Protection
      powerpc/32s: Activate KUAP and KUEP by default
      powerpc/kuap: Remove KUAP_CURRENT_XXX
      powerpc/kuap: Remove to/from/size parameters of prevent_user_access()
      powerpc/kuap: Force inlining of all first level KUAP helpers.
      powerpc/nohash: Refactor update of BDI2000 pointers in switch_mmu_con=
text()
      powerpc/nohash: Convert set_context() to C
      powerpc/nohash: Remove CONFIG_SMP #ifdefery in mmu_context.h
      powerpc/nohash: Remove DEBUG_MAP_CONSISTENCY
      powerpc/nohash: Remove DEBUG_CLAMP_LAST_CONTEXT
      powerpc/nohash: Remove DEBUG_HARDER
      powerpc/selftests: Use gettid() instead of getppid() for null_syscall
      powerpc: Define empty_zero_page[] in C
      powerpc: Define swapper_pg_dir[] in C
      powerpc/32s: Rename PTE_SIZE to PTE_T_SIZE
      powerpc/32: Remove __main()
      powerpc: Remove proc_trap()
      powerpc: Move update_power8_hid0() into its only user
      powerpc/32: Display modules range in virtual memory layout
      powerpc/signal32: Remove impossible #ifdef combinations
      powerpc/mm: implement set_memory_attr()
      powerpc/32: use set_memory_attr()
      powerpc/interrupt: Fix CONFIG ifdef typo
      powerpc/interrupt: Rename and lightly change syscall_exit_prepare_mai=
n()
      powerpc/interrupt: Refactor interrupt_exit_user_prepare()
      powerpc/interrupt: Interchange prep_irq_for_{kernel_enabled/user}_exi=
t()
      powerpc/interrupt: Refactor prep_irq_for_{user/kernel_enabled}_exit()
      powerpc/interrupt: Remove prep_irq_for_user_exit()
      powerpc/mm: Leave a gap between early allocated IO areas
      powerpc/mm: Properly coalesce pages in ptdump
      powerpc: Remove klimit
      powerpc/32: Interchange r10 and r12 in SYSCALL_ENTRY on non booke
      powerpc/32: Interchange r1 and r11 in SYSCALL_ENTRY on booke
      powerpc/32: Reduce code duplication of system call entry
      powerpc/32: Avoid #ifdef nested with FTR_SECTION on booke syscall ent=
ry
      powerpc/ptrace: Move set_return_regs_changed() before regs_set_return=
_{msr/ip}
      powerpc/ptrace: Refactor regs_set_return_{msr/ip}
      powerpc/interrupt: Also use exit_must_hard_disable() on PPC32
      powerpc/interrupt: Use names in check_return_regs_valid()
      powerpc/32s: Fix setup_{kuap/kuep}() on SMP
      powerpc/4xx: Fix setup_kuep() on SMP

Daniel Axtens (1):
      powerpc: make stack walking KASAN-safe

Daniel Henrique Barboza (7):
      powerpc/pseries: Set UNISOLATE on dlpar_memory_remove_by_ic() error
      powerpc/pseries: check DRCONF_MEM_RESERVED in lmb_is_removable()
      powerpc/pseries: break early in dlpar_memory_remove_by_count() loops
      powerpc/pseries: minor enhancements in dlpar_memory_remove_by_ic()
      powerpc/pseries: skip reserved LMBs in dlpar_memory_add_by_count()
      powerpc/pseries: break early in dlpar_memory_add_by_count() loops
      powerpc/pseries: fail quicker in dlpar_memory_add_by_ic()

Finn Thain (1):
      powerpc/tau: Remove superfluous parameter in alloc_workqueue() call

Geoff Levand (5):
      powerpc/ps3: Add firmware version to sysfs
      powerpc/ps3: Re-align DTB in image
      powerpc/ps3: Add CONFIG_PS3_VERBOSE_RESULT option
      powerpc/ps3: Warn on PS3 device errors
      powerpc/ps3: Add dma_mask to ps3_dma_region

Haren Myneni (18):
      powerpc/powernv/vas: Release reference to tgid during window close
      powerpc/vas: Move VAS API to book3s common platform
      powerpc/powernv/vas: Rename register/unregister functions
      powerpc/vas: Add platform specific user window operations
      powerpc/vas: Create take/drop pid and mm reference functions
      powerpc/vas: Move update_csb/dump_crb to common book3s platform
      powerpc/vas: Define and use common vas_window struct
      powerpc/pseries/vas: Define VAS/NXGZIP hcalls and structs
      powerpc/vas: Define QoS credit flag to allocate window
      powerpc/pseries/vas: Add hcall wrappers for VAS handling
      powerpc/pseries/vas: Implement getting capabilities from hypervisor
      powerpc/pseries/vas: Integrate API with open/close windows
      powerpc/pseries/vas: Setup IRQ and fault handling
      crypto/nx: Rename nx-842-pseries file name to nx-common-pseries
      crypto/nx: Get NX capabilities for GZIP coprocessor type
      crypto/nx: Add sysfs interface to export NX capabilities
      crypto/nx: Register and unregister VAS interface on PowerVM
      selftests/powerpc: Use req_max_processed_len from sysfs NX capabiliti=
es

Jason Wang (1):
      powerpc/sysfs: Replace sizeof(arr)/sizeof(arr[0]) with ARRAY_SIZE

Jiapeng Chong (1):
      selftests/powerpc: Fix duplicate included pthread.h

Joel Stanley (1):
      powerpc/boot: Add a boot wrapper for Microwatt

Jordan Niethe (4):
      powerpc/lib/code-patching: Set up Strict RWX patching earlier
      powerpc/modules: Make module_alloc() Strict Module RWX aware
      powerpc/bpf: Remove bpf_jit_free()
      powerpc/bpf: Write protect JIT code

Kajol Jain (1):
      powerpc/papr_scm: trivial: fix typo in a comment

Michael Ellerman (14):
      selftests/powerpc: Add test of mitigation patching
      powerpc/Makefile: Add ppc32/ppc64_randconfig targets
      Merge branch 'fixes' into next
      powerpc/signal64: Don't read sigaction arguments back from user memory
      Merge branch 'topic/ppc-kvm' into next
      Merge branch 'topic/ppc-kvm' into next
      powerpc/64s: Fix boot failure with 4K Radix
      powerpc/prom_init: Convert prom_strcpy() into prom_strscpy_pad()
      powerpc/prom_init: Pass linux_banner to firmware via option vector 7
      powerpc/64s: Make prom_init require RELOCATABLE
      powerpc: Fix is_kvm_guest() / kvm_para_available()
      powerpc/pseries/vas: Include irqdomain.h
      powerpc/stacktrace: Fix spurious "stale" traces in raise_backtrace_ip=
i()
      powerpc: Only build restart_table.c for 64s

Nathan Chancellor (1):
      powerpc/barrier: Avoid collision with clang's __lwsync macro

Nathan Lynch (4):
      powerpc/xmon: make dumping log buffer contents more reliable
      tty: hvc: udbg_hvc: retry putc on -EAGAIN
      powerpc/rtas-rtc: remove unused constant
      powerpc/pseries/dlpar: use rtas_get_sensor()

Naveen N. Rao (6):
      powerpc/kprobes: Fix Oops by passing ppc_inst as a pointer to emulate=
_step() on ppc32
      powerpc/kprobes: Roll IS_RFI() macro into IS_RFID()
      powerpc/kprobes: Warn if instruction patching failed
      powerpc/configs: Enable STACK_TRACER and FTRACE_SYSCALLS in some of t=
he configs
      powerpc/xmon: Add support for running a command on all cpus in xmon
      powerpc/bpf: Use bctrl for making function calls

Nicholas Piggin (30):
      powerpc/powernv: Fix machine check reporting of async store errors
      powerpc/boot: add zImage.lds to targets
      powerpc/pseries: Get entry and uaccess flush required bits from H_GET=
_CPU_CHARACTERISTICS
      powerpc/security: Add a security feature for STF barrier
      powerpc/pesries: Get STF barrier requirement from H_GET_CPU_CHARACTER=
ISTICS
      powerpc: remove interrupt exit helpers unused argument
      powerpc/64s: introduce different functions to return from SRR vs HSRR=
 interrupts
      powerpc/64s: avoid reloading (H)SRR registers if they are still valid
      powerpc/64: move interrupt return asm to interrupt_64.S
      powerpc/64s: system call avoid setting MSR[RI] until we set MSR[EE]
      powerpc/64s: save one more register in the masked interrupt handler
      powerpc/64: allow alternate return locations for soft-masked interrup=
ts
      powerpc/64: interrupt soft-enable race fix
      powerpc/64: treat low kernel text as irqs soft-masked
      powerpc/64: use interrupt restart table to speed up return from inter=
rupt
      powerpc/64s/interrupt: Check and fix srr_valid without crashing
      powerpc/pseries: Enable hardlockup watchdog for PowerVM partitions
      powerpc/64s: Remove irq mask workaround in accumulate_stolen_time()
      powerpc: Make PPC_IRQ_SOFT_MASK_DEBUG depend on PPC64
      powerpc: Offline CPU in stop_this_cpu()
      powerpc/64s: Fix copy-paste data exposure into newly created tasks
      powerpc/64s: fix hash page fault interrupt handler
      powerpc/64e: fix CONFIG_RELOCATABLE build warnings
      powerpc/64e: remove implicit soft-masking and interrupt exit restart =
logic
      powerpc/64s: add a table of implicit soft-masked addresses
      powerpc/64s/interrupt: preserve regs->softe for NMI interrupts
      powerpc/64: enable MSR[EE] in irq replay pt_regs
      powerpc/64/interrupt: add missing kprobe annotations on interrupt exi=
t symbols
      powerpc/64s/interrupt: clean up interrupt return labels
      powerpc/64s: move ret_from_fork etc above __end_soft_masked

Nick Desaulniers (2):
      powerpc/powernv/pci: fix header guard
      powerpc: Kconfig: disable CONFIG_COMPAT for clang < 12

Paul Mackerras (5):
      powerpc: Add Microwatt platform
      powerpc: Add Microwatt device tree
      powerpc/microwatt: Add support for hardware random number generator
      powerpc/microwatt: Add microwatt_defconfig
      powerpc/pmu: Make the generic compat PMU use the architected events

Russell Currey (3):
      powerpc/mm: Implement set_memory() routines
      powerpc/kprobes: Mark newly allocated probes as ROX
      powerpc: Set ARCH_HAS_STRICT_MODULE_RWX

Sathvika Vasireddy (2):
      powerpc/sstep: Add emulation support for =E2=80=98setb=E2=80=99 instr=
uction
      powerpc/sstep: Add tests for setb instruction

Shaokun Zhang (1):
      selftests/powerpc: Remove the repeated declaration

Sudeep Holla (2):
      powerpc/64: drop redundant defination of spin_until_cond
      powerpc/watchdog: include linux/processor.h for spin_until_cond

Tom Rix (1):
      powerpc/52xx: Add fallthrough in mpc52xx_wdt_ioctl()

Vaibhav Jain (3):
      powerpc/papr_scm: Reduce error severity if nvdimm stats inaccessible
      powerpc/papr_scm: Make 'perf_stats' invisible if perf-stats unavailab=
le
      powerpc/papr_scm: Add support for reporting dirty-shutdown-count

YueHaibing (1):
      powerpc/pseries/memhotplug: Remove unused inline function dlpar_memor=
y_remove()

Zhang Jianhua (1):
      powerpc/boot: Fix a typo in partial_decompress() comment

Zhen Lei (1):
      powerpc/pseries/ras: Delete a redundant condition branch


 Documentation/ABI/testing/sysfs-bus-papr-pmem                      |   8 +-
 arch/powerpc/Kconfig                                               |   6 +-
 arch/powerpc/Kconfig.debug                                         |   5 +
 arch/powerpc/Makefile                                              |  10 +
 arch/powerpc/boot/Makefile                                         |   6 +-
 arch/powerpc/boot/decompress.c                                     |   4 +-
 arch/powerpc/boot/devtree.c                                        |  59 +-
 arch/powerpc/boot/dts/microwatt.dts                                | 138 +=
+++
 arch/powerpc/boot/microwatt.c                                      |  24 +
 arch/powerpc/boot/ns16550.c                                        |   9 +-
 arch/powerpc/boot/wrapper                                          |   5 +
 arch/powerpc/boot/zImage.ps3.lds.S                                 |   2 +-
 arch/powerpc/configs/32-bit.config                                 |   1 +
 arch/powerpc/configs/64-bit.config                                 |   1 +
 arch/powerpc/configs/microwatt_defconfig                           |  98 +=
++
 arch/powerpc/configs/mpc885_ads_defconfig                          |  25 +
 arch/powerpc/configs/powernv_defconfig                             |   1 +
 arch/powerpc/configs/ppc64_defconfig                               |   2 +
 arch/powerpc/configs/pseries_defconfig                             |   2 +
 arch/powerpc/include/asm/asm-prototypes.h                          |   9 +-
 arch/powerpc/include/asm/barrier.h                                 |   2 +
 arch/powerpc/include/asm/book3s/32/hash.h                          |  45 --
 arch/powerpc/include/asm/book3s/32/kup.h                           | 195 +=
++--
 arch/powerpc/include/asm/book3s/32/mmu-hash.h                      |  41 ++
 arch/powerpc/include/asm/book3s/32/pgtable.h                       |  38 +-
 arch/powerpc/include/asm/book3s/64/kup.h                           |   3 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h                       |   3 +
 arch/powerpc/include/asm/checksum.h                                |   2 +-
 arch/powerpc/include/asm/code-patching.h                           |  34 +-
 arch/powerpc/include/asm/head-64.h                                 |   2 +-
 arch/powerpc/include/asm/hvcall.h                                  |  10 +
 arch/powerpc/include/asm/hw_irq.h                                  |  23 +-
 arch/powerpc/include/asm/inst.h                                    |  94 +=
--
 arch/powerpc/include/asm/interrupt.h                               |  67 +-
 arch/powerpc/include/asm/kup.h                                     |  50 +-
 arch/powerpc/include/asm/kvm_guest.h                               |   4 +-
 arch/powerpc/include/asm/livepatch.h                               |   2 +-
 arch/powerpc/include/asm/mmu.h                                     |  19 +-
 arch/powerpc/include/asm/mmu_context.h                             |   1 -
 arch/powerpc/include/asm/nohash/32/kup-8xx.h                       |  46 +-
 arch/powerpc/include/asm/nohash/32/mmu-44x.h                       |   1 +
 arch/powerpc/include/asm/paca.h                                    |   9 +-
 arch/powerpc/include/asm/pgtable.h                                 |   5 +
 arch/powerpc/include/asm/ppc-opcode.h                              |  84 +=
+-
 arch/powerpc/include/asm/ppc_asm.h                                 |  15 +
 arch/powerpc/include/asm/probes.h                                  |   4 +-
 arch/powerpc/include/asm/processor.h                               |  21 +-
 arch/powerpc/include/asm/ps3.h                                     |   4 +-
 arch/powerpc/include/asm/ptrace.h                                  |  50 +-
 arch/powerpc/include/asm/reg.h                                     |  13 +-
 arch/powerpc/include/asm/security_features.h                       |   4 +
 arch/powerpc/include/asm/set_memory.h                              |  34 +
 arch/powerpc/include/asm/setup.h                                   |   1 -
 arch/powerpc/include/asm/sstep.h                                   |   7 +-
 arch/powerpc/include/asm/uprobes.h                                 |   4 +-
 arch/powerpc/include/asm/vas.h                                     | 109 +=
+-
 arch/powerpc/include/asm/xics.h                                    |   4 +
 arch/powerpc/include/uapi/asm/papr_pdsm.h                          |   6 +
 arch/powerpc/include/uapi/asm/vas-api.h                            |   6 +-
 arch/powerpc/kernel/asm-offsets.c                                  |  73 +-
 arch/powerpc/kernel/crash_dump.c                                   |   6 +-
 arch/powerpc/kernel/entry_32.S                                     |  54 +-
 arch/powerpc/kernel/entry_64.S                                     | 516 -=
------------
 arch/powerpc/kernel/epapr_paravirt.c                               |   4 +-
 arch/powerpc/kernel/exceptions-64e.S                               |  52 +-
 arch/powerpc/kernel/exceptions-64s.S                               | 251 +=
++++--
 arch/powerpc/kernel/firmware.c                                     |  10 +-
 arch/powerpc/kernel/fpu.S                                          |   4 +
 arch/powerpc/kernel/head_32.h                                      |  41 +-
 arch/powerpc/kernel/head_40x.S                                     |  36 -
 arch/powerpc/kernel/head_44x.S                                     |  50 +-
 arch/powerpc/kernel/head_64.S                                      |  25 +-
 arch/powerpc/kernel/head_8xx.S                                     |  25 -
 arch/powerpc/kernel/head_book3s_32.S                               | 139 +=
---
 arch/powerpc/kernel/head_booke.h                                   |  31 +-
 arch/powerpc/kernel/head_fsl_booke.S                               |  37 -
 arch/powerpc/kernel/hw_breakpoint.c                                |   4 +-
 arch/powerpc/kernel/interrupt.c                                    | 484 +=
++++++-----
 arch/powerpc/kernel/interrupt_64.S                                 | 770 +=
+++++++++++++++++++
 arch/powerpc/kernel/irq.c                                          |  96 +=
++
 arch/powerpc/kernel/jump_label.c                                   |   4 +-
 arch/powerpc/kernel/kgdb.c                                         |  19 +-
 arch/powerpc/kernel/kprobes-ftrace.c                               |   4 +-
 arch/powerpc/kernel/kprobes.c                                      |  61 +-
 arch/powerpc/kernel/mce.c                                          |   2 +-
 arch/powerpc/kernel/mce_power.c                                    |  50 +-
 arch/powerpc/kernel/misc_32.S                                      |   6 -
 arch/powerpc/kernel/module.c                                       |   4 +-
 arch/powerpc/kernel/module_32.c                                    |  19 +-
 arch/powerpc/kernel/module_64.c                                    |  55 +-
 arch/powerpc/kernel/optprobes.c                                    | 155 +=
+--
 arch/powerpc/kernel/paca.c                                         |   2 -
 arch/powerpc/kernel/process.c                                      | 107 +=
+-
 arch/powerpc/kernel/prom.c                                         |   2 +-
 arch/powerpc/kernel/prom_init.c                                    | 121 +=
+-
 arch/powerpc/kernel/ptrace/ptrace-adv.c                            |  20 +-
 arch/powerpc/kernel/ptrace/ptrace-noadv.c                          |  14 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c                           |   5 +-
 arch/powerpc/kernel/rtas-rtc.c                                     |   2 +-
 arch/powerpc/kernel/rtas.c                                         |  14 +-
 arch/powerpc/kernel/security.c                                     |  21 +-
 arch/powerpc/kernel/setup-common.c                                 |   4 +-
 arch/powerpc/kernel/setup_32.c                                     |   4 +-
 arch/powerpc/kernel/setup_64.c                                     |  13 +-
 arch/powerpc/kernel/signal.c                                       |  12 +-
 arch/powerpc/kernel/signal_32.c                                    | 106 +=
--
 arch/powerpc/kernel/signal_64.c                                    |  49 +-
 arch/powerpc/kernel/smp.c                                          |  15 +
 arch/powerpc/kernel/stacktrace.c                                   |  34 +-
 arch/powerpc/kernel/syscalls.c                                     |   3 +-
 arch/powerpc/kernel/sysfs.c                                        |  12 +-
 arch/powerpc/kernel/tau_6xx.c                                      |   2 +-
 arch/powerpc/kernel/time.c                                         |  11 -
 arch/powerpc/kernel/trace/ftrace.c                                 |  51 +-
 arch/powerpc/kernel/traps.c                                        |  49 +-
 arch/powerpc/kernel/udbg_16550.c                                   |  39 +
 arch/powerpc/kernel/uprobes.c                                      |   8 +-
 arch/powerpc/kernel/vector.S                                       |   8 +-
 arch/powerpc/kernel/vmlinux.lds.S                                  |  19 +
 arch/powerpc/kernel/watchdog.c                                     |   1 +
 arch/powerpc/kexec/crash.c                                         |   4 +-
 arch/powerpc/kvm/book3s_32_mmu_host.c                              |   3 -
 arch/powerpc/kvm/book3s_hv.c                                       |   3 +
 arch/powerpc/kvm/book3s_pr.c                                       |   2 +
 arch/powerpc/lib/Makefile                                          |   2 +-
 arch/powerpc/lib/code-patching.c                                   | 178 +=
+---
 arch/powerpc/lib/error-inject.c                                    |   2 +-
 arch/powerpc/lib/feature-fixups.c                                  | 266 +=
+++---
 arch/powerpc/lib/restart_table.c                                   |  56 ++
 arch/powerpc/lib/sstep.c                                           |  39 +-
 arch/powerpc/lib/test_emulate_step.c                               |  38 +-
 arch/powerpc/math-emu/math.c                                       |   2 +-
 arch/powerpc/math-emu/math_efp.c                                   |   2 +-
 arch/powerpc/mm/Makefile                                           |   2 +-
 arch/powerpc/mm/book3s32/Makefile                                  |   1 +
 arch/powerpc/mm/book3s32/hash_low.S                                |   6 +-
 arch/powerpc/mm/book3s32/kuap.c                                    |  33 +
 arch/powerpc/mm/book3s32/kuep.c                                    |  42 +-
 arch/powerpc/mm/book3s32/mmu.c                                     |  20 -
 arch/powerpc/mm/book3s32/mmu_context.c                             |  48 +-
 arch/powerpc/mm/book3s64/hash_utils.c                              |  24 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                               |  26 +-
 arch/powerpc/mm/ioremap_32.c                                       |   4 +-
 arch/powerpc/mm/ioremap_64.c                                       |   2 +-
 arch/powerpc/mm/maccess.c                                          |   4 +-
 arch/powerpc/mm/mem.c                                              |   7 +
 arch/powerpc/mm/nohash/44x.c                                       |  17 +
 arch/powerpc/mm/nohash/8xx.c                                       |  42 +-
 arch/powerpc/mm/nohash/mmu_context.c                               | 173 +=
+---
 arch/powerpc/mm/nohash/tlb_low.S                                   |  13 -
 arch/powerpc/mm/pageattr.c                                         | 134 +=
+++
 arch/powerpc/mm/pgtable.c                                          |   8 +
 arch/powerpc/mm/pgtable_32.c                                       |  60 +-
 arch/powerpc/mm/ptdump/ptdump.c                                    |  22 +-
 arch/powerpc/net/bpf_jit_comp.c                                    |  13 +-
 arch/powerpc/net/bpf_jit_comp32.c                                  | 220 +=
++---
 arch/powerpc/net/bpf_jit_comp64.c                                  |  14 +-
 arch/powerpc/perf/Makefile                                         |   6 +-
 arch/powerpc/perf/callchain.c                                      |   2 +-
 arch/powerpc/perf/core-book3s.c                                    |   4 +-
 arch/powerpc/perf/generic-compat-pmu.c                             | 170 +=
+++-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c                          |   1 +
 arch/powerpc/platforms/86xx/mpc86xx_smp.c                          |   4 +-
 arch/powerpc/platforms/Kconfig                                     |   3 +
 arch/powerpc/platforms/Kconfig.cputype                             |  15 +-
 arch/powerpc/platforms/Makefile                                    |   2 +
 arch/powerpc/platforms/book3s/Kconfig                              |  15 +
 arch/powerpc/platforms/book3s/Makefile                             |   2 +
 arch/powerpc/platforms/book3s/vas-api.c                            | 493 +=
++++++++++++
 arch/powerpc/platforms/cell/spider-pci.c                           |   3 +-
 arch/powerpc/platforms/cell/spufs/switch.c                         |   6 +-
 arch/powerpc/platforms/embedded6xx/holly.c                         |   4 +-
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c                  |   4 +-
 arch/powerpc/platforms/microwatt/Kconfig                           |  13 +
 arch/powerpc/platforms/microwatt/Makefile                          |   1 +
 arch/powerpc/platforms/microwatt/rng.c                             |  48 ++
 arch/powerpc/platforms/microwatt/setup.c                           |  41 ++
 arch/powerpc/platforms/pasemi/idle.c                               |   4 +-
 arch/powerpc/platforms/powermac/bootx_init.c                       |   2 +-
 arch/powerpc/platforms/powermac/smp.c                              |   4 +-
 arch/powerpc/platforms/powernv/Kconfig                             |  14 -
 arch/powerpc/platforms/powernv/Makefile                            |   2 +-
 arch/powerpc/platforms/powernv/opal-call.c                         |   4 +
 arch/powerpc/platforms/powernv/opal.c                              |   2 +-
 arch/powerpc/platforms/powernv/pci.c                               |   2 +-
 arch/powerpc/platforms/powernv/subcore.c                           |  10 +
 arch/powerpc/platforms/powernv/vas-api.c                           | 278 -=
------
 arch/powerpc/platforms/powernv/vas-debug.c                         |  27 +-
 arch/powerpc/platforms/powernv/vas-fault.c                         | 173 +=
----
 arch/powerpc/platforms/powernv/vas-trace.h                         |   4 +-
 arch/powerpc/platforms/powernv/vas-window.c                        | 264 +=
+++---
 arch/powerpc/platforms/powernv/vas.h                               |  50 +-
 arch/powerpc/platforms/ps3/Kconfig                                 |   9 +
 arch/powerpc/platforms/ps3/mm.c                                    |  12 +
 arch/powerpc/platforms/ps3/setup.c                                 |  43 +-
 arch/powerpc/platforms/ps3/system-bus.c                            |   9 +-
 arch/powerpc/platforms/pseries/Makefile                            |   1 +
 arch/powerpc/platforms/pseries/dlpar.c                             |   9 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c                    |  92 +=
+-
 arch/powerpc/platforms/pseries/hvCall.S                            |  29 +
 arch/powerpc/platforms/pseries/papr_scm.c                          | 101 +=
+-
 arch/powerpc/platforms/pseries/ras.c                               |   6 +-
 arch/powerpc/platforms/pseries/setup.c                             |   9 +
 arch/powerpc/platforms/pseries/smp.c                               |   4 +-
 arch/powerpc/platforms/pseries/vas.c                               | 595 +=
++++++++++++++
 arch/powerpc/platforms/pseries/vas.h                               | 125 +=
+++
 arch/powerpc/sysdev/fsl_pci.c                                      |   2 +-
 arch/powerpc/sysdev/fsl_rio.c                                      |   4 +-
 arch/powerpc/sysdev/xics/Kconfig                                   |   3 +
 arch/powerpc/sysdev/xics/Makefile                                  |   1 +
 arch/powerpc/sysdev/xics/ics-native.c                              | 257 +=
++++++
 arch/powerpc/sysdev/xics/xics-common.c                             |   2 +
 arch/powerpc/xmon/xmon.c                                           | 196 +=
++--
 drivers/crypto/nx/Kconfig                                          |   1 +
 drivers/crypto/nx/Makefile                                         |   2 +-
 drivers/crypto/nx/nx-common-powernv.c                              |   6 +-
 drivers/crypto/nx/{nx-842-pseries.c =3D> nx-common-pseries.c}        | 138=
 ++++
 drivers/ps3/ps3-vuart.c                                            |   2 +-
 drivers/ps3/ps3av.c                                                |  22 +-
 drivers/tty/hvc/hvc_vio.c                                          |   2 +-
 include/linux/kprobes.h                                            |   3 +
 kernel/kprobes.c                                                   |  14 +-
 tools/testing/selftests/powerpc/benchmarks/null_syscall.c          |   3 +-
 tools/testing/selftests/powerpc/nx-gzip/Makefile                   |   4 +-
 tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c               |  17 +-
 tools/testing/selftests/powerpc/pmu/ebb/Makefile                   |   2 +-
 tools/testing/selftests/powerpc/pmu/ebb/ebb.h                      |   2 -
 tools/testing/selftests/powerpc/pmu/ebb/no_handler_test.c          |   2 -
 tools/testing/selftests/powerpc/pmu/ebb/regs_access_pmccext_test.c |  63 ++
 tools/testing/selftests/powerpc/security/Makefile                  |   2 +
 tools/testing/selftests/powerpc/security/mitigation-patching.sh    |  75 ++
 tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c                |   1 -
 232 files changed, 6749 insertions(+), 3642 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/microwatt.dts
 create mode 100644 arch/powerpc/boot/microwatt.c
 create mode 100644 arch/powerpc/configs/32-bit.config
 create mode 100644 arch/powerpc/configs/64-bit.config
 create mode 100644 arch/powerpc/configs/microwatt_defconfig
 delete mode 100644 arch/powerpc/include/asm/book3s/32/hash.h
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/kernel/interrupt_64.S
 create mode 100644 arch/powerpc/lib/restart_table.c
 create mode 100644 arch/powerpc/mm/book3s32/kuap.c
 create mode 100644 arch/powerpc/mm/pageattr.c
 create mode 100644 arch/powerpc/platforms/book3s/Kconfig
 create mode 100644 arch/powerpc/platforms/book3s/Makefile
 create mode 100644 arch/powerpc/platforms/book3s/vas-api.c
 create mode 100644 arch/powerpc/platforms/microwatt/Kconfig
 create mode 100644 arch/powerpc/platforms/microwatt/Makefile
 create mode 100644 arch/powerpc/platforms/microwatt/rng.c
 create mode 100644 arch/powerpc/platforms/microwatt/setup.c
 delete mode 100644 arch/powerpc/platforms/powernv/vas-api.c
 create mode 100644 arch/powerpc/platforms/pseries/vas.c
 create mode 100644 arch/powerpc/platforms/pseries/vas.h
 create mode 100644 arch/powerpc/sysdev/xics/ics-native.c
 rename drivers/crypto/nx/{nx-842-pseries.c =3D> nx-common-pseries.c} (90%)
 create mode 100644 tools/testing/selftests/powerpc/pmu/ebb/regs_access_pmc=
cext_test.c
 create mode 100755 tools/testing/selftests/powerpc/security/mitigation-pat=
ching.sh
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmDfHpgACgkQUevqPMjh
pYCrPw//XxIsyAekFzpUDKLrff6yhRD3qJEgGeeRg3MvSSBItpzxDYhUsrGt+bsx
3BEuzEzV9Leudt+b7oyfbKcC9ebskCa+R2u7AXkw1vIC2Yr5l16rwOQo5+HRd3ZH
YoaMkJfVhqgIXLr4UNX8KVAGNcNu24iwwZJgW1I7wbiwngArG0X2zHymY+fzsNLs
6j7RIXLA32kkuT9l2j3+jw8PxYgVHzoAwXRCwHux/B/hgxUQdO3/1n5g1kxZ2oDk
4Kkgy7oetKoQ+qOx2IbXeJKyE2uu89CV1+tKAXCRPV/QxebIwZEPQZSt3+F488Am
ypxtJfK5aqNleoQZbZsk43fIv4A3Pzkf9xkVp28wur3wtkIWf7eRg5ABFshvm4JE
AZGlclpQBQ6JnfxPMXzeQQzSWwdXNoglB5w3KvaP8Wovki4dmPE4D30lWswAyHDU
Mo+GzuEhJD/5JGBfEnEooDM7SKuEhXjvcldxBUF1g4ogBGWJepobcSdDUbEsOXK/
2EphtFZxI/uNYcytqOa4LfGlsYhLrSdSjCtvxJ4zhah0DruQEaidAqRqW9qI00Yc
vTN4ANocC1W1iaDYD4E/2KQO4x0lLzgVnE9JL/OrYkgnTNlJCenSGV5ScrqXFgoC
6u+IYkKsN6AbCz4n1R7qKwPugm+Ht40XbX1NS0/v2Y/u9xuud9w=3D
=3DxE6f
-----END PGP SIGNATURE-----
