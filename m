Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDFAB90A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 15:27:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZZJZ3tKtzF3Sh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 23:27:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZZCN3xFvzF3QL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 23:22:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="D1ZV1XBh"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46ZZCK1cbKz9sNf;
 Fri, 20 Sep 2019 23:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568985775;
 bh=ABVS1pY1G/YlrbzGFJM8FleioQ5yfEHd8knfNOllPmg=;
 h=From:To:Cc:Subject:Date:From;
 b=D1ZV1XBhilXabmPd87Pc0hM/BwNE9Pou+rE8F3t6CUnwFSsG6weGo5iadicemzH/H
 i0JcJ8REljkmoA0x1QLxQJBeQM4KJQuv8+H9u+hjaHwgQmr8qdvoNyh3CvPtSlgVDg
 LjwP5wjrTnJiM3mB6DDDbJ7hykEsyqMC6V8sjmBzmIySYxj/eRGFGmJF93luftBf6/
 JrzhiXwH/vScz21QKRDmj3TqFqe1aDDojZ8Y1VoiJpheqg/fEVs6RVgrpdkvWUX0lV
 77IIu0E12vTMwownoJLq785s+hosnGmk/H6Bg8RGxYuO+qPRcbhnN8cLfjiKQlTeom
 DZNA3gYvf2yIQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.4-1 tag
Date: Fri, 20 Sep 2019 23:22:50 +1000
Message-ID: <87blvft845.fsf@mpe.ellerman.id.au>
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
Cc: ego@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com, adam.zerella@gmail.com,
 aik@ozlabs.ru, linuxram@us.ibm.com, maxiwell@linux.ibm.com,
 gromero@linux.vnet.ibm.com, yamada.masahiro@socionext.com, oohall@gmail.com,
 hbathini@linux.vnet.ibm.com, sukadev@linux.ibm.com, hch@lst.de,
 khandual@linux.vnet.ibm.com, hegdevasant@linux.vnet.ibm.com,
 santosh@fossix.org, aneesh.kumar@linux.ibm.com, ganeshgr@linux.ibm.com,
 jniethe5@gmail.com, tyreld@linux.ibm.com, leonardo@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 nathanl@linux.ibm.com, ravi.bangoria@linux.ibm.com, ajd@linux.ibm.com,
 andmike@linux.ibm.com, groug@kaod.org, npiggin@gmail.com, cai@lca.pw,
 clg@kaod.org, rostedt@goodmis.org, natechancellor@gmail.com,
 arbab@linux.ibm.com, hbathini@linux.ibm.com, dja@axtens.net,
 gromero@linux.ibm.com, sbobroff@linux.ibm.com, cmr@informatik.wtf,
 cclaudio@linux.ibm.com, linux-kernel@vger.kernel.org, grimm@linux.vnet.ibm.com,
 jsavitz@redhat.com, stewart@linux.ibm.com, christophe.jaillet@wanadoo.fr,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.4.

This is a bit late, partly due to me travelling, and partly due to a power
outage knocking out some of my test systems *while* I was travelling.

A few conflicts this time unfortunately. The key one is the silent conflict=
 with
the dma-mapping tree. You need to delete our copy of atomic_pool_init() and=
 the
postcore_initcall() that calls it in arch/powerpc/mm/dma-noncoherent.c

In arch/Kconfig, ARCH_HAS_MEM_ENCRYPT and RELR both went in via separate pa=
ths,
we just want to take both sides of the conflict.

In book3s_64_vio.c and book3s_64_vio_hv.c Paul and I both merged the same f=
ix,
and then I merged another patch on top, leading to a conflict. The resoluti=
on is
to take the "goto invalidate_exit" cases.

I've pushed the result of my merge to the v5.4-merge branch if there's any
doubt.

There's also a few out of area changes. The extable changes are due to
49ec9177b8ec ("extable: Add function to search only kernel exception table"=
).

The move of ARCH_HAS_MEM_ENCRYPT into arch/Kconfig & related cleanups are
responsible for all the changes under arch, as well as fs/proc/vmcore.c,
crash_dump.h, mem_encrypt.h, and kernel/dma/(mapping|swiotlb).c.

And the kernel/trace/fgraph.c change was acked by Steve.

cheers


The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.4-1

for you to fetch changes up to d9101bfa6adc831bda8836c4d774820553c14942:

  powerpc/mm/mce: Keep irqs disabled during lockless page table walk (2019-=
09-19 21:24:59 +1000)


- ------------------------------------------------------------------
powerpc updates for 5.4

 - Initial support for running on a system with an Ultravisor, which is sof=
tware
   that runs below the hypervisor and protects guests against some attacks =
by
   the hypervisor.

 - Support for building the kernel to run as a "Secure Virtual Machine", ie=
. as
   a guest capable of running on a system with an Ultravisor.

 - Some changes to our DMA code on bare metal, to allow devices with medium
   sized DMA masks (> 32 && < 59 bits) to use more than 2GB of DMA space.

 - Support for firmware assisted crash dumps on bare metal (powernv).

 - Two series fixing bugs in and refactoring our PCI EEH code.

 - A large series refactoring our exception entry code to use gas macros, b=
oth
   to make it more readable and also enable some future optimisations.

As well as many cleanups and other minor features & fixups.

Thanks to:
  Adam Zerella, Alexey Kardashevskiy, Alistair Popple, Andrew Donnellan, An=
eesh
  Kumar K.V, Anju T Sudhakar, Anshuman Khandual, Balbir Singh, Benjamin
  Herrenschmidt, C=C3=A9dric Le Goater, Christophe JAILLET, Christophe Lero=
y,
  Christopher M. Riedl, Christoph Hellwig, Claudio Carvalho, Daniel Axtens,
  David Gibson, David Hildenbrand, Desnes A. Nunes do Rosario, Ganesh Gouda=
r,
  Gautham R. Shenoy, Greg Kurz, Guerney Hunt, Gustavo Romero, Halil Pasic, =
