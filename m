Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A12508C862B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 14:13:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nak1r/Xs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vgm8S0dfpz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 22:13:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nak1r/Xs;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vgm7f5Dlpz30Vc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 22:13:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715947973;
	bh=lHFe+M/eM+QKHheEj+UQqPDqDJDbQqDrL5WTRpJ5lus=;
	h=From:To:Cc:Subject:Date:From;
	b=nak1r/XsC9G4BYZGRpMW0M2WesMzn5tkNRviZboOObLOvNkYWLXs1dnDmdB6pRZAs
	 zhfJe8QhnnvA9G6B1ZetrGi59pjPEMvtlRBxSWbkP4VAl6IhoHNHU7aLwjy5lOrMHl
	 rDw6XuN87iKJUSeC1Oc7olITKrjYnCbjDMu+3ZjLnCZivu1mWIPbBx4MVS+iHpW3pL
	 4tge6iTXdnmAehtQ/II3kkm2j6jLSU75suoBrBd04pt/Idl8AF0kVoHPe5VxYcjZRf
	 fuo7c+2v74Bgu3nKAkP+UmNQgPwErVbeYblEZyoQoTEqhEHupLiW/lY2KyfclHwA4M
	 agit1zAHLPn2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vgm7N0dSmz4wyh;
	Fri, 17 May 2024 22:12:48 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.10-1 tag
Date: Fri, 17 May 2024 22:12:46 +1000
Message-ID: <8734qgwsap.fsf@mail.lhotse>
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
Cc: ritesh.list@gmail.com, chentao@kylinos.cn, mahesh@linux.ibm.com, lidong.zhong@suse.com, nicholas@linux.ibm.com, bgray@linux.ibm.com, sfr@canb.auug.org.au, maddy@linux.ibm.com, matthias.schiffer@ew.tq-group.com, bhe@redhat.com, masahiroy@kernel.org, guozihua@huawei.com, aneesh.kumar@kernel.org, ganeshgr@linux.ibm.com, joel@jms.id.au, sshegde@linux.ibm.com, colin.i.king@gmail.com, nathanl@linux.ibm.com, prosunofficial@gmail.com, arnd@arndb.de, thorsten.blum@toblux.com, groug@kaod.org, naveen@kernel.org, nathan@kernel.org, christophe.jaillet@wanadoo.fr, bhelgaas@google.com, andriy.shevchenko@linux.intel.com, hbathini@linux.ibm.com, xiaowei.bao@nxp.com, geoff@infradead.org, rdunlap@infradead.org, ghanshyam1898@gmail.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, leoyang.li@nxp.com, yang.lee@linux.alibaba.com, linux@treblig.org, vaibhav@linux.ibm.com, ran.wang_1@nxp.com, linuxppc-dev@lists.ozlabs.org, jsavitz@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 6.10.

There's one pending conflict against the RISC-V tree, in uapi/linux/prctl.h.
I've updated our prctl number to account for it, they used 71, we took 72 a=
nd
73, so it's just a textual conflict.

There's a few x86 & generic changes as part of the kdump hotplug series,
but it has acks and has been in linux-next so should be no issues AFAIK.

cheers

Notable out of area changes:
  # fae573060c8d Documentation: Fix the address of the linuxppc-dev mailing=
 list
    Documentation/ABI/testing/sysfs-devices-system-cpu
    etc.

  # 651d61bc8b7d KVM: PPC: Fix documentation for ppc mmu caps
    Documentation/virt/kvm/api.rst
    include/uapi/linux/kvm.h
    tools/include/uapi/linux/kvm.h

  # 79365026f869 crash: add a new kexec flag for hotplug support
    arch/x86/include/asm/kexec.h
    arch/x86/kernel/crash.c
    drivers/base/cpu.c
    drivers/base/memory.c
    include/linux/crash_core.h
    include/linux/kexec.h
    include/uapi/linux/kexec.h
    kernel/crash_core.c
    kernel/kexec.c
    kernel/kexec_file.c

  # 628d701f2de5 powerpc/dexcr: Add DEXCR prctl interface
    include/uapi/linux/prctl.h
    kernel/sys.c

The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f:

  Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.10-1

for you to fetch changes up to 61700f816e6f58f6b1aaa881a69a784d146e30f0:

  powerpc/fadump: Fix section mismatch warning (2024-05-16 23:26:44 +1000)

