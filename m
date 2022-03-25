Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D884E7124
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 11:26:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPyt16wHJz30CJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 21:26:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AAyxLBPL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPysL35n0z2xgX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 21:25:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=AAyxLBPL; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KPys324p3z4xYy;
 Fri, 25 Mar 2022 21:25:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1648203924;
 bh=cwdBDBvFf6SFjBMCXyngFofN0HXVDbIPHDkiApcccOQ=;
 h=From:To:Cc:Subject:Date:From;
 b=AAyxLBPLMNQGNWC3RKeD6k0vQhm7wkbRaBBm3EVD1+ysaoNdxsrvSFrfV/wOOqpb/
 cHuGrZxnIkaLMRDJqjF6NptlcU9f22gwdLod5nEG9SWt1IQZ0QQ5pW8hWiRxFDoA1D
 8Fm5tbSdzxHs1l/c+9TZ1qUwcDTeL7PzJQ29VKghx4LfgPPTgib9rkGq9pUn5jcROk
 fY3E2hnCE9iUAmdCmoa/XIRPlpMLv6nB2nMSPvBcp5rZ2dEBckrf3htX/zwzCCuVox
 OfqaIn8UgDpnGWmikJJQnSk4vrkb1tKL3peFMyeiZtS29bpZboIhggCMZL1jkF3OA3
 ztEIMcKrTPQAA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-1 tag
Date: Fri, 25 Mar 2022 21:25:02 +1100
Message-ID: <87zglefhxd.fsf@mpe.ellerman.id.au>
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
Cc: wangborong@cdjrlc.com, unixbhaskar@gmail.com, wedsonaf@google.com,
 pmladek@suse.com, aik@ozlabs.ru, jniethe5@gmail.com, psampat@linux.ibm.com,
 mbenes@suse.cz, hbh25y@gmail.com, mikey@neuling.org, joe.lawrence@redhat.com,
 anders.roxell@linaro.org, aneesh.kumar@linux.ibm.com, deller@gmx.de,
 danielhb413@gmail.com, haren@linux.ibm.com, treding@nvidia.com,
 ganeshgr@linux.ibm.com, clabbe@baylibre.com, mamatha4@linux.vnet.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, msuchanek@suse.de,
 kernel.noureddine@gmail.com, nathanl@linux.ibm.com, pmenzel@molgen.mpg.de,
 yuehaibing@huawei.com, keescook@chromium.org, arnd@arndb.de,
 guozhengkui@vivo.com, kjain@linux.ibm.com, chenjingwen6@huawei.com,
 npiggin@gmail.com, oss@buserror.net, rmclure@linux.ibm.com,
 maddy@linux.ibm.com, christophe.jaillet@wanadoo.fr, jakobkoschel@gmail.com,
 sachinp@linux.ibm.com, bigunclemax@gmail.com, ldufour@linux.ibm.com,
 hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, farosas@linux.ibm.com,
 geoff@infradead.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 sourabhjain@linux.ibm.com, Julia.Lawall@inria.fr, riteshh@linux.ibm.com,
 cgel.zte@gmail.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 tobias@waldekranz.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.18.

Livepatch support for 32-bit is probably the standout new feature, otherwis=
e mostly just
lots of bits and pieces all over the board.

There's a series of commits cleaning up function descriptor handling, which=
 touches
a few other arches as well as LKDTM. It has acks from Arnd, Kees and Helge.

There's no conflicts with your current tree. There are two minor conflicts =
in linux-next,
one with the nvdimm tree[1] and the other with the tip tree[2].

cheers

1: https://lore.kernel.org/all/20220315191538.323eefbb@canb.auug.org.au/
2: https://lore.kernel.org/all/20220315130857.4610e761@canb.auug.org.au/


Notable out of area changes:

  a257cacc3871 asm-generic: Define CONFIG_HAVE_FUNCTION_DESCRIPTORS:
    arch/Kconfig
    arch/ia64/Kconfig
    arch/parisc/Kconfig
    include/linux/kallsyms.h

  41a88b45479d ia64: Rename 'ip' to 'addr' in 'struct fdesc'
    arch/ia64/include/asm/elf.h
    arch/ia64/kernel/module.c

  e1478d8eaf27 asm-generic: Refactor dereference_[kernel]_function_descript=
or()
    arch/ia64/include/asm/sections.h
    arch/parisc/include/asm/sections.h
    arch/parisc/kernel/process.c
    include/asm-generic/sections.h

  5e5a6c544165 lkdtm: Add a test for function descriptors protection
    drivers/misc/lkdtm/core.c
    drivers/misc/lkdtm/lkdtm.h
    drivers/misc/lkdtm/perms.c
    tools/testing/selftests/lkdtm/tests.txt

  kernel/extable.c		# b64913394f12 lkdtm: Really write into kernel text in =
WRITE_KERN
  kernel/livepatch/core.c	# 2f293651eca3 livepatch: Fix build failure on 32=
 bits processors


