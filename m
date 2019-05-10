Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80919D23
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 14:22:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450q9916mjzDqTX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 22:22:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450q7Q5X5lzDqRw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 22:21:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 450q7F5g6Sz9sCJ;
 Fri, 10 May 2019 22:20:57 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.2-1 tag
Date: Fri, 10 May 2019 22:20:55 +1000
Message-ID: <874l62v6u0.fsf@concordia.ellerman.id.au>
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
Cc: sachinp@linux.vnet.ibm.com, nathanl@linux.ibm.com, maddy@linux.vnet.ibm.com,
 aik@ozlabs.ru, mahesh@linux.vnet.ibm.com, thuth@redhat.com,
 weiyongjun1@huawei.com, leitao@debian.org, nfont@linux.vnet.ibm.com,
 paulmck@linux.ibm.com, hch@lst.de, mikey@neuling.org, horia.geanta@nxp.com,
 aneesh.kumar@linux.ibm.com, yuehaibing@huawei.com, wen.yang99@zte.com.cn,
 anju@linux.vnet.ibm.com, ganeshgr@linux.ibm.com, joel@jms.id.au,
 alastair@d-silva.org, fbarrat@linux.ibm.com, ben@decadent.org.uk,
 valentin.schneider@arm.com, ricklind@linux.vnet.ibm.com, lvivier@redhat.com,
 jagdsh.linux@gmail.com, ajd@linux.ibm.com, laurentiu.tudor@nxp.com,
 npiggin@gmail.com, Julia.Lawall@lip6.fr, cai@lca.pw, clg@kaod.org,
 lukas.bulwahn@gmail.com, tsu.yubo@gmail.com, dvyukov@google.com,
 dja@axtens.net, lkml@sdf.org, sukadev@linux.vnet.ibm.com, malat@debian.org,
 cmr@informatik.wtf, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 andrew.donnellan@au1.ibm.com, joe@perches.com, colin.king@canonical.com,
 linuxppc-dev@lists.ozlabs.org, tobin@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Linus,

Please pull powerpc updates for 5.2.

Slightly delayed due to the issue with printk() calling probe_kernel_read()
interacting with our new user access prevention stuff, but all fixed now.

The only out-of-area changes are the addition of a cpuhp_state, small addit=
ions
to Documentation and MAINTAINERS updates.

No conflicts that I'm aware of.

cheers


