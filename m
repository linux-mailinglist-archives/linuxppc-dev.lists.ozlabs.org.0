Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DD123EED4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 16:13:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNS5N4xT9zDqsL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 00:13:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNQmH6mLhzDqtG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 23:13:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GW1Cw6pr; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BNQm82yprz9sTR;
 Fri,  7 Aug 2020 23:13:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596806030;
 bh=9xbtCzFJk3fuvlD98ziBNR0rJJmdqLTGOyc4ujP9G54=;
 h=From:To:Cc:Subject:Date:From;
 b=GW1Cw6pryPpkqtVmEcQjB7+fT+9mjNJGr+e/9nXXS2MH3d5USHTFghNjVmd5MLczs
 hp4T35dYS3i1rWI10qEfQT+D0YNDVVMIXZxA3E7MOm9Z2oxd7Xor7MLER/iijFojvb
 ORQQSOvvsiJiKfwPTsV+ACRrmcO2jdAQB/bmfRUgX0Z9w4i15c0WlVwaaEflapjVNL
 LFJXkk1vzt6R8/O+TsvGVNtKr1J4hvLms2IeZQg0n+9klpJj1MLfycPUTbPJdmT+XM
 Drcw/z1d3eD1EvfZjEH38bmBaqGE/GGzDQp++DQvG499X1o48pXnAKi4ZXQXmtWWru
 +lr7rd5Y0vZ6A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.9-1 tag
Date: Fri, 07 Aug 2020 23:13:37 +1000
Message-ID: <87h7tey4xq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 08 Aug 2020 00:07:54 +1000
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
Cc: cascardo@canonical.com, desnesn@linux.ibm.com, srikar@linux.vnet.ibm.com,
 ego@linux.vnet.ibm.com, aik@ozlabs.ru, jniethe5@gmail.com,
 bin.meng@windriver.com, psampat@linux.ibm.com, bala24@linux.ibm.com,
 msuchanek@suse.de, sathnaga@linux.vnet.ibm.com, oohall@gmail.com,
 fthain@telegraphics.com.au, hch@lst.de, linux-kernel@vger.kernel.org,
 equinox@diac24.net, leobras.c@gmail.com, santosh@fossix.org,
 maddy@linux.ibm.com, aneesh.kumar@linux.ibm.com, nayna@linux.ibm.com,
 yuehaibing@huawei.com, mahesh@linux.ibm.com, peterz@infradead.org,
 anju@linux.vnet.ibm.com, geert@linux-m68k.org, weiyongjun1@huawei.com,
 alastair@d-silva.org, harish@linux.ibm.com, longman@redhat.com,
 naveen.n.rao@linux.vnet.ibm.com, dyoung@redhat.com, vdronov@redhat.com,
 nathanl@linux.ibm.com, miltonm@us.ibm.com, palmerdabbelt@google.com,
 ajd@linux.ibm.com, arnd@arndb.de, lirongqing@baidu.com, sandipan@linux.ibm.com,
 kjain@linux.ibm.com, muriloo@linux.ibm.com, npiggin@gmail.com,
 natechancellor@gmail.com, joe@perches.com, chris.packham@alliedtelesis.co.nz,
 vaibhav@linux.ibm.com, felix@linux.ibm.com, hbathini@linux.ibm.com,
 christophe.leroy@c-s.fr, atrajeev@linux.vnet.ibm.com,
 wenxiong@linux.vnet.ibm.com, sbobroff@linux.ibm.com, rdunlap@infradead.org,
 gustavoars@kernel.org, sourabhjain@linux.ibm.com, bharata@linux.ibm.com,
 tj@kernel.org, miaoqinglang@huawei.com, jk@ozlabs.org,
 grandmaster@al2klimov.de, fbarrat@linux.ibm.com, huntbag@linux.vnet.ibm.com,
 kaloz@openwrt.org, linuxppc-dev@lists.ozlabs.org, ravi.bangoria@linux.ibm.com,
 morbo@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.9.

Just one minor conflict, in a comment in drivers/misc/ocxl/config.c.

Notable out of area changes:
  arch/m68k/include/asm/adb_iop.h	# c66da95a39ec macintosh/adb-iop: Impleme=
nt SRQ autopolling
  drivers/md/dm-writecache.c		# 3e79f082ebfc libnvdimm/nvdimm/flush: Allow =
architecture to override the flush barrier
  drivers/nvdimm/region_devs.c
  include/asm-generic/barrier.h
  drivers/nvdimm/of_pmem.c		# 8c26ab72663b powerpc/pmem: Initialize pmem de=
vice on newer hardware
  include/asm-generic/qspinlock.h	# 20c0e8269e9d powerpc/pseries: Implement=
 paravirt qspinlocks for SPLPAR
  include/linux/cpuhotplug.h		# 1a8f0886a600 powerpc/perf/hv-24x7: Add cpu =
hotplug support
  include/linux/kexec.h			# f891f19736bd kexec_file: Allow archs to handle =
special regions while locating memory hole
  kernel/kexec_file.c
  include/trace/events/mmflags.h	# 5c9fa16e8abd powerpc/64s: Remove PROT_SA=
O support
  include/linux/mm.h
  mm/ksm.c

cheers


The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.9-1

for you to fetch changes up to a7aaa2f26bfd932a654706b19859e7adf802bee2:

  selftests/powerpc: Fix pkey syscall redefinitions (2020-08-05 10:14:03 +1=
000)


- ------------------------------------------------------------------
powerpc updates for 5.9

 - Add support for (optionally) using queued spinlocks & rwlocks.

 - Support for a new faster system call ABI using the scv instruction on Po=
wer9
   or later.

 - Drop support for the PROT_SAO mmap/mprotect flag as it will be unsupport=
ed on
   Power10 and future processors, leaving us with no way to implement the
   functionality it requests. This risks breaking userspace, though we beli=
eve
   it is unused in practice.

 - A bug fix for, and then the removal of, our custom stack expansion check=
ing.
   We now allow stack expansion up to the rlimit, like other architectures.

 - Remove the remnants of our (previously disabled) topology update code, w=
hich
   tried to react to NUMA layout changes on virtualised systems, but was pr=
one
   to crashes and other problems.

 - Add PMU support for Power10 CPUs.

 - A change to our signal trampoline so that we don't unbalance the link st=
ack
   (branch return predictor) in the signal delivery path.

 - Lots of other cleanups, refactorings, smaller features and so on as usua=
l.

Thanks to:
  Abhishek Goel, Alastair D'Silva, Alexander A. Klimov, Alexey Kardashevski=
y,
  Alistair Popple, Andrew Donnellan, Aneesh Kumar K.V, Anju T Sudhakar, Ant=
on
  Blanchard, Arnd Bergmann, Athira Rajeev, Balamuruhan S, Bharata B Rao, Bi=
ll
  Wendling, Bin Meng, C=C3=A9dric Le Goater, Chris Packham, Christophe Lero=
y,
  Christoph Hellwig, Daniel Axtens, Dan Williams, David Lamparter, Desnes A.
  Nunes do Rosario, Erhard F., Finn Thain, Frederic Barrat, Ganesh Goudar,
  Gautham R. Shenoy, Geoff Levand, Greg Kurz, Gustavo A. R. Silva, Hari Bat=
hini,
  Harish, Imre Kaloz, Joel Stanley, Joe Perches, John Crispin, Jordan Nieth=
e,
  Kajol Jain, Kamalesh Babulal, Kees Cook, Laurent Dufour, Leonardo Bras, Li
  RongQing, Madhavan Srinivasan, Mahesh Salgaonkar, Mark Cave-Ayland, Michal
  Suchanek, Milton Miller, Mimi Zohar, Murilo Opsfelder Araujo, Nathan
  Chancellor, Nathan Lynch, Naveen N. Rao, Nayna Jain, Nicholas Piggin, Oli=
ver
  O'Halloran, Palmer Dabbelt, Pedro Miraglia Franco de Carvalho, Philippe
  Bergheaud, Pingfan Liu, Pratik Rajesh Sampat, Qian Cai, Qinglang Miao, Ra=
ndy
  Dunlap, Ravi Bangoria, Sachin Sant, Sam Bobroff, Sandipan Das, Santosh
  Sivaraj, Satheesh Rajendran, Shirisha Ganta, Sourabh Jain, Srikar Dronamr=
aju,
  Stan Johnson, Stephen Rothwell, Thadeu Lima de Souza Cascardo, Thiago Jung
  Bauermann, Tom Lane, Vaibhav Jain, Vladis Dronov, Wei Yongjun, Wen Xiong,
  YueHaibing.

