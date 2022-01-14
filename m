Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2526348E990
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 12:59:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb0G60K93z3bcT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 22:59:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KJJ5w/EZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb0FP0xwbz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 22:58:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KJJ5w/EZ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jb0F23Wxjz4y4c;
 Fri, 14 Jan 2022 22:58:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1642161523;
 bh=9ywII2BXoTAEXDv0EoHe4UGy9SdkHARFMXV6BX72FC4=;
 h=From:To:Cc:Subject:Date:From;
 b=KJJ5w/EZkirxhaT/A2Iv6KzPf8BWg6yLgpohH7atBWErwTAAGxfeG+Mnl6wRPs7lH
 A4dMwvVpUKWThb0fMJMg7VaA0cxLkI2LvaEuiEDFQqtQCrsYYl4eLib3G+7SbekPiw
 xSDYUHsDpRzwYM6a4+xs+lcVTsOy1Crw7xC8bDvHiYzxMmVm6dsYTTM+E+1/QinCA2
 W+NIr7qgbuU6iMrHt7mHfT4XpMvyTvIRspKX4Tb4620bpI6Txk44bhLZrITEB4BUTH
 9dE2Q5UOD0l0lry5rfUgfjn8hz9tmtO0D0b5ovUi430yxBuEiYgOLdrFKlH8YMfRVs
 kjr+Xa4EMZJyA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-1 tag
Date: Fri, 14 Jan 2022 22:58:25 +1100
Message-ID: <87v8ym1qce.fsf@mpe.ellerman.id.au>
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
Cc: sachinp@linux.vnet.ibm.com, cascardo@canonical.com,
 guoren@linux.alibaba.com, aik@ozlabs.ru, wangborong@cdjrlc.com,
 wangxiang@cdjrlc.com, amodra@au1.ibm.com, jlu.hpw@foxmail.com,
 keescook@chromium.org, robh@kernel.org, anders.roxell@linaro.org,
 chi.minghao@zte.com.cn, peterz@infradead.org, yang.guang5@zte.com.cn,
 nathanl@linux.ibm.com, ravi.bangoria@linux.ibm.com, ajd@linux.ibm.com,
 kjain@linux.ibm.com, npiggin@gmail.com, Julia.Lawall@lip6.fr,
 christophe.jaillet@wanadoo.fr, clg@kaod.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, hbathini@linux.ibm.com,
 dja@axtens.net, atrajeev@linux.vnet.ibm.com, nick.child@ibm.com,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, ammarfaizi2@gmail.com, seanjc@google.com,
 oohall@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.17.

Some of the KVM changes have also been merged into the KVM tree via a topic=
 branch, so you
may receive them that way.

Notable out of area changes:
  include/uapi/linux/perf_event.h  # cb1c4aba055f perf: Add new macros for =
mem_hops field
  drivers/misc/lkdtm/Makefile	   # c28573744b74 powerpc/64s: Make hash MMU =
support configurable
  drivers/misc/lkdtm/core.c	   # 387e220a2e5e powerpc/64s: Move hash MMU su=
pport code under CONFIG_PPC_64S_HASH_MMU
  include/linux/cuda.h		   # 7da1d1ddd1f0 cuda/pmu: Make find_via_cuda/pmu =
init functions
  include/linux/pmu.h		   # 7da1d1ddd1f0 cuda/pmu: Make find_via_cuda/pmu i=
nit functions

cheers

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.17-1

for you to fetch changes up to f1aa0e47c29268776205698f2453dc07fab49855:

  powerpc/xmon: Dump XIVE information for online-only processors. (2022-01-=
06 21:47:00 +1100)

- ------------------------------------------------------------------
powerpc updates for 5.17

 - Optimise radix KVM guest entry/exit by 2x on Power9/Power10.

 - Allow firmware to tell us whether to disable the entry and uaccess flush=
es on Power10
   or later CPUs.

 - Add BPF_PROBE_MEM support for 32 and 64-bit BPF jits.

 - Several fixes and improvements to our hard lockup watchdog.

 - Activate HAVE_DYNAMIC_FTRACE_WITH_REGS on 32-bit.

 - Allow building the 64-bit Book3S kernel without hash MMU support, ie. Ra=
dix only.

 - Add KUAP (SMAP) support for 40x, 44x, 8xx, Book3E (64-bit).

 - Add new encodings for perf_mem_data_src.mem_hops field, and use them on =
Power10.

 - A series of small performance improvements to 64-bit interrupt entry.

 - Several commits fixing issues when building with the clang integrated as=
sembler.

 - Many other small features and fixes.

Thanks to: Alan Modra, Alexey Kardashevskiy, Ammar Faizi, Anders Roxell, Ar=
nd Bergmann,
Athira Rajeev, C=C3=A9dric Le Goater, Christophe JAILLET, Christophe Leroy,=
 Christoph Hellwig,
Daniel Axtens, David Yang, Erhard Furtner, Fabiano Rosas, Greg Kroah-Hartma=
n, Guo Ren,
Hari Bathini, Jason Wang, Joel Stanley, Julia Lawall, Kajol Jain, Kees Cook=
, Laurent
Dufour, Madhavan Srinivasan, Mark Brown, Minghao Chi, Nageswara R Sastry, N=
aresh Kamboju,
Nathan Chancellor, Nathan Lynch, Nicholas Piggin, Nick Child, Oliver O'Hall=
oran, Peiwei
Hu, Randy Dunlap, Ravi Bangoria, Rob Herring, Russell Currey, Sachin Sant, =
Sean
Christopherson, Segher Boessenkool, Thadeu Lima de Souza Cascardo, Tyrel Da=
twyler, Xiang
wangx, Yang Guang.

- ------------------------------------------------------------------
Alan Modra (1):
      powerpc/toc: Future proof kernel toc

Alexey Kardashevskiy (5):
      KVM: PPC: Book3S: Suppress warnings when allocating too big memory sl=
ots
      KVM: PPC: Book3S: Suppress failed alloc warning in H_COPY_TOFROM_GUEST
      powerpc/64/asm: Inline BRANCH_TO_C000
      powerpc/mm: Switch obsolete dssall to .long
      powerpc/mm/book3s64/hash: Switch pre 2.06 tlbiel to .long

Ammar Faizi (1):
      powerpc/xive: Add missing null check after calling kmalloc

Anders Roxell (1):
      powerpc/cell: Fix clang -Wimplicit-fallthrough warning

Athira Rajeev (1):
      powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting=
 an overflown PMC

Christophe JAILLET (2):
      powerpc/mpic: Use bitmap_zalloc() when applicable
      powerpc/floppy: Remove usage of the deprecated "pci-dma-compat.h" API

