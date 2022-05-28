Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A4E536ED2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 01:50:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9dj40Lwrz3bqs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 09:50:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SHALk7yl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9M3J42c2z2ywY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 22:50:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SHALk7yl;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4L9M311cQtz4xZ0;
	Sat, 28 May 2022 22:50:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1653742235;
	bh=PBuAKt+fVTcCqIXXPbLHSupc47CrqNVPiAHFr6A7hjg=;
	h=From:To:Cc:Subject:Date:From;
	b=SHALk7ylWq/nc48EDcDXuwiH+/if6lS3h9bi6RHuCNifuPL1b1u9PXcb5Z4kkQz1p
	 CB/AtOPWR1ox9Ddrjx/OKy089EUpDbXpktCaW55NgD4ntdL9Qf2hUcxH1+ZcosO43o
	 Aa4bRsKOb8gQFCP6lmVMeIXHZRaU74OWaNEuc1ZceZMzGXBlVMbrQrVgiu7ajG/paq
	 iKuCW6Lwjf5sEsuQ1Gar13miltb68U48RYvlFaFzAfw3tXbf0eE38Ehp/udYhUgizv
	 3ZLaQXCDUb9kuiMqA+NLBeiu4ayts0NGzAIMsrvphcjnHTOTXmhcIPEuw9jcqeFZdj
	 qLv1tXSNnRw+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.19-1 tag
Date: Sat, 28 May 2022 22:50:19 +1000
Message-ID: <87pmjxlt2s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 29 May 2022 09:50:12 +1000
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
Cc: linmq006@gmail.com, rdunlap@infradead.org, jing.yangyang@zte.com.cn, aik@ozlabs.ru, catalin.marinas@arm.com, wangborong@cdjrlc.com, wangqing@vivo.com, wangxiang@cdjrlc.com, oohall@gmail.com, bagasdotme@gmail.com, zou_wei@huawei.com, hbh25y@gmail.com, hegdevasant@linux.vnet.ibm.com, ldufour@linux.ibm.com, baihaowen@meizu.com, krzysztof.kozlowski@canonical.com, zhengzucheng@huawei.com, wangwensheng4@huawei.com, haren@linux.ibm.com, chi.minghao@zte.com.cn, yebin10@huawei.com, zhengbin13@huawei.com, yang.guang5@zte.com.cn, joel@jms.id.au, liubo03@inspur.com, kjain@linux.ibm.com, huangfq.daxian@gmail.com, maqianga@uniontech.com, naveen.n.rao@linux.vnet.ibm.com, osalvador@suse.de, robh@kernel.org, colin.i.king@gmail.com, vulab@iscas.ac.cn, yuehaibing@huawei.com, sohaib.amhmd@gmail.com, ajd@linux.ibm.com, arnd@arndb.de, jiapeng.chong@linux.alibaba.com, yukuai3@huawei.com, alistair@popple.id.au, chenhuang5@huawei.com, zuoqilin@yulong.com, npiggin@gmail.com, nathan@kernel.org, maddy@linux
 .ibm.com, clg@kaod.org, vaibhav@linux.ibm.com, bhelgaas@google.com, andriy.shevchenko@linux.intel.com, arbab@linux.ibm.com, heying24@huawei.com, hbathini@linux.ibm.com, dja@axtens.net, oss@buserror.net, haokexin@gmail.com, pali@kernel.org, fthain@linux-m68k.org, farosas@linux.ibm.com, wupeng58@huawei.com, dwaipayanray1@gmail.com, lv.ruyi@zte.com.cn, magalilemes00@gmail.com, linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, gpiccoli@igalia.com, xiam0nd.tong@gmail.com, frank.rowand@sony.com, fbarrat@linux.ibm.com, colin.king@canonical.com, akpm@linux-foundation.org, yang.lee@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, dimitri.ledkov@canonical.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.19.

There's a few changes to generic mm code and arm64 as part of the mmap
conversion, they all have appropriate acks.

There's one trivial conflict in arch/powerpc/Kconfig, the resolution is to
take both sides.

cheers

Notable out of area changes:

  2cb4de085f38 mm: Add len and flags parameters to arch_get_mmap_end()
    arch/arm64/include/asm/processor.h
    fs/hugetlbfs/inode.c
    include/linux/sched/mm.h
    mm/mmap.c

  include/linux/hugetlb.h	# 4b439e25e29e mm, hugetlbfs: Allow an arch to al=
ways use generic versions of get_unmapped_area functions
  mm/util.c			# 723820f3f77d mm: Allow arch specific arch_randomize_brk() w=
ith CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
  arch/Kconfig			# aa06530a535f arch/Kconfig: Drop references to powerpc PA=
GE_SIZE symbols
  include/linux/of_irq.h	# bb12dd42d20f powerpc/powermac: constify device_n=
ode in of_irq_parse_oldworld()