- ------------------------------------------------------------------
Abhishek Goel (1):
      cpuidle/powernv : Remove dead code block

Alastair D'Silva (2):
      ocxl: Remove unnecessary externs
      ocxl: Address kernel doc errors & warnings

Alexander A. Klimov (5):
      ocxl: Replace HTTP links with HTTPS ones
      powerpc/Kconfig: Replace HTTP links with HTTPS ones
      powerpc: Replace HTTP links with HTTPS ones
      macintosh/adb: Replace HTTP links with HTTPS ones
      macintosh/therm_adt746x: Replace HTTP links with HTTPS ones

Alexey Kardashevskiy (2):
      powerpc/xive: Ignore kmemleak false positives
      powerpc/powernv/ioda: Return correct error if TCE level allocation fa=
iled

Aneesh Kumar K.V (37):
      powerpc/mm/book3s64: Skip 16G page reservation with radix
      powerpc/pmem: Restrict papr_scm to P8 and above.
      powerpc/pmem: Add new instructions for persistent storage and sync
      powerpc/pmem: Add flush routines using new pmem store and sync instru=
ction
      libnvdimm/nvdimm/flush: Allow architecture to override the flush barr=
ier
      powerpc/pmem: Update ppc64 to use the new barrier instruction.
      powerpc/pmem: Avoid the barrier in flush routines
      powerpc/pmem: Initialize pmem device on newer hardware
      powerpc/mm/radix: Fix PTE/PMD fragment count for early page table map=
pings
      powerpc/mm/radix: Create separate mappings for hot-plugged memory
      powerpc/book3s64/pkeys: Use PVR check instead of cpu feature
      powerpc/book3s64/pkeys: Fixup bit numbering
      powerpc/book3s64/pkeys: pkeys are supported only on hash on book3s.
      powerpc/book3s64/pkeys: Move pkey related bits in the linux page table
      powerpc/book3s64/pkeys: Explain key 1 reservation details
      powerpc/book3s64/pkeys: Simplify the key initialization
      powerpc/book3s64/pkeys: Prevent key 1 modification from userspace.
      powerpc/book3s64/pkeys: kill cpu feature key CPU_FTR_PKEY
      powerpc/book3s64/pkeys: Simplify pkey disable branch
      powerpc/book3s64/pkeys: Convert pkey_total to num_pkey
      powerpc/book3s64/pkeys: Make initial_allocation_mask static
      powerpc/book3s64/pkeys: Mark all the pkeys above max pkey as reserved
      powerpc/book3s64/pkeys: Add MMU_FTR_PKEY
      powerpc/book3s64/kuep: Add MMU_FTR_KUEP
      powerpc/book3s64/pkeys: Use pkey_execute_disable_supported
      powerpc/book3s64/pkeys: Use MMU_FTR_PKEY instead of pkey_disabled sta=
tic key
      powerpc/book3s64/keys: Print information during boot.
      powerpc/book3s64/keys/kuap: Reset AMR/IAMR values on kexec
      powerpc/book3s64/kuap: Move UAMOR setup to key init function
      selftests/powerpc: ptrace-pkey: Rename variables to make it easier to=
 follow code
      selftests/powerpc: ptrace-pkey: Update the test to mark an invalid pk=
ey correctly
      selftests/powerpc: ptrace-pkey: Don't update expected UAMOR value
      powerpc/book3s64/pkeys: Remove is_pkey_enabled()
      powerpc/book3s64/pkey: Disable pkey on POWER6 and before
      powerpc/hugetlb/cma: Allocate gigantic hugetlb pages using CMA
      powerpc/kvm/cma: Improve kernel log during boot
      powerpc/book3s64/radix: Add kernel command line option to disable rad=
ix GTSE

Anju T Sudhakar (1):
      powerpc/perf: Add kernel support for new MSR[HV PR] bits in trace-imc

Anton Blanchard (4):
      powerpc/xmon: Reset RCU and soft lockup watchdogs
      powerpc: Add cputime_to_nsecs()
      pseries: Fix 64 bit logical memory block panic
      powerpc/configs: Add BLK_DEV_NVME to pseries_defconfig

Arnd Bergmann (1):
      powerpc/spufs: add CONFIG_COREDUMP dependency

Athira Rajeev (10):
      powerpc/perf: Update cpu_hw_event to use `struct` for storing MMCR re=
gisters
      KVM: PPC: Book3S HV: Cleanup updates for kvm vcpu MMCR
      powerpc/perf: Update Power PMU cache_events to u64 type
      KVM: PPC: Book3S HV: Save/restore new PMU registers
      powerpc/perf: power10 Performance Monitoring support
      powerpc/perf: Ignore the BHRB kernel address filtering for P10
      powerpc/perf: Add Power10 BHRB filter support for PERF_SAMPLE_BRANCH_=
IND_CALL/COND
      powerpc/perf: BHRB control to disable BHRB logic when not used
      powerpc/perf: Initialize power10 PMU registers in cpu setup routine
      powerpc/perf: Fix MMCRA_BHRB_DISABLE define for binutils < 2.28

Balamuruhan S (14):
      powerpc/ppc-opcode: Introduce PPC_RAW_* macros for base instruction e=
ncoding
      powerpc/ppc-opcode: Move ppc instruction encoding from test_emulate_s=
tep
      powerpc/bpf_jit: Reuse instruction macros from ppc-opcode.h
      powerpc/ppc-opcode: Consolidate powerpc instructions from bpf_jit.h
      powerpc/ppc-opcode: Reuse raw instruction macros to stringify
      powerpc/ppc-opcode: Fold PPC_INST_* macros into PPC_RAW_* macros
      powerpc/test_emulate_step: Enhancement to test negative scenarios
      powerpc/test_emulate_step: Add negative tests for prefixed addi
      powerpc/sstep: Introduce macros to retrieve Prefix instruction operan=
ds
      powerpc/test_emulate_step: Move extern declaration to sstep.h
      powerpc/xmon: Use `dcbf` inplace of `dcbi` instruction for 64bit Book=
3S
      powerpc/ppc-opcode: Add divde and divdeu opcodes
      powerpc/sstep: Add support for divde[.] and divdeu[.] instructions
      powerpc/test_emulate_step: Add testcases for divde[.] and divdeu[.] i=
nstructions

Bharata B Rao (5):
      powerpc/mm: Enable radix GTSE only if supported.
      powerpc/pseries: H_REGISTER_PROC_TBL should ask for GTSE only if enab=
led
      powerpc/mm/radix: Free PUD table when freeing pagetable
      powerpc/mm/radix: Remove split_kernel_mapping()
      powerpc/mm: Limit resize_hpt_for_hotplug() call to hash guests only

Bill Wendling (1):
      powerpc/64s: allow for clang's objdump differences

Bin Meng (1):
      powerpc: Drop CONFIG_MTD_M25P80 in 85xx-hw.config

Chris Packham (2):
      powerpc: Remove inaccessible CMDLINE default
      powerpc/configs: Remove CMDLINE_BOOL

Christoph Hellwig (1):
      powerpc/spufs: Fix the type of ret in spufs_arch_write_note

Christophe Leroy (18):
      powerpc/ptdump: Fix build failure in hashpagetable.c
      powerpc/fixmap: Fix FIX_EARLY_DEBUG_BASE when page size is 256k
      powerpc/8xx: Modify ptep_get()
      docs: powerpc: Clarify book3s/32 MMU families
      Revert "powerpc/kasan: Fix shadow pages allocation failure"
      powerpc/kasan: Fix shadow pages allocation failure
      powerpc/signal_32: Remove !FULL_REGS() special handling in PPC64 save=
_general_regs()
      powerpc/signal_32: Simplify loop in PPC64 save_general_regs()
      powerpc/signal64: Don't opencode page prefaulting
      powerpc/vdso64: Switch from __get_datapage() to get_datapage inline m=
acro
      powerpc/lib: Prepare code-patching for modules allocated outside vmal=
loc space
      powerpc: Use MODULES_VADDR if defined
      powerpc/32s: Only leave NX unset on segments used for modules
      powerpc/32: Set user/kernel boundary at TASK_SIZE instead of PAGE_OFF=
SET
      powerpc/32s: Kernel space starts at TASK_SIZE
      powerpc/32s: Use dedicated segment for modules with STRICT_KERNEL_RWX
      powerpc/ptdump: Refactor update of st->last_pa
      powerpc/ptdump: Refactor update of pg_state

David Lamparter (1):
      powerpc/fsl/dts: add missing P4080DS I2C devices