- ------------------------------------------------------------------
powerpc updates for 6.10

 - Enable BPF Kernel Functions (kfuncs) in the powerpc BPF JIT.

 - Allow per-process DEXCR (Dynamic Execution Control Register) settings via
   prctl, notably NPHIE which controls hashst/hashchk for ROP protection.

 - Install powerpc selftests in sub-directories. Note this changes the way
   run_kselftest.sh needs to be invoked for powerpc selftests.

 - Change fadump (Firmware Assisted Dump) to better handle memory add/remov=
e.

 - Add support for passing additional parameters to the fadump kernel.

 - Add support for updating the kdump image on CPU/memory add/remove events.

 - Other small features, cleanups and fixes.

Thanks to: Andrew Donnellan, Andy Shevchenko, Aneesh Kumar K.V, Arnd Bergma=
nn,
Benjamin Gray, Bjorn Helgaas, Christian Zigotzky, Christophe Jaillet, Chris=
tophe
Leroy, Colin Ian King, C=C3=A9dric Le Goater, Dr. David Alan Gilbert, Erhar=
d Furtner,
Frank Li, GUO Zihua, Ganesh Goudar, Geoff Levand, Ghanshyam Agrawal, Greg K=
urz,
Hari Bathini, Joel Stanley, Justin Stitt, Kunwu Chan, Li Yang, Lidong Zhong,
Madhavan Srinivasan, Mahesh Salgaonkar, Masahiro Yamada, Matthias Schiffer,
Naresh Kamboju, Nathan Chancellor, Nathan Lynch, Naveen N Rao, Nicholas
Miehlbradt, Ran Wang, Randy Dunlap, Ritesh Harjani, Sachin Sant, Shirisha G=
anta,
Shrikanth Hegde, Sourabh Jain, Stephen Rothwell, sundar, Thorsten Blum, Vai=
bhav
Jain, Xiaowei Bao, Yang Li, Zhao Chenhui.

- ------------------------------------------------------------------
Andy Shevchenko (1):
      powerpc/52xx: Replace of_gpio.h by proper one

Aneesh Kumar K.V (IBM) (3):
      powerpc/mm: Align memory_limit value specified using mem=3D kernel pa=
rameter
      powerpc/fadump: Don't update the user-specified memory limit
      powerpc/mm: Update the memory limit based on direct mapping restricti=
ons

Arnd Bergmann (1):
      powerpc/fsl-soc: hide unused const variable

Benjamin Gray (13):
      powerpc: Error on assembly warnings
      selftests/powerpc/dexcr: Add -no-pie to hashchk tests
      powerpc/dexcr: Track the DEXCR per-process
      powerpc/dexcr: Reset DEXCR value across exec
      powerpc/dexcr: Add DEXCR prctl interface
      selftests/powerpc/dexcr: Add DEXCR prctl interface test
      selftests/powerpc/dexcr: Attempt to enable NPHIE in hashchk selftest
      selftests/powerpc/dexcr: Add DEXCR config details to lsdexcr
      selftests/powerpc/dexcr: Add chdexcr utility
      Documentation: Document PowerPC kernel dynamic DEXCR interface
      powerpc64/kasan: Pass virtual addresses to kasan_init_phys_region()
      powerpc/code-patching: Test patch_instructions() during boot
      powerpc/code-patching: Use dedicated memory routines for patching

Bjorn Helgaas (1):
      powerpc: Fix typos

Christophe JAILLET (1):
      KVM: PPC: Book3S HV nestedv2: Fix an error handling path in gs_msg_op=
s_kvmhv_nestedv2_config_fill_info()

Christophe Leroy (1):
      powerpc/bpf/32: Fix failing test_bpf tests

Colin Ian King (1):
      selftests/powerpc/dexcr: Fix spelling mistake "predicition" -> "predi=
ction"

Dr. David Alan Gilbert (1):
      powerpc/module: Remove arch specific module bug stuff

GUO Zihua (1):
      powerpc: Fix preserved memory size for int-vectors

Ganesh Goudar (1):
      powerpc/eeh: Permanently disable the removed device

Geoff Levand (1):
      powerpc: Fix PS3 allmodconfig warning

