Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 879EC28FCE4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 05:29:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCBV06prBzDr2q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 14:29:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCBNL1d4rzDqfS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 14:24:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pYa6cFSK; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CCBN906hLz9sTD;
 Fri, 16 Oct 2020 14:24:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602818689;
 bh=0IYhRZXOFdfXHIWpSHi0u7xndx/3OPAatlBJJT1pXak=;
 h=From:To:Cc:Subject:Date:From;
 b=pYa6cFSKUxQHzHhI+Nb4gDmvW9bUVyg+JLPPm0sLv7Z5zUMyRtsnpACwsMl8Iywxb
 ioA8z+5WsyFKkHsO/Ku8sV6rmpFqX7juY4+5Cskrkb+2Q/N5GeewdztNwzqSa7eA5V
 SXWugHqjVS3LJTkLaUqMdnCOEI0q4yN3OQeITf+ngRwmPw+s4cclZ/dLaITCJmKKLv
 0GlV8NBNgJDXIpp3qBSa1uNlIG8uDZrV3CUGqexo4QTxA/8FUmkpG+x/o9d1bWH10l
 3fPFATR9lxTDaOeu3UM8Zg3u2UQs5yBS+lplzK+S+t25y9/g/kPYeOt8+Emqjp7W3P
 WUnCOnb1q2OeA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.10-1 tag
Date: Fri, 16 Oct 2020 14:24:39 +1100
Message-ID: <87a6wmzwco.fsf@mpe.ellerman.id.au>
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
Cc: ego@linux.vnet.ibm.com, steve@sk2.org, srikar@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, peterz@infradead.org, jniethe5@gmail.com,
 mahesh@linux.ibm.com, liushixin2@huawei.com, oohall@gmail.com,
 fthain@telegraphics.com.au, hofrat@osadl.org, hch@lst.de, leobras.c@gmail.com,
 aneesh.kumar@linux.ibm.com, wangwensheng4@huawei.com, joel@jms.id.au,
 yangyingliang@huawei.com, naveen.n.rao@linux.vnet.ibm.com,
 mrochs@linux.ibm.com, zhengbin13@huawei.com, nathanl@linux.ibm.com,
 biwen.li@nxp.com, ajd@linux.ibm.com, sfr@canb.auug.org.au, kjain@linux.ibm.com,
 npiggin@gmail.com, cai@lca.pw, clg@kaod.org, vaibhav@linux.ibm.com,
 dja@axtens.net, atrajeev@linux.vnet.ibm.com, gromero@linux.ibm.com,
 cheloha@linux.ibm.com, yanaijie@huawei.com, linux-kernel@vger.kernel.org,
 leoyang.li@nxp.com, wsa@kernel.org, miaoqinglang@huawei.com,
 fbarrat@linux.ibm.com, colin.king@canonical.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.10.

Just two minor conflicts I'm aware of. The only slight subtlety is the conf=
lict
in kasan_init() where "int ret" needs to move out of the for_each_mem_range=
()
and up to the function scope.

Notable out of area changes:
  arch/sparc/kernel/smp_64.c	# bafb056ce279 sparc64: remove mm_cpumask clea=
ring to fix kthread_use_mm race
  fs/exec.c			# d53c3dfb23c4 mm: fix exec activate_mm vs TLB shootdown and =
lazy tlb switching race
  include/uapi/linux/mman.h	# e47168f3d1b1 powerpc/8xx: Support 16k hugepag=
es with 4k pages
  include/uapi/asm-generic/hugetlb_encode.h	# as above

cheers


The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.10-1

for you to fetch changes up to ffd0b25ca049a477cb757e5bcf2d5e1664d12e5d:

  Revert "powerpc/pci: unmap legacy INTx interrupts when a PHB is removed" =
(2020-10-15 13:42:49 +1100)


- ------------------------------------------------------------------
powerpc updates for 5.10

 - A series from Nick adding ARCH_WANT_IRQS_OFF_ACTIVATE_MM & selecting it =
for
   powerpc, as well as a related fix for sparc.

 - Remove support for PowerPC 601.

 - Some fixes for watchpoints & addition of a new ptrace flag for detecting=
 ISA
   v3.1 (Power10) watchpoint features.

 - A fix for kernels using 4K pages and the hash MMU on bare metal Power9
   systems with > 16TB of RAM, or RAM on the 2nd node.

 - A basic idle driver for shallow stop states on Power10.

 - Tweaks to our sched domains code to better inform the scheduler about the
   hardware topology on Power9/10, where two SMT4 cores can be presented by
   firmware as an SMT8 core.

 - A series doing further reworks & cleanups of our EEH code.

 - Addition of a filter for RTAS (firmware) calls done via sys_rtas(), to
   prevent root from overwriting kernel memory.

 - Other smaller features, fixes & cleanups.

Thanks to:
  Alexey Kardashevskiy, Andrew Donnellan, Aneesh Kumar K.V, Athira Rajeev, =
Biwen
  Li, Cameron Berkenpas, C=C3=A9dric Le Goater, Christophe Leroy, Christoph=
 Hellwig,
  Colin Ian King, Daniel Axtens, David Dai, Finn Thain, Frederic Barrat, Ga=
