Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7EE78ED7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 14:43:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FvM0PjgT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rc16Y2MCcz30fm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 22:43:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FvM0PjgT;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rc15f6yCjz307h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 22:42:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693485749;
	bh=4MCvfwqD68QQcBKEr2kYK4/l8xZk7Ljtk71mwv2ticQ=;
	h=From:To:Cc:Subject:Date:From;
	b=FvM0PjgTsKFd4zmTY6isaOi7Oav5PN9QB53UWCcoBLd6Ww/nNswNQOKDjcZXk9V2+
	 /R89so1NIjyFtKyQJqVwD2ncBYr9J9+Hw+losp0KyST/GkWgAWeWtdWb+JP+ZYDAP+
	 9cMinNNSgTzHzfIzeu0Bk26tMcm4xK8Hd8FT5/lwJKbvWnteSWIzN3Klayp7fuvi+4
	 WCmmUs/wOfXysff4QswMQQJ9KXqap5T4uvibWnc58PgY2Fc0Uhvyk8HfFQbf3vNKDN
	 3/fdUO/guRB+1o1XaiZtJH/mgLsnVeSxDYEQcmRp1IYbzYQi6uMJ7DXXoLgnUP1fLn
	 DGxGReq6zjDWA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rc15Z0J0hz4wxW;
	Thu, 31 Aug 2023 22:42:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.6-1 tag
Date: Thu, 31 Aug 2023 22:42:24 +1000
Message-ID: <87o7in1iz3.fsf@mail.lhotse>
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
Cc: linus.walleij@linaro.org, ruscur@russell.cc, linux-kernel@vger.kernel.org, bgray@linux.ibm.com, windhl@126.com, osandov@fb.com, tanyuan@tinylab.org, robh@kernel.org, zhengzengkai@huawei.com, aneesh.kumar@linux.ibm.com, masahiroy@kernel.org, wangxiongfeng2@huawei.com, joel@jms.id.au, u.kleine-koenig@pengutronix.de, msuchanek@suse.de, mirimmad17@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de, kjain@linux.ibm.com, naveen@kernel.org, npiggin@gmail.com, ruanjinjie@huawei.com, bhelgaas@google.com, ldufour@linux.ibm.com, hbathini@linux.ibm.com, twoerner@gmail.com, zhangjialin11@huawei.com, rdunlap@infradead.org, ndesaulniers@google.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com, krzysztof.kozlowski@linaro.org, justinstitt@google.com, fbarrat@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, gautam@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256


Hi Linus,

Please pull powerpc updates for 6.6.

There's a conflict in drivers/net/ethernet/freescale/fs_enet/fs_enet.h, whe=
re
the correct resolution is to drop the include of both linux/fs_enet_pd.h and
asm/fs_pd.h.

There's a trivial conflict in arch/powerpc/Kconfig.

There will be a conflict when you merge the tty tree, in arch/powerpc/inclu=
de/asm/fs_pd.h,
the resolution is just to take the union of all the removals leaving the fi=
le
almost empty and unused, we will remove it in a follow-up patch.
=20

Notable out of area changes:
  include/linux/hw_breakpoint.h	# 53834a0c0925 perf/hw_breakpoint: Remove a=
rch breakpoint hooks
  kernel/events/hw_breakpoint.c	# 53834a0c0925 perf/hw_breakpoint: Remove a=
rch breakpoint hooks
  drivers/net/ethernet/freescale/fs_enet/fs_enet.h	# 60bc069c433f powerpc/i=
nclude: Remove unneeded #include <asm/fs_pd.h>
  drivers/net/ethernet/freescale/fs_enet/mac-fcc.c	# fecc436a97af powerpc/i=
nclude: Remove mpc8260.h and m82xx_pci.h

cheers