Hari
  Bathini, Joakim Tjernlund, Jonathan Neuschafer, Jordan Niethe, Leonardo B=
ras,
  Lianbo Jiang, Madhavan Srinivasan, Mahesh Salgaonkar, Mahesh Salgaonkar,
  Masahiro Yamada, Maxiwell S. Garcia, Michael Anderson, Nathan Chancellor,
  Nathan Lynch, Naveen N. Rao, Nicholas Piggin, Oliver O'Halloran, Qian Cai=
, Ram
  Pai, Ravi Bangoria, Reza Arbab, Ryan Grimm, Sam Bobroff, Santosh Sivaraj,
  Segher Boessenkool, Sukadev Bhattiprolu, Thiago Bauermann, Thiago Jung
  Bauermann, Thomas Gleixner, Tom Lendacky, Vasant Hegde.

- ------------------------------------------------------------------
Adam Zerella (1):
      docs: powerpc: Add missing documentation reference

Alexey Kardashevskiy (11):
      powerpc/powernv/ioda: Fix race in TCE level allocation
      powerpc/iommu: Allow bypass-only for DMA
      powerpc/powernv/ioda2: Allocate TCE table levels on demand for defaul=
t DMA window
      powerpc/powernv/ioda2: Create bigger default window with 64k IOMMU pa=
ges
      powerpc/of/pci: Rewrite pci_parse_of_flags
      KVM: PPC: Book3S: Fix incorrect guest-to-user-translation error handl=
ing
      powerpc/powernv/ioda: Split out TCE invalidation from TCE updates
      KVM: PPC: Book3S: Invalidate multiple TCEs at once
      vfio/spapr_tce: Invalidate multiple TCEs at once
      powerpc/pseries/iommu: Switch to xchg_no_kill
      powerpc/powernv/ioda: Remove obsolete iommu_table_ops::exchange callb=
acks

Andrew Donnellan (6):
      powerpc/powernv: Move SCOM access code into powernv platform
      powerpc/powernv: Remove dead SCOM access code
      powerpc/powernv: Get rid of old scom_controller abstraction
      powerpc/powernv: Fix checkpatch warnings in opal-xscom.c
      powerpc/configs: Disable SCOM_DEBUGFS in powernv_defconfig
      powerpc/powernv: Restrict OPAL symbol map to only be readable by root

Aneesh Kumar K.V (1):
      powerpc/mm/mce: Keep irqs disabled during lockless page table walk

Anshuman Khandual (3):
      powerpc/pseries/svm: Use shared memory for LPPACA structures
      powerpc/pseries/svm: Use shared memory for Debug Trace Log (DTL)
      powerpc/pseries/svm: Force SWIOTLB for secure guests

Balbir Singh (3):
      powerpc/mce: Fix MCE handling for huge pages
      powerpc/mce: Handle UE event for memcpy_mcsafe
      powerpc/memcpy: Add memcpy_mcsafe for pmem

Benjamin Herrenschmidt (1):
      powerpc: Add support for adding an ESM blob to the zImage wrapper

Christoph Hellwig (3):
      powerpc: remove the ppc44x ocm.c file
      powerpc: use the generic dma coherent remap allocator
      powerpc/powernv: Remove unused pnv_npu_try_dma_set_bypass() function

Christophe JAILLET (2):
      powerpc/xive: Use GFP_KERNEL instead of GFP_ATOMIC in 'xive_irq_bitma=
p_add()'
      powerpc/xive: Add a check for memory allocation failure

Christophe Leroy (43):
      powerpc/32: activate ARCH_HAS_PMEM_API and ARCH_HAS_UACCESS_FLUSHCACHE
      powerpc/ptdump: Fix addresses display on PPC32
      powerpc/ptdump: fix walk_pagetables() address mismatch
      powerpc/ptdump: drop dummy KERN_VIRT_START on PPC32
      powerpc/ptdump: get out of note_prot_wx() when CONFIG_PPC_DEBUG_WX is=
 not selected.
      powerpc/ptdump: drop non vital #ifdefs
      powerpc/hw_breakpoint: move instruction stepping out of hw_breakpoint=
_handler()
      powerpc/kasan: Fix parallel loading of modules.
      powerpc/kasan: Fix shadow area set up for modules.
      powerpc/futex: Fix warning: 'oldval' may be used uninitialized in thi=
s function
      powerpc/32s: Fix boot failure with DEBUG_PAGEALLOC without KASAN.
      powerpc/mm: don't display empty early ioremap area
      powerpc/mm: define empty update_mmu_cache() as static inline
      powerpc/mm: move FSL_BOOK3 version of update_mmu_cache()
      powerpc/mm: move update_mmu_cache() into book3s hash utils.
      powerpc/mm: Simplify update_mmu_cache() on BOOK3S32
      powerpc/mm: ppc 603 doesn't need update_mmu_cache()
      powerpc/32: Add warning on misaligned copy_page() or clear_page()
      powerpc/603: Fix handling of the DIRTY flag
      powerpc/64: don't select ARCH_HAS_SCALED_CPUTIME on book3E
      powerpc/ps3: replace __ioremap() by ioremap_prot()
      powerpc/mm: drop ppc_md.iounmap() and __iounmap()
      powerpc/mm: drop function __ioremap()
      powerpc/mm: rework io-workaround invocation.
      powerpc/mm: move common 32/64 bits ioremap functions into ioremap.c
      powerpc/mm: move ioremap_prot() into ioremap.c
      powerpc/mm: make ioremap_bot common to all
      powerpc/mm: Move ioremap functions out of pgtable_32/64.c
      powerpc/mm: refactor ioremap_range() and use ioremap_page_range()
      powerpc/mm: refactor ioremap vm area setup.
      powerpc/mm: split out early ioremap path.
      powerpc: rewrite LOAD_REG_IMMEDIATE() as an intelligent macro
      powerpc/32: replace LOAD_MSR_KERNEL() by LOAD_REG_IMMEDIATE()
      powerpc/64: optimise LOAD_REG_IMMEDIATE_SYM()
      powerpc/prom: convert PROM_BUG() to standard trap
      powerpc/8xx: drop unused self-modifying code alternative to FixupDAR.
      powerpc/8xx: set STACK_END_MAGIC earlier on the init_stack
      powerpc/32s: add an option to exclusively select powerpc 601
      powerpc/32s: get rid of CPU_FTR_601 feature
      powerpc/32s: drop CPU_FTR_USE_RTC feature
      powerpc/32s: use CONFIG_PPC_BOOK3S_601 instead of reading PVR
      powerpc/32: drop CPU_FTR_UNIFIED_ID_CACHE
      powerpc/32: don't use CPU_FTR_COHERENT_ICACHE