The following changes since commit 79a3aaa7b82e3106be97842dedfd8429248896e6:

  Linux 5.1-rc3 (2019-03-31 14:39:29 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.2-1

for you to fetch changes up to 8150a153c013aa2dd1ffae43370b89ac1347a7fb:

  powerpc/64s: Use early_mmu_has_feature() in set_kuap() (2019-05-09 14:28:=
56 +1000)

- ------------------------------------------------------------------
powerpc updates for 5.2

Highlights:

 - Support for Kernel Userspace Access/Execution Prevention (like
   SMAP/SMEP/PAN/PXN) on some 64-bit and 32-bit CPUs. This prevents the ker=
nel
   from accidentally accessing userspace outside copy_to/from_user(), or
   ever executing userspace.

 - KASAN support on 32-bit.

 - Rework of where we map the kernel, vmalloc, etc. on 64-bit hash to use t=
he
   same address ranges we use with the Radix MMU.

 - A rewrite into C of large parts of our idle handling code for 64-bit Boo=
k3S
   (ie. power8 & power9).

 - A fast path entry for syscalls on 32-bit CPUs, for a 12-17% speedup in t=
he
   null_syscall benchmark.

 - On 64-bit bare metal we have support for recovering from errors with the=
 time
   base (our clocksource), however if that fails currently we hang in __del=
ay()
   and never crash. We now have support for detecting that case and short
   circuiting __delay() so we at least panic() and reboot.

 - Add support for optionally enabling the DAWR on Power9, which had to be
   disabled by default due to a hardware erratum. This has the effect of
   enabling hardware breakpoints for GDB, the downside is a badly behaved
   program could crash the machine by pointing the DAWR at cache inhibited
   memory. This is opt-in obviously.

 - xmon, our crash handler, gets support for a read only mode where operati=
ons
   that could change memory or otherwise disturb the system are disabled.

Plus many clean-ups, reworks and minor fixes etc.

Thanks to:
  Christophe Leroy, Akshay Adiga, Alastair D'Silva, Alexey Kardashevskiy, A=
ndrew
  Donnellan, Aneesh Kumar K.V, Anju T Sudhakar, Anton Blanchard, Ben Hutchi=
ngs,
  Bo YU, Breno Leitao, C=C3=A9dric Le Goater, Christopher M. Riedl, Christo=
ph
  Hellwig, Colin Ian King, David Gibson, Ganesh Goudar, Gautham R. Shenoy,
  George Spelvin, Greg Kroah-Hartman, Greg Kurz, Horia Geant=C4=83, Jagadee=
sh
  Pagadala, Joel Stanley, Joe Perches, Julia Lawall, Laurentiu Tudor, Laure=
nt
  Vivier, Lukas Bulwahn, Madhavan Srinivasan, Mahesh Salgaonkar, Mathieu
  Malaterre, Michael Neuling, Mukesh Ojha, Nathan Fontenot, Nathan Lynch,
  Nicholas Piggin, Nick Desaulniers, Oliver O'Halloran, Peng Hao, Qian Cai,=
 Ravi
  Bangoria, Rick Lindsley, Russell Currey, Sachin Sant, Stewart Smith, Suka=
dev
  Bhattiprolu, Thomas Huth, Tobin C. Harding, Tyrel Datwyler, Valentin
  Schneider, Wei Yongjun, Wen Yang, YueHaibing.

- ------------------------------------------------------------------
Alastair D'Silva (11):
      ocxl: Rename struct link to ocxl_link
      ocxl: read_pasid never returns an error, so make it void
      ocxl: Remove superfluous 'extern' from headers
      ocxl: Remove some unused exported symbols
      ocxl: Split pci.c
      ocxl: Don't pass pci_dev around
      ocxl: Create a clear delineation between ocxl backend & frontend
      ocxl: Allow external drivers to use OpenCAPI contexts
      ocxl: afu_irq only deals with IRQ IDs, not offsets
      ocxl: move event_fd handling to frontend
      ocxl: Provide global MMIO accessors for external drivers

Alexey Kardashevskiy (1):
      powerpc/powernv/ioda: Handle failures correctly in pnv_pci_ioda_iommu=
_bypass_supported()

Andrew Donnellan (2):
      powerpc/powernv: Squash sparse warnings in opal-call.c
      MAINTAINERS: Update cxl/ocxl email address

Aneesh Kumar K.V (16):
      powerpc/mm/radix: Don't do SLB preload when using the radix MMU
      powerpc/mm: Fix build error with FLATMEM book3s64 config
      powerpc/mm: Remove PPC_MM_SLICES #ifdef for book3s64
      powerpc/mm: Add helpers for accessing hash translation related variab=
les
      powerpc/mm: Move slb_addr_linit to early_init_mmu
      powerpc/mm: Reduce memory usage for mm_context_t for radix
      powerc/mm/hash: Reduce hash_mm_context size
      powerpc/mm/hash64: Add a variable to track the end of IO mapping
      powerpc/mm/hash64: Map all the kernel regions in the same 0xc range
      powerpc/mm: Validate address values against different region limits
      powerpc/mm: Drop the unnecessary region check
      powerpc/mm/hash: Simplify the region id calculation.
      powerpc/mm: Print kernel map details to dmesg
      powerpc/mm/hash: Rename KERNEL_REGION_ID to LINEAR_MAP_REGION_ID
      powerpc/mm: Fix section mismatch warning
      powerpc/mm/radix: Fix kernel crash when running subpage protect test

Anju T Sudhakar (6):
      powerpc/perf: Return accordingly on invalid chip-id in
      powerpc/perf: Fix loop exit condition in nest_imc_event_init
      powerpc/include: Add data structures and macros for IMC trace mode
      powerpc/perf: Rearrange setting of ldbar for thread-imc
      powerpc/perf: Trace imc events detection and cpuhotplug
      powerpc/perf: Trace imc PMU functions

Anton Blanchard (1):
      powerpc: Add doorbell tracepoints

Ben Hutchings (1):
      powerpc: vdso: Make vdso32 installation conditional in vdso_install

Bo YU (1):
      powerpc/boot: Fix missing check of lseek() return value

Breno Leitao (2):
      powerpc/tm: Avoid machine crash on rt_sigreturn()
      selftests/powerpc: Add a signal fuzzer selftest

Christoph Hellwig (1):
      powerpc: remove the __kernel_io_end export

Christophe Leroy (101):
      powerpc/highmem: Change BUG_ON() to WARN_ON()
      powerpc: Add framework for Kernel Userspace Protection
      powerpc: Add skeleton for Kernel Userspace Execution Prevention
      powerpc: Add a framework for Kernel Userspace Access Protection
      powerpc/32: Remove MSR_PR test when returning from syscall
      powerpc/32: Prepare for Kernel Userspace Access Protection
      powerpc/8xx: Only define APG0 and APG1
      powerpc/8xx: Add Kernel Userspace Execution Prevention
      powerpc/8xx: Add Kernel Userspace Access Protection
      powerpc/32s: Implement Kernel Userspace Execution Prevention.
      powerpc/32s: Prepare Kernel Userspace Access Protection
      powerpc/32s: Implement Kernel Userspace Access Protection
      powerpc/book3e: drop BUG_ON() in map_kernel_page()
      powerpc/nohash64: clean pgtable.h
      powerpc/mm: change #include "mmu_decl.h" to <mm/mmu_decl.h>
      powerpc/mm: Move book3s64 specifics in subdirectory mm/book3s64
      powerpc/mm: Move book3s32 specifics in subdirectory mm/book3s64
      powerpc/mm: Move nohash specifics in subdirectory mm/nohash
      powerpc/mm: fix erroneous duplicate slb_addr_limit init
      powerpc/mm: no slice for nohash/64
      powerpc/mm: hand a context_t over to slice_mask_for_size() instead of=
 mm_struct
      powerpc/mm: move slice_mask_for_size() into mmu.h
      powerpc/mm: get rid of mm_ctx_slice_mask_xxx()
      powerpc/mm: remove unnecessary #ifdef CONFIG_PPC64
      powerpc/mm: remove a couple of #ifdef CONFIG_PPC_64K_PAGES in mm/slic=
e.c
      powerpc/8xx: get rid of #ifdef CONFIG_HUGETLB_PAGE for slices
      powerpc/mm: define get_slice_psize() all the time
      powerpc/mm: define subarch SLB_ADDR_LIMIT_DEFAULT
      powerpc/book3e: drop mmu_get_tsize()
      powerpc/64: only book3s/64 supports CONFIG_PPC_64K_PAGES
      powerpc/book3e: hugetlbpage is only for CONFIG_PPC_FSL_BOOK3E
      powerpc/mm: move __find_linux_pte() out of hugetlbpage.c
      powerpc/mm: make hugetlbpage.c depend on CONFIG_HUGETLB_PAGE
      powerpc/mm: make gup_hugepte() static
      powerpc/mm: split asm/hugetlb.h into dedicated subarch files
      powerpc/mm: add a helper to populate hugepd
      powerpc/mm: cleanup ifdef mess in add_huge_page_size()
      powerpc/mm: move hugetlb_disabled into asm/hugetlb.h
      powerpc/mm: cleanup HPAGE_SHIFT setup
      powerpc/mm: cleanup remaining ifdef mess in hugetlbpage.c
      powerpc/mm: flatten function __find_linux_pte() step 1
      powerpc/mm: flatten function __find_linux_pte() step 2
      powerpc/mm: flatten function __find_linux_pte() step 3
      powerpc/mm: drop __bad_pte()
      powerpc/mm: convert Book3E 64 to pte_fragment
      powerpc/mm: move pgtable_t in asm/mmu.h
      powerpc/mm: get rid of nohash/32/mmu.h and nohash/64/mmu.h
      powerpc/Kconfig: select PPC_MM_SLICES from subarch type
      powerpc/book3e: move early_alloc_pgtable() to init section
      powerpc/mm: don't use pte_alloc_kernel() until slab is available on P=
PC32
      powerpc/mm: inline pte_alloc_one_kernel() and pte_alloc_one() on PPC32
      powerpc/mm: refactor pte_alloc_one() and pte_free() families definiti=
on.
      powerpc/mm: refactor definition of pgtable_cache[]
      powerpc/mm: Only keep one version of pmd_populate() functions on noha=
sh/32
      powerpc/mm: refactor pgtable freeing functions on nohash
      powerpc/mm: refactor pmd_pgtable()
      powerpc/mm: refactor pgd_alloc() and pgd_free() on nohash
      powerpc/32: Move early_init() in a separate file
      powerpc: prepare string/mem functions for KASAN
      powerpc: remove CONFIG_CMDLINE #ifdef mess
      powerpc/prom_init: don't use string functions from lib/
      powerpc: don't use direct assignation during early boot.
      powerpc/32: use memset() instead of memset_io() to zero BSS
      powerpc/32: make KVIRT_TOP dependent on FIXMAP_START
      powerpc/32: prepare shadow area for KASAN
      powerpc: disable KASAN instrumentation on early/critical files.
      powerpc/32: Add KASAN support
      powerpc/32s: move hash code patching out of MMU_init_hw()
      powerpc/32s: set up an early static hash table for KASAN.
      powerpc/32s: map kasan zero shadow with PAGE_READONLY instead of PAGE=
_KERNEL_RO
      powerpc/32s: drop Hash_end
      powerpc/32s: don't try to print hash table address.
      powerpc/mm: print hash info in a helper
      powerpc/32: Refactor EXCEPTION entry macros for head_8xx.S and head_3=
2.S
      powerpc/32: move LOAD_MSR_KERNEL() into head_32.h and use it
      powerpc/32: make the 6xx/8xx EXC_XFER_TEMPLATE() similar to the 40x/b=
ooke one
      powerpc/40x: Don't use SPRN_SPRG_SCRATCH2 in EXCEPTION_PROLOG
      powerpc/40x: add exception frame marker
      powerpc/40x: Split and rename NORMAL_EXCEPTION_PROLOG
      powerpc/40x: Refactor exception entry macros by using head_32.h
      powerpc/fsl_booke: ensure SPEFloatingPointException() reenables inter=
rupts
      powerpc/32: enter syscall with MSR_EE inconditionaly set
      powerpc/32: Enter exceptions with MSR_EE unset
      powerpc/32: get rid of COPY_EE in exception entry
      powerpc: Fix 32-bit handling of MSR_EE on exceptions
      powerpc/32: implement fast entry for syscalls on non BOOKE
      powerpc/32: implement fast entry for syscalls on BOOKE
      powerpc/32: don't do syscall stuff in transfer_to_handler
      powerpc/32: Don't add dummy frames when calling trace_hardirqs_on/off
      powerpc/fadump: define an empty fadump_cleanup()
      powerpc/mm: define an empty mm_iommu_init()
      powerpc/setup: Remove unnecessary #ifdef CONFIG_ALTIVEC
      powerpc/setup: cleanup ifdef mess in check_cache_coherency()
      powerpc/setup: cleanup the #ifdef CONFIG_TAU block
      powerpc/setup: replace ifdefs by IS_ENABLED() wherever possible.
      powerpc/irq: drop __irq_offset_value
      powerpc/prom_init: get rid of PROM_SCRATCH_SIZE
      powerpc/kasan: add missing/lost Makefile
      powerpc/mm: Fix makefile for KASAN
      powerpc/mm: fix redundant inclusion of pgtable-frag.o in Makefile
      powerpc/mm: fix section mismatch for setup_kup()

Christopher M. Riedl (1):
      powerpc/xmon: add read-only mode

Colin Ian King (1):
      powerpc/mm: fix spelling mistake "Outisde" -> "Outside"

C=C3=A9dric Le Goater (1):
      powerpc/xive: add OPAL extensions for the XIVE native exploitation su=
pport

Ganesh Goudar (1):
      powerpc/pseries: hwpoison the pages upon hitting UE

George Spelvin (1):
      powerpc/crypto: Use cheaper random numbers for crc-vpmsum self-test

Horia Geant=C4=83 (1):
      powerpc/dts/fsl: add crypto node alias for B4

Jagadeesh Pagadala (1):
      powerpc: Remove duplicate headers

Joe Perches (1):
      powerpc/powernv/ioda2: Add __printf format/argument verification

Joel Stanley (2):
      powerpc/configs: Add (back) MLX5 ethernet support to skiroot_defconfig
      Documentation: powerpc: Expand the DAWR acronym

Julia Lawall (1):
      powerpc/83xx: Add missing of_node_put() after of_device_is_available()

Laurent Vivier (1):
      powerpc/mm: move warning from resize_hpt_for_hotplug()

Laurentiu Tudor (1):
      powerpc/booke64: set RI in default MSR

Lukas Bulwahn (1):
      MAINTAINERS: Update remaining @linux.vnet.ibm.com addresses

Madhavan Srinivasan (4):
      powerpc/perf: init pmu from core-book3s
      powerpc/perf: Add generic compat mode pmu driver
      powerpc/perf: Remove PM_BR_CMPL_ALT from power9 event list
      powerpc/perf: Add privileged access check for thread_imc

Mahesh Salgaonkar (5):
      powerpc/pseries/mce: Improve array initialization.
      powerpc/powernv/mce: Reduce MCE console logs to lesser lines.
      powerpc/powernv/mce: Print correct severity for MCE error.
      powerpc/powernv/mce: Print additional information about MCE error.
      powerpc/hmi: Fix kernel hang when TB is in error state.

Mathieu Malaterre (3):
      powerpc/embedded6xx: Make some functions static
      powerpc/embedded6xx: Remove unused functions holly_power_off and holl=
y_halt
      powerpc/64s: Remove 'dummy_copy_buffer'

Michael Ellerman (11):
      Merge branch 'fixes' into next
      powerpc/32: Add ppc_defconfig
      powerpc: Fix defconfig choice logic when cross compiling
      powerpc/mm/64: Document the sizes of/sizes mapped by Pxx_INDEX_SIZE
      powerpc/powernv/idle: Restore AMR/UAMOR/AMOR after idle
      powerpc/64s: Implement KUAP for Radix MMU
      powerpc/mm: Detect bad KUAP faults
      powerpc/powernv/idle: Restore AMR/UAMOR/AMOR/IAMR after idle
      Merge branch 'topic/ppc-kvm' into next
      powerpc/security: Show powerpc_security_features in debugfs
      powerpc/64s: Use early_mmu_has_feature() in set_kuap()

Michael Neuling (1):
      powerpc: Add force enable of DAWR on P9 option

Nathan Fontenot (1):
      powerpc/pseries: Track LMB nid instead of using device tree

Nathan Lynch (2):
      powerpc/numa: improve control of topology updates
      powerpc/numa: document topology_updates_enabled, disable by default

Nicholas Piggin (3):
      powerpc/watchdog: Use hrtimers for per-CPU heartbeat
      powerpc/64s: Reimplement book3s idle code in C
      powerpc/64: Don't trace code that runs with the soft irq mask unrecon=
ciled

Nick Desaulniers (1):
      powerpc/vdso: Drop unnecessary cc-ldoption

Qian Cai (3):
      powerpc/mm: Silence unused-but-set-variable warnings
      powerpc/pseries/iommu: Fix set but not used values
      powerpc/pseries/pmem: Fix a set but not used value

Rick Lindsley (1):
      powerpc/book3s/64: check for NULL pointer in pgd_alloc()

Russell Currey (7):
      powerpc/64: Fix booting large kernels with STRICT_KERNEL_RWX
      powerpc/powernv/idle: Restore IAMR after idle
      powerpc/64: Setup KUP on secondary CPUs
      powerpc/mm/radix: Use KUEP API for Radix MMU
      powerpc/lib: Refactor __patch_instruction() to use __put_user_asm()
      powerpc/mm/ptdump: Wrap seq_printf() to handle NULL pointers
      powerpc/mm: Warn if W+X pages found on boot

Sachin Sant (1):
      powerpc/mm: Fix hugetlb page initialization

Sukadev Bhattiprolu (1):
      MAINTAINERS: Remove non-existent VAS file

Thomas Huth (1):
      powerpc/configs: Enable CONFIG_USB_XHCI_HCD by default

Tobin C. Harding (1):
      powerpc/cacheinfo: Fix kobject memleak

Valentin Schneider (1):
      powerpc/entry: Remove unneeded need_resched() loop

Wei Yongjun (1):
      ocxl: Fix return value check in afu_ioctl()

Wen Yang (1):
      powerpc/8xx: Fix possible device node reference leak

YueHaibing (1):
      ocxl: remove set but not used variables 'tid' and 'lpid'


 Documentation/admin-guide/kernel-parameters.txt    |    4 +-
 Documentation/powerpc/DAWR-POWER9.txt              |   40 +-
 MAINTAINERS                                        |   13 +-
 arch/powerpc/Kconfig                               |   10 +-
 arch/powerpc/Kconfig.debug                         |   32 +
 arch/powerpc/Makefile                              |   15 +-
 arch/powerpc/boot/addnote.c                        |    6 +-
 arch/powerpc/boot/dts/fsl/b4qds.dtsi               |    1 +
 arch/powerpc/configs/pseries_defconfig             |    1 +
 arch/powerpc/configs/skiroot_defconfig             |    2 +
 arch/powerpc/crypto/crc-vpmsum_test.c              |   10 +-
 arch/powerpc/include/asm/book3s/32/kup.h           |  145 +++
 arch/powerpc/include/asm/book3s/32/mmu-hash.h      |    9 +-
 arch/powerpc/include/asm/book3s/32/pgalloc.h       |   41 -
 arch/powerpc/include/asm/book3s/32/pgtable.h       |   13 +-
 arch/powerpc/include/asm/book3s/64/hash-4k.h       |   23 +-
 arch/powerpc/include/asm/book3s/64/hash-64k.h      |   21 +-
 arch/powerpc/include/asm/book3s/64/hash.h          |   95 +-
 arch/powerpc/include/asm/book3s/64/hugetlb.h       |   72 ++
 arch/powerpc/include/asm/book3s/64/kup-radix.h     |  108 ++
 arch/powerpc/include/asm/book3s/64/mmu-hash.h      |   70 +-
 arch/powerpc/include/asm/book3s/64/mmu.h           |  104 +-
 arch/powerpc/include/asm/book3s/64/pgalloc.h       |   52 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h       |   12 +-
 arch/powerpc/include/asm/book3s/64/radix-4k.h      |    9 +-
 arch/powerpc/include/asm/book3s/64/radix-64k.h     |    8 +-
 arch/powerpc/include/asm/book3s/64/radix.h         |   40 +-
 arch/powerpc/include/asm/book3s/64/slice.h         |   13 +-
 arch/powerpc/include/asm/cpuidle.h                 |   19 +-
 arch/powerpc/include/asm/drmem.h                   |   21 +
 arch/powerpc/include/asm/exception-64s.h           |    2 +
 arch/powerpc/include/asm/fadump.h                  |    1 +
 arch/powerpc/include/asm/feature-fixups.h          |    3 +
 arch/powerpc/include/asm/fixmap.h                  |    5 +
 arch/powerpc/include/asm/futex.h                   |    4 +
 arch/powerpc/include/asm/hugetlb.h                 |   87 +-
 arch/powerpc/include/asm/hw_breakpoint.h           |    8 +
 arch/powerpc/include/asm/imc-pmu.h                 |   39 +
 arch/powerpc/include/asm/kasan.h                   |   40 +
 arch/powerpc/include/asm/kup.h                     |   73 ++
 arch/powerpc/include/asm/mce.h                     |   97 +-
 arch/powerpc/include/asm/mmu.h                     |   28 +-
 arch/powerpc/include/asm/mmu_context.h             |    7 +-
 arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h   |   44 +
 arch/powerpc/include/asm/nohash/32/kup-8xx.h       |   58 ++
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h       |  102 +-
 arch/powerpc/include/asm/nohash/32/mmu.h           |   25 -
 arch/powerpc/include/asm/nohash/32/pgalloc.h       |  123 +--
 arch/powerpc/include/asm/nohash/32/pgtable.h       |   13 +-
 arch/powerpc/include/asm/nohash/32/slice.h         |    2 +
 arch/powerpc/include/asm/nohash/64/mmu.h           |   12 -
 arch/powerpc/include/asm/nohash/64/pgalloc.h       |  117 +--
 arch/powerpc/include/asm/nohash/64/pgtable.h       |   12 +-
 arch/powerpc/include/asm/nohash/64/slice.h         |   12 -
 arch/powerpc/include/asm/nohash/hugetlb-book3e.h   |   45 +
 arch/powerpc/include/asm/nohash/mmu-book3e.h       |    2 +
 arch/powerpc/include/asm/nohash/mmu.h              |   16 +-
 arch/powerpc/include/asm/nohash/pgalloc.h          |   56 ++
 arch/powerpc/include/asm/nohash/pte-book3e.h       |    5 -
 arch/powerpc/include/asm/opal-api.h                |   18 +-
 arch/powerpc/include/asm/opal.h                    |    9 +
 arch/powerpc/include/asm/paca.h                    |   40 +-
 arch/powerpc/include/asm/page.h                    |   23 +-
 arch/powerpc/include/asm/pgalloc.h                 |   51 +
 arch/powerpc/include/asm/pgtable-be-types.h        |    9 +-
 arch/powerpc/include/asm/pgtable-types.h           |    9 +-
 arch/powerpc/include/asm/pgtable.h                 |    9 +-
 arch/powerpc/include/asm/processor.h               |   12 +-
 arch/powerpc/include/asm/ptrace.h                  |   11 +-
 arch/powerpc/include/asm/reg.h                     |    8 +-
 arch/powerpc/include/asm/reg_booke.h               |    2 +-
 arch/powerpc/include/asm/slice.h                   |    9 +-
 arch/powerpc/include/asm/sparsemem.h               |    4 +-
 arch/powerpc/include/asm/string.h                  |   32 +-
 arch/powerpc/include/asm/task_size_64.h            |    2 +-
 arch/powerpc/include/asm/time.h                    |    2 +
 arch/powerpc/include/asm/trace.h                   |   16 +
 arch/powerpc/include/asm/uaccess.h                 |   38 +-
 arch/powerpc/include/asm/xive.h                    |   14 +
 arch/powerpc/kernel/Makefile                       |   14 +-
 arch/powerpc/kernel/asm-offsets.c                  |   25 +-
 arch/powerpc/kernel/cacheinfo.c                    |   13 +-
 arch/powerpc/kernel/cputable.c                     |   13 +-
 arch/powerpc/kernel/dbell.c                        |    3 +
 arch/powerpc/kernel/early_32.c                     |   36 +
 arch/powerpc/kernel/entry_32.S                     |  186 ++--
 arch/powerpc/kernel/entry_64.S                     |   35 +-
 arch/powerpc/kernel/exceptions-64s.S               |   26 +-
 arch/powerpc/kernel/fadump.c                       |    1 +
 arch/powerpc/kernel/fpu.S                          |    1 +
 arch/powerpc/kernel/head_32.S                      |  258 ++---
 arch/powerpc/kernel/head_32.h                      |  203 ++++
 arch/powerpc/kernel/head_40x.S                     |  155 +--
 arch/powerpc/kernel/head_44x.S                     |   12 +-
 arch/powerpc/kernel/head_64.S                      |    4 +-
 arch/powerpc/kernel/head_8xx.S                     |  136 +--
 arch/powerpc/kernel/head_booke.h                   |  131 ++-
 arch/powerpc/kernel/head_fsl_booke.S               |   32 +-
 arch/powerpc/kernel/hw_breakpoint.c                |   62 +-
 arch/powerpc/kernel/idle_book3s.S                  | 1060 +++-------------=
----
 arch/powerpc/kernel/irq.c                          |   16 +-
 arch/powerpc/kernel/mce.c                          |  106 +-
 arch/powerpc/kernel/mce_power.c                    |  253 ++---
 arch/powerpc/kernel/paca.c                         |   12 +-
 arch/powerpc/kernel/process.c                      |   35 +-
 arch/powerpc/kernel/prom_init.c                    |  248 +++--
 arch/powerpc/kernel/prom_init_check.sh             |   12 +-
 arch/powerpc/kernel/ptrace.c                       |    3 +-
 arch/powerpc/kernel/security.c                     |    8 +
 arch/powerpc/kernel/setup-common.c                 |  116 +--
 arch/powerpc/kernel/setup_32.c                     |   28 -
 arch/powerpc/kernel/setup_64.c                     |   10 +
 arch/powerpc/kernel/signal_64.c                    |   27 +-
 arch/powerpc/kernel/time.c                         |   10 +-
 arch/powerpc/kernel/traps.c                        |    8 +
 arch/powerpc/kernel/vdso32/Makefile                |    5 +-
 arch/powerpc/kernel/vdso64/Makefile                |    5 +-
 arch/powerpc/kernel/vector.S                       |    1 +
 arch/powerpc/kernel/watchdog.c                     |   81 +-
 arch/powerpc/kvm/book3s_hv.c                       |    3 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c               |    2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S            |  141 +--
 arch/powerpc/lib/Makefile                          |   19 +-
 arch/powerpc/lib/checksum_wrappers.c               |    4 +
 arch/powerpc/lib/code-patching.c                   |    5 +-
 arch/powerpc/lib/copy_32.S                         |   12 +-
 arch/powerpc/lib/mem_64.S                          |    9 +-
 arch/powerpc/lib/memcpy_64.S                       |    4 +-
 arch/powerpc/mm/Makefile                           |   47 +-
 arch/powerpc/mm/book3s32/Makefile                  |    9 +
 .../mm/{hash_low_32.S =3D> book3s32/hash_low.S}      |    6 +-
 arch/powerpc/mm/{ppc_mmu_32.c =3D> book3s32/mmu.c}   |   76 +-
 .../mmu_context.c}                                 |    0
 arch/powerpc/mm/{tlb_hash32.c =3D> book3s32/tlb.c}   |    2 +-
 arch/powerpc/mm/book3s64/Makefile                  |   24 +
 .../powerpc/mm/{hash64_4k.c =3D> book3s64/hash_4k.c} |    2 +-
 .../mm/{hash64_64k.c =3D> book3s64/hash_64k.c}       |    2 +-
 .../hash_hugepage.c}                               |    2 +-
 .../hash_hugetlbpage.c}                            |   31 +-
 .../{hash_native_64.c =3D> book3s64/hash_native.c}   |    0
 .../{pgtable-hash64.c =3D> book3s64/hash_pgtable.c}  |   15 +-
 .../mm/{tlb_hash64.c =3D> book3s64/hash_tlb.c}       |   18 +-
 .../mm/{hash_utils_64.c =3D> book3s64/hash_utils.c}  |  145 ++-
 .../{mmu_context_iommu.c =3D> book3s64/iommu_api.c}  |    0
 .../mmu_context.c}                                 |   29 +-
 .../mm/{pgtable-book3s64.c =3D> book3s64/pgtable.c}  |    2 +-
 arch/powerpc/mm/{ =3D> book3s64}/pkeys.c             |    1 +
 .../radix_hugetlbpage.c}                           |    0
 .../{pgtable-radix.c =3D> book3s64/radix_pgtable.c}  |  117 ++-
 .../mm/{tlb-radix.c =3D> book3s64/radix_tlb.c}       |    0
 arch/powerpc/mm/{ =3D> book3s64}/slb.c               |   31 +-
 .../mm/{subpage-prot.c =3D> book3s64/subpage_prot.c} |   39 +-
 arch/powerpc/mm/{ =3D> book3s64}/vphn.c              |    6 +-
 arch/powerpc/mm/{ =3D> book3s64}/vphn.h              |    3 +-
 arch/powerpc/mm/copro_fault.c                      |   18 +-
 arch/powerpc/mm/dma-noncoherent.c                  |    2 +-
 arch/powerpc/mm/drmem.c                            |    6 +-
 arch/powerpc/mm/fault.c                            |   49 +-
 arch/powerpc/mm/highmem.c                          |   14 +-
 arch/powerpc/mm/hugetlbpage.c                      |  242 +----
 arch/powerpc/mm/init-common.c                      |   26 +
 arch/powerpc/mm/init_32.c                          |    8 +-
 arch/powerpc/mm/init_64.c                          |    2 +-
 arch/powerpc/mm/kasan/Makefile                     |    5 +
 arch/powerpc/mm/kasan/kasan_init_32.c              |  183 ++++
 arch/powerpc/mm/mem.c                              |   17 +-
 arch/powerpc/mm/mmu_context.c                      |    2 +-
 arch/powerpc/mm/mmu_decl.h                         |    9 +-
 arch/powerpc/mm/{40x_mmu.c =3D> nohash/40x.c}        |    2 +-
 arch/powerpc/mm/{44x_mmu.c =3D> nohash/44x.c}        |    2 +-
 arch/powerpc/mm/{8xx_mmu.c =3D> nohash/8xx.c}        |   26 +-
 arch/powerpc/mm/nohash/Makefile                    |   18 +
 .../book3e_hugetlbpage.c}                          |   52 +-
 .../{pgtable-book3e.c =3D> nohash/book3e_pgtable.c}  |    9 +-
 .../mm/{fsl_booke_mmu.c =3D> nohash/fsl_booke.c}     |    2 +-
 .../{mmu_context_nohash.c =3D> nohash/mmu_context.c} |    2 +-
 arch/powerpc/mm/{tlb_nohash.c =3D> nohash/tlb.c}     |   19 +-
 .../mm/{tlb_nohash_low.S =3D> nohash/tlb_low.S}      |    0
 arch/powerpc/mm/{ =3D> nohash}/tlb_low_64e.S         |   31 -
 arch/powerpc/mm/numa.c                             |   35 +-
 arch/powerpc/mm/pgtable.c                          |  114 +++
 arch/powerpc/mm/pgtable_32.c                       |   47 +-
 arch/powerpc/mm/pgtable_64.c                       |   13 +-
 arch/powerpc/mm/ptdump/hashpagetable.c             |    2 +-
 arch/powerpc/mm/ptdump/ptdump.c                    |   86 +-
 arch/powerpc/mm/slice.c                            |  109 +-
 arch/powerpc/perf/Makefile                         |    3 +-
 arch/powerpc/perf/core-book3s.c                    |   28 +
 arch/powerpc/perf/generic-compat-pmu.c             |  234 +++++
 arch/powerpc/perf/imc-pmu.c                        |  347 ++++++-
 arch/powerpc/perf/internal.h                       |   12 +
 arch/powerpc/perf/power5+-pmu.c                    |    4 +-
 arch/powerpc/perf/power5-pmu.c                     |    4 +-
 arch/powerpc/perf/power6-pmu.c                     |    4 +-
 arch/powerpc/perf/power7-pmu.c                     |    4 +-
 arch/powerpc/perf/power8-pmu.c                     |    3 +-
 arch/powerpc/perf/power9-events-list.h             |    2 -
 arch/powerpc/perf/power9-pmu.c                     |    3 +-
 arch/powerpc/perf/ppc970-pmu.c                     |    4 +-
 arch/powerpc/platforms/83xx/usb.c                  |    4 +-
 arch/powerpc/platforms/8xx/pic.c                   |    3 +-
 arch/powerpc/platforms/Kconfig.cputype             |   45 +-
 arch/powerpc/platforms/cell/spu_base.c             |    4 +-
 arch/powerpc/platforms/embedded6xx/holly.c         |   19 +-
 arch/powerpc/platforms/powermac/Makefile           |    6 +
 arch/powerpc/platforms/powernv/idle.c              |  902 +++++++++++++----
 arch/powerpc/platforms/powernv/opal-call.c         |    6 +
 arch/powerpc/platforms/powernv/opal-imc.c          |    5 +-
 arch/powerpc/platforms/powernv/opal.c              |   23 +-
 arch/powerpc/platforms/powernv/pci-ioda.c          |   35 +-
 arch/powerpc/platforms/powernv/pci.h               |    2 +
 arch/powerpc/platforms/powernv/setup.c             |    5 +-
 arch/powerpc/platforms/powernv/subcore.c           |    2 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c    |   17 +-
 arch/powerpc/platforms/pseries/iommu.c             |   13 +-
 arch/powerpc/platforms/pseries/lpar.c              |    3 +-
 arch/powerpc/platforms/pseries/pmem.c              |    3 +-
 arch/powerpc/platforms/pseries/ras.c               |  135 ++-
 arch/powerpc/purgatory/Makefile                    |    3 +
 arch/powerpc/sysdev/xive/native.c                  |   99 ++
 arch/powerpc/xmon/Makefile                         |    1 +
 arch/powerpc/xmon/xmon.c                           |   66 +-
 drivers/misc/cxl/fault.c                           |    2 +-
 drivers/misc/ocxl/Makefile                         |    3 +-
 drivers/misc/ocxl/afu_irq.c                        |  102 +-
 drivers/misc/ocxl/config.c                         |   13 +-
 drivers/misc/ocxl/context.c                        |   31 +-
 drivers/misc/ocxl/core.c                           |  574 +++++++++++
 drivers/misc/ocxl/file.c                           |  182 +++-
 drivers/misc/ocxl/link.c                           |   42 +-
 drivers/misc/ocxl/mmio.c                           |  234 +++++
 drivers/misc/ocxl/ocxl_internal.h                  |   94 +-
 drivers/misc/ocxl/pci.c                            |  565 +----------
 drivers/misc/ocxl/sysfs.c                          |   54 +-
 drivers/misc/ocxl/trace.h                          |   12 +-
 include/linux/cpuhotplug.h                         |    1 +
 include/misc/ocxl.h                                |  359 ++++++-
 .../selftests/powerpc/copyloops/asm/export.h       |    1 +
 .../selftests/powerpc/copyloops/asm/kasan.h        |    0
 .../selftests/powerpc/copyloops/asm/ppc_asm.h      |    1 +
 tools/testing/selftests/powerpc/harness.c          |    6 +-
 tools/testing/selftests/powerpc/include/reg.h      |    2 +
 tools/testing/selftests/powerpc/signal/.gitignore  |    1 +
 tools/testing/selftests/powerpc/signal/Makefile    |    3 +-
 tools/testing/selftests/powerpc/signal/sigfuz.c    |  325 ++++++
 tools/testing/selftests/powerpc/vphn/vphn.c        |    2 +-
 tools/testing/selftests/powerpc/vphn/vphn.h        |    2 +-
 247 files changed, 7819 insertions(+), 4558 deletions(-)
 create mode 100644 arch/powerpc/include/asm/book3s/32/kup.h
 create mode 100644 arch/powerpc/include/asm/book3s/64/kup-radix.h
 create mode 100644 arch/powerpc/include/asm/kasan.h
 create mode 100644 arch/powerpc/include/asm/kup.h
 create mode 100644 arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
 create mode 100644 arch/powerpc/include/asm/nohash/32/kup-8xx.h
 delete mode 100644 arch/powerpc/include/asm/nohash/32/mmu.h
 delete mode 100644 arch/powerpc/include/asm/nohash/64/mmu.h
 delete mode 100644 arch/powerpc/include/asm/nohash/64/slice.h
 create mode 100644 arch/powerpc/include/asm/nohash/hugetlb-book3e.h
 create mode 100644 arch/powerpc/kernel/early_32.c
 create mode 100644 arch/powerpc/kernel/head_32.h
 create mode 100644 arch/powerpc/mm/book3s32/Makefile
 rename arch/powerpc/mm/{hash_low_32.S =3D> book3s32/hash_low.S} (99%)
 rename arch/powerpc/mm/{ppc_mmu_32.c =3D> book3s32/mmu.c} (86%)
 rename arch/powerpc/mm/{mmu_context_hash32.c =3D> book3s32/mmu_context.c} =
