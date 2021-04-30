Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C5B36F4C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 06:12:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWf8r0w5Zz30Dl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 14:12:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TytfwU3Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TytfwU3Y; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWdxs4Y83z2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 14:02:56 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FWdxR2QzDz9sjD;
 Fri, 30 Apr 2021 14:02:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1619755369;
 bh=lzAJa+xj6psHUyAuVdAzCmUO5WDu6S7MRp5hu0h+aS4=;
 h=From:To:Cc:Subject:Date:From;
 b=TytfwU3YXIE3yDzdEo2lcGv/Xj0VG9utZTypDMNfPYGJiB0nivYrKehZU+bIafAh1
 +28G71Z8QqDrwq58/CmuvrESJhVub+kZKg6yQM78Wr0Jx2bTcH6aRSHpwVDmr9eiSl
 GIXTFesNJVN4/1WUL3Z9N4g7tsTl51p1dMjWQIfzxlahE74BbWbH3YzbmtP1VW5KRI
 ayAkg/NjjjxD5r1Jc3tf1TuFCIb+USQu2aIPSiYcbOYMwbfyyBO7HZuAVU4a7Bg53J
 vmh/TOPRx61ddvNbxr896dQnYndHn4j7oAk0Cin0LpHy9IQ2AVZXcIGOaTkUQNprUB
 +kSITihxacIyQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.13-1 tag
Date: Fri, 30 Apr 2021 14:02:32 +1000
Message-ID: <87im44a087.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 30 Apr 2021 14:12:03 +1000
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
Cc: cascardo@canonical.com, tony.ambardar@gmail.com, srikar@linux.vnet.ibm.com,
 sbhat@linux.ibm.com, tyreld@linux.ibm.com, aik@ozlabs.ru, jniethe5@gmail.com,
 bigeasy@linutronix.de, cmr@codefail.de, avagin@gmail.com,
 sandipan@linux.ibm.com, lee.jones@linaro.org, jiapeng.chong@linux.alibaba.com,
 dave@stgolabs.net, unixbhaskar@gmail.com, lkp@intel.com, dima@arista.com,
 aneesh.kumar@linux.ibm.com, masahiroy@kernel.org, danielhb413@gmail.com,
 haren@linux.ibm.com, mahesh@linux.ibm.com, dingsenjie@yulong.com,
 ganeshgr@linux.ibm.com, geert@linux-m68k.org, naveen.n.rao@linux.vnet.ibm.com,
 yukuai3@huawei.com, nathanl@linux.ibm.com, ravi.bangoria@linux.ibm.com,
 elver@google.com, ajd@linux.ibm.com, leobras.c@gmail.com,
 chenhuang5@huawei.com, efremov@linux.com, nathan@kernel.org,
 maddy@linux.ibm.com, cuibixuan@huawei.com, clg@kaod.org, pulehui@huawei.com,
 vaibhav@linux.ibm.com, ldufour@linux.ibm.com, heying24@huawei.com,
 dja@axtens.net, christophe.leroy@c-s.fr, atrajeev@linux.vnet.ibm.com,
 sxwjean@gmail.com, rdunlap@infradead.org, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, lihuafei1@huawei.com, wsa@kernel.org,
 zhang.yunkai@zte.com.cn, yang.lee@linux.alibaba.com, fbarrat@linux.ibm.com,
 colin.king@canonical.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.13.

No conflicts that I'm aware of.

Notable out of area changes:

  51c66ad849a7 powerpc/bpf: Implement extended BPF on PPC32
    Documentation/admin-guide/sysctl/net.rst

  808094fcbf41 lib/vdso: Add vdso_data pointer as input to __arch_get_timen=
s_vdso_data()
    arch/arm64/include/asm/vdso/compat_gettimeofday.h
    arch/arm64/include/asm/vdso/gettimeofday.h
    arch/s390/include/asm/vdso/gettimeofday.h
    arch/x86/include/asm/vdso/gettimeofday.h
    lib/vdso/gettimeofday.c

  fb05121fd6a2 signal: Add unsafe_get_compat_sigset()
    include/linux/compat.h
    include/linux/uaccess.h

cheers