Desnes A. Nunes do Rosario (1):
      selftests/powerpc: Purge extra count_pmc() calls of ebb selftests

Finn Thain (17):
      macintosh/adb-iop: Remove dead and redundant code
      macintosh/adb-iop: Correct comment text
      macintosh/adb-iop: Adopt bus reset algorithm from via-macii driver
      macintosh/adb-iop: Access current_req and adb_iop_state when inside l=
ock
      macintosh/adb-iop: Resolve static checker warnings
      macintosh/adb-iop: Implement idle -> sending state transition
      macintosh/adb-iop: Implement sending -> idle state transition
      macintosh/adb-iop: Implement SRQ autopolling
      macintosh/via-macii: Access autopoll_devs when inside lock
      macintosh/via-macii: Poll the device most likely to respond
      macintosh/via-macii: Handle /CTLR_IRQ signal correctly
      macintosh/via-macii: Remove read_done state
      macintosh/via-macii: Handle poll replies correctly
      macintosh/via-macii: Use bool type for reading_reply variable
      macintosh/via-macii: Use unsigned type for autopoll_devs variable
      macintosh/via-macii: Use the stack for reset request storage
      macintosh/via-macii: Clarify definition of macii_init()

Gautham R. Shenoy (3):
      cpuidle: pseries: Set the latency-hint before entering CEDE
      cpuidle: pseries: Add function to parse extended CEDE records
      cpuidle: pseries: Fixup exit latency for CEDE(0)

Gustavo A. R. Silva (1):
      powerpc: Use fallthrough pseudo-keyword

Hari Bathini (11):
      kexec_file: Allow archs to handle special regions while locating memo=
ry hole
      powerpc/kexec_file: Mark PPC64 specific code
      powerpc/kexec_file: Add helper functions for getting memory ranges
      powerpc/kexec_file: Avoid stomping memory used by special regions
      powerpc/drmem: Make LMB walk a bit more flexible
      powerpc/kexec_file: Restrict memory usage of kdump kernel
      powerpc/kexec_file: Setup backup region for kdump kernel
      powerpc/kexec_file: Prepare elfcore header for crashing kernel
      powerpc/kexec_file: Add appropriate regions for memory reserve map
      powerpc/kexec_file: Fix kexec load failure with lack of memory hole
      powerpc/kexec_file: Enable early kernel OPAL calls

Harish (1):
      selftests/powerpc: Fix CPU affinity for child process

Imre Kaloz (1):
      powerpc/4xx: ppc4xx compile flag optimizations

Joe Perches (1):
      powerpc/mm: Fix typo in IS_ENABLED()

Jordan Niethe (9):
      selftests/powerpc: Allow choice of CI memory location in alignment_ha=
ndler test
      selftests/powerpc: Add prefixed loads/stores to alignment_handler test
      powerpc/sstep: Add tests for prefixed integer load/stores
      powerpc/sstep: Add tests for prefixed floating-point load/stores
      powerpc/sstep: Set NIP in instruction emulation tests
      powerpc/sstep: Let compute tests specify a required cpu feature
      powerpc/sstep: Add tests for Prefixed Add Immediate
      powerpc: Add a ppc_inst_as_str() helper
      powerpc/xmon: Improve dumping prefixed instructions

Kajol Jain (2):
      powerpc/perf/hv-24x7: Add cpu hotplug support
      powerpc/hv-24x7: Add sysfs files inside hv-24x7 device to show cpumask

Leonardo Bras (1):
      KVM: PPC: Fix typo on H_DISABLE_AND_GET hcall

Li RongQing (1):
      powerpc/lib: remove memcpy_flushcache redundant return

Madhavan Srinivasan (4):
      powerpc/perf: Fix missing is_sier_aviable() during build
      powerpc/perf: Add support for ISA3.1 PMU SPRs
      powerpc/xmon: Add PowerISA v3.1 PMU SPRs
      powerpc/perf: Add Power10 PMU feature to DT CPU features

Mahesh Salgaonkar (1):
      powerpc/64s: Move HMI IRQ stat from percpu variable to paca.

Michael Ellerman (26):
      powerpc/boot/dts: Fix dtc "pciex" warnings
      Merge branch 'fixes' into next
      selftests/powerpc: Run per_event_excludes test on Power8 or later
      powerpc/spufs: Rework fcheck() usage
      selftests/powerpc: Add test of memcmp at end of page
      Merge branch 'scv' support into next
      powerpc/test_emulate_sstep: Fix build error
      powerpc/sstep: Fix incorrect CONFIG symbol in scv handling
      powerpc/fadump: Fix build error with CONFIG_PRESERVE_FA_DUMP=3Dy
      selftests/powerpc: Add test of stack expansion logic
      powerpc: Allow 4224 bytes of stack expansion for the signal frame
      selftests/powerpc: Update the stack expansion test
      powerpc/mm: Remove custom stack expansion checking
      selftests/powerpc: Remove powerpc special cases from stack expansion =
test
      powerpc/configs: Drop old symbols from ppc6xx_defconfig
      powerpc/configs: Remove dead symbols
      powerpc/52xx: Fix comment about CONFIG_BDI*
      powerpc/64e: Drop dead BOOK3E_MMU_TLB_STATS code
      powerpc/32s: Fix CONFIG_BOOK3S_601 uses
      powerpc/32s: Remove TAUException wart in traps.c
      powerpc/boot: Fix CONFIG_PPC_MPC52XX references
      powerpc/kvm: Use correct CONFIG symbol in comment
      powerpc: Drop old comment about CONFIG_POWER
      powerpc/40x: Fix assembler warning about r0
      selftests/powerpc: Skip vmx/vsx/tar/etc tests on older CPUs
      powerpc: Fix circular dependency between percpu.h and mmu.h

Michal Suchanek (1):
      powerpc/perf: Consolidate perf_callchain_user_[64|32]()

Milton Miller (1):
      powerpc/vdso: Fix vdso cpu truncation

Murilo Opsfelder Araujo (3):
      powerpc/dt_cpu_ftrs: Remove unused macro ISA_V2_07B
      powerpc/dt_cpu_ftrs: Make use of macro ISA_V3_0B
      powerpc/dt_cpu_ftrs: Make use of macro ISA_V3_1

Nathan Chancellor (1):
      powerpc/boot: Use address-of operator on section symbols

Nathan Lynch (25):
      powerpc/pseries: remove cede offline state for CPUs
      powerpc/rtas: don't online CPUs for partition suspend
      powerpc/numa: remove ability to enable topology updates
      powerpc/numa: remove unreachable topology update code
      powerpc/numa: make vphn_enabled, prrn_enabled flags const
      powerpc/numa: remove unreachable topology timer code
      powerpc/numa: remove unreachable topology workqueue code
      powerpc/numa: remove vphn_enabled and prrn_enabled internal flags
      powerpc/numa: stub out numa_update_cpu_topology()
      powerpc/numa: remove timed_topology_update()
      powerpc/numa: remove start/stop_topology_update()
      powerpc/rtasd: simplify handle_rtas_event(), emit message on events
      powerpc/numa: remove prrn_is_enabled()
      powerpc/numa: remove arch_update_cpu_topology
      powerpc/pseries: remove prrn special case from DT update path
      powerpc/pseries: remove memory "re-add" implementation
      powerpc/pseries: remove dlpar_cpu_readd()
      powerpc/pseries: remove obsolete memory hotplug DT notifier code
      powerpc/cacheinfo: Set pr_fmt()
      powerpc/cacheinfo: Use name@unit instead of full DT path in debug mes=
sages
      powerpc/cacheinfo: Improve diagnostics about malformed cache lists
      powerpc/cacheinfo: Warn if cache object chain becomes unordered
      powerpc/pseries/mobility: Set pr_fmt()
      powerpc/pseries/mobility: Add pr_debug() for device tree changes
      powerpc/pseries/hotplug-cpu: Remove double free in error path

Nayna Jain (1):
      powerpc/pseries: Detect secure and trusted boot state of the system.

Nicholas Piggin (31):
      powerpc/64: indirect function call use bctrl rather than blrl in ret_=
from_kernel_thread
      powerpc/64/signal: Balance return predictor stack in signal trampoline
      selftests/powerpc: Add FPU denormal test
      powerpc/mm/book3s64/radix: Off-load TLB invalidations to host when !G=