Christophe Leroy (54):
      powerpc/code-patching: Improve verification of patchability
      powerpc/ftrace: No need to read LR from stack in _mcount()
      powerpc/ftrace: Add module_trampoline_target() for PPC32
      powerpc/ftrace: Activate HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32
      powerpc/ptdump: Fix display a BAT's size unit
      powerpc: Don't bother about .data..Lubsan sections
      powerpc/bitops: Use immediate operand when possible
      powerpc/atomics: Use immediate operand when possible
      powerpc/atomics: Remove atomic_inc()/atomic_dec() and friends
      powerpc/modules: Don't WARN on first module allocation attempt
      powerpc/powermac: Add missing lockdep_register_key()
      powerpc/32s: Fix shift-out-of-bounds in KASAN init
      powerpc/40x: Map 32Mbytes of memory at startup
      Revert "powerpc: Inline setup_kup()"
      powerpc/8xx: Activate KUEP at all time
      powerpc/44x: Activate KUEP at all time
      powerpc/book3e: Activate KUEP at all time
      powerpc/32s: Remove capability to disable KUEP at boottime
      powerpc/32s: Do kuep_lock() and kuep_unlock() in assembly
      powerpc/32s: Save content of sr0 to avoid 'mfsr'
      powerpc/kuep: Remove 'nosmep' boot time parameter except for book3s/64
      powerpc/kuap: Add a generic intermediate layer
      powerpc/kuap: Check KUAP activation in generic functions
      powerpc/kuap: Remove __kuap_assert_locked()
      powerpc/kuap: Add kuap_lock()
      powerpc/nohash: Move setup_kuap out of 8xx.c
      powerpc/config: Add CONFIG_BOOKE_OR_40x
      powerpc/kuap: Prepare for supporting KUAP on BOOK3E/64
      powerpc/kuap: Make PPC_KUAP_DEBUG depend on PPC_KUAP only
      powerpc: Add KUAP support for BOOKE and 40x
      powerpc/kuap: Wire-up KUAP on 44x
      powerpc/kuap: Wire-up KUAP on 40x
      powerpc/kuap: Wire-up KUAP on 85xx in 32 bits mode.
      powerpc/kuap: Wire-up KUAP on book3e/64
      powerpc: Remove CONFIG_PPC_HAVE_KUAP and CONFIG_PPC_HAVE_KUEP
      powerpc/32s: Allocate one 256k IBAT instead of two consecutives 128k =
IBATs
      powerpc/inst: Refactor ___get_user_instr()
      powerpc/inst: Define ppc_inst_t
      powerpc/inst: Define ppc_inst_t as u32 on PPC32
      powerpc/inst: Move ppc_inst_t definition in asm/reg.h
      powerpc/inst: Optimise copy_inst_from_kernel_nofault()
      powerpc/powermac: Add additional missing lockdep_register_key()
      powerpc/code-patching: Remove pr_debug()/pr_devel() messages and fix =
check()
      powerpc/code-patching: Remove init_mem_is_free
      powerpc/code-patching: Fix error handling in do_patch_instruction()
      powerpc/code-patching: Fix unmap_patch_area() error handling
      powerpc/code-patching: Reorganise do_patch_instruction() to ease erro=
r handling
      powerpc/code-patching: Fix patch_branch() return on out-of-range fail=
ure
      powerpc/code-patching: Use test_trampoline for prefixed patch test
      powerpc/code-patching: Move patch_exception() outside code-patching.c
      powerpc/code-patching: Move instr_is_branch_{i/b}form() in code-patch=
ing.h
      powerpc/code-patching: Move code patching selftests in its own file
      powerpc/code-patching: Replace patch_instruction() by ppc_inst_write(=
) in selftests
      powerpc/32: Fix boot failure with GCC latent entropy plugin

C=C3=A9dric Le Goater (11):
      powerpc/xive: Replace pr_devel() by pr_debug() to ease debug
      powerpc/xive: Introduce an helper to print out interrupt characterist=
ics
      powerpc/xive: Activate StoreEOI on P10
      powerpc/xive: Introduce xive_core_debugfs_create()
      powerpc/xive: Change the debugfs file 'xive' into a directory
      powerpc/xive: Rename the 'cpus' debugfs file to 'ipis'
      powerpc/xive: Add a debugfs file to dump EQs
      powerpc/xive: Add a debugfs toggle for StoreEOI
      powerpc/xive: Add a kernel parameter for StoreEOI
      powerpc/xive: Add a debugfs toggle for save-restore
      powerpc/xive: Fix compile when !CONFIG_PPC_POWERNV.

Daniel Axtens (3):
      powerpc/eeh: Small refactor of eeh_handle_normal_event()
      powerpc: check for support for -Wa,-m{power4,any}
      powerpc/64/asm: Do not reassign labels

Greg Kroah-Hartman (2):
      powerpc/cacheinfo: use default_groups in kobj_type
      powerpc/opal: use default_groups in kobj_type

Guo Ren (1):
      powerpc/sched: Remove unused TASK_SIZE_OF

Hari Bathini (6):
      bpf powerpc: refactor JIT compiler code
      powerpc/ppc-opcode: introduce PPC_RAW_BRANCH() macro
      bpf ppc32: Add BPF_PROBE_MEM support for JIT
      bpf ppc32: Access only if addr is kernel address
      powerpc: handle kdump appropriately with crash_kexec_post_notifiers o=
ption
      powerpc/fadump: Fix inaccurate CPU state info in vmcore generated wit=
h panic

Jason Wang (1):
      powerpc/tsi108: make EXPORT_SYMBOL follow its function immediately

Julia Lawall (4):
      powerpc/6xx: add missing of_node_put
      powerpc/powernv: add missing of_node_put
      powerpc/cell: add missing of_node_put
      powerpc/btext: add missing of_node_put

Kajol Jain (3):
      perf: Add new macros for mem_hops field
      powerpc/perf: Add encodings to represent data based on newer composit=
e PERF_MEM_LVLNUM* fields
      powerpc/perf: Add data source encodings for power10 platform

Kees Cook (1):
      powerpc/signal32: Use struct_group() to zero spe regs

Michael Ellerman (14):
      Merge branch 'topic/ppc-kvm' into next
      powerpc/microwatt: Make microwatt_get_random_darn() static
      Revert "powerpc/code-patching: Improve verification of patchability"
      powerpc/85xx: Fix no previous prototype warning for mpc85xx_setup_pmc=
()
      powerpc/85xx: Make mpc85xx_smp_kexec_cpu_down() static
      powerpc/85xx: Make c293_pcie_pic_init() static
      powerpc/mm: Move tlbcam_sz() and make it static
      powerpc/smp: Move setup_profiling_timer() under CONFIG_PROFILING
      powerpc: Mark probe_machine() __init and static
      Merge branch 'topic/ppc-kvm' into next
      selftests/powerpc: Add a test of sigreturning to the kernel
      powerpc/64s: Mask NIP before checking against SRR0
      powerpc/64s: Use EMIT_WARN_ENTRY for SRR debug warnings
      selftests/powerpc: Add a test of sigreturning to an unaligned address

