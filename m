Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBC82DD22D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 14:31:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxXvV6HV6zDqVs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 00:31:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxXrY5P2gzDqVS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 00:28:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qwlLYBQt; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxXrQ1F0gz9sVp;
 Fri, 18 Dec 2020 00:28:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608211725;
 bh=7sKKRMspnLt2ThJuuQBG2qOYQ1iHFCcuIspX5IjPt8Q=;
 h=From:To:Cc:Subject:Date:From;
 b=qwlLYBQtBcFSrjel7eue8KjXCcHCU6Q4uRx/ypEnXBWH2XPbpaGhR4EnoCp3Gzt97
 TlT+xTm4f7cCLGqCSdjSUD6hJpxmPezXv4MSyMm9Pl0fOvG9ZsCzH2LCpPg59Z3MAY
 DRortoW9Qr/NZARjMzmBBVHpZdoBRM/nUWa0g9QkhvnmWe+ecvOSTypFV67iYoCfOW
 jU8QO0XVKV/8IWLoS3tAyjS5+e7XQufOe9tHaP6qEUV4B4jxF4LT1cEFG0sQRwALnW
 4Qn90HzzKAI/ChUc8+wUgkKtkK2M50IsBSSyyyo7BK/gAfw6kBw5Ak0lL/yXoYrNM6
 pQYTWQzi5ranA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.11-1 tag
Date: Fri, 18 Dec 2020 00:28:34 +1100
Message-ID: <87r1noy325.fsf@mpe.ellerman.id.au>
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
Cc: ego@linux.vnet.ibm.com, clombard@linux.vnet.ibm.com, david@redhat.com,
 aik@ozlabs.ru, jniethe5@gmail.com, srikar@linux.vnet.ibm.com,
 bala24@linux.ibm.com, oohall@gmail.com, miaoqinglang@huawei.com,
 ardb@kernel.org, ajd@linux.ibm.com, leobras.c@gmail.com, maddy@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, vincent.stehle@laposte.net, tiwai@suse.de,
 ganeshgr@linux.ibm.com, u.kleine-koenig@pengutronix.de, harish@linux.ibm.com,
 longman@redhat.com, mathieu.desnoyers@efficios.com, nathanl@linux.ibm.com,
 ravi.bangoria@linux.ibm.com, Kees Cook <keescook@chromium.org>,
 amodra@gmail.com, npiggin@gmail.com, oss@buserror.net, kaixuxia@tencent.com,
 clg@kaod.org, oleg@redhat.com, ldufour@linux.ibm.com, tangyouling@loongson.cn,
 po-hsu.lin@canonical.com, dja@axtens.net, atrajeev@linux.vnet.ibm.com,
 zhangxiaoxu5@huawei.com, linux-kernel@vger.kernel.org, tyreld@linux.ibm.com,
 fbarrat@linux.ibm.com, colin.king@canonical.com, linuxppc-dev@lists.ozlabs.org,
 morbo@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.11.

There's only one conflict I'm aware of, which is the three lkdtm files,
resolution is simply to take both sides.

