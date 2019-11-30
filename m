Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C75DA10DD66
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 11:43:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Q7JK5JGTzDr1S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 21:43:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Q7GJ1SxMzDr1F
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 21:41:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="KO3N+Iae"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Q7G42hYsz9sP4;
 Sat, 30 Nov 2019 21:41:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1575110487;
 bh=LYEfRINnenDwOpA+cPPIJCRj5cSgE1MDNMuWdKQ2t3s=;
 h=From:To:Cc:Subject:Date:From;
 b=KO3N+IaexCq5avx0xtLt8FoCnAt7VfVglzlEkFiaGhC2Oc0qvNiWYwOivcGIIUVp5
 HXZ0gHwmnanDKKzyIqFNQ9Cp6QgvJQ441It5Vy9f47GVyEIBmKb+SQAcZD8nA7zXJK
 PB5FXWfGtWAhpBYAyPdn3wqN9Y7sLGHHtPExN4C3mv38vBZNJ1FUHDymVH02JSjzX7
 mrp8CZvS2QXjADEI6S1rHOrZzd5yXZX0RijNCy06Y6p/OodBfItAy3j6xQnm+kSPWn
 kIUUtdHSHFLPx0y9hMdX0LavsxGhc3Oef6Kz7l0gx3tkZMvLB8DpfzgXiHeXmGD8uM
 1/mPNG8HNp/gA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-1 tag
Date: Sat, 30 Nov 2019 21:41:17 +1100
Message-ID: <877e3hfxyq.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com, nayna@linux.ibm.com, geert+renesas@glider.be,
 david@redhat.com, linux@rasmusvillemoes.dk, zohar@linux.ibm.com,
 yanaijie@huawei.com, oohall@gmail.com, hch@lst.de, aneesh.kumar@linux.ibm.com,
 madalin.bucur@nxp.com, yuehaibing@huawei.com, krzk@kernel.org,
 debmc@linux.vnet.ibm.com, valentin@longchamp.me, alastair@d-silva.org,
 harish@linux.ibm.com, leonardo@linux.ibm.com, msuchanek@suse.de,
 nathanl@linux.ibm.com, ravi.bangoria@linux.ibm.com, thuth@redhat.com,
 ajd@linux.ibm.com, gwalbon@linux.ibm.com, linuxram@us.ibm.com,
 npiggin@gmail.com, oss@buserror.net, chris.packham@alliedtelesis.co.nz,
 cai@lca.pw, clg@kaod.org, bhelgaas@google.com, natechancellor@gmail.com,
 hbathini@linux.ibm.com, asteinhauser@google.com, malat@debian.org,
 cmr@informatik.wtf, linux-kernel@vger.kernel.org, sbobroff@linux.ibm.com,
 chris.smart@humanservices.gov.au, vaibhav@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.5.

There's some changes in security/integrity as part of the secure boot work.=
 They
were all either written by or acked/reviewed by Mimi.

The changes to the pseries CMM balloon driver includes an addition to
include/uapi/linux/magic.h, which surprised me but is apparently something
balloon drivers do.

Otherwise no conflicts or issues that I'm aware of.

cheers