Minghao Chi (1):
      ocxl: remove redundant rc variable

Nathan Lynch (4):
      powerpc/rtas: kernel-doc fixes
      powerpc/pseries: delete scanlog
      powerpc/rtas: rtas_busy_delay() improvements
      powerpc/rtas: rtas_busy_delay_time() kernel-doc

Nicholas Piggin (92):
      powerpc/64s: Remove WORT SPR from POWER9/10 (take 2)
      powerpc/64s: guard optional TIDR SPR with CPU ftr test
      KMV: PPC: Book3S HV P9: Use set_dec to set decrementer to host
      KVM: PPC: Book3S HV P9: Use host timer accounting to avoid decremente=
r read
      KVM: PPC: Book3S HV P9: Use large decrementer for HDEC
      KVM: PPC: Book3S HV P9: Reduce mftb per guest entry/exit
      powerpc/time: add API for KVM to re-arm the host timer/decrementer
      KVM: PPC: Book3S HV: POWER10 enable HAIL when running radix guests
      powerpc/64s: Keep AMOR SPR a constant ~0 at runtime
      KVM: PPC: Book3S HV: Don't always save PMU for guest capable of nesti=
ng
      powerpc/64s: Always set PMU control registers to frozen/disabled when=
 not in use
      powerpc/64s: Implement PMU override command line option
      KVM: PPC: Book3S HV P9: Implement PMU save/restore in C
      KVM: PPC: Book3S HV P9: Factor PMU save/load into context switch func=
tions
      KVM: PPC: Book3S HV P9: Demand fault PMU SPRs when marked not inuse
      KVM: PPC: Book3S HV P9: Factor out yield_count increment
      KVM: PPC: Book3S HV: CTRL SPR does not require read-modify-write
      KVM: PPC: Book3S HV P9: Move SPRG restore to restore_p9_host_os_sprs
      KVM: PPC: Book3S HV P9: Reduce mtmsrd instructions required to save h=
ost SPRs
      KVM: PPC: Book3S HV P9: Improve mtmsrd scheduling by delaying MSR[EE]=
 disable
      KVM: PPC: Book3S HV P9: Add kvmppc_stop_thread to match kvmppc_start_=
thread
      KVM: PPC: Book3S HV: Change dec_expires to be relative to guest timeb=
ase
      KVM: PPC: Book3S HV P9: Move TB updates
      KVM: PPC: Book3S HV P9: Optimise timebase reads
      KVM: PPC: Book3S HV P9: Avoid SPR scoreboard stalls
      KVM: PPC: Book3S HV P9: Only execute mtSPR if the value changed
      KVM: PPC: Book3S HV P9: Juggle SPR switching around
      KVM: PPC: Book3S HV P9: Move vcpu register save/restore into functions
      KVM: PPC: Book3S HV P9: Move host OS save/restore functions to built-=
in
      KVM: PPC: Book3S HV P9: Move nested guest entry into its own function
      KVM: PPC: Book3S HV P9: Move remaining SPR and MSR access into low le=
vel entry
      KVM: PPC: Book3S HV P9: Implement TM fastpath for guest entry/exit
      KVM: PPC: Book3S HV P9: Switch PMU to guest as late as possible
      KVM: PPC: Book3S HV P9: Restrict DSISR canary workaround to processor=
s that require it
      KVM: PPC: Book3S HV P9: More SPR speed improvements
      KVM: PPC: Book3S HV P9: Demand fault EBB facility registers
      KVM: PPC: Book3S HV P9: Demand fault TM facility registers
      KVM: PPC: Book3S HV P9: Use Linux SPR save/restore to manage some hos=
t SPRs
      KVM: PPC: Book3S HV P9: Comment and fix MMU context switching code
      KVM: PPC: Book3S HV P9: Test dawr_enabled() before saving host DAWR S=
PRs
      KVM: PPC: Book3S HV P9: Don't restore PSSCR if not needed
      KVM: PPC: Book3S HV: Split P8 from P9 path guest vCPU TLB flushing
      KVM: PPC: Book3S HV P9: Avoid tlbsync sequence on radix guest exit
      KVM: PPC: Book3S HV Nested: Avoid extra mftb() in nested entry
      KVM: PPC: Book3S HV P9: Improve mfmsr performance on entry
      KVM: PPC: Book3S HV P9: Optimise hash guest SLB saving
      KVM: PPC: Book3S HV P9: Avoid changing MSR[RI] in entry and exit
      KVM: PPC: Book3S HV P9: Add unlikely annotation for !mmu_ready
      KVM: PPC: Book3S HV P9: Avoid cpu_in_guest atomics on entry and exit
      KVM: PPC: Book3S HV P9: Remove most of the vcore logic
      KVM: PPC: Book3S HV P9: Tidy kvmppc_create_dtl_entry
      KVM: PPC: Book3S HV P9: Stop using vc->dpdes
      KVM: PPC: Book3S HV P9: Remove subcore HMI handling
      powerpc/powernv: Remove POWER9 PVR version check for entry and uacces=
s flushes
      powerpc/watchdog: Fix missed watchdog reset due to memory ordering ra=
ce
      powerpc/watchdog: tighten non-atomic read-modify-write access
      powerpc/watchdog: Avoid holding wd_smp_lock over printk and smp_send_=
nmi_ipi
      powerpc/watchdog: read TB close to where it is used
      powerpc/watchdog: Fix wd_smp_last_reset_tb reporting
      powerpc: remove cpu_online_cores_map function
      powerpc: select CPUMASK_OFFSTACK if NR_CPUS >=3D 8192
      powerpc/watchdog: help remote CPUs to flush NMI printk output
      powerpc: flexible GPR range save/restore macros
      powerpc/64s: Get LPID bit width from device tree
      KVM: PPC: Book3S HV P9: Remove unused ri_set local variable
      powerpc: Remove unused FW_FEATURE_NATIVE references
      powerpc: Rename PPC_NATIVE to PPC_HASH_MMU_NATIVE
      powerpc/pseries: Stop selecting PPC_HASH_MMU_NATIVE
      powerpc/64s: Move and rename do_bad_slb_fault as it is not hash speci=
fic
      powerpc/pseries: move process table registration away from hash-speci=
