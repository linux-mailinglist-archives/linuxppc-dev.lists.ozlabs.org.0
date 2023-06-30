Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F527439D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 12:46:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QAFIT3b2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QssSx0CF6z3bwp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 20:46:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QAFIT3b2;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QssS03HWZz30fZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 20:46:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1688121968;
	bh=6h8VMf2FSdh+dxVwg57n1/smwpuHxvVG869jQ3daLr4=;
	h=From:To:Cc:Subject:Date:From;
	b=QAFIT3b2NO+w6qmcfIDWN2Ae2SL0eqMlU2XB123b8PrVJbD/cy+3GERkakEX+ltSE
	 AIH6KPKd8YPLwQM5XRE6rQPwRDDrkL6UI4CTzQnIEm0JseyEPAl7z640Yxh9qm+1Gk
	 GZXLaC+QK9xEFwwYcLZnpCOPTmHdLWVKiEbiyuhqUEdAlJScfVxRdU02s9D+Hn0wUk
	 60BRO2u8pi646zYAQ4qcKuw8nK2aLcvt6j04m+Nlla6cDJLoHRD1rWqlMyRtA1ok91
	 FCe7DJxcR/9WmKMdVR/f62/pxBfH6pKqXLvziDSYb/hCfj97336EcYfvOZ6mFvwlCr
	 z08+S54YdPTSA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QssRw0D3Yz4wZt;
	Fri, 30 Jun 2023 20:46:04 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.5-1 tag
Date: Fri, 30 Jun 2023 20:45:58 +1000
Message-ID: <877crlgrdl.fsf@mail.lhotse>
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
Cc: trix@redhat.com, paul.gortmaker@windriver.com, bgray@linux.ibm.com, adityag@linux.ibm.com, robh@kernel.org, arnd@arndb.de, aneesh.kumar@linux.ibm.com, masahiroy@kernel.org, nayna@linux.ibm.com, tpearson@raptorengineering.com, geert@linux-m68k.org, joel@jms.id.au, u.kleine-koenig@pengutronix.de, naveen.n.rao@linux.vnet.ibm.com, colin.i.king@gmail.com, elver@google.com, gbatra@linux.vnet.ibm.com, naveen@kernel.org, npiggin@gmail.com, rmclure@linux.ibm.com, jcmvbkbc@gmail.com, rdunlap@infradead.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 6.5.

No conflicts that I'm aware of.

Notable out of area changes:

  kernel/kcsan/core.c               # 353e7300a1db kcsan: Don't expect 64 b=
its atomic builtins from 32 bits architectures
  arch/xtensa/lib/kcsan-stubs.c     # bcea4f7a70dc xtensa: Remove 64 bits a=
tomic builtins stubs
  arch/xtensa/lib/Makefile          # bcea4f7a70dc xtensa: Remove 64 bits a=
tomic builtins stubs
  arch/xtensa/lib/kcsan-stubs.c     # bcea4f7a70dc xtensa: Remove 64 bits a=
tomic builtins stubs

  include/uapi/linux/elf.h          # 97228ca375c7 powerpc/ptrace: Expose H=
ASHKEYR register to ptrace
  scripts/Makefile.compiler         # 54a11654de16 powerpc: remove checks f=
or binutils older than 2.25

cheers