Ghanshyam Agrawal (1):
      powerpc/eeh: Fix spelling of the word "auxillary" and update comment

Greg Kurz (1):
      powerpc/xmon: Check cpu id in commands "c#", "dp#" and "dx#"

Hari Bathini (7):
      powerpc/64/bpf: fix tail calls for PCREL addressing
      powerpc/bpf: enable kfunc call
      powerpc/pseries/fadump: add support for multiple boot memory regions
      powerpc/fadump: setup additional parameters for dump capture kernel
      powerpc/fadump: pass additional parameters when fadump is active
      powerpc/fadump: update documentation about bootargs_append
      powerpc/85xx: fix compile error without CONFIG_CRASH_DUMP

Joel Stanley (1):
      KVM: PPC: Fix documentation for ppc mmu caps

Kunwu Chan (4):
      powerpc/iommu: Code cleanup for cell/iommu.c
      powerpc/cell: Code cleanup for spufs_mfc_flush
      powerpc/pseries/pci: Code cleanup
      KVM: PPC: code cleanup for kvmppc_book3s_irqprio_deliver

Li Yang (2):
      powerpc: dts: mpc85xx: remove "simple-bus" compatible from ifc node
      powerpc: dts: fsl: rename ifc node name to be memory-controller

Lidong Zhong (1):
      powerpc/pseries/vio: Don't return ENODEV if node or compatible missing

Madhavan Srinivasan (3):
      selftests/powerpc: Re-order *FLAGS to follow lib.mk
      selftests/powerpc: Add flags.mk to support pmu buildable
      selftests/powerpc: make sub-folders buildable on their own

Mahesh Salgaonkar (1):
      powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.

Masahiro Yamada (1):
      powerpc: remove unused *_syscall_64.o variables in Makefile

Matthias Schiffer (1):
      powerpc: rename SPRN_HID2 define to SPRN_HID2_750FX

Michael Ellerman (12):
      powerpc/dart: Drop unnecessary call to kmemleak_no_scan()
      selftests/powerpc: Convert pmu Makefile to for loop style
      selftests/powerpc: Install tests in sub-directories
      powerpc: Mark memory_limit as initdata
      MAINTAINERS: powerpc: Remove Aneesh
      MAINTAINERS: MMU GATHER: Update Aneesh's address
      powerpc/io: Avoid clang null pointer arithmetic warnings
      powerpc/64: Set _IO_BASE to POISON_POINTER_DELTA not 0 for CONFIG_PCI=
=3Dn
      macintosh/ams: Fix unused variable warning
      Merge branch 'topic/ppc-kvm' into next
      Merge branch 'topic/kdump-hotplug' into next
      powerpc/fadump: Fix section mismatch warning

Nathan Chancellor (1):
      powerpc: Fix fatal warnings flag for LLVM's integrated assembler

Nathan Lynch (1):
      powerpc/pseries: Enforce hcall result buffer validity and size

Naveen N Rao (1):
      powerpc/Makefile: Remove bits related to the previous use of -mcmodel=
=3Dlarge

Nicholas Miehlbradt (1):
      powerpc: Add static_key_feature_checks_initialized flag

Ran Wang (1):
      powerpc: dts: add power management nodes to FSL chips

Ritesh Harjani (IBM) (1):
      powerpc/ptdump: Fix walk_vmemmap() to also print first vmemmap entry

Shrikanth Hegde (2):
      powerpc/pseries: Add pool idle time at LPAR boot
      powerpc/pseries: Add failure related checks for h_get_mpp and h_get_p=
pp

Sourabh Jain (10):
      crash: forward memory_notify arg to arch crash hotplug handler
      crash: add a new kexec flag for hotplug support
      powerpc/kexec: move *_memory_ranges functions to ranges.c
      powerpc/kexec: make the update_cpus_node() function public
      powerpc/crash: add crash CPU hotplug support
      powerpc/crash: add crash memory hotplug support
      powerpc: make fadump resilient with memory add/remove events
      powerpc/fadump: add hotplug_ready sysfs interface
      Documentation/powerpc: update fadump implementation details
      powerpc/crash: remove unnecessary NULL check before kvfree()

Stephen Rothwell (1):
      Documentation: Fix the address of the linuxppc-dev mailing list

Thorsten Blum (1):
      powerpc: Use str_plural() in cpu_init_thread_core_maps()