fic code
      powerpc/pseries: lparcfg don't include slb_size line in radix mode
      powerpc/64s: move THP trace point creation out of hash specific file
      powerpc/64s: Make flush_and_reload_slb a no-op when radix is enabled
      powerpc/64s: move page size definitions from hash specific file
      powerpc/64s: Rename hash_hugetlbpage.c to hugetlbpage.c
      powerpc/64: pcpu setup avoid reading mmu_linear_psize on 64e or radix
      powerpc: make memremap_compat_align 64s-only
      powerpc/64e: remove mmu_linear_psize
      powerpc/64s: Fix radix MMU when MMU_FTR_HPTE_TABLE is clear
      powerpc/64s: Always define arch unmapped area calls
      powerpc/64s: Make hash MMU support configurable
      powerpc/64s: Move hash MMU support code under CONFIG_PPC_64S_HASH_MMU
      powerpc/microwatt: add POWER9_CPU, clear PPC_64S_HASH_MMU
      powerpc/pseries/vas: Don't print an error when VAS is unavailable
      powerpc/64/interrupt: make normal synchronous interrupts enable MSR[E=
E] if possible
      powerpc/64s/interrupt: handle MSR EE and RI in interrupt entry wrapper
      powerpc/64s/perf: add power_pmu_wants_prompt_pmi to say whether perf =
wants PMIs to be soft-NMI
      powerpc/64s/interrupt: Don't enable MSR[EE] in irq handlers unless pe=
rf is in use
      powerpc/64/interrupt: reduce expensive debug tests
      powerpc/64s/interrupt: avoid saving CFAR in some asynchronous interru=
pts
      powerpc/pseries: use slab context cpumask allocation in CPU hotplug i=
nit
      powerpc/64s/radix: Fix huge vmap false positive

Nick Child (20):
      powerpc/kernel: Add __init attribute to eligible functions
      powerpc/lib: Add __init attribute to eligible functions
      powerpc/mm: Add __init attribute to eligible functions
      powerpc/perf: Add __init attribute to eligible functions
      powerpc/sysdev: Add __init attribute to eligible functions
      powerpc/xmon: Add __init attribute to eligible functions
      powerpc/cell: Add __init attribute to eligible functions
      powerpc/chrp: Add __init attribute to eligible functions
      powerpc/pasemi: Add __init attribute to eligible functions
      powerpc/powermac: Add __init attribute to eligible functions
      powerpc/powernv: Add __init attribute to eligible functions
      powerpc/pseries: Add __init attribute to eligible functions
      powerpc/ps3: Add __init attribute to eligible functions
      powerpc/4xx: Add __init attribute to eligible functions
      powerpc/44x: Add __init attribute to eligible functions
      powerpc/embedded6xx: Add __init attribute to eligible functions
      powerpc/83xx: Add __init attribute to eligible functions
      powerpc/85xx: Add __init attribute to eligible functions
      powerpc/512x: Add __init attribute to eligible functions
      cuda/pmu: Make find_via_cuda/pmu init functions

Oliver O'Halloran (1):
      powerpc/eeh: Use a goto for recovery failures

Peiwei Hu (1):
      powerpc/prom_init: Fix improper check of prom_getprop()

Randy Dunlap (1):
      powerpc/perf: Fix spelling of "its"

Ravi Bangoria (4):
      bpf powerpc: Remove unused SEEN_STACK
      bpf powerpc: Remove extra_pass from bpf_jit_build_body()
      bpf ppc64: Add BPF_PROBE_MEM support for JIT
      bpf ppc64: Access only if addr is kernel address

Rob Herring (1):
      powerpc/dts: Remove "spidev" nodes

Sachin Sant (2):
      selftests/powerpc: skip tests for unavailable mitigations.
      powerpc/xmon: Dump XIVE information for online-only processors.

Sean Christopherson (1):
      KVM: PPC: Book3S HV P9: Use kvm_arch_vcpu_get_wait() to get rcuwait o=
bject

Thadeu Lima de Souza Cascardo (1):
      selftests/powerpc/spectre_v2: Return skip code when miss_percent is h=
igh

Xiang wangx (1):
      macintosh: Add const to of_device_id