The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:

  Linux 5.18-rc2 (Sun Apr 10 14:21:36 2022 -1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.19-1

for you to fetch changes up to dcf280e6f80be280ca7dd1b058f038654e4a18dd:

  powerpc/64: Include cache.h directly in paca.h (2022-05-27 22:20:09 +1000)

- ------------------------------------------------------------------
powerpc updates for 5.19

 - Convert to the generic mmap support (ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYO=
UT).

 - Add support for outline-only KASAN with 64-bit Radix MMU (P9 or later).

 - Increase SIGSTKSZ and MINSIGSTKSZ and add support for AT_MINSIGSTKSZ.

 - Enable the DAWR (Data Address Watchpoint) on POWER9 DD2.3 or later.

 - Drop support for system call instruction emulation.

 - Many other small features and fixes.

Thanks to: Alexey Kardashevskiy, Alistair Popple, Andy Shevchenko, Bagas Sa=
njaya, Bjorn
Helgaas, Bo Liu, Chen Huang, Christophe Leroy, Colin Ian King, Daniel Axten=
s, Dwaipayan
Ray, Fabiano Rosas, Finn Thain, Frank Rowand, Fuqian Huang, Guilherme G. Pi=
ccoli, Hangyu
Hua, Haowen Bai, Haren Myneni, Hari Bathini, He Ying, Jason Wang, Jiapeng C=
hong, Jing
Yangyang, Joel Stanley, Julia Lawall, Kajol Jain, Kevin Hao, Krzysztof Kozl=
owski, Laurent
Dufour, Lv Ruyi, Madhavan Srinivasan, Magali Lemes, Miaoqian Lin, Minghao C=
hi, Nathan
Chancellor, Naveen N. Rao, Nicholas Piggin, Oliver O'Halloran, Oscar Salvad=
or, Pali Roh=C3=A1r,
Paul Mackerras, Peng Wu, Qing Wang, Randy Dunlap, Reza Arbab, Russell Curre=
y, Sohaib
Mohamed, Vaibhav Jain, Vasant Hegde, Wang Qing, Wang Wensheng, Xiang wangx,=
 Xiaomeng Tong,
Xu Wang, Yang Guang, Yang Li, Ye Bin, YueHaibing, Yu Kuai, Zheng Bin, Zou W=
ei, Zucheng
Zheng.

- ------------------------------------------------------------------
Alexey Kardashevskiy (4):
      powerpc/boot: Stop using RELACOUNT
      KVM: PPC: Book3s: Retire H_PUT_TCE/etc real mode handlers
      KVM: PPC: Book3s: PR: Enable default TCE hypercalls
      KVM: PPC: Book3s: Remove real mode interrupt controller hcalls handle=
rs

Alistair Popple (1):
      selftests/powerpc: Add matrix multiply assist (MMA) test

Andy Shevchenko (1):
      powerpc/83xx/mpc8349emitx: Get rid of of_node assignment

Bagas Sanjaya (1):
      KVM: PPC: Book3S HV: remove extraneous asterisk from rm_host_ipi_acti=
on() comment

Bjorn Helgaas (1):
      powerpc: Remove unused SLOW_DOWN_IO definition

Bo Liu (1):
      KVM: PPC: Book3S HV: Use consistent type for return value of kvm_age_=
rmapp()

Chen Huang (1):
      powerpc/rtas: Replaced simple_strtoull() with kstrtoull()

Christophe Leroy (64):
      powerpc/book3e: Fix sparse report in mm/nohash/fsl_book3e.c
      mm: Allow arch specific arch_randomize_brk() with CONFIG_ARCH_WANT_DE=
FAULT_TOPDOWN_MMAP_LAYOUT
      mm, hugetlbfs: Allow an arch to always use generic versions of get_un=
mapped_area functions
      mm: Add len and flags parameters to arch_get_mmap_end()
      powerpc/mm: Move vma_mmu_pagesize()
      powerpc/mm: Make slice specific to book3s/64
      powerpc/mm: Remove CONFIG_PPC_MM_SLICES
      powerpc/mm: Use generic_get_unmapped_area() and call it from arch_get=
_unmapped_area()
      powerpc/mm: Use generic_hugetlb_get_unmapped_area()
      powerpc/mm: Move get_unmapped_area functions to slice.c
      powerpc/mm: Enable full randomisation of memory mappings
      powerpc/mm: Convert to default topdown mmap layout
      powerpc: Simplify and move arch_randomize_brk()
      powerpc: Reduce csum_add() complexity for PPC64
      powerpc/64: Move pci_device_from_OF_node() out of asm/pci-bridge.h
      powerpc: Don't include asm/prom.h in asm/parport.h
      powerpc: Include asm/reg.h in asm/svm.h
      powerpc: Add missing declaration in asm/drmem.h
      powerpc: Remove asm/prom.h from all files that don't need it
      powerpc: Add missing headers
      powerpc: Use rol32() instead of opencoding in csum_fold()
      powerpc: Use static call for get_irq()
      powerpc/8xx: Simplify flush_tlb_kernel_range()
      powerpc: align address to page boundary in change_page_attr()
      powerpc/code-patching: Don't call is_vmalloc_or_module_addr() without=
 CONFIG_MODULES
      powerpc/code-patching: Use jump_label for testing freed initmem
      powerpc/code-patching: Use jump_label to check if poking_init() is do=
ne
      macintosh: Prepare cleanup of powerpc's asm/prom.h
      cxl/ocxl: Prepare cleanup of powerpc's asm/prom.h
      powerpc/8xx: Move CPM interrupt controller into a dedicated file
      powerpc/8xx: Convert CPM1 error interrupt handler to platform driver
      powerpc/8xx: Convert CPM1 interrupt controller to platform_device
      powerpc/8xx: Remove mpc8xx_pics_init()
      powerpc/8xx: Use kmalloced data structure instead of global static
      powerpc/ftrace: Refactor prepare_ftrace_return()
      powerpc/ftrace: Remove redundant create_branch() calls
      powerpc/code-patching: Inline is_offset_in_{cond}_branch_range()
      powerpc/ftrace: Use is_offset_in_branch_range()
      powerpc/code-patching: Inline create_branch()
      powerpc/ftrace: Inline ftrace_modify_code()
      powerpc/ftrace: Use patch_instruction() return directly
      powerpc: Add CONFIG_PPC64_ELF_ABI_V1 and CONFIG_PPC64_ELF_ABI_V2
      powerpc: Replace PPC64_ELF_ABI_v{1/2} by CONFIG_PPC64_ELF_ABI_V{1/2}
      powerpc: Finalise cleanup around ABI use
      powerpc/ftrace: Make __ftrace_make_{nop/call}() common to PPC32 and P=
PC64
      powerpc/ftrace: Don't include ftrace.o for CONFIG_FTRACE_SYSCALLS
      powerpc/ftrace: Use CONFIG_FUNCTION_TRACER instead of CONFIG_DYNAMIC_=
FTRACE
      powerpc/ftrace: Remove ftrace_plt_tramps[]
      powerpc/ftrace: Use BRANCH_SET_LINK instead of value 1
      powerpc/ftrace: Use PPC_RAW_xxx() macros instead of opencoding.
      powerpc/ftrace: Use size macro instead of opencoding
      powerpc/ftrace: Simplify expected_nop_sequence()
      powerpc/ftrace: Minimise number of #ifdefs
      powerpc/inst: Add __copy_inst_from_kernel_nofault()
      powerpc/ftrace: Don't use copy_from_kernel_nofault() in module_trampo=
line_target()
      powerpc/inst: Remove PPC_INST_BRANCH
      powerpc/modules: Use PPC_LI macros instead of opencoding
      powerpc/inst: Remove PPC_INST_BL
      powerpc/opcodes: Remove unused PPC_INST_XXX macros
      powerpc/irq: Remove arch_local_irq_restore() for !CONFIG_CC_HAS_ASM_G=
OTO
      powerpc/85xx: Remove FSL_85XX_CACHE_SRAM
      powerpc/fsl_book3e: Don't set rodata RO too early
      powerpc/xics: Include missing header
      powerpc/64s: Only set HAVE_ARCH_UNMAPPED_AREA when CONFIG_PPC_64S_HAS=
H_MMU is set

Colin Ian King (2):
      powerpc: Fix spelling mistake "mesages" -> "messages" in Kconfig
      selftests/powerpc/pmu: fix spelling mistake "mis-match" -> "mismatch"

Daniel Axtens (5):
      kasan: Document support on 32-bit powerpc
      powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
      powerpc/kasan: Don't instrument non-maskable or raw interrupts
      powerpc/kasan: Disable address sanitization in kexec paths
      powerpc: Book3S 64-bit outline-only KASAN support

Dwaipayan Ray (2):
      powerpc/mm: Switch from __FUNCTION__ to __func__
      powerpc/powernv: Switch from __FUNCTION__ to __func__

Fabiano Rosas (2):
      KVM: PPC: Book3S HV: Initialize AMOR in nested entry
      KVM: PPC: Book3S HV: Fix vcore_blocked tracepoint

Finn Thain (1):
      macintosh/via-pmu: Fix build failure when CONFIG_INPUT is disabled

Frank Rowand (1):
      powerpc/boot: remove unused function find_node_by_linuxphandle()

Fuqian Huang (1):
      macintosh: Use kmemdup rather than duplicating its implementation

Guilherme G. Piccoli (1):
      powerpc/setup: Refactor/untangle panic notifiers

Hangyu Hua (1):
      misc: ocxl: fix possible double free in ocxl_file_register_afu

Haowen Bai (2):
      selftests/powerpc/pmu: Fix unsigned function returning negative const=
ant
      powerpc/eeh: Drop redundant spinlock initialization

Haren Myneni (2):
      powerpc/powernv/vas: Assign real address to rx_fifo in vas_rx_win_attr
      powerpc/pseries/vas: sysfs comments with the correct entries

Hari Bathini (5):
      powerpc/fadump: Fix fadump to work with a different endian capture ke=
rnel
      powerpc/fadump: save CPU reg data in vmcore when PHYP terminates LPAR
      powerpc/fadump: fix PT_LOAD segment for boot memory area
      powerpc/fadump: align destination address to pagesize
      powerpc/fadump: print start of preserved area

He Ying (1):
      powerpc/time: Fix sparse warnings

Jason Wang (2):
      powerpc/perf/24x7: use 'unsigned int' instead of 'unsigned'
      powerpc: use strscpy to replace strlcpy

Jiapeng Chong (1):
      powerpc/fadump: Use swap() instead of open coding it

Jing Yangyang (1):
      macintosh/smu: Fix warning comparing pointer to 0

Joel Stanley (2):
      powerpc/boot: Build wrapper for an appropriate CPU
      powerpc/microwatt: Add mmu bits to device tree

Julia Lawall (1):
      powerpc: fix typos in comments

Kajol Jain (2):
      powerpc/perf: Fix the threshold compare group constraint for power10
      powerpc/perf: Fix the threshold compare group constraint for power9

Kevin Hao (1):
      powerpc: Export mmu_feature_keys[] as non-GPL

Krzysztof Kozlowski (2):
      powerpc/powermac: add missing g5_phy_disable_cpu1() declaration
      powerpc/powermac: constify device_node in of_irq_parse_oldworld()

Laurent Dufour (1):
      powerpc/rtas: Keep MSR[RI] set when calling RTAS

Lv Ruyi (2):
      powerpc/xics: fix refcount leak in icp_opal_init()
      powerpc/powernv: fix missing of_node_put in uv_init()

Madhavan Srinivasan (1):
      selftests/powerpc/pmu/ebb: remove fixed_instruction.S

Magali Lemes (1):
      powerpc: Fix missing declaration of [en/dis]able_kernel_altivec()

Miaoqian Lin (2):
      powerpc/xive: Fix refcount leak in xive_spapr_init
      powerpc/fsl_rio: Fix refcount leak in fsl_rio_setup

Michael Ellerman (14):
      powerpc/85xx: Fix virt_to_phys() off-by-one in smp_85xx_start_cpu()
      selftests/powerpc: Add a test of 4PB SLB handling
      powerpc/powermac: Use for_each_property_of_node()
      Merge tag 'v5.18-rc4' into next
      Merge branch 'fixes' into next
      Merge branch 'fixes' into topic/ppc-kvm
      Merge branch 'topic/ppc-kvm' into next
      powerpc: Add generic PAGE_SIZE config symbols
      arch/Kconfig: Drop references to powerpc PAGE_SIZE symbols
      powerpc/64: Only WARN if __pa()/__va() called with bad addresses
      powerpc: Fix all occurences of "the the"
      powerpc/64s: Add CPU_FTRS_POWER9_DD2_2 to CPU_FTRS_ALWAYS mask
      powerpc/64s: Add CPU_FTRS_POWER10 to ALWAYS mask
      powerpc/64: Include cache.h directly in paca.h

Minghao Chi (1):
      macintosh/ams: Remove unneeded result variable

Minghao Chi (CGEL ZTE) (1):
      powerpc/platforms/83xx: Use of_device_get_match_data()

Nathan Chancellor (2):
      powerpc/vdso: Remove unused ENTRY in linker scripts
      powerpc/vdso: Link with ld.lld when requested

Naveen N. Rao (3):
      powerpc: Sort and de-dup primary opcodes in ppc-opcode.h
      powerpc: Reject probes on instructions that can't be single stepped
      powerpc/ftrace: Remove ftrace init tramp once kernel init is complete

Nicholas Piggin (23):
      powerpc/64: remove system call instruction emulation
      KVM: PPC: Book3S HV: HFSCR[PREFIX] does not exist
      KVM: PPC: Book3S HV P9: Optimise loads around context switch
      KVM: PPC: Remove kvmppc_claim_lpid
      KVM: PPC: Book3S HV: Update LPID allocator init for POWER9, Nested
      KVM: PPC: Book3S HV: Use IDA allocator for LPID allocator
      KVM: PPC: Book3S HV Nested: Change nested guest lookup to use idr
      KVM: PPC: Book3S Nested: Use explicit 4096 LPID maximum
      KVM: PPC: Book3S HV: Remove KVMPPC_NR_LPIDS
      KVM: PPC: Book3S HV P9: Inject pending xive interrupts at guest entry
      KVM: PPC: Book3S HV P9: Move cede logic out of XIVE escalation rearmi=
ng
      KVM: PPC: Book3S HV P9: Split !nested case out from guest entry
      KVM: PPC: Book3S HV Nested: L2 must not run with L1 xive context
      KVM: PPC: Book3S HV Nested: L2 LPCR should inherit L1 LPES setting
      powerpc/64: Bump SIGSTKSZ and MINSIGSTKSZ
      powerpc/signal: Report minimum signal frame size to userspace via AT_=
MINSIGSTKSZ
      powerpc/rtas: Move rtas entry assembly into its own file
      powerpc/rtas: Make enter_rtas a nokprobe symbol on 64-bit
      powerpc/rtas: Fix whitespace in rtas_entry.S
      powerpc/rtas: Call enter_rtas with MSR[EE] disabled
      powerpc/rtas: PACA can be restored directly from SPRG
      powerpc/rtas: Leave MSR[RI] enabled over RTAS call
      powerpc/rtas: enture rtas_call is called with MMU enabled

Oliver O'Halloran (1):
      powerpc/powernv/pci: Drop VF MPS fixup

Oscar Salvador (1):
      powerpc/numa: Associate numa node to its cpu earlier

Pali Roh=C3=A1r (1):
      powerpc/85xx/p2020: Add fsl,mpc8548-pmc node

Peng Wu (1):
      powerpc/iommu: Add missing of_node_put in iommu_init_early_dart

Qing Wang (1):
      macintosh/ams: Replace snprintf in show functions with sysfs_emit

Randy Dunlap (6):
      powerpc/8xx: export 'cpm_setbrg' for modules
      powerpc/mpc52xx: Fix some pr_debug() issues
      powerpc/fadump: Correct two typos in a comment
      powerpc/idle: Fix return value of __setup() handler
      powerpc/4xx/cpm: Fix return value of __setup() handler
      macintosh: via-pmu and via-cuda need RTC_LIB

Reza Arbab (1):
      powerpc: Enable the DAWR on POWER9 DD2.3 and above

Russell Currey (4):
      selftests/powerpc: Fix typo in spectre_v2
      powerpc/powernv: Get L1D flush requirements from device-tree
      powerpc/powernv: Get STF barrier requirements from device-tree
      selftests/powerpc: Better reporting in spectre_v2

Sohaib Mohamed (1):
      Documentation: Fix typo in testing/sysfs-class-cxl

Vaibhav Jain (1):
      powerpc/papr_scm: Fix leaking nvdimm_events_map elements

Vasant Hegde (1):
      powerpc/powernv/flash: Check OPAL flash calls exist before using

Wang Qing (1):
      powerpc/5xx: Drop unnecessary cast

Wang Wensheng (1):
      powerpc/perf: Fix symbol undeclared warning

Xiang wangx (1):
      powerpc: No need to initialise statics to 0

Xiaomeng Tong (1):
      KVM: PPC: Book3S HV: fix incorrect NULL check on list iterator

Xu Wang (1):
      powerpc/pseries/dlpar: Remove unnecessary cast to kfree()

Yang Guang (1):
      macintosh/adb: Use swap() to make code cleaner

Yang Li (2):
      powerpc/sstep: Use bitwise instead of arithmetic operator for flags
      macintosh: Fix warning comparing pointer to 0

Ye Bin (1):
      macintosh/via-pmu: Use DEFINE_SPINLOCK() for spinlock

Yu Kuai (2):
      powerpc: remove set but not used variable 'force_printk_to_btext'
      powerpc: make 'boot_text_mapped' static

YueHaibing (6):
      powerpc/eeh: Remove unused inline function eeh_dev_phb_init_dynamic()
      powerpc/smp: Remove unused inline functions
      powerpc/kuap: Remove unused inline function __kuap_assert_locked()
      powerpc/eeh: Remove unused inline functions
      powerpc/book3e: Fix build error
      powerpc/kaslr_booke: Fix build error

Zheng Bin (1):
      powerpc/pseries/vas: Call misc_deregister if sysfs init fails

Zou Wei (1):
      macintosh: Use for_each_child_of_node() macro

Zucheng Zheng (1):
      powerpc/pmac: remove unused symbol

maqiang (1):
      powerpc: Remove redundant spaces to match coding style

zuoqilin (1):
      powerpc/pseries/cmm: Remove unneeded variable "ret"


 Documentation/ABI/testing/sysfs-class-cxl                        |   4 +-
 Documentation/devicetree/bindings/powerpc/fsl/cache_sram.txt     |  20 -
 Documentation/powerpc/dawr-power9.rst                            |  26 +-
 Documentation/powerpc/kasan.txt                                  |  58 ++
 arch/Kconfig                                                     |   2 -
 arch/arm64/include/asm/processor.h                               |   4 +-
 arch/powerpc/Kconfig                                             |  25 +-
 arch/powerpc/Kconfig.debug                                       |   3 +-
 arch/powerpc/Makefile                                            |  12 +-
 arch/powerpc/boot/Makefile                                       |  10 +-
 arch/powerpc/boot/crt0.S                                         |  45 +-
 arch/powerpc/boot/cuboot-hotfoot.c                               |   2 +-
 arch/powerpc/boot/dts/fsl/p2020si-post.dtsi                      |   5 +
 arch/powerpc/boot/dts/microwatt.dts                              |   2 +
 arch/powerpc/boot/ops.h                                          |   6 -
 arch/powerpc/boot/wrapper                                        |   2 +-
 arch/powerpc/crypto/aes-spe-glue.c                               |   2 +-
 arch/powerpc/include/asm/book3s/64/hash.h                        |   4 +
 arch/powerpc/include/asm/book3s/64/hugetlb.h                     |   4 -
 arch/powerpc/include/asm/book3s/64/mmu-hash.h                    |   1 +
 arch/powerpc/include/asm/book3s/64/mmu.h                         |   6 -
 arch/powerpc/include/asm/book3s/64/pgtable.h                     |   3 +
 arch/powerpc/include/asm/book3s/64/radix.h                       |  12 +-
 arch/powerpc/include/asm/book3s/64/slice.h                       |  26 +
 arch/powerpc/include/asm/checksum.h                              |  26 +-
 arch/powerpc/include/asm/code-patching.h                         |  67 +-
 arch/powerpc/include/asm/cputable.h                              |  16 +-
 arch/powerpc/include/asm/drmem.h                                 |   3 +
 arch/powerpc/include/asm/eeh.h                                   |   6 -
 arch/powerpc/include/asm/elf.h                                   |  14 +-
 arch/powerpc/include/asm/fadump-internal.h                       |   2 +-
 arch/powerpc/include/asm/fsl_85xx_cache_sram.h                   |  35 -
 arch/powerpc/include/asm/ftrace.h                                |   8 +-
 arch/powerpc/include/asm/hugetlb.h                               |   2 +-
 arch/powerpc/include/asm/inst.h                                  |  13 +-
 arch/powerpc/include/asm/interrupt.h                             |  52 +-
 arch/powerpc/include/asm/io.h                                    |   2 -
 arch/powerpc/include/asm/iommu.h                                 |   6 +-
 arch/powerpc/include/asm/kasan.h                                 |  22 +
 arch/powerpc/include/asm/kup.h                                   |   1 -
 arch/powerpc/include/asm/kvm_book3s_asm.h                        |   3 -
 arch/powerpc/include/asm/kvm_host.h                              |  10 +-
 arch/powerpc/include/asm/kvm_ppc.h                               |  14 +-
 arch/powerpc/include/asm/linkage.h                               |   2 +-
 arch/powerpc/include/asm/mmu_context.h                           |   5 -
 arch/powerpc/include/asm/module.h                                |   2 -
 arch/powerpc/include/asm/nohash/tlbflush.h                       |  12 +-
 arch/powerpc/include/asm/paca.h                                  |   8 +-
 arch/powerpc/include/asm/page.h                                  |   8 +-
 arch/powerpc/include/asm/parport.h                               |   2 +-
 arch/powerpc/include/asm/pci-bridge.h                            |  14 +-
 arch/powerpc/include/asm/pnv-pci.h                               |   1 +
 arch/powerpc/include/asm/ppc-opcode.h                            | 109 ++--
 arch/powerpc/include/asm/ppc_asm.h                               |   4 +-
 arch/powerpc/include/asm/probes.h                                |  36 ++
 arch/powerpc/include/asm/processor.h                             |   2 -
 arch/powerpc/include/asm/ptrace.h                                |   2 +-
 arch/powerpc/include/asm/reg.h                                   |   3 -
 arch/powerpc/include/asm/signal.h                                |   5 +
 arch/powerpc/include/asm/slice.h                                 |  46 --
 arch/powerpc/include/asm/smp.h                                   |   2 -
 arch/powerpc/include/asm/svm.h                                   |   2 +
 arch/powerpc/include/asm/switch_to.h                             |   9 +
 arch/powerpc/include/asm/task_size_64.h                          |   8 +
 arch/powerpc/include/asm/time.h                                  |   1 +
 arch/powerpc/include/asm/topology.h                              |   8 +-
 arch/powerpc/include/asm/types.h                                 |   8 -
 arch/powerpc/include/asm/vas.h                                   |   2 +-
 arch/powerpc/include/uapi/asm/auxvec.h                           |   4 +-
 arch/powerpc/include/uapi/asm/signal.h                           |   5 +
 arch/powerpc/kernel/Makefile                                     |  13 +-
 arch/powerpc/kernel/btext.c                                      |   5 +-
 arch/powerpc/kernel/cacheinfo.c                                  |   1 -
 arch/powerpc/kernel/cputable.c                                   |  28 +-
 arch/powerpc/kernel/crash_dump.c                                 |   2 +-
 arch/powerpc/kernel/dawr.c                                       |   2 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c                                |  10 +-
 arch/powerpc/kernel/eeh.c                                        |   4 +-
 arch/powerpc/kernel/eeh_driver.c                                 |   1 -
 arch/powerpc/kernel/eeh_event.c                                  |   2 +-
 arch/powerpc/kernel/eeh_pe.c                                     |   3 +-
 arch/powerpc/kernel/eeh_sysfs.c                                  |   1 +
 arch/powerpc/kernel/entry_32.S                                   |  49 --
 arch/powerpc/kernel/entry_64.S                                   | 150 ---=
--
 arch/powerpc/kernel/fadump.c                                     |  52 +-
 arch/powerpc/kernel/head_64.S                                    |   4 +-
 arch/powerpc/kernel/idle.c                                       |   2 +-
 arch/powerpc/kernel/interrupt_64.S                               |  12 +-
 arch/powerpc/kernel/iommu.c                                      |   5 +-
 arch/powerpc/kernel/irq.c                                        |  86 +--
 arch/powerpc/kernel/isa-bridge.c                                 |   2 +-
 arch/powerpc/kernel/kprobes.c                                    |  10 +-
 arch/powerpc/kernel/legacy_serial.c                              |   2 +-
 arch/powerpc/kernel/misc_64.S                                    |   2 +-
 arch/powerpc/kernel/module.c                                     |   4 +-
 arch/powerpc/kernel/module_32.c                                  |  40 +-
 arch/powerpc/kernel/module_64.c                                  |  11 +-
 arch/powerpc/kernel/nvram_64.c                                   |   2 +-
 arch/powerpc/kernel/paca.c                                       |   5 -
 arch/powerpc/kernel/pci-common.c                                 |   6 +-
 arch/powerpc/kernel/pci-hotplug.c                                |   1 +
 arch/powerpc/kernel/pci_32.c                                     |   1 -
 arch/powerpc/kernel/pci_64.c                                     |  11 +-
 arch/powerpc/kernel/pci_dn.c                                     |   2 +-
 arch/powerpc/kernel/pci_of_scan.c                                |   4 +-
 arch/powerpc/kernel/proc_powerpc.c                               |   2 +-
 arch/powerpc/kernel/process.c                                    |  46 +-
 arch/powerpc/kernel/prom.c                                       |   1 -
 arch/powerpc/kernel/prom_init.c                                  |   4 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c                         |   2 +-
 arch/powerpc/kernel/ptrace/ptrace.c                              |   6 -
 arch/powerpc/kernel/rtas-proc.c                                  |   9 +-
 arch/powerpc/kernel/rtas-rtc.c                                   |   1 -
 arch/powerpc/kernel/rtas.c                                       |  21 +-
 arch/powerpc/kernel/rtas_entry.S                                 | 172 +++=
++
 arch/powerpc/kernel/rtas_flash.c                                 |   2 +-
 arch/powerpc/kernel/rtas_pci.c                                   |   3 +-
 arch/powerpc/kernel/rtasd.c                                      |   1 -
 arch/powerpc/kernel/setup-common.c                               |  79 ++-
 arch/powerpc/kernel/setup_32.c                                   |   3 +-
 arch/powerpc/kernel/setup_64.c                                   |   3 +-
 arch/powerpc/kernel/signal.c                                     |  15 +
 arch/powerpc/kernel/signal_32.c                                  |   6 +
 arch/powerpc/kernel/signal_64.c                                  |   7 +-
 arch/powerpc/kernel/smp.c                                        |  27 +-
 arch/powerpc/kernel/syscalls.c                                   |   2 +-
 arch/powerpc/kernel/sysfs.c                                      |   2 +-
 arch/powerpc/kernel/time.c                                       |  15 +-
 arch/powerpc/kernel/trace/Makefile                               |   5 +-
 arch/powerpc/kernel/trace/ftrace.c                               | 383 +++=
+-------
 arch/powerpc/kernel/traps.c                                      |   6 +-
 arch/powerpc/kernel/uprobes.c                                    |   5 +
 arch/powerpc/kernel/vdso.c                                       |   1 -
 arch/powerpc/kernel/vdso/Makefile                                |   1 +
 arch/powerpc/kernel/vdso/vdso32.lds.S                            |   1 -
 arch/powerpc/kernel/vdso/vdso64.lds.S                            |   1 -
 arch/powerpc/kernel/watchdog.c                                   |   2 +-
 arch/powerpc/kexec/Makefile                                      |   2 +
 arch/powerpc/kexec/core.c                                        |   1 -
 arch/powerpc/kexec/core_64.c                                     |   4 +-
 arch/powerpc/kexec/crash.c                                       |   1 -
 arch/powerpc/kvm/Makefile                                        |  10 +-
 arch/powerpc/kvm/book3s_64_entry.S                               |   2 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c                              |  42 +-
 arch/powerpc/kvm/book3s_64_vio.c                                 |  43 ++
 arch/powerpc/kvm/book3s_64_vio_hv.c                              | 672 ---=
-----------------
 arch/powerpc/kvm/book3s_emulate.c                                |   2 +-
 arch/powerpc/kvm/book3s_hv.c                                     |  74 ++-
 arch/powerpc/kvm/book3s_hv_builtin.c                             |  64 --
 arch/powerpc/kvm/book3s_hv_nested.c                              | 137 ++--
 arch/powerpc/kvm/book3s_hv_p9_entry.c                            |  17 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c                             |   7 +-
 arch/powerpc/kvm/book3s_hv_rm_xive.c                             |  46 --
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                          |  30 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c                               |  10 +-
 arch/powerpc/kvm/book3s_interrupts.S                             |   2 +-
 arch/powerpc/kvm/book3s_pr.c                                     |   2 +-
 arch/powerpc/kvm/book3s_pr_papr.c                                |   6 +
 arch/powerpc/kvm/book3s_rmhandlers.S                             |   2 +-
 arch/powerpc/kvm/book3s_xics.c                                   |   2 +-
 arch/powerpc/kvm/book3s_xive.c                                   | 655 +++=
+++++++++++++++-
 arch/powerpc/kvm/book3s_xive.h                                   |   7 -
 arch/powerpc/kvm/book3s_xive_native.c                            |   2 +-
 arch/powerpc/kvm/book3s_xive_template.c                          | 636 ---=
---------------
 arch/powerpc/kvm/e500mc.c                                        |   3 +-
 arch/powerpc/kvm/powerpc.c                                       |  31 +-
 arch/powerpc/kvm/trace_hv.h                                      |   8 +-
 arch/powerpc/lib/Makefile                                        |   3 +
 arch/powerpc/lib/code-patching.c                                 |  61 +-
 arch/powerpc/lib/feature-fixups.c                                |   2 +-
 arch/powerpc/lib/sstep.c                                         |  52 +-
 arch/powerpc/mm/Makefile                                         |   3 +-
 arch/powerpc/mm/book3s32/mmu.c                                   |   1 -
 arch/powerpc/mm/book3s64/Makefile                                |  11 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c                          |   2 +-
 arch/powerpc/mm/book3s64/hash_utils.c                            |  39 +-
 arch/powerpc/mm/book3s64/iommu_api.c                             |  68 --
 arch/powerpc/mm/book3s64/pgtable.c                               |   2 +-
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c                     |  55 --
 arch/powerpc/mm/book3s64/radix_pgtable.c                         |   2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                             |   2 +-
 arch/powerpc/mm/book3s64/slb.c                                   |   4 +-
 arch/powerpc/mm/{ =3D> book3s64}/slice.c                           |  71 +=
+-
 arch/powerpc/mm/cacheflush.c                                     |   2 +-
 arch/powerpc/mm/drmem.c                                          |   2 +-
 arch/powerpc/mm/hugetlbpage.c                                    |  34 -
 arch/powerpc/mm/init_32.c                                        |   1 -
 arch/powerpc/mm/init_64.c                                        |   7 +-
 arch/powerpc/mm/kasan/Makefile                                   |   3 +-
 arch/powerpc/mm/kasan/{kasan_init_32.c =3D> init_32.c}             |   0
 arch/powerpc/mm/kasan/init_book3s_64.c                           | 102 +++
 arch/powerpc/mm/mem.c                                            |   4 +
 arch/powerpc/mm/mmap.c                                           | 256 ---=
-----
 arch/powerpc/mm/mmu_decl.h                                       |   4 +
 arch/powerpc/mm/nohash/40x.c                                     |   1 -
 arch/powerpc/mm/nohash/book3e_hugetlbpage.c                      |   2 +-
 arch/powerpc/mm/nohash/fsl_book3e.c                              |  22 +-
 arch/powerpc/mm/nohash/kaslr_booke.c                             |   5 +-
 arch/powerpc/mm/nohash/mmu_context.c                             |   9 -
 arch/powerpc/mm/nohash/tlb.c                                     |   6 +-
 arch/powerpc/mm/numa.c                                           |  36 +-
 arch/powerpc/mm/pageattr.c                                       |   1 +
 arch/powerpc/mm/pgtable-frag.c                                   |   2 +-
 arch/powerpc/mm/pgtable.c                                        |   2 +-
 arch/powerpc/mm/pgtable_64.c                                     |   1 -
 arch/powerpc/mm/ptdump/ptdump.c                                  |   3 +-
 arch/powerpc/net/bpf_jit.h                                       |   4 +-
 arch/powerpc/net/bpf_jit_comp.c                                  |   2 +-
 arch/powerpc/net/bpf_jit_comp64.c                                |   4 +-
 arch/powerpc/perf/8xx-pmu.c                                      |   2 +-
 arch/powerpc/perf/core-book3s.c                                  |   6 +-
 arch/powerpc/perf/hv-24x7.c                                      |  40 +-
 arch/powerpc/perf/imc-pmu.c                                      |   5 +-
 arch/powerpc/perf/isa207-common.c                                |  18 +-
 arch/powerpc/perf/power9-pmu.c                                   |   4 +-
 arch/powerpc/platforms/40x/ppc40x_simple.c                       |   1 -
 arch/powerpc/platforms/44x/canyonlands.c                         |   1 +
 arch/powerpc/platforms/44x/fsp2.c                                |   2 +-
 arch/powerpc/platforms/44x/ppc44x_simple.c                       |   1 -
 arch/powerpc/platforms/44x/ppc476.c                              |   2 +-
 arch/powerpc/platforms/44x/sam440ep.c                            |   1 -
 arch/powerpc/platforms/44x/warp.c                                |   3 +-
 arch/powerpc/platforms/4xx/cpm.c                                 |   2 +-
 arch/powerpc/platforms/4xx/hsta_msi.c                            |   1 +
 arch/powerpc/platforms/4xx/pci.c                                 |   1 +
 arch/powerpc/platforms/4xx/uic.c                                 |   3 +-
 arch/powerpc/platforms/512x/clock-commonclk.c                    |   2 +-
 arch/powerpc/platforms/512x/mpc5121_ads.c                        |   1 -
 arch/powerpc/platforms/512x/mpc5121_ads_cpld.c                   |   3 +-
 arch/powerpc/platforms/512x/mpc512x_generic.c                    |   1 -
 arch/powerpc/platforms/512x/mpc512x_shared.c                     |   4 +-
 arch/powerpc/platforms/52xx/efika.c                              |   1 -
 arch/powerpc/platforms/52xx/lite5200.c                           |   1 -
 arch/powerpc/platforms/52xx/lite5200_pm.c                        |   2 +
 arch/powerpc/platforms/52xx/media5200.c                          |   3 +-
 arch/powerpc/platforms/52xx/mpc5200_simple.c                     |   2 +-
 arch/powerpc/platforms/52xx/mpc52xx_common.c                     |   4 +-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c                        |   8 +-
 arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c                    |   5 +-
 arch/powerpc/platforms/52xx/mpc52xx_pci.c                        |  22 +-
 arch/powerpc/platforms/52xx/mpc52xx_pic.c                        |   3 +-
 arch/powerpc/platforms/52xx/mpc52xx_pm.c                         |   2 +
 arch/powerpc/platforms/82xx/ep8248e.c                            |   1 -
 arch/powerpc/platforms/82xx/km82xx.c                             |   1 -
 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c                     |   2 +-
 arch/powerpc/platforms/83xx/km83xx.c                             |   1 -
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c                   |  15 +-
 arch/powerpc/platforms/83xx/mpc832x_mds.c                        |   1 -
 arch/powerpc/platforms/83xx/mpc832x_rdb.c                        |   1 +
 arch/powerpc/platforms/83xx/mpc834x_itx.c                        |   1 -
 arch/powerpc/platforms/83xx/mpc834x_mds.c                        |   2 +-
 arch/powerpc/platforms/83xx/mpc836x_mds.c                        |   1 -
 arch/powerpc/platforms/83xx/mpc836x_rdk.c                        |   1 -
 arch/powerpc/platforms/83xx/mpc837x_mds.c                        |   2 +-
 arch/powerpc/platforms/83xx/suspend.c                            |   7 +-
 arch/powerpc/platforms/83xx/usb.c                                |   2 +-
 arch/powerpc/platforms/85xx/Kconfig                              |   9 -
 arch/powerpc/platforms/85xx/corenet_generic.c                    |   1 -
 arch/powerpc/platforms/85xx/ge_imp3a.c                           |   2 +-
 arch/powerpc/platforms/85xx/ksi8560.c                            |   1 -
 arch/powerpc/platforms/85xx/mpc8536_ds.c                         |   1 -
 arch/powerpc/platforms/85xx/mpc85xx_cds.c                        |   5 +-
 arch/powerpc/platforms/85xx/mpc85xx_ds.c                         |   2 +-
 arch/powerpc/platforms/85xx/mpc85xx_mds.c                        |   1 -
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c                        |   1 -
 arch/powerpc/platforms/85xx/p1010rdb.c                           |   1 -
 arch/powerpc/platforms/85xx/p1022_ds.c                           |   1 +
 arch/powerpc/platforms/85xx/p1022_rdk.c                          |   1 +
 arch/powerpc/platforms/85xx/p1023_rdb.c                          |   2 +-
 arch/powerpc/platforms/85xx/qemu_e500.c                          |   1 +
 arch/powerpc/platforms/85xx/smp.c                                |   2 +-
 arch/powerpc/platforms/85xx/socrates.c                           |   1 -
 arch/powerpc/platforms/85xx/stx_gp3.c                            |   1 -
 arch/powerpc/platforms/85xx/tqm85xx.c                            |   1 -
 arch/powerpc/platforms/85xx/xes_mpc85xx.c                        |   2 +-
 arch/powerpc/platforms/86xx/gef_ppc9a.c                          |   4 +-
 arch/powerpc/platforms/86xx/gef_sbc310.c                         |   4 +-
 arch/powerpc/platforms/86xx/gef_sbc610.c                         |   4 +-
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c                       |   3 +-
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c                       |   1 -
 arch/powerpc/platforms/86xx/mvme7100.c                           |   1 +
 arch/powerpc/platforms/8xx/Makefile                              |   2 +-
 arch/powerpc/platforms/8xx/adder875.c                            |   4 +-
 arch/powerpc/platforms/8xx/cpm1-ic.c                             | 188 +++=
+++
 arch/powerpc/platforms/8xx/cpm1.c                                | 142 +--=
--
 arch/powerpc/platforms/8xx/ep88xc.c                              |   3 +-
 arch/powerpc/platforms/8xx/m8xx_setup.c                          |  31 +-
 arch/powerpc/platforms/8xx/mpc86xads_setup.c                     |   3 +-
 arch/powerpc/platforms/8xx/mpc885ads_setup.c                     |   3 +-
 arch/powerpc/platforms/8xx/mpc8xx.h                              |   1 -
 arch/powerpc/platforms/8xx/pic.c                                 |  20 +-
 arch/powerpc/platforms/8xx/pic.h                                 |   2 +-
 arch/powerpc/platforms/8xx/tqm8xx_setup.c                        |   3 +-
 arch/powerpc/platforms/Kconfig.cputype                           |  11 +-
 arch/powerpc/platforms/amigaone/setup.c                          |   1 +
 arch/powerpc/platforms/book3s/vas-api.c                          |   2 +-
 arch/powerpc/platforms/cell/axon_msi.c                           |   2 +-
 arch/powerpc/platforms/cell/cbe_powerbutton.c                    |   2 +-
 arch/powerpc/platforms/cell/cbe_regs.c                           |   4 +-
 arch/powerpc/platforms/cell/cbe_thermal.c                        |   1 -
 arch/powerpc/platforms/cell/interrupt.c                          |   3 +-
 arch/powerpc/platforms/cell/iommu.c                              |   4 +-
 arch/powerpc/platforms/cell/pervasive.c                          |   1 -
 arch/powerpc/platforms/cell/ras.c                                |   2 +-
 arch/powerpc/platforms/cell/setup.c                              |   1 -
 arch/powerpc/platforms/cell/smp.c                                |   1 -
 arch/powerpc/platforms/cell/spider-pci.c                         |   3 +-
 arch/powerpc/platforms/cell/spider-pic.c                         |   3 +-
 arch/powerpc/platforms/cell/spu_base.c                           |   1 -
 arch/powerpc/platforms/cell/spu_manage.c                         |   5 +-
 arch/powerpc/platforms/cell/spu_priv1_mmio.c                     |   1 -
 arch/powerpc/platforms/cell/spufs/inode.c                        |   2 +-
 arch/powerpc/platforms/chrp/nvram.c                              |   2 +-
 arch/powerpc/platforms/chrp/pci.c                                |   2 +-
 arch/powerpc/platforms/chrp/setup.c                              |   6 +-
 arch/powerpc/platforms/chrp/smp.c                                |   1 -
 arch/powerpc/platforms/chrp/time.c                               |   4 +-
 arch/powerpc/platforms/embedded6xx/gamecube.c                    |   1 -
 arch/powerpc/platforms/embedded6xx/holly.c                       |   3 +-
 arch/powerpc/platforms/embedded6xx/linkstation.c                 |   1 -
 arch/powerpc/platforms/embedded6xx/ls_uart.c                     |   2 +-
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c                |   2 +-
 arch/powerpc/platforms/embedded6xx/mvme5100.c                    |   2 +-
 arch/powerpc/platforms/embedded6xx/storcenter.c                  |   1 -
 arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c               |   3 +-
 arch/powerpc/platforms/embedded6xx/wii.c                         |   2 +-
 arch/powerpc/platforms/fsl_uli1575.c                             |   1 +
 arch/powerpc/platforms/maple/pci.c                               |   2 +-
 arch/powerpc/platforms/maple/setup.c                             |   2 +-
 arch/powerpc/platforms/maple/time.c                              |   2 +-
 arch/powerpc/platforms/pasemi/dma_lib.c                          |   2 +
 arch/powerpc/platforms/pasemi/iommu.c                            |   1 +
 arch/powerpc/platforms/pasemi/misc.c                             |   1 +
 arch/powerpc/platforms/pasemi/msi.c                              |   2 +-
 arch/powerpc/platforms/pasemi/pci.c                              |   1 +
 arch/powerpc/platforms/pasemi/setup.c                            |   2 +-
 arch/powerpc/platforms/powermac/backlight.c                      |   1 -
 arch/powerpc/platforms/powermac/bootx_init.c                     |   3 +-
 arch/powerpc/platforms/powermac/feature.c                        |   1 -
 arch/powerpc/platforms/powermac/low_i2c.c                        |   4 +-
 arch/powerpc/platforms/powermac/nvram.c                          |   4 +-
 arch/powerpc/platforms/powermac/pci.c                            |   3 +-
 arch/powerpc/platforms/powermac/pfunc_core.c                     |   4 +-
 arch/powerpc/platforms/powermac/pic.c                            |   6 +-
 arch/powerpc/platforms/powermac/pmac.h                           |   2 +
 arch/powerpc/platforms/powermac/setup.c                          |   5 -
 arch/powerpc/platforms/powermac/smp.c                            |   4 +-
 arch/powerpc/platforms/powermac/time.c                           |   2 +-
 arch/powerpc/platforms/powermac/udbg_adb.c                       |   2 +-
 arch/powerpc/platforms/powermac/udbg_scc.c                       |   2 +-
 arch/powerpc/platforms/powernv/Makefile                          |   8 +
 arch/powerpc/platforms/powernv/eeh-powernv.c                     |  29 +-
 arch/powerpc/platforms/powernv/idle.c                            |   4 +-
 arch/powerpc/platforms/powernv/ocxl.c                            |   2 +-
 arch/powerpc/platforms/powernv/opal-fadump.c                     | 102 +--
 arch/powerpc/platforms/powernv/opal-fadump.h                     |  10 +-
 arch/powerpc/platforms/powernv/opal-flash.c                      |   4 +
 arch/powerpc/platforms/powernv/opal-imc.c                        |   2 +-
 arch/powerpc/platforms/powernv/opal-lpc.c                        |   2 +-
 arch/powerpc/platforms/powernv/opal-memory-errors.c              |   2 +-
 arch/powerpc/platforms/powernv/pci-cxl.c                         |   1 +
 arch/powerpc/platforms/powernv/pci-ioda-tce.c                    |   5 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                        |  51 +-
 arch/powerpc/platforms/powernv/pci-sriov.c                       |   4 +-
 arch/powerpc/platforms/powernv/pci.c                             |   1 -
 arch/powerpc/platforms/powernv/pci.h                             |   3 +-
 arch/powerpc/platforms/powernv/setup.c                           |   9 +
 arch/powerpc/platforms/powernv/smp.c                             |   2 +-
 arch/powerpc/platforms/powernv/ultravisor.c                      |   1 +
 arch/powerpc/platforms/powernv/vas-fault.c                       |   2 +-
 arch/powerpc/platforms/powernv/vas-window.c                      |   4 +-
 arch/powerpc/platforms/powernv/vas.h                             |   2 +-
 arch/powerpc/platforms/ps3/Kconfig                               |   2 +-
 arch/powerpc/platforms/ps3/htab.c                                |   1 -
 arch/powerpc/platforms/ps3/mm.c                                  |   3 +-
 arch/powerpc/platforms/ps3/os-area.c                             |   2 -
 arch/powerpc/platforms/ps3/setup.c                               |   2 +-
 arch/powerpc/platforms/ps3/system-bus.c                          |   2 +-
 arch/powerpc/platforms/pseries/Makefile                          |   4 +
 arch/powerpc/platforms/pseries/cmm.c                             |   4 +-
 arch/powerpc/platforms/pseries/dlpar.c                           |   3 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c                     |   9 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c                     |   2 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c                  |   1 -
 arch/powerpc/platforms/pseries/iommu.c                           |   5 +-
 arch/powerpc/platforms/pseries/kexec.c                           |   8 +
 arch/powerpc/platforms/pseries/lpar.c                            |   1 -
 arch/powerpc/platforms/pseries/lparcfg.c                         |   1 -
 arch/powerpc/platforms/pseries/msi.c                             |   1 +
 arch/powerpc/platforms/pseries/nvram.c                           |   2 +-
 arch/powerpc/platforms/pseries/papr_scm.c                        |  54 +-
 arch/powerpc/platforms/pseries/pci.c                             |   1 -
 arch/powerpc/platforms/pseries/pmem.c                            |   1 -
 arch/powerpc/platforms/pseries/pseries.h                         |   1 +
 arch/powerpc/platforms/pseries/reconfig.c                        |   1 -
 arch/powerpc/platforms/pseries/rtas-fadump.c                     |  17 +-
 arch/powerpc/platforms/pseries/setup.c                           |  18 +-
 arch/powerpc/platforms/pseries/smp.c                             |   1 -
 arch/powerpc/platforms/pseries/vas-sysfs.c                       |  18 +-
 arch/powerpc/platforms/pseries/vas.c                             |   2 +-
 arch/powerpc/platforms/pseries/vio.c                             |   1 +
 arch/powerpc/sysdev/Makefile                                     |   1 -
 arch/powerpc/sysdev/cpm2_pic.c                                   |   2 +-
 arch/powerpc/sysdev/dart_iommu.c                                 |   8 +-
 arch/powerpc/sysdev/dcr.c                                        |   2 +-
 arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h                        |  88 ---
 arch/powerpc/sysdev/fsl_85xx_cache_sram.c                        | 147 ---=
--
 arch/powerpc/sysdev/fsl_85xx_l2ctlr.c                            | 216 ---=
----
 arch/powerpc/sysdev/fsl_lbc.c                                    |   5 +-
 arch/powerpc/sysdev/fsl_msi.c                                    |   4 +-
 arch/powerpc/sysdev/fsl_pci.c                                    |   5 +-
 arch/powerpc/sysdev/fsl_rio.c                                    |   2 +
 arch/powerpc/sysdev/fsl_soc.c                                    |   1 -
 arch/powerpc/sysdev/ge/ge_pic.c                                  |   6 +-
 arch/powerpc/sysdev/grackle.c                                    |   2 +-
 arch/powerpc/sysdev/i8259.c                                      |   2 +-
 arch/powerpc/sysdev/indirect_pci.c                               |   1 -
 arch/powerpc/sysdev/ipic.c                                       |   3 +-
 arch/powerpc/sysdev/mmio_nvram.c                                 |   2 +-
 arch/powerpc/sysdev/mpic.c                                       |   2 +
 arch/powerpc/sysdev/mpic_msgr.c                                  |   5 +-
 arch/powerpc/sysdev/mpic_msi.c                                   |   5 +-
 arch/powerpc/sysdev/mpic_timer.c                                 |   2 +-
 arch/powerpc/sysdev/mpic_u3msi.c                                 |   4 +-
 arch/powerpc/sysdev/msi_bitmap.c                                 |   1 +
 arch/powerpc/sysdev/pmi.c                                        |   3 +-
 arch/powerpc/sysdev/rtc_cmos_setup.c                             |   2 +-
 arch/powerpc/sysdev/tsi108_dev.c                                 |   3 +-
 arch/powerpc/sysdev/tsi108_pci.c                                 |   3 +-
 arch/powerpc/sysdev/xics/icp-native.c                            |   3 +-
 arch/powerpc/sysdev/xics/icp-opal.c                              |   1 +
 arch/powerpc/sysdev/xics/ics-native.c                            |   2 +-
 arch/powerpc/sysdev/xics/ics-opal.c                              |   1 -
 arch/powerpc/sysdev/xics/ics-rtas.c                              |   1 -
 arch/powerpc/sysdev/xics/xics-common.c                           |   6 +-
 arch/powerpc/sysdev/xive/common.c                                |   6 +-
 arch/powerpc/sysdev/xive/native.c                                |   4 +-
 arch/powerpc/sysdev/xive/spapr.c                                 |   9 +-
 arch/powerpc/xmon/ppc-opc.c                                      |   2 +-
 arch/powerpc/xmon/xmon.c                                         |  16 +-
 drivers/crypto/nx/nx-common-powernv.c                            |   2 +-
 drivers/macintosh/Kconfig                                        |   6 +
 drivers/macintosh/Makefile                                       |   3 +-
 drivers/macintosh/adb.c                                          |   2 +-
 drivers/macintosh/adbhid.c                                       |   9 +-
 drivers/macintosh/ams/ams-core.c                                 |   2 +-
 drivers/macintosh/ams/ams-i2c.c                                  |   6 +-
 drivers/macintosh/ans-lcd.c                                      |   2 +-
 drivers/macintosh/macio-adb.c                                    |   5 +-
 drivers/macintosh/macio_asic.c                                   |   9 +-
 drivers/macintosh/macio_sysfs.c                                  |   2 +
 drivers/macintosh/mediabay.c                                     |   2 +-
 drivers/macintosh/rack-meter.c                                   |   1 -
 drivers/macintosh/smu.c                                          |   7 +-
 drivers/macintosh/therm_adt746x.c                                |   1 -
 drivers/macintosh/therm_windtunnel.c                             |   1 -
 drivers/macintosh/via-cuda.c                                     |  10 +-
 drivers/macintosh/via-pmu-backlight.c                            |   1 -
 drivers/macintosh/via-pmu-led.c                                  |   2 +-
 drivers/macintosh/via-pmu.c                                      |   9 +-
 drivers/macintosh/windfarm_ad7417_sensor.c                       |   2 +-
 drivers/macintosh/windfarm_core.c                                |   2 -
 drivers/macintosh/windfarm_cpufreq_clamp.c                       |   2 -
 drivers/macintosh/windfarm_fcu_controls.c                        |   2 +-
 drivers/macintosh/windfarm_lm75_sensor.c                         |   1 -
 drivers/macintosh/windfarm_lm87_sensor.c                         |   2 +-
 drivers/macintosh/windfarm_max6690_sensor.c                      |   2 +-
 drivers/macintosh/windfarm_mpu.h                                 |   2 +
 drivers/macintosh/windfarm_pm112.c                               |   4 +-
 drivers/macintosh/windfarm_pm121.c                               |   3 +-
 drivers/macintosh/windfarm_pm72.c                                |   2 +-
 drivers/macintosh/windfarm_pm81.c                                |   3 +-
 drivers/macintosh/windfarm_pm91.c                                |   3 +-
 drivers/macintosh/windfarm_rm31.c                                |   2 +-
 drivers/macintosh/windfarm_smu_controls.c                        |   3 +-
 drivers/macintosh/windfarm_smu_sat.c                             |   2 +-
 drivers/macintosh/windfarm_smu_sensors.c                         |   3 +-
 drivers/misc/cxl/api.c                                           |   1 +
 drivers/misc/cxl/cxl.h                                           |   2 +
 drivers/misc/cxl/cxllib.c                                        |   1 +
 drivers/misc/cxl/flash.c                                         |   1 +
 drivers/misc/cxl/guest.c                                         |   2 +
 drivers/misc/cxl/irq.c                                           |   1 +
 drivers/misc/cxl/main.c                                          |   1 +
 drivers/misc/cxl/native.c                                        |   1 +
 drivers/misc/ocxl/afu_irq.c                                      |   1 +
 drivers/misc/ocxl/file.c                                         |   2 +
 drivers/misc/ocxl/link.c                                         |   1 +
 fs/hugetlbfs/inode.c                                             |  23 +-
 include/linux/hugetlb.h                                          |   5 +
 include/linux/of_irq.h                                           |   6 +-
 include/linux/sched/mm.h                                         |  11 +-
 mm/mmap.c                                                        |  35 +-
 mm/util.c                                                        |   2 +-
 tools/testing/selftests/powerpc/include/utils.h                  |   5 +
 tools/testing/selftests/powerpc/math/Makefile                    |   4 +-
 tools/testing/selftests/powerpc/math/mma.S                       |  33 +
 tools/testing/selftests/powerpc/math/mma.c                       |  48 ++
 tools/testing/selftests/powerpc/mm/.gitignore                    |   1 +
 tools/testing/selftests/powerpc/mm/Makefile                      |   4 +-
 tools/testing/selftests/powerpc/mm/large_vm_gpr_corruption.c     | 156 +++=
++
 tools/testing/selftests/powerpc/pmu/ebb/fixed_instruction_loop.S |  43 --
 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c        |   2 +-
 tools/testing/selftests/powerpc/security/spectre_v2.c            |  32 +-
 504 files changed, 3409 insertions(+), 4602 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/powerpc/fsl/cache_sra=
m.txt
 create mode 100644 Documentation/powerpc/kasan.txt
 delete mode 100644 arch/powerpc/include/asm/fsl_85xx_cache_sram.h
 delete mode 100644 arch/powerpc/include/asm/slice.h
 create mode 100644 arch/powerpc/kernel/rtas_entry.S
 delete mode 100644 arch/powerpc/kvm/book3s_64_vio_hv.c
 delete mode 100644 arch/powerpc/kvm/book3s_hv_rm_xive.c
 delete mode 100644 arch/powerpc/kvm/book3s_xive_template.c
 rename arch/powerpc/mm/{ =3D> book3s64}/slice.c (91%)
 rename arch/powerpc/mm/kasan/{kasan_init_32.c =3D> init_32.c} (100%)
 create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c
 delete mode 100644 arch/powerpc/mm/mmap.c
 create mode 100644 arch/powerpc/platforms/8xx/cpm1-ic.c
 delete mode 100644 arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h
 delete mode 100644 arch/powerpc/sysdev/fsl_85xx_cache_sram.c
 delete mode 100644 arch/powerpc/sysdev/fsl_85xx_l2ctlr.c
 create mode 100644 tools/testing/selftests/powerpc/math/mma.S
 create mode 100644 tools/testing/selftests/powerpc/math/mma.c
 create mode 100644 tools/testing/selftests/powerpc/mm/large_vm_gpr_corrupt=
ion.c
 delete mode 100644 tools/testing/selftests/powerpc/pmu/ebb/fixed_instructi=
on_loop.S
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmKSGZgACgkQUevqPMjh
pYD4LhAAuqRFeb5AKC2lLUG9K5ink4svbl+6Ig+NBPywK1T8O1Bngya5T3TnqDvL
wNyNtGMoFUk0mdqfHv8gF6LbH46XP+jVUnsYqyiCiUepUtaEwicSPYTZ/GbjFI82
ta0Nq9z8OS74AxflcdXsQIL55dYaWcxp0xhIwp7T2rKrXtYJ0/P+sX9lGQ1/16D+
rxA2+pIEPo546KjbOkBTR9yMo3mhAbQp4oppB4AIhQ6mLH/kWpSedB2Ggb1hY1on
nMjPQqKa+1RkZevfwlsc7gx7JbJEalh47p9zpmM7nlpoVrck5DN2lyVa35QAQyPA
txuvxguVYUNmmUbaCZ9f7qC5ctXHWHqIYIpt2VwldKJboso3xgi/BIiDya+LpcAd
sC1n30xXkJ7jhVqn5AlEDM0dRNTQn6KtuL4xui4Atpkz3FZe+hX2sHHdfPqDJoHX
EQNCr7M6uEte4GYxJUzk05uKFeH2/i6AazSsor4bKQlbO1XGNfWZEYPAy3OKwM7i
8AbD+UL0v5CU5ZNP96CqWH3Zv3C4MR5+hTnE3oC0hGxDOKgVt2iUwVVVCRX3o1gI
cQ0Eofbipp7jRVlKVYC+/YIuUbJAVhgGuCZqVR/EW2PQjbdOgQ+5eA7Htc7yeqac
7yygrxDTx64tBDxJ+ZK+c3aHOxCOMtKIP2hYbvwKADPlGU3tgBA=3D
=3DdCi1
-----END PGP SIGNATURE-----