The following changes since commit f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6:

  Linux 6.4-rc2 (2023-05-14 12:51:40 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.5-1

for you to fetch changes up to 54a11654de163994e32b24e3aa90ef81f4a3184d:

  powerpc: remove checks for binutils older than 2.25 (2023-06-27 16:59:29 =
+1000)

- ------------------------------------------------------------------
powerpc updates for 6.5

 - Extend KCSAN support to 32-bit and BookE. Add some KCSAN annotations.

 - Make ELFv2 ABI the default for 64-bit big-endian kernel builds, and use
   the -mprofile-kernel option (kernel specific ftrace ABI) for big endian
   ELFv2 kernels.

 - Add initial Dynamic Execution Control Register (DEXCR) support, and allow
   the ROP protection instructions to be used on Power 10.

 - Various other small features and fixes.

Thanks to: Aditya Gupta, Aneesh Kumar K.V, Benjamin Gray, Brian King,
Christophe Leroy, Colin Ian King, Dmitry Torokhov, Gaurav Batra, Jean Delva=
re,
Joel Stanley, Marco Elver, Masahiro Yamada, Nageswara R Sastry, Nathan
Chancellor, Naveen N Rao, Nayna Jain, Nicholas Piggin, Paul Gortmaker, Randy
Dunlap, Rob Herring, Rohan McLure, Russell Currey, Sachin Sant, Timothy
Pearson, Tom Rix, Uwe Kleine-K=C3=B6nig.

- ------------------------------------------------------------------
Aditya Gupta (1):
      powerpc: update ppc_save_regs to save current r1 in pt_regs

Aneesh Kumar K.V (4):
      powerpc/mm/book3s64: Use pmdp_ptep helper instead of typecasting.
      powerpc/book3s64/mm: Fix DirectMap stats in /proc/meminfo
      powerpc/book3s64/mm: Use PAGE_KERNEL instead of opencoding
      powerpc/mm/dax: Fix the condition when checking if altmap vmemap can =
cross-boundary

Benjamin Gray (11):
      powerpc/book3s: Add missing <linux/sched.h> include
      powerpc/ptrace: Add missing <linux/regset.h> include
      powerpc/dexcr: Add initial Dynamic Execution Control Register (DEXCR)=
 support
      powerpc/dexcr: Handle hashchk exception
      powerpc/dexcr: Support userspace ROP protection
      powerpc/ptrace: Expose DEXCR and HDEXCR registers to ptrace
      powerpc/ptrace: Expose HASHKEYR register to ptrace
      Documentation: Document PowerPC kernel DEXCR interface
      selftests/powerpc: Add more utility macros
      selftests/powerpc/dexcr: Add hashst/hashchk test
      selftests/powerpc/dexcr: Add DEXCR status utility lsdexcr

Christophe Leroy (5):
      kcsan: Don't expect 64 bits atomic builtins from 32 bits architectures
      xtensa: Remove 64 bits atomic builtins stubs
      powerpc/kcsan: Properly instrument arch_spin_unlock()
      powerpc/interrupt: Don't read MSR from interrupt_exit_kernel_prepare()
      powerpc/signal32: Force inlining of __unsafe_save_user_regs() and sav=
e_tm_user_regs_unsafe()

Colin Ian King (1):
      powerpc/powernv/sriov: perform null check on iov before dereferencing=
 iov

Gaurav Batra (1):
      powerpc/iommu: TCEs are incorrectly manipulated with DLPAR add/remove=
 of memory

Joel Stanley (3):
      powerpc/powernv/pci: Remove ioda1 support
      powerpc/powernv/pci: Remove MVE code
      powerpc/powernv/pci: Remove last IODA1 defines

Masahiro Yamada (1):
      powerpc: remove checks for binutils older than 2.25

Michael Ellerman (3):
      Merge branch 'fixes' into next
      MAINTAINERS: Exclude m68k-only drivers from powerpc entry
      powerpc: Mark powermac as orphan in MAINTAINERS

Naveen N Rao (2):
      powerpc/ftrace: Disable ftrace on ppc32 if using clang
      powerpc: Fail build if using recordmcount with binutils v2.37

Nayna Jain (1):
      security/integrity: fix pointer to ESL data and its size on pseries

Nicholas Piggin (19):
      KVM: PPC: Update MAINTAINERS
      powerpc/boot: Separate target flags from BOOTCFLAGS
      powerpc/boot: Separate CPP flags from BOOTCFLAGS
      powerpc/boot: Separate BOOTCFLAGS from BOOTASFLAGS
      powerpc/boot: Clean up Makefile after cflags and asflags separation
      powerpc/build: Remove -pipe from compilation flags
      powerpc/64: Force ELFv2 when building with LLVM linker
      powerpc/64: Make ELFv2 the default for big-endian builds
      powerpc/64: Use -mprofile-kernel for big endian ELFv2 kernels
      powerpc/64s: Remove support for ELFv1 little endian userspace
      powerpc/32s: Fix LLVM SMP build
      powerpc/64s: move stack SLB pinning out of line from _switch
      powerpc/64: Rearrange 64-bit _switch to prepare for 32/64 merge
      powerpc/32: Remove sync from _switch
      powerpc/32: Rearrange _switch to prepare for 32/64 merge
      powerpc: merge 32-bit and 64-bit _switch implementation
      powerpc/64: Rename entry_64.S to prom_entry_64.S
      powerpc/64s: Fix VAS mm use after free
      powerpc/build: vdso linker warning for orphan sections

Paul Gortmaker (2):
      powerpc: drop MPC8540_ADS and MPC8560_ADS platform support
      powerpc: drop MPC85xx_CDS platform support

Randy Dunlap (2):
      powerpc: delete empty config entry for PPC_86xx
      powerpc/embedded6xx: select MPC10X_BRIDGE only if PCI is set

Rob Herring (8):
      powerpc: powermac: Use of_get_cpu_hwid() to read CPU node 'reg'
      macintosh: Use of_address_to_resource()
      macintosh: Use of_property_read_reg() to parse "reg"
      powerpc: fsl_rio: Use of_range_to_resource() for "ranges" parsing
      powerpc: fsl: Use of_property_read_reg() to parse "reg"
      powerpc: fsl_soc: Use of_range_to_resource() for "ranges" parsing
      powerpc: mpc512x: Remove open coded "ranges" parsing
      powerpc: 52xx: Make immr_id DT match tables static

Rohan McLure (8):
      powerpc/{32,book3e}: kcsan: Extend KCSAN Support
      powerpc: qspinlock: Mark accesses to qnode lock checks
      powerpc: qspinlock: Enforce qnode writes prior to publishing to queue
      powerpc: Mark [h]ssr_valid accesses in check_return_regs_valid
      powerpc: powernv: Fix KCSAN datarace warnings on idle_state contention
      powerpc: Annotate accesses to ipi message flags
      powerpc: Mark writes registering ipi to host cpu through kvm and poll=
ing
      powerpc: powernv: Annotate data races in opal events

Timothy Pearson (1):
      powerpc/iommu: Only build sPAPR access functions on pSeries

Tom Rix (1):
      powerpc/spufs: remove unneeded if-checks

Uwe Kleine-K=C3=B6nig (3):
      powerpc: Drop MPC5200 LocalPlus bus FIFO driver
      macintosh: Switch i2c drivers back to use .probe()
      powerpc: Switch i2c drivers back to use .probe()


 Documentation/powerpc/dexcr.rst                           |  58 ++
 Documentation/powerpc/index.rst                           |   1 +
 MAINTAINERS                                               |  11 +-
 arch/powerpc/Kconfig                                      |  17 +-
 arch/powerpc/Makefile                                     |  23 +-
 arch/powerpc/boot/Makefile                                |  71 ++-
 arch/powerpc/boot/dts/fsl/mpc8540ads.dts                  | 355 ----------=
--
 arch/powerpc/boot/dts/fsl/mpc8541cds.dts                  | 375 ----------=
--
 arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi                 | 302 ----------
 arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts              |  82 ---
 arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts              |  82 ---
 arch/powerpc/boot/dts/fsl/mpc8555cds.dts                  | 375 ----------=
--
 arch/powerpc/boot/dts/fsl/mpc8560ads.dts                  | 388 ----------=
---
 arch/powerpc/configs/85xx/mpc8540_ads_defconfig           |  47 --
 arch/powerpc/configs/85xx/mpc8560_ads_defconfig           |  50 --
 arch/powerpc/configs/85xx/mpc85xx_cds_defconfig           |  52 --
 arch/powerpc/configs/mpc85xx_base.config                  |   3 -
 arch/powerpc/include/asm/book3s/64/kexec.h                |   5 +
 arch/powerpc/include/asm/book3s/64/kup.h                  |   1 +
 arch/powerpc/include/asm/cputable.h                       |   4 +-
 arch/powerpc/include/asm/elf.h                            |   6 +
 arch/powerpc/include/asm/kvm_ppc.h                        |   4 +-
 arch/powerpc/include/asm/mpc52xx.h                        |  41 --
 arch/powerpc/include/asm/opal.h                           |   3 -
 arch/powerpc/include/asm/paca.h                           |   1 +
 arch/powerpc/include/asm/ppc-opcode.h                     |   1 +
 arch/powerpc/include/asm/ppc_asm.h                        |  14 +
 arch/powerpc/include/asm/processor.h                      |   1 +
 arch/powerpc/include/asm/ptrace.h                         |   4 +-
 arch/powerpc/include/asm/reg.h                            |  10 +
 arch/powerpc/include/asm/simple_spinlock.h                |   2 +
 arch/powerpc/include/asm/thread_info.h                    |   6 +-
 arch/powerpc/include/uapi/asm/elf.h                       |   2 +
 arch/powerpc/kernel/Makefile                              |  14 +-
 arch/powerpc/kernel/cpu_setup_power.c                     |   8 +
 arch/powerpc/kernel/entry_32.S                            |  58 --
 arch/powerpc/kernel/interrupt.c                           |  17 +-
 arch/powerpc/kernel/iommu.c                               |   4 +
 arch/powerpc/kernel/ppc_save_regs.S                       |   6 +-
 arch/powerpc/kernel/process.c                             |  17 +
 arch/powerpc/kernel/prom.c                                |   1 +
 arch/powerpc/kernel/prom_entry_64.S                       |  87 +++
 arch/powerpc/kernel/ptrace/ptrace-decl.h                  |   6 +
 arch/powerpc/kernel/ptrace/ptrace-view.c                  |  72 ++-
 arch/powerpc/kernel/signal_32.c                           |  15 +-
 arch/powerpc/kernel/smp.c                                 |   4 +-
 arch/powerpc/kernel/{entry_64.S =3D> switch.S}              | 329 +++++---=
---
 arch/powerpc/kernel/traps.c                               |  16 +
 arch/powerpc/kernel/vdso/Makefile                         |   2 +
 arch/powerpc/kernel/vdso/vdso32.lds.S                     |   4 +-
 arch/powerpc/kernel/vdso/vdso64.lds.S                     |   4 +-
 arch/powerpc/kvm/book3s_hv_builtin.c                      |   4 +-
 arch/powerpc/lib/Makefile                                 |   2 +-
 arch/powerpc/lib/qspinlock.c                              |  11 +-
 arch/powerpc/mm/book3s32/hash_low.S                       |   8 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c                  |  39 +-
 arch/powerpc/mm/init_64.c                                 |   2 +-
 arch/powerpc/platforms/44x/ppc476.c                       |   2 +-
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c             |  46 +-
 arch/powerpc/platforms/52xx/Kconfig                       |   5 -
 arch/powerpc/platforms/52xx/Makefile                      |   2 -
 arch/powerpc/platforms/52xx/lite5200_pm.c                 |   2 +-
 arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c             | 594 ----------=
----------
 arch/powerpc/platforms/52xx/mpc52xx_pm.c                  |   2 +-
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c            |   2 +-
 arch/powerpc/platforms/85xx/Makefile                      |   3 -
 arch/powerpc/platforms/85xx/mpc85xx_ads.c                 | 162 ------
 arch/powerpc/platforms/85xx/mpc85xx_cds.c                 | 387 ----------=
---
 arch/powerpc/platforms/86xx/Kconfig                       |   1 -
 arch/powerpc/platforms/cell/spu_base.c                    |   6 -
 arch/powerpc/platforms/embedded6xx/Kconfig                |   4 +-
 arch/powerpc/platforms/powermac/feature.c                 |  12 +-
 arch/powerpc/platforms/powernv/idle.c                     |  16 +-
 arch/powerpc/platforms/powernv/opal-call.c                |   2 -
 arch/powerpc/platforms/powernv/opal-irqchip.c             |   6 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                 | 476 +---------=
------
 arch/powerpc/platforms/powernv/pci-sriov.c                |   6 +-
 arch/powerpc/platforms/powernv/pci.c                      |   5 -
 arch/powerpc/platforms/powernv/pci.h                      |   5 -
 arch/powerpc/platforms/powernv/vas-window.c               |   2 +-
 arch/powerpc/platforms/pseries/iommu.c                    |  18 +-
 arch/powerpc/platforms/pseries/vas.c                      |   2 +-
 arch/powerpc/sysdev/fsl_rio.c                             |  46 +-
 arch/powerpc/sysdev/fsl_rmu.c                             |  10 +-
 arch/powerpc/sysdev/fsl_soc.c                             |  16 +-
 arch/powerpc/tools/gcc-check-mprofile-kernel.sh           |  11 +-
 arch/xtensa/lib/Makefile                                  |   2 -
 arch/xtensa/lib/kcsan-stubs.c                             |  54 --
 drivers/macintosh/ams/ams-i2c.c                           |   2 +-
 drivers/macintosh/smu.c                                   |  15 +-
 drivers/macintosh/therm_adt746x.c                         |   2 +-
 drivers/macintosh/therm_windtunnel.c                      |   2 +-
 drivers/macintosh/via-cuda.c                              |  16 +-
 drivers/macintosh/via-pmu.c                               |  23 +-
 drivers/macintosh/windfarm_ad7417_sensor.c                |   2 +-
 drivers/macintosh/windfarm_fcu_controls.c                 |   2 +-
 drivers/macintosh/windfarm_lm75_sensor.c                  |   2 +-
 drivers/macintosh/windfarm_lm87_sensor.c                  |   2 +-
 drivers/macintosh/windfarm_max6690_sensor.c               |   2 +-
 drivers/macintosh/windfarm_smu_sat.c                      |   2 +-
 include/uapi/linux/elf.h                                  |   2 +
 kernel/kcsan/core.c                                       |   2 +
 scripts/Makefile.compiler                                 |   4 -
 scripts/head-object-list.txt                              |   2 +-
 security/integrity/platform_certs/load_powerpc.c          |  40 +-
 tools/testing/selftests/powerpc/Makefile                  |   1 +
 tools/testing/selftests/powerpc/dexcr/.gitignore          |   2 +
 tools/testing/selftests/powerpc/dexcr/Makefile            |   9 +
 tools/testing/selftests/powerpc/dexcr/dexcr.c             | 132 +++++
 tools/testing/selftests/powerpc/dexcr/dexcr.h             |  49 ++
 tools/testing/selftests/powerpc/dexcr/hashchk_test.c      | 227 ++++++++
 tools/testing/selftests/powerpc/dexcr/lsdexcr.c           | 141 +++++
 tools/testing/selftests/powerpc/include/reg.h             |   4 +
 tools/testing/selftests/powerpc/include/utils.h           |  31 +-
 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h |   2 -
 tools/testing/selftests/powerpc/utils.c                   |  24 +
 116 files changed, 1353 insertions(+), 4425 deletions(-)
 create mode 100644 Documentation/powerpc/dexcr.rst
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8540ads.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8541cds.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8555cds.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8560ads.dts
 delete mode 100644 arch/powerpc/configs/85xx/mpc8540_ads_defconfig
 delete mode 100644 arch/powerpc/configs/85xx/mpc8560_ads_defconfig
 delete mode 100644 arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
 create mode 100644 arch/powerpc/kernel/prom_entry_64.S
 rename arch/powerpc/kernel/{entry_64.S =3D> switch.S} (59%)
 delete mode 100644 arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
 delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_ads.c
 delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_cds.c
 delete mode 100644 arch/xtensa/lib/kcsan-stubs.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/dexcr/Makefile
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.h
 create mode 100644 tools/testing/selftests/powerpc/dexcr/hashchk_test.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/lsdexcr.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmSeshUACgkQUevqPMjh
pYBXCA//VTdgB/3eF8zqVEUp00wK4lC0uTxiLV/2xPghYcHnXeEthD1whv89RmAD
lxgRSy8jBfR1aUYt0PxtMgE4qOzVOQ513kK37CYFYDGtJ3gq5Xf/zCafQ/U4JM6y
IV1N4Crz4OgFZUgl32vFbDoYwAIOQvk42d0I1JhQK9yPT7jgkhmM9N4xPd+fiZ4c
ZtpNWvjCyj+ZY9S1E1M1Nq4c+hpcbO43yPXS0NQWmYnvB+c87UPhk/GkPeo0IG3P
z8k4fVv6V/OHEp+PnXOpNlY0q0tg2GAhfCJHSK+6rE6b5Bi8pTR+iBOrzR/3XmBZ
Irtb9pWXfYZC8ASQXOuw8rfQs3Jejeh6vAUg+bGpgeA/4gWtfNocRkywnupbSuO9
oF+e2+PdeoVhpvpU8jCXzw2t0tplT8+Sfmr2ntvwc237Nnfp3sQcB7PmbmX8cheh
ENLht7tCdFd9e7aZef4MEU+87kOU10BjruEXj/cOl8a3S5VYsjaS+rR0l02mtJ7q
NcrfF7aCNqJwLJNJZJimXTbOEu6Mke7ZHfarL3aC5k0RGH9dHpsMjLJ+4hYA0AY3
980EL2kZibtTRENlODcN6OrGjRAEFATADrhfQEa4mdJtUFEwT2ufNJ0mRh5b5pWw
XanzHEc7w7NBYAzfCkJpiUwmjTf2t0yzUojs5/zmZUlmIFKjI2A=3D
=3DcsXN
-----END PGP SIGNATURE-----