TSE
      powerpc/64s: restore_math remove TM test
      powerpc/64s: Fix restore_math unnecessarily changing MSR
      powerpc: re-initialise lazy FPU/VEC counters on every fault
      powerpc/security: re-name count cache flush to branch cache flush
      powerpc/security: change link stack flush state to the flush type enum
      powerpc/security: make display of branch cache flush more consistent
      powerpc/security: split branch cache flush toggle from code patching
      powerpc/64s: Move branch cache flushing bcctr variant to ppc-ops.h
      powerpc/security: Allow for processors that flush the link stack usin=
g the special bcctr
      powerpc/prom: Enable Radix GTSE in cpu pa-features
      powerpc: Remove stale calc_vm_prot_bits() comment
      powerpc/64s: Remove PROT_SAO support
      powerpc/64s/hash: Disable subpage_prot syscall by default
      powerpc/64s/exception: treat NIA below __end_interrupts as soft-masked
      powerpc/64s: system call support for scv/rfscv instructions
      powerpc: Select ARCH_HAS_MEMBARRIER_SYNC_CORE
      powerpc/powernv: Machine check handler for POWER10
      powerpc/pseries: Move some PAPR paravirt functions to their own file
      powerpc: Move spinlock implementation to simple_spinlock
      powerpc/64s: Implement queued spinlocks and rwlocks
      powerpc/pseries: Implement paravirt qspinlocks for SPLPAR
      powerpc/qspinlock: Optimised atomic_try_cmpxchg_lock() that adds the =
lock hint
      powerpc: Implement smp_cond_load_relaxed()
      powerpc: Inline doorbell sending functions
      powerpc/pseries: Use doorbells even if XIVE is available
      powerpc/pseries: Add KVM guest doorbell restrictions
      powerpc/build: vdso linker warning for orphan sections

Oliver O'Halloran (34):
      powerpc/powernv: Make pnv_pci_sriov_enable() and friends static
      powerpc/powernv: Move pnv_ioda_setup_bus_dma under CONFIG_IOMMU_API
      powerpc/eeh: Remove eeh_dev_phb_init_dynamic()
      powerpc/eeh: Remove eeh_dev.c
      powerpc/eeh: Move vf_index out of pci_dn and into eeh_dev
      powerpc/pseries: Stop using pdn->pe_number
      powerpc/eeh: Kill off eeh_ops->get_pe_addr()
      powerpc/eeh: Remove VF config space restoration
      powerpc/eeh: Pass eeh_dev to eeh_ops->restore_config()
      powerpc/eeh: Pass eeh_dev to eeh_ops->resume_notify()
      powerpc/eeh: Pass eeh_dev to eeh_ops->{read|write}_config()
      powerpc/eeh: Remove spurious use of pci_dn in eeh_dump_dev_log
      powerpc/eeh: Remove class code field from edev
      powerpc/eeh: Rename eeh_{add_to|remove_from}_parent_pe()
      powerpc/eeh: Drop pdn use in eeh_pe_tree_insert()
      powerpc/eeh: Move PE tree setup into the platform
      powerpc/powernv/pci: Add pci_bus_to_pnvhb() helper
      powerpc/powernv/pci: Always tear down DMA windows on PE release
      powerpc/powernv/pci: Add explicit tracking of the DMA setup state
      powerpc/powernv/pci: Initialise M64 for IODA1 as a 1-1 window
      powerpc/powernv/sriov: Move SR-IOV into a separate file
      powerpc/powernv/sriov: Explain how SR-IOV works on PowerNV
      powerpc/powernv/sriov: Rename truncate_iov
      powerpc/powernv/sriov: Simplify used window tracking
      powerpc/powernv/sriov: Factor out M64 BAR setup
      powerpc/powernv/pci: Refactor pnv_ioda_alloc_pe()
      powerpc/powernv/sriov: Drop iov->pe_num_map[]
      powerpc/powernv/sriov: De-indent setup and teardown
      powerpc/powernv/sriov: Move M64 BAR allocation into a helper
      powerpc/powernv/sriov: Refactor M64 BAR setup
      powerpc/powernv/sriov: Make single PE mode a per-BAR setting
      powerpc/powernv/sriov: Remove vfs_expanded
      selftests/powerpc: Squash spurious errors due to device removal
      powerpc/powernv/sriov: Fix use of uninitialised variable

Palmer Dabbelt (1):
      powerpc/64: Fix an out of date comment about MMIO ordering

Philippe Bergheaud (1):
      ocxl: control via sysfs whether the FPGA is reloaded on a link reset

Pratik Rajesh Sampat (3):
      powerpc/powernv/idle: Replace CPU feature check with PVR check
      powerpc/powernv/idle: Rename pnv_first_spr_loss_level variable
      powerpc/powernv/idle: Exclude mfspr on HID1, 4, 5 on P9 and above

Qinglang Miao (1):
      powerpc: use for_each_child_of_node() macro

Randy Dunlap (9):
      powerpc/book3s/mmu-hash.h: delete duplicated word
      powerpc/book3s/radix-4k.h: delete duplicated word
      powerpc/cputime.h: delete duplicated word
      powerpc/epapr_hcalls.h: delete duplicated words
      powerpc/hw_breakpoint.h: delete duplicated word
      powerpc/ppc_asm.h: delete duplicated word
      powerpc/reg.h: delete duplicated word
      powerpc/smu.h: delete duplicated word
      powerpc/powernv/pci.h: delete duplicated word

Ravi Bangoria (10):
      powerpc/watchpoint: Fix 512 byte boundary limit
      powerpc/watchpoint: Fix DAWR exception constraint
      powerpc/watchpoint: Fix DAWR exception for CACHEOP
      powerpc/watchpoint: Enable watchpoint functionality on power10 guest
      powerpc/dt_cpu_ftrs: Add feature for 2nd DAWR
      powerpc/watchpoint: Set CPU_FTR_DAWR1 based on pa-features bit
      powerpc/watchpoint: Rename current H_SET_MODE DAWR macro
      powerpc/watchpoint: Guest support for 2nd DAWR hcall
      powerpc/watchpoint: Return available watchpoints dynamically
      powerpc/watchpoint: Remove 512 byte boundary

Sam Bobroff (1):
      MAINTAINERS: Remove self from powerpc EEH

Sandipan Das (11):
      selftests/powerpc: Fix pkey access right updates
      selftests/powerpc: Move Hash MMU check to utilities
      selftests/powerpc: Add test for execute-disabled pkeys
      selftests/powerpc: Move pkey helpers to headers
      selftests/powerpc: Add pkey helpers for rights
      selftests/powerpc: Harden test for execute-disabled pkeys
      selftests/powerpc: Add helper to exit on failure
      selftests/powerpc: Add wrapper for gettid
      selftests/powerpc: Add test for pkey siginfo verification
      selftests/powerpc: Fix online CPU selection
      selftests/powerpc: Fix pkey syscall redefinitions

Santosh Sivaraj (3):
      powerpc/mce: Add MCE notification chain
      powerpc/papr/scm: Add bad memory ranges to nvdimm bad ranges
      powerpc/mm/hash64: Remove comment that is no longer valid

Satheesh Rajendran (1):
      powerpc/pseries/svm: Drop unused align argument in alloc_shared_lppac=
a() function

Sourabh Jain (1):
      powerpc/fadump: fix race between pstore write and fadump crash trigger

Srikar Dronamraju (4):
      powerpc/cacheinfo: Use cpumap_print to print cpumap
      powerpc/cacheinfo: Make cpumap_show code reusable
      powerpc/cacheinfo: Add per cpu per index shared_cpu_list
      powerpc/numa: Limit possible nodes to within num_possible_nodes

Thadeu Lima de Souza Cascardo (1):
      selftests/powerpc: Return skip code for spectre_v2

Vaibhav Jain (2):
      powerpc/papr_scm: Fetch nvdimm performance stats from PHYP
      powerpc/papr_scm: Add support for fetching nvdimm 'fuel-gauge' metric

Vladis Dronov (1):
      powerpc: fix function annotations to avoid section mismatch warnings =
with gcc-10

Wei Yongjun (3):
      cpuidle/pseries: Make symbol 'pseries_idle_driver' static
      powerpc/papr_scm: Make some symbols static
      powerpc/powernv/sriov: Remove unused but set variable 'phb'

Wen Xiong (1):
      powerpc/pseries: PCIE PHB reset

