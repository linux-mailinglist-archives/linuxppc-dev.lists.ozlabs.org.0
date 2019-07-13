Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 312286785B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 06:30:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lxfF3l18zDqTX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 14:29:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lxc91rmdzDqkp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 14:28:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45lxc20mhDz9sNT;
 Sat, 13 Jul 2019 14:28:02 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.3-1 tag
Date: Sat, 13 Jul 2019 14:28:00 +1000
Message-ID: <87ims6eey7.fsf@concordia.ellerman.id.au>
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
Cc: geert+renesas@glider.be, aik@ozlabs.ru, schwab@linux-m68k.org,
 stewart@linux.ibm.com, gromero@linux.vnet.ibm.com,
 yamada.masahiro@socionext.com, oohall@gmail.com, blackgod016574@gmail.com,
 hch@lst.de, mikey@neuling.org, nishadkamdar@gmail.com,
 aneesh.kumar@linux.ibm.com, yuehaibing@huawei.com, krzk@kernel.org,
 anju@linux.vnet.ibm.com, rostedt@goodmis.org, sjitindarsingh@gmail.com,
 alastair@d-silva.org, naveen.n.rao@linux.vnet.ibm.com, nathanl@linux.ibm.com,
 ravi.bangoria@linux.ibm.com, ajd@linux.ibm.com, geliangtang@gmail.com,
 groug@kaod.org, efremov@linux.com, zhangshaokun@hisilicon.com, cai@lca.pw,
 npiggin@gmail.com, dja@axtens.net, atrajeev@linux.vnet.ibm.com,
 chunkeey@gmail.com, malat@debian.org, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 andrew.donnellan@au1.ibm.com, fbarrat@linux.ibm.com,
 sathnaga@linux.vnet.ibm.com, info@metux.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Linus,

Please pull powerpc updates for 5.3.

A bit of a small batch for us, just due to me not getting the time to review
things. Only one conflict that I'm aware of, in our pgtable.h, resolution is
simply to take both sides.

cheers