Vaibhav Jain (1):
      KVM: PPC: Book3S HV nestedv2: Cancel pending DEC exception

Xiaowei Bao (1):
      powerpc: dts: p1010rdb: fix INTx interrupt issue on P1010RDB-PB

Yang Li (3):
      powerpc: boot: Fix kernel-doc param for partial_decompress
      powerpc: Fix kernel-doc comments in fsl_gtm.c
      powerpc/rtas: Add kernel-doc comments to smp_startup_cpu()

sundar (1):
      macintosh/macio-adb: replace of_node_put() with __free


 Documentation/ABI/testing/sysfs-devices-system-cpu              |  14 +-
 Documentation/ABI/testing/sysfs-firmware-opal-powercap          |   4 +-
 Documentation/ABI/testing/sysfs-firmware-opal-psr               |   4 +-
 Documentation/ABI/testing/sysfs-firmware-opal-sensor-groups     |   4 +-
 Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info |  10 +-
 Documentation/ABI/testing/sysfs-kernel-fadump                   |  18 +
 Documentation/arch/powerpc/dexcr.rst                            | 141 ++++-
 Documentation/arch/powerpc/firmware-assisted-dump.rst           |  91 ++--
 Documentation/virt/kvm/api.rst                                  |   8 +-
 MAINTAINERS                                                     |   3 +-
 arch/powerpc/Kbuild                                             |   3 +-
 arch/powerpc/Kconfig                                            |   4 +
 arch/powerpc/Makefile                                           |   6 +-
 arch/powerpc/boot/Makefile                                      |   4 +-
 arch/powerpc/boot/decompress.c                                  |   2 +-
 arch/powerpc/boot/dts/acadia.dts                                |   2 +-
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi                        |   2 +-
 arch/powerpc/boot/dts/fsl/bsc9131rdb.dts                        |   2 +-
 arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi                   |   2 +-
 arch/powerpc/boot/dts/fsl/bsc9132qds.dts                        |   2 +-
 arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi                   |   2 +-
 arch/powerpc/boot/dts/fsl/c293pcie.dts                          |   2 +-
 arch/powerpc/boot/dts/fsl/c293si-post.dtsi                      |   2 +-
 arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi                   |  14 +-
 arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi                   |   2 +
 arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi                   |   2 +
 arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi                   |   2 +
 arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts                       |  16 +
 arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts                   |  16 +
 arch/powerpc/boot/dts/fsl/p1010rdb.dtsi                         |  16 -
 arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi                     |   2 +-
 arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi                     |   2 +-
 arch/powerpc/boot/dts/fsl/p1010si-post.dtsi                     |  16 +-
 arch/powerpc/boot/dts/fsl/p1020si-post.dtsi                     |   5 +
 arch/powerpc/boot/dts/fsl/p1021si-post.dtsi                     |   5 +
 arch/powerpc/boot/dts/fsl/p1022si-post.dtsi                     |   7 +-
 arch/powerpc/boot/dts/fsl/p2020si-post.dtsi                     |  17 +-
 arch/powerpc/boot/dts/fsl/pq3-power.dtsi                        |  19 +
 arch/powerpc/boot/dts/fsl/t1023si-post.dtsi                     |   2 +-
 arch/powerpc/boot/dts/fsl/t1024rdb.dts                          |   2 +-
 arch/powerpc/boot/dts/fsl/t1040rdb.dts                          |   2 +-
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi                     |   2 +-
 arch/powerpc/boot/dts/fsl/t1042rdb.dts                          |   2 +-
 arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts                       |   2 +-
 arch/powerpc/boot/dts/fsl/t2081si-post.dtsi                     |   2 +-
 arch/powerpc/boot/dts/fsl/t4240si-post.dtsi                     |   2 +-
 arch/powerpc/boot/main.c                                        |   2 +-
 arch/powerpc/boot/ps3.c                                         |   2 +-
 arch/powerpc/include/asm/cpu_has_feature.h                      |   2 +-
 arch/powerpc/include/asm/eeh.h                                  |   2 +-
 arch/powerpc/include/asm/fadump-internal.h                      |  36 +-
 arch/powerpc/include/asm/fadump.h                               |   2 +
 arch/powerpc/include/asm/feature-fixups.h                       |   2 +
 arch/powerpc/include/asm/hvcall.h                               |  10 +-
 arch/powerpc/include/asm/interrupt.h                            |  10 +
 arch/powerpc/include/asm/io.h                                   |  28 +-
 arch/powerpc/include/asm/kexec.h                                |  15 +
 arch/powerpc/include/asm/kexec_ranges.h                         |  20 +-
 arch/powerpc/include/asm/mmu.h                                  |   2 +-
 arch/powerpc/include/asm/module.h                               |   5 -
 arch/powerpc/include/asm/opal-api.h                             |   4 +-
 arch/powerpc/include/asm/percpu.h                               |  10 +
 arch/powerpc/include/asm/pmac_feature.h                         |   2 +-
 arch/powerpc/include/asm/ppc-opcode.h                           |   4 +
 arch/powerpc/include/asm/processor.h                            |  13 +-
 arch/powerpc/include/asm/reg.h                                  |   2 +-
 arch/powerpc/include/asm/uninorth.h                             |   2 +-
 arch/powerpc/include/uapi/asm/bootx.h                           |   2 +-
 arch/powerpc/kernel/Makefile                                    |   7 +-
 arch/powerpc/kernel/cpu_setup_6xx.S                             |   4 +-
 arch/powerpc/kernel/dexcr.c                                     | 124 +++++
 arch/powerpc/kernel/eeh.c                                       |  11 +-
 arch/powerpc/kernel/eeh_driver.c                                |  13 +-
 arch/powerpc/kernel/eeh_pe.c                                    |   8 +-
 arch/powerpc/kernel/fadump.c                                    | 542 ++++=