YueHaibing (2):
      powerpc/xive: Remove unused inline function xive_kexec_teardown_cpu()
      powerpc: Remove unneeded inline functions


 Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7    |    7=
 +
 Documentation/ABI/testing/sysfs-bus-papr-pmem                       |   27=
 +
 Documentation/ABI/testing/sysfs-class-ocxl                          |   11=
 +
 Documentation/admin-guide/kernel-parameters.txt                     |    4=
 +
 Documentation/core-api/cpu_hotplug.rst                              |    7=
 -
 Documentation/features/sched/membarrier-sync-core/arch-support.txt  |    4=
 +-
 Documentation/memory-barriers.txt                                   |   14=
 +
 Documentation/powerpc/cpu_families.rst                              |   10=
 +-
 Documentation/powerpc/mpc52xx.rst                                   |    2=
 +-
 Documentation/powerpc/syscall64-abi.rst                             |   42=
 +-
 Documentation/virt/kvm/api.rst                                      |    3=
 +
 MAINTAINERS                                                         |    1=
 -
 arch/m68k/include/asm/adb_iop.h                                     |    1=
 +
 arch/powerpc/Kconfig                                                |   30=
 +-
 arch/powerpc/Makefile                                               |    3=
 +-
 arch/powerpc/boot/Makefile                                          |    8=
 +-
 arch/powerpc/boot/dts/akebono.dts                                   |    8=
 +-
 arch/powerpc/boot/dts/bluestone.dts                                 |    2=
 +-
 arch/powerpc/boot/dts/canyonlands.dts                               |    4=
 +-
 arch/powerpc/boot/dts/currituck.dts                                 |    6=
 +-
 arch/powerpc/boot/dts/fsl/p4080ds.dts                               |   43=
 +-
 arch/powerpc/boot/dts/glacier.dts                                   |    4=
 +-
 arch/powerpc/boot/dts/haleakala.dts                                 |    2=
 +-
 arch/powerpc/boot/dts/icon.dts                                      |    4=
 +-
 arch/powerpc/boot/dts/katmai.dts                                    |    6=
 +-
 arch/powerpc/boot/dts/kilauea.dts                                   |    4=
 +-
 arch/powerpc/boot/dts/makalu.dts                                    |    4=
 +-
 arch/powerpc/boot/dts/redwood.dts                                   |    6=
 +-
 arch/powerpc/boot/main.c                                            |    4=
 +-
 arch/powerpc/boot/ps3.c                                             |    2=
 +-
 arch/powerpc/boot/serial.c                                          |    2=
 +-
 arch/powerpc/configs/44x/akebono_defconfig                          |    3=
 -
 arch/powerpc/configs/44x/arches_defconfig                           |    2=
 -
 arch/powerpc/configs/44x/bamboo_defconfig                           |    2=
 -
 arch/powerpc/configs/44x/bluestone_defconfig                        |    2=
 -
 arch/powerpc/configs/44x/canyonlands_defconfig                      |    2=
 -
 arch/powerpc/configs/44x/currituck_defconfig                        |    2=
 -
 arch/powerpc/configs/44x/eiger_defconfig                            |    2=
 -
 arch/powerpc/configs/44x/fsp2_defconfig                             |    1=
 -
 arch/powerpc/configs/44x/icon_defconfig                             |    2=
 -
 arch/powerpc/configs/44x/iss476-smp_defconfig                       |    1=
 -
 arch/powerpc/configs/44x/katmai_defconfig                           |    2=
 -
 arch/powerpc/configs/44x/rainier_defconfig                          |    2=
 -
 arch/powerpc/configs/44x/redwood_defconfig                          |    2=
 -
 arch/powerpc/configs/44x/sam440ep_defconfig                         |    2=
 -
 arch/powerpc/configs/44x/sequoia_defconfig                          |    2=
 -
 arch/powerpc/configs/44x/taishan_defconfig                          |    2=
 -
 arch/powerpc/configs/44x/warp_defconfig                             |    1=
 -
 arch/powerpc/configs/85xx-hw.config                                 |    1=
 -
 arch/powerpc/configs/85xx/xes_mpc85xx_defconfig                     |    3=
 -
 arch/powerpc/configs/86xx-hw.config                                 |    2=
 -
 arch/powerpc/configs/fsl-emb-nonhw.config                           |    1=
 -
 arch/powerpc/configs/g5_defconfig                                   |    1=
 -
 arch/powerpc/configs/holly_defconfig                                |    1=
 -
 arch/powerpc/configs/linkstation_defconfig                          |    1=
 -
 arch/powerpc/configs/mpc512x_defconfig                              |    1=
 -
 arch/powerpc/configs/mpc83xx_defconfig                              |    1=
 -
 arch/powerpc/configs/mvme5100_defconfig                             |    4=
 +-
 arch/powerpc/configs/pasemi_defconfig                               |    1=
 -
 arch/powerpc/configs/pmac32_defconfig                               |    8=
 -
 arch/powerpc/configs/powernv_defconfig                              |    2=
 -
 arch/powerpc/configs/ppc40x_defconfig                               |    3=
 -
 arch/powerpc/configs/ppc64_defconfig                                |    1=
 -
 arch/powerpc/configs/ppc6xx_defconfig                               |   39=
 -
 arch/powerpc/configs/ps3_defconfig                                  |    2=
 -
 arch/powerpc/configs/pseries_defconfig                              |    3=
 +-
 arch/powerpc/configs/skiroot_defconfig                              |    1=
 -
 arch/powerpc/configs/storcenter_defconfig                           |    1=
 -
 arch/powerpc/crypto/crc32-vpmsum_core.S                             |    2=
 +-
 arch/powerpc/include/asm/Kbuild                                     |    1=
 +
 arch/powerpc/include/asm/asm-prototypes.h                           |    6=
 +-
 arch/powerpc/include/asm/atomic.h                                   |   28=
 +
 arch/powerpc/include/asm/barrier.h                                  |   29=
 +
 arch/powerpc/include/asm/book3s/32/pgtable.h                        |   15=
 +-
 arch/powerpc/include/asm/book3s/64/hash-4k.h                        |   21=
 +-
 arch/powerpc/include/asm/book3s/64/hash-64k.h                       |   12=
 +-
 arch/powerpc/include/asm/book3s/64/hash-pkey.h                      |   32=
 +
 arch/powerpc/include/asm/book3s/64/kexec.h                          |   23=
 +
 arch/powerpc/include/asm/book3s/64/mmu-hash.h                       |   10=
 +-
 arch/powerpc/include/asm/book3s/64/mmu.h                            |   11=
 +
 arch/powerpc/include/asm/book3s/64/pgalloc.h                        |   16=
 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h                        |   25=
 +-
 arch/powerpc/include/asm/book3s/64/pkeys.h                          |   27=
 +
 arch/powerpc/include/asm/book3s/64/radix-4k.h                       |    2=
 +-
 arch/powerpc/include/asm/book3s/64/tlbflush-radix.h                 |   15=
 +
 arch/powerpc/include/asm/cacheflush.h                               |    1=
 +
 arch/powerpc/include/asm/cputable.h                                 |   30=
 +-
 arch/powerpc/include/asm/cputime.h                                  |    4=
 +-
 arch/powerpc/include/asm/crashdump-ppc64.h                          |   19=
 +
 arch/powerpc/include/asm/dbell.h                                    |   64=
 +-
 arch/powerpc/include/asm/device.h                                   |    3=
 +
 arch/powerpc/include/asm/drmem.h                                    |    9=
 +-
 arch/powerpc/include/asm/eeh.h                                      |   26=
 +-
 arch/powerpc/include/asm/epapr_hcalls.h                             |    4=
 +-
 arch/powerpc/include/asm/exception-64e.h                            |   59=
 +-
 arch/powerpc/include/asm/exception-64s.h                            |   14=
 +
 arch/powerpc/include/asm/firmware.h                                 |   10=
 +-
 arch/powerpc/include/asm/fixmap.h                                   |    2=
 +-
 arch/powerpc/include/asm/hardirq.h                                  |    1=
 -
 arch/powerpc/include/asm/head-64.h                                  |    2=
 +-
 arch/powerpc/include/asm/hugetlb.h                                  |    7=
 +
 arch/powerpc/include/asm/hvcall.h                                   |   39=
 +-
 arch/powerpc/include/asm/hw_breakpoint.h                            |    6=
 +-
 arch/powerpc/include/asm/hydra.h                                    |    2=
 +-
 arch/powerpc/include/asm/imc-pmu.h                                  |    5=
 +
 arch/powerpc/include/asm/inst.h                                     |   19=
 +
 arch/powerpc/include/asm/kasan.h                                    |    2=
 +
 arch/powerpc/include/asm/kexec.h                                    |   41=
 +-
 arch/powerpc/include/asm/kexec_ranges.h                             |   25=
 +
 arch/powerpc/include/asm/kvm_book3s_asm.h                           |    2=
 +-
 arch/powerpc/include/asm/kvm_booke.h                                |    2=
 +
 arch/powerpc/include/asm/kvm_host.h                                 |    6=
 +-
 arch/powerpc/include/asm/kvm_para.h                                 |   26=
 +-
 arch/powerpc/include/asm/machdep.h                                  |    2=
 +-
 arch/powerpc/include/asm/mce.h                                      |    3=
 +
 arch/powerpc/include/asm/mman.h                                     |   30=
 +-
 arch/powerpc/include/asm/mmu.h                                      |   23=
 +
 arch/powerpc/include/asm/mmu_context.h                              |    2=
 -
 arch/powerpc/include/asm/nohash/32/pgtable.h                        |   22=
 +-
 arch/powerpc/include/asm/nohash/64/pgtable.h                        |    2=
 -
 arch/powerpc/include/asm/paca.h                                     |    1=
 +
 arch/powerpc/include/asm/page.h                                     |    4=
 +-
 arch/powerpc/include/asm/paravirt.h                                 |   87=
 ++
 arch/powerpc/include/asm/pci-bridge.h                               |    1=
 -
 arch/powerpc/include/asm/percpu.h                                   |    4=
 +-
 arch/powerpc/include/asm/perf_event.h                               |    2=
 +
 arch/powerpc/include/asm/perf_event_server.h                        |   14=
 +-
 arch/powerpc/include/asm/pkeys.h                                    |   65=
 +-
 arch/powerpc/include/asm/plpar_wrappers.h                           |   59=
 +-
 arch/powerpc/include/asm/pnv-ocxl.h                                 |   40=
 +-
 arch/powerpc/include/asm/ppc-opcode.h                               |  571=
 +++++-----
 arch/powerpc/include/asm/ppc_asm.h                                  |    4=
 +-
 arch/powerpc/include/asm/processor.h                                |    5=
 +-
 arch/powerpc/include/asm/ptrace.h                                   |    9=
 +-
 arch/powerpc/include/asm/qspinlock.h                                |   91=
 ++
 arch/powerpc/include/asm/qspinlock_paravirt.h                       |    7=
 +
 arch/powerpc/include/asm/reg.h                                      |   10=
 +-
 arch/powerpc/include/asm/rtas.h                                     |    3=
 -
 arch/powerpc/include/asm/security_features.h                        |    2=
 +
 arch/powerpc/include/asm/setup.h                                    |    4=
 +-
 arch/powerpc/include/asm/simple_spinlock.h                          |  288=
 +++++
 arch/powerpc/include/asm/simple_spinlock_types.h                    |   21=
 +
 arch/powerpc/include/asm/smu.h                                      |    2=
 +-
 arch/powerpc/include/asm/sparsemem.h                                |    6=
 -
 arch/powerpc/include/asm/spinlock.h                                 |  308=
 +-----
 arch/powerpc/include/asm/spinlock_types.h                           |   17=
 +-
 arch/powerpc/include/asm/sstep.h                                    |    7=
 +
 arch/powerpc/include/asm/string.h                                   |    2=
 +-
 arch/powerpc/include/asm/time.h                                     |    1=
 -
 arch/powerpc/include/asm/timex.h                                    |    2=
 +-
 arch/powerpc/include/asm/topology.h                                 |   27=
 -
 arch/powerpc/include/asm/xive.h                                     |    1=
 -
 arch/powerpc/include/uapi/asm/kvm.h                                 |    5=
 +
 arch/powerpc/include/uapi/asm/mman.h                                |    2=
 +-
 arch/powerpc/include/uapi/asm/papr_pdsm.h                           |    9=
 +
 arch/powerpc/kernel/Makefile                                        |    7=
 +-
 arch/powerpc/kernel/align.c                                         |    8=
 +-
 arch/powerpc/kernel/asm-offsets.c                                   |    5=
 +
 arch/powerpc/kernel/cacheinfo.c                                     |   62=
 +-
 arch/powerpc/kernel/cpu_setup_power.S                               |   29=
 +-
 arch/powerpc/kernel/cputable.c                                      |    3=
 +-
 arch/powerpc/kernel/dawr.c                                          |    2=
 +-
 arch/powerpc/kernel/dbell.c                                         |   55=
 -
 arch/powerpc/kernel/dt_cpu_ftrs.c                                   |   52=
 +-
 arch/powerpc/kernel/eeh.c                                           |  106=
 +-
 arch/powerpc/kernel/eeh_dev.c                                       |   67=
 --
 arch/powerpc/kernel/eeh_driver.c                                    |   12=
 +-
 arch/powerpc/kernel/eeh_pe.c                                        |  141=
 +--
 arch/powerpc/kernel/eeh_sysfs.c                                     |    2=
 +-
 arch/powerpc/kernel/entry_32.S                                      |    6=
 +
 arch/powerpc/kernel/entry_64.S                                      |  190=
 +++-
 arch/powerpc/kernel/exceptions-64s.S                                |  150=
 ++-
 arch/powerpc/kernel/fadump.c                                        |   26=
 +
 arch/powerpc/kernel/firmware.c                                      |   19=
 +
 arch/powerpc/kernel/fpu.S                                           |    4=
 +-
 arch/powerpc/kernel/head_32.S                                       |   16=
 +-
 arch/powerpc/kernel/head_40x.S                                      |    2=
 +-
 arch/powerpc/kernel/hw_breakpoint.c                                 |   98=
 +-
 arch/powerpc/kernel/irq.c                                           |    9=
 +-
 arch/powerpc/kernel/kprobes.c                                       |    2=
 +-
 arch/powerpc/kernel/mce.c                                           |   18=
 +-
 arch/powerpc/kernel/mce_power.c                                     |   84=
 ++
 arch/powerpc/kernel/misc_64.S                                       |   14=
 -
 arch/powerpc/kernel/module.c                                        |   11=
 +
 arch/powerpc/kernel/of_platform.c                                   |    4=
 +-
 arch/powerpc/kernel/paca.c                                          |   13=
 +-
 arch/powerpc/kernel/pci_dn.c                                        |   29=
 +-
 arch/powerpc/kernel/process.c                                       |  111=
 +-
 arch/powerpc/kernel/prom.c                                          |   22=
 +-
 arch/powerpc/kernel/prom_init.c                                     |   30=
 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c                            |   27=
 +-
 arch/powerpc/kernel/rtas.c                                          |  122=
 +--
 arch/powerpc/kernel/rtasd.c                                         |   28=
 +-
 arch/powerpc/kernel/secure_boot.c                                   |   18=
 +-
 arch/powerpc/kernel/security.c                                      |  139=
 +--
 arch/powerpc/kernel/setup-common.c                                  |    3=
 +
 arch/powerpc/kernel/setup_64.c                                      |    5=
 +-
 arch/powerpc/kernel/signal.c                                        |   19=
 +-
 arch/powerpc/kernel/signal_32.c                                     |   20=
 +-
 arch/powerpc/kernel/signal_64.c                                     |   29=
 +-
 arch/powerpc/kernel/smp.c                                           |    1=
 +
 arch/powerpc/kernel/syscall_64.c                                    |   40=
 +-
 arch/powerpc/kernel/sysfs.c                                         |    8=
 +
 arch/powerpc/kernel/trace/ftrace.c                                  |   26=
 +-
 arch/powerpc/kernel/traps.c                                         |    8=
 -
 arch/powerpc/kernel/vdso.c                                          |    2=
 +-
 arch/powerpc/kernel/vdso32/Makefile                                 |    2=
 +-
 arch/powerpc/kernel/vdso32/vdso32.lds.S                             |    1=
 +
 arch/powerpc/kernel/vdso64/Makefile                                 |    2=
 +-
 arch/powerpc/kernel/vdso64/cacheflush.S                             |    9=
 +-
 arch/powerpc/kernel/vdso64/datapage.S                               |   28=
 +-
 arch/powerpc/kernel/vdso64/gettimeofday.S                           |    9=
 +-
 arch/powerpc/kernel/vdso64/sigtramp.S                               |   13=
 +-
 arch/powerpc/kernel/vdso64/vdso64.lds.S                             |    3=
 +-
 arch/powerpc/kernel/vector.S                                        |    4=
 +-
 arch/powerpc/kexec/Makefile                                         |    2=
 +-
 arch/powerpc/kexec/core_64.c                                        |    2=
 +
 arch/powerpc/kexec/elf_64.c                                         |   36=
 +-
 arch/powerpc/kexec/file_load.c                                      |   62=
 +-
 arch/powerpc/kexec/file_load_64.c                                   | 1119=
 ++++++++++++++++++++
 arch/powerpc/kexec/ranges.c                                         |  412=
 +++++++
 arch/powerpc/kvm/book3s_hv.c                                        |   46=
 +-
 arch/powerpc/kvm/book3s_hv_builtin.c                                |    2=
 +-
 arch/powerpc/kvm/book3s_hv_interrupts.S                             |    8=
 +
 arch/powerpc/kvm/book3s_hv_ras.c                                    |    2=
 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                             |   36=
 +-
 arch/powerpc/kvm/book3s_interrupts.S                                |    2=
 +-
 arch/powerpc/kvm/trace_hv.h                                         |    2=
 +-
 arch/powerpc/lib/Makefile                                           |    3=
 +
 arch/powerpc/lib/code-patching.c                                    |    2=
 +-
 arch/powerpc/lib/locks.c                                            |   12=
 +-
 arch/powerpc/lib/pmem.c                                             |   48=
 +-
 arch/powerpc/lib/sstep.c                                            |   41=
 +-
 arch/powerpc/lib/test_emulate_step.c                                |  697=
 ++++++++++--
 arch/powerpc/lib/test_emulate_step_exec_instr.S                     |    2=
 +
 arch/powerpc/mm/book3s32/hash_low.S                                 |    2=
 +-
 arch/powerpc/mm/book3s32/mmu.c                                      |   17=
 +-
 arch/powerpc/mm/book3s64/hash_utils.c                               |   25=
 +-
 arch/powerpc/mm/book3s64/pgtable.c                                  |    8=
 +-
 arch/powerpc/mm/book3s64/pkeys.c                                    |  300=
 +++---
 arch/powerpc/mm/book3s64/radix_pgtable.c                            |  219=
 ++--
 arch/powerpc/mm/book3s64/radix_tlb.c                                |   82=
 +-
 arch/powerpc/mm/drmem.c                                             |   87=
 +-
 arch/powerpc/mm/fault.c                                             |  106=
 +-
 arch/powerpc/mm/hugetlbpage.c                                       |   18=
 +
 arch/powerpc/mm/init_32.c                                           |    2=
 +
 arch/powerpc/mm/init_64.c                                           |    6=
 +-
 arch/powerpc/mm/kasan/kasan_init_32.c                               |   35=
 +-
 arch/powerpc/mm/mem.c                                               |    5=
 -
 arch/powerpc/mm/nohash/tlb_low_64e.S                                |   47=
 +-
 arch/powerpc/mm/numa.c                                              |  506=
 +--------
 arch/powerpc/mm/pgtable-frag.c                                      |    3=
 +
 arch/powerpc/mm/ptdump/hashpagetable.c                              |    2=
 +-
 arch/powerpc/mm/ptdump/ptdump.c                                     |   55=
 +-
 arch/powerpc/net/bpf_jit.h                                          |  184=
 +---
 arch/powerpc/net/bpf_jit32.h                                        |   34=
 +-
 arch/powerpc/net/bpf_jit64.h                                        |   16=
 +-
 arch/powerpc/net/bpf_jit_comp.c                                     |  134=
 +--
 arch/powerpc/net/bpf_jit_comp64.c                                   |  298=
 +++---
 arch/powerpc/perf/Makefile                                          |    2=
 +-
 arch/powerpc/perf/callchain.h                                       |   25=
 +-
 arch/powerpc/perf/callchain_32.c                                    |   21=
 +-
 arch/powerpc/perf/callchain_64.c                                    |   13=
 +-
 arch/powerpc/perf/core-book3s.c                                     |  108=
 +-
 arch/powerpc/perf/generic-compat-pmu.c                              |    2=
 +-
 arch/powerpc/perf/hv-24x7.c                                         |   54=
 +
 arch/powerpc/perf/imc-pmu.c                                         |   29=
 +-
 arch/powerpc/perf/internal.h                                        |    1=
 +
 arch/powerpc/perf/isa207-common.c                                   |   91=
 +-
 arch/powerpc/perf/isa207-common.h                                   |   37=
 +-
 arch/powerpc/perf/mpc7450-pmu.c                                     |   23=
 +-
 arch/powerpc/perf/power10-events-list.h                             |   70=
 ++
 arch/powerpc/perf/power10-pmu.c                                     |  419=
 ++++++++
 arch/powerpc/perf/power5+-pmu.c                                     |   19=
 +-
 arch/powerpc/perf/power5-pmu.c                                      |   19=
 +-
 arch/powerpc/perf/power6-pmu.c                                      |   18=
 +-
 arch/powerpc/perf/power7-pmu.c                                      |   19=
 +-
 arch/powerpc/perf/power8-pmu.c                                      |    2=
 +-
 arch/powerpc/perf/power9-pmu.c                                      |    2=
 +-
 arch/powerpc/perf/ppc970-pmu.c                                      |   26=
 +-
 arch/powerpc/platforms/52xx/lite5200_sleep.S                        |    2=
 +-
 arch/powerpc/platforms/85xx/Kconfig                                 |    2=
 +-
 arch/powerpc/platforms/cell/Kconfig                                 |    1=
 +
 arch/powerpc/platforms/cell/spufs/coredump.c                        |   21=
 +-
 arch/powerpc/platforms/pasemi/misc.c                                |    3=
 +-
 arch/powerpc/platforms/powermac/feature.c                           |    2=
 +-
 arch/powerpc/platforms/powermac/low_i2c.c                           |    6=
 +-
 arch/powerpc/platforms/powermac/pfunc_base.c                        |    4=
 +-
 arch/powerpc/platforms/powermac/udbg_scc.c                          |    2=
 +-
 arch/powerpc/platforms/powernv/Makefile                             |    1=
 +
 arch/powerpc/platforms/powernv/eeh-powernv.c                        |  114=
 +-
 arch/powerpc/platforms/powernv/idle.c                               |   48=
 +-
 arch/powerpc/platforms/powernv/opal-async.c                         |    2=
 +-
 arch/powerpc/platforms/powernv/pci-ioda-tce.c                       |    2=
 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                           |  923=
 +++-------------
 arch/powerpc/platforms/powernv/pci-sriov.c                          |  766=
 ++++++++++++++
 arch/powerpc/platforms/powernv/pci.c                                |   14=
 +-
 arch/powerpc/platforms/powernv/pci.h                                |  103=
 +-
 arch/powerpc/platforms/powernv/setup.c                              |   10=
 +-
 arch/powerpc/platforms/pseries/Kconfig                              |    9=
 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c                        |  382=
 ++++---
 arch/powerpc/platforms/pseries/firmware.c                           |    1=
 +
 arch/powerpc/platforms/pseries/hotplug-cpu.c                        |  190=
 +---
 arch/powerpc/platforms/pseries/hotplug-memory.c                     |  109=
 +-
 arch/powerpc/platforms/pseries/hvcserver.c                          |    2=
 +-
 arch/powerpc/platforms/pseries/lpar.c                               |    8=
 +-
 arch/powerpc/platforms/pseries/mobility.c                           |   43=
 +-
 arch/powerpc/platforms/pseries/offline_states.h                     |   38=
 -
 arch/powerpc/platforms/pseries/papr_scm.c                           |  296=
 +++++-
 arch/powerpc/platforms/pseries/pci_dlpar.c                          |    2=
 +-
 arch/powerpc/platforms/pseries/pmem.c                               |    7=
 +-
 arch/powerpc/platforms/pseries/setup.c                              |   24=
 +-
 arch/powerpc/platforms/pseries/smp.c                                |   90=
 +-
 arch/powerpc/platforms/pseries/suspend.c                            |   27=
 +-
 arch/powerpc/purgatory/Makefile                                     |    4=
 +-
 arch/powerpc/purgatory/{trampoline.S =3D> trampoline_64.S}            |   =