Yang Guang (1):
      powerpc: use swap() to make code cleaner


 Documentation/admin-guide/kernel-parameters.txt                 |  16 +-
 arch/powerpc/Kconfig                                            |  10 +-
 arch/powerpc/Makefile                                           |   9 +-
 arch/powerpc/boot/crt0.S                                        |  33 +-
 arch/powerpc/boot/dts/digsy_mtc.dts                             |   8 -
 arch/powerpc/boot/dts/o2d.dtsi                                  |   6 -
 arch/powerpc/boot/zImage.lds.S                                  |   7 +-
 arch/powerpc/configs/microwatt_defconfig                        |   3 +-
 arch/powerpc/configs/ppc64_defconfig                            |   1 -
 arch/powerpc/configs/pseries_defconfig                          |   1 -
 arch/powerpc/crypto/md5-asm.S                                   |  10 +-
 arch/powerpc/crypto/sha1-powerpc-asm.S                          |   6 +-
 arch/powerpc/include/asm/asm-prototypes.h                       |   5 -
 arch/powerpc/include/asm/atomic.h                               | 151 +---
 arch/powerpc/include/asm/bitops.h                               |  89 +-
 arch/powerpc/include/asm/book3s/32/kup.h                        | 108 +--
 arch/powerpc/include/asm/book3s/32/mmu-hash.h                   |  82 +-
 arch/powerpc/include/asm/book3s/64/hash.h                       |   4 -
 arch/powerpc/include/asm/book3s/64/kup.h                        |  56 +-
 arch/powerpc/include/asm/book3s/64/mmu-hash.h                   |   8 +-
 arch/powerpc/include/asm/book3s/64/mmu.h                        |  38 +-
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h              |   6 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h                   |   4 -
 arch/powerpc/include/asm/book3s/pgtable.h                       |   4 +
 arch/powerpc/include/asm/btext.h                                |  10 +-
 arch/powerpc/include/asm/code-patching.h                        |  40 +-
 arch/powerpc/include/asm/cpm2.h                                 |   6 +-
 arch/powerpc/include/asm/cpuidle.h                              |   2 +-
 arch/powerpc/include/asm/cputhreads.h                           |  33 -
 arch/powerpc/include/asm/eeh.h                                  |   2 +-
 arch/powerpc/include/asm/exception-64e.h                        |   4 +
 arch/powerpc/include/asm/fadump-internal.h                      |   6 +-
 arch/powerpc/include/asm/firmware.h                             |   8 -
 arch/powerpc/include/asm/floppy.h                               |   8 +-
 arch/powerpc/include/asm/head-64.h                              |  12 +-
 arch/powerpc/include/asm/hugetlb.h                              |   2 +-
 arch/powerpc/include/asm/hw_breakpoint.h                        |   5 +-
 arch/powerpc/include/asm/hw_irq.h                               | 107 ++-
 arch/powerpc/include/asm/i8259.h                                |   2 +-
 arch/powerpc/include/asm/inst.h                                 |  95 +-
 arch/powerpc/include/asm/interrupt.h                            |  73 +-
 arch/powerpc/include/asm/iommu.h                                |   2 +-
 arch/powerpc/include/asm/ipic.h                                 |   2 +-
 arch/powerpc/include/asm/irq.h                                  |   2 +-
 arch/powerpc/include/asm/kexec.h                                |   2 +-
 arch/powerpc/include/asm/kup.h                                  | 122 ++-
 arch/powerpc/include/asm/kvm_asm.h                              |   1 +
 arch/powerpc/include/asm/kvm_book3s.h                           |   6 +
 arch/powerpc/include/asm/kvm_book3s_64.h                        |   5 +-
 arch/powerpc/include/asm/kvm_guest.h                            |   2 +-
 arch/powerpc/include/asm/kvm_host.h                             |   7 +-
 arch/powerpc/include/asm/kvm_ppc.h                              |   4 +-
 arch/powerpc/include/asm/machdep.h                              |   2 -
 arch/powerpc/include/asm/mmu.h                                  |  16 +-
 arch/powerpc/include/asm/mmu_context.h                          |   4 +-
 arch/powerpc/include/asm/mpic.h                                 |   2 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h                    |  50 +-
 arch/powerpc/include/asm/nohash/32/mmu-44x.h                    |   1 -
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h                    |   6 +-
 arch/powerpc/include/asm/nohash/64/pgtable.h                    |   6 +
 arch/powerpc/include/asm/nohash/kup-booke.h                     | 110 +++
 arch/powerpc/include/asm/opal-api.h                             |   1 +
 arch/powerpc/include/asm/opal.h                                 |   2 +-
 arch/powerpc/include/asm/paca.h                                 |   8 +
 arch/powerpc/include/asm/pci.h                                  |   2 +-
 arch/powerpc/include/asm/perf_event_server.h                    |   2 +-
 arch/powerpc/include/asm/ppc-opcode.h                           |   6 +
 arch/powerpc/include/asm/ppc_asm.h                              |  43 +-
 arch/powerpc/include/asm/processor.h                            |  18 +-
 arch/powerpc/include/asm/ptrace.h                               |   2 +-
 arch/powerpc/include/asm/reg.h                                  |  16 +-
 arch/powerpc/include/asm/rtas.h                                 |   2 +-
 arch/powerpc/include/asm/sections.h                             |  16 +-
 arch/powerpc/include/asm/setup.h                                |   9 +-
 arch/powerpc/include/asm/smu.h                                  |   2 +-
 arch/powerpc/include/asm/sstep.h                                |   4 +-
 arch/powerpc/include/asm/switch_to.h                            |   3 +
 arch/powerpc/include/asm/task_size_64.h                         |   6 +-
 arch/powerpc/include/asm/time.h                                 |  19 +-
 arch/powerpc/include/asm/udbg.h                                 |  10 +-
 arch/powerpc/include/asm/uprobes.h                              |   1 -
 arch/powerpc/include/asm/xics.h                                 |   4 +-
 arch/powerpc/include/asm/xmon.h                                 |   2 +-
 arch/powerpc/kernel/Makefile                                    |   1 +
 arch/powerpc/kernel/align.c                                     |   4 +-
 arch/powerpc/kernel/asm-offsets.c                               |   5 +-
 arch/powerpc/kernel/btext.c                                     |  16 +-
 arch/powerpc/kernel/cacheinfo.c                                 |   5 +-
 arch/powerpc/kernel/cpu_setup_power.c                           |  12 +-
 arch/powerpc/kernel/dbell.c                                     |   3 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c                               |  24 +-
 arch/powerpc/kernel/eeh_cache.c                                 |   2 +-
 arch/powerpc/kernel/eeh_driver.c                                | 162 ++--
 arch/powerpc/kernel/entry_32.S                                  |  54 +-
 arch/powerpc/kernel/entry_64.S                                  |   4 +-
 arch/powerpc/kernel/epapr_paravirt.c                            |   2 +-
 arch/powerpc/kernel/exceptions-64e.S                            |  14 +-
 arch/powerpc/kernel/exceptions-64s.S                            | 174 ++--
 arch/powerpc/kernel/fadump.c                                    |  26 +-
 arch/powerpc/kernel/fpu.S                                       |   5 +
 arch/powerpc/kernel/head_32.h                                   |   9 +-
 arch/powerpc/kernel/head_40x.S                                  |  17 +-
 arch/powerpc/kernel/head_44x.S                                  |  26 +-
 arch/powerpc/kernel/head_64.S                                   |  20 +-
 arch/powerpc/kernel/head_book3s_32.S                            |   4 +
 arch/powerpc/kernel/head_booke.h                                |   3 +-
 arch/powerpc/kernel/head_fsl_booke.S                            |  13 +
 arch/powerpc/kernel/hw_breakpoint.c                             |   4 +-
 arch/powerpc/kernel/hw_breakpoint_constraints.c                 |   4 +-
 arch/powerpc/kernel/idle.c                                      |   2 +-
 arch/powerpc/kernel/idle_6xx.S                                  |   2 +-
 arch/powerpc/kernel/interrupt.c                                 |   3 +-
 arch/powerpc/kernel/interrupt_64.S                              |  46 +-
 arch/powerpc/kernel/irq.c                                       |   5 +-
 arch/powerpc/kernel/kgdb.c                                      |   4 +-
 arch/powerpc/kernel/kprobes.c                                   |   4 +-
 arch/powerpc/kernel/l2cr_6xx.S                                  |   6 +-
 arch/powerpc/kernel/mce.c                                       |   2 +-
 arch/powerpc/kernel/mce_power.c                                 |  18 +-
 arch/powerpc/kernel/module.c                                    |  11 +-
 arch/powerpc/kernel/module_32.c                                 |  33 +
 arch/powerpc/kernel/nvram_64.c                                  |   6 +-
 arch/powerpc/kernel/optprobes.c                                 |  12 +-
 arch/powerpc/kernel/optprobes_head.S                            |   4 +-
 arch/powerpc/kernel/paca.c                                      |  18 +-
 arch/powerpc/kernel/pci-common.c                                |   2 +-
 arch/powerpc/kernel/pci_32.c                                    |   4 +-
 arch/powerpc/kernel/process.c                                   |  58 +-
 arch/powerpc/kernel/prom.c                                      |   6 +-
 arch/powerpc/kernel/prom_init.c                                 |  14 +-
 arch/powerpc/kernel/rtas.c                                      | 104 ++-
 arch/powerpc/kernel/rtasd.c                                     |   6 +-
 arch/powerpc/kernel/security.c                                  |   4 +-
 arch/powerpc/kernel/setup-common.c                              |   2 +-
 arch/powerpc/kernel/setup.h                                     |   2 +-
 arch/powerpc/kernel/setup_32.c                                  |   4 +-
 arch/powerpc/kernel/setup_64.c                                  |  23 +-
 arch/powerpc/kernel/signal_32.c                                 |  14 +-
 arch/powerpc/kernel/smp.c                                       |  47 +-
 arch/powerpc/kernel/swsusp_32.S                                 |   2 +-
 arch/powerpc/kernel/swsusp_asm64.S                              |   2 +-
 arch/powerpc/kernel/sysfs.c                                     |  10 +-
 arch/powerpc/kernel/time.c                                      |  87 +-
 arch/powerpc/kernel/tm.S                                        |  15 +-
 arch/powerpc/kernel/trace/ftrace.c                              | 107 +--
 arch/powerpc/kernel/trace/ftrace_32.S                           | 118 ++-
 arch/powerpc/kernel/trace/ftrace_64_mprofile.S                  |  15 +-
 arch/powerpc/kernel/udbg_16550.c                                |  10 +-
 arch/powerpc/kernel/vecemu.c                                    |   2 +-
 arch/powerpc/kernel/vector.S                                    |  10 +
 arch/powerpc/kernel/vmlinux.lds.S                               |  16 +-
 arch/powerpc/kernel/watchdog.c                                  | 223 ++++-
 arch/powerpc/kexec/core.c                                       |   2 +-
 arch/powerpc/kexec/core_64.c                                    |   4 +-
 arch/powerpc/kexec/ranges.c                                     |   2 +-
 arch/powerpc/kvm/Kconfig                                        |  16 +
 arch/powerpc/kvm/book3s_64_entry.S                              |  11 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c                          |   4 +
 arch/powerpc/kvm/book3s_hv.c                                    | 860 ++++=
