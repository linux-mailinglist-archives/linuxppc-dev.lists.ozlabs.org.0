Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0BF6A151D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 03:56:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNDzs2rVsz3f4Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 13:56:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=deBXuCj5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNDyx1Ctrz3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 13:55:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=deBXuCj5;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PNDyt50sHz4x5Q;
	Fri, 24 Feb 2023 13:55:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677207320;
	bh=/2xLNg0+9yoUgCwDEfgWLF/ybcil9mGDLaS3H3wjJ7Q=;
	h=From:To:Cc:Subject:Date:From;
	b=deBXuCj5IFdJjqt30dq8rmNNLGe50GjAcPToXFxIO08NEDPVgTb/vDZpT+wkXak0P
	 5SXWYcgmldCnkcDpjdLBHG6QptbQksMT/dz4bhQH/WpQKekdzYwkaFZsC3Oj/CsP+u
	 34cNNDWByJlGzc+fOUawkfjPZ2LncKyqY0j3twjNJhYkw4ZYQV9NtQzbdYH3pxRi3l
	 zrBHMZsiiY0yYTmX7eSCIcCiJu6P5sdGu9Jo6LFhRM+6OH9wCtF5Aj1Ke+00oFLpJC
	 Se5SwtqnA+0Nm2Jlkc2ZuAqEk6dwYQ+45YU5tBbIaatlPiqraqoaTEd+mU0F1nIYOL
	 LOqOp0xjyWskQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.3-1 tag
Date: Fri, 24 Feb 2023 13:55:18 +1100
Message-ID: <87v8jrai21.fsf@mpe.ellerman.id.au>
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
Cc: ruscur@russell.cc, song@kernel.org, bgray@linux.ibm.com, anders.roxell@linaro.org, nayna@linux.ibm.com, ganeshgr@linux.ibm.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, mathieu.desnoyers@efficios.com, skhan@linuxfoundation.org, jpoimboe@kernel.org, hbathini@linux.ibm.com, geoff@infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, fbarrat@linux.ibm.com, sv@linux.ibm.com, pali@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 6.3:

The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

  Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.3-1

for you to fetch changes up to f82cdc37c4bd4ba905bf99ade9782a639b5c12e9:

  powerpc/pseries: Avoid hcall in plpks_is_available() on non-pseries (2023=
-02-22 17:01:46 +1100)

- ------------------------------------------------------------------
powerpc updates for 6.3

 - Support for configuring secure boot with user-defined keys on PowerVM LP=
ARs.

 - Simplify the replay of soft-masked IRQs by making it non-recursive.

 - Add support for KCSAN on 64-bit Book3S.

 - Improvements to the API & code which interacts with RTAS (pseries firmwa=
re).

 - Change 32-bit powermac to assign PCI bus numbers per domain by default.

 - Some improvements to the 32-bit BPF JIT.

 - Various other small features and fixes.

Thanks to: Anders Roxell, Andrew Donnellan, Andrew Jeffery, Benjamin Gray, =
Christophe
Leroy, Frederic Barrat, Ganesh Goudar, Geoff Levand, Greg Kroah-Hartman, Ja=
n-Benedict
Glaw, Josh Poimboeuf, Kajol Jain, Laurent Dufour, Mahesh Salgaonkar, Mathie=
u Desnoyers,
Mimi Zohar, Murphy Zhou, Nathan Chancellor, Nathan Lynch, Nayna Jain, Nicho=
las Piggin,
Pali Roh=C3=A1r, Petr Mladek, Rohan McLure, Russell Currey, Sachin Sant, Sa=
thvika Vasireddy,
Sourabh Jain, Stefan Berger, Stephen Rothwell, Sudhakar Kuppusamy.

- ------------------------------------------------------------------
Anders Roxell (1):
      powerpc/mm: Rearrange if-else block to avoid clang warning

Andrew Donnellan (10):
      powerpc/pseries: Fix handling of PLPKS object flushing timeout
      powerpc/pseries: Fix alignment of PLPKS structures and buffers
      powerpc/secvar: Clean up init error messages
      powerpc/secvar: Allow backend to populate static list of variable nam=
es
      powerpc/secvar: Warn when PAGE_SIZE is smaller than max object size
      powerpc/secvar: Don't print error on ENOENT when reading variables
      powerpc/pseries: Make caller pass buffer to plpks_read_var()
      powerpc/pseries: Turn PSERIES_PLPKS into a hidden option
      powerpc/pseries: Clarify warning when PLPKS password already set
      powerpc/pseries: Fix endianness issue when parsing PLPKS secvar flags

