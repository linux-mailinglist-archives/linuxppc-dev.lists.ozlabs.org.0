Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1111820B5D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Dec 2023 13:08:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AiEuwa1N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T2yYX4yXNz3c1w
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Dec 2023 23:08:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AiEuwa1N;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T2yXk1qptz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Dec 2023 23:07:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1704024437;
	bh=/WrU80qWc7OW86N0kbr81Eb509eI9lCRfjc+HEg7+FQ=;
	h=From:To:Cc:Subject:Date:From;
	b=AiEuwa1Nhj7i87Whi6v91aJ6YyCYNx1wwHz407BiQ1OXwXrbk0qYlhNU5El/hbKWR
	 bQRin5N5qk77YNOrOpEU1RHe2sNq367lMN3Igs/boQBkJgZKeN5aOopaKoi/NwSi9z
	 ZsgIezq9JdZqgEQtu8p+LDkiGKbTcRJCQOi1BJW3PgqM2sppxR8x1X/iz2G6wDzmEq
	 SddSCpZODrtaUxPoj4VCabI/BVBq5mwVg4ldEiEQcyX1QaeJYpdQYByjQMOS1jIAp8
	 2hXKRan8XS7obPj3o/VTv1nBf1MNvJdxietWMQiwKX5Wq1EydxU8ZEOptSdAshCxy2
	 l8YXamhV6TJMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T2yXg4PgVz4wqN;
	Sun, 31 Dec 2023 23:07:14 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.8-1 tag
Date: Sun, 31 Dec 2023 23:07:14 +1100
Message-ID: <87r0j2k231.fsf@mail.lhotse>
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
Cc: srikar@linux.vnet.ibm.com, chentao@kylinos.cn, jniethe5@gmail.com, kunyu@nfschina.com, dario.binacchi@amarulasolutions.com, sfr@canb.auug.org.au, adityag@linux.ibm.com, aneesh.kumar@linux.ibm.com, masahiroy@kernel.org, aneesh.kumar@kernel.org, kuba@kernel.org, colin.i.king@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de, kjain@linux.ibm.com, naveen@kernel.org, npiggin@gmail.com, oss@buserror.net, sv@linux.ibm.com, liuhaoran14@163.com, haokexin@gmail.com, ke.zhao@shingroup.cn, geoff@infradead.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, david@ixit.cz, zeming@nfschina.com, fbarrat@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

When the time comes, please pull powerpc updates for 6.8:

The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671b2263:

  Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.8-1

for you to fetch changes up to 44a1aad2fe6c10bfe0589d8047057b10a4c18a19:

  Merge branch 'topic/ppc-kvm' into next (2023-12-29 15:30:45 +1100)

- ------------------------------------------------------------------
powerpc updates for 6.8

 - Add initial support to recognise the HeXin C2000 processor.

 - Add papr-vpd and papr-sysparm character device drivers for VPD & sysparm
   retrieval, so userspace tools can be adapted to avoid doing raw firmware
   calls from userspace.

 - Sched domains optimisations for shared processor partitions on P9/P10.

 - A series of optimisations for KVM running as a nested HV under PowerVM.

 - Other small features and fixes.

Thanks to: Aditya Gupta, Aneesh Kumar K.V, Arnd Bergmann, Christophe Leroy,
Colin Ian King, Dario Binacchi, David Heidelberg, Geoff Levand, Gustavo A.
R. Silva, Haoran Liu, Jordan Niethe, Kajol Jain, Kevin Hao, Kunwu Chan, Li
kunyu, Li zeming, Masahiro Yamada, Michal Such=C3=A1nek, Nathan Lynch, Nave=
en N Rao,
Nicholas Piggin, Randy Dunlap, Sathvika Vasireddy, Srikar Dronamraju, Steph=
en
Rothwell, Vaibhav Jain, Zhao Ke.

- ------------------------------------------------------------------
Aditya Gupta (1):
      powerpc: add cpu_spec.cpu_features to vmcoreinfo

Aneesh Kumar K.V (1):
      powerpc/sched: Cleanup vcpu_is_preempted()

Aneesh Kumar K.V (IBM) (2):
      powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from PAGE_NONE
      powerpc/book3s64: Avoid __pte_protnone() check in __pte_flags_need_fl=
ush()