Christopher M. Riedl (4):
      powerpc/64s: support nospectre_v2 cmdline option
      powerpc/spinlocks: Refactor SHARED_PROCESSOR
      powerpc/spinlocks: Rename SPLPAR-only spinlocks
      powerpc/spinlocks: Fix oops in __spin_yield() on bare metal

Claudio Carvalho (7):
      powerpc: Add PowerPC Capabilities ELF note
      powerpc/kernel: Add ucall_norets() ultravisor call handler
      powerpc/powernv: Introduce FW_FEATURE_ULTRAVISOR
      powerpc/mm: Write to PTCR only if ultravisor disabled
      powerpc/powernv: Access LDBAR only if ultravisor disabled
      powerpc/powernv/opal-msglog: Refactor memcons code
      powerpc/powernv: Add ultravisor message log interface

C=C3=A9dric Le Goater (5):
      powerpc/xmon: Check for HV mode when dumping XIVE info from OPAL
      powerpc/xive: Fix dump of XIVE interrupt under pseries
      powerpc/xmon: Add a dump of all XIVE interrupts
      powerpc/xmon: Improve output of XIVE interrupts
      powerpc/xmon: Fix output of XIVE IPI

Daniel Axtens (1):
      powerpc/configs: Disable /dev/port in skiroot defconfig

Ganesh Goudar (1):
      powerpc: dump kernel log before carrying out fadump or kdump

Gautham R. Shenoy (1):
      powerpc/pseries: Fix cpu_hotplug_lock acquisition in resize_hpt()

Greg Kurz (1):
      powerpc/xive: Fix bogus error code returned by OPAL

Gustavo Romero (4):
      powerpc: Document xmon options
      selftests/powerpc: Ignore generated files
      selftests/powerpc: Fix and enhance TM signal context tests
      selftests/powerpc: Retry on host facility unavailable

Hari Bathini (36):
      powerpc/fadump: move internal macros/definitions to a new header
      powerpc/fadump: add helper functions
      powerpc/fadump: declare helper functions in internal header file
      powerpc/fadump: Improve fadump documentation
      powerpc/fadump: use helper functions to reserve/release cpu notes buf=
fer
      powerpc/fadump: move rtas specific definitions to platform code
      powerpc/fadump: introduce callbacks for platform specific operations
      pseries/fadump: define RTAS register/un-register callback functions
      powerpc/fadump: add source info while displaying region contents
      powerpc/fadump: release all the memory above boot memory size
      pseries/fadump: move out platform specific support from generic code
      powerpc/fadump: use FADump instead of fadump for how it is pronounced
      powerpc/opal: add MPIPL interface definitions
      powerpc/fadump: add fadump support on powernv
      powerpc/fadump: improve fadump_reserve_mem()
      powerpc/fadump: register kernel metadata address with opal
      powerpc/fadump: reset metadata address during clean up
      powerpc/fadump: define OPAL register/un-register callback functions
      powerpc/fadump: support copying multiple kernel boot memory regions
      powerpc/fadump: process the crashdump by exporting it as /proc/vmcore
      powerpc/fadump: Warn before processing partial crashdump
      powerpc/fadump: handle invalidation of crashdump and re-registraion
      powerpc/fadump: Update documentation about OPAL platform support
      powerpc/fadump: make use of memblock's bottom up allocation mode
      powerpc/fadump: process architected register state data provided by f=
irmware
      powerpc/fadump: make crash memory ranges array allocation generic
      powerpc/fadump: consider reserved ranges while releasing memory
      powerpc/fadump: improve how crashed kernel's memory is reserved
      powerpc/fadump: add support to preserve crash data on FADUMP disabled=
 kernel
      powerpc/fadump: update documentation about CONFIG_PRESERVE_FA_DUMP
      powerpc/opalcore: export /sys/firmware/opal/core for analysing opal c=
rashes
      powerpc/opalcore: provide an option to invalidate /sys/firmware/opal/=
core file
      powerpc/fadump: consider f/w load area
      powerpc/fadump: update documentation about option to release opalcore
      powerpc/fadump: remove RMA_START and RMA_END macros
      powerpc/fadump: support holes in kernel boot memory area

Jordan Niethe (2):
      powerpc/xive: Update comment referencing magic loads from an ESB
      powerpc: Remove empty comment

Leonardo Bras (1):
      powerpc/pseries/hotplug-memory.c: Replace nested ifs by switch-case

Madhavan Srinivasan (1):
      powerpc/imc: Dont create debugfs files for cpu-less nodes

Masahiro Yamada (2):
      powerpc: remove meaningless KBUILD_ARFLAGS addition
      powerpc: improve prom_init_check rule

Maxiwell S. Garcia (1):
      Documentation/powerpc: Add ELF note documentation

Michael Anderson (1):
      powerpc/mm: Use UV_WRITE_PATE ucall to register a PATE

Michael Ellerman (11):
      Merge branch 'fixes' into next
      Merge branch 'topic/ppc-kvm' into next
      Merge branch 'topic/mem-encrypt' into next
      Merge branch 'topic/ppc-kvm' into next
      powerpc/64s/exceptions: Use keyword params to shorten arg lists
      powerpc/eeh: Fix build with STACKTRACE=3Dn
      powerpc/powernv: Fix build with IOMMU_API=3Dn
      powerpc/kvm: Move kvm_tmp into .text, shrink to 64K
      powerpc/64s: Remove overlaps_kvm_tmp()
      powerpc/kvm: Explicitly mark kvm guest code as __init
      powerpc/kvm: Add ifdefs around template code