Benjamin Gray (5):
      selftests/powerpc: Add generic read/write file util
      selftests/powerpc: Add read/write debugfs file, int
      selftests/powerpc: Parse long/unsigned long value safely
      selftests/powerpc: Add {read,write}_{long,ulong}
      selftests/powerpc: Add automatically allocating read_file

Christophe Leroy (16):
      powerpc/64: Set default CPU in Kconfig
      powerpc: Check !irq instead of irq =3D=3D NO_IRQ and remove NO_IRQ
      powerpc: Disable CPU unknown by CLANG when CC_IS_CLANG
      powerpc: Remove __kernel_text_address() in show_instructions()
      powerpc/bpf/32: No need to zeroise r4 when not doing tail call
      powerpc/bpf/32: Only set a stack frame when necessary
      powerpc/bpf/32: BPF prog is never called with more than one arg
      powerpc/bpf: Perform complete extra passes to update addresses
      powerpc/bpf: Only pad length-variable code at initial pass
      powerpc/bpf/32: Optimise some particular const operations
      powerpc/bpf/32: introduce a second source register for ALU operations
      powerpc/bpf/32: perform three operands ALU operations
      powerpc/64: Replace -mcpu=3De500mc64 by -mcpu=3De5500
      powerpc: Pass correct CPU reference to assembler
      powerpc/epapr: Don't use wrteei on non booke
      powerpc/e500: Add missing prototype for 'relocate_init'

Frederic Barrat (1):
      powerpc/powernv/ioda: Skip unallocated resources when mapping to PE

Ganesh Goudar (2):
      powerpc/mce: log the error for all unrecoverable errors
      powerpc/eeh: Set channel state after notifying the drivers

Geoff Levand (2):
      powerpc/ps3: Change updateboltedpp() panic to info
      powerpc/ps3: Refresh ps3_defconfig

Greg Kroah-Hartman (1):
      powerpc/iommu: fix memory leak with using debugfs_lookup()

Josh Poimboeuf (2):
      powerpc/module_64: Improve restore_r2() return semantics
      powerpc/module_64: Fix "expected nop" error on module re-patching

Kajol Jain (1):
      powerpc/hv-24x7: Fix pvr check when setting interface version

Mathieu Desnoyers (1):
      selftests/powerpc: Fix incorrect kernel headers search path

Michael Ellerman (6):
      Merge branch 'fixes' into next
      powerpc/rtas: Drop unused export symbols
      Merge branch 'fixes' into next
      powerpc/secvar: Use u64 in secvar_operations
      powerpc/nohash: Fix build error with binutils >=3D 2.38
      powerpc/nohash: Fix build with llvm-as

Nathan Chancellor (1):
      macintosh: windfarm: Use unsigned type for 1-bit bitfields

Nathan Lynch (25):
      powerpc/rtas: unexport 'rtas' symbol
      powerpc/rtas: make all exports GPL
      powerpc/rtas: remove lock and args fields from global rtas struct
      powerpc/rtas: upgrade internal arch spinlocks
      powerpc/rtas: handle extended delays safely in early boot
      powerpc/perf/hv-24x7: add missing RTAS retry status handling
      powerpc/pseries/lpar: add missing RTAS retry status handling
      powerpc/pseries/lparcfg: add missing RTAS retry status handling
      powerpc/pseries/setup: add missing RTAS retry status handling
      powerpc/rtas: ensure 4KB alignment for rtas_data_buf
      powerpc/pseries: drop RTAS-based timebase synchronization
      powerpc/rtas: improve function information lookups
      powerpc/rtas: strengthen do_enter_rtas() type safety, drop inline
      powerpc/tracing: tracepoints for RTAS entry and exit
      powerpc/rtas: add tracepoints around RTAS entry
      powerpc/pseries: add RTAS work area allocator
      powerpc/pseries/dlpar: use RTAS work area API
      powerpc/pseries: PAPR system parameter API
      powerpc/pseries: convert CMO probe to papr_sysparm API
      powerpc/pseries/lparcfg: convert to papr_sysparm API
      powerpc/pseries/hv-24x7: convert to papr_sysparm API
      powerpc/pseries/lpar: convert to papr_sysparm API
      powerpc/rtas: introduce rtas_function_token() API
      powerpc/rtas: arch-wide function token lookup conversions
      powerpc/machdep: warn when machine_is() used too early

Nayna Jain (2):
      powerpc/pseries: Expose PLPKS config values, support additional fields
      powerpc/pseries: Implement signed update for PLPKS objects