utham
  R. Shenoy, Greg Kurz, Gustavo Romero, Ira Weiny, Jason Yan, Joel Stanley,
  Jordan Niethe, Kajol Jain, Konrad Rzeszutek Wilk, Laurent Dufour, Leonardo
  Bras, Liu Shixin, Luca Ceresoli, Madhavan Srinivasan, Mahesh Salgaonkar,
  Nathan Lynch, Nicholas Mc Guire, Nicholas Piggin, Nick Desaulniers, Oliver
  O'Halloran, Pedro Miraglia Franco de Carvalho, Pratik Rajesh Sampat, Qian=
 Cai,
  Qinglang Miao, Ravi Bangoria, Russell Currey, Satheesh Rajendran, Scott
  Cheloha, Segher Boessenkool, Srikar Dronamraju, Stan Johnson, Stephen Kit=
t,
  Stephen Rothwell, Thiago Jung Bauermann, Tyrel Datwyler, Vaibhav Jain,
  Vaidyanathan Srinivasan, Vasant Hegde, Wang Wensheng, Wolfram Sang, Yang
  Yingliang, zhengbin.

- ------------------------------------------------------------------
Andrew Donnellan (2):
      powerpc/rtas: Restrict RTAS requests from userspace
      selftests/powerpc: Add a rtas_filter selftest

Aneesh Kumar K.V (11):
      powerpc/vmemmap: Fix memory leak with vmemmap list allocation failure=
s.
      powerpc/vmemmap: Don't warn if we don't find a mapping vmemmap list e=
ntry
      powerpc/percpu: Update percpu bootmem allocator
      powerpc/64/mm: implement page mapping percpu first chunk allocator
      powerpc/book3s64/hash/4k: Support large linear mapping range with 4K
      powerpc/mm/book3s: Split radix and hash MAX_PHYSMEM limit
      powerepc/book3s64/hash: Align start/end address correctly with bolt m=
apping
      powerpc/drmem: Make lmb_size 64 bit
      powerpc/memhotplug: Make lmb size 64bit
      powerpc/book3s64/radix: Make radix_mem_block_size 64bit
      powerpc/lmb-size: Use addr #size-cells value when fetching lmb-size

Athira Rajeev (1):
      powerpc/perf: Exclude pmc5/6 from the irrelevant PMU group constraints

Biwen Li (2):
      powerpc/dts/t4240rdb: remove interrupts property
      powerc/dtc/t1024rdb: remove interrupts property

Christoph Hellwig (1):
      powerpc: switch 85xx defconfigs from legacy ide to libata

Christophe Leroy (52):
      powerpc/32s: Fix assembler warning about r0
      powerpc/hwirq: Remove stale forward irq_chip declaration
      powerpc/irq: Drop forward declaration of struct irqaction
      powerpc/fpu: Drop cvt_fd() and cvt_df()
      powerpc: drop hard_reset_now() and poweroff_now() declaration
      powerpc: Drop _nmask_and_or_msr()
      powerpc: Remove flush_instruction_cache for book3s/32
      powerpc: Move flush_instruction_cache() prototype in asm/cacheflush.h
      powerpc: Rewrite 4xx flush_cache_instruction() in C
      powerpc: Rewrite FSL_BOOKE flush_cache_instruction() in C
      powerpc: Remove flush_instruction_cache() on 8xx
      powerpc/uaccess: Use flexible addressing with __put_user()/__get_user=
()
      powerpc/uaccess: Add pre-update addressing to __get_user_asm() and __=
put_user_asm()
      powerpc/process: Remove unnecessary #ifdef CONFIG_FUNCTION_GRAPH_TRAC=
ER
      powerpc: Fix random segfault when freeing hugetlb range
      powerpc/8xx: Refactor calculation of number of entries per PTE in pag=
e tables
      powerpc/8xx: Support 16k hugepages with 4k pages
      powerpc/uaccess: Add pre-update addressing to __put_user_asm_goto()
      powerpc/uaccess: Switch __put_user_size_allowed() to __put_user_asm_g=
oto()
      powerpc/uaccess: Switch __patch_instruction() to __put_user_asm_goto()
      powerpc/uaccess: Remove __put_user_asm() and __put_user_asm2()
      powerpc/32: Fix vmap stack - Do not activate MMU before reading task =
struct
      powerpc/32: Fix vmap stack - Properly set r1 before activating MMU
      powerpc/process: Replace an #ifdef CONFIG_PPC_47x by IS_ENABLED()
      powerpc/process: Replace an #ifdef CONFIG_PPC_BOOK3S_64 by IS_ENABLED=
()
      powerpc/process: Replace an #if defined(CONFIG_4xx) || defined(CONFIG=