Nathan Chancellor (1):
      PCI: rpaphp: Avoid a sometimes-uninitialized warning

Nathan Lynch (5):
      powerpc/rtas: Unexport rtas_online_cpus_mask, rtas_offline_cpus_mask
      powerpc/rtas: use device model APIs and serialization during LPM
      powerpc/rtas: allow rescheduling while changing cpu states
      powerpc/pseries/mobility: use cond_resched when updating device tree
      powerpc/pseries: correctly track irq state in default idle

Naveen N. Rao (3):
      ftrace: Look up the address of return_to_handler() using helpers
      powerpc/ftrace: Enable HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
      powerpc: Use ftrace_graph_ret_addr() when unwinding

Nicholas Piggin (51):
      powerpc/64s: Make boot look nice(r)
      powerpc/64: allow compiler to cache 'current'
      powerpc/64s/radix: Fix memory hotplug section page table creation
      powerpc/64s/radix: Fix memory hot-unplug page table split
      powerpc/perf: fix imc allocation failure handling
      powerpc/64: Add VIRTUAL_BUG_ON checks for __va and __pa addresses
      powerpc/64s/radix: Remove redundant pfn_pte bitop, add VM_BUG_ON
      powerpc: convert to copy_thread_tls
      powerpc/64: remove support for kernel-mode syscalls
      powerpc/64s/exception: machine check fwnmi remove HV case
      powerpc/64s/exception: machine check remove bitrotted comment
      powerpc/64s/exception: machine check fix KVM guest test
      powerpc/64s/exception: machine check adjust RFI target
      powerpc/64s/exception: machine check pseries should always run the ea=
rly handler
      powerpc/64s/exception: machine check remove machine_check_pSeries_0 b=
ranch
      powerpc/64s/exception: machine check use correct cfar for late handler
      powerpc/64s/powernv: machine check dump SLB contents
      powerpc/64s/pseries: machine check convert to use common event code
      powerpc/64s/exception: machine check pseries should skip the late han=
dler for kernel MCEs
      powerpc/64s/exception: machine check restructure to reuse common macr=
os
      powerpc/64s/exception: machine check move tramp code
      powerpc/64s/exception: simplify machine check early path
      powerpc/64s/exception: machine check move unrecoverable handling out =
of line
      powerpc/64s/exception: untangle early machine check handler branch
      powerpc/64s/exception: machine check improve labels and comments
      powerpc/64s/exception: Fix DAR load for handle_page_fault error case
      powerpc/64s/exception: move head-64.h exception code to exception-64s=
.S
      powerpc/64s/exception: Add EXC_HV_OR_STD, which selects HSRR if HVMODE
      powerpc/64s/exception: Fix performance monitor virt handler
      powerpc/64s/exception: remove 0xb00 handler
      powerpc/64s/exception: Replace PROLOG macros and EXC helpers with a g=
as macro
      powerpc/64s/exception: remove EXCEPTION_PROLOG_0/1, rename _2
      powerpc/64s/exception: Add the virt variant of the denorm interrupt h=
andler
      powerpc/64s/exception: INT_HANDLER support HDAR/HDSISR and use it in =
HDSI
      powerpc/64s/exception: Add INT_KVM_HANDLER gas macro
      powerpc/64s/exception: KVM_HANDLER reorder arguments to match other m=
acros
      powerpc/64s/exception: Merge EXCEPTION_PROLOG_COMMON_2/3
      powerpc/64s/exception: Add INT_COMMON gas macro to generate common ex=
ception code
      powerpc/64s/exception: Expand EXCEPTION_COMMON macro into caller
      powerpc/64s/exception: Expand EXCEPTION_PROLOG_COMMON_1 and 2 into ca=
ller
      powerpc/64s/exception: INT_COMMON add DAR, DSISR, reconcile options
      powerpc/64s/exception: move interrupt entry code above the common han=
dler
      powerpc/64s/exception: program check handler do not branch into a mac=
ro
      powerpc/64s/exception: Remove pointless KVM handler name bifurcation
      powerpc/64s/exception: reduce page fault unnecessary loads
      powerpc/64s: remove register_process_table callback
      powerpc/64s/radix: tidy up TLB flushing code
      powerpc/64s: make mmu_partition_table_set_entry TLB flush optional
      powerpc/64s/pseries: radix flush translations before MMU is enabled a=
t boot
      powerpc/64s: remove unnecessary translation cache flushes at boot
      powerpc/64s/radix: introduce options to disable use of the tlbie inst=
ruction

Oliver O'Halloran (15):
      powerpc/eeh: Add bdfn field to eeh_dev
      powerpc/eeh: Clean up EEH PEs after recovery finishes
      powerpc/eeh: Fix race when freeing PDNs
      powerpc/eeh: Make permanently failed devices non-actionable
      powerpc/eeh: Check slot presence state in eeh_handle_normal_event()
      powerpc/eeh: Defer printing stack trace
      powerpc/eeh: Remove stale CAPI comment
      powernv/eeh: Use generic code to handle hot resets
      pci-hotplug/pnv_php: Add a reset_slot() callback
      pci-hotplug/pnv_php: Add support for IODA3 Power9 PHBs
      pci-hotplug/pnv_php: Add attention indicator support
      powerpc/eeh: Set attention indicator while recovering
      powerpc/eeh: Add debugfs interface to run an EEH check
      powerpc/eeh: Add a eeh_dev_break debugfs interface
      selftests/powerpc: Add basic EEH selftest

Qian Cai (1):
      powerpc/mm/radix: remove useless kernel messages

Ram Pai (3):
      powerpc/prom_init: Add the ESM call to prom_init
      powerpc/pseries/svm: Add helpers for UV_SHARE_PAGE and UV_UNSHARE_PAGE
      powerpc/pseries/svm: Unshare all pages before kexecing a new kernel