Nicholas Piggin (14):
      powerpc/64: Don't recurse irq replay
      powerpc/64s/radix: Remove need_flush_all test from radix__tlb_flush
      powerpc/64s/radix: mm->context.id should always be valid
      powerpc/64s/radix: Remove TLB_FLUSH_ALL test from range flushes
      powerpc: Consolidate 32-bit and 64-bit interrupt_enter_prepare
      powerpc/32: implement HAVE_CONTEXT_TRACKING_USER support
      powerpc/32: select HAVE_VIRT_CPU_ACCOUNTING_GEN
      crypto: powerpc - Use address generation helper for asm
      powerpc/64s: Refactor initialisation after prom
      powerpc/64e: Simplify address calculation in secondary hold loop
      powerpc/64s: Fix stress_hpt memblock alloc alignment
      powerpc/64: Fix task_cpu in early boot when booting non-zero cpuid
      powerpc/64: Move paca allocation to early_setup()
      powerpc: Skip stack validation checking alternate stacks if they are =
not allocated

Pali Roh=C3=A1r (4):
      powerpc/boot: Don't always pass -mcpu=3Dpowerpc when building 32-bit =
uImage
      powerpc/pci: Enable PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT by default
      powerpc/pci: Add option for using pci_to_OF_bus_map
      powerpc: dts: turris1x.dts: Set lower priority for CPLD syscon-reboot

Rohan McLure (5):
      powerpc/kcsan: Add exclusions from instrumentation
      powerpc/kcsan: Exclude udelay to prevent recursive instrumentation
      powerpc/kcsan: Memory barriers semantics
      powerpc/kcsan: Prevent recursive instrumentation with IRQ save/restor=
es
      powerpc/kcsan: Add KCSAN Support

Russell Currey (15):
      powerpc/secvar: Fix incorrect return in secvar_sysfs_load()
      powerpc/secvar: Warn and error if multiple secvar ops are set
      powerpc/secvar: Use sysfs_emit() instead of sprintf()
      powerpc/secvar: Handle format string in the consumer
      powerpc/secvar: Handle max object size in the consumer
      powerpc/secvar: Extend sysfs to include config vars
      powerpc/pseries: Move plpks.h to include directory
      powerpc/pseries: Move PLPKS constants to header file
      powerpc/pseries: Log hcall return codes for PLPKS debug
      powerpc/pseries: Add helper to get PLPKS password length
      powerpc/pseries: Pass PLPKS password on kexec
      powerpc/pseries: Implement secvars for dynamic secure boot
      integrity/powerpc: Improve error handling & reporting when loading ce=
rts
      integrity/powerpc: Support loading keys from PLPKS
      powerpc/pseries: Avoid hcall in plpks_is_available() on non-pseries

Sathvika Vasireddy (1):
      powerpc/64: Fix unannotated intra-function call warning

Sourabh Jain (1):
      powerpc/kexec_file: print error string on usable memory property upda=
te failure


 Documentation/ABI/testing/sysfs-secvar                   |   75 +-
 arch/powerpc/Kconfig                                     |   19 +-
 arch/powerpc/Makefile                                    |   26 +-
 arch/powerpc/boot/Makefile                               |   14 +-
 arch/powerpc/boot/dts/turris1x.dts                       |   23 +
 arch/powerpc/configs/ps3_defconfig                       |   39 +-
 arch/powerpc/crypto/crc32-vpmsum_core.S                  |   13 +-
 arch/powerpc/include/asm/barrier.h                       |   12 +-
 arch/powerpc/include/asm/hvcall.h                        |    1 +
 arch/powerpc/include/asm/hw_irq.h                        |    6 +-
 arch/powerpc/include/asm/interrupt.h                     |   35 +-
 arch/powerpc/include/asm/irq.h                           |    3 -
 arch/powerpc/include/asm/machdep.h                       |   16 +-
 arch/powerpc/include/asm/paca.h                          |    1 -
 arch/powerpc/include/asm/papr-sysparm.h                  |   38 +
 arch/powerpc/include/asm/pci-bridge.h                    |    4 +-
 arch/powerpc/include/asm/plpks.h                         |  195 ++++
 arch/powerpc/include/asm/rtas-types.h                    |    2 -
 arch/powerpc/include/asm/rtas-work-area.h                |   96 ++
 arch/powerpc/include/asm/rtas.h                          |  184 ++++
 arch/powerpc/include/asm/secvar.h                        |   21 +-
 arch/powerpc/include/asm/smp.h                           |    1 +
 arch/powerpc/include/asm/trace.h                         |  103 ++
 arch/powerpc/kernel/Makefile                             |   10 +
 arch/powerpc/kernel/eeh_driver.c                         |    4 +-
 arch/powerpc/kernel/epapr_hcalls.S                       |    6 +
 arch/powerpc/kernel/head_64.S                            |   51 +-
 arch/powerpc/kernel/iommu.c                              |    4 +-
 arch/powerpc/kernel/irq_64.c                             |  105 +-
 arch/powerpc/kernel/mce.c                                |   10 +-
 arch/powerpc/kernel/module_64.c                          |   29 +-
 arch/powerpc/kernel/pci_32.c                             |   17 +-
 arch/powerpc/kernel/process.c                            |   14 +-
 arch/powerpc/kernel/prom.c                               |   16 +-
 arch/powerpc/kernel/rtas-proc.c                          |   24 +-
 arch/powerpc/kernel/rtas-rtc.c                           |    6 +-
 arch/powerpc/kernel/rtas.c                               | 1056 ++++++++++=