54 +-
 arch/powerpc/sysdev/xive/native.c                                   |    2=
 +
 arch/powerpc/sysdev/xive/spapr.c                                    |    2=
 +-
 arch/powerpc/tools/unrel_branch_check.sh                            |    5=
 +-
 arch/powerpc/xmon/xmon.c                                            |   40=
 +-
 drivers/cpuidle/cpuidle-powernv.c                                   |   14=
 -
 drivers/cpuidle/cpuidle-pseries.c                                   |  187=
 +++-
 drivers/crypto/vmx/aesp8-ppc.pl                                     |    2=
 +-
 drivers/crypto/vmx/ghashp8-ppc.pl                                   |    2=
 +-
 drivers/macintosh/adb-iop.c                                         |  186=
 ++--
 drivers/macintosh/adb.c                                             |    2=
 +-
 drivers/macintosh/therm_adt746x.c                                   |    4=
 +-
 drivers/macintosh/via-macii.c                                       |  324=
 +++---
 drivers/md/dm-writecache.c                                          |    2=
 +-
 drivers/misc/ocxl/Kconfig                                           |    2=
 +-
 drivers/misc/ocxl/config.c                                          |   91=
 +-
 drivers/misc/ocxl/ocxl_internal.h                                   |   15=
 +-
 drivers/misc/ocxl/sysfs.c                                           |   35=
 +
 drivers/nvdimm/of_pmem.c                                            |    1=
 +
 drivers/nvdimm/region_devs.c                                        |    8=
 +-
 include/asm-generic/barrier.h                                       |   10=
 +
 include/asm-generic/qspinlock.h                                     |    4=
 +
 include/linux/cpuhotplug.h                                          |    1=
 +
 include/linux/kexec.h                                               |   29=
 +-
 include/linux/mm.h                                                  |    2=
 -
 include/misc/ocxl-config.h                                          |    1=
 +
 include/misc/ocxl.h                                                 |  102=
 +-
 include/trace/events/mmflags.h                                      |    2=
 -
 kernel/kexec_file.c                                                 |   16=
 +-
 mm/ksm.c                                                            |    4=
 -
 tools/arch/powerpc/include/uapi/asm/kvm.h                           |    5=
 +
 tools/perf/arch/powerpc/util/book3s_hcalls.h                        |    2=
 +-
 tools/testing/selftests/powerpc/alignment/alignment_handler.c       |  150=
 ++-
 tools/testing/selftests/powerpc/benchmarks/context_switch.c         |   21=
 +-
 tools/testing/selftests/powerpc/eeh/eeh-functions.sh                |   11=
 +-
 tools/testing/selftests/powerpc/include/instructions.h              |   77=
 ++
 tools/testing/selftests/powerpc/include/pkeys.h                     |  136=
 +++
 tools/testing/selftests/powerpc/include/reg.h                       |    6=
 +
 tools/testing/selftests/powerpc/include/utils.h                     |   29=
 +
 tools/testing/selftests/powerpc/math/.gitignore                     |    1=
 +
 tools/testing/selftests/powerpc/math/Makefile                       |   10=
 +-
 tools/testing/selftests/powerpc/math/fpu_denormal.c                 |   38=
 +
 tools/testing/selftests/powerpc/math/vmx_preempt.c                  |    3=
 +
 tools/testing/selftests/powerpc/math/vmx_signal.c                   |    3=
 +
 tools/testing/selftests/powerpc/math/vmx_syscall.c                  |    7=
 +-
 tools/testing/selftests/powerpc/math/vsx_preempt.c                  |    2=
 +
 tools/testing/selftests/powerpc/mm/.gitignore                       |    5=
 +-
 tools/testing/selftests/powerpc/mm/Makefile                         |   18=
 +-
 tools/testing/selftests/powerpc/mm/bad_accesses.c                   |   28=
 -
 tools/testing/selftests/powerpc/mm/pkey_exec_prot.c                 |  294=
 +++++
 tools/testing/selftests/powerpc/mm/pkey_siginfo.c                   |  333=
 ++++++
 tools/testing/selftests/powerpc/mm/prot_sao.c                       |   42=
 -
 tools/testing/selftests/powerpc/mm/stack_expansion_ldst.c           |  202=
 ++++
 tools/testing/selftests/powerpc/mm/stack_expansion_signal.c         |  118=
 +++
 tools/testing/selftests/powerpc/pmu/count_stcx_fail.c               |    4=
 +
 tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c    |    2=
 -
 tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c               |    2=
 -
 tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c   |    2=
 -
 tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c    |    2=
 -
 tools/testing/selftests/powerpc/pmu/ebb/ebb.c                       |    2=
 -
 tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c |    2=
 -
 tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c       |    1=
 -
 tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c        |    7=
 -
 tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c      |    2=
 -
 tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c        |    2=
 -
 tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c       |    2=
 -
 tools/testing/selftests/powerpc/pmu/lib.h                           |    1=
 +
 tools/testing/selftests/powerpc/pmu/per_event_excludes.c            |    7=
 +-
 tools/testing/selftests/powerpc/ptrace/core-pkey.c                  |    2=
 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c                |   57=
 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tar.c                 |    3=
 +
 tools/testing/selftests/powerpc/ptrace/ptrace-vsx.c                 |    2=
 +
 tools/testing/selftests/powerpc/security/spectre_v2.c               |   10=
 +
 tools/testing/selftests/powerpc/stringloops/Makefile                |    2=
 +-
 tools/testing/selftests/powerpc/stringloops/memcmp.c                |   46=
 +-
 tools/testing/selftests/powerpc/utils.c                             |   65=
 +-
 391 files changed, 11054 insertions(+), 5675 deletions(-)
 create mode 100644 arch/powerpc/include/asm/book3s/64/hash-pkey.h
 create mode 100644 arch/powerpc/include/asm/book3s/64/kexec.h
 create mode 100644 arch/powerpc/include/asm/book3s/64/pkeys.h
 create mode 100644 arch/powerpc/include/asm/crashdump-ppc64.h
 create mode 100644 arch/powerpc/include/asm/kexec_ranges.h
 create mode 100644 arch/powerpc/include/asm/paravirt.h
 create mode 100644 arch/powerpc/include/asm/qspinlock.h
 create mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h
 create mode 100644 arch/powerpc/include/asm/simple_spinlock.h
 create mode 100644 arch/powerpc/include/asm/simple_spinlock_types.h
 delete mode 100644 arch/powerpc/kernel/eeh_dev.c
 create mode 100644 arch/powerpc/kexec/file_load_64.c
 create mode 100644 arch/powerpc/kexec/ranges.c
 create mode 100644 arch/powerpc/perf/power10-events-list.h
 create mode 100644 arch/powerpc/perf/power10-pmu.c
 create mode 100644 arch/powerpc/platforms/powernv/pci-sriov.c
 delete mode 100644 arch/powerpc/platforms/pseries/offline_states.h
 rename arch/powerpc/purgatory/{trampoline.S =3D> trampoline_64.S} (70%)
 create mode 100644 tools/testing/selftests/powerpc/include/pkeys.h
 create mode 100644 tools/testing/selftests/powerpc/math/fpu_denormal.c
 create mode 100644 tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
 create mode 100644 tools/testing/selftests/powerpc/mm/pkey_siginfo.c
 delete mode 100644 tools/testing/selftests/powerpc/mm/prot_sao.c
 create mode 100644 tools/testing/selftests/powerpc/mm/stack_expansion_ldst=