(100%)
 rename arch/powerpc/mm/{tlb_hash32.c =3D> book3s32/tlb.c} (99%)
 create mode 100644 arch/powerpc/mm/book3s64/Makefile
 rename arch/powerpc/mm/{hash64_4k.c =3D> book3s64/hash_4k.c} (98%)
 rename arch/powerpc/mm/{hash64_64k.c =3D> book3s64/hash_64k.c} (99%)
 rename arch/powerpc/mm/{hugepage-hash64.c =3D> book3s64/hash_hugepage.c} (=
98%)
 rename arch/powerpc/mm/{hugetlbpage-hash64.c =3D> book3s64/hash_hugetlbpag=
e.c} (84%)
 rename arch/powerpc/mm/{hash_native_64.c =3D> book3s64/hash_native.c} (100=
%)
 rename arch/powerpc/mm/{pgtable-hash64.c =3D> book3s64/hash_pgtable.c} (97=
%)
 rename arch/powerpc/mm/{tlb_hash64.c =3D> book3s64/hash_tlb.c} (95%)
 rename arch/powerpc/mm/{hash_utils_64.c =3D> book3s64/hash_utils.c} (94%)
 rename arch/powerpc/mm/{mmu_context_iommu.c =3D> book3s64/iommu_api.c} (10=
0%)
 rename arch/powerpc/mm/{mmu_context_book3s64.c =3D> book3s64/mmu_context.c=
} (86%)
 rename arch/powerpc/mm/{pgtable-book3s64.c =3D> book3s64/pgtable.c} (99%)
 rename arch/powerpc/mm/{ =3D> book3s64}/pkeys.c (99%)
 rename arch/powerpc/mm/{hugetlbpage-radix.c =3D> book3s64/radix_hugetlbpag=
e.c} (100%)
 rename arch/powerpc/mm/{pgtable-radix.c =3D> book3s64/radix_pgtable.c} (93=
%)
 rename arch/powerpc/mm/{tlb-radix.c =3D> book3s64/radix_tlb.c} (100%)
 rename arch/powerpc/mm/{ =3D> book3s64}/slb.c (97%)
 rename arch/powerpc/mm/{subpage-prot.c =3D> book3s64/subpage_prot.c} (91%)
 rename arch/powerpc/mm/{ =3D> book3s64}/vphn.c (94%)
 rename arch/powerpc/mm/{ =3D> book3s64}/vphn.h (98%)
 create mode 100644 arch/powerpc/mm/kasan/Makefile
 create mode 100644 arch/powerpc/mm/kasan/kasan_init_32.c
 rename arch/powerpc/mm/{40x_mmu.c =3D> nohash/40x.c} (99%)
 rename arch/powerpc/mm/{44x_mmu.c =3D> nohash/44x.c} (99%)
 rename arch/powerpc/mm/{8xx_mmu.c =3D> nohash/8xx.c} (92%)
 create mode 100644 arch/powerpc/mm/nohash/Makefile
 rename arch/powerpc/mm/{hugetlbpage-book3e.c =3D> nohash/book3e_hugetlbpag=
e.c} (93%)
 rename arch/powerpc/mm/{pgtable-book3e.c =3D> nohash/book3e_pgtable.c} (93=
%)
 rename arch/powerpc/mm/{fsl_booke_mmu.c =3D> nohash/fsl_booke.c} (99%)
 rename arch/powerpc/mm/{mmu_context_nohash.c =3D> nohash/mmu_context.c} (9=
9%)
 rename arch/powerpc/mm/{tlb_nohash.c =3D> nohash/tlb.c} (98%)
 rename arch/powerpc/mm/{tlb_nohash_low.S =3D> nohash/tlb_low.S} (100%)
 rename arch/powerpc/mm/{ =3D> nohash}/tlb_low_64e.S (97%)
 create mode 100644 arch/powerpc/perf/generic-compat-pmu.c
 create mode 100644 arch/powerpc/perf/internal.h
 create mode 100644 drivers/misc/ocxl/core.c
 create mode 100644 drivers/misc/ocxl/mmio.c
 create mode 100644 tools/testing/selftests/powerpc/copyloops/asm/kasan.h
 create mode 100644 tools/testing/selftests/powerpc/signal/sigfuz.c
