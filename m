Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7406506F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 04:59:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nb5ZF3710z3c8v
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 14:59:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J0ifDUzf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nb5YJ55VHz2ynB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 14:59:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J0ifDUzf;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Nb5Xv4ld9z4xYn;
	Mon, 19 Dec 2022 14:58:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1671422333;
	bh=79TK4ONvNXldC00f9Nbr6icxrwWsx2c9TySPLDnC+GM=;
	h=From:To:Cc:Subject:Date:From;
	b=J0ifDUzfYPccA4S0D2t2J7QA8COmq1Mi3yOm9b8GmChkf4inzmIHhTZ+ri+BTJUKE
	 GfV9JLSydpJGr3x7lbJOV/fKiBtHPLIbLbORI2BCKNhZLjzmLyKESQAQpN6rdw3Lvx
	 lKPXuYd6VqcjaYTFLmHYHAMW1qAaOnmBWd2BuUyT0RSSCNpyVzXGFtcPgYkLVGLTw1
	 LhVvNJldpMIANoBcCF2YHKlcPuuUqrwV4TsHT5d57XuRKT3V+uLEu6GgjKgIitn7jK
	 p3T75htJQa2I5J/NR/tuVLouAaSuQriT7S/JBiMAPKlpjPWw2z5jRzdmrocptBvHGL
	 YMxz1OcMhxX8A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-1 tag
Date: Mon, 19 Dec 2022 14:58:38 +1100
Message-ID: <87wn6ohwnl.fsf@mpe.ellerman.id.au>
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
Cc: linmq006@gmail.com, rdunlap@infradead.org, steve@sk2.org, geert+renesas@glider.be, peterz@infradead.org, jniethe5@gmail.com, linux-kernel@vger.kernel.org, nicholas@linux.ibm.com, cmr@bluescreens.de, bgray@linux.ibm.com, yangtiezhu@loongson.cn, hch@lst.de, sfr@canb.auug.org.au, ldufour@linux.ibm.com, baihaowen@meizu.com, chenxuebing@jari.cn, nayna@linux.ibm.com, jiaming@nfschina.com, mcgrof@kernel.org, mjeanson@efficios.com, yangyingliang@huawei.com, joel@jms.id.au, liubo03@inspur.com, chenlifu@huawei.com, u.kleine-koenig@pengutronix.de, naveen.n.rao@linux.vnet.ibm.com, colin.i.king@gmail.com, nathanl@linux.ibm.com, studentxswpy@163.com, ajd@linux.ibm.com, xiujianfeng@huawei.com, aboorvad@linux.vnet.ibm.com, linux@weissschuh.net, wangdeming@inspur.com, npiggin@gmail.com, rmclure@linux.ibm.com, christophe.jaillet@wanadoo.fr, rostedt@goodmis.org, bhelgaas@google.com, disgoel@linux.vnet.ibm.com, jpoimboe@kernel.org, dengshaomin@cdjrlc.com, fthain@linux-m68k.org, geoff@infradead.org, 
 pali@kernel.org, dmitry.torokhov@gmail.com, gustavoars@kernel.org, Julia.Lawall@inria.fr, kjain@linux.ibm.com, zeming@nfschina.com, fbarrat@linux.ibm.com, sv@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, ruanjinjie@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 6.2.

There's one conflict with your tree in tools/objtool/check.c. The correct r=
esolution
is to combine the changes, which should look like:

       if (!insn || !insn_func(insn))

cheers