Ravi Bangoria (1):
      powerpc/watchpoint: Disable watchpoint hit by larx/stcx instructions

Reza Arbab (1):
      powerpc/mce: Make machine_check_ue_event() static

Ryan Grimm (2):
      powerpc/pseries/svm: Export guest SVM status to user space via sysfs
      powerpc/configs: Enable secure guest support in pseries and ppc64 def=
configs

Sam Bobroff (11):
      powerpc/64: Adjust order in pcibios_init()
      powerpc/eeh: Clear stale EEH_DEV_NO_HANDLER flag
      powerpc/eeh: Improve debug messages around device addition
      powerpc/eeh: Initialize EEH address cache earlier
      powerpc/eeh: EEH for pSeries hot plug
      powerpc/eeh: Refactor around eeh_probe_devices()
      powerpc/eeh: Introduce EEH edev logging macros
      powerpc/eeh: Convert log messages to eeh_edev_* macros
      powerpc/eeh: Fix crash when edev->pdev changes
      powerpc/eeh: Remove unused return path from eeh_pe_dev_traverse()
      powerpc/eeh: Slightly simplify eeh_add_to_parent_pe()

Santosh Sivaraj (5):
      powerpc/mce: Schedule work from irq_work
      extable: Add function to search only kernel exception table
      powerpc: add machine check safe copy_to_user
      powerpc/memcpy: Fix stack corruption for smaller sizes
      seltests/powerpc: Add a selftest for memcpy_mcsafe

Segher Boessenkool (1):
      powerpc: Add attributes for setjmp/longjmp

Sukadev Bhattiprolu (4):
      Documentation/powerpc: Ultravisor API
      powerpc/kvm: Use UV_RETURN ucall to return to ultravisor
      powerpc: Introduce the MSR_S bit
      powerpc/pseries/svm: Disable doorbells in SVM guests

Thiago Jung Bauermann (9):
      x86, s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig
      swiotlb: Remove call to sme_active()
      dma-mapping: Remove dma_check_mask()
      x86, s390/mm: Move sme_active() and sme_me_mask to x86-specific header
      fs/core/vmcore: Move sev_active() reference to x86 arch code
      s390/mm: Remove sev_active() function
      powerpc/pseries: Introduce option to build secure virtual machines
      powerpc/pseries: Add and use LPPACA_SIZE constant
      powerpc/pseries/iommu: Don't use dma_iommu_ops on secure guests

Vasant Hegde (2):
      powerpc/powernv: Enhance opal message read interface
      powerpc/powernv: Add new opal message type


 Documentation/ABI/testing/sysfs-devices-system-cpu             |   10 +
 Documentation/admin-guide/kernel-parameters.txt                |   28 +
 Documentation/powerpc/elfnote.rst                              |   41 +
 Documentation/powerpc/firmware-assisted-dump.rst               |  220 ++-
 Documentation/powerpc/index.rst                                |    2 +
 Documentation/powerpc/ultravisor.rst                           | 1054 ++++=
+++++++++
 arch/Kconfig                                                   |    3 +
 arch/powerpc/Kconfig                                           |   43 +-
 arch/powerpc/Makefile                                          |    1 -
 arch/powerpc/boot/main.c                                       |   41 +
 arch/powerpc/boot/ops.h                                        |    2 +
 arch/powerpc/boot/wrapper                                      |   24 +-
 arch/powerpc/boot/zImage.lds.S                                 |    8 +
 arch/powerpc/configs/pmac32_defconfig                          |    1 -
 arch/powerpc/configs/powernv_defconfig                         |    2 +-
 arch/powerpc/configs/ppc40x_defconfig                          |    1 -
 arch/powerpc/configs/ppc64_defconfig                           |    1 +
 arch/powerpc/configs/pseries_defconfig                         |    1 +
 arch/powerpc/configs/skiroot_defconfig                         |    1 +
 arch/powerpc/include/asm/asm-prototypes.h                      |   14 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h                   |   18 +-
 arch/powerpc/include/asm/book3s/64/mmu.h                       |    4 -
 arch/powerpc/include/asm/book3s/64/pgtable.h                   |    8 +-
 arch/powerpc/include/asm/book3s/64/radix.h                     |    3 -
 arch/powerpc/include/asm/book3s/64/tlbflush-radix.h            |   12 +-
 arch/powerpc/include/asm/book3s/64/tlbflush.h                  |    9 +
 arch/powerpc/include/asm/book3s/pgtable.h                      |   11 +
 arch/powerpc/include/asm/bug.h                                 |    8 -
 arch/powerpc/include/asm/cputable.h                            |   20 +-
 arch/powerpc/include/asm/current.h                             |    3 +-
 arch/powerpc/include/asm/eeh.h                                 |   40 +-
 arch/powerpc/include/asm/elfnote.h                             |   24 +
 arch/powerpc/include/asm/fadump-internal.h                     |  169 ++
 arch/powerpc/include/asm/fadump.h                              |  194 +--
 arch/powerpc/include/asm/firmware.h                            |    5 +-
 arch/powerpc/include/asm/ftrace.h                              |    2 +
 arch/powerpc/include/asm/futex.h                               |    3 +-
 arch/powerpc/include/asm/head-64.h                             |   41 -
 arch/powerpc/include/asm/hugetlb.h                             |    3 -
 arch/powerpc/include/asm/io-workarounds.h                      |   20 +
 arch/powerpc/include/asm/io.h                                  |   16 +-
 arch/powerpc/include/asm/iommu.h                               |   28 +-
 arch/powerpc/include/asm/kvm_host.h                            |    1 +
 arch/powerpc/include/asm/machdep.h                             |    7 -
 arch/powerpc/include/asm/mce.h                                 |   10 +-
 arch/powerpc/include/asm/mem_encrypt.h                         |   26 +
 arch/powerpc/include/asm/mmu.h                                 |    2 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h                   |   18 +-
 arch/powerpc/include/asm/nohash/64/pgtable.h                   |    1 +
 arch/powerpc/include/asm/nohash/pgtable.h                      |   13 +
 arch/powerpc/include/asm/opal-api.h                            |   45 +-
 arch/powerpc/include/asm/opal.h                                |    7 +-
 arch/powerpc/include/asm/page.h                                |   14 +-
 arch/powerpc/include/asm/page_32.h                             |    4 +
 arch/powerpc/include/asm/pci-bridge.h                          |    1 +
 arch/powerpc/include/asm/pgtable.h                             |   14 +-
 arch/powerpc/include/asm/plpar_wrappers.h                      |    6 +
 arch/powerpc/include/asm/ppc-pci.h                             |    7 +-
 arch/powerpc/include/asm/ppc4xx_ocm.h                          |   31 -
 arch/powerpc/include/asm/ppc_asm.h                             |   80 +-
 arch/powerpc/include/asm/ptrace.h                              |    6 +-
 arch/powerpc/include/asm/reg.h                                 |    3 +
 arch/powerpc/include/asm/scom.h                                |  154 --
 arch/powerpc/include/asm/sections.h                            |   11 -
 arch/powerpc/include/asm/setjmp.h                              |    4 +-
 arch/powerpc/include/asm/spinlock.h                            |   62 +-
 arch/powerpc/include/asm/string.h                              |    2 +
 arch/powerpc/include/asm/svm.h                                 |   31 +
 arch/powerpc/include/asm/time.h                                |    6 +-
 arch/powerpc/include/asm/timex.h                               |   34 +-
 arch/powerpc/include/asm/uaccess.h                             |   14 +
 arch/powerpc/include/asm/ultravisor-api.h                      |   33 +
 arch/powerpc/include/asm/ultravisor.h                          |   49 +
 arch/powerpc/include/asm/xive.h                                |    1 +
 arch/powerpc/kernel/.gitignore                                 |    1 +
 arch/powerpc/kernel/Makefile                                   |   23 +-
 arch/powerpc/kernel/asm-offsets.c                              |    1 +
 arch/powerpc/kernel/cputable.c                                 |    6 +-
 arch/powerpc/kernel/dma-iommu.c                                |   11 +-
 arch/powerpc/kernel/eeh.c                                      |  281 +++-
 arch/powerpc/kernel/eeh_cache.c                                |   37 +-
 arch/powerpc/kernel/eeh_dev.c                                  |    2 +
 arch/powerpc/kernel/eeh_driver.c                               |  280 +++-
 arch/powerpc/kernel/eeh_event.c                                |   34 +-
 arch/powerpc/kernel/eeh_pe.c                                   |  145 +-
 arch/powerpc/kernel/entry_32.S                                 |   40 +-
 arch/powerpc/kernel/entry_64.S                                 |   21 +-
 arch/powerpc/kernel/exceptions-64e.S                           |   22 +-
 arch/powerpc/kernel/exceptions-64s.S                           | 1644 ++++=