_BOOKE) by IS_ENABLED()
      powerpc/process: Replace #ifdef CONFIG_KALLSYMS by IS_ENABLED()
      powerpc/process: Tag an #endif to help locate the matching #ifdef.
      powerpc/process: Remove useless #ifdef CONFIG_VSX
      powerpc/process: Remove useless #ifdef CONFIG_ALTIVEC
      powerpc/process: Remove useless #ifdef CONFIG_SPE
      powerpc/process: Remove useless #ifdef CONFIG_PPC_FPU
      powerpc/powermac: Fix low_sleep_handler with KUAP and KUEP
      powerpc/kasan: Fix CONFIG_KASAN_VMALLOC for 8xx
      powerpc: Remove SYNC on non 6xx
      powerpc: Remove CONFIG_PPC601_SYNC_FIX
      powerpc: Drop SYNC_601() ISYNC_601() and SYNC()
      powerpc: Remove PowerPC 601
      powerpc: Remove support for PowerPC 601
      powerpc: Tidy up a bit after removal of PowerPC 601.
      powerpc: Remove __USE_RTC()
      powerpc: Remove get_tb_or_rtc()
      powerpc/time: Remove ifdef in get_dec() and set_dec()
      powerpc/32s: Setup the early hash table at all time.
      powerpc/32s: Rename head_32.S to head_book3s_32.S
      powerpc/32s: Remove #ifdef CONFIG_PPC_BOOK3S_32 in head_book3s_32.S
      powerpc/time: Rename mftbl() to mftb()
      powerpc/time: Make mftb() common to PPC32 and PPC64
      powerpc/time: Avoid using get_tbl() and get_tbu() internally
      powerpc/time: Remove get_tbu()
      powerpc/time: Make get_tbl() common to PPC32 and PPC64
      powerpc/time: Make get_tb() common to PPC32 and PPC64

Colin Ian King (2):
      powerpc/oprofile: fix spelling mistake "contex" -> "context"
      macintosh: windfarm: remove detatch debug containing spelling mistakes

C=C3=A9dric Le Goater (5):
      powerpc/pci: unmap legacy INTx interrupts when a PHB is removed
      powerpc/sysfs: Remove unused 'err' variable in sysfs_create_dscr_defa=
ult()
      powerpc/sstep: Remove empty if statement checking for invalid form
      powerpc/xive: Make debug routines static
      powerpc/32: Declare stack_overflow_exception() prototype

Daniel Axtens (1):
      powerpc: PPC_SECURE_BOOT should not require PowerNV

Finn Thain (5):
      powerpc/tau: Use appropriate temperature sample interval
      powerpc/tau: Convert from timer to workqueue
      powerpc/tau: Remove duplicated set_thresholds() call
      powerpc/tau: Check processor type before enabling TAU interrupt
      powerpc/tau: Disable TAU between measurements

Frederic Barrat (5):
      scsi: cxlflash: Access interrupt trigger page from xive directly
      ocxl: Access interrupt trigger page from xive directly
      ocxl: Don't return trigger page when allocating an interrupt
      ocxl: Remove custom service to allocate interrupts
      cxl: Rework error message for incompatible slots

Gustavo Romero (1):
      powerpc/tm: Save and restore AMR on treclaim and trechkpt

Jason Yan (1):
      powerpc/ps3: make two symbols static

Joel Stanley (2):
      powerpc/powernv: Print helpful message when cores guarded
      powerpc: Warn about use of smt_snooze_delay

Jordan Niethe (3):
      powerpc/boot: Update Makefile comment for 64bit wrapper
      selftests/powerpc: Fix prefixes in alignment_handler signal handler
      powerpc: Update documentation of ISA versions for Power10

Kajol Jain (5):
      powerpc/perf/hv-gpci: Fix starting index value
      Documentation/ABI: Add ABI documentation for hv-24x7 format
      Documentation/ABI: Add ABI documentation for hv-gpci format
      powerpc/perf/hv-gpci: Add cpu hotplug support
      powerpc/hv-gpci: Add sysfs files inside hv-gpci device to show cpumask

Leonardo Bras (4):
      powerpc/pseries/iommu: Create defines for operations in ibm, ddw-appl=
icable
      powerpc/pseries/iommu: Update call to ibm, query-pe-dma-windows
      powerpc/pseries/iommu: Move window-removing part of remove_ddw into r=
emove_dma_window
      powerpc/pseries/iommu: Allow bigger 64bit window by removing default =
DMA window

Liu Shixin (1):
      powerpc/pseries: convert to use DEFINE_SEQ_ATTRIBUTE macro

Mahesh Salgaonkar (1):
      powerpc/powernv/elog: Fix race while processing OPAL error log event.

Michael Ellerman (24):
      selftests/powerpc: Fix TM tests when CPU 0 is offline
      selftests/powerpc: Don't use setaffinity in tm-tmspr
      selftests/powerpc: Run tm-tmspr test for longer
      selftests/powerpc: Make using_hash_mmu() work on Cell & PowerMac
      selftests/powerpc: Give the bad_accesses test longer to run
      selftests/powerpc: Move set_dscr() into rfi_flush.c
      selftests/powerpc: Include asm/cputable.h from utils.h
      selftests/powerpc: Don't run DSCR tests on old systems
      selftests/powerpc: Skip security tests on older CPUs
      selftests/powerpc: Skip L3 bank test on older CPUs
      selftests/powerpc: Don't touch VMX/VSX on older CPUs
      selftests/powerpc: Properly handle failure in switch_endian_test
      powerpc/64: Remove unused generic_secondary_thread_init()
      Merge branch 'fixes' into next
      powerpc/64: Make VDSO32 track COMPAT on 64-bit
      Merge coregroup support into next
      powerpc/process: Fix uninitialised variable error
      Merge branch 'topic/irqs-off-activate-mm' into next
      powerpc/mm/64s: Fix slb_setup_new_exec() sparse warning
      powerpc/perf: Add declarations to fix sparse warnings
      powerpc: Move arch_cpu_idle_dead() into smp.c
      powerpc/smp: Fold cpu_die() into its only caller
      powerpc/smp: Move ppc_md.cpu_die() to smp_ops.cpu_offline_self()
      powerpc/prom_init: Check display props exist before enabling btext