.c
 create mode 100644 tools/testing/selftests/powerpc/mm/stack_expansion_sign=
al.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl8tUvYACgkQUevqPMjh
pYCR+w/+I+iljkTY6YUrUFak8u5fYUteiqA2qLcnaW8V8su6LHvf0RqDBYTyrter
verUU8yqcCtGsgfJwBTR9AzRbUtw3Ap/1yx3bw10gb0tfsphmfzrpdsxCB0b0Vf7
Umd8ZLnJzWRiJrz3SVUUqEovF1I1XJT7I0HEjdUWr+FsHeyq2IDoK+DJeSj3Ci0r
rSxnYX6SJp0IPExgVSbJ+EXdVCMP2Tgj2w4lGXLVDNumi7INl5BK+BxB/PWVp2/3
6InHi0eA/1T94SMRE1T5EfTEqNJUW6ws2pFw1xINcuWeZ0Exx/JcO8n0weQdj1tZ
rRtVOooN2TqLhZIttJWgiYDFkj9uxQBzXGGJec8eG8v3r7X+xqo/RcQmQV0lvEIm
9QmnUlwjcr9IPSQgBxoDlBrqpkClafBpcs8jn9k7/66iTRpmYXoNa8WTPGoEV9co
7npVym8va/M0aslJYPan3HjaG5v/hMduneQrgTi3/7/zYB0MhyGIweOEtpG0Nia4
YHLKYi5UWDFmk6VdbZnG8Qv+mQZ1MBH5dIDUlKOAz/0jRhgSqgI/Df4Kv14GTTOT
gJIc+77ZR3Shb/arJqExvGF/QamOrgZhR8CVcoXREpIL0xnESf0RVWugVLReedcG
ohP3q9ExQ73/j+Zyeei+q96exZTWimhgawYDzz1N0hEBbExRfAE=3D
=3Dz9TY
-----END PGP SIGNATURE-----