Notable out of area changes:
  drivers/misc/lkdtm/*			# 3ba150fb2120 lkdtm/powerpc: Add SLB multihit test
  tools/testing/selftests/lkdtm/tests.txt

  include/linux/compat.h		# 14026b94ccfe signal: Add unsafe_put_compat_sigs=
et()
  include/linux/memory_hotplug.h	# 4abb1e5b63ac powerpc/mm: factor out crea=
ting/removing linear mapping
  include/linux/regset.h		# 640586f8af35 powerpc/ptrace: Simplify gpr_get()=
/tm_cgpr_get()

cheers


The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.11-1

for you to fetch changes up to c1bea0a840ac75dca19bc6aa05575a33eb9fd058:

  powerpc/32s: Fix cleanup_cpu_mmu_context() compile bug (2020-12-17 14:33:=
35 +1100)

- ------------------------------------------------------------------
powerpc updates for 5.11

 - Switch to the generic C VDSO, as well as some cleanups of our VDSO
   setup/handling code.

 - Support for KUAP (Kernel User Access Prevention) on systems using the ha=
shed
   page table MMU, using memory protection keys.

 - Better handling of PowerVM SMT8 systems where all threads of a core do n=
ot
   share an L2, allowing the scheduler to make better scheduling decisions.

 - Further improvements to our machine check handling.

 - Show registers when unwinding interrupt frames during stack traces.

 - Improvements to our pseries (PowerVM) partition migration code.

 - Several series from Christophe refactoring and cleaning up various parts=
 of
   the 32-bit code.

 - Other smaller features, fixes & cleanups.

Thanks to:
  Alan Modra, Alexey Kardashevskiy, Andrew Donnellan, Aneesh Kumar K.V, Ard
  Biesheuvel, Athira Rajeev, Balamuruhan S, Bill Wendling, C=C3=A9dric Le G=
oater,
  Christophe Leroy, Christophe Lombard, Colin Ian King, Daniel Axtens, David
  Hildenbrand, Frederic Barrat, Ganesh Goudar, Gautham R. Shenoy, Geert
  Uytterhoeven, Giuseppe Sacco, Greg Kurz, Harish, Jan Kratochvil, Jordan
  Niethe, Kaixu Xia, Laurent Dufour, Leonardo Bras, Madhavan Srinivasan, Ma=
hesh
  Salgaonkar, Mathieu Desnoyers, Nathan Lynch, Nicholas Piggin, Oleg Nester=
ov,
  Oliver O'Halloran, Oscar Salvador, Po-Hsu Lin, Qian Cai, Qinglang Miao, R=
andy
  Dunlap, Ravi Bangoria, Sachin Sant, Sandipan Das, Sebastian Andrzej Siewi=
or ,
  Segher Boessenkool, Srikar Dronamraju, Tyrel Datwyler, Uwe Kleine-K=C3=B6=
nig,
  Vincent Stehl=C3=A9, Youling Tang, Zhang Xiaoxu.

- ------------------------------------------------------------------
Alan Modra (1):
      powerpc/boot: Make use of REL16 relocs in powerpc/boot/util.S

Alexey Kardashevskiy (1):
      powerpc/powernv/npu: Do not attempt NPU2 setup on POWER8NVL NPU

Andrew Donnellan (1):
      powerpc/powernv: Rate limit opal-elog read failure message

Aneesh Kumar K.V (26):
      powerpc/mm: Move setting PTE specific flags to pfn_pmd()
      powerpc/mm: Update tlbiel loop on POWER10
      powerpc: Add new macro to handle NESTED_IFCLR
      KVM: PPC: BOOK3S: PR: Ignore UAMOR SPR
      powerpc/book3s64/kuap/kuep: Add PPC_PKEY config on book3s64
      powerpc/book3s64/kuap/kuep: Move uamor setup to pkey init
      powerpc/book3s64/kuap: Move KUAP related function outside radix
      powerpc/book3s64/kuep: Move KUEP related function outside radix
      powerpc/book3s64/kuap: Rename MMU_FTR_RADIX_KUAP and MMU_FTR_KUEP
      powerpc/book3s64/kuap: Use Key 3 for kernel mapping with hash transla=
tion
      powerpc/exec: Set thread.regs early during exec
      powerpc/book3s64/pkeys: Store/restore userspace AMR/IAMR correctly on=
 entry and exit from kernel
      powerpc/book3s64/pkeys: Inherit correctly on fork.
      powerpc/book3s64/pkeys: Reset userspace AMR correctly on exec
      powerpc/ptrace-view: Use pt_regs values instead of thread_struct base=
d one.
      powerpc/book3s64/pkeys: Don't update SPRN_AMR when in kernel mode.
      powerpc/book3s64/kuap: Restrict access to userspace based on userspac=
e AMR
      powerpc/book3s64/kuap: Improve error reporting with KUAP
      powerpc/book3s64/kuap: Use Key 3 to implement KUAP with hash translat=
ion.
      powerpc/book3s64/kuep: Use Key 3 to implement KUEP with hash translat=
ion.
      powerpc/book3s64/hash/kuap: Enable kuap on hash
      powerpc/book3s64/hash/kuep: Enable KUEP on hash
      powerpc/book3s64/kup: Check max key supported before enabling kup
      powerpc/book3s64/pkeys: Optimize KUAP and KUEP feature disabled case
      powerpc/book3s64/kuap: Improve error reporting with KUAP
      powerpc/64s: Mark the kuap/kuep functions non __init

Ard Biesheuvel (1):
      powerpc: Avoid broken GCC __attribute__((optimize))

Athira Rajeev (13):
      powerpc/perf: Add new power PMU flag "PPMU_P10_DD1" for power10 DD1
      powerpc/perf: Drop the check for SIAR_VALID
      powerpc/perf: Use the address from SIAR register to set cpumode flags
      powerpc/perf: Fix crash with is_sier_available when pmu is not set
      powerpc/perf: Invoke per-CPU variable access with disabled interrupts
      powerpc/perf: Fix to update radix_scope_qual in power10
      powerpc/perf: Update the PMU group constraints for l2l3 events in pow=
er10
      powerpc/perf: Fix the PMU group constraints for threshold events in p=
ower10
      powerpc/perf: Add generic and cache event list for power10 DD1
      powerpc/perf: Fix to update generic event codes for power10
      powerpc/perf: Fix to update cache events with l2l3 events in power10
      powerpc/perf: MMCR0 control for PMU registers under PMCC=3D00
      powerpc/perf: Exclude kernel samples while counting events in user sp=
ace.

Balamuruhan S (4):
      powerpc/sstep: Emulate prefixed instructions only when CPU_FTR_ARCH_3=
1 is set
      powerpc/sstep: Support VSX vector paired storage access instructions
      powerpc/ppc-opcode: Add encoding macros for VSX vector paired instruc=
tions
      powerpc/sstep: Add testcases for VSX vector paired load/store instruc=
tions

Bill Wendling (5):
      powerpc/boot: Move the .got section to after the .dynamic section
      powerpc/boot/wrapper: Add "-z rodynamic" when using LLD
      powerpc/boot/wrapper: Add "-z notext" flag to disable diagnostic
      powerpc/boot: Use clang when CC is clang
      powerpc: Work around inline asm issues in alternate feature sections

Christophe Leroy (128):
      powerpc/bitops: Fix possible undefined behaviour with fls() and fls64=
()
      powerpc/feature: Fix CPU_FTRS_ALWAYS by removing CPU_FTRS_GENERIC_32
      powerpc/64s: Replace RFI by RFI_TO_KERNEL and remove RFI
      powerpc: Replace RFI by rfi on book3s/32 and booke
      powerpc: Remove RFI macro
      powerpc: inline iomap accessors
      powerpc/feature: Use CONFIG_PPC64 instead of __powerpc64__ to define =
possible features
      powerpc/processor: Move cpu_relax() into asm/vdso/processor.h
      powerpc/time: Move timebase functions into new asm/vdso/timebase.h
      powerpc/vdso: Prepare for switching VDSO to generic C implementation.
      powerpc/vdso: Save and restore TOC pointer on PPC64
      powerpc/vdso: Switch VDSO to generic C implementation.
      powerpc/vdso: Provide __kernel_clock_gettime64() on vdso32
      powerpc/signal: Move inline functions in signal.h
      powerpc/ptrace: Move declaration of ptrace_get_reg() and ptrace_set_r=
eg()
      powerpc/ptrace: Consolidate reg index calculation
      powerpc/ptrace: Create ptrace_get_fpr() and ptrace_put_fpr()
      powerpc/signal: Don't manage floating point regs when no FPU
      powerpc/32s: Allow deselecting CONFIG_PPC_FPU on mpc832x
      powerpc/signal: Remove BUG_ON() in handler_signal functions
      powerpc/signal: Move access_ok() out of get_sigframe()
      powerpc/signal: Remove get_clean_sp()
      powerpc/signal: Call get_tm_stackpointer() from get_sigframe()
      powerpc/signal: Refactor bad frame logging
      powerpc/signal32: Simplify logging in handle_rt_signal32()
      powerpc/signal32: Move handle_signal32() close to handle_rt_signal32()
      powerpc/signal32: Rename local pointers in handle_rt_signal32()
      powerpc/signal32: Misc changes to make handle_[rt_]_signal32() more s=
imilar
      powerpc/signal32: Move signal trampoline setup to handle_[rt_]signal32
      powerpc/signal32: Switch handle_signal32() to user_access_begin() log=
ic
      powerpc/signal32: Switch handle_rt_signal32() to user_access_begin() =
logic
      powerpc/signal32: Remove ifdefery in middle of if/else
      signal: Add unsafe_put_compat_sigset()
      powerpc/signal32: Add and use unsafe_put_sigset_t()
      powerpc/signal32: Switch swap_context() to user_access_begin() logic
      powerpc/signal: Create 'unsafe' versions of copy_[ck][fpr/vsx]_to_use=
r()
      powerpc/signal32: Isolate non-copy actions in save_user_regs() and sa=
ve_tm_user_regs()
      powerpc/signal32: Transform save_user_regs() and save_tm_user_regs() =
in 'unsafe' version
      powerpc/vdso: Stripped VDSO is not needed, don't build it
      powerpc/vdso: Add missing includes and clean vdso_setup_syscall_map()
      powerpc/vdso: Rename syscall_map_32/64 to simplify vdso_setup_syscall=
_map()
      powerpc/vdso: Remove get_page() in vdso_pagelist initialization
      powerpc/vdso: Remove NULL termination element in vdso_pagelist
      powerpc/vdso: Refactor 32 bits and 64 bits pages setup
      powerpc/vdso: Remove unnecessary ifdefs in vdso_pagelist initializati=
on
      powerpc/vdso: Use VDSO size in arch_setup_additional_pages()
      powerpc/vdso: Simplify arch_setup_additional_pages() exit
      powerpc/vdso: Move to _install_special_mapping() and remove arch_vma_=
name()
      powerpc/vdso: Provide vdso_remap()
      powerpc/vdso: Replace vdso_base by vdso
      powerpc/vdso: Move vdso datapage up front
      powerpc/vdso: Simplify __get_datapage()
      powerpc/vdso: Remove unused \tmp param in __get_datapage()
      powerpc/vdso: Retrieve sigtramp offsets at buildtime
      powerpc/vdso: Use builtin symbols to locate fixup section
      powerpc/vdso: Merge __kernel_sync_dicache_p5() into __kernel_sync_dic=
ache()
      powerpc/vdso: Remove vdso32_pages and vdso64_pages
      powerpc/vdso: Remove __kernel_datapage_offset
      powerpc/vdso: Remove runtime generated sigtramp offsets
      powerpc/vdso: Remove vdso_patches[] and associated functions
      powerpc/vdso: Remove unused text member in struct lib32/64_elfinfo
      powerpc/vdso: Remove symbol section information in struct lib32/64_el=
finfo
      powerpc/vdso: Remove lib32_elfinfo and lib64_elfinfo
      powerpc/vdso: Remove vdso_setup()
      powerpc/vdso: Remove vdso_ready
      powerpc/vdso: Remove DBG()
      powerpc/vdso: Remove VDSO32_LBASE and VDSO64_LBASE
      powerpc/vdso: Cleanup vdso.h
      powerpc/32s: Always map kernel text and rodata with BATs
      powerpc/32s: Don't hash_preload() kernel text
      powerpc/32s: Fix an FTR_SECTION_ELSE
      powerpc/32s: Don't use SPRN_SPRG_PGDIR in hash_page
      powerpc/603: Use SPRN_SDR1 to store the pgdir phys address
      powerpc/32: Simplify EXCEPTION_PROLOG_1 macro
      powerpc/32s: Use SPRN_SPRG_SCRATCH2 in DSI prolog
      powerpc/32: Use SPRN_SPRG_SCRATCH2 in exception prologs
      powerpc/time: Remove ifdef in get_vtb()
      powerpc/mm: Fix verification of MMU_FTR_TYPE_44x
      powerpc/feature: Add CPU_FTR_NOEXECUTE to G2_LE
      powerpc/mm: Remove useless #ifndef CPU_FTR_COHERENT_ICACHE in mem.c
      powerpc/mm: MMU_FTR_NEED_DTLB_SW_LRU is only possible with CONFIG_PPC=
_83xx
      powerpc/mm: Desintegrate MMU_FTR_PPCAS_ARCH_V2
      powerpc/feature: Remove CPU_FTR_NODSISRALIGN
      powerpc/44x: Don't support 440 when CONFIG_PPC_47x is set
      powerpc/44x: Don't support 47x code and non 47x code at the same time
      powerpc/xmon: Change printk() to pr_cont()
      powerpc: Fix update form addressing in inline assembly
      powerpc: Retire e200 core (mpc555x processor)
      powerpc: Remove ucache_bsize
      powerpc/powermac: Fix low_sleep_handler with CONFIG_VMAP_STACK
      powerpc/mm: Add mask of always present MMU features
      powerpc/mm: Remove flush_tlb_page_nohash() prototype.
      powerpc/32s: Make bat_addrs[] static
      powerpc/32s: Use mmu_has_feature(MMU_FTR_HPTE_TABLE) instead of check=
ing Hash var
      powerpc/32s: Make Hash var static
      powerpc/32s: Declare Hash related vars as __initdata
      powerpc/32s: Move _tlbie() and _tlbia() prototypes to tlbflush.h
      powerpc/32s: Inline _tlbie() on non SMP
      powerpc/32s: Move _tlbie() and _tlbia() in a new file
      powerpc/32s: Split and inline flush_tlb_mm() and flush_tlb_page()
      powerpc/32s: Inline flush_tlb_range() and flush_tlb_kernel_range()
      powerpc/32s: Split and inline flush_range()
      powerpc/32s: Inline tlb_flush()
      powerpc/32s: Inline flush_hash_entry()
      powerpc/32s: Move early_mmu_init() into mmu.c
      powerpc/32s: Remove CONFIG_PPC_BOOK3S_6xx
      powerpc/32s: Regroup 603 based CPUs in cputable
      powerpc/32s: Make support for 603 and 604+ selectable
      powerpc/32s: Handle PROTFAULT in hash_page() also for CONFIG_PPC_KUAP
      powerpc/8xx: Fix early debug when SMC1 is relocated
      powerpc/process: Remove target specific __set_dabr()
      powerpc/8xx: DEBUG_PAGEALLOC doesn't require an ITLB miss exception h=
andler
      powerpc/8xx: Always pin kernel text TLB
      powerpc/8xx: Simplify INVALIDATE_ADJACENT_PAGES_CPU15
      powerpc/8xx: Use SPRN_SPRG_SCRATCH2 in ITLB miss exception
      powerpc/8xx: Use SPRN_SPRG_SCRATCH2 in DTLB miss exception
      powerpc/ppc-opcode: Add PPC_RAW_MFSPR()
      powerpc/mm: sanity_check_fault() should work for all, not only BOOK3S
      powerpc/fault: Unnest definition of page_fault_is_write() and page_fa=
ult_is_bad()
      powerpc/mm: Move the WARN() out of bad_kuap_fault()
      powerpc/fault: Avoid heavy search_exception_tables() verification
      powerpc/fault: Perform exception fixup in do_page_fault()
      powerpc/mm: Refactor the floor/ceiling check in hugetlb range freeing=
 functions
      powerpc/32s: Remove unused counters incremented by create_hpte()
      powerpc/32s: In add_hash_page(), calculate VSID later
      powerpc/32s: Cleanup around PTE_FLAGS_OFFSET in hash_low.S
      powerpc/mm: Fix hugetlb_free_pmd_range() and hugetlb_free_pud_range()
      powerpc: force inlining of csum_partial() to avoid multiple csum_part=
ial() with GCC10

Christophe Lombard (5):
      ocxl: Assign a register set to a Logical Partition
      ocxl: Initiate a TLB invalidate command
      ocxl: Update the Process Element Entry
      ocxl: Add mmu notifier
      ocxl: Add new kernel traces

Colin Ian King (1):
      powerpc: fix spelling mistake in Kconfig "seleted" -> "selected"

C=C3=A9dric Le Goater (12):
      KVM: PPC: Book3S HV: XIVE: Show detailed configuration in debug output
      powerpc/xive: Rename XIVE_IRQ_NO_EOI to show its a flag
      powerpc/xive: Introduce XIVE_IPI_HW_IRQ
      powerpc/xive: Add a name to the IRQ domain
      powerpc/xive: Add a debug_show handler to the XIVE irq_domain
      powerpc: Increase NR_IRQS range to support more KVM guests
      powerpc/xive: Remove P9 DD1 flag XIVE_IRQ_FLAG_SHIFT_BUG
      powerpc/xive: Remove P9 DD1 flag XIVE_IRQ_FLAG_MASK_FW
      powerpc/xive: Remove P9 DD1 flag XIVE_IRQ_FLAG_EOI_FW
      powerpc/xive: Simplify xive_do_source_eoi()
      powerpc/xive: Improve error reporting of OPAL calls
      KVM: PPC: Book3S HV: XIVE: Add a comment regarding VP numbering

Daniel Axtens (3):
      powerpc/feature-fixups: use a semicolon rather than a comma
      selftests/powerpc: update .gitignore
      powerpc: add security.config, enforcing lockdown=3Dintegrity

David Hildenbrand (8):
      powerpc/powernv/memtrace: Don't leak kernel memory to user space
      powerpc/powernv/memtrace: Fix crashing the kernel when enabling concu=
rrently
      powerpc/mm: factor out creating/removing linear mapping
      powerpc/mm: protect linear mapping modifications by a mutex
      powerpc/mm: print warning in arch_remove_linear_mapping()
      powerpc/book3s64/hash: Drop WARN_ON in hash__remove_section_mapping()
      powerpc/mm: remove linear mapping if __add_pages() fails in arch_add_=
memory()
      powernv/memtrace: don't abuse memory hot(un)plug infrastructure for m=
emory allocations

Frederic Barrat (1):
      powerpc/pseries: Define PCI bus speed for Gen4 and Gen5

Ganesh Goudar (1):
      lkdtm/powerpc: Add SLB multihit test

Gautham R. Shenoy (5):
      powerpc/smp: Parse ibm,thread-groups with multiple properties
      powerpc/smp: Rename cpu_l1_cache_map as thread_group_l1_cache_map
      powerpc/smp: Rename init_thread_group_l1_cache_map() to make it gener=
ic
      powerpc/smp: Add support detecting thread-groups sharing L2 cache
      powerpc/cacheinfo: Print correct cache-sibling map/list for L2 cache

Harish (1):
      selftests/powerpc: Fix uninitialized variable warning

Jordan Niethe (6):
      powerpc/64: Set up a kernel stack for secondaries before cpu_restore()
      powerpc/64s: Convert some cpu_setup() and cpu_restore() functions to C
      powerpc/64: Fix an EMIT_BUG_ENTRY in head_64.S
      powerpc: Allow relative pointers in bug table entries
      powerpc/book3s64/kexec: Clear CIABR on kexec
      powerpc/powernv/idle: Restore CIABR after idle for Power9

Kaixu Xia (4):
      powerpc/powernv/sriov: fix unsigned int win compared to less than zero
      powerpc/mm: Fix comparing pointer to 0 warning
      KVM: PPC: Book3S: Assign boolean values to a bool variable
      KVM: PPC: fix comparison to bool warning

Laurent Dufour (1):
      powerpc/pseries/memhotplug: Quieten some DLPAR operations

Leonardo Bras (1):
      KVM: PPC: Book3S HV: Fix mask size for emulated msgsndp

Madhavan Srinivasan (2):
      powerpc/perf: Use regs->nip when SIAR is zero
      powerpc/perf: Fix Threshold Event Counter Multiplier width for P10

Mathieu Desnoyers (1):
      powerpc: Fix incorrect stw{, ux, u, x} instructions in __set_pte_at

Michael Ellerman (12):
      powerpc/85xx: Fix declaration made after definition
      powerpc/ps3: Drop unused DBG macro
      Merge branch 'fixes' into next
      powerpc: Make NUMA depend on SMP
      powerpc: Make NUMA default y for powernv
      powerpc: Update NUMA Kconfig description & help text
      powerpc/time: Fix mftb()/get_tb() for use with the compat VDSO
      powerpc/barrier: Use CONFIG_PPC64 for barrier selection
      powerpc: Inline setup_kup()
      powerpc/configs: Add ppc64le_allnoconfig target
      powerpc: Add config fragment for disabling -Werror
      powerpc/32s: Fix cleanup_cpu_mmu_context() compile bug

Nathan Lynch (28):
      powerpc/rtas: prevent suspend-related sys_rtas use on LE
      powerpc/rtas: complete ibm,suspend-me status codes
      powerpc/rtas: rtas_ibm_suspend_me -> rtas_ibm_suspend_me_unsafe
      powerpc/rtas: add rtas_ibm_suspend_me()
      powerpc/rtas: add rtas_activate_firmware()
      powerpc/hvcall: add token and codes for H_VASI_SIGNAL
      powerpc/pseries/mobility: don't error on absence of ibm, update-nodes
      powerpc/pseries/mobility: add missing break to default case
      powerpc/pseries/mobility: error message improvements
      powerpc/pseries/mobility: use rtas_activate_firmware() on resume
      powerpc/pseries/mobility: extract VASI session polling logic
      powerpc/pseries/mobility: use stop_machine for join/suspend
      powerpc/pseries/mobility: signal suspend cancellation to platform
      powerpc/pseries/mobility: retry partition suspend after error
      powerpc/rtas: dispatch partition migration requests to pseries
      powerpc/rtas: remove rtas_ibm_suspend_me_unsafe()
      powerpc/pseries/hibernation: drop pseries_suspend_begin() from suspen=
d ops
      powerpc/pseries/hibernation: pass stream id via function arguments
      powerpc/pseries/hibernation: remove pseries_suspend_cpu()
      powerpc/machdep: remove suspend_disable_cpu()
      powerpc/rtas: remove rtas_suspend_cpu()
      powerpc/pseries/hibernation: switch to rtas_ibm_suspend_me()
      powerpc/rtas: remove unused rtas_suspend_last_cpu()
      powerpc/pseries/hibernation: remove redundant cacheinfo update
      powerpc/pseries/hibernation: perform post-suspend fixups later
      powerpc/pseries/hibernation: remove prepare_late() callback
      powerpc/rtas: remove unused rtas_suspend_me_data
      powerpc/pseries/mobility: refactor node lookup during DT update

Nicholas Piggin (13):
      powerpc/64s/perf: perf interrupt does not have to get_user_pages to a=
ccess user memory
      powerpc: show registers when unwinding interrupt frames
      powerpc/64s/powernv: Allow KVM to handle guest machine check details
      KVM: PPC: Book3S HV: Don't attempt to recover machine checks for FWNM=
I enabled guests
      KVM: PPC: Book3S HV: Ratelimit machine check messages coming from gue=
sts
      powerpc/64s/powernv: Ratelimit harmless HMI error printing
      powerpc/64s/pseries: Add ERAT specific machine check handler
      powerpc/64s: Remove "Host" from MCE logging
      powerpc/64s: Tidy machine check SLB logging
      powerpc/64s/iommu: Don't use atomic_ function on atomic64_t type
      powerpc/64s: Remove MSR[ISF] bit
      powerpc/64: irq replay remove decrementer overflow check
      powerpc/64s: Remove idle workaround code from restore_cpu_cpufeatures

Oleg Nesterov (2):
      powerpc/ptrace: Simplify gpr_get()/tm_cgpr_get()
      powerpc/ptrace: Hard wire PT_SOFTE value to 1 in gpr_get() too

Oliver O'Halloran (2):
      powerpc/pci: Remove LSI mappings on device teardown
      powernv/pci: Print an error when device enable is blocked

Po-Hsu Lin (1):
      selftests/powerpc/eeh: disable kselftest timeout setting for eeh-basic

Qinglang Miao (1):
      powerpc: sysdev: add missing iounmap() on error in mpic_msgr_probe()

Ravi Bangoria (3):
      powerpc/xmon: Fix build failure for 8xx
      powerpc/sstep: Cover new VSX instructions under CONFIG_VSX
      powerpc/watchpoint: Workaround P10 DD1 issue with VSX-32 byte instruc=
tions

Srikar Dronamraju (4):
      powerpc: Refactor is_kvm_guest() declaration to new header
      powerpc: Rename is_kvm_guest() to check_kvm_guest()
      powerpc: Reintroduce is_kvm_guest() as a fast-path check
      powerpc/paravirt: Use is_kvm_guest() in vcpu_is_preempted()

Tyrel Datwyler (1):
      powerpc/rtas: Fix typo of ibm,open-errinjct in RTAS filter

Uwe Kleine-K=C3=B6nig (2):
      ALSA: ppc: drop if block with always false condition
      powerpc/ps3: make system bus's remove and shutdown callbacks return v=
oid

Vincent Stehl=C3=A9 (1):
      powerpc/ps3: use dma_mapping_error()

Youling Tang (2):
      powerpc: Use the common INIT_DATA_SECTION macro in vmlinux.lds.S
      powerpc: Use common STABS_DEBUG and DWARF_DEBUG and ELF_DETAILS macro

Zhang Xiaoxu (1):
      Revert "powerpc/pseries/hotplug-cpu: Remove double free in error path"


 arch/powerpc/Kconfig                                |  26 +-
 arch/powerpc/Makefile                               |  29 +-
 arch/powerpc/boot/Makefile                          |   4 +
 arch/powerpc/boot/ps3.c                             |   7 -
 arch/powerpc/boot/util.S                            |   9 +-
 arch/powerpc/boot/wrapper                           |   6 +-
 arch/powerpc/boot/zImage.lds.S                      |  21 +-
 arch/powerpc/configs/disable-werror.config          |   1 +
 arch/powerpc/configs/ppc64le.config                 |   2 +
 arch/powerpc/configs/security.config                |  15 +
 arch/powerpc/include/asm/atomic.h                   |   9 +-
 arch/powerpc/include/asm/barrier.h                  |   2 +-
 arch/powerpc/include/asm/bitops.h                   |  23 +-
 arch/powerpc/include/asm/book3s/32/kup.h            |   6 +-
 arch/powerpc/include/asm/book3s/32/mmu-hash.h       |   3 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h        |  21 +-
 arch/powerpc/include/asm/book3s/32/tlbflush.h       |  69 +-
 arch/powerpc/include/asm/book3s/64/hash-pkey.h      |  25 +-
 arch/powerpc/include/asm/book3s/64/hash.h           |   2 +-
 arch/powerpc/include/asm/book3s/64/kexec.h          |   5 +
 arch/powerpc/include/asm/book3s/64/kup-radix.h      | 205 ------
 arch/powerpc/include/asm/book3s/64/kup.h            | 442 +++++++++++++
 arch/powerpc/include/asm/book3s/64/mmu-hash.h       |  29 +-
 arch/powerpc/include/asm/book3s/64/mmu.h            |   4 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h        |  17 +-
 arch/powerpc/include/asm/book3s/64/pkeys.h          |   2 +
 arch/powerpc/include/asm/bug.h                      |   9 +-
 arch/powerpc/include/asm/checksum.h                 |   2 +-
 arch/powerpc/include/asm/clocksource.h              |   7 +
 arch/powerpc/include/asm/cpm1.h                     |   1 +
 arch/powerpc/include/asm/cpu_setup_power.h          |  12 +
 arch/powerpc/include/asm/cputable.h                 |  76 +--
 arch/powerpc/include/asm/elf.h                      |   4 +-
 arch/powerpc/include/asm/feature-fixups.h           |  25 +-
 arch/powerpc/include/asm/firmware.h                 |   6 -
 arch/powerpc/include/asm/hvcall.h                   |   9 +
 arch/powerpc/include/asm/io.h                       | 158 ++++-
 arch/powerpc/include/asm/kup.h                      |  15 +-
 arch/powerpc/include/asm/kvm_guest.h                |  25 +
 arch/powerpc/include/asm/kvm_para.h                 |   2 +-
 arch/powerpc/include/asm/machdep.h                  |   1 -
 arch/powerpc/include/asm/mce.h                      |   1 +
 arch/powerpc/include/asm/mm-arch-hooks.h            |  25 -
 arch/powerpc/include/asm/mmu.h                      |  71 +-
 arch/powerpc/include/asm/mmu_context.h              |   8 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h        |   3 +-
 arch/powerpc/include/asm/nohash/32/mmu-40x.h        |   2 +-
 arch/powerpc/include/asm/nohash/32/mmu-44x.h        |   2 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h        |   2 +-
 arch/powerpc/include/asm/nohash/mmu-book3e.h        |   2 +-
 arch/powerpc/include/asm/nohash/pgtable.h           |   4 +-
 arch/powerpc/include/asm/nohash/tlbflush.h          |   1 -
 arch/powerpc/include/asm/opal-api.h                 |   6 +-
 arch/powerpc/include/asm/page_32.h                  |   6 -
 arch/powerpc/include/asm/paravirt.h                 |  18 +
 arch/powerpc/include/asm/perf_event_server.h        |   1 +
 arch/powerpc/include/asm/pnv-ocxl.h                 |  54 ++
 arch/powerpc/include/asm/ppc-opcode.h               |  16 +-
 arch/powerpc/include/asm/ppc_asm.h                  |   8 +-
 arch/powerpc/include/asm/processor.h                |  33 +-
 arch/powerpc/include/asm/ps3.h                      |   4 +-
 arch/powerpc/include/asm/ptrace.h                   |  18 +-
 arch/powerpc/include/asm/reg.h                      |  44 +-
 arch/powerpc/include/asm/reg_booke.h                |  12 -
 arch/powerpc/include/asm/rtas-types.h               |   8 -
 arch/powerpc/include/asm/rtas.h                     |  17 +-
 arch/powerpc/include/asm/smp.h                      |   6 +
 arch/powerpc/include/asm/thread_info.h              |   2 -
 arch/powerpc/include/asm/time.h                     |  33 +-
 arch/powerpc/include/asm/timex.h                    |   2 +-
 arch/powerpc/include/asm/tlb.h                      |   3 -
 arch/powerpc/include/asm/vdso.h                     |  29 +-
 arch/powerpc/include/asm/vdso/clocksource.h         |   7 +
 arch/powerpc/include/asm/vdso/gettimeofday.h        | 201 ++++++
 arch/powerpc/include/asm/vdso/processor.h           |  23 +
 arch/powerpc/include/asm/vdso/timebase.h            |  79 +++
 arch/powerpc/include/asm/vdso/vsyscall.h            |  25 +
 arch/powerpc/include/asm/vdso_datapage.h            |  57 +-
 arch/powerpc/include/asm/xive.h                     |   8 +-
 arch/powerpc/kernel/Makefile                        |   3 +
 arch/powerpc/kernel/asm-offsets.c                   |  58 +-
 arch/powerpc/kernel/cacheinfo.c                     |  30 +-
 arch/powerpc/kernel/cpu_setup_fsl_booke.S           |   9 -
 arch/powerpc/kernel/cpu_setup_power.S               | 252 -------
 arch/powerpc/kernel/cpu_setup_power.c               | 272 ++++++++
 arch/powerpc/kernel/cputable.c                      | 175 ++---
 arch/powerpc/kernel/dt_cpu_ftrs.c                   |  31 +-
 arch/powerpc/kernel/entry_32.S                      |  49 +-
 arch/powerpc/kernel/entry_64.S                      |   8 +-
 arch/powerpc/kernel/exceptions-64e.S                |   2 +-
 arch/powerpc/kernel/exceptions-64s.S                |   6 +-
 arch/powerpc/kernel/firmware.c                      |  11 +-
 arch/powerpc/kernel/head_32.h                       |  37 +-
 arch/powerpc/kernel/head_64.S                       |  22 +-
 arch/powerpc/kernel/head_8xx.S                      |  59 +-
 arch/powerpc/kernel/head_book3s_32.S                |  96 +--
 arch/powerpc/kernel/head_booke.h                    |   5 +-
 arch/powerpc/kernel/head_fsl_booke.S                |  57 +-
 arch/powerpc/kernel/hw_breakpoint.c                 |  67 +-
 arch/powerpc/kernel/iomap.c                         | 166 -----
 arch/powerpc/kernel/irq.c                           |  53 +-
 arch/powerpc/kernel/mce.c                           |   4 +-
 arch/powerpc/kernel/mce_power.c                     |  98 +--
 arch/powerpc/kernel/paca.c                          |   4 +-
 arch/powerpc/kernel/pci-common.c                    |  82 ++-
 arch/powerpc/kernel/process.c                       | 108 +--
 arch/powerpc/kernel/prom.c                          |   1 -
 arch/powerpc/kernel/ptrace/Makefile                 |   3 +-
 arch/powerpc/kernel/ptrace/ptrace-decl.h            |  21 +
 arch/powerpc/kernel/ptrace/ptrace-fpu.c             |  40 ++
 arch/powerpc/kernel/ptrace/ptrace-tm.c              |  19 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c            |  26 +-
 arch/powerpc/kernel/ptrace/ptrace.c                 |  54 +-
 arch/powerpc/kernel/ptrace/ptrace32.c               |   2 +
 arch/powerpc/kernel/rtas.c                          | 245 +++----
 arch/powerpc/kernel/setup-common.c                  |   8 +-
 arch/powerpc/kernel/setup.h                         |   6 -
 arch/powerpc/kernel/setup_32.c                      |   3 -
 arch/powerpc/kernel/setup_64.c                      |   2 +-
 arch/powerpc/kernel/signal.c                        |  59 +-
 arch/powerpc/kernel/signal.h                        | 115 +++-
 arch/powerpc/kernel/signal_32.c                     | 602 +++++++++--------
 arch/powerpc/kernel/signal_64.c                     |  25 +-
 arch/powerpc/kernel/smp.c                           | 241 +++++--
 arch/powerpc/kernel/syscall_64.c                    |  38 +-
 arch/powerpc/kernel/time.c                          | 100 +--
 arch/powerpc/kernel/traps.c                         |  33 +-
 arch/powerpc/kernel/vdso.c                          | 688 +++-------------=
----
 arch/powerpc/kernel/vdso32/Makefile                 |  53 +-
 arch/powerpc/kernel/vdso32/cacheflush.S             |  19 +-
 arch/powerpc/kernel/vdso32/datapage.S               |   7 +-
 arch/powerpc/kernel/vdso32/gen_vdso_offsets.sh      |  16 +
 arch/powerpc/kernel/vdso32/gettimeofday.S           | 300 +--------
 arch/powerpc/kernel/vdso32/vdso32.lds.S             |  68 +-
 arch/powerpc/kernel/vdso32/vgettimeofday.c          |  34 +
 arch/powerpc/kernel/vdso64/Makefile                 |  48 +-
 arch/powerpc/kernel/vdso64/cacheflush.S             |  18 +-
 arch/powerpc/kernel/vdso64/datapage.S               |   7 +-
 arch/powerpc/kernel/vdso64/gen_vdso_offsets.sh      |  16 +
 arch/powerpc/kernel/vdso64/gettimeofday.S           | 242 +------
 arch/powerpc/kernel/vdso64/vdso64.lds.S             |  67 +-
 arch/powerpc/kernel/vdso64/vgettimeofday.c          |  29 +
 arch/powerpc/kernel/vmlinux.lds.S                   |  19 +-
 arch/powerpc/kvm/book3s_emulate.c                   |   6 +
 arch/powerpc/kvm/book3s_hv.c                        |  33 +-
 arch/powerpc/kvm/book3s_hv_builtin.c                |  11 +-
 arch/powerpc/kvm/book3s_hv_ras.c                    |  23 +-
 arch/powerpc/kvm/book3s_pr.c                        |   2 +-
 arch/powerpc/kvm/book3s_rmhandlers.S                |   4 +-
 arch/powerpc/kvm/book3s_xics.c                      |   4 +-
 arch/powerpc/kvm/book3s_xive.c                      | 134 ++--
 arch/powerpc/kvm/book3s_xive.h                      |  13 +
 arch/powerpc/kvm/book3s_xive_native.c               |  24 +-
 arch/powerpc/kvm/book3s_xive_template.c             |   5 -
 arch/powerpc/kvm/booke.c                            |   6 +-
 arch/powerpc/kvm/powerpc.c                          |   4 +-
 arch/powerpc/lib/feature-fixups.c                   |   8 +-
 arch/powerpc/lib/sstep.c                            | 160 ++++-
 arch/powerpc/lib/test_emulate_step.c                | 270 ++++++++
 arch/powerpc/mm/book3s32/Makefile                   |   2 +-
 arch/powerpc/mm/book3s32/hash_low.S                 | 169 +----
 arch/powerpc/mm/book3s32/mmu.c                      |  30 +-
 arch/powerpc/mm/book3s32/nohash_low.S               |  80 +++
 arch/powerpc/mm/book3s32/tlb.c                      |  89 +--
 arch/powerpc/mm/book3s64/Makefile                   |   2 +-
 arch/powerpc/mm/book3s64/hash_4k.c                  |   2 +-
 arch/powerpc/mm/book3s64/hash_64k.c                 |   4 +-
 arch/powerpc/mm/book3s64/hash_hugepage.c            |   2 +-
 arch/powerpc/mm/book3s64/hash_hugetlbpage.c         |   2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c             |   2 +-
 arch/powerpc/mm/book3s64/hash_utils.c               |  12 +-
 arch/powerpc/mm/book3s64/iommu_api.c                |   2 +-
 arch/powerpc/mm/book3s64/pgtable.c                  |   8 +-
 arch/powerpc/mm/book3s64/pkeys.c                    | 151 +++--
 arch/powerpc/mm/book3s64/radix_pgtable.c            |  45 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                |  23 +-
 arch/powerpc/mm/book3s64/slb.c                      |  66 +-
 arch/powerpc/mm/fault.c                             |  79 ++-
 arch/powerpc/mm/hugetlbpage.c                       |  64 +-
 arch/powerpc/mm/init-common.c                       |  10 +-
 arch/powerpc/mm/mem.c                               |  60 +-
 arch/powerpc/mm/mmu_decl.h                          |   6 -
 arch/powerpc/mm/nohash/8xx.c                        |   3 +-
 arch/powerpc/mm/nohash/fsl_booke.c                  |  12 +-
 arch/powerpc/mm/nohash/tlb_low.S                    |  29 +-
 arch/powerpc/mm/pgtable_32.c                        |   6 +-
 arch/powerpc/perf/8xx-pmu.c                         |  16 +-
 arch/powerpc/perf/callchain.h                       |   2 +-
 arch/powerpc/perf/callchain_32.c                    |   8 +-
 arch/powerpc/perf/callchain_64.c                    |   7 +-
 arch/powerpc/perf/core-book3s.c                     |  65 +-
 arch/powerpc/perf/isa207-common.c                   |  38 +-
 arch/powerpc/perf/isa207-common.h                   |  20 +-
 arch/powerpc/perf/power10-events-list.h             |   9 +
 arch/powerpc/perf/power10-pmu.c                     | 184 +++++-
 arch/powerpc/platforms/85xx/corenet_generic.c       |   3 +-
 arch/powerpc/platforms/8xx/Kconfig                  |   7 -
 arch/powerpc/platforms/8xx/micropatch.c             |  11 +
 arch/powerpc/platforms/Kconfig.cputype              |  57 +-
 arch/powerpc/platforms/powermac/sleep.S             | 132 ++--
 arch/powerpc/platforms/powernv/Kconfig              |   8 +-
 arch/powerpc/platforms/powernv/idle.c               |   3 +
 arch/powerpc/platforms/powernv/memtrace.c           | 175 +++--
 arch/powerpc/platforms/powernv/npu-dma.c            |  16 +-
 arch/powerpc/platforms/powernv/ocxl.c               | 114 ++++
 arch/powerpc/platforms/powernv/opal-elog.c          |   4 +-
 arch/powerpc/platforms/powernv/opal-hmi.c           |  29 +-
 arch/powerpc/platforms/powernv/opal.c               |   2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c           |   4 +-
 arch/powerpc/platforms/powernv/pci-sriov.c          |   2 +-
 arch/powerpc/platforms/ps3/system-bus.c             |   5 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c        |   1 +
 arch/powerpc/platforms/pseries/hotplug-memory.c     |  12 +-
 arch/powerpc/platforms/pseries/mobility.c           | 358 ++++++++--
 arch/powerpc/platforms/pseries/pci.c                |  51 +-
 arch/powerpc/platforms/pseries/ras.c                |   5 +-
 arch/powerpc/platforms/pseries/smp.c                |   3 +-
 arch/powerpc/platforms/pseries/suspend.c            |  79 +--
 arch/powerpc/sysdev/mpic_msgr.c                     |   2 +-
 arch/powerpc/sysdev/xive/common.c                   | 207 +++---
 arch/powerpc/sysdev/xive/native.c                   |  46 +-
 arch/powerpc/sysdev/xive/spapr.c                    |   8 +-
 arch/powerpc/sysdev/xive/xive-internal.h            |   7 +-
 arch/powerpc/xmon/nonstdio.c                        |   2 +-
 arch/powerpc/xmon/xmon.c                            |   6 +-
 drivers/block/ps3disk.c                             |   3 +-
 drivers/block/ps3vram.c                             |   3 +-
 drivers/char/ps3flash.c                             |   3 +-
 drivers/misc/lkdtm/Makefile                         |   1 +
 drivers/misc/lkdtm/core.c                           |   3 +
 drivers/misc/lkdtm/lkdtm.h                          |   3 +
 drivers/misc/lkdtm/powerpc.c                        | 120 ++++
 drivers/misc/ocxl/context.c                         |   4 +-
 drivers/misc/ocxl/link.c                            |  70 +-
 drivers/misc/ocxl/ocxl_internal.h                   |   9 +-
 drivers/misc/ocxl/trace.h                           |  64 ++
 drivers/net/ethernet/toshiba/ps3_gelic_net.c        |   3 +-
 drivers/ps3/ps3-lpm.c                               |   3 +-
 drivers/ps3/ps3-vuart.c                             |  10 +-
 drivers/ps3/ps3stor_lib.c                           |   2 +-
 drivers/scsi/cxlflash/ocxl_hw.c                     |   6 +-
 drivers/scsi/ps3rom.c                               |   3 +-
 drivers/usb/host/ehci-ps3.c                         |   4 +-
 drivers/usb/host/ohci-ps3.c                         |   4 +-
 drivers/video/fbdev/ps3fb.c                         |   4 +-
 include/linux/compat.h                              |  32 +
 include/linux/memory_hotplug.h                      |   3 +
 include/linux/regset.h                              |  12 +
 include/misc/ocxl.h                                 |   2 +-
 sound/ppc/snd_ps3.c                                 |   3 +-
 tools/testing/selftests/lkdtm/tests.txt             |   1 +
 tools/testing/selftests/powerpc/eeh/Makefile        |   2 +-
 tools/testing/selftests/powerpc/eeh/settings        |   1 +
 tools/testing/selftests/powerpc/mm/bad_accesses.c   |   2 +-
 tools/testing/selftests/powerpc/nx-gzip/.gitignore  |   3 +
 tools/testing/selftests/powerpc/security/.gitignore |   1 +
 tools/testing/selftests/powerpc/signal/.gitignore   |   1 +
 tools/testing/selftests/powerpc/syscalls/.gitignore |   1 +
 258 files changed, 6011 insertions(+), 4965 deletions(-)
 create mode 100644 arch/powerpc/configs/disable-werror.config
 create mode 100644 arch/powerpc/configs/ppc64le.config
 create mode 100644 arch/powerpc/configs/security.config
 delete mode 100644 arch/powerpc/include/asm/book3s/64/kup-radix.h
 create mode 100644 arch/powerpc/include/asm/book3s/64/kup.h
 create mode 100644 arch/powerpc/include/asm/clocksource.h
 create mode 100644 arch/powerpc/include/asm/cpu_setup_power.h
 create mode 100644 arch/powerpc/include/asm/kvm_guest.h
 delete mode 100644 arch/powerpc/include/asm/mm-arch-hooks.h
 create mode 100644 arch/powerpc/include/asm/vdso/clocksource.h
 create mode 100644 arch/powerpc/include/asm/vdso/gettimeofday.h
 create mode 100644 arch/powerpc/include/asm/vdso/processor.h
 create mode 100644 arch/powerpc/include/asm/vdso/timebase.h
 create mode 100644 arch/powerpc/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/powerpc/kernel/cpu_setup_power.S
 create mode 100644 arch/powerpc/kernel/cpu_setup_power.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-fpu.c
 create mode 100755 arch/powerpc/kernel/vdso32/gen_vdso_offsets.sh
 create mode 100644 arch/powerpc/kernel/vdso32/vgettimeofday.c
 create mode 100755 arch/powerpc/kernel/vdso64/gen_vdso_offsets.sh
 create mode 100644 arch/powerpc/kernel/vdso64/vgettimeofday.c
 create mode 100644 arch/powerpc/mm/book3s32/nohash_low.S
 create mode 100644 drivers/misc/lkdtm/powerpc.c
 create mode 100644 tools/testing/selftests/powerpc/eeh/settings
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/.gitignore
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl/bW0UACgkQUevqPMjh
pYCkXg//TIbruNsuWQ1NF0Qg/o6r6Rw0meQ04fi1iqNvlg0q5IrAKaR4He75+i2R
foZZTStXZ/GZ1a8XdVjxPUBfgfXmbAtMucu8233EXLGvQ/z4G91OLRL1Rjml/DxD
GAbr+TGV2qZZZUHb+Bnefr1cDXbOgB+EArrb1pE3NFYQWBZCbgd/bq0aIUwpBX8a
ef7R9XtdRp5WowgU3ZX1SlQhY6obXz5Xuqz4K1k5rrl477K7BQCjqnD4jmmU33nI
UK5adRdNk/Fce4CTx/CxsaH197geeF3604j5qOUZdBhMhWeAHXKndigolaYgZNEg
sjlhJ7zSxXBC7vHK5fS6IeTI2dlZBnv63g6STHzj7MhGiaoZ9ETTYzF8Qlzl7Bg2
icx/KOt3bc09NYpqsiGQ1Hr8HbK5Nq+3DufYm1wFvk9ngOrPhCPnPk69wv1e6rlX
R5E7D7WIsNroiNNMsx5mfQIsU2ZScy+GLFK4EBr5I2sJfqiZULijmOnBdPRVaU1Q
p2yrw93ji2De+C5BsYq1YOPK6reDXXJjjye54C/7RyPg5zEmjUP40fLHU98n/ZPY
QDwj6uCQLTfYJ1INRt53FKvefFm6Y+EKB+9G/lC+7w4gne2WTLPRRl0go9jwEqba
4hShAIonoXq0UwcM2fNZRa6JfD0yJwqWjzHRghnMeNaXr6AgATU=3D
=3DLHXh
-----END PGP SIGNATURE-----