Arnd Bergmann (3):
      powerpc/ps3: move udbg_shutdown_ps3gelic prototype
      powerpc/pasemi: mark pas_shutdown() static
      powerpc/powermac: mark smp_psurge_{give,take}_timebase static

Colin Ian King (1):
      selftests/powerpc: Fix spelling mistake "EACCESS" -> "EACCES"

Dario Binacchi (1):
      powerpc/85xx: Fix typo in code comment

David Heidelberg (1):
      powerpc/fsl: Fix fsl,tmu-calibration to match the schema

Geoff Levand (1):
      powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2

Haoran Liu (1):
      powerpc/powernv: Add error handling to opal_prd_range_is_valid

Jordan Niethe (11):
      KVM: PPC: Book3S HV nestedv2: Invalidate RPT before deleting a guest
      KVM: PPC: Book3S HV nestedv2: Avoid reloading the tb offset
      KVM: PPC: Book3S HV nestedv2: Do not check msr on hcalls
      KVM: PPC: Book3S HV nestedv2: Get the PID only if needed to copy tofr=
om a guest
      KVM: PPC: Book3S HV nestedv2: Ensure LPCR_MER bit is passed to the L0
      KVM: PPC: Book3S HV nestedv2: Do not inject certain interrupts
      KVM: PPC: Book3S HV nestedv2: Avoid msr check in kvmppc_handle_exit_h=
v()
      KVM: PPC: Book3S HV nestedv2: Do not call H_COPY_TOFROM_GUEST
      KVM: PPC: Book3S HV nestedv2: Register the VPA with the L0
      KVM: PPC: Reduce reliance on analyse_instr() in mmio emulation
      KVM: PPC: Book3S HV nestedv2: Do not cancel pending decrementer excep=
tion

Kajol Jain (1):
      powerpc/hv-gpci: Add return value check in affinity_domain_via_partit=
ion_show function

Kevin Hao (3):
      powerpc/mpc83xx: Add the missing set_freezable() for agent_thread_fn()
      powerpc/mpc83xx: Use wait_event_freezable() for freezable kthread
      powerpc/ps3: Add missing set_freezable() for ps3_probe_thread()

Kunwu Chan (6):
      powerpc/xics: Check return value of kasprintf in icp_native_map_one_c=
pu
      powerpc/mm: Fix null-pointer dereference in pgtable_cache_add
      powerpc/powernv: Add a null pointer check to scom_debug_init_one()
      powerpc/powernv: Add a null pointer check in opal_event_init()
      powerpc/powernv: Add a null pointer check in opal_powercap_init()
      powerpc/imc-pmu: Add a null pointer check in update_events_in_group()

Li kunyu (1):
      misc: ocxl: main: Remove unnecessary =E2=80=980=E2=80=99 values from =
rc

Li zeming (3):
      misc: ocxl: context: Remove unnecessary (void*) conversions
      misc: ocxl: afu_irq: Remove unnecessary (void*) conversions
      misc: ocxl: link: Remove unnecessary (void*) conversions

Masahiro Yamada (1):
      powerpc: add crtsavres.o to always-y instead of extra-y

Michael Ellerman (25):
      powerpc/configs/64s: Enable CONFIG_MEM_SOFT_DIRTY
      powerpc: Make cpu_spec __ro_after_init
      powerpc: Remove orphaned reg_a2.h
      powerpc/32: Drop unused grackle_set_stg()
      powerpc/lib: Avoid array bounds warnings in vec ops
      powerpc/suspend: Add prototype for do_after_copyback()
      powerpc/512x: Make pdm360ng_init() static
      powerpc/512x: Fix missing prototype warnings
      powerpc/44x: Make ppc44x_idle_init() static
      powerpc/64s: Fix CONFIG_NUMA=3Dn build due to create_section_mapping()
      powerpc/mm: Fix build failures due to arch_reserved_kernel_pages()
      powerpc: Fix build error due to is_valid_bugaddr()
      MAINTAINERS: powerpc: Transfer PPC83XX to Christophe
      powerpc/Makefile: Don't use $(ARCH) unnecessarily
      powerpc/vdso: No need to undef powerpc for 64-bit build
      powerpc/Makefile: Default to ppc64le_defconfig when cross building
      powerpc/Makefile: Auto detect cross compiler
      selftests/powerpc: Fix error handling in FPU/VMX preemption tests
      selftests/powerpc: Check all FPRs in fpu_preempt
      selftests/powerpc: Generate better bit patterns for FPU tests
      selftests/powerpc: Run fpu_preempt test for 60 seconds
      selftests/powerpc: Check all FPRs in fpu_syscall test
      Merge branch 'smp-topo' into next
      powerpc/86xx: Drop unused CONFIG_MPC8610
      Merge branch 'topic/ppc-kvm' into next