The following changes since commit 26291c54e111ff6ba87a164d85d4a4e134b7315c:

  Linux 5.17-rc2 (2022-01-30 15:37:07 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.18-1

for you to fetch changes up to fe2640bd7a62f1f7c3f55fbda31084085075bc30:

  powerpc/pseries: Fix use after free in remove_phb_dynamic() (2022-03-21 1=
3:17:47 +1100)

- ------------------------------------------------------------------
powerpc updates for 5.18

 - Enforce kernel RO, and implement STRICT_MODULE_RWX for 603.

 - Add support for livepatch to 32-bit.

 - Implement CONFIG_DYNAMIC_FTRACE_WITH_ARGS.

 - Merge vdso64 and vdso32 into a single directory.

 - Fix build errors with newer binutils.

 - Add support for UADDR64 relocations, which are emitted by some toolchain=
s. This allows
   powerpc to build with the latest lld.

 - Fix (another) potential userspace r13 corruption in transactional memory=
 handling.

 - Cleanups of function descriptor handling & related fixes to LKDTM.

Thanks to: Abdul Haleem, Alexey Kardashevskiy, Anders Roxell, Aneesh Kumar =
K.V, Anton
Blanchard, Arnd Bergmann, Athira Rajeev, Bhaskar Chowdhury, C=C3=A9dric Le =
Goater, Chen
Jingwen, Christophe JAILLET, Christophe Leroy, Corentin Labbe, Daniel Axten=
s, Daniel
Henrique Barboza, David Dai, Fabiano Rosas, Ganesh Goudar, Guo Zhengkui, Ha=
ngyu Hua, Haren
Myneni, Hari Bathini, Igor Zhbanov, Jakob Koschel, Jason Wang, Jeremy Kerr,=
 Joachim
Wiberg, Jordan Niethe, Julia Lawall, Kajol Jain, Kees Cook, Laurent Dufour,=
 Madhavan
Srinivasan, Mamatha Inamdar, Maxime Bizon, Maxim Kiselev, Maxim Kochetkov, =
Michal
Suchanek, Nageswara R Sastry, Nathan Lynch, Naveen N. Rao, Nicholas Piggin,=
 Nour-eddine
Taleb, Paul Menzel, Ping Fang, Pratik R. Sampat, Randy Dunlap, Ritesh Harja=
ni, Rohan
McLure, Russell Currey, Sachin Sant, Segher Boessenkool, Shivaprasad G Bhat=
, Sourabh Jain,
Thierry Reding, Tobias Waldekranz, Tyrel Datwyler, Vaibhav Jain, Vladimir O=
ltean, Wedson
Almeida Filho, YueHaibing.

- ------------------------------------------------------------------
Alexey Kardashevskiy (2):
      KVM: PPC: Merge powerpc's debugfs entry content into generic entry
      powerpc/64: Add UADDR64 relocation support

Anders Roxell (3):
      powerpc/lib/sstep: Fix 'sthcx' instruction
      powerpc: Fix build errors with newer binutils
      powerpc/lib/sstep: Fix build errors with newer binutils

Aneesh Kumar K.V (1):
      powerpc/mm: Update default hugetlb size early

Athira Rajeev (11):
      powerpc/perf: Don't use perf_hw_context for trace IMC PMU
      selftests/powerpc/pmu: Include mmap_buffer field as part of struct ev=
ent
      selftests/powerpc/pmu: Add support for perf sampling tests
      selftests/powerpc/pmu: Add macro to extract mmcr0/mmcr1 fields
      selftests/powerpc/pmu/: Add interface test for mmcr0 exception bits
      selftests/powerpc/pmu/: Add interface test for mmcr0_cc56run field
      selftests/powerpc/pmu/: Add interface test for mmcr0_pmccext bit
      selftests/powerpc/pmu/: Add interface test for mmcr0_pmcjce field
      selftests/powerpc/pmu/: Add interface test for mmcr0_fc56 field using=
 pmc1
      selftests/powerpc/pmu/: Add interface test for mmcr0_pmc56 using pmc5
      selftests/powerpc/pmu/: Add interface test for mmcr1_comb field

Bhaskar Chowdhury (1):
      powerpc/epapr: Fix parmeters typo

Chen Jingwen (1):
      powerpc/kasan: Fix early region not updated correctly

Christophe JAILLET (1):
      powerpc/xive: Add some error handling code to 'xive_spapr_init()'

Christophe Leroy (65):
      powerpc/603: Remove outdated comment
      powerpc/603: Clear C bit when PTE is read only
      powerpc/nohash: Remove pte_same()
      powerpc/32s: Make pte_update() non atomic on 603 core
      powerpc/machdep: Remove CONFIG_PPC_HAS_FEATURE_CALLS
      powerpc/machdep: Move sys_ctrler_t definition into pmac_feature.h
      powerpc/mpc86xx_hpcn: Remove obsolete statement
      powerpc/corenet: Change criteria to set MPIC_ENABLE_COREINT
      powerpc/32: Remove remaining .stabs annotations
      powerpc/32: Remove _ENTRY() macro
      livepatch: Fix build failure on 32 bits processors
      powerpc/module_32: Fix livepatching for RO modules
      powerpc/ftrace: Add support for livepatch to PPC32
      powerpc/ftrace: Don't save again LR in ftrace_regs_caller() on PPC32
      powerpc/ftrace: Simplify PPC32's return_to_handler()
      powerpc/ftrace: Prepare PPC32's ftrace_caller() for CONFIG_DYNAMIC_FT=
RACE_WITH_ARGS
      powerpc/ftrace: Prepare PPC64's ftrace_caller() for CONFIG_DYNAMIC_FT=
RACE_WITH_ARGS
      powerpc/ftrace: Implement CONFIG_DYNAMIC_FTRACE_WITH_ARGS
      powerpc/ftrace: Refactor ftrace_{en/dis}able_ftrace_graph_caller
      powerpc/ftrace: directly call of function graph tracer by ftrace call=
er
      powerpc/ftrace: Prepare ftrace_64_mprofile.S for reuse by PPC32
      powerpc/ftrace: Remove ftrace_32.S
      powerpc/set_memory: Avoid spinlock recursion in change_page_attr()
      powerpc: Add set_memory_{p/np}() and remove set_memory_attr()
      powerpc/bpf: Always reallocate BPF_REG_5, BPF_REG_AX and TMP_REG when=
 possible
      powerpc/32s: Enable STRICT_MODULE_RWX for the 603 core
      powerpc: Use the newly added is_tsk_32bit_task() macro
      powerpc/lib/sstep: Use l1_dcache_bytes() instead of opencoding
      powerpc/lib/sstep: Remove unneeded #ifdef __powerpc64__
      powerpc/lib/sstep: use truncate_if_32bit()
      powerpc/vdso: augment VDSO32 functions to support 64 bits build
      powerpc/vdso: Rework VDSO32 makefile to add a prefix to object files
      powerpc/vdso: Merge vdso64 and vdso32 into a single directory
      powerpc/vdso: Remove cvdso_call_time macro
      powerpc/vdso: Move cvdso_call macro into gettimeofday.S
      powerpc: Don't allow the use of EMIT_BUG_ENTRY with BUGFLAG_WARNING
      powerpc/ftrace: Also save r1 in ftrace_caller()
      powerpc/ftrace: Add recursion protection in prepare_ftrace_return()
      powerpc/ftrace: Have arch_ftrace_get_regs() return NULL unless FL_SAV=
E_REGS is set
      powerpc/ftrace: Style cleanup in ftrace_mprofile.S
      powerpc: Fix 'sparse' checking on PPC64le
      powerpc: Move and rename func_descr_t
      powerpc: Use 'struct func_desc' instead of 'struct ppc64_opd_entry'
      powerpc: Remove 'struct ppc64_opd_entry'
      powerpc: Prepare func_desc_t for refactorisation
      ia64: Rename 'ip' to 'addr' in 'struct fdesc'
      asm-generic: Define CONFIG_HAVE_FUNCTION_DESCRIPTORS
      asm-generic: Define 'func_desc_t' to commonly describe function descr=
iptors
      asm-generic: Refactor dereference_[kernel]_function_descriptor()
      lkdtm: Force do_nothing() out of line
      lkdtm: Really write into kernel text in WRITE_KERN
      lkdtm: Fix execute_[user]_location()
      lkdtm: Add a test for function descriptors protection
      powerpc: Remove remaining stab codes
      powerpc/interrupt: Remove struct interrupt_state
      powerpc/ftrace: Don't use lmw/stmw in ftrace_regs_caller()
      powerpc/ftrace: Refactor ftrace_{regs_}caller
      powerpc/ftrace: Regroup PPC64 specific operations in ftrace_mprofile.S
      powerpc/ftrace: Use STK_GOT in ftrace_mprofile.S
      powerpc: Cleanup asm-prototypes.c
      powerpc/smp: Declare current_set static
      powerpc/kexec: Declare kexec_paca static
      powerpc: Move C prototypes out of asm-prototypes.h
      powerpc/bitops: Force inlining of fls()
      powerpc/64: Force inlining of prevent_user_access() and set_kuap()

Corentin Labbe (1):
      macintosh: macio_asic: remove useless cast for driver.name

Daniel Henrique Barboza (1):
      powerpc/mm/numa: skip NUMA_NO_NODE onlining in parse_numa_properties()

Fabiano Rosas (10):
      KVM: PPC: Book3S HV: Stop returning internal values to userspace
      KVM: PPC: Fix vmx/vsx mixup in mmio emulation
      KVM: PPC: mmio: Reject instructions that access more than mmio.data s=
ize
      KVM: PPC: mmio: Return to guest after emulation failure
      KVM: PPC: Book3s: mmio: Deliver DSI after emulation failure
      KVM: PPC: Book3S HV: Check return value of kvmppc_radix_init
      KVM: PPC: Book3S HV: Delay setting of kvm ops
      KVM: PPC: Book3S HV: Free allocated memory if module init fails
      KVM: PPC: Decrement module refcount if init_vm fails
      powerpc: Fix debug print in smp_setup_cpu_maps

Ganesh Goudar (4):
      powerpc/pseries: Parse control memory access error
      selftests/powerpc: Add test for real address error handling
      powerpc/mce: Modify the real address error logging messages
      powerpc/mce: Avoid using irq_work_queue() in realmode

Guo Zhengkui (1):
      powerpc/module_64: fix array_size.cocci warning

Hangyu Hua (2):
      powerpc/secvar: fix refcount leak in format_show()
      powerpc: 8xx: fix a return value error in mpc8xx_pic_init

Haren Myneni (12):
      powerpc/pseries/vas: Use common names in VAS capability structure
      powerpc/pseries/vas: Save PID in pseries_vas_window struct
      powerpc/vas: Add paste address mmap fault handler
      powerpc/vas: Return paste instruction failure if no active window
      powerpc/vas: Map paste address only if window is active
      powerpc/pseries/vas: Close windows with DLPAR core removal
      powerpc/pseries/vas: Reopen windows with DLPAR core add
      powerpc/pseries/vas: sysfs interface to export capabilities
      powerpc/pseries/vas: Add 'update_total_credits' entry for QoS capabil=
ities
      powerpc/pseries/vas: Define global hv_cop_caps struct
      powerpc/pseries/vas: Modify reconfig open/close functions for migrati=
on
      powerpc/pseries/vas: Add VAS migration handler

Hari Bathini (1):
      powerpc/fadump: register for fadump as early as possible

Jakob Koschel (1):
      powerpc/sysdev: fix incorrect use to determine if list is empty

Jason Wang (1):
      powerpc/kvm: no need to initialise statics to 0

Jordan Niethe (1):
      powerpc64/bpf: Store temp registers' bpf to ppc mapping

Julia Lawall (1):
      powerpc/spufs: adjust list element pointer type

Kajol Jain (4):
      selftests/powerpc/pmu: Add utility functions to post process the mmap=
 buffer
      selftests/powerpc/pmu: Add macro to extract mmcr3 and mmcra fields
      selftests/powerpc/pmu/: Add interface test for mmcr3_src fields
      selftests/powerpc/pmu: Add interface test for mmcra register fields

Laurent Dufour (1):
      powerpc/pseries: read the lpar name from the firmware

Madhavan Srinivasan (5):
      selftests/powerpc/pmu: Add macros to parse event codes
      selftests/powerpc/pmu: Add event_init_sampling function
      selftests/powerpc/pmu: Add macros to extract mmcr fields
      selftests/powerpc/pmu/: Add interface test for mmcr2_l2l3 field
      selftests/powerpc/pmu/: Add interface test for mmcr2_fcs_fch fields

Mamatha Inamdar (1):
      PCI: rpaphp: Add MODULE_DESCRIPTION

Maxim Kiselev (2):
      powerpc: dts: t104xrdb: fix phy type for FMAN 4/5
      powerpc: dts: t1040rdb: fix ports names for Seville Ethernet switch

Michael Ellerman (10):
      powerpc/64: Move paca allocation later in boot
      powerpc/ptdump: Fix sparse warning in hashpagetable.c
      powerpc: Fix STACKTRACE=3Dn build
      powerpc/Makefile: Don't pass -mcpu=3Dpowerpc64 when building 32-bit
      Merge branch 'topic/func-desc-lkdtm' into next
      Merge branch 'topic/ppc-kvm' into next
      powerpc/64s: Don't use DSISR for SLB faults
      powerpc/code-patching: Pre-map patch area
      powerpc/64e: Tie PPC_BOOK3E_64 to PPC_FSL_BOOK3E
      powerpc/pseries: Fix use after free in remove_phb_dynamic()

Michal Suchanek (1):
      powerpc: add link stack flush mitigation status in debugfs.

Nathan Lynch (1):
      powerpc/pseries: make pseries_devicetree_update() static

Naveen N. Rao (16):
      powerpc/bpf: Skip branch range validation during first pass
      powerpc/bpf: Emit a single branch instruction for known short branch =
ranges
      powerpc/bpf: Handle large branch ranges with BPF_EXIT
      powerpc64/bpf: Do not save/restore LR on each call to bpf_stf_barrier=
()
      powerpc64/bpf: Use r12 for constant blinding
      powerpc64: Set PPC64_ELF_ABI_v[1|2] macros to 1
      powerpc64/bpf elfv2: Setup kernel TOC in r2 on entry
      powerpc64/bpf elfv1: Do not load TOC before calling functions
      powerpc64/bpf: Optimize instruction sequence used for function calls
      powerpc/bpf: Rename PPC_BL_ABS() to PPC_BL()
      powerpc64/bpf: Convert some of the uses of PPC_BPF_[LL|STL] to PPC_BP=
F_[LD|STD]
      powerpc64/bpf: Get rid of PPC_BPF_[LL|STL|STLU] macros
      powerpc/bpf: Cleanup bpf_jit.h
      powerpc/bpf: Move bpf_jit64.h into bpf_jit_comp64.c
      powerpc/bpf: Use _Rn macros for GPRs
      powerpc/bpf: Simplify bpf_to_ppc() and adopt it for powerpc64

Nicholas Piggin (4):
      powerpc/64s/hash: Make hash faults work in NMI context
      powerpc/tm: Fix more userspace r13 corruption
      powerpc/time: Fix KVM host re-arming a timer beyond decrementer range
      powerpc/time: improve decrementer clockevent processing

Nour-eddine Taleb (1):
      KVM: PPC: Book3S HV: remove unnecessary casts

Paul Menzel (1):
      powerpc/boot: Add `otheros-too-big.bld` to .gitignore

Pratik R. Sampat (2):
      powerpc/pseries: Interface to represent PAPR firmware attributes
      selftest/powerpc: Add PAPR sysfs attributes sniff test

Randy Dunlap (1):
      powerpc/xive: fix return value of __setup handler

Ritesh Harjani (1):
      selftests/powerpc/copyloops: Add memmove_64 test

Rohan McLure (1):
      powerpc: declare unmodified attribute_group usages const

Sachin Sant (1):
      powerpc/xive: Export XIVE IPI information for online-only processors.

Sourabh Jain (1):
      powerpc: Set crashkernel offset to mid of RMA region

Thierry Reding (1):
      powerpc: dts: Fix some I2C unit addresses

Tobias Waldekranz (1):
      powerpc/e500/qemu-e500: allow core to idle without waiting

Vaibhav Jain (1):
      powerpc/papr_scm: Implement initial support for injecting smart errors

Wedson Almeida Filho (1):
      powerpc/module_64: use module_init_section instead of patching names

YueHaibing (1):
      powerpc/spufs: Fix build warning when CONFIG_PROC_FS=3Dn

jing yangyang (1):
      powerpc/ps3: remove unneeded semicolons


 Documentation/ABI/testing/sysfs-bus-papr-pmem                             =
                 |  12 +
 Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info           =
                 |  29 ++
 arch/Kconfig                                                              =
                 |   3 +
 arch/ia64/Kconfig                                                         =
                 |   1 +
 arch/ia64/include/asm/elf.h                                               =
                 |   2 +-
 arch/ia64/include/asm/sections.h                                          =
                 |  24 +-
 arch/ia64/kernel/module.c                                                 =
                 |   6 +-
 arch/parisc/Kconfig                                                       =
                 |   1 +
 arch/parisc/include/asm/sections.h                                        =
                 |  16 +-
 arch/parisc/kernel/process.c                                              =
                 |  21 -
 arch/powerpc/Kconfig                                                      =
                 |  10 +-
 arch/powerpc/Makefile                                                     =
                 |   8 +-
 arch/powerpc/boot/.gitignore                                              =
                 |   1 +
 arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts                              =
                 |  30 ++
 arch/powerpc/boot/dts/fsl/t1040rdb.dts                                    =
                 |   8 +-
 arch/powerpc/boot/dts/fsl/t104xrdb.dtsi                                   =
                 |   4 +-
 arch/powerpc/boot/dts/xpedite5200.dts                                     =
                 |   2 +-
 arch/powerpc/boot/dts/xpedite5200_xmon.dts                                =
                 |   2 +-
 arch/powerpc/include/asm/asm-compat.h                                     =
                 |   2 +
 arch/powerpc/include/asm/asm-prototypes.h                                 =
                 |  58 ---
 arch/powerpc/include/asm/bitops.h                                         =
                 |   4 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h                              =
                 |  37 +-
 arch/powerpc/include/asm/book3s/64/kup.h                                  =
                 |   4 +-
 arch/powerpc/include/asm/bug.h                                            =
                 |  13 +-
 arch/powerpc/include/asm/code-patching.h                                  =
                 |   2 +-
 arch/powerpc/include/asm/elf.h                                            =
                 |   6 +
 arch/powerpc/include/asm/epapr_hcalls.h                                   =
                 |   2 +-
 arch/powerpc/include/asm/firmware.h                                       =
                 |   4 +-
 arch/powerpc/include/asm/ftrace.h                                         =
                 |  66 ++-
 arch/powerpc/include/asm/hugetlb.h                                        =
                 |   5 +-
 arch/powerpc/include/asm/hvcall.h                                         =
                 |   8 +-
 arch/powerpc/include/asm/interrupt.h                                      =
                 |  45 +-
 arch/powerpc/include/asm/io.h                                             =
                 |  40 +-
 arch/powerpc/include/asm/kexec.h                                          =
                 |   2 +
 arch/powerpc/include/asm/kvm_host.h                                       =
                 |   6 +-
 arch/powerpc/include/asm/kvm_ppc.h                                        =
                 |   2 +
 arch/powerpc/include/asm/livepatch.h                                      =
                 |  12 +-
 arch/powerpc/include/asm/machdep.h                                        =
                 |  22 +-
 arch/powerpc/include/asm/mce.h                                            =
                 |  13 +
 arch/powerpc/include/asm/nohash/32/pgtable.h                              =
                 |   3 -
 arch/powerpc/include/asm/nohash/64/pgtable.h                              =
                 |   3 -
 arch/powerpc/include/asm/paca.h                                           =
                 |   1 +
 arch/powerpc/include/asm/pmac_feature.h                                   =
                 |  12 +
 arch/powerpc/include/asm/ppc-opcode.h                                     =
                 |   2 +
 arch/powerpc/include/asm/ppc_asm.h                                        =
                 |  11 -
 arch/powerpc/include/asm/processor.h                                      =
                 |   8 +
 arch/powerpc/include/asm/rtas.h                                           =
                 |   1 -
 arch/powerpc/include/asm/sections.h                                       =
                 |  29 +-
 arch/powerpc/include/asm/set_memory.h                                     =
                 |  12 +-
 arch/powerpc/include/asm/setup.h                                          =
                 |   7 +
 arch/powerpc/include/asm/smp.h                                            =
                 |   3 +
 arch/powerpc/include/asm/spu.h                                            =
                 |   4 +-
 arch/powerpc/include/asm/syscalls.h                                       =
                 |   4 +
 arch/powerpc/include/asm/thread_info.h                                    =
                 |   2 +-
 arch/powerpc/include/asm/types.h                                          =
                 |  10 +-
 arch/powerpc/include/asm/uaccess.h                                        =
                 |   3 +
 arch/powerpc/include/asm/vas.h                                            =
                 |  14 +
 arch/powerpc/include/asm/vdso/gettimeofday.h                              =
                 |  69 +--
 arch/powerpc/include/uapi/asm/elf.h                                       =
                 |   8 -
 arch/powerpc/include/uapi/asm/papr_pdsm.h                                 =
                 |  18 +
 arch/powerpc/kernel/Makefile                                              =
                 |   6 +-
 arch/powerpc/kernel/asm-offsets.c                                         =
                 |   2 +-
 arch/powerpc/kernel/early_32.c                                            =
                 |   1 -
 arch/powerpc/kernel/fadump.c                                              =
                 |  13 +-
 arch/powerpc/kernel/head_40x.S                                            =
                 |  18 +-
 arch/powerpc/kernel/head_44x.S                                            =
                 |   4 +-
 arch/powerpc/kernel/head_8xx.S                                            =
                 |   4 +-
 arch/powerpc/kernel/head_book3s_32.S                                      =
                 |  21 +-
 arch/powerpc/kernel/head_fsl_booke.S                                      =
                 |   6 +-
 arch/powerpc/kernel/interrupt.c                                           =
                 |   1 -
 arch/powerpc/kernel/irq.c                                                 =
                 |   1 -
 arch/powerpc/kernel/mce.c                                                 =
                 |  69 +--
 arch/powerpc/kernel/module_32.c                                           =
                 |  44 +-
 arch/powerpc/kernel/module_64.c                                           =
                 |  56 +--
 arch/powerpc/kernel/prom.c                                                =
                 |  15 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c                                  =
                 |   2 +-
 arch/powerpc/kernel/ptrace/ptrace.c                                       =
                 |   7 +-
 arch/powerpc/kernel/reloc_64.S                                            =
                 |  67 ++-
 arch/powerpc/kernel/rtas.c                                                =
                 |   6 +
 arch/powerpc/kernel/security.c                                            =
                 |  15 +
 arch/powerpc/kernel/secvar-sysfs.c                                        =
                 |   9 +-
 arch/powerpc/kernel/setup-common.c                                        =
                 |   4 +-
 arch/powerpc/kernel/setup_64.c                                            =
                 |   1 -
 arch/powerpc/kernel/signal_64.c                                           =
                 |   8 +-
 arch/powerpc/kernel/smp.c                                                 =
                 |   3 +-
 arch/powerpc/kernel/syscalls.c                                            =
                 |   1 -
 arch/powerpc/kernel/tau_6xx.c                                             =
                 |   1 -
 arch/powerpc/kernel/time.c                                                =
                 |  26 +-
 arch/powerpc/kernel/tm.S                                                  =
                 |  25 +-
 arch/powerpc/kernel/trace/Makefile                                        =
                 |   6 +-
 arch/powerpc/kernel/trace/ftrace.c                                        =
                 |  40 +-
 arch/powerpc/kernel/trace/ftrace_32.S                                     =
                 | 187 --------
 arch/powerpc/kernel/trace/{ftrace_64.S =3D> ftrace_low.S}                 =
                   |  14 +
 arch/powerpc/kernel/trace/{ftrace_64_mprofile.S =3D> ftrace_mprofile.S}   =
                   | 228 +++------
 arch/powerpc/kernel/{vdso64 =3D> vdso}/.gitignore                         =
                   |   2 +
 arch/powerpc/kernel/vdso/Makefile                                         =
                 | 103 ++++
 arch/powerpc/kernel/{vdso32 =3D> vdso}/cacheflush.S                       =
                   |   4 +-
 arch/powerpc/kernel/{vdso32 =3D> vdso}/datapage.S                         =
                   |  10 +-
 arch/powerpc/kernel/{vdso32/gen_vdso_offsets.sh =3D> vdso/gen_vdso32_offse=
ts.sh}             |   0
 arch/powerpc/kernel/{vdso64/gen_vdso_offsets.sh =3D> vdso/gen_vdso64_offse=
ts.sh}             |   0
 arch/powerpc/kernel/{vdso32 =3D> vdso}/getcpu.S                           =
                   |   4 +-
 arch/powerpc/kernel/{vdso32 =3D> vdso}/gettimeofday.S                     =
                   |  54 ++-
 arch/powerpc/kernel/{vdso32 =3D> vdso}/note.S                             =
                   |   0
 arch/powerpc/kernel/{vdso32/sigtramp.S =3D> vdso/sigtramp32.S}            =
                   |   0
 arch/powerpc/kernel/{vdso64/sigtramp.S =3D> vdso/sigtramp64.S}            =
                   |   0
 arch/powerpc/kernel/{vdso32 =3D> vdso}/vdso32.lds.S                       =
                   |   0
 arch/powerpc/kernel/{vdso64 =3D> vdso}/vdso64.lds.S                       =
                   |   0
 arch/powerpc/kernel/{vdso32 =3D> vdso}/vgettimeofday.c                    =
                   |  23 +-
 arch/powerpc/kernel/vdso32/Makefile                                       =
                 |  73 ---
 arch/powerpc/kernel/vdso32_wrapper.S                                      =
                 |   2 +-
 arch/powerpc/kernel/vdso64/Makefile                                       =
                 |  56 ---
 arch/powerpc/kernel/vdso64/cacheflush.S                                   =
                 |  75 ---
 arch/powerpc/kernel/vdso64/datapage.S                                     =
                 |  59 ---
 arch/powerpc/kernel/vdso64/getcpu.S                                       =
                 |  33 --
 arch/powerpc/kernel/vdso64/gettimeofday.S                                 =
                 |  58 ---
 arch/powerpc/kernel/vdso64/note.S                                         =
                 |   1 -
 arch/powerpc/kernel/vdso64/vgettimeofday.c                                =
                 |  29 --
 arch/powerpc/kernel/vdso64_wrapper.S                                      =
                 |   2 +-
 arch/powerpc/kernel/vmlinux.lds.S                                         =
                 |   2 -
 arch/powerpc/kexec/core.c                                                 =
                 |  15 +-
 arch/powerpc/kexec/core_64.c                                              =
                 |   3 +-
 arch/powerpc/kvm/book3s_64_mmu_host.c                                     =
                 |   2 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c                                       =
                 |   2 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c                                    =
                 |   2 +-
 arch/powerpc/kvm/book3s_hv.c                                              =
                 |  59 +--
 arch/powerpc/kvm/book3s_hv_builtin.c                                      =
                 |   1 -
 arch/powerpc/kvm/book3s_hv_rm_xive.c                                      =
                 |   1 -
 arch/powerpc/kvm/book3s_xics.c                                            =
                 |  15 +-
 arch/powerpc/kvm/book3s_xive.c                                            =
                 |  15 +-
 arch/powerpc/kvm/book3s_xive_native.c                                     =
                 |  15 +-
 arch/powerpc/kvm/e500.c                                                   =
                 |   1 +
 arch/powerpc/kvm/e500mc.c                                                 =
                 |   1 +
 arch/powerpc/kvm/emulate_loadstore.c                                      =
                 |  10 +-
 arch/powerpc/kvm/powerpc.c                                                =
                 |  81 +++-
 arch/powerpc/kvm/timing.c                                                 =
                 |  21 +-
 arch/powerpc/kvm/timing.h                                                 =
                 |  12 +-
 arch/powerpc/kvm/trace_hv.h                                               =
                 |   1 +
 arch/powerpc/lib/checksum_32.S                                            =
                 |   3 -
 arch/powerpc/lib/code-patching.c                                          =
                 |  14 +
 arch/powerpc/lib/copy_32.S                                                =
                 |   3 -
 arch/powerpc/lib/sstep.c                                                  =
                 |  30 +-
 arch/powerpc/lib/vmx-helper.c                                             =
                 |   1 -
 arch/powerpc/mm/book3s64/hash_utils.c                                     =
                 |  54 +--
 arch/powerpc/mm/book3s64/hugetlbpage.c                                    =
                 |   2 +-
 arch/powerpc/mm/book3s64/slb.c                                            =
                 |   1 -
 arch/powerpc/mm/fault.c                                                   =
                 |  15 +-
 arch/powerpc/mm/hugetlbpage.c                                             =
                 |   5 +-
 arch/powerpc/mm/init_64.c                                                 =
                 |   4 +
 arch/powerpc/mm/kasan/kasan_init_32.c                                     =
                 |   3 +-
 arch/powerpc/mm/numa.c                                                    =
                 |   4 +-
 arch/powerpc/mm/pageattr.c                                                =
                 |  71 +--
 arch/powerpc/mm/pgtable_32.c                                              =
                 |  27 +-
 arch/powerpc/mm/ptdump/hashpagetable.c                                    =
                 |   5 +-
 arch/powerpc/net/bpf_jit.h                                                =
                 |  38 +-
 arch/powerpc/net/bpf_jit64.h                                              =
                 |  91 ----
 arch/powerpc/net/bpf_jit_comp.c                                           =
                 |  34 +-
 arch/powerpc/net/bpf_jit_comp32.c                                         =
                 | 127 ++---
 arch/powerpc/net/bpf_jit_comp64.c                                         =
                 | 440 +++++++++--------
 arch/powerpc/perf/callchain.h                                             =
                 |   9 +-
 arch/powerpc/perf/callchain_64.c                                          =
                 |  27 --
 arch/powerpc/perf/generic-compat-pmu.c                                    =
                 |   4 +-
 arch/powerpc/perf/hv-24x7.c                                               =
                 |   6 +-
 arch/powerpc/perf/hv-gpci.c                                               =
                 |   8 +-
 arch/powerpc/perf/imc-pmu.c                                               =
                 |  12 +-
 arch/powerpc/perf/isa207-common.c                                         =
                 |   2 +-
 arch/powerpc/perf/perf_regs.c                                             =
                 |   8 +-
 arch/powerpc/perf/power10-pmu.c                                           =
                 |   6 +-
 arch/powerpc/perf/power7-pmu.c                                            =
                 |   4 +-
 arch/powerpc/perf/power8-pmu.c                                            =
                 |   4 +-
 arch/powerpc/perf/power9-pmu.c                                            =
                 |   6 +-
 arch/powerpc/platforms/85xx/corenet_generic.c                             =
                 |   2 +-
 arch/powerpc/platforms/85xx/qemu_e500.c                                   =
                 |   5 +
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c                                =
                 |   6 -
 arch/powerpc/platforms/8xx/pic.c                                          =
                 |   1 +
 arch/powerpc/platforms/Kconfig.cputype                                    =
                 |   3 +-
 arch/powerpc/platforms/book3s/vas-api.c                                   =
                 | 145 +++++-
 arch/powerpc/platforms/cell/cbe_thermal.c                                 =
                 |   2 +-
 arch/powerpc/platforms/cell/spu_base.c                                    =
                 |   4 +-
 arch/powerpc/platforms/cell/spufs/sched.c                                 =
                 |   7 +-
 arch/powerpc/platforms/powermac/pmac.h                                    =
                 |   2 +
 arch/powerpc/platforms/powernv/idle.c                                     =
                 |   1 -
 arch/powerpc/platforms/powernv/opal-core.c                                =
                 |   2 +-
 arch/powerpc/platforms/powernv/opal-dump.c                                =
                 |   2 +-
 arch/powerpc/platforms/powernv/opal-flash.c                               =
                 |   2 +-
 arch/powerpc/platforms/powernv/opal-tracepoints.c                         =
                 |   1 -
 arch/powerpc/platforms/powernv/rng.c                                      =
                 |   6 +-
 arch/powerpc/platforms/ps3/system-bus.c                                   =
                 |   4 +-
 arch/powerpc/platforms/pseries/Makefile                                   =
                 |   5 +-
 arch/powerpc/platforms/pseries/firmware.c                                 =
                 |   1 +
 arch/powerpc/platforms/pseries/lpar.c                                     =
                 |   1 -
 arch/powerpc/platforms/pseries/lparcfg.c                                  =
                 |  87 ++++
 arch/powerpc/platforms/pseries/mobility.c                                 =
                 |   7 +-
 arch/powerpc/platforms/pseries/papr_platform_attributes.c                 =
                 | 361 ++++++++++++++
 arch/powerpc/platforms/pseries/papr_scm.c                                 =
                 |  92 +++-
 arch/powerpc/platforms/pseries/pci_dlpar.c                                =
                 |   4 +
 arch/powerpc/platforms/pseries/power.c                                    =
                 |   2 +-
 arch/powerpc/platforms/pseries/pseries.h                                  =
                 |   1 +
 arch/powerpc/platforms/pseries/ras.c                                      =
                 |  68 ++-
 arch/powerpc/platforms/pseries/setup.c                                    =
                 |   1 +
 arch/powerpc/platforms/pseries/vas-sysfs.c                                =
                 | 268 +++++++++++
 arch/powerpc/platforms/pseries/vas.c                                      =
                 | 500 ++++++++++++++++++--
 arch/powerpc/platforms/pseries/vas.h                                      =
                 |  30 +-
 arch/powerpc/sysdev/fsl_gtm.c                                             =
                 |   4 +-
 arch/powerpc/sysdev/mpic.c                                                =
                 |   4 +-
 arch/powerpc/sysdev/xive/common.c                                         =
                 |   8 +-
 arch/powerpc/sysdev/xive/spapr.c                                          =
                 |  36 +-
 arch/powerpc/tools/relocs_check.sh                                        =
                 |   7 +-
 drivers/macintosh/macio_asic.c                                            =
                 |   2 +-
 drivers/macintosh/via-cuda.c                                              =
                 |   1 +
 drivers/misc/lkdtm/core.c                                                 =
                 |   1 +
 drivers/misc/lkdtm/lkdtm.h                                                =
                 |   1 +
 drivers/misc/lkdtm/perms.c                                                =
                 |  71 ++-
 drivers/pci/hotplug/rpadlpar_core.c                                       =
                 |   1 +
 include/asm-generic/sections.h                                            =
                 |  15 +-
 include/linux/kallsyms.h                                                  =
                 |   2 +-
 kernel/extable.c                                                          =
                 |  24 +-
 kernel/livepatch/core.c                                                   =
                 |   4 +-
 sound/ppc/pmac.h                                                          =
                 |   1 +
 tools/testing/selftests/lkdtm/tests.txt                                   =
                 |   1 +
 tools/testing/selftests/powerpc/Makefile                                  =
                 |   4 +-
 tools/testing/selftests/powerpc/copyloops/.gitignore                      =
                 |   1 +
 tools/testing/selftests/powerpc/copyloops/Makefile                        =
                 |   9 +-
 tools/testing/selftests/powerpc/copyloops/asm/ppc_asm.h                   =
                 |   1 +
 tools/testing/selftests/powerpc/copyloops/mem_64.S                        =
                 |   1 +
 tools/testing/selftests/powerpc/copyloops/memcpy_stubs.S                  =
                 |   8 +
 tools/testing/selftests/powerpc/copyloops/memmove_validate.c              =
                 |  58 +++
 tools/testing/selftests/powerpc/include/reg.h                             =
                 |   4 +
 tools/testing/selftests/powerpc/mce/Makefile                              =
                 |   7 +
 tools/testing/selftests/powerpc/mce/inject-ra-err.c                       =
                 |  65 +++
 tools/testing/selftests/powerpc/mce/vas-api.h                             =
                 |   1 +
 {arch/powerpc/kernel/vdso32 =3D> tools/testing/selftests/powerpc/papr_attr=
ibutes}/.gitignore |   3 +-
 tools/testing/selftests/powerpc/papr_attributes/Makefile                  =
                 |   7 +
 tools/testing/selftests/powerpc/papr_attributes/attr_test.c               =
                 | 107 +++++
 tools/testing/selftests/powerpc/pmu/Makefile                              =
                 |  11 +-
 tools/testing/selftests/powerpc/pmu/event.c                               =
                 |  19 +-
 tools/testing/selftests/powerpc/pmu/event.h                               =
                 |   6 +
 tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore             =
                 |  11 +
 tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile               =
                 |  12 +
 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c                 =
                 | 412 ++++++++++++++++
 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h                 =
                 | 227 +++++++++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_cc56run_test.c   =
                 |  59 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_exceptionbits_tes=
t.c              |  59 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc1ce_test.=
c                |  59 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc56_test.c=
                 |  58 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_pmccext_test.c   =
                 |  59 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_pmcjce_test.c    =
                 |  58 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_comb_test.c      =
                 |  66 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_fcs_fch_test.c   =
                 |  85 ++++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_l2l3_test.c      =
                 |  74 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr3_src_test.c       =
                 |  67 +++
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sam=
ple_test.c       |  80 ++++
 tools/testing/selftests/powerpc/security/spectre_v2.c                     =
                 |   2 -
 252 files changed, 4893 insertions(+), 2196 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-papr-energy-sc=
ale-info
 create mode 100644 arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts
 delete mode 100644 arch/powerpc/kernel/trace/ftrace_32.S
 rename arch/powerpc/kernel/trace/{ftrace_64.S =3D> ftrace_low.S} (85%)
 rename arch/powerpc/kernel/trace/{ftrace_64_mprofile.S =3D> ftrace_mprofil=
e.S} (62%)
 rename arch/powerpc/kernel/{vdso64 =3D> vdso}/.gitignore (72%)
 create mode 100644 arch/powerpc/kernel/vdso/Makefile
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/cacheflush.S (95%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/datapage.S (91%)
 rename arch/powerpc/kernel/{vdso32/gen_vdso_offsets.sh =3D> vdso/gen_vdso3=
2_offsets.sh} (100%)
 rename arch/powerpc/kernel/{vdso64/gen_vdso_offsets.sh =3D> vdso/gen_vdso6=
4_offsets.sh} (100%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/getcpu.S (95%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/gettimeofday.S (60%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/note.S (100%)
 rename arch/powerpc/kernel/{vdso32/sigtramp.S =3D> vdso/sigtramp32.S} (100=
%)
 rename arch/powerpc/kernel/{vdso64/sigtramp.S =3D> vdso/sigtramp64.S} (100=
%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/vdso32.lds.S (100%)
 rename arch/powerpc/kernel/{vdso64 =3D> vdso}/vdso64.lds.S (100%)
 rename arch/powerpc/kernel/{vdso32 =3D> vdso}/vgettimeofday.c (70%)
 delete mode 100644 arch/powerpc/kernel/vdso32/Makefile
 delete mode 100644 arch/powerpc/kernel/vdso64/Makefile
 delete mode 100644 arch/powerpc/kernel/vdso64/cacheflush.S
 delete mode 100644 arch/powerpc/kernel/vdso64/datapage.S
 delete mode 100644 arch/powerpc/kernel/vdso64/getcpu.S
 delete mode 100644 arch/powerpc/kernel/vdso64/gettimeofday.S
 delete mode 100644 arch/powerpc/kernel/vdso64/note.S
 delete mode 100644 arch/powerpc/kernel/vdso64/vgettimeofday.c
 delete mode 100644 arch/powerpc/net/bpf_jit64.h
 create mode 100644 arch/powerpc/platforms/pseries/papr_platform_attributes=
.c
 create mode 100644 arch/powerpc/platforms/pseries/vas-sysfs.c
 create mode 120000 tools/testing/selftests/powerpc/copyloops/mem_64.S
 create mode 100644 tools/testing/selftests/powerpc/copyloops/memcpy_stubs.S
 create mode 100644 tools/testing/selftests/powerpc/copyloops/memmove_valid=
ate.c
 create mode 100644 tools/testing/selftests/powerpc/mce/Makefile
 create mode 100644 tools/testing/selftests/powerpc/mce/inject-ra-err.c
 create mode 120000 tools/testing/selftests/powerpc/mce/vas-api.h
 rename {arch/powerpc/kernel/vdso32 =3D> tools/testing/selftests/powerpc/pa=
pr_attributes}/.gitignore (61%)
 create mode 100644 tools/testing/selftests/powerpc/papr_attributes/Makefile
 create mode 100644 tools/testing/selftests/powerpc/papr_attributes/attr_te=
st.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/.git=
ignore
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/Make=
file
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/misc=
.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/misc=
.h
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
0_cc56run_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
0_exceptionbits_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
0_fc56_pmc1ce_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
0_fc56_pmc56_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
0_pmccext_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
0_pmcjce_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
1_comb_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
2_fcs_fch_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
2_l2l3_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
3_src_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr=
a_thresh_marked_sample_test.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmI9jPgACgkQUevqPMjh
pYCQ0hAAhsP7DmXTFjAc9f9K8ncHfA1WE0uKpYqLl7qncYIFSDaMw/MVJbEzQV/F
aNYRLCFgXtb9yFN2Hh5hBVZDrEULyjvtgwwItl5ajycvpi0mKU+l39y0fT9G4QSI
Jw9BuvhGBuHYraQmy3F6VKkQYzeafI7KxV86SsO9SYfRr0ES3NKl0NUYvb45gW6P
eVW1BqLSRFUndXtJnGXXnBPN36b7hxpgGko3ZG9N03jJ+BrpF2KrEGQVUEQ164r5
kSWIac3OFWEQQ+aOw7K0ZV6qn+ifAs2/JQCWtlVd27C3RpAKQSLoh9HFJ/PL8BSQ
kGr6kE5zXEl/r+u9LOPLEdmukK3EuzqNW6WvrtxPbyecrinnlVI3YqvvRtyW01jj
3P+GuYa2Ea38bAks+oynPrzEtlr0sI9tUDEYkYiE1HL+LJN5M73ZG+9JlctA/vMA
+QZRnc1aYKhSgFAepEonEsBH3SH4ZbTTtjJKMbzEGgnr3panO5HXOT1kQC/gP0zJ
G5aPwTBVVbQqAQIklMOqOwODaTFqbJfTCj0TJMrKX0h6qezxchAx9uAUAU3dVbac
+E+S+oQIZNrFIAVimNnX83inysN6zqF8RmccIuFXdwJQjZ54mVZjvcG8cS3SxwVR
j2OtDWjBRH61Bkar6aCZXFDhlVQJ4Wn6RPpvdtJbEsXAPWJz8Cg=3D
=3D8Kkh
-----END PGP SIGNATURE-----