-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJc1WwkAAoJEFHr6jzI4aWANQgP/2RYeiPkwLHLaSzLug+hfKC9
lT0SdKT4nMcxZaT74FpYLpKihu5WaWO4Cye2UMNTZGR5ZeX7sOtTJJtGB9cHBs8s
/nXFunaaDI0R8qU73rRWezDGJ2iqQAfZb5eUIMByENM/paD7AIyeQjpC2ZLHJCVM
f4Yts/1dp7kdqiIZ0DOmeS1fqUSC6pRTZmZK34e5ALGuUUal7QIdQ406yjxszndW
cM09rS92skIXveHtABKvMetpezFt78aAv8Gq7OhJyR8ffos2/f7rXLi9F1Flg1o3
nQwtTy+SukTYqdYOukdVVJeRcHKnKyY0YyCj/5sVmLw9DFhLCzYdeSanSxT+O3zh
U/gXuH1AYL8dcKgOD9iEhzjISyeM5VXLxjaT7jAaltoVz/KXIDYLuWjVAjpwvLyv
ZFyGmDLQkvg2uoiaamdPBlTavx6x7PpoUyYuMxdznK4zkAB9be9Y5sG8bVlh0qeV
DsCiiecRbXt8Xp48rIfO483B7xaH2DKvFOnXR4AnWFFe+oUlpjnbELmJUryMxvmz
4Yv9sAgLl/6BGTe57HXAKGtzUUnRJXivnrelWrEz/jDk2x9vCgDfG4QFQNXt/acT
tATwAJWAMUklVXC6FwSjC7m344jzkGBeImINAX9rydwscljUgEgBX9dI4BMaJQij
XXnj5AMLik9Ka4i0i/jN
=3Dcuou
-----END PGP SIGNATURE-----