+++++---------
 arch/powerpc/kvm/book3s_hv.h                                    |  42 +
 arch/powerpc/kvm/book3s_hv_builtin.c                            |  55 +-
 arch/powerpc/kvm/book3s_hv_hmi.c                                |   7 +-
 arch/powerpc/kvm/book3s_hv_interrupts.S                         |  13 +-
 arch/powerpc/kvm/book3s_hv_nested.c                             |  10 +-
 arch/powerpc/kvm/book3s_hv_p9_entry.c                           | 911 ++++=
+++++++++++++---
 arch/powerpc/kvm/book3s_hv_ras.c                                |  54 ++
 arch/powerpc/kvm/book3s_hv_rm_mmu.c                             |   6 -
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                         |  78 +-
 arch/powerpc/lib/Makefile                                       |   7 +-
 arch/powerpc/lib/code-patching.c                                | 497 ++--=
-------
 arch/powerpc/lib/feature-fixups.c                               |  30 +-
 arch/powerpc/lib/sstep.c                                        |   4 +-
 arch/powerpc/lib/test-code-patching.c                           | 362 ++++=
++++
 arch/powerpc/lib/test_code-patching.S                           |  20 -
 arch/powerpc/lib/test_emulate_step.c                            |  10 +-
 arch/powerpc/lib/test_emulate_step_exec_instr.S                 |   8 +-
 arch/powerpc/mm/book3s32/Makefile                               |   1 -
 arch/powerpc/mm/book3s32/kuap.c                                 |   5 +-
 arch/powerpc/mm/book3s32/kuep.c                                 |  20 -
 arch/powerpc/mm/book3s32/mmu.c                                  |   7 +-
 arch/powerpc/mm/book3s32/mmu_context.c                          |  15 +-
 arch/powerpc/mm/book3s64/Makefile                               |  19 +-
 arch/powerpc/mm/book3s64/hash_native.c                          | 108 +--
 arch/powerpc/mm/book3s64/hash_pgtable.c                         |   1 -
 arch/powerpc/mm/book3s64/hash_utils.c                           | 117 ++-
 arch/powerpc/mm/book3s64/{hash_hugetlbpage.c =3D> hugetlbpage.c}  |   4 +-
 arch/powerpc/mm/book3s64/mmu_context.c                          |  34 +-
 arch/powerpc/mm/book3s64/pgtable.c                              |  32 +-
 arch/powerpc/mm/book3s64/pkeys.c                                |   2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c                        |  40 +-
 arch/powerpc/mm/book3s64/slb.c                                  |  16 -
 arch/powerpc/mm/book3s64/trace.c                                |   8 +
 arch/powerpc/mm/copro_fault.c                                   |   2 +
 arch/powerpc/mm/fault.c                                         |  24 +
 arch/powerpc/mm/hugetlbpage.c                                   |  16 +-
 arch/powerpc/mm/init-common.c                                   |  21 +
 arch/powerpc/mm/init_64.c                                       |  59 +-
 arch/powerpc/mm/ioremap.c                                       |  20 -
 arch/powerpc/mm/kasan/book3s_32.c                               |   3 +-
 arch/powerpc/mm/maccess.c                                       |  17 -
 arch/powerpc/mm/mem.c                                           |   2 -
 arch/powerpc/mm/mmap.c                                          |  40 +-
 arch/powerpc/mm/mmu_context.c                                   |  11 +-
 arch/powerpc/mm/nohash/44x.c                                    |  20 +-
 arch/powerpc/mm/nohash/8xx.c                                    |  33 -
 arch/powerpc/mm/nohash/Makefile                                 |   2 +-
 arch/powerpc/mm/nohash/book3e_pgtable.c                         |  15 +
 arch/powerpc/mm/nohash/fsl_book3e.c                             |  10 +-
 arch/powerpc/mm/nohash/kup.c                                    |  33 +
 arch/powerpc/mm/nohash/mmu_context.c                            |   6 +-
 arch/powerpc/mm/nohash/tlb.c                                    |  13 +-
 arch/powerpc/mm/nohash/tlb_low_64e.S                            |  40 +-
 arch/powerpc/mm/numa.c                                          |   6 +-
 arch/powerpc/mm/pgtable.c                                       |   9 +-
 arch/powerpc/mm/pgtable_64.c                                    |  14 +-
 arch/powerpc/mm/ptdump/Makefile                                 |   2 +-
 arch/powerpc/mm/ptdump/ptdump.c                                 |   6 +-
 arch/powerpc/mm/slice.c                                         |  20 -
 arch/powerpc/net/bpf_jit.h                                      |  17 +-
 arch/powerpc/net/bpf_jit_comp.c                                 |  68 +-
 arch/powerpc/net/bpf_jit_comp32.c                               | 101 ++-
 arch/powerpc/net/bpf_jit_comp64.c                               |  72 +-
 arch/powerpc/perf/8xx-pmu.c                                     |   2 +-
 arch/powerpc/perf/core-book3s.c                                 | 126 ++-
 arch/powerpc/perf/generic-compat-pmu.c                          |   2 +-
 arch/powerpc/perf/hv-24x7.c                                     |   2 +-
 arch/powerpc/perf/internal.h                                    |  18 +-
 arch/powerpc/perf/isa207-common.c                               |  60 +-
 arch/powerpc/perf/power10-pmu.c                                 |   2 +-
 arch/powerpc/perf/power5+-pmu.c                                 |   2 +-
 arch/powerpc/perf/power5-pmu.c                                  |   2 +-
 arch/powerpc/perf/power6-pmu.c                                  |   2 +-
 arch/powerpc/perf/power7-pmu.c                                  |   2 +-
 arch/powerpc/perf/power8-pmu.c                                  |   2 +-
 arch/powerpc/perf/power9-pmu.c                                  |   2 +-
 arch/powerpc/perf/ppc970-pmu.c                                  |   2 +-
 arch/powerpc/platforms/44x/fsp2.c                               |   4 +-
 arch/powerpc/platforms/4xx/cpm.c                                |   4 +-
 arch/powerpc/platforms/4xx/pci.c                                |   2 +-
 arch/powerpc/platforms/512x/clock-commonclk.c                   |  52 +-
 arch/powerpc/platforms/512x/mpc512x.h                           |   4 +-
 arch/powerpc/platforms/512x/mpc512x_shared.c                    |   4 +-
 arch/powerpc/platforms/52xx/Kconfig                             |   2 +-
 arch/powerpc/platforms/83xx/km83xx.c                            |   2 +-
 arch/powerpc/platforms/83xx/mpc834x_mds.c                       |   2 +-
 arch/powerpc/platforms/83xx/mpc837x_mds.c                       |   2 +-
 arch/powerpc/platforms/83xx/mpc837x_rdb.c                       |   2 +-
 arch/powerpc/platforms/83xx/mpc83xx.h                           |   6 +-
 arch/powerpc/platforms/83xx/usb.c                               |   6 +-
 arch/powerpc/platforms/85xx/c293pcie.c                          |   2 +-
 arch/powerpc/platforms/85xx/ge_imp3a.c                          |   2 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c                       |   2 +-
 arch/powerpc/platforms/85xx/mpc85xx_pm_ops.c                    |   2 +
 arch/powerpc/platforms/85xx/smp.c                               |   4 +-
 arch/powerpc/platforms/85xx/socrates_fpga_pic.c                 |   2 +-
 arch/powerpc/platforms/85xx/socrates_fpga_pic.h                 |   2 +-
 arch/powerpc/platforms/85xx/xes_mpc85xx.c                       |   4 +-
 arch/powerpc/platforms/Kconfig                                  |   4 +-
 arch/powerpc/platforms/Kconfig.cputype                          |  58 +-
 arch/powerpc/platforms/cell/Kconfig                             |   3 +-
 arch/powerpc/platforms/cell/cbe_regs.c                          |   2 +-
 arch/powerpc/platforms/cell/iommu.c                             |  15 +-
 arch/powerpc/platforms/cell/pervasive.c                         |   1 +
 arch/powerpc/platforms/cell/spu_base.c                          |   6 +-
 arch/powerpc/platforms/cell/spu_manage.c                        |  16 +-
 arch/powerpc/platforms/cell/spufs/inode.c                       |   2 +-
 arch/powerpc/platforms/chrp/Kconfig                             |   2 +-
 arch/powerpc/platforms/chrp/pegasos_eth.c                       |   2 +-
 arch/powerpc/platforms/embedded6xx/Kconfig                      |   2 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c                   |   5 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.h                   |   2 +-
 arch/powerpc/platforms/embedded6xx/holly.c                      |   2 +-
 arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c              |   4 +-
 arch/powerpc/platforms/embedded6xx/wii.c                        |   2 +-
 arch/powerpc/platforms/maple/Kconfig                            |   3 +-
 arch/powerpc/platforms/microwatt/Kconfig                        |   1 -
 arch/powerpc/platforms/microwatt/rng.c                          |   2 +-
 arch/powerpc/platforms/pasemi/Kconfig                           |   3 +-
 arch/powerpc/platforms/pasemi/msi.c                             |   2 +-
 arch/powerpc/platforms/pasemi/pasemi.h                          |   2 +-
 arch/powerpc/platforms/pasemi/pci.c                             |   2 +-
 arch/powerpc/platforms/pasemi/setup.c                           |   2 +-
 arch/powerpc/platforms/powermac/Kconfig                         |   3 +-
 arch/powerpc/platforms/powermac/cache.S                         |   4 +-
 arch/powerpc/platforms/powermac/feature.c                       |   2 +-
 arch/powerpc/platforms/powermac/low_i2c.c                       |   3 +
 arch/powerpc/platforms/powermac/nvram.c                         |   2 +-
 arch/powerpc/platforms/powermac/pfunc_base.c                    |   6 +-
 arch/powerpc/platforms/powermac/pic.c                           |   6 +-
 arch/powerpc/platforms/powermac/setup.c                         |   6 +-
 arch/powerpc/platforms/powermac/smp.c                           |   4 +-
 arch/powerpc/platforms/powermac/udbg_scc.c                      |   2 +-
 arch/powerpc/platforms/powernv/Kconfig                          |   2 +-
 arch/powerpc/platforms/powernv/idle.c                           |  27 +-
 arch/powerpc/platforms/powernv/opal-core.c                      |   6 +-
 arch/powerpc/platforms/powernv/opal-dump.c                      |   3 +-
 arch/powerpc/platforms/powernv/opal-elog.c                      |   3 +-
 arch/powerpc/platforms/powernv/opal-fadump.c                    |   2 +-
 arch/powerpc/platforms/powernv/opal-imc.c                       |   6 +-
 arch/powerpc/platforms/powernv/opal-lpc.c                       |   1 +
 arch/powerpc/platforms/powernv/opal-msglog.c                    |   4 +-
 arch/powerpc/platforms/powernv/opal-power.c                     |   2 +-
 arch/powerpc/platforms/powernv/opal-powercap.c                  |   2 +-
 arch/powerpc/platforms/powernv/opal-rtc.c                       |   2 +-
 arch/powerpc/platforms/powernv/opal-sensor-groups.c             |   4 +-
 arch/powerpc/platforms/powernv/opal.c                           |   8 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                       |   4 +-
 arch/powerpc/platforms/powernv/powernv.h                        |   4 +-
 arch/powerpc/platforms/powernv/rng.c                            |   2 +-
 arch/powerpc/platforms/powernv/setup.c                          |  18 +-
 arch/powerpc/platforms/ps3/gelic_udbg.c                         |   2 +-
 arch/powerpc/platforms/ps3/mm.c                                 |   4 +-
 arch/powerpc/platforms/ps3/os-area.c                            |   4 +-
 arch/powerpc/platforms/ps3/platform.h                           |  14 +-
 arch/powerpc/platforms/ps3/repository.c                         |  20 +-
 arch/powerpc/platforms/ps3/smp.c                                |   2 +-
 arch/powerpc/platforms/ps3/spu.c                                |   2 +-
 arch/powerpc/platforms/pseries/Kconfig                          |   5 -
 arch/powerpc/platforms/pseries/Makefile                         |   1 -
 arch/powerpc/platforms/pseries/event_sources.c                  |   2 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c                    |   9 +-
 arch/powerpc/platforms/pseries/iommu.c                          |   2 +-
 arch/powerpc/platforms/pseries/lpar.c                           |  71 +-
 arch/powerpc/platforms/pseries/lparcfg.c                        |   5 +-
 arch/powerpc/platforms/pseries/mobility.c                       |   4 +
 arch/powerpc/platforms/pseries/pseries.h                        |   7 +-
 arch/powerpc/platforms/pseries/ras.c                            |   2 +
 arch/powerpc/platforms/pseries/rtas-fadump.c                    |   6 +-
 arch/powerpc/platforms/pseries/scanlog.c                        | 195 -----
 arch/powerpc/platforms/pseries/setup.c                          |  10 +-
 arch/powerpc/platforms/pseries/vas.c                            |  13 +-
 arch/powerpc/platforms/pseries/vio.c                            |   6 +-
 arch/powerpc/sysdev/cpm2.c                                      |   6 +-
 arch/powerpc/sysdev/dart_iommu.c                                |   2 +-
 arch/powerpc/sysdev/fsl_mpic_err.c                              |   4 +-
 arch/powerpc/sysdev/fsl_pci.c                                   |   2 +-
 arch/powerpc/sysdev/fsl_pci.h                                   |   2 +-
 arch/powerpc/sysdev/i8259.c                                     |   2 +-
 arch/powerpc/sysdev/ipic.c                                      |   2 +-
 arch/powerpc/sysdev/mpic.c                                      |   5 +-
 arch/powerpc/sysdev/mpic.h                                      |  10 +-
 arch/powerpc/sysdev/mpic_msi.c                                  |   6 +-
 arch/powerpc/sysdev/mpic_timer.c                                |   6 +-
 arch/powerpc/sysdev/mpic_u3msi.c                                |   2 +-
 arch/powerpc/sysdev/tsi108_dev.c                                |   3 +-
 arch/powerpc/sysdev/tsi108_pci.c                                |   2 +-
 arch/powerpc/sysdev/udbg_memcons.c                              |   2 +-
 arch/powerpc/sysdev/xics/icp-hv.c                               |   2 +-
 arch/powerpc/sysdev/xics/icp-opal.c                             |   2 +-
 arch/powerpc/sysdev/xics/xics-common.c                          |   2 +-
 arch/powerpc/sysdev/xive/common.c                               | 214 +++--
 arch/powerpc/sysdev/xive/native.c                               |  19 +-
 arch/powerpc/sysdev/xive/spapr.c                                |  47 +-
 arch/powerpc/sysdev/xive/xive-internal.h                        |   2 +
 arch/powerpc/xmon/xmon.c                                        |  38 +-
 arch/powerpc/xmon/xmon_bpts.h                                   |   4 +-
 drivers/macintosh/mediabay.c                                    |   2 +-
 drivers/misc/cxl/Kconfig                                        |   1 +
 drivers/misc/lkdtm/Makefile                                     |   2 +-
 drivers/misc/lkdtm/core.c                                       |   2 +-
 drivers/misc/ocxl/file.c                                        |   4 +-
 include/linux/cuda.h                                            |   2 +-
 include/linux/pmu.h                                             |   2 +-
 include/uapi/linux/perf_event.h                                 |   5 +-
 tools/testing/selftests/powerpc/security/mitigation-patching.sh |   5 +-
 tools/testing/selftests/powerpc/security/spectre_v2.c           |   2 +-
 tools/testing/selftests/powerpc/signal/.gitignore               |   2 +
 tools/testing/selftests/powerpc/signal/Makefile                 |   2 +
 tools/testing/selftests/powerpc/signal/sigreturn_kernel.c       | 132 +++
 tools/testing/selftests/powerpc/signal/sigreturn_unaligned.c    |  43 +
 370 files changed, 5618 insertions(+), 3431 deletions(-)
 create mode 100644 arch/powerpc/include/asm/nohash/kup-booke.h
 create mode 100644 arch/powerpc/kvm/book3s_hv.h
 create mode 100644 arch/powerpc/lib/test-code-patching.c
 delete mode 100644 arch/powerpc/lib/test_code-patching.S
 delete mode 100644 arch/powerpc/mm/book3s32/kuep.c
 rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c =3D> hugetlbpage.c} (9=
8%)
 create mode 100644 arch/powerpc/mm/book3s64/trace.c
 create mode 100644 arch/powerpc/mm/nohash/kup.c
 delete mode 100644 arch/powerpc/platforms/pseries/scanlog.c
 create mode 100644 tools/testing/selftests/powerpc/signal/sigreturn_kernel=