++++++----------
 arch/powerpc/kernel/fadump.c                                   | 1340 ++++=
+++---------
 arch/powerpc/kernel/head_32.S                                  |   55 +-
 arch/powerpc/kernel/head_32.h                                  |   21 +-
 arch/powerpc/kernel/head_64.S                                  |    8 +-
 arch/powerpc/kernel/head_8xx.S                                 |   28 +-
 arch/powerpc/kernel/hw_breakpoint.c                            |   77 +-
 arch/powerpc/kernel/io-workarounds.c                           |   13 +-
 arch/powerpc/kernel/iommu.c                                    |   97 +-
 arch/powerpc/kernel/kvm.c                                      |   58 +-
 arch/powerpc/kernel/kvm_emul.S                                 |   16 +
 arch/powerpc/kernel/machine_kexec_64.c                         |    9 +
 arch/powerpc/kernel/mce.c                                      |   71 +-
 arch/powerpc/kernel/mce_power.c                                |   50 +-
 arch/powerpc/kernel/misc_32.S                                  |   36 +-
 arch/powerpc/kernel/note.S                                     |   40 +
 arch/powerpc/kernel/paca.c                                     |   52 +-
 arch/powerpc/kernel/pci-common.c                               |    4 -
 arch/powerpc/kernel/pci-hotplug.c                              |    7 +
 arch/powerpc/kernel/pci_32.c                                   |    4 +
 arch/powerpc/kernel/pci_64.c                                   |   12 +-
 arch/powerpc/kernel/pci_dn.c                                   |   21 +-
 arch/powerpc/kernel/pci_of_scan.c                              |   66 +-
 arch/powerpc/kernel/process.c                                  |   28 +-
 arch/powerpc/kernel/prom.c                                     |    8 +-
 arch/powerpc/kernel/prom_init.c                                |   98 +-
 arch/powerpc/kernel/rtas.c                                     |   15 +-
 arch/powerpc/kernel/security.c                                 |   19 +-
 arch/powerpc/kernel/setup-common.c                             |    8 +-
 arch/powerpc/kernel/setup_32.c                                 |    2 +-
 arch/powerpc/kernel/stacktrace.c                               |    2 +-
 arch/powerpc/kernel/sysfs.c                                    |   20 +
 arch/powerpc/kernel/trace/ftrace.c                             |    5 +-
 arch/powerpc/kernel/trace/ftrace_32.S                          |    1 +
 arch/powerpc/kernel/trace/ftrace_64_mprofile.S                 |    1 +
 arch/powerpc/kernel/trace/ftrace_64_pg.S                       |    1 +
 arch/powerpc/kernel/traps.c                                    |    1 +
 arch/powerpc/kernel/ucall.S                                    |   14 +
 arch/powerpc/kernel/vdso.c                                     |   22 -
 arch/powerpc/kernel/vdso32/datapage.S                          |    2 +
 arch/powerpc/kernel/vdso32/vdso32.lds.S                        |    4 +-
 arch/powerpc/kvm/book3s_64_vio.c                               |   29 +-
 arch/powerpc/kvm/book3s_64_vio_hv.c                            |   38 +-
 arch/powerpc/kvm/book3s_hv.c                                   |    6 +
 arch/powerpc/kvm/book3s_hv_nested.c                            |    4 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                        |   39 +-
 arch/powerpc/lib/Makefile                                      |    4 +-
 arch/powerpc/lib/locks.c                                       |    6 +-
 arch/powerpc/lib/memcpy_mcsafe_64.S                            |  242 +++
 arch/powerpc/mm/Makefile                                       |    2 +-
 arch/powerpc/mm/book3s32/mmu.c                                 |   60 +-
 arch/powerpc/mm/book3s64/hash_utils.c                          |   88 +-
 arch/powerpc/mm/book3s64/pgtable.c                             |  121 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c                       |   80 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                           |  303 ++--
 arch/powerpc/mm/dma-noncoherent.c                              |  318 +---
 arch/powerpc/mm/ioremap.c                                      |   99 ++
 arch/powerpc/mm/ioremap_32.c                                   |   92 ++
 arch/powerpc/mm/ioremap_64.c                                   |  113 ++
 arch/powerpc/mm/kasan/kasan_init_32.c                          |   23 +-
 arch/powerpc/mm/mem.c                                          |   66 +-
 arch/powerpc/mm/mmu_decl.h                                     |    7 +-
 arch/powerpc/mm/nohash/book3e_hugetlbpage.c                    |   16 +-
 arch/powerpc/mm/nohash/tlb.c                                   |    2 +
 arch/powerpc/mm/pgtable_32.c                                   |  155 +-
 arch/powerpc/mm/pgtable_64.c                                   |  203 +--
 arch/powerpc/mm/ptdump/bats.c                                  |    2 +-
 arch/powerpc/mm/ptdump/hashpagetable.c                         |   24 +-
 arch/powerpc/mm/ptdump/ptdump.c                                |   37 +-
 arch/powerpc/perf/imc-pmu.c                                    |   29 +-
 arch/powerpc/platforms/44x/Kconfig                             |    8 -
 arch/powerpc/platforms/4xx/Makefile                            |    1 -
 arch/powerpc/platforms/4xx/ocm.c                               |  390 -----
 arch/powerpc/platforms/Kconfig                                 |    3 +-
 arch/powerpc/platforms/Kconfig.cputype                         |   16 +-
 arch/powerpc/platforms/cell/iommu.c                            |    2 +-
 arch/powerpc/platforms/pasemi/iommu.c                          |    2 +-
 arch/powerpc/platforms/powernv/Kconfig                         |    5 +-
 arch/powerpc/platforms/powernv/Makefile                        |    6 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c                   |   97 +-
 arch/powerpc/platforms/powernv/idle.c                          |    6 +-
 arch/powerpc/platforms/powernv/npu-dma.c                       |  101 +-
 arch/powerpc/platforms/powernv/opal-call.c                     |    5 +-
 arch/powerpc/platforms/powernv/opal-core.c                     |  636 ++++=