+++++++++-------
 arch/powerpc/kernel/misc_64.S                                   |   4 +-
 arch/powerpc/kernel/module.c                                    |   2 -
 arch/powerpc/kernel/process.c                                   |  29 +-
 arch/powerpc/kernel/prom.c                                      |  23 +-
 arch/powerpc/kernel/prom_init.c                                 |   4 +-
 arch/powerpc/kernel/ptrace/ptrace-tm.c                          |   2 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c                        |   7 +-
 arch/powerpc/kernel/setup-common.c                              |   2 +-
 arch/powerpc/kernel/setup_64.c                                  |   2 +
 arch/powerpc/kernel/smp.c                                       |   2 +-
 arch/powerpc/kernel/sysfs.c                                     |   4 +-
 arch/powerpc/kexec/Makefile                                     |   4 +-
 arch/powerpc/kexec/core_64.c                                    |  91 ++++
 arch/powerpc/kexec/crash.c                                      | 195 ++++=
+++
 arch/powerpc/kexec/elf_64.c                                     |   3 +-
 arch/powerpc/kexec/file_load_64.c                               | 314 ++--=
--------
 arch/powerpc/kexec/ranges.c                                     | 312 ++++=
++++++-
 arch/powerpc/kvm/book3s.c                                       |   4 -
 arch/powerpc/kvm/book3s_emulate.c                               |   4 +-
 arch/powerpc/kvm/book3s_hv.c                                    |   2 +-
 arch/powerpc/kvm/book3s_hv_nestedv2.c                           |   4 +-
 arch/powerpc/kvm/book3s_xive.c                                  |   2 +-
 arch/powerpc/lib/Makefile                                       |   2 -
 arch/powerpc/lib/code-patching.c                                |  31 +-
 arch/powerpc/lib/feature-fixups.c                               |   8 +
 arch/powerpc/lib/test-code-patching.c                           |  92 ++++
 arch/powerpc/mm/Makefile                                        |   2 -
 arch/powerpc/mm/book3s64/Makefile                               |   2 -
 arch/powerpc/mm/cacheflush.c                                    |   2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c                          |   2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c                          |   2 +-
 arch/powerpc/mm/mem.c                                           |   2 +-
 arch/powerpc/mm/nohash/Makefile                                 |   2 -
 arch/powerpc/mm/nohash/kaslr_booke.c                            |   2 +-
 arch/powerpc/mm/ptdump/hashpagetable.c                          |   2 +-
 arch/powerpc/net/bpf_jit_comp.c                                 |  10 +
 arch/powerpc/net/bpf_jit_comp32.c                               | 137 +++--
 arch/powerpc/net/bpf_jit_comp64.c                               |  77 ++-
 arch/powerpc/platforms/512x/mpc512x_shared.c                    |   2 +-
 arch/powerpc/platforms/52xx/lite5200_sleep.S                    |   6 +-
 arch/powerpc/platforms/52xx/mpc52xx_common.c                    |   2 -
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c                       |   2 +-
 arch/powerpc/platforms/83xx/suspend-asm.S                       |   6 +-
 arch/powerpc/platforms/85xx/smp.c                               |   9 +-
 arch/powerpc/platforms/cell/iommu.c                             |  17 -
 arch/powerpc/platforms/cell/smp.c                               |   1 +
 arch/powerpc/platforms/cell/spufs/file.c                        |  20 +-
 arch/powerpc/platforms/cell/spufs/sched.c                       |   2 +-
 arch/powerpc/platforms/maple/pci.c                              |   2 +-
 arch/powerpc/platforms/powermac/pic.c                           |   2 +-
 arch/powerpc/platforms/powermac/sleep.S                         |   2 +-
 arch/powerpc/platforms/powernv/opal-fadump.c                    |  35 +-
 arch/powerpc/platforms/powernv/pci-sriov.c                      |   4 +-
 arch/powerpc/platforms/powernv/vas-window.c                     |   2 +-
 arch/powerpc/platforms/ps3/device-init.c                        |  61 +--
 arch/powerpc/platforms/pseries/Makefile                         |   1 -
 arch/powerpc/platforms/pseries/lpar.c                           |   6 +-
 arch/powerpc/platforms/pseries/lparcfg.c                        |  45 +-
 arch/powerpc/platforms/pseries/pci.c                            |  27 -
 arch/powerpc/platforms/pseries/rtas-fadump.c                    | 322 ++++=