Nathan Lynch (1):
      powerpc/pseries: explicitly reschedule during drmem_lmb list traversal

Nicholas Mc Guire (2):
      powerpc/pseries: Fix missing of_node_put() in rng_init()
      powerpc/icp-hv: Fix missing of_node_put() in success path

Nicholas Piggin (15):
      powerpc/64s: handle ISA v3.1 local copy-paste context switches
      powerpc/powernv/idle: add a basic stop 0-3 driver for POWER10
      mm: fix exec activate_mm vs TLB shootdown and lazy tlb switching race
      powerpc: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
      sparc64: remove mm_cpumask clearing to fix kthread_use_mm race
      powerpc/64s/radix: Fix mm_cpumask trimming race vs kthread_use_mm
      powerpc: untangle cputable mce include
      powerpc/64s: Add cp_abort after tlbiel to invalidate copy-buffer addr=
ess
      powerpc/pseries: add new branch prediction security bits for link sta=
ck
      powerpc/64: fix irq replay missing preempt
      powerpc/64: fix irq replay pt_regs->softe value
      powerpc/64e: remove PACA_IRQ_EE_EDGE
      powerpc/64e: remove 64s specific interrupt soft-mask code
      powerpc/64: make restore_interrupts 64e only
      powerpc/security: Fix link stack flush instruction

Oliver O'Halloran (18):
      powerpc/powernv/smp: Fix spurious DBG() warning
      powerpc/powernv: Include asm/powernv.h from the local powernv.h
      powerpc/powernv: Staticify functions without prototypes
      powerpc/powernv: Fix spurious kerneldoc warnings in opal-prd.c
      powerpc/nx: Don't pack struct coprocessor_request_block
      powerpc/pseries/eeh: Fix dumb linebreaks
      powerpc/eeh: Rework EEH initialisation
      powerpc/powernv: Stop using eeh_ops->init()
      powerpc/pseries: Stop using eeh_ops->init()
      powerpc/eeh: Delete eeh_ops->init
      powerpc/eeh: Move EEH initialisation to an arch initcall
      powerpc/pseries/eeh: Clean up pe_config_addr lookups
      powerpc/pseries/eeh: Rework device EEH PE determination
      powerpc/pseries/eeh: Allow zero to be a valid PE configuration address
      powerpc/eeh: Clean up PE addressing
      powerpc/eeh: Delete eeh_pe->config_addr
      powerpc/pseries/eeh: Fix use of uninitialised variable
      selftests/powerpc: Fix eeh-basic.sh exit codes

Qian Cai (1):
      Revert "powerpc/pci: unmap legacy INTx interrupts when a PHB is remov=
ed"

Qinglang Miao (5):
      macintosh: windfarm: use for_each_child_of_node() macro
      drivers/macintosh/smu.c: use for_each_child_of_node() macro
      macintosh: smu_sensors: use for_each_child_of_node() macro
      serial: pmac_zilog: use for_each_child_of_node() macro
      powerpc/powernv: fix wrong warning message in opalcore_config_init()

Ravi Bangoria (8):
      powerpc/watchpoint: Fix quadword instruction handling on p10 predeces=
sors
      powerpc/watchpoint: Fix handling of vector instructions
      powerpc/watchpoint/ptrace: Fix SETHWDEBUG when CONFIG_HAVE_HW_BREAKPO=
INT=3DN
      powerpc/watchpoint: Move DAWR detection logic outside of hw_breakpoin=
t.c
      powerpc/watchpoint: Fix exception handling for CONFIG_HAVE_HW_BREAKPO=
INT=3DN
      powerpc/watchpoint: Add hw_len wherever missing
      powerpc/watchpoint/ptrace: Introduce PPC_DEBUG_FEATURE_DATA_BP_ARCH_31
      selftests/powerpc: Tests for kernel accessing user memory

Russell Currey (1):
      powerpc/tools: Remove 90 line limit in checkpatch script

Scott Cheloha (4):
      powerpc/perf: consolidate GPCI hcall structs into asm/hvcall.h
      powerpc/pseries: new lparcfg key/value pair: partition_affinity_score
      pseries/drmem: don't cache node id in drmem_lmb struct
      pseries/hotplug-memory: hot-add: skip redundant LMB lookup