++++
 arch/powerpc/platforms/powernv/opal-fadump.c                   |  716 ++++=
+++++
 arch/powerpc/platforms/powernv/opal-fadump.h                   |  146 ++
 arch/powerpc/platforms/powernv/opal-imc.c                      |   12 +-
 arch/powerpc/platforms/powernv/opal-msglog.c                   |   57 +-
 arch/powerpc/platforms/powernv/opal-prd.c                      |    8 +-
 arch/powerpc/platforms/powernv/opal-xscom.c                    |  213 ++-
 arch/powerpc/platforms/powernv/opal.c                          |   42 +-
 arch/powerpc/platforms/powernv/pci-ioda-tce.c                  |   38 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                      |   98 +-
 arch/powerpc/platforms/powernv/pci.c                           |    3 +-
 arch/powerpc/platforms/powernv/pci.h                           |    2 +-
 arch/powerpc/platforms/powernv/powernv.h                       |    5 +
 arch/powerpc/platforms/powernv/setup.c                         |    9 +
 arch/powerpc/platforms/powernv/ultravisor.c                    |   69 +
 arch/powerpc/platforms/ps3/spu.c                               |   10 +-
 arch/powerpc/platforms/pseries/Kconfig                         |   14 +
 arch/powerpc/platforms/pseries/Makefile                        |    2 +
 arch/powerpc/platforms/pseries/eeh_pseries.c                   |   68 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c                |   26 +-
 arch/powerpc/platforms/pseries/iommu.c                         |   24 +-
 arch/powerpc/platforms/pseries/lpar.c                          |   20 +-
 arch/powerpc/platforms/pseries/mobility.c                      |    9 +
 arch/powerpc/platforms/pseries/pci.c                           |    3 +-
 arch/powerpc/platforms/pseries/ras.c                           |  460 +++-=
--
 arch/powerpc/platforms/pseries/rtas-fadump.c                   |  550 ++++=