.c
 create mode 100644 tools/testing/selftests/powerpc/signal/sigreturn_unalig=
ned.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmHhZRAACgkQUevqPMjh
pYCIlBAAhv5syhwD5t1aoueN6uqxeH89u/SaAsDrAoILt90QGZXY7ya89AsRqSxs
V5v+IxbMrTjpZ20ETyXfcFkdBVjWvE+X2EmR4jYN4dKWygjGfX68QErUspJnQRzv
YvOyypdVnYJUhs6gG5c4FHkDP1ZRsrTgqDk79olzciFmN02fuYrJxx52pko8rQsY
Tza6dYWJ/u010AaBk/WgUiFu7QzHZUjK6LT1bIjRIqDADdZKsbWhgxMx7NMQM9Rj
WpTiE/CUBrk/hd6Dx1TeOfBTw9Q/PwbJJx9RN7uV2J7AeP4cognFU6R76QLCGTit
Nhan7kavx9lAqsBKqN4Vxmw0SlUAfPg8Q1KbTS8AZ6HNqQPHOiQjMevi4D1q2tRk
CR/qRUl9eVZ+fmpawa8RrZpVtr4ztGtd1faW34BauKn3D1dhJ3jW8GV4Eut9+cOX
d7LI3ENt65EFb+YrN4yfZpON/ejGbD5lqHNMunKgZS40AYkOT32dpxOCAS1/DEi1
reV2IqCVh/px2DfDrNQkTh2sApR2KUTkm4mMgr6jMd0QzMuUvp0zRj8vTQ6Hl5Qe
hN50kUVvhr74Ezt7+1DAHw8NbEJosfHv2u48VUHgRUjml6JCLIx6vKsghRO8klAe
koc3hdwpbXY/N8y/1KL+mTo/Eik7c1c9Yaf6B/CZvgT+MPBLi3A=3D
=3Dxo7O
-----END PGP SIGNATURE-----