+++++-----
 arch/powerpc/kernel/rtas_flash.c                         |   21 +-
 arch/powerpc/kernel/rtas_pci.c                           |    8 +-
 arch/powerpc/kernel/rtasd.c                              |    2 +-
 arch/powerpc/kernel/secvar-ops.c                         |   10 +-
 arch/powerpc/kernel/secvar-sysfs.c                       |  178 ++--
 arch/powerpc/kernel/setup-common.c                       |    4 +
 arch/powerpc/kernel/setup_64.c                           |   16 +-
 arch/powerpc/kernel/time.c                               |    4 +-
 arch/powerpc/kernel/trace/Makefile                       |    1 +
 arch/powerpc/kernel/vdso/Makefile                        |    1 +
 arch/powerpc/kexec/file_load_64.c                        |   21 +-
 arch/powerpc/lib/Makefile                                |    2 +
 arch/powerpc/mm/book3s64/hash_utils.c                    |    3 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                     |   73 +-
 arch/powerpc/mm/mmu_decl.h                               |    1 +
 arch/powerpc/mm/nohash/e500_hugetlbpage.c                |    5 +-
 arch/powerpc/mm/nohash/tlb_low_64e.S                     |    2 +-
 arch/powerpc/net/bpf_jit.h                               |    2 +-
 arch/powerpc/net/bpf_jit_comp.c                          |   91 +-
 arch/powerpc/net/bpf_jit_comp32.c                        |  400 ++++----
 arch/powerpc/net/bpf_jit_comp64.c                        |   16 +-
 arch/powerpc/perf/hv-24x7.c                              |   44 +-
 arch/powerpc/platforms/44x/fsp2.c                        |    2 +-
 arch/powerpc/platforms/52xx/efika.c                      |    4 +-
 arch/powerpc/platforms/Kconfig.cputype                   |   20 +-
 arch/powerpc/platforms/cell/ras.c                        |    4 +-
 arch/powerpc/platforms/cell/smp.c                        |    4 +-
 arch/powerpc/platforms/chrp/nvram.c                      |    4 +-
 arch/powerpc/platforms/chrp/pci.c                        |    4 +-
 arch/powerpc/platforms/chrp/setup.c                      |    4 +-
 arch/powerpc/platforms/maple/setup.c                     |    4 +-
 arch/powerpc/platforms/powernv/opal-secvar.c             |   60 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                |    3 +-
 arch/powerpc/platforms/ps3/htab.c                        |    2 +-
 arch/powerpc/platforms/pseries/Kconfig                   |   20 +-
 arch/powerpc/platforms/pseries/Makefile                  |    6 +-
 arch/powerpc/platforms/pseries/dlpar.c                   |   29 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c             |   22 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c             |    4 +-
 arch/powerpc/platforms/pseries/io_event_irq.c            |    2 +-
 arch/powerpc/platforms/pseries/lpar.c                    |   37 +-
 arch/powerpc/platforms/pseries/lparcfg.c                 |  104 +-
 arch/powerpc/platforms/pseries/mobility.c                |    4 +-
 arch/powerpc/platforms/pseries/msi.c                     |    4 +-
 arch/powerpc/platforms/pseries/nvram.c                   |    4 +-
 arch/powerpc/platforms/pseries/papr-sysparm.c            |  151 +++
 arch/powerpc/platforms/pseries/pci.c                     |    2 +-
 arch/powerpc/platforms/pseries/plpks-secvar.c            |  217 ++++
 arch/powerpc/platforms/pseries/plpks.c                   |  385 +++++--
 arch/powerpc/platforms/pseries/plpks.h                   |   71 --
 arch/powerpc/platforms/pseries/ras.c                     |    2 +-
 arch/powerpc/platforms/pseries/rtas-work-area.c          |  209 ++++
 arch/powerpc/platforms/pseries/setup.c                   |   29 +-
 arch/powerpc/platforms/pseries/smp.c                     |   12 +-
 arch/powerpc/purgatory/Makefile                          |    1 +
 arch/powerpc/sysdev/xics/ics-rtas.c                      |    8 +-
 arch/powerpc/xmon/Makefile                               |    1 +
 arch/powerpc/xmon/xmon.c                                 |   16 +-
 drivers/macintosh/windfarm_lm75_sensor.c                 |    4 +-
 drivers/macintosh/windfarm_smu_sensors.c                 |    4 +-
 security/integrity/platform_certs/load_powerpc.c         |   47 +-
 tools/testing/selftests/powerpc/dscr/dscr.h              |   34 +-
 tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c   |   25 +-
 tools/testing/selftests/powerpc/include/utils.h          |   20 +-
 tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c     |   52 +-
 tools/testing/selftests/powerpc/pmu/lib.c                |   34 +-
 tools/testing/selftests/powerpc/ptrace/Makefile          |    2 +-
 tools/testing/selftests/powerpc/ptrace/core-pkey.c       |   28 +-
 tools/testing/selftests/powerpc/security/Makefile        |    2 +-
 tools/testing/selftests/powerpc/security/entry_flush.c   |   12 +-
 tools/testing/selftests/powerpc/security/rfi_flush.c     |   12 +-
 tools/testing/selftests/powerpc/security/uaccess_flush.c |   18 +-
 tools/testing/selftests/powerpc/syscalls/Makefile        |    4 +-
 tools/testing/selftests/powerpc/syscalls/rtas_filter.c   |   81 +-
 tools/testing/selftests/powerpc/tm/Makefile              |    2 +-
 tools/testing/selftests/powerpc/utils.c                  |  412 ++++++--
 113 files changed, 3850 insertions(+), 1582 deletions(-)
 create mode 100644 arch/powerpc/include/asm/papr-sysparm.h
 create mode 100644 arch/powerpc/include/asm/plpks.h
 create mode 100644 arch/powerpc/include/asm/rtas-work-area.h
 create mode 100644 arch/powerpc/platforms/pseries/papr-sysparm.c
 create mode 100644 arch/powerpc/platforms/pseries/plpks-secvar.c
 delete mode 100644 arch/powerpc/platforms/pseries/plpks.h
 create mode 100644 arch/powerpc/platforms/pseries/rtas-work-area.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmP4Js4ACgkQUevqPMjh