The following changes since commit 6eaae198076080886b9e7d57f4ae06fa782f90ef:

  Linux 6.5-rc3 (2023-07-23 15:24:10 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.6-1

for you to fetch changes up to 85a616416e9e01db0bfa92f26457e92642e2236b:

  macintosh/ams: linux/platform_device.h is needed (2023-08-31 21:23:13 +10=
00)

- ------------------------------------------------------------------
powerpc updates for 6.6

 - Add HOTPLUG_SMT support (/sys/devices/system/cpu/smt) and honour the
   configured SMT state when hotplugging CPUs into the system.

 - Combine final TLB flush and lazy TLB mm shootdown IPIs when using the Ra=
dix
   MMU to avoid a broadcast TLBIE flush on exit.

 - Drop the exclusion between ptrace/perf watchpoints, and drop the now unu=
sed
   associated arch hooks.

 - Add support for the "nohlt" command line option to disable CPU idle.

 - Add support for -fpatchable-function-entry for ftrace, with GCC >=3D 13.=
1.

 - Rework memory block size determination, and support 256MB size on systems
   with GPUs that have hotpluggable memory.

 - Various other small features and fixes.

Thanks to: Andrew Donnellan, Aneesh Kumar K.V, Arnd Bergmann, Athira Rajeev,
Benjamin Gray, Christophe Leroy, Frederic Barrat, Gautam Menghani, Geoff Le=
vand,
Hari Bathini, Immad Mir, Jialin Zhang, Joel Stanley, Jordan Niethe, Justin
Stitt, Kajol Jain, Kees Cook, Krzysztof Kozlowski, Laurent Dufour, Liang He,
Linus Walleij, Mahesh Salgaonkar, Masahiro Yamada, Michal Suchanek, Nageswa=
ra
R Sastry, Nathan Chancellor, Nathan Lynch, Naveen N Rao, Nicholas Piggin, N=
ick
Desaulniers, Omar Sandoval, Randy Dunlap, Reza Arbab, Rob Herring, Russell
Currey, Sourabh Jain, Thomas Gleixner, Trevor Woerner, Uwe Kleine-K=C3=B6ni=
g, Vaibhav
Jain, Xiongfeng Wang, Yuan Tan, Zhang Rui, Zheng Zengkai.

- ------------------------------------------------------------------
Aneesh Kumar K.V (3):
      powerpc/mm: Cleanup memory block size probing
      powerpc/mm/book3s64: Fix build error with SPARSEMEM disabled
      powerpc/mm/book3s64: Use 256M as the upper limit with coherent device=
 memory attached

Arnd Bergmann (4):
      powerpc: address missing-prototypes warnings
      powerpc: mark more local variables as volatile
      powerpc: xmon: remove unused variables
      macintosh/ams: mark ams_init() static

Benjamin Gray (11):
      selftests/powerpc/ptrace: Explain why tests are skipped
      selftests/powerpc/ptrace: Fix typo in pid_max search error
      selftests/powerpc/ptrace: Declare test temporary variables as volatile
      powerpc/watchpoints: Explain thread_change_pc() more
      powerpc/watchpoints: Don't track info persistently
      powerpc/watchpoints: Track perf single step directly on the breakpoint
      powerpc/watchpoints: Simplify watchpoint reinsertion
      powerpc/watchpoints: Remove ptrace/perf exclusion tracking
      selftests/powerpc/ptrace: Update ptrace-perf watchpoint selftest
      perf/hw_breakpoint: Remove arch breakpoint hooks
      Documentation/powerpc: Fix ptrace request names

Christophe Leroy (35):
      powerpc/kuap: Avoid unnecessary reads of MD_AP
      powerpc/kuap: Avoid useless jump_label on empty function
      powerpc/kuap: Fold kuep_is_disabled() into its only user
      powerpc/features: Add capability to update mmu features later
      powerpc/kuap: MMU_FTR_BOOK3S_KUAP becomes MMU_FTR_KUAP
      powerpc/kuap: Use MMU_FTR_KUAP on all and refactor disabling kuap
      powerpc/kuap: Simplify KUAP lock/unlock on BOOK3S/32
      powerpc/kuap: KUAP enabling/disabling functions must be __always_inli=
ne
      powerpc/kuap: Use ASM feature fixups instead of static branches
      powerpc/radix: Move some functions into #ifdef CONFIG_KVM_BOOK3S_HV_P=
OSSIBLE
      powerpc/include: Remove unneeded #include <asm/fs_pd.h>
      powerpc/include: Declare mpc8xx_immr in 8xx_immap.h
      powerpc/include: Remove mpc8260.h and m82xx_pci.h
      powerpc: Remove CONFIG_PCI_8260
      powerpc/8xx: Remove immr_map() and immr_unmap()
      powerpc/cpm2: Remove cpm2_map() and cpm2_unmap()
      powerpc/step: Mark __copy_mem_out() and __emulate_dcbz() __always_inl=
ine
      powerpc/reg: Remove #ifdef around mtspr macro
      powerpc/ptrace: Split gpr32_set_common
      powerpc/512x: Make mpc512x_select_reset_compat() static
      powerpc/fsl_pci: Make fsl_add_bridge() static
      powerpc/83xx: Fix style problems in usb.c and remove unneccessary inc=
ludes from mpc83xx.h
      powerpc/83xx: Split usb.c
      powerpc/82xx: Remove pq2_init_pci
      powerpc/82xx: Remove CONFIG_8260 and CONFIG_8272
      powerpc/8xx: Remove init_internal_rtc() to fix no previous prototype =
error
      powerpc/32s: Cleanup the mess in __set_pte_at()
      powerpc/4xx: Remove WatchdogHandler() to fix no previous prototype er=
ror
      powerpc/4xx: Remove pika_dtm_[un]register_shutdown() to fix no previo=
us prototype
      powerpc/47x: Remove early_init_mmu_47x() to fix no previous prototype
      powerpc/47x: Add prototype for mmu_init_secondary()
      powerpc/4xx: Add missing includes to fix no previous prototype errors
      powerpc/perf: Convert fsl_emb notifier to state machine callbacks
      powerpc/64e: Fix circular dependency with CONFIG_SMP disabled
      powerpc/85xx: Mark some functions static and add missing includes to =
fix no previous prototype error

Gautam Menghani (1):
      powerpc/xics: Remove unnecessary endian conversion

Hari Bathini (1):
      powerpc/fadump: invoke ibm,os-term with rtas_call_unlocked()

Immad Mir (1):
      powerpc/powernv: fix debugfs_create_dir() error checking

Jialin Zhang (1):
      powerpc/eeh: Use pci_dev_id() to simplify the code

Joel Stanley (1):
      powerpc/config: Disable SLAB_DEBUG_ON in skiroot

Justin Stitt (1):
      powerpc/ps3: refactor strncpy usage

Kajol Jain (10):
      powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show process=
or bus topology information
      docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document processor=
_bus_topology sysfs interface file
      powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show process=
or config information
      docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document processor=
_config sysfs interface file
      powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinit=
y domain via virtual processor information
      docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document affinity_=
domain_via_virtual_processor sysfs interface file
      powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinit=
y domain via domain information
      docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document affinity_=
domain_via_domain sysfs interface file
      powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinit=
y domain via partition information
      docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document affinity_=
domain_via_partition sysfs interface file

Krzysztof Kozlowski (1):
      powerpc: dts: add missing space before {

Laurent Dufour (1):
      powerpc/kexec: fix minor typo

Liang He (1):
      powerpc/mpc5xxx: Add missing fwnode_handle_put()

Linus Walleij (1):
      powerpc: Make virt_to_pfn() a static inline

Mahesh Salgaonkar (2):
      powerpc/rtas: export rtas_error_rc() for reuse.
      PCI: rpaphp: Error out on busy status from get-sensor-state

Masahiro Yamada (3):
      powerpc: remove unneeded #include <asm/export.h>
      powerpc: replace #include <asm/export.h> with #include <linux/export.=
h>
      powerpc: remove <asm/export.h>

Michael Ellerman (15):
      powerpc/64: Enable accelerated crypto algorithms in defconfig
      Merge tag 'smp-core-for-ppc-23-07-28' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/tip/tip into topic/cpu-smt
      powerpc/pseries: Initialise CPU hotplug callbacks earlier
      powerpc: Add HOTPLUG_SMT support
      powerpc/pseries: Honour current SMT state when DLPAR onlining CPUs
      Merge branch 'topic/cpu-smt' into next
      powerpc/powernv: Fix fortify source warnings in opal-prd.c
      powerpc/powernv: Use struct opal_prd_msg in more places
      powerpc: Drop zalloc_maybe_bootmem()
      cxl: Drop unused detach_spa()
      powerpc/pseries: Move VPHN constants into vphn.h
      powerpc/pseries: Move hcall_vphn() prototype into vphn.h
      powerpc: Don't include lppaca.h in paca.h
      powerpc/powermac: Fix unused function warning
      powerpc/64s: Move CPU -mtune options into Kconfig

Michal Suchanek (1):
      powerpc: Move DMA64_PROPNAME define to a header

Nathan Lynch (2):
      powerpc/selftests: sort mm/.gitignore, add exec_prot
      selftests/powerpc: add const qualification where possible

Naveen N Rao (16):
      powerpc/ftrace: Fix dropping weak symbols with older toolchains
      powerpc/module: Remove unused .ftrace.tramp section
      powerpc64/ftrace: Move ELFv1 and -pg support code into a separate file
      powerpc/ftrace: Simplify function_graph support in ftrace.c
      powerpc/ftrace: Use FTRACE_REGS_ADDR to identify the correct ftrace t=
rampoline
      powerpc/ftrace: Extend ftrace support for large kernels to ppc32
      powerpc/ftrace: Consolidate ftrace support into fewer files
      powerpc/ftrace: Refactor ftrace_modify_code()
      powerpc/ftrace: Stop re-purposing linker generated long branches for =
ftrace
      powerpc/ftrace: Add separate ftrace_init_nop() with additional valida=
tion
      powerpc/ftrace: Simplify ftrace_make_nop()
      powerpc/ftrace: Simplify ftrace_make_call()
      powerpc/ftrace: Simplify ftrace_modify_call()
      powerpc/ftrace: Replace use of ftrace_call_replace() with ftrace_crea=
te_branch_inst()
      powerpc/ftrace: Implement ftrace_replace_code()
      powerpc/ftrace: Add support for -fpatchable-function-entry

Nicholas Piggin (6):
      powerpc: Account mm_cpumask and active_cpus in init_mm
      powerpc/64s: Use dec_mm_active_cpus helper
      powerpc: Add mm_cpumask warning when context switching
      powerpc/64s/radix: combine final TLB flush and lazy tlb mm shootdown =
IPIs
      powerpc/pseries: Fix hcall tracepoints with JUMP_LABEL=3Dn
      powerpc/pseries: Remove unused hcall tracing instruction

Nick Desaulniers (3):
      powerpc/inst: add PPC_TLBILX_LPID
      Revert "powerpc/xmon: Relax frame size for clang"
      powerpc/xmon: Reapply "Relax frame size for clang"

Omar Sandoval (2):
      powerpc/crypto: fix missing skcipher dependency for aes-gcm-p10
      powerpc/crypto: don't build aes-gcm-p10 by default

Randy Dunlap (2):
      powerpc/pseries: PLPKS: undo kernel-doc comment notation
      macintosh/ams: linux/platform_device.h is needed

Rob Herring (1):
      powerpc: Explicitly include correct DT includes

Russell Currey (2):
      powerpc/pseries: Rework lppaca_shared_proc() to avoid DEBUG_PREEMPT
      powerpc/iommu: Fix notifiers being shared by PCI and VIO buses

Sourabh Jain (1):
      powerpc/fadump: reset dump area size if fadump memory reserve fails

Trevor Woerner (1):
      powerpc/configs: Drop CONFIG_IP_NF_TARGET_CLUSTERIP

Uwe Kleine-K=C3=B6nig (1):
      powerpc/ep8248e: Mark driver as non removable

Vaibhav Jain (1):
      powerpc/idle: Add support for nohlt

Xiongfeng Wang (2):
      cxl: Use pci_find_vsec_capability() to simplify the code
      powerpc/powernv/pci: use pci_dev_id() to simplify the code

Yuan Tan (1):
      powerpc/pmac32: enable serial options by default in defconfig

Zheng Zengkai (1):
      ocxl: Use pci_dev_id() to simplify the code

ruanjinjie (1):
      powerpc/pseries: fix possible memory leak in ibmebus_bus_init()


 Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci    | 160 =
++++
 Documentation/admin-guide/kernel-parameters.txt                     |   6 =
+-
 Documentation/powerpc/ptrace.rst                                    |   8 =
+-
 arch/powerpc/Kconfig                                                |  23 =
+-
 arch/powerpc/Makefile                                               |   9 =
+-
 arch/powerpc/boot/dts/fsl/c293si-post.dtsi                          |  12 =
+-
 arch/powerpc/boot/dts/fsl/p1022rdk.dts                              |  10 =
+-
 arch/powerpc/boot/dts/fsl/p1022si-post.dtsi                         |   2 =
+-
 arch/powerpc/boot/dts/fsl/p3041ds.dts                               |   4 =
+-
 arch/powerpc/boot/dts/fsl/p5040ds.dts                               |   2 =
+-
 arch/powerpc/boot/dts/fsl/t4240qds.dts                              |   2 =
+-
 arch/powerpc/boot/dts/mpc5121.dtsi                                  |   2 =
+-
 arch/powerpc/boot/dts/mpc5125twr.dts                                |   2 =
+-
 arch/powerpc/configs/pmac32_defconfig                               |   3 =
+-
 arch/powerpc/configs/ppc64_defconfig                                |   3 +
 arch/powerpc/configs/ppc6xx_defconfig                               |   1 -
 arch/powerpc/configs/skiroot_defconfig                              |   1 -
 arch/powerpc/crypto/Kconfig                                         |   2 =
+-
 arch/powerpc/include/asm/8xx_immap.h                                |   2 +
 arch/powerpc/include/asm/Kbuild                                     |   1 -
 arch/powerpc/include/asm/book3s/32/kup.h                            | 123 =
++-
 arch/powerpc/include/asm/book3s/32/pgtable.h                        |  77 =
+-
 arch/powerpc/include/asm/book3s/64/hash-pkey.h                      |   2 =
+-
 arch/powerpc/include/asm/book3s/64/kup.h                            |  54 =
+-
 arch/powerpc/include/asm/book3s/64/mmu.h                            |   7 =
+-
 arch/powerpc/include/asm/bug.h                                      |   1 +
 arch/powerpc/include/asm/cpm2.h                                     |   3 +
 arch/powerpc/include/asm/cputable.h                                 |   2 =
+-
 arch/powerpc/include/asm/dtl.h                                      |   1 -
 arch/powerpc/include/asm/feature-fixups.h                           |   1 +
 arch/powerpc/include/asm/fs_pd.h                                    |  22 -
 arch/powerpc/include/asm/ftrace.h                                   |  24 =
+-
 arch/powerpc/include/asm/hw_breakpoint.h                            |   1 +
 arch/powerpc/include/asm/ibmebus.h                                  |   2 +
 arch/powerpc/include/asm/iommu.h                                    |   3 +
 arch/powerpc/include/asm/kfence.h                                   |   2 =
+-
 arch/powerpc/include/asm/kup.h                                      |  91 =
+-
 arch/powerpc/include/asm/lppaca.h                                   |  37 =
+-
 arch/powerpc/include/asm/macio.h                                    |   3 =
+-
 arch/powerpc/include/asm/mmu.h                                      |   9 =
+-
 arch/powerpc/include/asm/mmu_context.h                              |   1 +
 arch/powerpc/include/asm/module.h                                   |   4 -
 arch/powerpc/include/asm/mpc8260.h                                  |  22 -
 arch/powerpc/include/asm/nohash/32/kup-8xx.h                        |  62 =
+-
 arch/powerpc/include/asm/nohash/32/pgtable.h                        |   2 =
+-
 arch/powerpc/include/asm/nohash/64/pgtable.h                        |   2 =
+-
 arch/powerpc/include/asm/nohash/kup-booke.h                         |  68 =
+-
 arch/powerpc/include/asm/nohash/mmu-e500.h                          |   3 +
 arch/powerpc/include/asm/paca.h                                     |   6 =
+-
 arch/powerpc/include/asm/page.h                                     |  30 =
+-
 arch/powerpc/include/asm/paravirt.h                                 |   1 +
 arch/powerpc/include/asm/pci.h                                      |   3 =
+-
 arch/powerpc/include/asm/pgtable.h                                  |   4 =
+-
 arch/powerpc/include/asm/plpar_wrappers.h                           |   1 +
 arch/powerpc/include/asm/ppc-opcode.h                               |   2 +
 arch/powerpc/include/asm/processor.h                                |   5 -
 arch/powerpc/include/asm/reg.h                                      |   2 -
 arch/powerpc/include/asm/rtas.h                                     |   3 +
 arch/powerpc/include/asm/sections.h                                 |   2 +
 arch/powerpc/include/asm/setup.h                                    |   1 -
 arch/powerpc/include/asm/topology.h                                 |  15 +
 arch/powerpc/include/asm/uaccess.h                                  |   6 =
+-
 arch/powerpc/include/asm/vermagic.h                                 |   4 =
+-
 arch/powerpc/include/asm/vphn.h                                     |  24 +
 arch/powerpc/kernel/audit.c                                         |   3 =
+-
 arch/powerpc/kernel/audit_32.h                                      |   7 +
 arch/powerpc/kernel/compat_audit.c                                  |   2 +
 arch/powerpc/kernel/cputable.c                                      |   4 +
 arch/powerpc/kernel/entry_32.S                                      |   1 -
 arch/powerpc/kernel/epapr_hcalls.S                                  |   2 =
+-
 arch/powerpc/kernel/fadump.c                                        |   1 +
 arch/powerpc/kernel/fpu.S                                           |   2 =
+-
 arch/powerpc/kernel/head_40x.S                                      |   1 -
 arch/powerpc/kernel/head_44x.S                                      |   1 -
 arch/powerpc/kernel/head_64.S                                       |   1 -
 arch/powerpc/kernel/head_85xx.S                                     |   1 -
 arch/powerpc/kernel/head_8xx.S                                      |   1 -
 arch/powerpc/kernel/head_book3s_32.S                                |   1 -
 arch/powerpc/kernel/hw_breakpoint.c                                 | 388 =
++-------
 arch/powerpc/kernel/iommu.c                                         |  17 =
+-
 arch/powerpc/kernel/legacy_serial.c                                 |   2 =
+-
 arch/powerpc/kernel/misc.S                                          |   2 =
+-
 arch/powerpc/kernel/misc_32.S                                       |   2 =
+-
 arch/powerpc/kernel/misc_64.S                                       |   2 =
+-
 arch/powerpc/kernel/module_64.c                                     |   2 =
+-
 arch/powerpc/kernel/of_platform.c                                   |   4 =
+-
 arch/powerpc/kernel/pci-common.c                                    |   2 =
+-
 arch/powerpc/kernel/pmc.c                                           |   2 =
+-
 arch/powerpc/kernel/ptrace/ptrace-view.c                            | 105 =
++-
 arch/powerpc/kernel/rtas.c                                          |  45 =
+-
 arch/powerpc/kernel/setup-common.c                                  |  10 =
+-
 arch/powerpc/kernel/smp.c                                           |  20 =
+-
 arch/powerpc/kernel/syscall.c                                       |   2 =
+-
 arch/powerpc/kernel/tm.S                                            |   2 =
+-
 arch/powerpc/kernel/trace/Makefile                                  |  12 =
+-
 arch/powerpc/kernel/trace/ftrace.c                                  | 858 =
+++++--------------
 arch/powerpc/kernel/trace/ftrace_64_pg.S                            |  67 =
--
 arch/powerpc/kernel/trace/ftrace_64_pg.c                            | 846 =
+++++++++++++++++++
 arch/powerpc/kernel/trace/{ftrace_low.S =3D> ftrace_64_pg_entry.S}    |  6=
6 +-
 arch/powerpc/kernel/trace/{ftrace_mprofile.S =3D> ftrace_entry.S}     |  6=
9 +-
 arch/powerpc/kernel/traps.c                                         |  15 =
+-
 arch/powerpc/kernel/ucall.S                                         |   2 =
+-
 arch/powerpc/kernel/vector.S                                        |   2 =
+-
 arch/powerpc/kernel/vmlinux.lds.S                                   |   4 -
 arch/powerpc/kexec/crash.c                                          |   2 =
+-
 arch/powerpc/kexec/file_load_64.c                                   |  13 =
+-
 arch/powerpc/kexec/ranges.c                                         |   2 =
+-
 arch/powerpc/kvm/book3s_64_entry.S                                  |   2 =
+-
 arch/powerpc/kvm/book3s_64_mmu_hv.c                                 |   2 =
+-
 arch/powerpc/kvm/book3s_hv_ras.c                                    |   1 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                             |   2 =
+-
 arch/powerpc/kvm/e500mc.c                                           |   7 =
+-
 arch/powerpc/kvm/tm.S                                               |   2 =
+-
 arch/powerpc/lib/Makefile                                           |   2 =
+-
 arch/powerpc/lib/alloc.c                                            |  23 -
 arch/powerpc/lib/checksum_32.S                                      |   2 =
+-
 arch/powerpc/lib/checksum_64.S                                      |   2 =
+-
 arch/powerpc/lib/copy_32.S                                          |   2 =
+-
 arch/powerpc/lib/copy_mc_64.S                                       |   2 =
+-
 arch/powerpc/lib/copypage_64.S                                      |   2 =
+-
 arch/powerpc/lib/copyuser_64.S                                      |   2 =
+-
 arch/powerpc/lib/feature-fixups.c                                   |  31 =
+-
 arch/powerpc/lib/hweight_64.S                                       |   2 =
+-
 arch/powerpc/lib/mem_64.S                                           |   2 =
+-
 arch/powerpc/lib/memcmp_32.S                                        |   2 =
+-
 arch/powerpc/lib/memcmp_64.S                                        |   2 =
+-
 arch/powerpc/lib/memcpy_64.S                                        |   2 =
+-
 arch/powerpc/lib/sstep.c                                            |   4 =
+-
 arch/powerpc/lib/string.S                                           |   2 =
+-
 arch/powerpc/lib/string_32.S                                        |   2 =
+-
 arch/powerpc/lib/string_64.S                                        |   2 =
+-
 arch/powerpc/lib/strlen_32.S                                        |   2 =
+-
 arch/powerpc/mm/book3s32/hash_low.S                                 |   2 =
+-
 arch/powerpc/mm/book3s32/kuap.c                                     |  20 =
+-
 arch/powerpc/mm/book3s32/mmu_context.c                              |   2 =
+-
 arch/powerpc/mm/book3s64/pgtable.c                                  |   1 +
 arch/powerpc/mm/book3s64/pkeys.c                                    |   2 =
+-
 arch/powerpc/mm/book3s64/radix_pgtable.c                            |  65 =
+-
 arch/powerpc/mm/book3s64/radix_tlb.c                                | 272 =
+++---
 arch/powerpc/mm/book3s64/slb.c                                      |   1 +
 arch/powerpc/mm/init_32.c                                           |   2 +
 arch/powerpc/mm/init_64.c                                           | 127 =
+++
 arch/powerpc/mm/mmu_context.c                                       |   8 =
+-
 arch/powerpc/mm/mmu_decl.h                                          |   1 +
 arch/powerpc/mm/nohash/kup.c                                        |   8 =
+-
 arch/powerpc/mm/nohash/tlb.c                                        |  19 =
+-
 arch/powerpc/mm/numa.c                                              |   1 +
 arch/powerpc/perf/core-fsl-emb.c                                    |   8 =
+-
 arch/powerpc/perf/hv-gpci.c                                         | 637 =
+++++++++++++-
 arch/powerpc/platforms/44x/warp.c                                   |  55 =
--
 arch/powerpc/platforms/4xx/cpm.c                                    |   2 =
+-
 arch/powerpc/platforms/4xx/hsta_msi.c                               |   2 =
+-
 arch/powerpc/platforms/4xx/soc.c                                    |   3 =
+-
 arch/powerpc/platforms/4xx/uic.c                                    |   1 +
 arch/powerpc/platforms/512x/mpc5121_ads.c                           |   2 =
+-
 arch/powerpc/platforms/512x/mpc512x.h                               |   1 -
 arch/powerpc/platforms/512x/mpc512x_generic.c                       |   2 =
+-
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c                       |   2 =
+-
 arch/powerpc/platforms/512x/mpc512x_shared.c                        |  30 =
+-
 arch/powerpc/platforms/512x/pdm360ng.c                              |   3 =
+-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c                           |   3 =
+-
 arch/powerpc/platforms/82xx/Kconfig                                 |  24 =
+-
 arch/powerpc/platforms/82xx/ep8248e.c                               |  10 =
+-
 arch/powerpc/platforms/82xx/km82xx.c                                |   1 -
 arch/powerpc/platforms/82xx/m82xx_pci.h                             |  14 -
 arch/powerpc/platforms/82xx/pq2.c                                   |  46 -
 arch/powerpc/platforms/83xx/Makefile                                |   5 =
+-
 arch/powerpc/platforms/83xx/km83xx.c                                |   4 =
+-
 arch/powerpc/platforms/83xx/mpc832x_rdb.c                           |   4 =
+-
 arch/powerpc/platforms/83xx/mpc83xx.h                               |   2 -
 arch/powerpc/platforms/83xx/suspend.c                               |   2 =
+-
 arch/powerpc/platforms/83xx/usb.c                                   | 251 =
------
 arch/powerpc/platforms/83xx/usb_831x.c                              | 128 =
+++
 arch/powerpc/platforms/83xx/usb_834x.c                              |  90 =
++
 arch/powerpc/platforms/83xx/usb_837x.c                              |  58 =
++
 arch/powerpc/platforms/85xx/bsc913x_qds.c                           |   2 =
+-
 arch/powerpc/platforms/85xx/bsc913x_rdb.c                           |   2 =
+-
 arch/powerpc/platforms/85xx/c293pcie.c                              |   3 =
+-
 arch/powerpc/platforms/85xx/common.c                                |   1 +
 arch/powerpc/platforms/85xx/corenet_generic.c                       |   6 =
+-
 arch/powerpc/platforms/85xx/ge_imp3a.c                              |   2 =
+-
 arch/powerpc/platforms/85xx/ksi8560.c                               |   3 =
+-
 arch/powerpc/platforms/85xx/mpc8536_ds.c                            |   2 =
+-
 arch/powerpc/platforms/85xx/mpc85xx_ds.c                            |   2 =
+-
 arch/powerpc/platforms/85xx/mpc85xx_mds.c                           |   4 =
+-
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c                           |   3 =
+-
 arch/powerpc/platforms/85xx/p1010rdb.c                              |   2 =
+-
 arch/powerpc/platforms/85xx/p1022_ds.c                              |   2 =
+-
 arch/powerpc/platforms/85xx/p1022_rdk.c                             |   2 =
+-
 arch/powerpc/platforms/85xx/p1023_rdb.c                             |   3 =
+-
 arch/powerpc/platforms/85xx/qemu_e500.c                             |   2 =
+-
 arch/powerpc/platforms/85xx/socrates.c                              |   2 =
+-
 arch/powerpc/platforms/85xx/socrates_fpga_pic.c                     |   1 -
 arch/powerpc/platforms/85xx/stx_gp3.c                               |   2 =
+-
 arch/powerpc/platforms/85xx/tqm85xx.c                               |   2 =
+-
 arch/powerpc/platforms/85xx/twr_p102x.c                             |   3 =
+-
 arch/powerpc/platforms/85xx/xes_mpc85xx.c                           |   2 =
+-
 arch/powerpc/platforms/86xx/common.c                                |   3 +
 arch/powerpc/platforms/86xx/gef_ppc9a.c                             |   2 =
+-
 arch/powerpc/platforms/86xx/gef_sbc310.c                            |   2 =
+-
 arch/powerpc/platforms/86xx/gef_sbc610.c                            |   2 =
+-
 arch/powerpc/platforms/86xx/mvme7100.c                              |   1 -
 arch/powerpc/platforms/86xx/pic.c                                   |   4 =
+-
 arch/powerpc/platforms/8xx/adder875.c                               |   2 =
+-
 arch/powerpc/platforms/8xx/cpm1.c                                   |  10 =
+-
 arch/powerpc/platforms/8xx/m8xx_setup.c                             |  79 =
+-
 arch/powerpc/platforms/8xx/mpc86xads_setup.c                        |   1 -
 arch/powerpc/platforms/8xx/mpc885ads_setup.c                        |   1 -
 arch/powerpc/platforms/8xx/tqm8xx_setup.c                           |   1 -
 arch/powerpc/platforms/Kconfig                                      |   2 =
+-
 arch/powerpc/platforms/Kconfig.cputype                              |   7 +
 arch/powerpc/platforms/cell/axon_msi.c                              |   3 =
+-
 arch/powerpc/platforms/cell/cbe_regs.c                              |   3 =
+-
 arch/powerpc/platforms/cell/iommu.c                                 |   2 =
+-
 arch/powerpc/platforms/cell/ras.c                                   |   2 =
+-
 arch/powerpc/platforms/cell/setup.c                                 |   1 +
 arch/powerpc/platforms/cell/spider-pci.c                            |   1 -
 arch/powerpc/platforms/cell/spu_manage.c                            |   1 +
 arch/powerpc/platforms/embedded6xx/holly.c                          |   2 =
+-
 arch/powerpc/platforms/maple/setup.c                                |   3 =
+-
 arch/powerpc/platforms/pasemi/gpio_mdio.c                           |   2 =
+-
 arch/powerpc/platforms/pasemi/pasemi.h                              |   1 +
 arch/powerpc/platforms/pasemi/setup.c                               |   2 +
 arch/powerpc/platforms/pasemi/time.c                                |   2 +
 arch/powerpc/platforms/powermac/feature.c                           |  10 =
+-
 arch/powerpc/platforms/powermac/setup.c                             |   2 =
+-
 arch/powerpc/platforms/powernv/eeh-powernv.c                        |   3 =
+-
 arch/powerpc/platforms/powernv/ocxl.c                               |   2 =
+-
 arch/powerpc/platforms/powernv/opal-imc.c                           |   1 -
 arch/powerpc/platforms/powernv/opal-prd.c                           |  27 =
+-
 arch/powerpc/platforms/powernv/opal-rtc.c                           |   3 =
+-
 arch/powerpc/platforms/powernv/opal-secvar.c                        |   2 =
+-
 arch/powerpc/platforms/powernv/opal-sensor.c                        |   2 +
 arch/powerpc/platforms/powernv/opal-xscom.c                         |   4 =
+-
 arch/powerpc/platforms/powernv/pci-ioda.c                           |   6 =
+-
 arch/powerpc/platforms/powernv/setup.c                              |  10 =
+-
 arch/powerpc/platforms/ps3/repository.c                             |   4 =
+-
 arch/powerpc/platforms/pseries/hotplug-cpu.c                        |  30 =
+-
 arch/powerpc/platforms/pseries/hotplug-memory.c                     |  60 =
+-
 arch/powerpc/platforms/pseries/hvCall.S                             |   2 =
+-
 arch/powerpc/platforms/pseries/ibmebus.c                            |   2 +
 arch/powerpc/platforms/pseries/iommu.c                              |   2 -
 arch/powerpc/platforms/pseries/lpar.c                               |  11 =
+-
 arch/powerpc/platforms/pseries/lparcfg.c                            |   4 =
+-
 arch/powerpc/platforms/pseries/plpks.c                              |   2 =
+-
 arch/powerpc/platforms/pseries/pseries.h                            |   4 =
+-
 arch/powerpc/platforms/pseries/setup.c                              |  11 =
+-
 arch/powerpc/platforms/pseries/vas.c                                |   1 +
 arch/powerpc/platforms/pseries/vphn.c                               |   2 =
+-
 arch/powerpc/sysdev/cpm2.c                                          |  33 =
+-
 arch/powerpc/sysdev/cpm2_pic.c                                      |   4 =
+-
 arch/powerpc/sysdev/cpm_common.c                                    |   2 -
 arch/powerpc/sysdev/cpm_gpio.c                                      |   3 =
+-
 arch/powerpc/sysdev/dcr-low.S                                       |   2 =
+-
 arch/powerpc/sysdev/ehv_pic.c                                       |  12 =
+-
 arch/powerpc/sysdev/fsl_pci.c                                       |   4 =
+-
 arch/powerpc/sysdev/fsl_pci.h                                       |   1 -
 arch/powerpc/sysdev/fsl_pmc.c                                       |   4 =
+-
 arch/powerpc/sysdev/fsl_rio.c                                       |  13 =
+-
 arch/powerpc/sysdev/fsl_rmu.c                                       |   3 =
+-
 arch/powerpc/sysdev/fsl_soc.c                                       |   1 -
 arch/powerpc/sysdev/mpc5xxx_clocks.c                                |   4 =
+-
 arch/powerpc/sysdev/mpic_msgr.c                                     |   3 =
+-
 arch/powerpc/sysdev/mpic_timer.c                                    |   1 -
 arch/powerpc/sysdev/of_rtc.c                                        |   4 =
+-
 arch/powerpc/sysdev/pmi.c                                           |   4 =
+-
 arch/powerpc/sysdev/xics/ics-opal.c                                 |   1 -
 arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh           |  26 +
 arch/powerpc/xmon/Makefile                                          |  10 =
+-
 arch/powerpc/xmon/xmon.c                                            |  11 =
+-
 drivers/cpuidle/cpuidle-pseries.c                                   |   8 =
+-
 drivers/macintosh/ams/ams-core.c                                    |   2 =
+-
 drivers/macintosh/ams/ams.h                                         |   1 +
 drivers/misc/cxl/native.c                                           |   5 -
 drivers/misc/cxl/pci.c                                              |  11 =
+-
 drivers/net/ethernet/freescale/fs_enet/fs_enet.h                    |   2 -
 drivers/net/ethernet/freescale/fs_enet/mac-fcc.c                    |   1 -
 drivers/pci/hotplug/rpaphp_pci.c                                    |  85 =
+-
 include/linux/hw_breakpoint.h                                       |   3 -
 kernel/events/hw_breakpoint.c                                       |  28 -
 tools/testing/selftests/powerpc/copyloops/{asm =3D> linux}/export.h   |   0
 tools/testing/selftests/powerpc/harness.c                           |   4 =
+-
 tools/testing/selftests/powerpc/include/subunit.h                   |  16 =
+-
 tools/testing/selftests/powerpc/include/utils.h                     |   2 =
+-
 tools/testing/selftests/powerpc/mm/.gitignore                       |  17 =
+-
 tools/testing/selftests/powerpc/ptrace/Makefile                     |   1 +
 tools/testing/selftests/powerpc/ptrace/child.h                      |   4 =
+-
 tools/testing/selftests/powerpc/ptrace/core-pkey.c                  |   2 =
+-
 tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c               |   2 =
+-
 tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c             |  26 =
+-
 tools/testing/selftests/powerpc/ptrace/ptrace-perf-asm.S            |  33 +
 tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c        | 882 =
++++++++------------
 tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c                |   2 =
+-
 tools/testing/selftests/powerpc/ptrace/ptrace-tar.c                 |   2 =
+-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c              |   4 =
+-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c          |   4 =
+-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c          |   4 =
+-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c          |   4 =
+-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spr.c              |   4 =
+-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c              |   4 =
+-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c              |   4 =
+-
 tools/testing/selftests/powerpc/ptrace/ptrace-vsx.c                 |   2 =
+-
 tools/testing/selftests/powerpc/stringloops/{asm =3D> linux}/export.h |   0
 tools/testing/selftests/powerpc/vphn/asm/lppaca.h                   |   1 -
 tools/testing/selftests/powerpc/vphn/asm/vphn.h                     |   1 +
 305 files changed, 4042 insertions(+), 3290 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/mpc8260.h
 create mode 100644 arch/powerpc/include/asm/vphn.h
 create mode 100644 arch/powerpc/kernel/audit_32.h
 delete mode 100644 arch/powerpc/kernel/trace/ftrace_64_pg.S
 create mode 100644 arch/powerpc/kernel/trace/ftrace_64_pg.c
 rename arch/powerpc/kernel/trace/{ftrace_low.S =3D> ftrace_64_pg_entry.S} =
(53%)
 rename arch/powerpc/kernel/trace/{ftrace_mprofile.S =3D> ftrace_entry.S} (=
83%)
 delete mode 100644 arch/powerpc/lib/alloc.c
 delete mode 100644 arch/powerpc/platforms/82xx/m82xx_pci.h
 delete mode 100644 arch/powerpc/platforms/83xx/usb.c
 create mode 100644 arch/powerpc/platforms/83xx/usb_831x.c
 create mode 100644 arch/powerpc/platforms/83xx/usb_834x.c
 create mode 100644 arch/powerpc/platforms/83xx/usb_837x.c
 create mode 100755 arch/powerpc/tools/gcc-check-fpatchable-function-entry.=
sh
 rename tools/testing/selftests/powerpc/copyloops/{asm =3D> linux}/export.h=
 (100%)
 create mode 100644 tools/testing/selftests/powerpc/ptrace/ptrace-perf-asm.S
 rename tools/testing/selftests/powerpc/stringloops/{asm =3D> linux}/export=
.h (100%)
 delete mode 120000 tools/testing/selftests/powerpc/vphn/asm/lppaca.h
 create mode 120000 tools/testing/selftests/powerpc/vphn/asm/vphn.h
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmTwihMACgkQUevqPMjh
pYAUxQ/+ID2GW2f+wbhHfnNRnWQw/LbGp0JQ5DmX3HDZy9/uEY+x24T01w5BaOWg
qRCMKI/HPHASqfPUlj1wlwnUQJbhxiki6eYCovfCNZkX3pn3hsn6RPmEe3YVzZUh
kot+qFXiRlAzEINMfsjmCGobwMyByfTax2vCDLwzXEvx3dSSXkDfPJ3IyPSxXPAM
dKIfQ3Qj5jlSfd99lsTXWAwLeWCvQZS4qADf1RaSbuoCVNTJ/Wn5vRWJSnFqh9Aj
3CdqzdNwnoxc6VZTWusx5XQmUEFnaZmKfup3ImGydhcgDB9OYaJjV7zMgr7rDM5f
hR3N2hO5vSB2p/vk/7OV9nsD8kf3+Rlvx+FEelp25WoX9JcaMSkZJiIg4f5oS/sk
Id7r+sFeOjq3fjt2IdlFF7mA5IrhzyTiZdTFtZQ1jPOZcuF/myQdqS27bLBr9Cpu
ljmkCLMEZCqCOD6op0yYS4nHBvMqvxtI702ZzhjsJ5W0+/ZpE97pRWvoYMEr285T
OS183ERai2sIWKlDeM+6mdkviXR3kqzFR+0O9GWI+0MRHFjZBNwODlOVKKt3OnpV
LYfeYCcMrAXkxPr8/dIy0qs7Nxyh4wtQfGqPIitzHButZA9F1gJOSAPZhMs4Ho6E
V88HgA2hg85zSM8g8NsFz6Qj+sDDpwF8E6fPnqwiB0fJDMgaaUc=3D
=3DqSfV
-----END PGP SIGNATURE-----