+++
 arch/powerpc/platforms/pseries/rtas-fadump.h                   |  114 ++
 arch/powerpc/platforms/pseries/setup.c                         |   32 +-
 arch/powerpc/platforms/pseries/smp.c                           |    3 +-
 arch/powerpc/platforms/pseries/svm.c                           |   85 +
 arch/powerpc/platforms/pseries/vio.c                           |    2 +-
 arch/powerpc/sysdev/Kconfig                                    |    7 -
 arch/powerpc/sysdev/Makefile                                   |    2 -
 arch/powerpc/sysdev/dart_iommu.c                               |    2 +-
 arch/powerpc/sysdev/scom.c                                     |  223 ---
 arch/powerpc/sysdev/xive/common.c                              |   59 +-
 arch/powerpc/sysdev/xive/native.c                              |   26 +
 arch/powerpc/sysdev/xive/spapr.c                               |   57 +-
 arch/powerpc/sysdev/xive/xive-internal.h                       |    2 +
 arch/powerpc/xmon/xmon.c                                       |   51 +-
 arch/s390/Kconfig                                              |    4 +-
 arch/s390/include/asm/mem_encrypt.h                            |    5 +-
 arch/s390/mm/init.c                                            |    7 +-
 arch/x86/Kconfig                                               |    4 +-
 arch/x86/include/asm/mem_encrypt.h                             |   10 +
 arch/x86/kernel/crash_dump_64.c                                |    5 +
 arch/x86/mm/mem_encrypt.c                                      |    2 -
 drivers/misc/cxl/main.c                                        |    4 +
 drivers/misc/ocxl/main.c                                       |    4 +
 drivers/pci/hotplug/pnv_php.c                                  |   59 +-
 drivers/pci/hotplug/rpaphp_core.c                              |   18 +-
 drivers/vfio/vfio_iommu_spapr_tce.c                            |   18 +-
 fs/proc/vmcore.c                                               |    8 +-
 include/linux/crash_dump.h                                     |   14 +
 include/linux/extable.h                                        |    2 +
 include/linux/mem_encrypt.h                                    |   15 +-
 kernel/dma/mapping.c                                           |    8 -
 kernel/dma/swiotlb.c                                           |    3 +-
 kernel/extable.c                                               |   11 +-
 kernel/trace/fgraph.c                                          |    4 +-
 tools/testing/selftests/powerpc/Makefile                       |    1 +
 tools/testing/selftests/powerpc/copyloops/.gitignore           |    9 +-
 tools/testing/selftests/powerpc/copyloops/Makefile             |    7 +-
 tools/testing/selftests/powerpc/copyloops/asm/export.h         |    1 +
 tools/testing/selftests/powerpc/copyloops/memcpy_mcsafe_64.S   |    1 +
 tools/testing/selftests/powerpc/eeh/Makefile                   |    9 +
 tools/testing/selftests/powerpc/eeh/eeh-basic.sh               |   82 +
 tools/testing/selftests/powerpc/eeh/eeh-functions.sh           |   76 +
 tools/testing/selftests/powerpc/ptrace/.gitignore              |    3 +
 tools/testing/selftests/powerpc/security/.gitignore            |    1 +
 tools/testing/selftests/powerpc/stringloops/.gitignore         |    5 +-
 tools/testing/selftests/powerpc/tm/tm-signal-context-chk-fpu.c |   49 +-
 tools/testing/selftests/powerpc/tm/tm-signal-context-chk-gpr.c |   59 +-
 tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vmx.c |   74 +-
 tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vsx.c |  130 +-
 tools/testing/selftests/powerpc/tm/tm.h                        |    3 +-
 247 files changed, 9742 insertions(+), 5448 deletions(-)
 create mode 100644 Documentation/powerpc/elfnote.rst
 create mode 100644 Documentation/powerpc/ultravisor.rst
 create mode 100644 arch/powerpc/include/asm/elfnote.h
 create mode 100644 arch/powerpc/include/asm/fadump-internal.h
 create mode 100644 arch/powerpc/include/asm/mem_encrypt.h
 delete mode 100644 arch/powerpc/include/asm/ppc4xx_ocm.h
 delete mode 100644 arch/powerpc/include/asm/scom.h
 create mode 100644 arch/powerpc/include/asm/svm.h
 create mode 100644 arch/powerpc/include/asm/ultravisor-api.h
 create mode 100644 arch/powerpc/include/asm/ultravisor.h
 create mode 100644 arch/powerpc/kernel/note.S
 create mode 100644 arch/powerpc/kernel/ucall.S
 create mode 100644 arch/powerpc/lib/memcpy_mcsafe_64.S
 create mode 100644 arch/powerpc/mm/ioremap.c
 create mode 100644 arch/powerpc/mm/ioremap_32.c
 create mode 100644 arch/powerpc/mm/ioremap_64.c
 delete mode 100644 arch/powerpc/platforms/4xx/ocm.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-core.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.h
 create mode 100644 arch/powerpc/platforms/powernv/ultravisor.c
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.c
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.h
 create mode 100644 arch/powerpc/platforms/pseries/svm.c
 delete mode 100644 arch/powerpc/sysdev/scom.c
 create mode 120000 tools/testing/selftests/powerpc/copyloops/memcpy_mcsafe=
_64.S
 create mode 100644 tools/testing/selftests/powerpc/eeh/Makefile
 create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-basic.sh
 create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-functions.sh
 create mode 100644 tools/testing/selftests/powerpc/security/.gitignore
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl2EypIACgkQUevqPMjh
pYD6ng//bjjVlbjZ8YA9dv9hoviagwdVaZfD3DIOycWYgyNDeMDYjoUPnElOn6aP
DFGIaxf7UOUwM0ypWRgucvWnLePyK2jaeP1fefTnFlp0sgN3Z78jIjMvkO94YRsb
VM80gWLG3K87J53/zor13tnE5Uy9inroY9KfZiUqtrWAQnt/OwzKR8QPwoeo4zDD
jSHP+aIxA32AJol35+JymMhaRAKRZp9ydrv6BnDbnEYET0+AxfbG2TQw2kHqfeBF
NwyxURzOkTYQl/Edtaf+uTfD6MBC2efiMSWqnuk/DKuCBQOGmhwxY8NyoB4UAw2Q
vMmtttLcYqRssAtRIE7QcT7n7vcIt8dwBkR8Ylms3mCcMg8MgGcrF5osXfn6mJYX
ELtWQMWqs2j39DXjF62weLTnEF6nhjA36943NJhrN0hKyjHv6tkv3h8d+xqil7VR
fSDR29/ysDcBsXsVdy6bp6dOzF7U4DquZuZs7wmT0IMKjPFhW4FMl60D78EfE9VT
C+ZuBTfIoXqqPW9bc5sP/6B9wqtlv1vi636KlvohejO1La/82fJkJB+rhE5L7GkB
7BERrRjP1+5G4xEfxbdqYtNK26YBUTmH0xE+kwSyps3IIW0fR0qI07q6wcmr0HDT
L3TIKlQgjBGMEneKzE6hHyILRdMyyDee7WcQgLaX1XxFEJOta9o=3D
=3DW2SW
-----END PGP SIGNATURE-----