The following changes since commit da0c9ea146cbe92b832f1b0f694840ea8eb33cce:

  Linux 5.4-rc2 (2019-10-06 14:27:30 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.5-1

for you to fetch changes up to 2807273f5e88ed086d7d5d838fdee71e11e5085f:

  powerpc/fixmap: fix crash with HIGHMEM (2019-11-29 22:41:15 +1100)

- ------------------------------------------------------------------
powerpc updates for 5.5

Highlights:

 - Infrastructure for secure boot on some bare metal Power9 machines. The
   firmware support is still in development, so the code here won't actually
   activate secure boot on any existing systems.

 - A change to xmon (our crash handler / pseudo-debugger) to restrict it to
   read-only mode when the kernel is lockdown'ed, otherwise it's trivial to=
 drop
   into xmon and modify kernel data, such as the lockdown state.

 - Support for KASLR on 32-bit BookE machines (Freescale / NXP).

 - Fixes for our flush_icache_range() and __kernel_sync_dicache() (VDSO) to=
 work
   with memory ranges >4GB.

 - Some reworks of the pseries CMM (Cooperative Memory Management) driver to
   make it behave more like other balloon drivers and enable some cleanups =
of
   generic mm code.

 - A series of fixes to our hardware breakpoint support to properly handle
   unaligned watchpoint addresses.

Plus a bunch of other smaller improvements, fixes and cleanups.

Thanks to:
  Alastair D'Silva, Andrew Donnellan, Aneesh Kumar K.V, Anthony Steinhauser,
  C=C3=A9dric Le Goater, Chris Packham, Chris Smart, Christophe Leroy, Chri=
stopher M.
  Riedl, Christoph Hellwig, Claudio Carvalho, Daniel Axtens, David Hildenbr=
and,
  Deb McLemore, Diana Craciun, Eric Richter, Geert Uytterhoeven, Greg
  Kroah-Hartman, Greg Kurz, Gustavo L. F. Walbon, Hari Bathini, Harish, Jas=
on
  Yan, Krzysztof Kozlowski, Leonardo Bras, Mathieu Malaterre, Mauro S. M.
  Rodrigues, Michal Suchanek, Mimi Zohar, Nathan Chancellor, Nathan Lynch, =
Nayna
  Jain, Nick Desaulniers, Oliver O'Halloran, Qian Cai, Rasmus Villemoes, Ra=
vi
  Bangoria, Sam Bobroff, Santosh Sivaraj, Scott Wood, Thomas Huth, Tyrel
  Datwyler, Vaibhav Jain, Valentin Longchamp, YueHaibing.

- ------------------------------------------------------------------
Alastair D'Silva (6):
      powerpc: Allow flush_icache_range to work across ranges >4GB
      powerpc: Allow 64bit VDSO __kernel_sync_dicache to work across ranges=
 >4GB
      powerpc: define helpers to get L1 icache sizes
      powerpc: Convert flush_icache_range & friends to C
      powerpc: Chunk calls to flush_dcache_range in arch_*_memory
      powerpc: Don't flush caches when adding memory

Andrew Donnellan (2):
      powerpc/configs: Add debug config fragment
      powerpc/64s/exception: Fix kaup -> kuap typo

Aneesh Kumar K.V (9):
      powerpc/nvdimm: Update vmemmap_populated to check sub-section range
      powerpc/pseries: Don't opencode HPTE_V_BOLTED
      powerpc/pseries: Don't fail hash page table insert for bolted mapping
      powerpc/book3s64/hash: Use secondary hash for bolted mapping if the p=
rimary is full
      powerpc/mm/book3s64/radix: Remove unused code.
      powerpc/mm/book3s64/radix: Use freed_tables instead of need_flush_all
      powerpc/mm/book3s64/radix: Flush the full mm even when need_flush_all=
 is set
      powerpc/book3s64/hash: Add cond_resched to avoid soft lockup warning
      powerpc/book3s/mm: Update Oops message to print the correct translati=
on in use

Anthony Steinhauser (1):
      powerpc/security/book3s64: Report L1TF status in sysfs

Chris Packham (1):
      powerpc: Support CMDLINE_EXTEND

Chris Smart (1):
      powerpc/crypto: Add cond_resched() in crc-vpmsum self-test

Christoph Hellwig (1):
      powerpc: use <asm-generic/dma-mapping.h>

Christophe Leroy (19):
      powerpc: Refactor BUG/WARN macros
      powerpc/mm: drop #ifdef CONFIG_MMU in is_ioremap_addr()
      powerpc/mm: Show if a bad page fault on data is read or write.
      powerpc/32: Don't populate page tables for block mapped pages except =
on the 8xx.
      powerpc/reg: use ASM_FTR_IFSET() instead of opencoding fixup.
      powerpc: permanently include 8xx registers in reg.h
      powerpc: cleanup hw_irq.h
      powerpc/8xx: add __init to cpm1 init functions
      powerpc/8xx: use the fixmapped IMMR in cpm_reset()
      powerpc/fixmap: Use __fix_to_virt() instead of fix_to_virt()
      powerpc: Add support for GENERIC_EARLY_IOREMAP
      powerpc/ioremap: warn on early use of ioremap()
      powerpc/32s: automatically allocate BAT in setbat()
      powerpc/83xx: map IMMR with a BAT.
      powerpc/sysdev: drop simple gpio
      powerpc/32: Split kexec low level code out of misc_32.S
      powerpc/kexec: Move kexec files into a dedicated subdir.
      powerpc/fixmap: don't clear fixmap area in paging_init()
      powerpc/fixmap: fix crash with HIGHMEM

Christopher M. Riedl (2):
      powerpc/xmon: Allow listing and clearing breakpoints in read-only mode
      powerpc/xmon: Restrict when kernel is locked down

C=C3=A9dric Le Goater (1):
      powerpc/xive: Prevent page fault issues in the machine crash handler

David Hildenbrand (10):
      powerpc/pseries/cmm: Implement release() function for sysfs device
      powerpc/pseries/cmm: Report errors when registering notifiers fails
      powerpc/pseries/cmm: Cleanup rc handling in cmm_init()
      powerpc/pseries/cmm: Drop page array
      powerpc/pseries/cmm: Use adjust_managed_page_count() insted of totalr=
am_pages_*
      powerpc/pseries/cmm: Rip out memory isolate notifier
      powerpc/pseries/cmm: Convert loaned_pages to an atomic_long_t
      powerpc/pseries/cmm: Implement balloon compaction
      powerpc/pseries/cmm: Switch to balloon_page_alloc()
      powerpc/pseries/cmm: Simulation mode

Deb McLemore (1):
      powerpc/powernv: Add queue mechanism for early messages

Geert Uytterhoeven (2):
      powerpc/security: Fix debugfs data leak on 32-bit
      powerpc/booke: Spelling s/date/data/

Gustavo L. F. Walbon (1):
      powerpc/security: Fix wrong message when RFI Flush is disable

Hari Bathini (2):
      powerpc/configs: add FADump awareness to skiroot_defconfig
      powerpc: make syntax for FADump config options in kernel/Makefile rea=
dable

Harish (1):
      selftests/powerpc: Handle Makefile for unrecognized option

Jason Yan (12):
      powerpc: unify definition of M_IF_NEEDED
      powerpc: move memstart_addr and kernstart_addr to init-common.c
      powerpc: introduce kernstart_virt_addr to store the kernel base
      powerpc/fsl_booke/32: introduce create_kaslr_tlb_entry() helper
      powerpc/fsl_booke/32: introduce reloc_kernel_entry() helper
      powerpc/fsl_booke/32: implement KASLR infrastructure
      powerpc/fsl_booke/32: randomize the kernel image offset
      powerpc/fsl_booke/kaslr: clear the original kernel if randomized
      powerpc/fsl_booke/kaslr: support nokaslr cmdline parameter
      powerpc/fsl_booke/kaslr: dump out kernel offset information on panic
      powerpc/fsl_booke/kaslr: export offset in VMCOREINFO ELF notes
      powerpc/fsl_booke/32: Document KASLR implementation

Krzysztof Kozlowski (1):
      powerpc: Fix Kconfig indentation

Leonardo Bras (1):
      powerpc/pseries/hotplug-memory: Change rc variable to bool

Mathieu Malaterre (1):
      powerpc/ptrace: Add prototype for function pt_regs_check

Michael Ellerman (18):
      powerpc/udbg: Make it safe to call udbg_printf() always
      Merge branch 'fixes' into next
      selftests/powerpc: Reduce sigfuz runtime to ~60s
      powerpc/configs: Rename foo_basic_defconfig to foo_base.config
      powerpc/pseries: Mark accumulate_stolen_time() as notrace
      selftests/powerpc: Fixup clobbers for TM tests
      selftests/powerpc: Add a test of spectre_v2 mitigations
      powerpc: Add build-time check of ptrace PT_xx defines
      powerpc/tools: Don't quote $objdump in scripts
      Merge branch 'fixes' into next
      selftests/powerpc: Skip tm-signal-sigreturn-nt if TM not available
      powerpc/64s: Always disable branch profiling for prom_init.o
      Merge branch 'topic/ima' into topic/secureboot
      Merge branch 'topic/secureboot' into next
      Merge branch 'topic/kaslr-book3e32' into next
      Merge branch 'next' of https://git.kernel.org/.../scottwood/linux int=
o next
      selftests/powerpc: spectre_v2 test must be built 64-bit
      powerpc: Define arch_is_kernel_initmem_freed() for lockdep

Michal Suchanek (2):
      powerpc/perf: remove current_is_64bit()
      powerpc/fadump: when fadump is supported register the fadump sysfs fi=
les.

Mimi Zohar (1):
      powerpc/ima: Indicate kernel modules appended signatures are enforced

Nathan Chancellor (3):
      powerpc: Don't add -mabi=3D flags when building with Clang
      powerpc: Avoid clang warnings around setjmp and longjmp
      powerpc/prom_init: Use -ffreestanding to avoid a reference to bcmp

Nathan Lynch (2):
      powerpc/pseries: address checkpatch warnings in dlpar_offline_cpu
      powerpc/pseries: safely roll back failed DLPAR cpu add

Nayna Jain (13):
      powerpc: Detect the secure boot mode of the system
      powerpc/ima: Add support to initialize ima policy rules
      powerpc: Detect the trusted boot state of the system
      powerpc/ima: Define trusted boot policy
      ima: Make process_buffer_measurement() generic
      certs: Add wrapper function to check blacklisted binary hash
      ima: Check against blacklisted hashes for files with modsig
      powerpc/ima: Update ima arch policy to check for blacklist
      sysfs: Fixes __BIN_ATTR_WO() macro
      powerpc/powernv: Add OPAL API interface to access secure variable
      powerpc: expose secure variables to userspace via sysfs
      x86/efi: move common keyring handler functions to new file
      powerpc: Load firmware trusted keys/hashes into kernel keyring

Oliver O'Halloran (1):
      powerpc/powernv: Disable native PCIe port management

Qian Cai (2):
      powerpc/setup_64: fix -Wempty-body warnings
      powerpc/pkeys: remove unused pkey_allows_readwrite

Rasmus Villemoes (2):
      macintosh: ans-lcd: make anslcd_logo static and __initconst
      powerpc/85xx: remove mostly pointless mpc85xx_qe_init()

Ravi Bangoria (7):
      powerpc/watchpoint: Introduce macros for watchpoint length
      powerpc/watchpoint: Fix length calculation for unaligned target
      powerpc/watchpoint: Fix ptrace code that muck around with address/len
      powerpc/watchpoint: Don't ignore extraneous exceptions blindly
      selftests/powerpc: Rewrite ptrace-hwbreak.c selftest
      powerpc/watchpoint: Add DAR outside test in perf-hwbreak.c selftest
      powerpc/watchpoint: Support for 8xx in ptrace-hwbreak.c selftest

Sam Bobroff (1):
      powerpc/eeh: differentiate duplicate detection message

Thomas Huth (1):
      powerpc: Replace GPL boilerplate with SPDX identifiers

Tyrel Datwyler (9):
      powerpc/pseries: Fix bad drc_index_start value parsing of drc-info en=
try
      powerpc/pseries: Fix drc-info mappings of logical cpus to drc-index
      powerpc/pseries: Add cpu DLPAR support for drc-info property
      PCI: rpaphp: Fix up pointer to first drc-info entry
      PCI: rpaphp: Don't rely on firmware feature to imply drc-info support
      PCI: rpaphp: Add drc-info support for hotplug slot registration
      PCI: rpaphp: Annotate and correctly byte swap DRC properties
      PCI: rpaphp: Correctly match ibm, my-drc-index to drc-name when using=
 drc-info
      powerpc/pseries: Enable support for ibm,drc-info property

Vaibhav Jain (1):
      powerpc/papr_scm: Fix an off-by-one check in papr_scm_meta_{get, set}

Valentin Longchamp (2):
      powerpc/kmcent2: update the ethernet devices' phy properties
      powerpc/kmcent2: add ranges to the pci bridges

YueHaibing (10):
      powerpc/pseries: Use correct event modifier in rtas_parse_epow_errlog=
()
      powerpc/64s: Fix debugfs_simple_attr.cocci warnings
      powerpc/powernv/npu: Fix debugfs_simple_attr.cocci warnings
      powerpc/pseries: Drop pointless static qualifier in vpa_debugfs_init()
      powerpc/pseries: Fix platform_no_drv_owner.cocci warnings
      powerpc/configs: remove obsolete CONFIG_INET_XFRM_MODE_* and CONFIG_I=
NET6_XFRM_MODE_*
      powerpc/powernv: Make some symbols static
      powerpc/powernv/ioda: using kfree_rcu() to simplify the code
      powerpc/spufs: remove set but not used variable 'ctx'
      x86/efi: remove unused variables


 Documentation/ABI/testing/ima_policy                                  |   =
4 +
 Documentation/ABI/testing/sysfs-secvar                                |  4=
6 ++
 Documentation/devicetree/bindings/board/fsl-board.txt                 |  3=
0 -
 Documentation/powerpc/index.rst                                       |   =
1 +
 Documentation/powerpc/kaslr-booke32.rst                               |  4=
2 ++
 arch/powerpc/Kbuild                                                   |   =
1 +
 arch/powerpc/Kconfig                                                  |  5=
4 +-
 arch/powerpc/Kconfig.debug                                            |  1=
8 +-
 arch/powerpc/Makefile                                                 |  1=
6 +-
 arch/powerpc/boot/dts/fsl/kmcent2.dts                                 |  5=
2 +-
 arch/powerpc/configs/40x/acadia_defconfig                             |   =
3 -
 arch/powerpc/configs/40x/ep405_defconfig                              |   =
3 -
 arch/powerpc/configs/40x/kilauea_defconfig                            |   =
3 -
 arch/powerpc/configs/40x/makalu_defconfig                             |   =
3 -
 arch/powerpc/configs/40x/obs600_defconfig                             |   =
3 -
 arch/powerpc/configs/40x/walnut_defconfig                             |   =
3 -
 arch/powerpc/configs/44x/akebono_defconfig                            |   =
3 -
 arch/powerpc/configs/44x/arches_defconfig                             |   =
3 -
 arch/powerpc/configs/44x/bamboo_defconfig                             |   =
3 -
 arch/powerpc/configs/44x/canyonlands_defconfig                        |   =
3 -
 arch/powerpc/configs/44x/currituck_defconfig                          |   =
3 -
 arch/powerpc/configs/44x/ebony_defconfig                              |   =
3 -
 arch/powerpc/configs/44x/eiger_defconfig                              |   =
3 -
 arch/powerpc/configs/44x/fsp2_defconfig                               |   =
3 -
 arch/powerpc/configs/44x/icon_defconfig                               |   =
3 -
 arch/powerpc/configs/44x/iss476-smp_defconfig                         |   =
3 -
 arch/powerpc/configs/44x/katmai_defconfig                             |   =
3 -
 arch/powerpc/configs/44x/rainier_defconfig                            |   =
3 -
 arch/powerpc/configs/44x/redwood_defconfig                            |   =
3 -
 arch/powerpc/configs/44x/sam440ep_defconfig                           |   =
3 -
 arch/powerpc/configs/44x/sequoia_defconfig                            |   =
3 -
 arch/powerpc/configs/44x/taishan_defconfig                            |   =
3 -
 arch/powerpc/configs/52xx/pcm030_defconfig                            |   =
3 -
 arch/powerpc/configs/83xx/kmeter1_defconfig                           |   =
3 -
 arch/powerpc/configs/83xx/mpc837x_rdb_defconfig                       |   =
3 -
 arch/powerpc/configs/85xx/ge_imp3a_defconfig                          |   =
1 -
 arch/powerpc/configs/adder875_defconfig                               |   =
3 -
 arch/powerpc/configs/amigaone_defconfig                               |   =
3 -
 arch/powerpc/configs/cell_defconfig                                   |   =
2 -
 arch/powerpc/configs/chrp32_defconfig                                 |   =
3 -
 arch/powerpc/configs/{corenet_basic_defconfig =3D> corenet_base.config} | =
  0
 arch/powerpc/configs/debug.config                                     |   =
1 +
 arch/powerpc/configs/ep88xc_defconfig                                 |   =
3 -
 arch/powerpc/configs/gamecube_defconfig                               |   =
3 -
 arch/powerpc/configs/mpc512x_defconfig                                |   =
3 -
 arch/powerpc/configs/mpc5200_defconfig                                |   =
1 -
 arch/powerpc/configs/{mpc85xx_basic_defconfig =3D> mpc85xx_base.config} | =
  0
 arch/powerpc/configs/{mpc86xx_basic_defconfig =3D> mpc86xx_base.config} | =
  0
 arch/powerpc/configs/mpc885_ads_defconfig                             |   =
3 -
 arch/powerpc/configs/pmac32_defconfig                                 |   =
2 -
 arch/powerpc/configs/powernv_defconfig                                |   =
3 -
 arch/powerpc/configs/ppc44x_defconfig                                 |   =
3 -
 arch/powerpc/configs/ppc6xx_defconfig                                 |   =
4 -
 arch/powerpc/configs/ps3_defconfig                                    |   =
3 -
 arch/powerpc/configs/skiroot_defconfig                                |   =
4 +-
 arch/powerpc/configs/storcenter_defconfig                             |   =
3 -
 arch/powerpc/configs/tqm8xx_defconfig                                 |   =
3 -
 arch/powerpc/configs/wii_defconfig                                    |   =
3 -
 arch/powerpc/crypto/crc-vpmsum_test.c                                 |   =
1 +
 arch/powerpc/include/asm/Kbuild                                       |   =
2 +
 arch/powerpc/include/asm/book3s/64/pgalloc.h                          |  1=
5 -
 arch/powerpc/include/asm/book3s/64/tlbflush.h                         |  1=
6 -
 arch/powerpc/include/asm/bug.h                                        |  4=
1 +-
 arch/powerpc/include/asm/cache.h                                      |  5=
5 +-
 arch/powerpc/include/asm/cacheflush.h                                 |  3=
6 +-
 arch/powerpc/include/asm/dma-mapping.h                                |  1=
8 -
 arch/powerpc/include/asm/fixmap.h                                     |  2=
6 +-
 arch/powerpc/include/asm/hw_breakpoint.h                              |   =
9 +-
 arch/powerpc/include/asm/hw_irq.h                                     |  5=
7 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h                          |   =
1 +
 arch/powerpc/include/asm/nohash/mmu-book3e.h                          |  1=
1 +-
 arch/powerpc/include/asm/opal-api.h                                   |   =
5 +-
 arch/powerpc/include/asm/opal.h                                       |   =
7 +
 arch/powerpc/include/asm/page.h                                       |   =
7 +
 arch/powerpc/include/asm/pgtable.h                                    |   =
4 -
 arch/powerpc/include/asm/reg.h                                        |  2=
6 +-
 arch/powerpc/include/asm/reg_8xx.h                                    |   =
4 +-
 arch/powerpc/include/asm/sections.h                                   |  1=
4 +
 arch/powerpc/include/asm/secure_boot.h                                |  2=
9 +
 arch/powerpc/include/asm/security_features.h                          |   =
8 +-
 arch/powerpc/include/asm/secvar.h                                     |  3=
5 ++
 arch/powerpc/include/uapi/asm/spu_info.h                              |  1=
4 -
 arch/powerpc/kernel/Makefile                                          |  2=
8 +-
 arch/powerpc/kernel/cpu_setup_fsl_booke.S                             |   =
2 +-
 arch/powerpc/kernel/dawr.c                                            |   =
6 +-
 arch/powerpc/kernel/early_32.c                                        |   =
9 +-
 arch/powerpc/kernel/eeh_driver.c                                      |  2=
2 +-
 arch/powerpc/kernel/eeh_sysfs.c                                       |  1=
8 +-
 arch/powerpc/kernel/exceptions-64e.S                                  |  1=
2 +-
 arch/powerpc/kernel/exceptions-64s.S                                  |   =
6 +-
 arch/powerpc/kernel/fadump.c                                          |  1=
5 +-
 arch/powerpc/kernel/fsl_booke_entry_mapping.S                         |  2=
5 +-
 arch/powerpc/kernel/head_fsl_booke.S                                  |  6=
1 +-
 arch/powerpc/kernel/hw_breakpoint.c                                   | 11=
9 ++--
 arch/powerpc/kernel/ima_arch.c                                        |  7=
8 +++
 arch/powerpc/kernel/misc_32.S                                         | 61=
1 --------------------
 arch/powerpc/kernel/misc_64.S                                         | 10=
9 +---
 arch/powerpc/kernel/process.c                                         |   =
3 +
 arch/powerpc/kernel/prom_init.c                                       |  3=
8 +-
 arch/powerpc/kernel/ptrace.c                                          |  8=
5 ++-
 arch/powerpc/kernel/secure_boot.c                                     |  5=
0 ++
 arch/powerpc/kernel/security.c                                        |  4=
9 +-
 arch/powerpc/kernel/secvar-ops.c                                      |  1=
7 +
 arch/powerpc/kernel/secvar-sysfs.c                                    | 24=
8 ++++++++
 arch/powerpc/kernel/setup-common.c                                    |  2=
0 +
 arch/powerpc/kernel/setup_32.c                                        |   =
3 +
 arch/powerpc/kernel/setup_64.c                                        |  2=
9 +-
 arch/powerpc/kernel/time.c                                            |   =
2 +-
 arch/powerpc/kernel/traps.c                                           |  1=
5 +-
 arch/powerpc/kernel/udbg.c                                            |  1=
4 +-
 arch/powerpc/kernel/vdso64/cacheflush.S                               |   =
4 +-
 arch/powerpc/kexec/Makefile                                           |  2=
5 +
 arch/powerpc/{kernel/machine_kexec.c =3D> kexec/core.c}                 | =
  1 +
 arch/powerpc/{kernel/machine_kexec_32.c =3D> kexec/core_32.c}           | =
  0
 arch/powerpc/{kernel/machine_kexec_64.c =3D> kexec/core_64.c}           | =
  0
 arch/powerpc/{kernel =3D> kexec}/crash.c                                | =
  0
 arch/powerpc/{kernel/kexec_elf_64.c =3D> kexec/elf_64.c}                | =
  0
 arch/powerpc/{kernel/machine_kexec_file_64.c =3D> kexec/file_load.c}    | =
  0
 arch/powerpc/{kernel/ima_kexec.c =3D> kexec/ima.c}                      | =
  0
 arch/powerpc/kexec/relocate_32.S                                      | 50=
0 ++++++++++++++++
 arch/powerpc/mm/book3s32/mmu.c                                        |  1=
1 +-
 arch/powerpc/mm/book3s64/hash_native.c                                |  3=
8 +-
 arch/powerpc/mm/book3s64/hash_utils.c                                 |  1=
9 +
 arch/powerpc/mm/book3s64/pkeys.c                                      |  1=
0 -
 arch/powerpc/mm/book3s64/radix_tlb.c                                  |  8=
0 +--
 arch/powerpc/mm/fault.c                                               |   =
6 +-
 arch/powerpc/mm/init-common.c                                         |   =
7 +
 arch/powerpc/mm/init_32.c                                             |   =
5 -
 arch/powerpc/mm/init_64.c                                             |  5=
9 +-
 arch/powerpc/mm/ioremap_32.c                                          |   =
1 +
 arch/powerpc/mm/ioremap_64.c                                          |   =
2 +
 arch/powerpc/mm/mem.c                                                 | 18=
3 +++++-
 arch/powerpc/mm/mmu_decl.h                                            |  1=
1 +
 arch/powerpc/mm/nohash/8xx.c                                          |  5=
2 +-
 arch/powerpc/mm/nohash/Makefile                                       |   =
1 +
 arch/powerpc/mm/nohash/fsl_booke.c                                    |   =
8 +-
 arch/powerpc/mm/nohash/kaslr_booke.c                                  | 40=
1 +++++++++++++
 arch/powerpc/mm/pgtable_32.c                                          |   =
5 +-
 arch/powerpc/perf/callchain.c                                         |  1=
7 +-
 arch/powerpc/platforms/83xx/misc.c                                    |  1=
1 +
 arch/powerpc/platforms/83xx/mpc836x_mds.c                             |   =
7 -
 arch/powerpc/platforms/85xx/common.c                                  |  2=
3 -
 arch/powerpc/platforms/85xx/corenet_generic.c                         |   =
2 -
 arch/powerpc/platforms/85xx/mpc85xx.h                                 |   =
2 -
 arch/powerpc/platforms/85xx/mpc85xx_mds.c                             |   =
7 -
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c                             |   =
1 -
 arch/powerpc/platforms/85xx/twr_p102x.c                               |   =
1 -
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c                            |   =
4 -
 arch/powerpc/platforms/8xx/cpm1.c                                     |  1=
8 +-
 arch/powerpc/platforms/8xx/pic.c                                      |   =
2 +-
 arch/powerpc/platforms/Kconfig                                        |  1=
0 -
 arch/powerpc/platforms/Kconfig.cputype                                |  1=
0 +-
 arch/powerpc/platforms/cell/spufs/inode.c                             |   =
2 -
 arch/powerpc/platforms/powernv/Makefile                               |   =
1 +
 arch/powerpc/platforms/powernv/opal-call.c                            |   =
3 +
 arch/powerpc/platforms/powernv/opal-powercap.c                        |   =
2 +-
 arch/powerpc/platforms/powernv/opal-psr.c                             |   =
4 +-
 arch/powerpc/platforms/powernv/opal-secvar.c                          | 14=
0 +++++
 arch/powerpc/platforms/powernv/opal-sensor-groups.c                   |   =
2 +-
 arch/powerpc/platforms/powernv/opal.c                                 |  8=
9 ++-
 arch/powerpc/platforms/powernv/pci-ioda-tce.c                         |  1=
0 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                             |   =
8 +-
 arch/powerpc/platforms/powernv/pci.c                                  |  1=
7 +
 arch/powerpc/platforms/pseries/Kconfig                                |   =
1 +
 arch/powerpc/platforms/pseries/cmm.c                                  | 43=
1 ++++++--------
 arch/powerpc/platforms/pseries/hotplug-cpu.c                          | 24=
4 +++++---
 arch/powerpc/platforms/pseries/hotplug-memory.c                       |   =
6 +-
 arch/powerpc/platforms/pseries/lpar.c                                 |  1=
8 +-
 arch/powerpc/platforms/pseries/of_helpers.c                           |   =
8 +-
 arch/powerpc/platforms/pseries/papr_scm.c                             |   =
5 +-
 arch/powerpc/platforms/pseries/pci_dlpar.c                            |  1=
8 +-
 arch/powerpc/platforms/pseries/pseries_energy.c                       |  2=
3 +-
 arch/powerpc/platforms/pseries/ras.c                                  |   =
2 +-
 arch/powerpc/sysdev/Makefile                                          |   =
1 -
 arch/powerpc/sysdev/simple_gpio.c                                     | 14=
3 -----
 arch/powerpc/sysdev/simple_gpio.h                                     |  1=
3 -
 arch/powerpc/sysdev/xive/common.c                                     |   =
9 +
 arch/powerpc/tools/relocs_check.sh                                    |   =
2 +-
 arch/powerpc/tools/unrel_branch_check.sh                              |   =
4 +-
 arch/powerpc/xmon/Makefile                                            |   =
4 +-
 arch/powerpc/xmon/xmon.c                                              | 12=
1 +++-
 certs/blacklist.c                                                     |   =
9 +
 drivers/macintosh/ans-lcd.c                                           |   =
3 +-
 drivers/pci/hotplug/rpaphp_core.c                                     | 12=
7 ++--
 include/asm-generic/tlb.h                                             |   =
2 +-
 include/keys/system_keyring.h                                         |   =
6 +
 include/linux/ima.h                                                   |   =
3 +-
 include/linux/security.h                                              |   =
2 +
 include/uapi/linux/magic.h                                            |   =
1 +
 security/integrity/Kconfig                                            |   =
9 +
 security/integrity/Makefile                                           |   =
7 +-
 security/integrity/ima/ima.h                                          |  1=
1 +
 security/integrity/ima/ima_appraise.c                                 |  3=
3 ++
 security/integrity/ima/ima_main.c                                     |  7=
0 ++-
 security/integrity/ima/ima_policy.c                                   |  1=
2 +-
 security/integrity/integrity.h                                        |   =
1 +
 security/integrity/platform_certs/keyring_handler.c                   |  8=
0 +++
 security/integrity/platform_certs/keyring_handler.h                   |  3=
2 +
 security/integrity/platform_certs/load_powerpc.c                      |  9=
6 +++
 security/integrity/platform_certs/load_uefi.c                         |  7=
2 +--
 security/lockdown/lockdown.c                                          |   =
2 +
 tools/testing/selftests/powerpc/include/utils.h                       |   =
1 +
 tools/testing/selftests/powerpc/pmu/ebb/Makefile                      |   =
7 +-
 tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c                 | 11=
9 +++-
 tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c               | 58=
1 ++++++++++++-------
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c            |   =
2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c            |   =
4 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c                |   =
2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c                |   =
4 +-
 tools/testing/selftests/powerpc/security/Makefile                     |   =
5 +-
 tools/testing/selftests/powerpc/security/branch_loops.S               |  8=
2 +++
 tools/testing/selftests/powerpc/security/spectre_v2.c                 | 21=
8 +++++++
 tools/testing/selftests/powerpc/signal/sigfuz.c                       |   =
2 +-
 tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c           |   =
4 +
 tools/testing/selftests/powerpc/utils.c                               |  2=
0 +
 215 files changed, 4569 insertions(+), 2463 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-secvar
 create mode 100644 Documentation/powerpc/kaslr-booke32.rst
 rename arch/powerpc/configs/{corenet_basic_defconfig =3D> corenet_base.con=
fig} (100%)
 create mode 100644 arch/powerpc/configs/debug.config
 rename arch/powerpc/configs/{mpc85xx_basic_defconfig =3D> mpc85xx_base.con=
fig} (100%)
 rename arch/powerpc/configs/{mpc86xx_basic_defconfig =3D> mpc86xx_base.con=
fig} (100%)
 delete mode 100644 arch/powerpc/include/asm/dma-mapping.h
 create mode 100644 arch/powerpc/include/asm/secure_boot.h
 create mode 100644 arch/powerpc/include/asm/secvar.h
 create mode 100644 arch/powerpc/kernel/ima_arch.c
 create mode 100644 arch/powerpc/kernel/secure_boot.c
 create mode 100644 arch/powerpc/kernel/secvar-ops.c
 create mode 100644 arch/powerpc/kernel/secvar-sysfs.c
 create mode 100644 arch/powerpc/kexec/Makefile
 rename arch/powerpc/{kernel/machine_kexec.c =3D> kexec/core.c} (99%)
 rename arch/powerpc/{kernel/machine_kexec_32.c =3D> kexec/core_32.c} (100%)
 rename arch/powerpc/{kernel/machine_kexec_64.c =3D> kexec/core_64.c} (100%)
 rename arch/powerpc/{kernel =3D> kexec}/crash.c (100%)
 rename arch/powerpc/{kernel/kexec_elf_64.c =3D> kexec/elf_64.c} (100%)
 rename arch/powerpc/{kernel/machine_kexec_file_64.c =3D> kexec/file_load.c=
} (100%)
 rename arch/powerpc/{kernel/ima_kexec.c =3D> kexec/ima.c} (100%)
 create mode 100644 arch/powerpc/kexec/relocate_32.S
 create mode 100644 arch/powerpc/mm/nohash/kaslr_booke.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-secvar.c
 delete mode 100644 arch/powerpc/sysdev/simple_gpio.c
 delete mode 100644 arch/powerpc/sysdev/simple_gpio.h
 create mode 100644 security/integrity/platform_certs/keyring_handler.c
 create mode 100644 security/integrity/platform_certs/keyring_handler.h
 create mode 100644 security/integrity/platform_certs/load_powerpc.c
 create mode 100644 tools/testing/selftests/powerpc/security/branch_loops.S
 create mode 100644 tools/testing/selftests/powerpc/security/spectre_v2.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl3iRukACgkQUevqPMjh
pYBEFQ//Uvv1vx/EjgfafAaiwC2qsQ3N+1APMCoCG99dkgf8iWEVzE6+GUFTtiUQ
Jj5RgV/IzCIui4kLXSZrdkuyk7e1kuYoWrYzKNuLAB76V6U+i/exc1Hj7m7+/fzf
7kH3U9JuTOd7Fc1mcrSqQlbEV++NCUmUb5sNW2EbX5MNDlpnslYmObLM69iuCnnO
hX5xNzA6FYjeCQfVHZDbhw55o1YHmfqWXwy9pkvV+YVj789yAJheUS/k1vRZmWX7
TJVG/dqNiCQZa2HmmvVfdEP7DcLevZ3uy3oVQDuIlrmi17ZHxfaegVinS3zXP78u
jOL07GmOBLoFv3c2T1fkUVj8ZITaWPj/CT0Q5dnt72Kdgfi2KGDrpw0O4r7+WS3G
TCbPny9uhX6r0zH5jA0Gyb4uHIMiSJ4tIfthhddwrs+N98rBNEGbYYoRQKHJiWHS
Naz+yEEv9zQTYqtag3r9y3Lt40VSG2cDWwHdQd3SYIntVQu56eSpBbjBhKQO6tgw
kvRwYgdTat6wTxyi3ipUQNVL+sawpUuLDqlc9FwBX/jh+ZBmX4gdMHKSwKLiQE4r
EII2XvF9TOa8nrTcoU31iZ+PrmzDYTWMHpFjWsbhqutF46dxcTHHyYIR/o4dv+qc
nztc54P5ovVMg77I17IvI4ukHvaz5J8fshbAnjyz4JwcCC083eM=3D
=3DM7Qq
-----END PGP SIGNATURE-----