The following changes since commit 1e28eed17697bcf343c6743f0028cc3b5dd88bf0:

  Linux 5.12-rc3 (2021-03-14 14:41:02 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.13-1

for you to fetch changes up to 5256426247837feb8703625bda7fcfc824af04cf:

  powerpc/signal32: Fix erroneous SIGSEGV on RT signal return (2021-04-28 2=
3:35:11 +1000)

- ------------------------------------------------------------------
powerpc updates for 5.13

 - Enable KFENCE for 32-bit.

 - Implement EBPF for 32-bit.

 - Convert 32-bit to do interrupt entry/exit in C.

 - Convert 64-bit BookE to do interrupt entry/exit in C.

 - Changes to our signal handling code to use user_access_begin/end() more =
extensively.

 - Add support for time namespaces (CONFIG_TIME_NS)

 - A series of fixes that allow us to reenable STRICT_KERNEL_RWX.

 - Other smaller features, fixes & cleanups.

Thanks to: Alexey Kardashevskiy, Andreas Schwab, Andrew Donnellan, Aneesh K=
umar K.V,
  Athira Rajeev, Bhaskar Chowdhury, Bixuan Cui, C=C3=A9dric Le Goater, Chen=
 Huang, Chris
  Packham, Christophe Leroy, Christopher M. Riedl, Colin Ian King, Dan Carp=
enter, Daniel
  Axtens, Daniel Henrique Barboza, David Gibson, Davidlohr Bueso, Denis Efr=
emov,
  dingsenjie, Dmitry Safonov, Dominic DeMarco, Fabiano Rosas, Ganesh Goudar=
, Geert
  Uytterhoeven, Geetika Moolchandani, Greg Kurz, Guenter Roeck, Haren Mynen=
i, He Ying,
  Jiapeng Chong, Jordan Niethe, Laurent Dufour, Lee Jones, Leonardo Bras, L=
i Huafei,
  Madhavan Srinivasan, Mahesh Salgaonkar, Masahiro Yamada, Nathan Chancello=
r, Nathan
  Lynch, Nicholas Piggin, Oliver O'Halloran, Paul Menzel, Pu Lehui, Randy D=
unlap, Ravi
  Bangoria, Rosen Penev, Russell Currey, Santosh Sivaraj, Sebastian Andrzej=
 Siewior,
  Segher Boessenkool, Shivaprasad G Bhat, Srikar Dronamraju, Stephen Rothwe=
ll, Thadeu Lima
  de Souza Cascardo, Thomas Gleixner, Tony Ambardar, Tyrel Datwyler, Vaibha=
v Jain,
  Vincenzo Frascino, Xiongwei Song, Yang Li, Yu Kuai, Zhang Yunkai.

- ------------------------------------------------------------------
Alexey Kardashevskiy (3):
      powerpc/iommu: Allocate it_map by vmalloc
      powerpc/iommu: Do not immediately panic when failed IOMMU table alloc=
ation
      powerpc/iommu: Annotate nested lock for lockdep

Aneesh Kumar K.V (2):
      powerpc/book3s64/kuap: Move Kconfig varriables to BOOK3S_64
      powerpc/mm: Revert "powerpc/mm: Remove DEBUG_VM_PGTABLE support on po=
werpc"

Athira Rajeev (4):
      powerpc/perf: Fix PMU constraint check for EBB events
      powerpc/perf: Expose processor pipeline stage cycles using PERF_SAMPL=
E_WEIGHT_STRUCT
      powerpc/perf: Fix sampled instruction type for larx/stcx
      powerpc/perf: Fix the threshold event selection for memory events in =
power10

Bhaskar Chowdhury (6):
      powerpc: Fix spelling of "droping" to "dropping" in traps.c
      powerpc/64e: Trivial spelling fixes throughout head_fsl_booke.S
      powerpc/mm/book3s64: Fix a typo in mmu_context.c
      powerpc/kernel: Trivial typo fix in kgdb.c
      cxl: Fix couple of spellings
      powerpc: Spelling/typo fixes

Bixuan Cui (5):
      powerpc/pseries: Make symbol '__pcpu_scope_hcall_stats' static
      powerpc/pseries/pmem: Make symbol 'drc_pmem_match' static
      powerpc/perf: Make symbol 'isa207_pmu_format_attr' static
      powerpc/perf/hv-24x7: Make some symbols static
      powerpc/powernv: make symbol 'mpipl_kobj' static

Chen Huang (1):
      powerpc: Fix HAVE_HARDLOCKUP_DETECTOR_ARCH build configuration

Christophe Leroy (130):
      powerpc: Enable KFENCE for PPC32
      powerpc/uaccess: Also perform 64 bits copies in unsafe_copy_to_user()=
 on ppc32
      powerpc/uaccess: Swap clear_user() and __clear_user()
      powerpc/uaccess: Move copy_mc_xxx() functions down
      powerpc/syscalls: Use sys_old_select() in ppc_select()
      powerpc/lib: Don't use __put_user_asm_goto() outside of uaccess.h
      powerpc/net: Switch csum_and_copy_{to/from}_user to user_access block
      powerpc/futex: Switch to user_access block
      powerpc/ptrace: Convert gpr32_set_common() to user access block
      powerpc/traps: Declare unrecoverable_exception() as __noreturn
      powerpc/40x: Don't use SPRN_SPRG_SCRATCH0/1 in TLB miss handlers
      powerpc/40x: Change CRITICAL_EXCEPTION_PROLOG macro to a gas macro
      powerpc/40x: Save SRR0/SRR1 and r10/r11 earlier in critical exception
      powerpc/40x: Reorder a few instructions in critical exception prolog
      powerpc/40x: Prepare for enabling MMU in critical exception prolog
      powerpc/40x: Prepare normal exception handler for enabling MMU early
      powerpc/32: Reconcile interrupts in C
      powerpc/32: Entry cpu time accounting in C
      powerpc/32: Handle bookE debugging in C in exception entry
      powerpc/32: Use fast instruction to set MSR RI in exception prolog on=
 8xx
      powerpc/32: Remove ksp_limit
      powerpc/32: Always enable data translation in exception prolog
      powerpc/32: Tag DAR in EXCEPTION_PROLOG_2 for the 8xx
      powerpc/32: Enable instruction translation at the same time as data t=
ranslation
      powerpc/32: Statically initialise first emergency context
      powerpc/32: Add vmap_stack_overflow label inside the macro
      powerpc/32: Use START_EXCEPTION() as much as possible
      powerpc/32: Move exception prolog code into .text once MMU is back on
      powerpc/32: Provide a name to exception prolog continuation in virtua=
l mode
      powerpc/32: Refactor booke critical registers saving
      powerpc/32: Perform normal function call in exception entry
      powerpc/32: Always save non volatile registers on exception entry
      powerpc/32: Replace ASM exception exit by C exception exit from ppc64
      powerpc/32: Don't save thread.regs on interrupt entry
      powerpc/32: Set regs parameter in r3 in transfer_to_handler
      powerpc/32: Call bad_page_fault() from do_page_fault()
      powerpc/32: Save trap number on stack in exception prolog
      powerpc/32: Add a prepare_transfer_to_handler macro for exception pro=
logs
      powerpc/32: Only restore non volatile registers when required
      powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
      powerpc/32: Remove the xfer parameter in EXCEPTION() macro
      powerpc/32: Refactor saving of volatile registers in exception prologs
      powerpc/32: Save remaining registers in exception prolog
      powerpc/32: Return directly from power_save_ppc32_restore()
      powerpc/32: Only use prepare_transfer_to_handler function on book3s/3=
2 and e500
      powerpc/32s: Move KUEP locking/unlocking in C
      powerpc/64s: Make kuap_check_amr() and kuap_get_and_check_amr() gener=
ic
      powerpc/32s: Create C version of kuap save/restore/check helpers
      powerpc/8xx: Create C version of kuap save/restore/check helpers
      powerpc/32: Manage KUAP in C
      powerpc/Makefile: Remove workaround for gcc versions below 4.9
      powerpc/math: Fix missing __user qualifier for get_user() and other s=
parse warnings
      powerpc/asm-offsets: GPR14 is not needed either
      powerpc/mm: Remove unneeded #ifdef CONFIG_PPC_MEM_KEYS
      powerpc: Activate HAVE_RELIABLE_STACKTRACE for all
      powerpc: Rename 'tsk' parameter into 'task'
      powerpc: Convert stacktrace to generic ARCH_STACKWALK
      powerpc: Fix arch_stack_walk() to have running function as first entry
      powerpc/embedded6xx: Remove CONFIG_MV64X60
      powerpc/irq: Inline call_do_irq() and call_do_softirq()
      powerpc/uaccess: Remove __get_user_allowed() and unsafe_op_wrap()
      powerpc/uaccess: Define ___get_user_instr() for ppc32
      powerpc/align: Convert emulate_spe() to user_access_begin
      powerpc/uaccess: Remove __get/put_user_inatomic()
      powerpc/uaccess: Move get_user_instr helpers in asm/inst.h
      powerpc/align: Don't use __get_user_instr() on kernel addresses
      powerpc/uaccess: Call might_fault() inconditionaly
      powerpc/uaccess: Remove __unsafe_put_user_goto()
      powerpc/uaccess: Remove __chk_user_ptr() in __get/put_user
      powerpc/uaccess: Remove calls to __get_user_bad() and __put_user_bad()
      powerpc/uaccess: Split out __get_user_nocheck()
      powerpc/uaccess: Rename __get/put_user_check/nocheck
      powerpc/uaccess: Refactor get/put_user() and __get/put_user()
      powerpc/uaccess: Introduce __get_user_size_goto()
      powerpc/uaccess: Use asm goto for get_user when compiler supports it
      signal: Add unsafe_get_compat_sigset()
      powerpc/uaccess: Also perform 64 bits copies in unsafe_copy_from_user=
() on ppc32
      powerpc/signal: Add unsafe_copy_ck{fpr/vsx}_from_user
      powerpc/signal32: Rename save_user_regs_unsafe() and save_general_reg=
s_unsafe()
      powerpc/signal32: Remove ifdefery in middle of if/else in sigreturn()
      powerpc/signal32: Perform access_ok() inside restore_user_regs()
      powerpc/signal32: Reorder user reads in restore_tm_user_regs()
      powerpc/signal32: Convert restore_[tm]_user_regs() to user access blo=
ck
      powerpc/signal32: Convert do_setcontext[_tm]() to user access block
      powerpc/signal32: Simplify logging in sigreturn()
      powerpc/bpf: Remove classical BPF support for PPC32
      powerpc/bpf: Change register numbering for bpf_set/is_seen_register()
      powerpc/bpf: Move common helpers into bpf_jit.h
      powerpc/bpf: Move common functions into bpf_jit_comp.c
      powerpc/bpf: Change values of SEEN_ flags
      powerpc/asm: Add some opcodes in asm/ppc-opcode.h for PPC32 eBPF
      powerpc/bpf: Implement extended BPF on PPC32
      powerpc/bpf: Reallocate BPF registers to volatile registers when poss=
ible on PPC32
      powerpc: Switch to relative jump labels
      powerpc/32: Remove powerpc specific definition of 'ptrdiff_t'
      powerpc/signal32: Fix build failure with CONFIG_SPE
      powerpc/modules: Load modules closer to kernel text
      powerpc/8xx: Define a MODULE area below kernel text
      powerpc/32s: Define a MODULE area below kernel text all the time
      powerpc/mem: Move cache flushing functions into mm/cacheflush.c
      powerpc/mem: Declare __flush_dcache_icache() static
      powerpc/mem: Remove address argument to flush_coherent_icache()
      powerpc/mem: Call flush_coherent_icache() at higher level
      powerpc/mem: Optimise flush_dcache_icache_hugepage()
      powerpc/mem: flush_dcache_icache_phys() is for HIGHMEM pages only
      powerpc/mem: Help GCC realise __flush_dcache_icache() flushes single =
pages
      powerpc/mem: Inline flush_dcache_page()
      powerpc/mem: Use kmap_local_page() in flushing functions
      lib/vdso: Mark do_hres_timens() and do_coarse_timens() __always_inlin=
e()
      lib/vdso: Add vdso_data pointer as input to __arch_get_timens_vdso_da=
ta()
      powerpc/vdso: Add support for time namespaces
      powerpc/8xx: Enhance readability of trap types
      powerpc/32s: Enhance readability of trap types
      powerpc/irq: Enhance readability of trap types
      powerpc/inst: ppc_inst_as_u64() becomes ppc_inst_as_ulong()
      powerpc: Enable OPTPROBES on PPC32
      selftests/timens: Fix gettime_perf to work on powerpc
      powerpc/32: Use r2 in wrtspr() instead of r0
      powerpc/ebpf32: Fix comment on BPF_ALU{64} | BPF_LSH | BPF_K
      powerpc/ebpf32: Rework 64 bits shifts to avoid tests and branches
      powerpc/ebpf32: Use standard function call for functions within 32M d=
istance
      powerpc: Remove probe_user_read_inst()
      powerpc: Make probe_kernel_read_inst() common to PPC32 and PPC64
      powerpc: Rename probe_kernel_read_inst()
      powerpc: Move copy_inst_from_kernel_nofault()
      powerpc/64: Fix the definition of the fixmap area
      powerpc/legacy_serial: Use early_ioremap()
      powerpc/52xx: Fix an invalid ASM expression ('addi' used instead of '=
add')
      powerpc/kasan: Fix shadow start address with modules
      powerpc/signal32: Fix erroneous SIGSEGV on RT signal return

Christopher M. Riedl (8):
      powerpc/uaccess: Add unsafe_copy_from_user()
      powerpc/signal: Add unsafe_copy_{vsx, fpr}_from_user()
      powerpc/signal64: Remove non-inline calls from setup_sigcontext()
      powerpc: Reference parameter in MSR_TM_ACTIVE() macro
      powerpc/signal64: Remove TM ifdefery in middle of if/else block
      powerpc/signal64: Replace setup_sigcontext() w/ unsafe_setup_sigconte=
xt()
      powerpc/signal64: Replace restore_sigcontext() w/ unsafe_restore_sigc=
ontext()
      powerpc/signal: Use __get_user() to copy sigset_t

Colin Ian King (1):
      powerpc/44x: fix spelling mistake in Kconfig "varients" -> "variants"

C=C3=A9dric Le Goater (9):
      powerpc/xive: Introduce an IPI interrupt domain
      powerpc/xive: Remove useless check on XIVE_IPI_HW_IRQ
      powerpc/xive: Simplify xive_core_debug_show()
      powerpc/xive: Drop check on irq_data in xive_core_debug_show()
      powerpc/xive: Simplify the dump of XIVE interrupts under xmon
      powerpc/xive: Fix xmon command "dxi"
      powerpc/xive: Map one IPI interrupt per node
      powerpc/xive: Modernize XIVE-IPI domain with an 'alloc' handler
      powerpc/xive: Use the "ibm, chip-id" property only under PowerNV

Daniel Axtens (2):
      powerpc/signal64: Rewrite handle_rt_signal64() to minimise uaccess sw=
itches
      powerpc/signal64: Rewrite rt_sigreturn() to minimise uaccess switches

Daniel Henrique Barboza (3):
      powerpc/pseries/hotplug-cpu: Show 'last online CPU' error in dlpar_cp=
u_offline()
      powerpc/pseries: Introduce dlpar_unisolate_drc()
      powerpc/pseries: Set UNISOLATE on dlpar_cpu_remove() failure

Davidlohr Bueso (3):
      powerpc/spinlock: Define smp_mb__after_spinlock only once
      powerpc/spinlock: Unserialize spin_is_locked
      powerpc/qspinlock: Use generic smp_cond_load_relaxed

Denis Efremov (1):
      powerpc/ptrace: Remove duplicate check from pt_regs_check()

Dmitry Safonov (1):
      powerpc/vdso: Separate vvar vma from vdso

Ganesh Goudar (2):
      powerpc/pseries/mce: Fix a typo in error type assignment
      powerpc/mce: save ignore_event flag unconditionally for UE

Geert Uytterhoeven (1):
      powerpc/chrp: Make hydra_init() static

Haren Myneni (1):
      Documentation/powerpc: Add proper links for manual and tests

He Ying (1):
      powerpc/setup_64: Fix sparse warnings

Jiapeng Chong (2):
      powerpc: remove unneeded semicolon
      powerpc/pci: fix warning comparing pointer to 0

Jordan Niethe (4):
      powerpc/64s: Fix pte update for kernel memory on radix
      selftests/powerpc: Test for spurious kernel memory faults on radix
      powerpc/powernv/memtrace: Allow mmaping trace buffers
      selftests/powerpc: Suggest memtrace instead of /dev/mem for ci memory

Laurent Dufour (2):
      powerpc/pseries: export LPAR security flavor in lparcfg
      cxl: don't manipulate the mm.mm_users field directly

Lee Jones (1):
      powerpc/pseries: Move hvc_vio_init_early() prototype to shared locati=
on

Leonardo Bras (4):
      powerpc/iommu: Enable remaining IOMMU Pagesizes present in LoPAR
      powerpc/pseries/iommu: Fix window size for direct mapping with pmem
      powerpc/kernel/iommu: Align size for IOMMU_PAGE_SIZE() to save TCEs
      powerpc/kernel/iommu: Use largepool as a last resort when !largealloc

Li Huafei (2):
      powerpc/security: Make symbol 'stf_barrier' static
      powerpc/mce: Make symbol 'mce_ue_event_work' static

Madhavan Srinivasan (2):
      powerpc/perf: Infrastructure to support checking of attr.config*
      powerpc/perf: Add platform specific check_attr_config

Mahesh Salgaonkar (1):
      powerpc/eeh: Fix EEH handling for hugepages in ioremap space.

Masahiro Yamada (2):
      powerpc/syscalls: switch to generic syscalltbl.sh
      powerpc/syscalls: switch to generic syscallhdr.sh

Michael Ellerman (27):
      powerpc/eeh: Fix build failure with CONFIG_PROC_FS=3Dn
      powerpc/64s: Fold update_current_thread_[i]amr() into their only call=
ers
      powerpc: Fix section mismatch warning in smp_setup_pacas()
      powerpc/fsl-pci: Fix section mismatch warning
      powerpc/pseries: Only register vio drivers if vio bus exists
      powerpc/mm/64s: Add _PAGE_KERNEL_ROX
      powerpc/pseries: Add key to flags in pSeries_lpar_hpte_updateboltedpp=
()
      powerpc/64s: Use htab_convert_pte_flags() in hash__mark_rodata_ro()
      powerpc/mm/64s/hash: Factor out change_memory_range()
      powerpc/mm/64s/hash: Add real-mode change_memory_range() for hash LPAR
      powerpc/mm/64s: Allow STRICT_KERNEL_RWX again
      powerpc/64: Move security code into security.c
      powerpc/kexec: Don't use .machine ppc64 in trampoline_64.S
      powerpc/mm/radix: Make radix__change_memory_range() static
      powerpc/configs: Add PAPR_SCM to pseries_defconfig
      powerpc/papr_scm: Fix build error due to wrong printf specifier
      macintosh/via-pmu: Fix build warning
      Merge branch 'topic/ppc-kvm' into next
      powerpc/fadump: Fix compile error since trap type change
      powerpc: Only define _TASK_CPU for 32-bit
      powerpc/pseries: Stop calling printk in rtas_stop_self()
      powerpc/kvm: Fix PR KVM with KUAP/MEM_KEYS enabled
      powerpc/fadump: Fix sparse warnings
      powerpc/powernv: Fix type of opal_mpipl_query_tag() addr argument
      powerpc/64s: Add FA_DUMP to defconfig
      powerpc/configs: Add IBMVNIC to some 64-bit configs
      powerpc/kvm: Fix build error when PPC_MEM_KEYS/PPC_PSERIES=3Dn

Nathan Chancellor (3):
      powerpc/fadump: Mark fadump_calculate_reserve_size as __init
      powerpc/prom: Mark identical_pvr_fixup as __init
      powerpc: Avoid clang uninitialized warning in __get_user_size_allowed

Nathan Lynch (5):
      powerpc/rtas: improve ppc_rtas_rmo_buf_show documentation
      powerpc/rtas-proc: remove unused RMO_READ_BUF_MAX
      powerpc/rtas: remove ibm_suspend_me_token
      powerpc/rtas: move syscall filter setup into separate function
      powerpc/rtas: rename RTAS_RMOBUF_MAX to RTAS_USER_REGION_SIZE

Nicholas Piggin (27):
      powerpc/64s: Fix hash fault to use TRAP accessor
      powerpc/64s: power4 nap fixup in C
      KVM: PPC: Book3S HV P9: Restore host CTRL SPR after guest exit
      KVM: PPC: Book3S HV: Nested move LPCR sanitising to sanitise_hv_regs
      KVM: PPC: Book3S HV: Add a function to filter guest LPCR bits
      KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be set to 1 or 2
      KVM: PPC: Book3S HV: Prevent radix guests setting LPCR[TC]
      KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
      KVM: PPC: Book3S HV: remove unused kvmppc_h_protect argument
      KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=3Dn default hcalls
      powerpc/64s: Remove KVM handler support from CBE_RAS interrupts
      powerpc/64s: remove KVM SKIP test from instruction breakpoint handler
      KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in guest MSR
      KVM: PPC: Book3S HV: Ensure MSR[HV] is always clear in guest MSR
      powerpc/syscall: switch user_exit_irqoff and trace_hardirqs_off order
      powerpc/64e/interrupt: always save nvgprs on interrupt
      powerpc/interrupt: update common interrupt code for
      powerpc/64e/interrupt: use new interrupt return
      powerpc/64e/interrupt: NMI save irq soft-mask state in C
      powerpc/64e/interrupt: reconcile irq soft-mask state in C
      powerpc/64e/interrupt: Use new interrupt context tracking scheme
      powerpc/64e/interrupt: handle bad_page_fault in C
      powerpc: clean up do_page_fault
      powerpc: remove partial register save logic
      powerpc: move norestart trap flag to bit 0
      powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1 processors
      powerpc/64s: Fix mm_cpumask memory ordering comment

Pu Lehui (2):
      powerpc/xmon: Make symbol 'spu_inst_dump' static
      powerpc/fadump: make symbol 'rtas_fadump_set_regval' static

Randy Dunlap (3):
      selftests/powerpc: unmark non-kernel-doc comments
      powerpc: iommu: fix build when neither PCI or IBMVIO is set
      powerpc: make ALTIVEC select PPC_FPU

Ravi Bangoria (5):
      powerpc/uprobes: Validation for prefixed instruction
      powerpc/selftests/ptrace-hwbreak: Add testcases for 2nd DAWR
      powerpc/selftests/perf-hwbreak: Coalesce event creation code
      powerpc/selftests/perf-hwbreak: Add testcases for 2nd DAWR
      powerpc/selftests: Add selftest to test concurrent perf/ptrace events

Russell Currey (1):
      selftests/powerpc: Fix L1D flushing tests for Power10

Sebastian Andrzej Siewior (1):
      powerpc/mm: Move the linear_mapping_mutex to the ifdef where it is us=
ed

Shivaprasad G Bhat (1):
      powerpc/papr_scm: Implement support for H_SCM_FLUSH hcall

Srikar Dronamraju (4):
      powerpc/smp: Reintroduce cpu_core_mask
      Revert "powerpc/topology: Update topology_core_cpumask"
      powerpc/smp: Cache CPU to chip lookup
      powerpc/smp: Set numa node before updating mask

Thadeu Lima de Souza Cascardo (1):
      selftests/powerpc: Add uaccess flush test

Tony Ambardar (1):
      powerpc: fix EDEADLOCK redefinition error in uapi/asm/errno.h

Tyrel Datwyler (2):
      powerpc/pseries: extract host bridge from pci_bus prior to bus removal
      powerpc/pseries: Add shutdown() to vio_driver and vio_bus

Vaibhav Jain (2):
      powerpc/mm: Add cond_resched() while removing hpte mappings
      powerpc/papr_scm: Mark nvdimm as unarmed if needed during probe

Xiongwei Song (1):
      powerpc/traps: Enhance readability for trap types

Yang Li (5):
      powerpc/xive: use true and false for bool variable
      powerpc/pseries: remove unneeded semicolon
      powerpc/eeh: remove unneeded semicolon
      powerpc/64s: remove unneeded semicolon
      selftests/powerpc: remove unneeded semicolon

Yu Kuai (4):
      macintosh/windfarm: Make symbol 'pm121_sys_state' static
      windfarm: make symbol 'wf_thread' static
      macintosh/via-pmu: Make some symbols static
      powerpc/smp: Make some symbols static

Zhang Yunkai (2):
      powerpc: Remove duplicate includes
      powerpc: Fix misspellings in tlbflush.h

dingsenjie (1):
      powerpc/powernv: Remove unneeded variable: "rc"

kernel test robot (1):
      powerpc/iommu/debug: fix ifnullfree.cocci warnings


 Documentation/admin-guide/sysctl/net.rst                       |    2 +-
 Documentation/features/debug/debug-vm-pgtable/arch-support.txt |    2 +-
 Documentation/powerpc/papr_hcalls.rst                          |   14 +
 Documentation/powerpc/vas-api.rst                              |    4 +-
 arch/arm64/include/asm/vdso/compat_gettimeofday.h              |    3 +-
 arch/arm64/include/asm/vdso/gettimeofday.h                     |    2 +-
 arch/powerpc/Kconfig                                           |   32 +-
 arch/powerpc/Kconfig.debug                                     |    1 +
 arch/powerpc/Makefile                                          |   11 +-
 arch/powerpc/configs/ppc64_defconfig                           |    2 +
 arch/powerpc/configs/pseries_defconfig                         |    2 +
 arch/powerpc/include/asm/Kbuild                                |    1 -
 arch/powerpc/include/asm/asm-prototypes.h                      |    2 -
 arch/powerpc/include/asm/barrier.h                             |   16 -
 arch/powerpc/include/asm/book3s/32/kup.h                       |  126 +--
 arch/powerpc/include/asm/book3s/32/pgtable.h                   |    2 -
 arch/powerpc/include/asm/book3s/32/tlbflush.h                  |    2 +-
 arch/powerpc/include/asm/book3s/64/kup.h                       |   24 +-
 arch/powerpc/include/asm/book3s/64/mmu-hash.h                  |    1 -
 arch/powerpc/include/asm/book3s/64/pgtable.h                   |    5 +-
 arch/powerpc/include/asm/book3s/64/radix.h                     |    6 +-
 arch/powerpc/include/asm/bug.h                                 |    5 +-
 arch/powerpc/include/asm/cacheflush.h                          |   15 +-
 arch/powerpc/include/asm/cpm2.h                                |    2 +-
 arch/powerpc/include/asm/fixmap.h                              |    9 +
 arch/powerpc/include/asm/futex.h                               |   12 +-
 arch/powerpc/include/asm/hvcall.h                              |    4 +-
 arch/powerpc/include/asm/hvconsole.h                           |    3 +
 arch/powerpc/include/asm/hydra.h                               |    2 -
 arch/powerpc/include/asm/inst.h                                |   55 +-
 arch/powerpc/include/asm/interrupt.h                           |  173 ++-
 arch/powerpc/include/asm/irq.h                                 |    2 -
 arch/powerpc/include/asm/jump_label.h                          |   21 +-
 arch/powerpc/include/asm/kasan.h                               |    2 +-
 arch/powerpc/include/asm/kfence.h                              |   33 +
 arch/powerpc/include/asm/kup.h                                 |   27 +-
 arch/powerpc/include/asm/kvm_book3s.h                          |    2 +
 arch/powerpc/include/asm/kvm_ppc.h                             |    3 +-
 arch/powerpc/include/asm/mmu_context.h                         |    2 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h                   |   56 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h                   |    3 +
 arch/powerpc/include/asm/nohash/64/pgtable.h                   |    5 +-
 arch/powerpc/include/asm/opal.h                                |    2 +-
 arch/powerpc/include/asm/perf_event_server.h                   |    8 +-
 arch/powerpc/include/asm/pgtable.h                             |    2 -
 arch/powerpc/include/asm/ppc-opcode.h                          |   13 +
 arch/powerpc/include/asm/ppc_asm.h                             |   30 -
 arch/powerpc/include/asm/processor.h                           |    9 +-
 arch/powerpc/include/asm/ptrace.h                              |   45 +-
 arch/powerpc/include/asm/qspinlock.h                           |   21 +-
 arch/powerpc/include/asm/reg.h                                 |    6 +-
 arch/powerpc/include/asm/rtas.h                                |    6 +-
 arch/powerpc/include/asm/simple_spinlock.h                     |    6 +-
 arch/powerpc/include/asm/smp.h                                 |    6 +
 arch/powerpc/include/asm/spinlock.h                            |    3 +
 arch/powerpc/include/asm/thread_info.h                         |    7 +-
 arch/powerpc/include/asm/topology.h                            |    2 +-
 arch/powerpc/include/asm/uaccess.h                             |  389 +++-=
---
 arch/powerpc/include/asm/unistd.h                              |    1 +
 arch/powerpc/include/asm/vdso/gettimeofday.h                   |   10 +
 arch/powerpc/include/asm/vdso_datapage.h                       |    2 -
 arch/powerpc/include/asm/vio.h                                 |    1 +
 arch/powerpc/include/asm/xive.h                                |    1 +
 arch/powerpc/include/uapi/asm/errno.h                          |    1 +
 arch/powerpc/include/uapi/asm/posix_types.h                    |    5 -
 arch/powerpc/kernel/align.c                                    |   72 +-
 arch/powerpc/kernel/asm-offsets.c                              |   17 -
 arch/powerpc/kernel/eeh.c                                      |   15 +-
 arch/powerpc/kernel/entry_32.S                                 |  796 +++-=
----------
 arch/powerpc/kernel/entry_64.S                                 |   40 +-
 arch/powerpc/kernel/exceptions-64e.S                           |  425 +---=
----
 arch/powerpc/kernel/exceptions-64s.S                           |   60 +-
 arch/powerpc/kernel/fadump.c                                   |   18 +-
 arch/powerpc/kernel/fpu.S                                      |    2 -
 arch/powerpc/kernel/head_32.h                                  |  198 ++--
 arch/powerpc/kernel/head_40x.S                                 |  271 ++---
 arch/powerpc/kernel/head_44x.S                                 |   10 +-
 arch/powerpc/kernel/head_8xx.S                                 |  156 ++-
 arch/powerpc/kernel/head_book3s_32.S                           |  242 ++---
 arch/powerpc/kernel/head_booke.h                               |  203 ++--
 arch/powerpc/kernel/head_fsl_booke.S                           |   70 +-
 arch/powerpc/kernel/hw_breakpoint_constraints.c                |    2 +-
 arch/powerpc/kernel/idle_6xx.S                                 |   14 +-
 arch/powerpc/kernel/idle_book3s.S                              |    4 +
 arch/powerpc/kernel/idle_e500.S                                |   14 +-
 arch/powerpc/kernel/interrupt.c                                |   67 +-
 arch/powerpc/kernel/iommu.c                                    |   46 +-
 arch/powerpc/kernel/irq.c                                      |  132 +--
 arch/powerpc/kernel/jump_label.c                               |    4 +-
 arch/powerpc/kernel/kgdb.c                                     |    2 +-
 arch/powerpc/kernel/legacy_serial.c                            |   33 +-
 arch/powerpc/kernel/mce.c                                      |    5 +-
 arch/powerpc/kernel/misc_32.S                                  |   39 -
 arch/powerpc/kernel/misc_64.S                                  |   22 -
 arch/powerpc/kernel/module.c                                   |   23 +-
 arch/powerpc/kernel/optprobes.c                                |   24 +-
 arch/powerpc/kernel/optprobes_head.S                           |   65 +-
 arch/powerpc/kernel/process.c                                  |   25 +-
 arch/powerpc/kernel/prom.c                                     |   21 +-
 arch/powerpc/kernel/prom_init.c                                |    2 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c                       |   51 +-
 arch/powerpc/kernel/ptrace/ptrace.c                            |    4 -
 arch/powerpc/kernel/ptrace/ptrace32.c                          |    4 -
 arch/powerpc/kernel/rtas-proc.c                                |   15 +-
 arch/powerpc/kernel/rtas.c                                     |   34 +-
 arch/powerpc/kernel/security.c                                 |  263 ++++-
 arch/powerpc/kernel/setup-common.c                             |    3 +-
 arch/powerpc/kernel/setup_32.c                                 |    2 +-
 arch/powerpc/kernel/setup_64.c                                 |  282 +----
 arch/powerpc/kernel/signal.h                                   |   55 +
 arch/powerpc/kernel/signal_32.c                                |  254 +++--
 arch/powerpc/kernel/signal_64.c                                |  319 +++-=
--
 arch/powerpc/kernel/smp.c                                      |   68 +-
 arch/powerpc/kernel/stacktrace.c                               |  108 +-
 arch/powerpc/kernel/syscalls.c                                 |   12 +-
 arch/powerpc/kernel/syscalls/Makefile                          |   33 +-
 arch/powerpc/kernel/syscalls/syscallhdr.sh                     |   36 -
 arch/powerpc/kernel/syscalls/syscalltbl.sh                     |   36 -
 arch/powerpc/kernel/systbl.S                                   |    5 +-
 arch/powerpc/kernel/trace/ftrace.c                             |   22 +-
 arch/powerpc/kernel/traps.c                                    |   40 +-
 arch/powerpc/kernel/uprobes.c                                  |    7 +
 arch/powerpc/kernel/vdso.c                                     |  138 ++-
 arch/powerpc/kernel/vdso32/vdso32.lds.S                        |    2 +-
 arch/powerpc/kernel/vdso64/vdso64.lds.S                        |    2 +-
 arch/powerpc/kernel/vector.S                                   |    2 -
 arch/powerpc/kexec/crash.c                                     |    3 +-
 arch/powerpc/kvm/book3s_64_mmu_host.c                          |    2 +
 arch/powerpc/kvm/book3s_hv.c                                   |   85 +-
 arch/powerpc/kvm/book3s_hv_builtin.c                           |    3 +
 arch/powerpc/kvm/book3s_hv_nested.c                            |   37 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c                            |    3 +-
 arch/powerpc/lib/Makefile                                      |    2 +-
 arch/powerpc/lib/checksum_wrappers.c                           |   15 +-
 arch/powerpc/lib/code-patching.c                               |   13 +-
 arch/powerpc/lib/inst.c                                        |   73 --
 arch/powerpc/lib/sstep.c                                       |   13 -
 arch/powerpc/math-emu/math.c                                   |    4 +-
 arch/powerpc/mm/Makefile                                       |    3 +-
 arch/powerpc/mm/book3s32/Makefile                              |    1 +
 arch/powerpc/mm/book3s32/hash_low.S                            |   14 -
 arch/powerpc/mm/book3s32/kuep.c                                |   40 +
 arch/powerpc/mm/book3s32/mmu.c                                 |    9 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c                        |  130 ++-
 arch/powerpc/mm/book3s64/hash_utils.c                          |   35 +-
 arch/powerpc/mm/book3s64/mmu_context.c                         |    2 +-
 arch/powerpc/mm/book3s64/pkeys.c                               |   20 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c                       |   10 +-
 arch/powerpc/mm/cacheflush.c                                   |  234 +++++
 arch/powerpc/mm/fault.c                                        |   60 +-
 arch/powerpc/mm/init_32.c                                      |    3 +
 arch/powerpc/mm/maccess.c                                      |   21 +
 arch/powerpc/mm/mem.c                                          |  283 +----
 arch/powerpc/mm/mmu_context.c                                  |   24 +-
 arch/powerpc/mm/mmu_decl.h                                     |    5 +
 arch/powerpc/mm/nohash/8xx.c                                   |    4 +-
 arch/powerpc/net/Makefile                                      |    6 +-
 arch/powerpc/net/bpf_jit.h                                     |   64 ++
 arch/powerpc/net/bpf_jit32.h                                   |  139 ---
 arch/powerpc/net/bpf_jit64.h                                   |   21 +-
 arch/powerpc/net/bpf_jit_asm.S                                 |  226 ----
 arch/powerpc/net/bpf_jit_comp.c                                |  782 ++++=
----------
 arch/powerpc/net/bpf_jit_comp32.c                              | 1100 ++++=
++++++++++++++++
 arch/powerpc/net/bpf_jit_comp64.c                              |  295 +---=
--
 arch/powerpc/perf/core-book3s.c                                |   20 +-
 arch/powerpc/perf/hv-24x7.c                                    |   10 +-
 arch/powerpc/perf/isa207-common.c                              |  115 +-
 arch/powerpc/perf/isa207-common.h                              |    9 +-
 arch/powerpc/perf/power10-events-list.h                        |    4 +-
 arch/powerpc/perf/power10-pmu.c                                |   13 +
 arch/powerpc/perf/power9-pmu.c                                 |   13 +
 arch/powerpc/platforms/44x/Kconfig                             |    2 +-
 arch/powerpc/platforms/52xx/lite5200_sleep.S                   |    2 +-
 arch/powerpc/platforms/Kconfig.cputype                         |    5 +-
 arch/powerpc/platforms/cell/iommu.c                            |    3 +-
 arch/powerpc/platforms/cell/spu_callbacks.c                    |    2 +-
 arch/powerpc/platforms/chrp/pci.c                              |    3 +-
 arch/powerpc/platforms/embedded6xx/Kconfig                     |    5 -
 arch/powerpc/platforms/maple/pci.c                             |    2 +-
 arch/powerpc/platforms/pasemi/iommu.c                          |    4 +-
 arch/powerpc/platforms/powernv/memtrace.c                      |   18 +-
 arch/powerpc/platforms/powernv/opal-core.c                     |    2 +-
 arch/powerpc/platforms/powernv/opal-prd.c                      |    5 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                      |   15 +-
 arch/powerpc/platforms/powernv/setup.c                         |    2 +-
 arch/powerpc/platforms/pseries/dlpar.c                         |   14 +
 arch/powerpc/platforms/pseries/hotplug-cpu.c                   |   27 +-
 arch/powerpc/platforms/pseries/hvCall_inst.c                   |    2 +-
 arch/powerpc/platforms/pseries/iommu.c                         |   49 +-
 arch/powerpc/platforms/pseries/lpar.c                          |    6 +-
 arch/powerpc/platforms/pseries/lparcfg.c                       |    2 +
 arch/powerpc/platforms/pseries/papr_scm.c                      |   48 +
 arch/powerpc/platforms/pseries/pci_dlpar.c                     |    4 +-
 arch/powerpc/platforms/pseries/pmem.c                          |    2 +-
 arch/powerpc/platforms/pseries/pseries.h                       |    5 +-
 arch/powerpc/platforms/pseries/ras.c                           |    2 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c                   |    2 +-
 arch/powerpc/platforms/pseries/setup.c                         |    8 +
 arch/powerpc/platforms/pseries/vio.c                           |   20 +
 arch/powerpc/purgatory/trampoline_64.S                         |    1 -
 arch/powerpc/sysdev/dart_iommu.c                               |    3 +-
 arch/powerpc/sysdev/fsl_pci.c                                  |    2 +-
 arch/powerpc/sysdev/xive/common.c                              |  213 ++--
 arch/powerpc/sysdev/xive/native.c                              |    6 +
 arch/powerpc/sysdev/xive/spapr.c                               |    2 +-
 arch/powerpc/sysdev/xive/xive-internal.h                       |    3 +-
 arch/powerpc/xmon/xmon.c                                       |   76 +-
 arch/s390/include/asm/vdso/gettimeofday.h                      |    3 +-
 arch/x86/include/asm/vdso/gettimeofday.h                       |    3 +-
 drivers/i2c/busses/Kconfig                                     |    2 +-
 drivers/macintosh/via-pmu.c                                    |    4 +-
 drivers/macintosh/windfarm_core.c                              |    2 +-
 drivers/macintosh/windfarm_pm121.c                             |    2 +-
 drivers/macintosh/windfarm_smu_controls.c                      |    2 +-
 include/linux/compat.h                                         |   35 +
 include/linux/uaccess.h                                        |    1 +
 lib/vdso/gettimeofday.c                                        |   31 +-
 tools/testing/selftests/powerpc/alignment/alignment_handler.c  |   11 +-
 tools/testing/selftests/powerpc/mm/Makefile                    |    1 +
 tools/testing/selftests/powerpc/mm/stress_code_patching.sh     |   49 +
 tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c           |    2 +-
 tools/testing/selftests/powerpc/ptrace/.gitignore              |    1 +
 tools/testing/selftests/powerpc/ptrace/Makefile                |    2 +-
 tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c          |  635 ++++=
++++++-
 tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c        |   79 ++
 tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c   |  659 ++++=
++++++++
 tools/testing/selftests/powerpc/security/Makefile              |    3 +-
 tools/testing/selftests/powerpc/security/entry_flush.c         |    2 +-
 tools/testing/selftests/powerpc/security/flush_utils.c         |   13 +
 tools/testing/selftests/powerpc/security/flush_utils.h         |    7 +
 tools/testing/selftests/powerpc/security/rfi_flush.c           |    2 +-
 tools/testing/selftests/powerpc/security/uaccess_flush.c       |  158 +++
 tools/testing/selftests/powerpc/tm/tm-trap.c                   |    4 +-
 tools/testing/selftests/timens/gettime_perf.c                  |    8 +
 234 files changed, 6868 insertions(+), 5596 deletions(-)
 create mode 100644 arch/powerpc/include/asm/kfence.h
 delete mode 100644 arch/powerpc/kernel/syscalls/syscallhdr.sh
 delete mode 100644 arch/powerpc/kernel/syscalls/syscalltbl.sh
 delete mode 100644 arch/powerpc/lib/inst.c
 create mode 100644 arch/powerpc/mm/book3s32/kuep.c
 create mode 100644 arch/powerpc/mm/cacheflush.c
 delete mode 100644 arch/powerpc/net/bpf_jit32.h
 delete mode 100644 arch/powerpc/net/bpf_jit_asm.S
 create mode 100644 arch/powerpc/net/bpf_jit_comp32.c
 create mode 100755 tools/testing/selftests/powerpc/mm/stress_code_patching=
.sh
 create mode 100644 tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbr=
eak.c
 create mode 100644 tools/testing/selftests/powerpc/security/uaccess_flush.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmCLgQUACgkQUevqPMjh
pYBLWQ//QybD2ID0PI2AU5aFnV4mA1Jt5jBsp//iyEInqnUe7/RUhKFGE++KCcIN
ylZcNGNDrmMHqvdONbad6bYK76dw7xy98CAOPfvT5jW5J3XhTdLrc6QxN1Nkrdj8
trSsH1O1DxF7zXD0a0BcjuY7FzPWlIKcE85EH4jMevs+Xo+HAguReswUlMQk6QGl
aZuD22sDsRbxHF27/SZBrxcsAPW8jVbG0PXb49knPJBeQ0mN4HkTpOvD6GKPE3d5
ajXfHZ/qtRiD8Lo5J75o+QAiHW0OPE2MXROhnwouZJEz/cpYBRTefkbzsLk3rESl
0TL6d14A6F+t1w6MKHdiNilhV4uO4H5D9pjy4Hms4mN5A9PO78adsNGvAJW+WcDT
m4IckH2E7KE+2NsSTcRvGdongtV2VjoVHad6gm76PDcJtwLoX+Dsi9bNgHIu5bWr
oWlSUi5kiWqAYWQMOQbmOJ4EQsvwpBSCKIUq7xaI/HEcgopI/DPn3FawVjmtAall
2VjsIaF60rODigUOCPeK6hVQs5JhBnHsjBHi0wGpqRM8pp7kNROlR0BT5ame94Lu
oOnpQxG/OlRTGF4kAc82uQiwSf3sZGrlgVRveH7Qt8G39t+dJ/o0wVNDivJCwLvM
7QMt5+RRmIlD0/mqTnlrT7/x7H4ssTG7E/I0qaekZczJM2L4Yzs=3D
=3Dc6XH
-----END PGP SIGNATURE-----