Srikar Dronamraju (28):
      sched/topology: Allow archs to override cpu_smt_mask
      powerpc/topology: Override cpu_smt_mask
      powerpc/numa: Restrict possible nodes based on platform
      powerpc/numa: Set numa_node for all possible cpus
      powerpc/numa: Prefer node id queried from vphn
      powerpc/numa: Offline memoryless cpuless node 0
      powerpc/smp: Fix a warning under !NEED_MULTIPLE_NODES
      powerpc/smp: Merge Power9 topology with Power topology
      powerpc/smp: Move powerpc_topology above
      powerpc/smp: Move topology fixups into a new function
      powerpc/smp: Dont assume l2-cache to be superset of sibling
      powerpc/smp: Optimize start_secondary
      powerpc/numa: Detect support for coregroup
      powerpc/smp: Allocate cpumask only after searching thread group
      powerpc/smp: Create coregroup domain
      powerpc/smp: Implement cpu_to_coregroup_id
      powerpc/topology: Update topology_core_cpumask
      powerpc/smp: Stop updating cpu_core_mask
      powerpc/smp: Remove get_physical_package_id
      powerpc/smp: Optimize remove_cpu_from_masks
      powerpc/smp: Limit CPUs traversed to within a node.
      powerpc/smp: Stop passing mask to update_mask_by_l2
      powerpc/smp: Depend on cpu_l1_cache_map when adding CPUs
      powerpc/smp: Check for duplicate topologies and consolidate
      powerpc/smp: Optimize update_mask_by_l2
      powerpc/smp: Move coregroup mask updation to a new function
      powerpc/smp: Optimize update_coregroup_mask
      cpufreq: powernv: Fix frame-size-overflow in powernv_cpufreq_reboot_n=
otifier

Stephen Kitt (1):
      powerpc: Use simple i2c probe function

Stephen Rothwell (9):
      powerpc: unrel_branch_check.sh: fix shellcheck complaints
      powerpc: unrel_branch_check.sh: simplify and combine some executions
      powerpc: unrel_branch_check.sh: simplify objdump's asm output
      powerpc: unrel_branch_check.sh: convert grep | sed | awk to just sed
      powerpc: unrel_branch_check.sh: simplify and tidy up the final loop
      powerpc: unrel_branch_check.sh: fix up the file header
      powerpc: unrel_branch_check.sh: exit silently for early errors
      powerpc: unrel_branch_check.sh: use nm to find symbol value
      powerpc: unrel_branch_check.sh: enable the use of llvm-objdump v9, 10=
 or 11

Thiago Jung Bauermann (1):
      powerpc/pseries/svm: Allocate SWIOTLB buffer anywhere in memory

Vaibhav Jain (2):
      powerpc/papr_scm: Fix warning triggered by perf_stats_show()
      powerpc/papr_scm: Add PAPR command family to pass-through command-set

Wang Wensheng (2):
      drivers/macintosh/smu.c: Fix undeclared symbol warning
      powerpc/papr_scm: Fix warnings about undeclared variable

Yang Yingliang (1):
      powerpc/book3s64: fix link error with CONFIG_PPC_RADIX_MMU=3Dn

zhengbin (3):
      powerpc/fadump: Remove set but not used variable 'elf'
      powerpc/perf: Remove set but not used variable 'target'
      powerpc/powernv: Remove set but not used variable 'parent'


 Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7   |  25 ++
 Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci   |  38 ++
 Documentation/powerpc/isa-versions.rst                             |   4 +
 Documentation/powerpc/ptrace.rst                                   |   1 +
 arch/Kconfig                                                       |   7 +
 arch/powerpc/Kconfig                                               |  21 +-
 arch/powerpc/Makefile                                              |   3 +-
 arch/powerpc/Makefile.postlink                                     |   2 +-
 arch/powerpc/boot/Makefile                                         |   2 +-
 arch/powerpc/boot/dts/fsl/t1024rdb.dts                             |   1 -
 arch/powerpc/boot/dts/fsl/t4240rdb.dts                             |   1 -
 arch/powerpc/boot/util.S                                           |  15 +-
 arch/powerpc/configs/85xx/mpc85xx_cds_defconfig                    |   6 +-
 arch/powerpc/configs/85xx/tqm8540_defconfig                        |   6 +-
 arch/powerpc/configs/85xx/tqm8541_defconfig                        |   6 +-
 arch/powerpc/configs/85xx/tqm8555_defconfig                        |   6 +-
 arch/powerpc/configs/85xx/tqm8560_defconfig                        |   6 +-
 arch/powerpc/include/asm/asm-prototypes.h                          |   5 +-
 arch/powerpc/include/asm/book3s/64/hash-4k.h                       |  18 +-
 arch/powerpc/include/asm/book3s/64/hash-64k.h                      |  13 +
 arch/powerpc/include/asm/book3s/64/mmu-hash.h                      |   4 +-
 arch/powerpc/include/asm/book3s/64/mmu.h                           |  17 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h                       |   7 +
 arch/powerpc/include/asm/book3s/64/radix.h                         |  16 +
 arch/powerpc/include/asm/cacheflush.h                              |  10 +
 arch/powerpc/include/asm/cputable.h                                |  18 +-
 arch/powerpc/include/asm/cputhreads.h                              |   1 -
 arch/powerpc/include/asm/delay.h                                   |   2 +-
 arch/powerpc/include/asm/drmem.h                                   |  43 +=