Notable out of area changes:
  280981d6994e objtool: Add --mnop as an option to --mcount:
    Makefile
    arch/x86/Kconfig
    kernel/trace/Kconfig
    scripts/Makefile.lib
    tools/objtool/*

  f9231a996e22 module: add module_elf_check_arch for module-specific checks:
    kernel/module/main.c
    include/linux/moduleloader.h


The following changes since commit 247f34f7b80357943234f93f247a1ae6b6c3a740:

  Linux 6.1-rc2 (2022-10-23 15:27:33 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.2-1

for you to fetch changes up to 980411a4d1bb925d28cd9e8d8301dc982ece788d:

  powerpc/code-patching: Fix oops with DEBUG_VM enabled (2022-12-16 23:59:4=
3 +1100)

- ------------------------------------------------------------------
powerpc updates for 6.2

 - Add powerpc qspinlock implementation optimised for large system scalabil=
ity and
   paravirt. See the merge message for more details.

 - Enable objtool to be built on powerpc to generate mcount locations.

 - Use a temporary mm for code patching with the Radix MMU, so the writable=
 mapping is
   restricted to the patching CPU.

 - Add an option to build the 64-bit big-endian kernel with the ELFv2 ABI.

 - Sanitise user registers on interrupt entry on 64-bit Book3S.

 - Many other small features and fixes.

Thanks to: Aboorva Devarajan, Angel Iglesias, Benjamin Gray, Bjorn Helgaas,=
 Bo Liu, Chen
Lifu, Christoph Hellwig, Christophe JAILLET, Christophe Leroy, Christopher =
M. Riedl, Colin
Ian King, Deming Wang, Disha Goel, Dmitry Torokhov, Finn Thain, Geert Uytte=
rhoeven,
Gustavo A. R. Silva, Haowen Bai, Joel Stanley, Jordan Niethe, Julia Lawall,=
 Kajol Jain,
Laurent Dufour, Li zeming, Miaoqian Lin, Michael Jeanson, Nathan Lynch, Nav=
een N. Rao,
Nayna Jain, Nicholas Miehlbradt, Nicholas Piggin, Pali Roh=C3=A1r, Randy Du=
nlap, Rohan McLure,
Russell Currey, Sathvika Vasireddy, Shaomin Deng, Stephen Kitt, Stephen Rot=
hwell, Thomas
Wei=C3=9Fschuh, Tiezhu Yang, Uwe Kleine-K=C3=B6nig, Xie Shaowen, Xiu Jianfe=
ng, XueBing Chen, Yang
Yingliang, Zhang Jiaming, ruanjinjie, Jessica Yu, Wolfram Sang.

- ------------------------------------------------------------------
Aboorva Devarajan (1):
      powerpc/cpuidle: Set CPUIDLE_FLAG_POLLING for snooze state

Benjamin Gray (8):
      powerpc/code-patching: Use WARN_ON and fix check in poking_init
      powerpc/mm: Remove empty hash__ functions
      cxl: Use radix__flush_all_mm instead of generic flush_all_mm
      powerpc/mm: Remove flush_all_mm, local_flush_all_mm
      powerpc/tlb: Add local flush for page given mm_struct and psize
      powerpc/code-patching: Consolidate and cache per-cpu patching context
      selftests/powerpc: Use mfspr/mtspr macros
      selftests/powerpc: Add ptrace setup_core_pattern() null-terminator

Bjorn Helgaas (1):
      cxl: Remove unnecessary cxl_pci_window_alignment()

Bo Liu (1):
      powerpc/pseries/eeh: Fix some kernel-doc warnings

Chen Lifu (1):
      powerpc/powermac: Fix symbol not declared warnings

Christoph Hellwig (1):
      powerpc/ps3: mark ps3_system_bus_type static

Christophe JAILLET (3):
      KVM: PPC: Book3S HV: Use the bitmap API to allocate bitmaps
      powerpc/52xx: Fix a resource leak in an error handling path
      powerpc/sysdev: Remove some duplicate prefix in some messages

Christophe Leroy (12):
      powerpc/32: Fix objtool unannotated intra-function call warnings
      objtool: Fix SEGFAULT
      objtool: Use target file endianness instead of a compiled constant
      objtool: Use target file class size instead of a compiled constant
      powerpc: Remove find_current_mm_pte()
      powerpc/8xx: Simplify pte_update() with 16k pages
      powerpc/8xx: Reverse order entries are written by __set_pte_at()
      powerpc/code-patching: Remove #ifdef CONFIG_STRICT_KERNEL_RWX
      powerpc/feature-fixups: Refactor entry fixups patching
      powerpc/feature-fixups: Refactor other fixups patching
      powerpc/feature-fixups: Do not patch init section after init
      powerpc/code-patching: Remove protection against patching init addres=
ses after init

Christopher M. Riedl (1):
      powerpc/code-patching: Use temporary mm for Radix MMU

Colin Ian King (1):
      selftests/powerpc: Fix spelling mistake "mmaping" -> "mmapping"

Deming Wang (3):
      KVM: PPC: Book3s: Use arg->size directly in kvm_vm_ioctl_create_spapr=
_tce()
      powerpc/xive: remove unused parameter
      powerpc/pseries: Fix formatting to make code look more beautiful

Disha Goel (1):
      powerpc/kvm: Remove unused macros from asm-offset

Dmitry Torokhov (2):
      powerpc/warp: switch to using gpiod API
      powerpc/sgy_cts1000: convert to using gpiod API and facelift

Finn Thain (1):
      macintosh/via-pmu: Avoid compiler warnings when CONFIG_PROC_FS is dis=
abled

Geert Uytterhoeven (1):
      powerpc/dts/fsl: Fix pca954x i2c-mux node names

Gustavo A. R. Silva (1):
      powerpc/xmon: Fix -Wswitch-unreachable warning in bpt_cmds

Haowen Bai (5):
      macintosh/windfarm_pm81: Fix warning comparing pointer to 0
      macintosh/adb: Fix warning comparing pointer to 0
      macintosh/windfarm_pm91: Fix warning comparing pointer to 0
      macintosh/windfarm_pm121: Fix warning comparing pointer to 0
      macintosh/macio-adb: Fix warning comparing pointer to 0

Joel Stanley (1):
      powerpc/microwatt: Add litesd

Jordan Niethe (1):
      powerpc: Allow clearing and restoring registers independent of saved =
breakpoint state

Julia Lawall (1):
      cxl: fix typo in comment

Kajol Jain (2):
      powerpc/kvm: Remove unused references for MMCR3/SIER2/SIER3 registers
      powerpc/hv-gpci: Fix hv_gpci event list

Laurent Dufour (4):
      powerpc: export the CPU node count
      powerpc: Take in account addition CPU node when building kexec FDT
      powerpc/pseries: reset the RCU watchdogs after a LPM
      powerpc/pseries: unregister VPA when hot unplugging a CPU

Li zeming (2):
      macintosh/ams/ams: Add header file macro definition
      macintosh/windfarm_pid: Add header file macro definition

Miaoqian Lin (2):
      cxl: Fix refcount leak in cxl_calc_capp_routing
      selftests/powerpc: Fix resource leaks

Michael Ellerman (10):
      objtool/powerpc: Implement arch_pc_relative_reloc()
      Merge branch i2c/client_device_id_helper-immutable of wsa/linux into =
next
      powerpc: Make instruction dump work with scripts/decodecode
      powerpc: Print instruction dump on a single line
      Merge branch 'topic/ppc-kvm' into next
      Merge branch 'fixes' into next
      Merge branch 'topic/qspinlock' into next
      powerpc/prom: Fix 32-bit build
      Merge branch 'topic/objtool' into next
      powerpc/code-patching: Fix oops with DEBUG_VM enabled

Michael Jeanson (1):
      powerpc/ftrace: fix syscall tracing on PPC64_ELF_ABI_V1

Nathan Lynch (9):
      powerpc/rtas: document rtas_call()
      powerpc/rtasd: use correct OF API for event scan rate
      powerpc/rtas: avoid device tree lookups in rtas_os_term()
      powerpc/rtas: avoid scheduling in rtas_os_term()
      powerpc/pseries/eeh: use correct API for error log size
      powerpc/rtas: clean up rtas_error_log_max initialization
      powerpc/rtas: clean up includes
      powerpc/rtas: define pr_fmt and convert printk call sites
      powerpc/rtas: mandate RTAS syscall filtering

Naveen N. Rao (7):
      powerpc/ftrace: Ignore weak functions
      powerpc/kprobes: Remove preempt disable around call to get_kprobe() i=
n arch_prepare_kprobe()
      powerpc/kprobes: Have optimized_callback() use preempt_enable()
      powerpc/kprobes: Use preempt_enable() rather than the no_resched vari=
ant
      selftests/powerpc: Move perror closer to its use
      selftests/powerpc: Bump up rlimit for perf-hwbreak test
      selftests/powerpc: Account for offline cpus in perf-hwbreak test

Nayna Jain (6):
      powerpc/pseries: fix the object owners enum value in plpks driver
      powerpc/pseries: Fix the H_CALL error code in PLPKS driver
      powerpc/pseries: Return -EIO instead of -EINTR for H_ABORTED error
      powerpc/pseries: cleanup error logs in plpks driver
      powerpc/pseries: replace kmalloc with kzalloc in PLPKS driver
      powerpc/pseries: fix plpks_read_var() code for different consumers

Nicholas Miehlbradt (1):
      docs: powerpc: add POWER9 and POWER10 to CPU families

Nicholas Piggin (43):
      powerpc: add compile-time support for lbarx, lharx
      powerpc: remove the last remnants of cputime_t
      KVM: PPC: Book3E: Fix CONFIG_TRACE_IRQFLAGS support
      powerpc/qspinlock: powerpc qspinlock implementation
      powerpc/qspinlock: add mcs queueing for contended waiters
      powerpc/qspinlock: use a half-word store to unlock to avoid larx/stcx.
      powerpc/qspinlock: convert atomic operations to assembly
      powerpc/qspinlock: allow new waiters to steal the lock before queueing
      powerpc/qspinlock: theft prevention to control latency
      powerpc/qspinlock: store owner CPU in lock word
      powerpc/qspinlock: paravirt yield to lock owner
      powerpc/qspinlock: implement option to yield to previous node
      powerpc/qspinlock: allow stealing when head of queue yields
      powerpc/qspinlock: allow propagation of yield CPU down the queue
      powerpc/qspinlock: add ability to prod new queue head CPU
      powerpc/qspinlock: allow lock stealing in trylock and lock fastpath
      powerpc/qspinlock: use spin_begin/end API
      powerpc/qspinlock: reduce remote node steal spins
      powerpc/qspinlock: allow indefinite spinning on a preempted owner
      powerpc/qspinlock: provide accounting and options for sleepy locks
      powerpc/qspinlock: add compile-time tuning adjustments
      module: add module_elf_check_arch for module-specific checks
      powerpc/64: Add module check for ELF ABI version
      powerpc/64: Add big-endian ELFv2 flavour to crypto VMX asm generation
      powerpc/64: Option to build big-endian with ELFv2 ABI
      powerpc/64: Remove asm interrupt tracing call helpers
      powerpc/perf: callchain validate kernel stack pointer bounds
      powerpc: Rearrange copy_thread child stack creation
      powerpc/pseries: hvcall stack frame overhead
      powerpc: simplify ppc_save_regs
      powerpc: add definition for pt_regs offset within an interrupt frame
      powerpc: add a definition for the marker offset within the interrupt =
frame
      powerpc: Rename STACK_FRAME_MARKER and derive it from frame offset
      powerpc: add a define for the user interrupt frame size
      powerpc: add a define for the switch frame size and regs offset
      powerpc: copy_thread fill in interrupt frame marker and back chain
      powerpc: copy_thread add a back chain to the switch stack frame
      powerpc: split validate_sp into two functions
      powerpc: allow minimum sized kernel stack frames
      powerpc/64: ELFv2 use minimal stack frames in int and switch frame si=
zes
      powerpc: remove STACK_FRAME_OVERHEAD
      powerpc/64s/hash: add stress_hpt kernel boot option to increase hash =
faults
      powerpc/qspinlock: Fix 32-bit build

Pali Roh=C3=A1r (2):
      powerpc: dts: turris1x.dts: Add channel labels for temperature sensor
      powerpc/fsl-pci: Choose PCI host bridge with alias pci0 as the primary

Randy Dunlap (1):
      powerpc/mpc52xx_lpbfifo: fix all kernel-doc warnings

Rohan McLure (7):
      powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS Kconfig
      powerpc/64: Add interrupt register sanitisation macros
      powerpc/64: Sanitise common exit code for interrupts
      powerpc/64s: IOption for MSR stored in r12
      powerpc/64s: Zeroise gprs on interrupt routine entry on Book3S
      powerpc/64e: Clear gprs on interrupt routine entry on Book3E
      powerpc/64: Sanitise user registers on interrupt in pseries, POWERNV

Russell Currey (1):
      powerpc/8xx: Fix warning in hw_breakpoint_handler()

Sathvika Vasireddy (12):
      powerpc: Fix __WARN_FLAGS() for use with Objtool
      powerpc: Override __ALIGN and __ALIGN_STR macros
      powerpc: Fix objtool unannotated intra-function call warnings
      powerpc: Curb objtool unannotated intra-function call warnings
      crypto: vmx: Skip objtool from running on aesp8-ppc.o
      powerpc/vdso: Skip objtool from running on VDSO files
      objtool: Add --mnop as an option to --mcount
      objtool: Read special sections with alts only when specific options a=
re selected
      objtool: Use macros to define arch specific reloc types
      objtool: Add arch specific function arch_ftrace_match()
      objtool/powerpc: Enable objtool to be built on ppc
      objtool/powerpc: Add --mcount specific implementation

Shaomin Deng (2):
      drivers/ps3: Fix double word in comments
      selftests/powerpc: Remove repeated word in comments

Stephen Kitt (1):
      macintosh/via-pmu-backlight: Use backlight helper

Stephen Rothwell (1):
      powerpc: suppress some linker warnings in recent linker versions

Thomas Wei=C3=9Fschuh (1):
      powerpc/book3e: remove #include <generated/utsrelease.h>

Tiezhu Yang (2):
      powerpc: Use "grep -E" instead of "egrep"
      selftests: powerpc: Use "grep -E" instead of "egrep"

Uwe Kleine-K=C3=B6nig (9):
      macintosh/ams-i2c: Convert to i2c's .probe_new()
      macintosh/therm_adt746x: Convert to i2c's .probe_new()
      macintosh/therm_windtunnel: Convert to i2c's .probe_new()
      macintosh/windfarm_ad7417_sensor: Convert to i2c's .probe_new()
      macintosh/windfarm_fcu_controls: Convert to i2c's .probe_new()
      macintosh/windfarm_lm75_sensor: Convert to i2c's .probe_new()
      macintosh/windfarm_lm87_sensor: Convert to i2c's .probe_new()
      macintosh/windfarm_max6690_sensor: Convert to i2c's .probe_new()
      macintosh/windfarm_smu_sat: Convert to i2c's .probe_new()

Xie Shaowen (1):
      macintosh/macio-adb: check the return value of ioremap()

Xiu Jianfeng (1):
      powerpc/pasemi: Add __init/__exit annotations to module init/exit fun=
cs

XueBing Chen (1):
      KVM: PPC: Use __func__ to get function's name

Yang Yingliang (8):
      macintosh: Switch to use for_each_child_of_node() macro
      macintosh: fix possible memory leak in macio_add_one_device()
      cxl: fix possible null-ptr-deref in cxl_guest_init_afu|adapter()
      cxl: fix possible null-ptr-deref in cxl_pci_init_afu|adapter()
      ocxl: fix possible name leak in ocxl_file_register_afu()
      ocxl: fix pci device refcount leak when calling get_function_0()
      powerpc/xive: add missing iounmap() in error path in xive_spapr_popul=
ate_irq_data()
      powerpc/83xx/mpc832x_rdb: call platform_device_put() in error case in=
 of_fsl_spi_probe()

Zhang Jiaming (1):
      KVM: PPC: Book3S HV: XIVE: Fix spelling mistakes

ruanjinjie (1):
      powerpc/mpic_msgr: fix cast removes address space of expression warni=
ngs


 Documentation/admin-guide/kernel-parameters.txt         |   5 +
 Documentation/powerpc/cpu_families.rst                  |  13 +
 Makefile                                                |   4 +-
 arch/powerpc/Kconfig                                    |  51 +-
 arch/powerpc/boot/dts/fsl/t1024qds.dts                  |   2 +-
 arch/powerpc/boot/dts/fsl/t1024rdb.dts                  |   2 +-
 arch/powerpc/boot/dts/fsl/t104xqds.dtsi                 |   2 +-
 arch/powerpc/boot/dts/fsl/t104xrdb.dtsi                 |   2 +-
 arch/powerpc/boot/dts/fsl/t208xqds.dtsi                 |   2 +-
 arch/powerpc/boot/dts/fsl/t208xrdb.dtsi                 |   2 +-
 arch/powerpc/boot/dts/microwatt.dts                     |  22 +
 arch/powerpc/boot/dts/turris1x.dts                      |  14 +
 arch/powerpc/boot/dts/warp.dts                          |   4 +-
 arch/powerpc/boot/wrapper                               |  17 +-
 arch/powerpc/include/asm/asm.h                          |   7 +
 arch/powerpc/include/asm/book3s/32/tlbflush.h           |   9 +
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h      |  50 -
 arch/powerpc/include/asm/book3s/64/tlbflush.h           |  41 +-
 arch/powerpc/include/asm/bug.h                          |   3 +-
 arch/powerpc/include/asm/cmpxchg.h                      | 231 ++++-
 arch/powerpc/include/asm/code-patching.h                |   2 -
 arch/powerpc/include/asm/cputime.h                      |  17 +-
 arch/powerpc/include/asm/debug.h                        |   2 +
 arch/powerpc/include/asm/ftrace.h                       |  19 +-
 arch/powerpc/include/asm/hvcall.h                       |   3 +-
 arch/powerpc/include/asm/irqflags.h                     |  58 --
 arch/powerpc/include/asm/kvm_book3s_asm.h               |   2 +-
 arch/powerpc/include/asm/kvm_ppc.h                      |  12 +
 arch/powerpc/include/asm/linkage.h                      |   3 +
 arch/powerpc/include/asm/mmu_context.h                  |   6 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h            |  10 +-
 arch/powerpc/include/asm/nohash/pgtable.h               |   2 +-
 arch/powerpc/include/asm/nohash/tlbflush.h              |   7 +
 arch/powerpc/include/asm/ppc_asm.h                      |  19 +
 arch/powerpc/include/asm/processor.h                    |  15 +-
 arch/powerpc/include/asm/prom.h                         |   1 +
 arch/powerpc/include/asm/ps3.h                          |   4 -
 arch/powerpc/include/asm/pte-walk.h                     |  25 -
 arch/powerpc/include/asm/ptrace.h                       |  36 +-
 arch/powerpc/include/asm/qspinlock.h                    | 192 +++-
 arch/powerpc/include/asm/qspinlock_paravirt.h           |   7 -
 arch/powerpc/include/asm/qspinlock_types.h              |  72 ++
 arch/powerpc/include/asm/rtas.h                         |  15 -
 arch/powerpc/include/asm/spinlock.h                     |   2 +-
 arch/powerpc/include/asm/spinlock_types.h               |   2 +-
 arch/powerpc/kernel/asm-offsets.c                       |  34 +-
 arch/powerpc/kernel/cpu_setup_6xx.S                     |  26 +-
 arch/powerpc/kernel/cpu_setup_e500.S                    |   8 +-
 arch/powerpc/kernel/entry_32.S                          |  23 +-
 arch/powerpc/kernel/entry_64.S                          |   2 +
 arch/powerpc/kernel/exceptions-64e.S                    |  48 +-
 arch/powerpc/kernel/exceptions-64s.S                    | 120 ++-
 arch/powerpc/kernel/head_32.h                           |   4 +-
 arch/powerpc/kernel/head_40x.S                          |   7 +-
 arch/powerpc/kernel/head_44x.S                          |   6 +-
 arch/powerpc/kernel/head_64.S                           |  13 +-
 arch/powerpc/kernel/head_85xx.S                         |  13 +-
 arch/powerpc/kernel/head_8xx.S                          |   7 +-
 arch/powerpc/kernel/head_book3s_32.S                    |  33 +-
 arch/powerpc/kernel/head_booke.h                        |   4 +-
 arch/powerpc/kernel/hw_breakpoint.c                     |   2 +-
 arch/powerpc/kernel/interrupt_64.S                      |  54 +-
 arch/powerpc/kernel/irq.c                               |   4 +-
 arch/powerpc/kernel/kgdb.c                              |   2 +-
 arch/powerpc/kernel/kprobes.c                           |  14 +-
 arch/powerpc/kernel/misc_32.S                           |   2 +-
 arch/powerpc/kernel/misc_64.S                           |   8 +-
 arch/powerpc/kernel/module_64.c                         |  10 +
 arch/powerpc/kernel/optprobes.c                         |   2 +-
 arch/powerpc/kernel/optprobes_head.S                    |   4 +-
 arch/powerpc/kernel/ppc_save_regs.S                     |  57 +-
 arch/powerpc/kernel/process.c                           |  97 +-
 arch/powerpc/kernel/prom.c                              |   4 +
 arch/powerpc/kernel/rtas.c                              | 192 ++--
 arch/powerpc/kernel/rtasd.c                             |   7 +-
 arch/powerpc/kernel/smp.c                               |   2 +-
 arch/powerpc/kernel/stacktrace.c                        |  10 +-
 arch/powerpc/kernel/swsusp_32.S                         |   5 +-
 arch/powerpc/kernel/time.c                              |  23 +-
 arch/powerpc/kernel/tm.S                                |   8 +-
 arch/powerpc/kernel/trace/ftrace_mprofile.S             |   2 +-
 arch/powerpc/kernel/vdso/Makefile                       |   2 +
 arch/powerpc/kernel/vector.S                            |   4 +-
 arch/powerpc/kexec/file_load_64.c                       |  59 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c                     |   7 +-
 arch/powerpc/kvm/book3s_64_vio.c                        |   6 +-
 arch/powerpc/kvm/book3s_hv_interrupts.S                 |   4 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                 |  27 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c                      |   5 +-
 arch/powerpc/kvm/book3s_xive.c                          |  12 +-
 arch/powerpc/kvm/book3s_xive.h                          |   3 +-
 arch/powerpc/kvm/book3s_xive_native.c                   |   3 +-
 arch/powerpc/kvm/booke.c                                |   3 +
 arch/powerpc/kvm/bookehv_interrupts.S                   |   9 -
 arch/powerpc/kvm/fpu.S                                  |  17 +-
 arch/powerpc/lib/Makefile                               |   4 +-
 arch/powerpc/lib/code-patching.c                        | 238 ++++-
 arch/powerpc/lib/feature-fixups.c                       | 173 ++--
 arch/powerpc/lib/qspinlock.c                            | 997 ++++++++++++=
++++++++
 arch/powerpc/lib/sstep.c                                |  21 +-
 arch/powerpc/lib/test_emulate_step_exec_instr.S         |   2 +-
 arch/powerpc/mm/book3s64/hash_4k.c                      |   5 +
 arch/powerpc/mm/book3s64/hash_64k.c                     |  10 +
 arch/powerpc/mm/book3s64/hash_utils.c                   | 130 ++-
 arch/powerpc/mm/book3s64/internal.h                     |  11 +
 arch/powerpc/mm/book3s64/pgtable.c                      |   4 +-
 arch/powerpc/mm/mem.c                                   |   1 -
 arch/powerpc/mm/nohash/kaslr_booke.c                    |   1 -
 arch/powerpc/mm/nohash/tlb.c                            |   8 +
 arch/powerpc/perf/callchain.c                           |   9 +-
 arch/powerpc/perf/hv-gpci-requests.h                    |   4 +
 arch/powerpc/perf/hv-gpci.c                             |  35 +-
 arch/powerpc/perf/hv-gpci.h                             |   1 +
 arch/powerpc/perf/req-gen/perf.h                        |  20 +
 arch/powerpc/platforms/44x/warp.c                       | 105 ++-
 arch/powerpc/platforms/52xx/lite5200_sleep.S            |  15 +-
 arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c           |  15 +-
 arch/powerpc/platforms/83xx/mpc832x_rdb.c               |   2 +-
 arch/powerpc/platforms/85xx/sgy_cts1000.c               | 132 ++-
 arch/powerpc/platforms/Kconfig.cputype                  |   9 +-
 arch/powerpc/platforms/pasemi/gpio_mdio.c               |   4 +-
 arch/powerpc/platforms/powermac/setup.c                 |  18 +-
 arch/powerpc/platforms/ps3/system-bus.c                 |   2 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c            |  15 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c            |   1 +
 arch/powerpc/platforms/pseries/hvCall.S                 |  38 +-
 arch/powerpc/platforms/pseries/iommu.c                  |   2 +-
 arch/powerpc/platforms/pseries/mobility.c               |   7 +-
 arch/powerpc/platforms/pseries/plpks.c                  |  50 +-
 arch/powerpc/platforms/pseries/plpks.h                  |   2 +-
 arch/powerpc/sysdev/fsl_pci.c                           |  13 +
 arch/powerpc/sysdev/mpic_msgr.c                         |   4 +-
 arch/powerpc/sysdev/xive/native.c                       |   6 +-
 arch/powerpc/sysdev/xive/spapr.c                        |   1 +
 arch/powerpc/xmon/xmon.c                                |  17 +-
 arch/x86/Kconfig                                        |   1 +
 drivers/cpuidle/cpuidle-powernv.c                       |   5 +-
 drivers/cpuidle/cpuidle-pseries.c                       |   8 +-
 drivers/crypto/vmx/Makefile                             |  14 +-
 drivers/crypto/vmx/ppc-xlate.pl                         |  10 +-
 drivers/macintosh/adb.c                                 |   4 +-
 drivers/macintosh/ams/ams-i2c.c                         |   8 +-
 drivers/macintosh/ams/ams.h                             |   5 +
 drivers/macintosh/macio-adb.c                           |  11 +-
 drivers/macintosh/macio_asic.c                          |   2 +-
 drivers/macintosh/therm_adt746x.c                       |   6 +-
 drivers/macintosh/therm_windtunnel.c                    |   5 +-
 drivers/macintosh/via-pmu-backlight.c                   |   7 +-
 drivers/macintosh/via-pmu.c                             |   4 +
 drivers/macintosh/windfarm_ad7417_sensor.c              |   5 +-
 drivers/macintosh/windfarm_fcu_controls.c               |   5 +-
 drivers/macintosh/windfarm_lm75_sensor.c                |   8 +-
 drivers/macintosh/windfarm_lm87_sensor.c                |   5 +-
 drivers/macintosh/windfarm_max6690_sensor.c             |   5 +-
 drivers/macintosh/windfarm_pid.h                        |   5 +
 drivers/macintosh/windfarm_pm121.c                      |   4 +-
 drivers/macintosh/windfarm_pm81.c                       |   4 +-
 drivers/macintosh/windfarm_pm91.c                       |   2 +-
 drivers/macintosh/windfarm_smu_controls.c               |  10 +-
 drivers/macintosh/windfarm_smu_sat.c                    |   5 +-
 drivers/misc/cxl/pci.c                                  |   1 +
 drivers/misc/cxl/vphb.c                                 |   7 -
 drivers/ps3/ps3-lpm.c                                   |   2 +-
 include/linux/moduleloader.h                            |   3 +
 include/misc/cxl.h                                      |   2 +-
 kernel/module/main.c                                    |  10 +
 kernel/trace/Kconfig                                    |   7 +
 scripts/Makefile.lib                                    |   3 +
 tools/objtool/arch/powerpc/Build                        |   2 +
 tools/objtool/arch/powerpc/decode.c                     | 110 +++
 tools/objtool/arch/powerpc/include/arch/cfi_regs.h      |  11 +
 tools/objtool/arch/powerpc/include/arch/elf.h           |  10 +
 tools/objtool/arch/powerpc/include/arch/special.h       |  21 +
 tools/objtool/arch/powerpc/special.c                    |  19 +
 tools/objtool/arch/x86/decode.c                         |   5 +
 tools/objtool/arch/x86/include/arch/elf.h               |   2 +
 tools/objtool/arch/x86/include/arch/endianness.h        |   9 -
 tools/objtool/builtin-check.c                           |  14 +
 tools/objtool/check.c                                   |  53 +-
 tools/objtool/elf.c                                     |   8 +-
 tools/objtool/include/objtool/arch.h                    |   2 +
 tools/objtool/include/objtool/builtin.h                 |   1 +
 tools/objtool/include/objtool/elf.h                     |   8 +
 tools/objtool/include/objtool/endianness.h              |  32 +-
 tools/objtool/orc_dump.c                                |  11 +-
 tools/objtool/orc_gen.c                                 |   4 +-
 tools/objtool/special.c                                 |   3 +-
 tools/testing/selftests/powerpc/dscr/dscr.h             |  17 +-
 tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c  |   5 +-
 tools/testing/selftests/powerpc/include/pkeys.h         |   2 +-
 tools/testing/selftests/powerpc/ptrace/core-pkey.c      |   6 +-
 tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c   |  78 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c |   6 +-
 tools/testing/selftests/powerpc/ptrace/ptrace.h         |   5 +-
 tools/testing/selftests/powerpc/scripts/hmi.sh          |   2 +-
 tools/testing/selftests/powerpc/security/flush_utils.c  |   3 +-
 196 files changed, 3541 insertions(+), 1257 deletions(-)
 create mode 100644 arch/powerpc/include/asm/asm.h
 delete mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h
 create mode 100644 arch/powerpc/include/asm/qspinlock_types.h
 create mode 100644 arch/powerpc/lib/qspinlock.c
 create mode 100644 tools/objtool/arch/powerpc/Build
 create mode 100644 tools/objtool/arch/powerpc/decode.c
 create mode 100644 tools/objtool/arch/powerpc/include/arch/cfi_regs.h
 create mode 100644 tools/objtool/arch/powerpc/include/arch/elf.h
 create mode 100644 tools/objtool/arch/powerpc/include/arch/special.h
 create mode 100644 tools/objtool/arch/powerpc/special.c
 delete mode 100644 tools/objtool/arch/x86/include/arch/endianness.h
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmOf4RYACgkQUevqPMjh
pYBD4xAAriTaw3N76fiEONIjvit7shutjXeCm94MItysKWtKjR7mvmIO3c287AE7
qqxe3ZHkIjzu41kBTYm32/fLLjb3QjrIuosW/f6Nzx62JfDjykERyzBe0esSCmip
/0WDTfYnSEPhyB7ljBXElWIM7cuLUbOOJtbcya7Bf+Oq6d46tjw6tVTxEW5wh0GL
ahnlBX6IdcKUFahzADH2jFL1q+NCz+u1DQymZvQYB0wNllHGQy+qEJHpgpGSVPVX
Kr3cM0xwMSUhTgaGgs0IZLzjB5uW7Cq/LLheKAh9Ys8Dk1AuOdTQBea4YEPVQQRi
raNRdHqeteWO347gJmeA1VyQekAx6yUeR0dDR65ftziCQv564M3z4axHtJCH1hs3
AG1K4ZPfKyHek+b8AtYUrEeg8EPai9bnJB8RUPuvafy5maMrDV27pChwV8LTLJKw
UmbgFE9C8HbkrjT+I7FFzp2EHqLefFy6MSg8se4+znQfSTj3LNwQkWjGZ+GD1hri
561qZ8jTZi8GLD1vxolMhQb87/aKcA9aTeoXrH7BRAs56U0w6Vdlr+gTDFvAFHk2
aqH701eN9d55gSU3TatoyEUZxXC3QOCsJNFFlKxvnj39xrIaeP3XaL1IC/2lAndw
wBxBRTM41zvvrM3cbfkEmkXwjs9XY06PJkVV53qHONfxD4Ji7gg=3D
=3DDEMt
-----END PGP SIGNATURE-----