+++-----
 arch/powerpc/platforms/pseries/rtas-fadump.h                    |  29 +-
 arch/powerpc/platforms/pseries/vas.c                            |   2 +-
 arch/powerpc/platforms/pseries/vio.c                            |   8 +-
 arch/powerpc/sysdev/Makefile                                    |   2 -
 arch/powerpc/sysdev/dart_iommu.c                                |   4 -
 arch/powerpc/sysdev/fsl_gtm.c                                   |   6 +-
 arch/powerpc/sysdev/fsl_msi.c                                   |   2 +
 arch/powerpc/sysdev/xive/common.c                               |   4 +-
 arch/powerpc/sysdev/xive/native.c                               |   2 +-
 arch/powerpc/xmon/Makefile                                      |   2 -
 arch/powerpc/xmon/xmon.c                                        |   6 +-
 arch/x86/include/asm/kexec.h                                    |  13 +-
 arch/x86/kernel/crash.c                                         |  32 +-
 drivers/base/cpu.c                                              |   2 +-
 drivers/base/memory.c                                           |   2 +-
 drivers/cpufreq/pmac32-cpufreq.c                                |   8 +-
 drivers/macintosh/Kconfig                                       |   2 +-
 drivers/macintosh/macio-adb.c                                   |  24 +-
 include/linux/crash_core.h                                      |  15 +-
 include/linux/kexec.h                                           |  11 +-
 include/uapi/linux/kexec.h                                      |   1 +
 include/uapi/linux/kvm.h                                        |   4 +-
 include/uapi/linux/prctl.h                                      |  16 +
 kernel/crash_core.c                                             |  29 +-
 kernel/kexec.c                                                  |   4 +-
 kernel/kexec_file.c                                             |   5 +
 kernel/sys.c                                                    |  16 +
 tools/include/uapi/linux/kvm.h                                  |   2 +-
 tools/testing/selftests/powerpc/Makefile                        |  11 +-
 tools/testing/selftests/powerpc/alignment/Makefile              |   1 +
 tools/testing/selftests/powerpc/benchmarks/Makefile             |   5 +-
 tools/testing/selftests/powerpc/cache_shape/Makefile            |   1 +
 tools/testing/selftests/powerpc/copyloops/Makefile              |  21 +-
 tools/testing/selftests/powerpc/dexcr/.gitignore                |   2 +
 tools/testing/selftests/powerpc/dexcr/Makefile                  |   9 +-
 tools/testing/selftests/powerpc/dexcr/chdexcr.c                 | 112 ++++
 tools/testing/selftests/powerpc/dexcr/dexcr.c                   |  40 ++
 tools/testing/selftests/powerpc/dexcr/dexcr.h                   |  57 ++
 tools/testing/selftests/powerpc/dexcr/dexcr_test.c              | 215 ++++=