--
 arch/powerpc/include/asm/eeh.h                                     |   9 +-
 arch/powerpc/include/asm/hvcall.h                                  |  38 ++
 arch/powerpc/include/asm/hw_breakpoint.h                           |  12 +
 arch/powerpc/include/asm/hw_irq.h                                  |  11 +-
 arch/powerpc/include/asm/icswx.h                                   |   6 +-
 arch/powerpc/include/asm/irq.h                                     |   1 -
 arch/powerpc/include/asm/machdep.h                                 |   3 -
 arch/powerpc/include/asm/mmu_context.h                             |   2 +-
 arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h                   |  14 +
 arch/powerpc/include/asm/nohash/32/pgtable.h                       |  20 +-
 arch/powerpc/include/asm/pnv-ocxl.h                                |   3 -
 arch/powerpc/include/asm/ppc_asm.h                                 |  13 +-
 arch/powerpc/include/asm/processor.h                               |   9 +-
 arch/powerpc/include/asm/ptrace.h                                  |   4 -
 arch/powerpc/include/asm/reg.h                                     |  20 +-
 arch/powerpc/include/asm/reg_booke.h                               |   1 -
 arch/powerpc/include/asm/smp.h                                     |  24 +-
 arch/powerpc/include/asm/svm.h                                     |   4 +
 arch/powerpc/include/asm/synch.h                                   |  19 +-
 arch/powerpc/include/asm/time.h                                    |  86 +=
----
 arch/powerpc/include/asm/timex.h                                   |   3 -
 arch/powerpc/include/asm/tlb.h                                     |  13 -
 arch/powerpc/include/asm/topology.h                                |  20 +-
 arch/powerpc/include/asm/uaccess.h                                 |  75 +=
+--
 arch/powerpc/include/uapi/asm/ptrace.h                             |   1 +
 arch/powerpc/kernel/Makefile                                       |   6 +-
 arch/powerpc/kernel/asm-offsets.c                                  |   1 +
 arch/powerpc/kernel/btext.c                                        |  17 +-
 arch/powerpc/kernel/cputable.c                                     |  16 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c                                  |   1 +
 arch/powerpc/kernel/eeh.c                                          | 145 +=
++-----
 arch/powerpc/kernel/eeh_pe.c                                       |  50 +=
--
 arch/powerpc/kernel/entry_32.S                                     |  35 +-
 arch/powerpc/kernel/entry_64.S                                     |   8 +-
 arch/powerpc/kernel/exceptions-64e.S                               |  11 -
 arch/powerpc/kernel/fadump.c                                       |   2 -
 arch/powerpc/kernel/fpu.S                                          |  16 -
 arch/powerpc/kernel/head_32.h                                      |  73 +=
+--
 arch/powerpc/kernel/head_40x.S                                     |   1 -
 arch/powerpc/kernel/head_64.S                                      |   7 +-
 arch/powerpc/kernel/{head_32.S =3D> head_book3s_32.S}                |  93=
 +----
 arch/powerpc/kernel/head_booke.h                                   |   1 -
 arch/powerpc/kernel/hw_breakpoint.c                                | 149 +=
-------
 arch/powerpc/kernel/hw_breakpoint_constraints.c                    | 162 +=
++++++++
 arch/powerpc/kernel/idle.c                                         |   8 -
 arch/powerpc/kernel/irq.c                                          |  73 +=
+--
 arch/powerpc/kernel/l2cr_6xx.S                                     |   3 +-
 arch/powerpc/kernel/misc_32.S                                      |  48 -=
--
 arch/powerpc/kernel/misc_64.S                                      |   1 -
 arch/powerpc/kernel/process.c                                      | 149 +=
+++----
 arch/powerpc/kernel/prom.c                                         |   5 +
 arch/powerpc/kernel/prom_init.c                                    |  17 +-
 arch/powerpc/kernel/ptrace/ptrace-noadv.c                          |   9 +-
 arch/powerpc/kernel/rtas.c                                         | 153 +=
+++++++
 arch/powerpc/kernel/security.c                                     |  34 +-
 arch/powerpc/kernel/setup_32.c                                     |   2 +-
 arch/powerpc/kernel/setup_64.c                                     | 105 +=
++++-
 arch/powerpc/kernel/smp.c                                          | 374 +=
+++++++++++-------
 arch/powerpc/kernel/sysfs.c                                        |  49 +=
+-
 arch/powerpc/kernel/tau_6xx.c                                      | 147 +=
++-----
 arch/powerpc/kernel/time.c                                         |  62 +=
---
 arch/powerpc/kernel/tm.S                                           |  35 +-
 arch/powerpc/kernel/traps.c                                        |   4 -
 arch/powerpc/kernel/vdso32/datapage.S                              |   2 -
 arch/powerpc/kernel/vdso32/vdso32.lds.S                            |   2 -
 arch/powerpc/kvm/book3s_hv.c                                       |   7 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                            |   8 +
 arch/powerpc/lib/code-patching.c                                   |  17 +-
 arch/powerpc/lib/sstep.c                                           |   9 +-
 arch/powerpc/mm/book3s32/hash_low.S                                |  21 +-
 arch/powerpc/mm/book3s32/mmu.c                                     |  94 +=
+---
 arch/powerpc/mm/book3s64/hash_native.c                             |   8 +-
 arch/powerpc/mm/book3s64/hash_utils.c                              |  12 +-
 arch/powerpc/mm/book3s64/internal.h                                |   2 +
 arch/powerpc/mm/book3s64/mmu_context.c                             |   4 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c                           |  10 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                               |  35 +-
 arch/powerpc/mm/book3s64/slb.c                                     |   4 +-
 arch/powerpc/mm/drmem.c                                            |   6 +-
 arch/powerpc/mm/hugetlbpage.c                                      |  20 +-
 arch/powerpc/mm/init_64.c                                          |  39 +-
 arch/powerpc/mm/kasan/kasan_init_32.c                              |  31 +-
 arch/powerpc/mm/mem.c                                              |   6 +-
 arch/powerpc/mm/nohash/8xx.c                                       |   7 -
 arch/powerpc/mm/nohash/fsl_booke.c                                 |  16 +
 arch/powerpc/mm/nohash/tlb.c                                       |   4 -
 arch/powerpc/mm/numa.c                                             | 101 +=