The following changes since commit cd6c84d8f0cdc911df435bb075ba22ce3c605b07:

  Linux 5.2-rc2 (2019-05-26 16:49:19 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.3-1

for you to fetch changes up to f5a9e488d62360c91c5770bd55a0b40e419a71ce:

  powerpc/powernv/idle: Fix restore of SPRN_LDBAR for POWER9 stop state. (2=
019-07-12 22:25:26 +1000)

- ------------------------------------------------------------------
powerpc updates for 5.3

Notable changes:

 - Removal of the NPU DMA code, used by the out-of-tree Nvidia driver, as w=
ell
   as some other functions only used by drivers that haven't (yet?) made it
   upstream.

 - A fix for a bug in our handling of hardware watchpoints (eg. perf record=
 -e
   mem: ...) which could lead to register corruption and kernel crashes.

 - Enable HAVE_ARCH_HUGE_VMAP, which allows us to use large pages for vmall=
oc
   when using the Radix MMU.

 - A large but incremental rewrite of our exception handling code to use gas
   macros rather than multiple levels of nested CPP macros.

And the usual small fixes, cleanups and improvements.

Thanks to:
  Alastair D'Silva, Alexey Kardashevskiy, Andreas Schwab, Aneesh Kumar K.V,=
 Anju
  T Sudhakar, Anton Blanchard, Arnd Bergmann, Athira Rajeev, C=C3=A9dric Le=
 Goater,
  Christian Lamparter, Christophe Leroy, Christophe Lombard, Christoph Hell=
wig,
  Daniel Axtens, Denis Efremov, Enrico Weigelt, Frederic Barrat, Gautham R.
  Shenoy, Geert Uytterhoeven, Geliang Tang, Gen Zhang, Greg Kroah-Hartman, =
Greg
  Kurz, Gustavo Romero, Krzysztof Kozlowski, Madhavan Srinivasan, Masahiro
  Yamada, Mathieu Malaterre, Michael Neuling, Nathan Lynch, Naveen N. Rao,
  Nicholas Piggin, Nishad Kamdar, Oliver O'Halloran, Qian Cai, Ravi Bangori=
a,
  Sachin Sant, Sam Bobroff, Satheesh Rajendran, Segher Boessenkool, Shaokun
  Zhang, Shawn Anastasio, Stewart Smith, Suraj Jitindar Singh, Thiago Jung
  Bauermann, YueHaibing.

- ------------------------------------------------------------------
Alastair D'Silva (1):
      ocxl: Update for AFU descriptor template version 1.1

Alexey Kardashevskiy (5):
      powerpc/pci/of: Fix OF flags parsing for 64bit BARs
      powerpc/pseries/dma: Allow SWIOTLB
      powerpc/pseries/dma: Enable SWIOTLB
      powerpc/pci/of: Parse unassigned resources
      powerpc/powernv: Fix stale iommu table base after VFIO

Andreas Schwab (1):
      powerpc/mm/32s: fix condition that is always true

Aneesh Kumar K.V (16):
      powerpc/mm: Remove unused variable declaration
      powerpc/mm/hash/4k: Don't use 64K page size for vmemmap with 4K pages=
ize
      powerpc/mm/radix: Use the right page size for vmemmap mapping
      powerpc/mm/drconf: Use NUMA_NO_NODE on failures instead of node 0
      powerpc/mm: Fix node look up with numa=3Doff boot
      powerpc/mm: Consolidate numa_enable check and min_common_depth check
      powerpc/mm/nvdimm: Add an informative message if we fail to allocate =
altmap block
      powerpc/pseries/scm: Mark the region volatile if cache flush not requ=
ired
      powerpc/nvdimm: Add support for multibyte read/write for metadata
      powerpc/pseries/scm: Use a specific endian format for storing uuid fr=
om the device tree
      powerpc/book3s: Use config independent helpers for page table walk
      powerpc/mm: pmd_devmap implies pmd_large().
      powerpc/mm: Remove radix dependency on HugeTLB page
      powerpc/mm: Handle page table allocation failures
      powerpc/mm/hugetlb: Fix kernel crash if we fail to allocate page tabl=
e caches
      powerpc/mm/hugetlb: Don't enable HugeTLB if we don't have a page tabl=
e cache

Anju T Sudhakar (1):
      powerpc/perf: Use cpumask_last() to determine the designated cpu for =
nest/core units.

Anton Blanchard (1):
      powerpc/configs: Disable latencytop

Athira Rajeev (1):
      powerpc/powernv/idle: Fix restore of SPRN_LDBAR for POWER9 stop state.

Christian Lamparter (1):
      powerpc/4xx/uic: clear pending interrupt after irq type/pol change

Christoph Hellwig (5):
      powerpc/powernv: remove the unused pnv_pci_set_p2p function
      powerpc/powernv: remove the unused tunneling exports
      powerpc/powernv: remove unused NPU DMA code
      powerpc/powernv: remove the unused vas_win_paste_addr and vas_win_id =
functions
      powerpc: remove device_to_mask()

Christophe Leroy (25):
      powerpc/lib: fix redundant inclusion of quad.o
      powerpc/lib: only build ldstfp.o when CONFIG_PPC_FPU is set
      powerpc/64: mark start_here_multiplatform as __ref
      powerpc/32s: fix suspend/resume when IBATs 4-7 are used
      powerpc/ftrace: Enable C Version of recordmcount
      powerpc: slightly improve cache helpers
      powerpc/64: flush_inval_dcache_range() becomes flush_dcache_range()
      powerpc/32: define helpers to get L1 cache sizes.
      powerpc/64: reuse PPC32 static inline flush_dcache_range()
      powerpc/8xx: move CPM1 related files from sysdev/ to platforms/8xx
      powerpc/8xx: drop verify_patch()
      powerpc/8xx: compact microcode arrays
      powerpc/8xx: refactor writing of CPM microcode arrays
      powerpc/8xx: Refactor microcode write
      powerpc/8xx: refactor printing of microcode patch name.
      powerpc/8xx: refactor programming of microcode CPM params.
      powerpc/8xx: replace #ifdefs by IS_ENABLED() in microcode.c
      powerpc/8xx: Use IO accessors in microcode programming.
      powerpc/8xx: Add microcode patch to move SMC parameter RAM.
      powerpc/boot: don't force gzipped uImage
      powerpc/boot: Add lzma support for uImage
      powerpc/boot: Add lzo support for uImage
      powerpc: Move PPC_HA() PPC_HI() and PPC_LO() to ppc-opcode.h
      powerpc/module32: Use symbolic instructions names.
      powerpc/module64: Use symbolic instructions names.

Daniel Axtens (1):
      powerpc/pseries/hvconsole: Fix stack overread via udbg

Denis Efremov (1):
      selftests/powerpc: ppc_asm.h: typo in the header guard

Enrico Weigelt, metux IT consult (1):
      powerpc/Kconfig: Clean up formatting

Frederic Barrat (1):
      powerpc/powernv: Show checkstop reason for NPU2 HMIs

Geert Uytterhoeven (2):
      powerpc/ps3: Use [] to denote a flexible array member
      selftests/powerpc: Add missing newline at end of file

Geliang Tang (2):
      powerpc/perf/24x7: use rb_entry
      powerpc/cell: set no_llseek in spufs_cntl_fops

Gen Zhang (1):
      powerpc/pseries/dlpar: Fix a missing check in dlpar_parse_cc_property=
()

Greg Kroah-Hartman (1):
      cxl: no need to check return value of debugfs_create functions

Greg Kurz (2):
      powerpc/powernv/npu: Fix reference leak
      powerpc/pseries: Fix xive=3Doff command line

Gustavo Romero (1):
      selftests/powerpc: Fix earlyclobber in tm-vmxcopy

Krzysztof Kozlowski (1):
      powerpc/configs: Remove useless UEVENT_HELPER_PATH

Masahiro Yamada (4):
      ocxl: do not use C++ style comments in uapi header
      powerpc/mm: mark more tlb functions as __always_inline
      powerpc/boot: add {get, put}_unaligned_be32 to xz_config.h
      powerpc/boot: pass CONFIG options in a simpler and more robust way

Mathieu Malaterre (2):
      powerpc: Remove variable =E2=80=98path=E2=80=99 since not used
      powerpc: silence a -Wcast-function-type warning in dawr_write_file_bo=
ol

Michael Ellerman (5):
      Merge tag 'powerpc-5.2-6' into fixes
      Merge branch 'fixes' into next
      powerpc/64s/exception: Remove unused SOFTEN_VALUE_0x980
      powerpc/module64: Fix comment in R_PPC64_ENTRY handling
      powerpc/irq: Don't WARN continuously in arch_local_irq_restore()

Michael Neuling (3):
      powerpc: Document xive=3Doff option
      powerpc: Fix compile issue with force DAWR
      KVM: PPC: Book3S HV: Fix CR0 setting in TM emulation

Nathan Lynch (6):
      powerpc/pseries: Fix oops in hotplug memory notifier
      powerpc/cacheinfo: add cacheinfo_teardown, cacheinfo_rebuild
      powerpc/pseries/mobility: prevent cpu hotplug during DT update
      powerpc/pseries/mobility: rebuild cacheinfo hierarchy post-migration
      powerpc/pseries: avoid blocking in irq when queuing hotplug events
      powerpc/rtas: retry when cpu offline races with suspend/migration

Naveen N. Rao (11):
      recordmcount: Fix spurious mcount entries on powerpc
      powerpc/xmon: Fix disabling tracing while in xmon
      powerpc/pseries: Use macros for referring to the DTL enable mask
      powerpc/pseries: Do not save the previous DTL mask value
      powerpc/pseries: Factor out DTL buffer allocation and registration ro=
utines
      powerpc/pseries: Introduce rwlock to gatekeep DTLB usage
      powerpc/pseries: Generalize hcall_vphn()
      powerpc/pseries: Move mm/book3s64/vphn.c under platforms/pseries/
      powerpc/pseries: Provide vcpu dispatch statistics
      powerpc/pseries: Protect against hogging the cpu while setting up the=
 stats
      powerpc/pseries: Add documentation for vcpudispatch_stats

Nicholas Piggin (49):
      powerpc/64: __ioremap_at clean up in the error case
      powerpc/64s/radix: ioremap use ioremap_page_range
      powerpc/64s/radix: Enable HAVE_ARCH_HUGE_VMAP
      powerpc/64s/exception: fix line wrap and semicolon inconsistencies in=
 macros
      powerpc/64s/exception: remove H concatenation for EXC_HV variants
      powerpc/64s/exception: consolidate EXCEPTION_PROLOG_2 with _NORI vari=
ant
      powerpc/64s/exception: move and tidy EXCEPTION_PROLOG_2 variants
      powerpc/64s/exception: fix sreset KVM test code
      powerpc/64s/exception: remove the "extra" macro parameter
      powerpc/64s/exception: consolidate maskable and non-maskable prologs
      powerpc/64s/exception: merge KVM handler and skip variants
      powerpc/64s/exception: KVM handler can set the HSRR trap bit
      powerpc/64s/exception: Make EXCEPTION_PROLOG_0 a gas macro for consis=
tency with others
      powerpc/64s/exception: Move EXCEPTION_COMMON handler and return branc=
hes into callers
      powerpc/64s/exception: Move EXCEPTION_COMMON additions into callers
      powerpc/64s/exception: unwind exception-64s.h macros
      powerpc/64s/exception: improve 0x500 handler code
      powerpc/64s/exception: move EXCEPTION_PROLOG_2* to a more logical pla=
ce
      powerpc/64s/exception: remove STD_EXCEPTION_COMMON variants
      powerpc/64s/exception: move KVM related code together
      powerpc/64s/exception: move exception-64s.h code to exception-64s.S w=
here it is used
      powerpc/64s/exception: move head-64.h code to exception-64s.S where i=
t is used
      powerpc/64s/exception: remove __BRANCH_TO_KVM
      powerpc/64s/exception: remove unused BRANCH_TO_COMMON
      powerpc/64s/exception: use a gas macro for system call handler code
      powerpc/64s/exception: fix indenting irregularities
      powerpc/64s/exception: generate regs clear instructions using .rept
      powerpc/64s/exception: remove pointless EXCEPTION_PROLOG macro indire=
ction
      powerpc/64s/exception: move paca save area offsets into exception-64s=
.S
      powerpc/64s/exception: clean up system call entry
      powerpc/64s/exception: avoid SPR RAW scoreboard stall in real mode en=
try
      powerpc/64s/exception: mtmsrd L=3D1 cleanup
      powerpc/64s/exception: windup use r9 consistently to restore SPRs
      powerpc/64s/exception: move machine check windup in_mce handling
      powerpc/64s/exception: simplify hmi windup code
      powerpc/64s/exception: shuffle windup code around
      powerpc/64s/exception: use common macro for windup
      powerpc/64s/exception: add dar and dsisr options to exception macro
      powerpc/64s/exception: machine check use standard macros to save dar/=
dsisr
      powerpc/64s/exception: denorm handler use standard scratch save macro
      powerpc/64s/exception: move SET_SCRATCH0 into EXCEPTION_PROLOG_0
      powerpc/tm: update comment about interrupt re-entrancy
      powerpc/64s/exception: remove bad stack branch
      powerpc/64s/exception: optimise system_reset for idle, clean up non-i=
dle case
      powerpc/64s/exception: sreset move trampoline ahead of common code
      powerpc/64s/exception: hmi remove special case macro
      powerpc/64s/exception: simplify hmi control flow
      powerpc/64s: Rename PPC_INVALIDATE_ERAT to PPC_ISA_3_0_INVALIDATE_ERAT
      powerpc/64s/radix: keep kernel ERAT over local process/guest invalida=
tes

Nishad Kamdar (1):
      powerpc: Use the correct style for SPDX License Identifier

Oliver O'Halloran (1):
      powerpc/eeh: Handle hugepages in ioremap space

Qian Cai (2):
      powerpc/eeh_cache: fix a W=3D1 kernel-doc warning
      powerpc/cacheflush: fix variable set but not used

Ravi Bangoria (1):
      powerpc/watchpoint: Restore NV GPRs while returning from exception

Satheesh Rajendran (1):
      powerpc: Enable CONFIG_IPV6 in ppc64_defconfig

Shaokun Zhang (1):
      powerpc/64s: Fix misleading SPR and timebase information

Stewart Smith (2):
      powerpc/powernv: Update firmware archaeology around OPAL_HANDLE_HMI
      powerpc/powernv-eeh: Consisely desribe what this file does

Suraj Jitindar Singh (3):
      KVM: PPC: Book3S HV: Signed extend decrementer value if not using lar=
ge decrementer
      KVM: PPC: Book3S HV: Clear pending decrementer exceptions on nested g=
uest entry
      powerpc: Add barrier_nospec to raw_copy_in_user()

YueHaibing (2):
      powerpc/mm: Make some symbols static that can be
      ocxl: Make ocxl_remove() static


 Documentation/admin-guide/kernel-parameters.txt    |   11 +-
 Documentation/powerpc/vcpudispatch_stats.txt       |   68 +
 arch/powerpc/Kconfig                               |   48 +-
 arch/powerpc/boot/.gitignore                       |    2 -
 arch/powerpc/boot/Makefile                         |   16 +-
 arch/powerpc/boot/serial.c                         |    1 -
 arch/powerpc/boot/wrapper                          |   19 +-
 arch/powerpc/boot/xz_config.h                      |   20 +
 arch/powerpc/configs/40x/acadia_defconfig          |    1 -
 arch/powerpc/configs/40x/ep405_defconfig           |    1 -
 arch/powerpc/configs/40x/kilauea_defconfig         |    1 -
 arch/powerpc/configs/40x/klondike_defconfig        |    1 -
 arch/powerpc/configs/40x/makalu_defconfig          |    1 -
 arch/powerpc/configs/40x/obs600_defconfig          |    1 -
 arch/powerpc/configs/40x/virtex_defconfig          |    1 -
 arch/powerpc/configs/40x/walnut_defconfig          |    1 -
 arch/powerpc/configs/44x/akebono_defconfig         |    1 -
 arch/powerpc/configs/44x/arches_defconfig          |    1 -
 arch/powerpc/configs/44x/bamboo_defconfig          |    1 -
 arch/powerpc/configs/44x/bluestone_defconfig       |    1 -
 arch/powerpc/configs/44x/canyonlands_defconfig     |    1 -
 arch/powerpc/configs/44x/currituck_defconfig       |    1 -
 arch/powerpc/configs/44x/ebony_defconfig           |    1 -
 arch/powerpc/configs/44x/eiger_defconfig           |    1 -
 arch/powerpc/configs/44x/fsp2_defconfig            |    1 -
 arch/powerpc/configs/44x/icon_defconfig            |    1 -
 arch/powerpc/configs/44x/iss476-smp_defconfig      |    1 -
 arch/powerpc/configs/44x/katmai_defconfig          |    1 -
 arch/powerpc/configs/44x/rainier_defconfig         |    1 -
 arch/powerpc/configs/44x/redwood_defconfig         |    1 -
 arch/powerpc/configs/44x/sam440ep_defconfig        |    1 -
 arch/powerpc/configs/44x/sequoia_defconfig         |    1 -
 arch/powerpc/configs/44x/taishan_defconfig         |    1 -
 arch/powerpc/configs/44x/virtex5_defconfig         |    1 -
 arch/powerpc/configs/44x/warp_defconfig            |    1 -
 arch/powerpc/configs/52xx/cm5200_defconfig         |    1 -
 arch/powerpc/configs/52xx/lite5200b_defconfig      |    1 -
 arch/powerpc/configs/52xx/motionpro_defconfig      |    1 -
 arch/powerpc/configs/52xx/pcm030_defconfig         |    1 -
 arch/powerpc/configs/52xx/tqm5200_defconfig        |    1 -
 arch/powerpc/configs/83xx/asp8347_defconfig        |    1 -
 arch/powerpc/configs/83xx/mpc8313_rdb_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc8315_rdb_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc832x_mds_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc832x_rdb_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc834x_itx_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc834x_itxgp_defconfig  |    1 -
 arch/powerpc/configs/83xx/mpc834x_mds_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc836x_mds_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc836x_rdk_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc837x_mds_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc837x_rdb_defconfig    |    1 -
 arch/powerpc/configs/85xx/ge_imp3a_defconfig       |    1 -
 arch/powerpc/configs/85xx/ksi8560_defconfig        |    1 -
 arch/powerpc/configs/85xx/mpc8540_ads_defconfig    |    1 -
 arch/powerpc/configs/85xx/mpc8560_ads_defconfig    |    1 -
 arch/powerpc/configs/85xx/mpc85xx_cds_defconfig    |    1 -
 arch/powerpc/configs/85xx/sbc8548_defconfig        |    1 -
 arch/powerpc/configs/85xx/stx_gp3_defconfig        |    1 -
 arch/powerpc/configs/85xx/tqm8548_defconfig        |    1 -
 arch/powerpc/configs/85xx/xes_mpc85xx_defconfig    |    1 -
 arch/powerpc/configs/adder875_defconfig            |    1 -
 arch/powerpc/configs/amigaone_defconfig            |    1 -
 arch/powerpc/configs/cell_defconfig                |    1 -
 arch/powerpc/configs/chrp32_defconfig              |    1 -
 arch/powerpc/configs/ep8248e_defconfig             |    1 -
 arch/powerpc/configs/ep88xc_defconfig              |    1 -
 arch/powerpc/configs/fsl-emb-nonhw.config          |    1 -
 arch/powerpc/configs/g5_defconfig                  |    2 -
 arch/powerpc/configs/gamecube_defconfig            |    2 -
 arch/powerpc/configs/holly_defconfig               |    1 -
 arch/powerpc/configs/linkstation_defconfig         |    1 -
 arch/powerpc/configs/maple_defconfig               |    2 -
 arch/powerpc/configs/mgcoge_defconfig              |    1 -
 arch/powerpc/configs/mpc512x_defconfig             |    1 -
 arch/powerpc/configs/mpc5200_defconfig             |    1 -
 arch/powerpc/configs/mpc7448_hpc2_defconfig        |    1 -
 arch/powerpc/configs/mpc8272_ads_defconfig         |    1 -
 arch/powerpc/configs/mpc83xx_defconfig             |    1 -
 arch/powerpc/configs/mpc885_ads_defconfig          |    1 -
 arch/powerpc/configs/mvme5100_defconfig            |    1 -
 arch/powerpc/configs/pasemi_defconfig              |    1 -
 arch/powerpc/configs/pmac32_defconfig              |    2 -
 arch/powerpc/configs/powernv_defconfig             |    2 -
 arch/powerpc/configs/ppc40x_defconfig              |    1 -
 arch/powerpc/configs/ppc44x_defconfig              |    1 -
 arch/powerpc/configs/ppc64_defconfig               |    4 +-
 arch/powerpc/configs/ppc64e_defconfig              |    2 -
 arch/powerpc/configs/ppc6xx_defconfig              |    2 -
 arch/powerpc/configs/pq2fads_defconfig             |    1 -
 arch/powerpc/configs/ps3_defconfig                 |    1 -
 arch/powerpc/configs/pseries_defconfig             |    2 -
 arch/powerpc/configs/skiroot_defconfig             |    1 -
 arch/powerpc/configs/storcenter_defconfig          |    1 -
 arch/powerpc/configs/tqm8xx_defconfig              |    1 -
 arch/powerpc/configs/wii_defconfig                 |    2 -
 arch/powerpc/include/asm/book3s/64/mmu.h           |    2 -
 arch/powerpc/include/asm/book3s/64/pgtable.h       |   30 +-
 arch/powerpc/include/asm/book3s/64/radix.h         |    3 +
 arch/powerpc/include/asm/cache.h                   |   34 +-
 arch/powerpc/include/asm/cacheflush.h              |   46 +-
 arch/powerpc/include/asm/exception-64s.h           |  609 +--------
 arch/powerpc/include/asm/head-64.h                 |  204 +--
 arch/powerpc/include/asm/hw_breakpoint.h           |   21 +-
 arch/powerpc/include/asm/iommu.h                   |    8 -
 arch/powerpc/include/asm/lppaca.h                  |   40 +
 arch/powerpc/include/asm/opal-api.h                |    1 +
 arch/powerpc/include/asm/opal.h                    |    2 -
 arch/powerpc/include/asm/paca.h                    |    2 +
 arch/powerpc/include/asm/pgtable.h                 |   24 +
 arch/powerpc/include/asm/pnv-ocxl.h                |    2 +-
 arch/powerpc/include/asm/pnv-pci.h                 |    6 -
 arch/powerpc/include/asm/powernv.h                 |   22 -
 arch/powerpc/include/asm/ppc-opcode.h              |   20 +-
 arch/powerpc/include/asm/ps3stor.h                 |    2 +-
 arch/powerpc/include/asm/pte-walk.h                |   28 +-
 arch/powerpc/include/asm/topology.h                |    6 +
 arch/powerpc/include/asm/uaccess.h                 |    1 +
 arch/powerpc/include/asm/vas.h                     |   10 -
 arch/powerpc/kernel/Makefile                       |    1 +
 arch/powerpc/kernel/asm-offsets.c                  |    2 +
 arch/powerpc/kernel/cacheinfo.c                    |   21 +
 arch/powerpc/kernel/cacheinfo.h                    |    4 +
 arch/powerpc/kernel/dawr.c                         |  101 ++
 arch/powerpc/kernel/dma-iommu.c                    |   40 +-
 arch/powerpc/kernel/eeh.c                          |   15 +-
 arch/powerpc/kernel/eeh_cache.c                    |    3 +
 arch/powerpc/kernel/exceptions-64s.S               | 1437 ++++++++++++++--=
----
 arch/powerpc/kernel/head_64.S                      |    2 +
 arch/powerpc/kernel/hw_breakpoint.c                |   56 -
 arch/powerpc/kernel/irq.c                          |    6 +-
 arch/powerpc/kernel/mce_power.c                    |    3 +-
 arch/powerpc/kernel/misc_64.S                      |   52 -
 arch/powerpc/kernel/module_32.c                    |   24 +-
 arch/powerpc/kernel/module_64.c                    |   62 +-
 arch/powerpc/kernel/pci_of_scan.c                  |   14 +-
 arch/powerpc/kernel/process.c                      |   28 -
 arch/powerpc/kernel/prom_init.c                    |   29 +-
 arch/powerpc/kernel/rtas.c                         |    7 +-
 arch/powerpc/kernel/swsusp_32.S                    |   73 +-
 arch/powerpc/kernel/tm.S                           |    4 +-
 arch/powerpc/kernel/trace/ftrace.c                 |    4 -
 arch/powerpc/kvm/Kconfig                           |    7 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c             |   12 +-
 arch/powerpc/kvm/book3s_hv.c                       |   13 +-
 arch/powerpc/kvm/book3s_hv_builtin.c               |    6 +-
 arch/powerpc/kvm/book3s_hv_tm.c                    |    6 +-
 arch/powerpc/lib/Makefile                          |    3 +-
 arch/powerpc/lib/ldstfp.S                          |    4 -
 arch/powerpc/lib/pmem.c                            |    8 +-
 arch/powerpc/mm/book3s64/Makefile                  |    1 -
 arch/powerpc/mm/book3s64/hash_native.c             |    6 +-
 arch/powerpc/mm/book3s64/hash_utils.c              |    6 +-
 arch/powerpc/mm/book3s64/mmu_context.c             |    1 -
 arch/powerpc/mm/book3s64/pgtable.c                 |   23 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c           |  149 +-
 arch/powerpc/mm/book3s64/radix_tlb.c               |   40 +-
 arch/powerpc/mm/book3s64/vphn.h                    |   16 -
 arch/powerpc/mm/hugetlbpage.c                      |   25 +-
 arch/powerpc/mm/init_64.c                          |    5 +-
 arch/powerpc/mm/mem.c                              |    4 +-
 arch/powerpc/mm/numa.c                             |   61 +-
 arch/powerpc/mm/pgtable.c                          |   16 +-
 arch/powerpc/mm/pgtable_32.c                       |    2 +-
 arch/powerpc/mm/pgtable_64.c                       |   39 +-
 arch/powerpc/mm/ptdump/ptdump.c                    |    6 +-
 arch/powerpc/perf/hv-24x7.c                        |    2 +-
 arch/powerpc/perf/imc-pmu.c                        |   14 +-
 arch/powerpc/platforms/40x/Kconfig                 |    7 +-
 arch/powerpc/platforms/44x/Kconfig                 |   10 +-
 arch/powerpc/platforms/4xx/uic.c                   |    1 +
 arch/powerpc/platforms/85xx/Kconfig                |    8 +-
 arch/powerpc/platforms/86xx/Kconfig                |    6 +-
 arch/powerpc/platforms/8xx/Kconfig                 |    7 +
 arch/powerpc/platforms/8xx/Makefile                |    2 +
 arch/powerpc/{sysdev =3D> platforms/8xx}/cpm1.c      |   24 +-
 arch/powerpc/platforms/8xx/micropatch.c            |  378 +++++
 arch/powerpc/platforms/Kconfig.cputype             |    2 +-
 arch/powerpc/platforms/cell/spufs/file.c           |    2 +-
 arch/powerpc/platforms/maple/Kconfig               |    2 +-
 arch/powerpc/platforms/powermac/sleep.S            |   68 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c       |    4 +-
 arch/powerpc/platforms/powernv/idle.c              |    8 +-
 arch/powerpc/platforms/powernv/npu-dma.c           |  571 +-------
 arch/powerpc/platforms/powernv/opal-call.c         |    1 -
 arch/powerpc/platforms/powernv/opal-hmi.c          |   40 +
 arch/powerpc/platforms/powernv/opal.c              |   23 +-
 arch/powerpc/platforms/powernv/pci-ioda.c          |   14 +-
 arch/powerpc/platforms/powernv/pci.c               |  145 --
 arch/powerpc/platforms/powernv/pci.h               |    6 -
 arch/powerpc/platforms/powernv/vas-window.c        |   19 -
 arch/powerpc/platforms/powernv/vas.h               |   20 -
 arch/powerpc/platforms/pseries/Kconfig             |   19 +-
 arch/powerpc/platforms/pseries/Makefile            |    1 +
 arch/powerpc/platforms/pseries/dlpar.c             |   12 +-
 arch/powerpc/platforms/pseries/dtl.c               |   23 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c    |    3 +
 arch/powerpc/platforms/pseries/hvconsole.c         |    2 +-
 arch/powerpc/platforms/pseries/lpar.c              |  603 +++++++-
 arch/powerpc/platforms/pseries/mobility.c          |   19 +
 arch/powerpc/platforms/pseries/papr_scm.c          |  123 +-
 arch/powerpc/platforms/pseries/setup.c             |   39 +-
 arch/powerpc/platforms/pseries/vio.c               |    4 +-
 .../{mm/book3s64 =3D> platforms/pseries}/vphn.c      |   20 +-
 arch/powerpc/sysdev/Makefile                       |    2 -
 arch/powerpc/sysdev/dart_iommu.c                   |    2 +-
 arch/powerpc/sysdev/micropatch.c                   |  749 ----------
 arch/powerpc/sysdev/xics/Kconfig                   |   13 +-
 arch/powerpc/sysdev/xive/spapr.c                   |   52 +-
 arch/powerpc/xmon/xmon.c                           |   14 +-
 drivers/macintosh/smu.c                            |    4 +-
 drivers/misc/ocxl/config.c                         |  181 ++-
 drivers/misc/ocxl/pci.c                            |    2 +-
 drivers/tty/hvc/hvc_vio.c                          |   16 +-
 include/misc/ocxl.h                                |    5 +-
 include/uapi/misc/ocxl.h                           |   14 +-
 scripts/recordmcount.h                             |    3 +-
 tools/testing/selftests/powerpc/mm/.gitignore      |    2 +-
 .../selftests/powerpc/stringloops/asm/ppc_asm.h    |    2 +-
 tools/testing/selftests/powerpc/tm/tm-vmxcopy.c    |    2 +-
 tools/testing/selftests/powerpc/vphn/Makefile      |    2 +-
 tools/testing/selftests/powerpc/vphn/asm/lppaca.h  |    1 +
 tools/testing/selftests/powerpc/vphn/vphn.c        |    2 +-
 tools/testing/selftests/powerpc/vphn/vphn.h        |    1 -
 224 files changed, 3638 insertions(+), 3538 deletions(-)
 create mode 100644 Documentation/powerpc/vcpudispatch_stats.txt
 create mode 100644 arch/powerpc/kernel/dawr.c
 delete mode 100644 arch/powerpc/mm/book3s64/vphn.h
 rename arch/powerpc/{sysdev =3D> platforms/8xx}/cpm1.c (97%)
 create mode 100644 arch/powerpc/platforms/8xx/micropatch.c
 rename arch/powerpc/{mm/book3s64 =3D> platforms/pseries}/vphn.c (80%)
 delete mode 100644 arch/powerpc/sysdev/micropatch.c
 create mode 120000 tools/testing/selftests/powerpc/vphn/asm/lppaca.h
 delete mode 120000 tools/testing/selftests/powerpc/vphn/vphn.h
-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJdKV2kAAoJEFHr6jzI4aWAP20QALg3fgST74OyQlYvHsTGEF7l
g8HHDqTqWTbp/et8rBXvdloqEzhNQtuxvI3zU57Tk3IFus0t9ZgiRR2o1OmtzVFj
m7SE3NMl7ZilQQjAUQzzcXQqi6nBgyabZKXAp3XTYfIL84/2Lx/suHeKVgmUOM13
L3smL581NQCuqCUUJhZo2p8rS3Sy/t6YNbh+abMrG9cyK2mLOWQy48ndlxsF9YVv
GEYQ5ehRO57aIiiOWAMxAiPUJvzq+um0q/lWu+WC7wd0zXbZnxASLKiJc+C7QkLm
e+0xQWvzpSQs/qgcvAFlnyDPXCDAi3GpAIMN6DCK46IsoTTW0Zlsjs9BvMNKa95x
N2FXmGr4vm2xmhuT9rkRQp5KfqKbNpmCyCQc7PqA+rvTO3D3LaHXSr+ECICYQdOV
xNnybbY0DYFO5h+7Vr9qsS/vo0zNW1j0Q0lIiPhRPGqoSUrxUoJf52VfsARYJcaz
BsEZkPSNQpo27m205Cs6I9Qx5rbYTKyVqGuVPh1VQmy6IPfMzkLtlgvI1yIJw91a
qs2NYuMvS6VmTjHnu4ILkfyAsAPWnXJpPTGuoNhOBl62WjMG/RsJkzEv/FDidf1e
SHJbpM/MxxXWGKUClEFNjff1Oy8wU8CYFZm8Rwx4ZN/WSVRy4wGU1iqvl99rPxqi
ZhIuXGxiiyWSWJ6H10s7
=3D6P25
-----END PGP SIGNATURE-----