++++
 tools/testing/selftests/powerpc/dexcr/hashchk_test.c            |   8 +-
 tools/testing/selftests/powerpc/dexcr/lsdexcr.c                 | 103 ++--
 tools/testing/selftests/powerpc/dscr/Makefile                   |   1 +
 tools/testing/selftests/powerpc/eeh/Makefile                    |   1 +
 tools/testing/selftests/powerpc/flags.mk                        |  12 +
 tools/testing/selftests/powerpc/math/Makefile                   |   1 +
 tools/testing/selftests/powerpc/mce/Makefile                    |   1 +
 tools/testing/selftests/powerpc/mm/Makefile                     |   1 +
 tools/testing/selftests/powerpc/nx-gzip/Makefile                |   5 +-
 tools/testing/selftests/powerpc/papr_attributes/Makefile        |   3 +-
 tools/testing/selftests/powerpc/papr_sysparm/Makefile           |   1 +
 tools/testing/selftests/powerpc/papr_vpd/Makefile               |   1 +
 tools/testing/selftests/powerpc/pmu/Makefile                    |  44 +-
 tools/testing/selftests/powerpc/pmu/ebb/Makefile                |  21 +-
 tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile   |   5 +-
 tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile     |   5 +-
 tools/testing/selftests/powerpc/primitives/Makefile             |   5 +-
 tools/testing/selftests/powerpc/ptrace/Makefile                 |   1 +
 tools/testing/selftests/powerpc/security/Makefile               |   5 +-
 tools/testing/selftests/powerpc/signal/Makefile                 |   4 +-
 tools/testing/selftests/powerpc/stringloops/Makefile            |  11 +-
 tools/testing/selftests/powerpc/switch_endian/Makefile          |   5 +-
 tools/testing/selftests/powerpc/syscalls/Makefile               |   5 +-
 tools/testing/selftests/powerpc/tm/Makefile                     |   1 +
 tools/testing/selftests/powerpc/vphn/Makefile                   |   5 +-
 199 files changed, 3053 insertions(+), 1271 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/fsl/pq3-power.dtsi
 create mode 100644 arch/powerpc/kernel/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/chdexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr_test.c
 create mode 100644 tools/testing/selftests/powerpc/flags.mk
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmZHR3wACgkQUevqPMjh
pYAzUxAAq6O4NwbVaL4EvZYtou3H++YUC9quA70V2HY+XaHHGwNp6dC1LEWjsEu+
G0IQJXSknho7t673Nvhz5k1ZL0nWNZthDc79BqwMOT69KDwTtPa8sxAKKeGbDNXE
t4wMNs3zLKNiB2BJckKn+KBZnSPH1b8Rmrx9S2rwYZku1qaP9bYL2EFPNwsCY04T
Vl6qO0onXDSmSrMl06OZ6HsxdqhuM1TOsM+vzzAL/8NZlbui2KWUfPZDx16bIyYS
fZmc5Ya06l9iIf3COB5VS+GMbUiHw4DkXRiUsetcoYPCc+PQfPJaTXVJJ1URlWlj
tqqgBPOf2NAuLnVWqSvF9C73p7+SqWLcjwGDxu4WBcUu9cwnxO7psAVvuFDYM1gN
VpX2DlNEFHrxXpmNMZah9w8Ymd0PrdeZEzGJam15zA/dGlThG6RVuYs0nmkWJeXB
otIfGfxCvfnj7ZH14fFaxiVfdDJEHDTJyXwHU+isIb9Vh5ubLRgefob7+4RLyPsE
3qlsWiFH2tRcpFzYCvxS14l8bPDweITzXfJXacQZ+H4YewJQ4ETG0gUFOY2aR18b
BHA5DiwWP/46E6vbP8mr/uozorhFura++TvS01Sk4dE+sj19e89t1Nv0YL5JXsb3
bPdAFoR18mqSDUrBQNfuopa92Gq0gjL7tx391lXscoHu8YVsIP0=3D
=3DdIGB
-----END PGP SIGNATURE-----