++++-
 arch/powerpc/mm/pgtable.c                                          |   6 +-
 arch/powerpc/mm/ptdump/8xx.c                                       |   5 +
 arch/powerpc/mm/ptdump/bats.c                                      |  59 -=
--
 arch/powerpc/oprofile/cell/spu_task_sync.c                         |   2 +-
 arch/powerpc/perf/hv-gpci-requests.h                               |   6 +-
 arch/powerpc/perf/hv-gpci.c                                        |  73 +=
++-
 arch/powerpc/perf/hv-gpci.h                                        |  27 --
 arch/powerpc/perf/imc-pmu.c                                        |   3 -
 arch/powerpc/perf/isa207-common.c                                  |  10 +
 arch/powerpc/perf/isa207-common.h                                  |   2 +
 arch/powerpc/perf/power10-pmu.c                                    |   1 -
 arch/powerpc/perf/power5+-pmu.c                                    |   2 +
 arch/powerpc/perf/power5-pmu.c                                     |   2 +
 arch/powerpc/perf/power6-pmu.c                                     |   2 +
 arch/powerpc/perf/power7-pmu.c                                     |   2 +
 arch/powerpc/perf/ppc970-pmu.c                                     |   2 +
 arch/powerpc/platforms/44x/machine_check.c                         |   1 +
 arch/powerpc/platforms/44x/ppc476.c                                |   5 +-
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c                     |   4 +-
 arch/powerpc/platforms/85xx/smp.c                                  |   4 +-
 arch/powerpc/platforms/Kconfig                                     |  29 +-
 arch/powerpc/platforms/Kconfig.cputype                             |  18 +-
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c                  |   3 +-
 arch/powerpc/platforms/embedded6xx/storcenter.c                    |   3 +-
 arch/powerpc/platforms/powermac/pmac.h                             |   2 +-
 arch/powerpc/platforms/powermac/setup.c                            |   2 +-
 arch/powerpc/platforms/powermac/sleep.S                            |  15 +-
 arch/powerpc/platforms/powermac/smp.c                              |  12 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c                       |  98 +=
++--
 arch/powerpc/platforms/powernv/idle.c                              | 302 +=
++++++++++-----
 arch/powerpc/platforms/powernv/ocxl.c                              |  30 --
 arch/powerpc/platforms/powernv/opal-core.c                         |   2 +-
 arch/powerpc/platforms/powernv/opal-elog.c                         |  33 +-
 arch/powerpc/platforms/powernv/opal-msglog.c                       |   2 +
 arch/powerpc/platforms/powernv/opal-prd.c                          |   2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                          |   8 -
 arch/powerpc/platforms/powernv/powernv.h                           |   7 +
 arch/powerpc/platforms/powernv/rng.c                               |   2 +-
 arch/powerpc/platforms/powernv/setup.c                             |  24 ++
 arch/powerpc/platforms/powernv/smp.c                               |   6 +-
 arch/powerpc/platforms/powernv/vas-window.c                        |   9 +-
 arch/powerpc/platforms/ps3/spu.c                                   |   4 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c                       | 376 +=
++++++-------------
 arch/powerpc/platforms/pseries/hotplug-cpu.c                       |   6 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c                    |  82 +=
++--
 arch/powerpc/platforms/pseries/hvCall_inst.c                       |  23 +-
 arch/powerpc/platforms/pseries/iommu.c                             | 242 +=
+++++++++---
 arch/powerpc/platforms/pseries/lpar.c                              |   2 +
 arch/powerpc/platforms/pseries/lparcfg.c                           |  35 ++
 arch/powerpc/platforms/pseries/papr_scm.c                          |  10 +-
 arch/powerpc/platforms/pseries/rng.c                               |   1 +
 arch/powerpc/platforms/pseries/setup.c                             |   6 +
 arch/powerpc/platforms/pseries/svm.c                               |  26 ++
 arch/powerpc/sysdev/xics/icp-hv.c                                  |   1 +
 arch/powerpc/sysdev/xive/common.c                                  |   4 +-
 arch/powerpc/tools/checkpatch.sh                                   |   1 -
 arch/powerpc/tools/unrel_branch_check.sh                           | 125 +=
+++---
 arch/powerpc/xmon/xmon.c                                           |   1 +
 arch/sparc/kernel/smp_64.c                                         |  65 +=