Nathan Lynch (21):
      powerpc/rtas: Drop declaration of undefined call_rtas() function
      powerpc/rtas: Remove unused rtas_service_present()
      powerpc/rtas: Move post_mobility_fixup() declaration to pseries
      powerpc/rtas: Remove trailing space
      powerpc/rtas: Remove 'extern' from function declarations in rtas.h
      powerpc/rtas_pci: rename and properly expose config access APIs
      powerpc/pseries/memhp: Fix access beyond end of drmem array
      powerpc/pseries/memhp: Log more error conditions in add path
      powerpc/rtas: Avoid warning on invalid token argument to sys_rtas()
      powerpc/rtas: Add for_each_rtas_function() iterator
      powerpc/rtas: Fall back to linear search on failed token->function lo=
okup
      powerpc/rtas: Add function return status constants
      powerpc/rtas: Move token validation from block_rtas_call() to sys_rta=
s()
      powerpc/rtas: Facilitate high-level call sequences
      powerpc/rtas: Serialize firmware activation sequences
      powerpc/rtas: Warn if per-function lock isn't held
      powerpc/pseries: Add papr-vpd character driver for VPD retrieval
      powerpc/pseries/papr-sysparm: Validate buffer object lengths
      powerpc/pseries/papr-sysparm: Expose character device to user space
      powerpc/selftests: Add test for papr-vpd
      powerpc/selftests: Add test for papr-sysparm

Naveen N Rao (3):
      powerpc/lib: Validate size for vector operations
      powerpc/ftrace: Fix indentation in ftrace.h
      powerpc/ftrace: Remove nops after the call to ftrace_stub

Nicholas Piggin (1):
      KVM: PPC: Book3S HV: Handle pending exceptions on guest entry with MS=
R_EE

Randy Dunlap (1):
      powerpc/44x: select I2C for CURRITUCK

Sathvika Vasireddy (1):
      powerpc/Kconfig: Select FUNCTION_ALIGNMENT_4B

Srikar Dronamraju (5):
      powerpc/smp: Enable Asym packing for cores on shared processor
      powerpc/smp: Disable MC domain for shared processor
      powerpc/smp: Add __ro_after_init attribute
      powerpc/smp: Avoid asym packing within thread_group of a core
      powerpc/smp: Dynamically build Powerpc topology

Stephen Rothwell (1):
      powerpc: pmd_move_must_withdraw() is only needed for CONFIG_TRANSPARE=
NT_HUGEPAGE

Vaibhav Jain (1):
      powerpc/hvcall: Reorder Nestedv2 hcall opcodes