pYD/8xAAqi1IkWjDafE8+/PKZhMEfWT5h0wg4fdNTDRVeKC92JNEtkmt1tAgz5WH
h3oVnqPzr1B4n95rS6nIYab96IIaG0vEHdmSHsR49zwConVkcVjNN1GL0g1Sz78m
L/jDAwDgF0oFT3IWxMzUe+/9FsY+FXOd0qbql2nzYxtmy+aERq7QBTEBMFkNUcjR
BN05vKqYjBVGK7zdDS/XJU+sQJe7Qw+FqDzJHO4Yn8X0UanDvSRbk30zOpohh9Mh
VMGwr31zzUTvTT5ZiBA1WHPYIjuComSSChICjlMfnyMYxaoFe5OYAOdkIpsgYHUV
2/J1vTD3Z0iQhIPFlhFDbUCpVtjjyLSOmo7ufJeHX3xQI6iSM1ioQOVER9x+qmkw
cyTEwzSIO0d5v2v3AxceIhWdkIIzCXvWfScRIKHf5VTa4w9VNb+kGhfGGXQdr+YS
cyRagX43/IgodCYYSaEzHPNyEFYNgiJJDs76nZO5tVmE6uiL1trmHq+lXh2DQsvV
a/FqOBUiljyxUcsTh9PchNRhZGt6QI98Eijq239aDO92RV5awejZtgwvliEwPfOY
yOPsb52bwcIOfj0+Xo+gbKbR8+QgJ2WDuTd8Xq7tv7hNh8IO/wGIpv3S0xS09UP+
xrQSLtY5NzagYAw8h4gsyZeEFmVTX4qIUgHyPezUGzlMgojdkY8=3D
=3Dxuz9
-----END PGP SIGNATURE-----