---
 drivers/cpufreq/powernv-cpufreq.c                                  |   9 +-
 drivers/cpuidle/cpuidle-powernv.c                                  |   2 +-
 drivers/macintosh/smu.c                                            |   4 +-
 drivers/macintosh/windfarm_lm75_sensor.c                           |   2 -
 drivers/macintosh/windfarm_lm87_sensor.c                           |   2 -
 drivers/macintosh/windfarm_smu_sat.c                               |   3 +-
 drivers/macintosh/windfarm_smu_sensors.c                           |   3 +-
 drivers/misc/cxl/pci.c                                             |   4 +-
 drivers/misc/ocxl/Kconfig                                          |   2 +-
 drivers/misc/ocxl/afu_irq.c                                        |  12 +-
 drivers/misc/ocxl/link.c                                           |  15 +-
 drivers/scsi/cxlflash/ocxl_hw.c                                    |  21 +-
 drivers/scsi/cxlflash/ocxl_hw.h                                    |   1 -
 fs/exec.c                                                          |  17 +-
 include/linux/cpuhotplug.h                                         |   1 +
 include/linux/topology.h                                           |   2 +-
 include/misc/ocxl.h                                                |  10 +-
 include/uapi/asm-generic/hugetlb_encode.h                          |   1 +
 include/uapi/linux/mman.h                                          |   1 +
 tools/testing/selftests/powerpc/alignment/alignment_handler.c      |  12 +-
 tools/testing/selftests/powerpc/benchmarks/context_switch.c        |   6 +
 tools/testing/selftests/powerpc/dscr/Makefile                      |   2 +-
 tools/testing/selftests/powerpc/dscr/dscr_default_test.c           |   2 +
 tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c          |   2 +
 tools/testing/selftests/powerpc/dscr/dscr_inherit_exec_test.c      |   2 +
 tools/testing/selftests/powerpc/dscr/dscr_inherit_test.c           |   2 +
 tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c             |   2 +
 tools/testing/selftests/powerpc/dscr/dscr_sysfs_thread_test.c      |   2 +
 tools/testing/selftests/powerpc/dscr/dscr_user_test.c              |   2 +
 tools/testing/selftests/powerpc/eeh/eeh-basic.sh                   |   9 +-
 tools/testing/selftests/powerpc/include/utils.h                    |   2 +-
 tools/testing/selftests/powerpc/mm/bad_accesses.c                  |   1 +
 tools/testing/selftests/powerpc/pmu/count_stcx_fail.c              |   1 -
 tools/testing/selftests/powerpc/pmu/l3_bank_test.c                 |   3 +
 tools/testing/selftests/powerpc/pmu/per_event_excludes.c           |   2 -
 tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c            |  48 +=
+-
 tools/testing/selftests/powerpc/security/rfi_flush.c               |  38 ++
 tools/testing/selftests/powerpc/security/spectre_v2.c              |   3 +
 tools/testing/selftests/powerpc/stringloops/memcmp.c               |   2 +-
 tools/testing/selftests/powerpc/switch_endian/switch_endian_test.S |  23 +-
 tools/testing/selftests/powerpc/syscalls/Makefile                  |   2 +-
 tools/testing/selftests/powerpc/syscalls/rtas_filter.c             | 285 +=
++++++++++++++
 tools/testing/selftests/powerpc/tm/tm-poison.c                     |  11 +-
 tools/testing/selftests/powerpc/tm/tm-tmspr.c                      |  10 +-
 tools/testing/selftests/powerpc/tm/tm-trap.c                       |  10 +-
 tools/testing/selftests/powerpc/tm/tm-unavailable.c                |   9 +-
 tools/testing/selftests/powerpc/tm/tm.h                            |   3 +-
 tools/testing/selftests/powerpc/utils.c                            |  39 +-
 223 files changed, 3245 insertions(+), 2491 deletions(-)
 rename arch/powerpc/kernel/{head_32.S =3D> head_book3s_32.S} (94%)
 create mode 100644 arch/powerpc/kernel/hw_breakpoint_constraints.c
 create mode 100644 tools/testing/selftests/powerpc/syscalls/rtas_filter.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl+JEgwACgkQUevqPMjh
pYC+qw//UCrTOCAgxAIv4Dx2kmSYxIkrAdeRM0jo2gMOMCaKpeYkWrpW0QSHudik
ecZetcBIPNkXybvzBeBj6B1LNFiH+BdiL+LyUKcUWHQwmvfb7dh0hzjQJKQ+vPci
jDDLWe+jVNvJ30k6e5yczXDJWz/EhoT/u+7fBxfQDEvgXhZGL8l40aqKB5uYiMgl
9Yoq+ORh4BzE/0FF9ubLDlsRdX2AkeKcCgqSbx6nokIbbFokIktu/1stXtzrhSJt
qzf/drz2UZy5sqzT1PBH+1Zv9jkqsMAWniKy6OJWX0SzTk26U2sr86cf8DydI9Ug
MFFQdOxOEoOcPQrbi0vZUknoG9Cmz3MJWFcx427z0aDR5HuMg3S5CCCCfCEATxdN
HoVPRKmhtVfk3JGGANqOP/7KWvmP43Ya2OdOwtl7KIIKKOf14e7UJCahn9CQB+cI
BKTOvpgAv/RgcSEa3LGWLwjWrVyxmF3RLshPfQ0JA26HuLDe6gXHXsrVZaL7wMjV
/ubXq5V1PpiHHNHyU/O4tgV4qNVkqvwQzwZxwwzNqiV+Eh4pXSCINIxTw20JT+Eg
1YjniS1P/OAZgo6dTeMyLzsf7fuLPBlITSzSXWmYaVx9Aq1fMcgfgF0+1sVcgUwz
1fI5jsFxnY6iSEya/4lhlV/PoGwByeXnFv7Ho59ALhvl/Q6zAtU=3D
=3DZ++I
-----END PGP SIGNATURE-----