Zhao Ke (1):
      powerpc: Add PVN support for HeXin C2000 processor


 Documentation/userspace-api/ioctl/ioctl-number.rst          |   4 +
 MAINTAINERS                                                 |   6 +-
 arch/powerpc/Kconfig                                        |   1 +
 arch/powerpc/Kconfig.debug                                  |   1 -
 arch/powerpc/Makefile                                       |  25 +-
 arch/powerpc/boot/dts/fsl/t1023si-post.dtsi                 |  79 +--
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi                 |  71 +--
 arch/powerpc/configs/ppc64_defconfig                        |   1 +
 arch/powerpc/configs/ps3_defconfig                          |   1 +
 arch/powerpc/include/asm/book3s/64/pgtable.h                |  10 +-
 arch/powerpc/include/asm/book3s/64/tlbflush.h               |   9 +-
 arch/powerpc/include/asm/ftrace.h                           |   2 +-
 arch/powerpc/include/asm/hvcall.h                           |  20 +-
 arch/powerpc/include/asm/kvm_book3s.h                       |  10 +-
 arch/powerpc/include/asm/kvm_book3s_64.h                    |   1 +
 arch/powerpc/include/asm/linkage.h                          |   3 -
 arch/powerpc/include/asm/mmu.h                              |   4 +
 arch/powerpc/include/asm/mmzone.h                           |   8 -
 arch/powerpc/include/asm/papr-sysparm.h                     |  17 +-
 arch/powerpc/include/asm/paravirt.h                         |  33 +-
 arch/powerpc/include/asm/ppc-pci.h                          |   5 +-
 arch/powerpc/include/asm/ps3.h                              |   6 +
 arch/powerpc/include/asm/reg.h                              |   1 +
 arch/powerpc/include/asm/reg_a2.h                           | 154 ------
 arch/powerpc/include/asm/rtas.h                             |  91 ++--
 arch/powerpc/include/uapi/asm/papr-miscdev.h                |   9 +
 arch/powerpc/include/uapi/asm/papr-sysparm.h                |  58 +++
 arch/powerpc/include/uapi/asm/papr-vpd.h                    |  22 +
 arch/powerpc/kernel/cpu_specs_book3s_64.h                   |  15 +
 arch/powerpc/kernel/cputable.c                              |   4 +-
 arch/powerpc/kernel/exceptions-64e.S                        |   1 -
 arch/powerpc/kernel/rtas.c                                  | 207 ++++++--
 arch/powerpc/kernel/rtas_pci.c                              |   8 +-
 arch/powerpc/kernel/smp.c                                   | 124 +++--
 arch/powerpc/kernel/swsusp_64.c                             |   2 +
 arch/powerpc/kernel/trace/ftrace_entry.S                    |   2 -
 arch/powerpc/kernel/traps.c                                 |   2 +
 arch/powerpc/kernel/udbg_16550.c                            |   1 -
 arch/powerpc/kernel/vdso/Makefile                           |   2 +-
 arch/powerpc/kexec/core.c                                   |   1 +
 arch/powerpc/kvm/book3s.c                                   |   4 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c                      |   7 +-
 arch/powerpc/kvm/book3s_hv.c                                |  72 ++-
 arch/powerpc/kvm/book3s_hv_nested.c                         |   2 +-
 arch/powerpc/kvm/book3s_hv_nestedv2.c                       |  29 ++
 arch/powerpc/kvm/book3s_pr.c                                |   1 +
 arch/powerpc/kvm/emulate_loadstore.c                        |  21 +-
 arch/powerpc/lib/Makefile                                   |   2 +-
 arch/powerpc/lib/sstep.c                                    |  14 +-
 arch/powerpc/mm/book3s64/hash_utils.c                       |   7 +
 arch/powerpc/mm/book3s64/pgtable.c                          |   2 +
 arch/powerpc/mm/book3s64/pkeys.c                            |   3 +-
 arch/powerpc/mm/init-common.c                               |   5 +-
 arch/powerpc/mm/mmu_decl.h                                  |   5 +
 arch/powerpc/perf/hv-gpci.c                                 |   3 +
 arch/powerpc/perf/imc-pmu.c                                 |   6 +
 arch/powerpc/platforms/44x/Kconfig                          |   1 +
 arch/powerpc/platforms/44x/idle.c                           |   2 +-
 arch/powerpc/platforms/512x/mpc5121_ads_cpld.c              |   2 +
 arch/powerpc/platforms/512x/pdm360ng.c                      |   2 +-
 arch/powerpc/platforms/83xx/suspend.c                       |   5 +-
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c                   |   2 +-
 arch/powerpc/platforms/86xx/Kconfig                         |   7 -
 arch/powerpc/platforms/pasemi/setup.c                       |   2 +-
 arch/powerpc/platforms/powermac/smp.c                       |   4 +-
 arch/powerpc/platforms/powernv/opal-irqchip.c               |   2 +
 arch/powerpc/platforms/powernv/opal-powercap.c              |   6 +
 arch/powerpc/platforms/powernv/opal-prd.c                   |   2 +
 arch/powerpc/platforms/powernv/opal-xscom.c                 |   5 +
 arch/powerpc/platforms/powernv/subcore.c                    |   3 +-
 arch/powerpc/platforms/ps3/Kconfig                          |  12 -
 arch/powerpc/platforms/ps3/Makefile                         |   2 +-
 arch/powerpc/platforms/ps3/device-init.c                    |   1 +
 arch/powerpc/platforms/ps3/gelic_udbg.c                     |   1 +
 arch/powerpc/platforms/pseries/Makefile                     |   1 +
 arch/powerpc/platforms/pseries/eeh_pseries.c                |  18 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c             |  16 +-
 arch/powerpc/platforms/pseries/papr-sysparm.c               | 205 +++++++-
 arch/powerpc/platforms/pseries/papr-vpd.c                   | 541 ++++++++=
++++++++++++
 arch/powerpc/platforms/pseries/pseries.h                    |   1 +
 arch/powerpc/platforms/pseries/suspend.c                    |   1 +
 arch/powerpc/sysdev/grackle.c                               |  19 -
 arch/powerpc/sysdev/xics/icp-native.c                       |   2 +
 drivers/misc/cxl/cxl.h                                      |   3 +-
 drivers/misc/ocxl/afu_irq.c                                 |   2 +-
 drivers/misc/ocxl/context.c                                 |   2 +-
 drivers/misc/ocxl/link.c                                    |  14 +-
 drivers/misc/ocxl/main.c                                    |   2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.h                |   6 -
 tools/testing/selftests/powerpc/Makefile                    |   2 +
 tools/testing/selftests/powerpc/math/fpu.h                  |  25 +
 tools/testing/selftests/powerpc/math/fpu_asm.S              |  48 +-
 tools/testing/selftests/powerpc/math/fpu_preempt.c          |  30 +-
 tools/testing/selftests/powerpc/math/fpu_syscall.c          |   8 +-
 tools/testing/selftests/powerpc/math/vmx_preempt.c          |  10 +-
 tools/testing/selftests/powerpc/papr_sysparm/.gitignore     |   1 +
 tools/testing/selftests/powerpc/papr_sysparm/Makefile       |  12 +
 tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c | 196 +++++++
 tools/testing/selftests/powerpc/papr_vpd/.gitignore         |   1 +
 tools/testing/selftests/powerpc/papr_vpd/Makefile           |  12 +
 tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c         | 352 ++++++++=
+++++
 101 files changed, 2192 insertions(+), 603 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/reg_a2.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-miscdev.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-sysparm.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-vpd.h
 create mode 100644 arch/powerpc/platforms/pseries/papr-vpd.c
 create mode 100644 tools/testing/selftests/powerpc/math/fpu.h
 create mode 100644 tools/testing/selftests/powerpc/papr_sysparm/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/papr_sysparm/Makefile
 create mode 100644 tools/testing/selftests/powerpc/papr_sysparm/papr_syspa=
rm.c
 create mode 100644 tools/testing/selftests/powerpc/papr_vpd/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/papr_vpd/Makefile
 create mode 100644 tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmWRWKYACgkQUevqPMjh
pYCTAhAAo27KrBu64B8SCgVJK38i7gmoLYwTXfYpxYzboO0K+KmRJjn/+eqZDsMz
c9Woq47b7dk9MKLOv8Nt16fC5LGZQxKnicEKfJ20kx0mBASLMIGYSIl3eqycw1ho
+iv6fVoKt9HiefTQcy/s5fK9d2cvECMO8rriUH0iT7QU4NbJ6qHtmM9RH6jVwKMl
uVU68beC0cRGpIkVN+i+uSXIl1QG0dLI4jcISQFkZKAzTrjDBJY6uBms9PtUQGKZ
CBALHg5jyThndO0EODxY3E9GoHvOy5ai6Ft2FBMR7UcovqWI7xldfMUvvp2c9hxY
+JLnesBPZ9nm7xD32feoWFTraszC7cR04BsbU/lOxZqjBiZmVwkP3mX17hmDO5NV
KEpCYC/K/pFtVjsVGu4m1IQoSO9XfxT3iyBs73XJCuUijo6g2HwvyhtTSYjIIj40
9Ko6/idaVyecymsat0p4+n2oOy0jbVfwHrsPX8GaSQyFU7oMLHZ2JqHqx69QU4qc
+UtGqxBwpNK38wlN8Sj7ITRgFIoIpp1WO5MOOLENb56xW91G6djccfTRV+YhkpvL
y2Yd6JnuynfioVhddzNyuFowlvaX+gXeVKrwZ4gjQqE6jhtKpAfDAe9f/qR6wy/Q
Scgd3t+3poOIIsjVsCQrqPTRN2AU2Nel/zQzjWtBFNLlM/dvzNY=3D
=3DrikN
-----END PGP SIGNATURE-----
