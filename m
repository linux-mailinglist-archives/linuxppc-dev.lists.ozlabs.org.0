Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F873215BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 13:06:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkgrT0D91z3cVS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 23:06:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KMS+XzDo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KMS+XzDo; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dkgr13gjVz30QM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 23:05:52 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dkgqn5T3kz9sBy;
 Mon, 22 Feb 2021 23:05:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613995551;
 bh=64o8AVrGJOVh0gR4In7KVzWchGif4MCmdZezVbTIYKo=;
 h=From:To:Cc:Subject:Date:From;
 b=KMS+XzDo/eA3MdeWYte5KmH9A4acu7h9adFscBjL/gXAINy61C57dVg1CJ09Yoq/e
 Qye9OfIHMOV+eWkFsM5TLe4R2mRadDLgJ0do/k0kqhz9Oz9YWCwHkjmAdvJZE2d70R
 CQc/EyxJ2wlgZjFhh1HgxaapEZM9mrfEqNef/Tamr3ks/BrguvDAW4xTTNfAGnvt6Q
 HotHnaFF7tLTMz/JwbnLE5VmOTXGpQAynWOXIfnCUCcbNoO9BOVRHPYq1yuzoHKEkz
 Hxwk+gT6nPyhmQl/PSl+k1Ll6yvbaOx2J5uQ5ML2gaOtCdkWT1sb4x7nf4W8hSH7/m
 JSTN+gcJHLpgw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-1 tag
Date: Mon, 22 Feb 2021 23:05:37 +1100
Message-ID: <87o8gctii6.fsf@mpe.ellerman.id.au>
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
Cc: ananth@linux.ibm.com, aik@ozlabs.ru, kernelfans@gmail.com, cmr@codefail.de,
 zhengyongjun3@huawei.com, oohall@gmail.com, sandipan@linux.ibm.com,
 cy.fan@huawei.com, elfring@users.sourceforge.net,
 jiapeng.chong@linux.alibaba.com, skirmisher@protonmail.com,
 f.fainelli@gmail.com, unixbhaskar@gmail.com, eerykitty@gmail.com,
 aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, ganeshgr@linux.ibm.com,
 msuchanek@suse.de, nathanl@linux.ibm.com, robh@kernel.org, kjain@linux.ibm.com,
 npiggin@gmail.com, broonie@kernel.org, cai@lca.pw, clg@kaod.org,
 hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, po-hsu.lin@canonical.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.12.

There will be a conflict with the devicetree tree. It's OK to just take the=
ir
side of the conflict, we'll fix up the minor behaviour change that causes i=
n a
follow-up patch.

There's also a trivial conflict with the spi tree.

cheers


The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.12-1

for you to fetch changes up to 82d2c16b350f72aa21ac2a6860c542aa4b43a51e:

  powerpc/perf: Adds support for programming of Thresholding in P10 (2021-0=
2-11 23:35:36 +1100)

- ------------------------------------------------------------------
powerpc updates for 5.12

A large series adding wrappers for our interrupt handlers, so that irq/nmi/=
user
tracking can be isolated in the wrappers rather than spread in each handler.

Conversion of the 32-bit syscall handling into C.

A series from Nick to streamline our TLB flushing when using the Radix MMU.

Switch to using queued spinlocks by default for 64-bit server CPUs.

A rework of our PCI probing so that it happens later in boot, when more gen=
eric
infrastructure is available.

Two small fixes to allow 32-bit little-endian processes to run on 64-bit
kernels.

Other smaller features, fixes & cleanups.

Thanks to:
  Alexey Kardashevskiy, Ananth N Mavinakayanahalli, Aneesh Kumar K.V, Athira
  Rajeev, Bhaskar Chowdhury, C=C3=A9dric Le Goater, Chengyang Fan, Christop=
he Leroy,
  Christopher M. Riedl, Fabiano Rosas, Florian Fainelli, Frederic Barrat, G=
anesh
  Goudar, Hari Bathini, Jiapeng Chong, Joseph J Allen, Kajol Jain, Markus
  Elfring, Michal Suchanek, Nathan Lynch, Naveen N. Rao, Nicholas Piggin, O=
liver
  O'Halloran, Pingfan Liu, Po-Hsu Lin, Qian Cai, Ram Pai, Randy Dunlap, San=
dipan
  Das, Stephen Rothwell, Tyrel Datwyler, Will Springer, Yury Norov, Zheng
  Yongjun.

- ------------------------------------------------------------------
Alexey Kardashevskiy (3):
      powerpc/iommu/debug: Add debugfs entries for IOMMU tables
      powerpc/uaccess: Avoid might_fault() when user access is enabled
      powerpc/kuap: Restore AMR after replaying soft interrupts

Ananth N Mavinakayanahalli (2):
      powerpc/sstep: Check instruction validity against ISA version before =
emulation
      powerpc/sstep: Fix incorrect return from analyze_instr()

Aneesh Kumar K.V (3):
      powerpc/mm: Enable compound page check for both THP and HugeTLB
      powerpc/mm: Add PG_dcache_clean to indicate dcache clean state
      powerpc/mm: Remove dcache flush from memory remove.

Athira Rajeev (3):
      powerpc/perf: Include PMCs as part of per-cpu cpuhw_events struct
      powerpc/perf: Expose Performance Monitor Counter SPR's as part of ext=
ended regs
      powerpc/perf: Record counter overflow always if SAMPLE_IP is unset

Bhaskar Chowdhury (1):
      powerpc/44x: Fix a spelling mismach to mismatch in head_44x.S

Chengyang Fan (1):
      powerpc: remove unneeded semicolons

Christophe Leroy (38):
      powerpc/kvm: Force selection of CONFIG_PPC_FPU
      powerpc/47x: Disable 256k page size
      powerpc/44x: Remove STDBINUTILS kconfig option
      powerpc/32s: Only build hash code when CONFIG_PPC_BOOK3S_604 is selec=
ted
      powerpc/xmon: Enable breakpoints on 8xx
      powerpc/xmon: Select CONSOLE_POLL for the 8xx
      powerpc/32s: move DABR match out of handle_page_fault
      powerpc/8xx: Fix software emulation interrupt
      powerpc/uaccess: Perform barrier_nospec() in KUAP allowance helpers
      powerpc/32s: Change mfsrin() into a static inline function
      powerpc/32s: mfsrin()/mtsrin() become mfsr()/mtsr()
      powerpc/32s: Allow constant folding in mtsr()/mfsr()
      powerpc/32: Preserve cr1 in exception prolog stack check to fix build=
 error
      powerpc/32s: Add missing call to kuep_lock on syscall entry
      powerpc/32: Always enable data translation on syscall entry
      powerpc/32: On syscall entry, enable instruction translation at the s=
ame time as data
      powerpc/32: Reorder instructions to avoid using CTR in syscall entry
      powerpc/irq: Add helper to set regs->softe
      powerpc/irq: Rework helpers that manipulate MSR[EE/RI]
      powerpc/irq: Add stub irq_soft_mask_return() for PPC32
      powerpc/syscall: Rename syscall_64.c into interrupt.c
      powerpc/syscall: Make interrupt.c buildable on PPC32
      powerpc/syscall: Use is_compat_task()
      powerpc/syscall: Save r3 in regs->orig_r3
      powerpc/syscall: Change condition to check MSR_RI
      powerpc/32: Always save non volatile GPRs at syscall entry
      powerpc/syscall: implement system call entry/exit logic in C for PPC32
      powerpc/32: Remove verification of MSR_PR on syscall in the ASM entry
      powerpc/32: Remove the counter in global_dbcr0
      powerpc/syscall: Do not check unsupported scv vector on PPC32
      powerpc/32: Handle bookE debugging in C in syscall entry/exit
      powerpc/syscall: Avoid storing 'current' in another pointer
      spi: mpc52xx: Avoid using get_tbl()
      powerpc/time: Avoid using get_tbl()
      powerpc/time: Remove get_tbl()
      powerpc/uaccess: get rid of small constant size cases in raw_copy_{to=
,from}_user()
      powerpc/uaccess: Merge __put_user_size_allowed() into __put_user_size=
()
      powerpc/uaccess: Merge raw_copy_to_user_allowed() into raw_copy_to_us=
er()

Christopher M. Riedl (1):
      powerpc64/idle: Fix SP offsets when saving GPRs

C=C3=A9dric Le Goater (25):
      powerpc/mm: Include __find_linux_pte() prototype
      powerpc/pseries/ras: Remove unused variable 'status'
      powerpc/pseries/eeh: Make pseries_pcibios_bus_add_device() static
      powerpc/pseries/ras: Make init_ras_hotplug_IRQ() static
      powerpc/pmem: Include pmem prototypes
      powerpc/setup_64: Make some routines static
      powerpc/mce: Include prototypes
      powerpc/smp: Include tick_broadcast() prototype
      powerpc/smp: Make debugger_ipi_callback() static
      powerpc/optprobes: Remove unused routine patch_imm32_load_insns()
      powerpc/optprobes: Make patch_imm64_load_insns() static
      powerpc/mm: Declare some prototypes
      powerpc/mm: Move hpte_insert_repeating() prototype
      powerpc/mm: Declare preload_new_slb_context() prototype
      powerpc/mm/hugetlb: Make pseries_alloc_bootmem_huge_page() static
      powerpc/mm: Declare arch_report_meminfo() prototype.
      powerpc/watchdog: Declare soft_nmi_interrupt() prototype
      KVM: PPC: Make the VMX instruction emulation routines static
      KVM: PPC: Book3S HV: Include prototypes
      KVM: PPC: Book3S HV: Declare some prototypes
      powerpc/pseries: Make IOV setup routines static
      powerpc/pcidn: Make IOV setup routines static
      powerpc/pseries/eeh: Make pseries_send_allow_unfreeze() static
      powerpc/vas: Fix IRQ name allocation
      powerpc/prom: Fix "ibm,arch-vec-5-platform-support" scan

Ganesh Goudar (2):
      powerpc/mce: Reduce the size of event arrays
      powerpc/mce: Remove per cpu variables from MCE handlers

Hari Bathini (1):
      powerpc/kexec_file: fix FDT size estimation for kdump kernel

Jiapeng Chong (1):
      powerpc/xive: Assign boolean values to a bool variable

Joseph J Allen (1):
      powerpc: use kernel endianness in MSR in 32-bit signal handler

Kajol Jain (2):
      powerpc/perf/hv-24x7: Dont create sysfs event files for dummy events
      powerpc/perf: Adds support for programming of Thresholding in P10

Markus Elfring (6):
      cxl: Reduce scope for the variable =E2=80=9Cmm=E2=80=9D in cxllib_get=
_PE_attributes()
      powerpc/pseries: Delete an unnecessary kfree() call in dlpar_store()
      powerpc/pseries: Delete an error message for a failed string duplicat=
ion in dlpar_store()
      powerpc/82xx: Delete an unnecessary of_node_put() call in pq2ads_pci_=
init_irq()
      powerpc/82xx: Use common error handling code in pq2ads_pci_init_irq()
      powerpc/setup: Adjust six seq_printf() calls in show_cpuinfo()

Michael Ellerman (10):
      powerpc/64s/kuap: Use mmu_has_feature()
      powerpc/akebono: Fix unmet dependency errors
      powerpc/64: Make stack tracing work during very early boot
      powerpc/64s: Handle program checks in wrong endian during early boot
      powerpc/powernv/pci: Use kzalloc() for phb related allocations
      powerpc/83xx: Fix build error when CONFIG_PCI=3Dn
      powerpc/mm/64s: Fix no previous prototype warning
      powerpc/amigaone: Make amigaone_discover_phbs() static
      powerpc/uaccess: Simplify unsafe_put_user() implementation
      powerpc/64: Fix stack trace not displaying final frame

Michal Suchanek (1):
      powerpc: Fix build error in paravirt.h

Nathan Lynch (1):
      powerpc/pseries/dlpar: handle ibm, configure-connector delay status

Nicholas Piggin (53):
      powerpc: Always enable queued spinlocks for 64s, disable for others
      powerpc/64s: interrupt exit improve bounding of interrupt recursion
      KVM: PPC: Book3S HV: Context tracking exit guest context before enabl=
ing irqs
      powerpc/64s: move DABR match out of handle_page_fault
      powerpc/64s: move the hash fault handling logic to C
      powerpc: remove arguments from fault handler functions
      powerpc/fsl_booke/32: CacheLockingException remove args
      powerpc: do_break get registers from regs
      powerpc: DebugException remove args
      powerpc/32: transfer can avoid saving r4/r5 over trace call
      powerpc: bad_page_fault get registers from regs
      powerpc/64s: add do_bad_page_fault_segv handler
      powerpc: rearrange do_page_fault error case to be inside exception_en=
ter
      powerpc/64s: move bad_page_fault handling to C
      powerpc/64s: split do_hash_fault
      powerpc/mm: Remove stale do_page_fault comment referring to SLB faults
      powerpc/64s: slb comment update
      powerpc/traps: add NOKPROBE_SYMBOL for sreset and mce
      powerpc/perf: move perf irq/nmi handling details into traps.c
      powerpc/time: move timer_broadcast_interrupt prototype to asm/time.h
      powerpc: add and use unknown_async_exception
      powerpc/cell: tidy up pervasive declarations
      powerpc: introduce die_mce
      powerpc/mce: ensure machine check handler always tests RI
      powerpc: improve handling of unrecoverable system reset
      powerpc: interrupt handler wrapper functions
      powerpc: add interrupt wrapper entry / exit stub functions
      powerpc/traps: factor common code from program check and emulation as=
sist
      powerpc: convert interrupt handlers to use wrappers
      powerpc: add interrupt_cond_local_irq_enable helper
      powerpc/64: context tracking remove _TIF_NOHZ
      powerpc/64s/hash: improve context tracking of hash faults
      powerpc/64: context tracking move to interrupt wrappers
      powerpc/64: add context tracking to asynchronous interrupts
      powerpc: handle irq_enter/irq_exit in interrupt handler wrappers
      powerpc/64s: move context tracking exit to interrupt exit path
      powerpc/64s: reconcile interrupts in C
      powerpc/64: move account_stolen_time into its own function
      powerpc/64: entry cpu time accounting in C
      powerpc/pseries/mce: restore msr before returning from handler
      powerpc: move NMI entry/exit code into wrapper
      powerpc/64s: move NMI soft-mask handling to C
      powerpc/64s: runlatch interrupt handling in C
      powerpc/64s/radix: add warning and comments in mm_cpumask trim
      powerpc/64s/radix: refactor TLB flush type selection
      powerpc/64s/radix: Check for no TLB flush required
      powerpc/64s/radix: Allow mm_cpumask trimming from external sources
      powerpc/64s/radix: occasionally attempt to trim mm_cpumask
      powerpc/64s/radix: serialize_against_pte_lookup IPIs trim mm_cpumask
      powerpc/64s: Implement ptep_clear_flush_young that does not flush TLBs
      powerpc: remove interrupt handler functions from the noinstr section
      powerpc/64s: syscall real mode entry use mtmsrd rather than rfid
      powerpc/64s: Remove EXSLB interrupt save area

Oliver O'Halloran (24):
      selftests/powerpc: Hoist helper code out of eeh-basic
      selftests/powerpc: Use stderr for debug messages in eeh-functions
      selftests/powerpc: Add VF recovery tests
      powerpc/eeh: Rework pci_dev lookup in debugfs attributes
      powerpc/eeh: Add a debugfs interface to check if a driver supports re=
covery
      powerpc/pci: Delete traverse_pci_dn()
      powerpc/powernv/pci: Drop pnv_phb->initialized
      powerpc/pci: Add ppc_md.discover_phbs()
      powerpc/pci: Move PHB discovery for PCI_DN using platforms
      powerpc/512x: Move PHB discovery
      powerpc/52xx/efika: Move PHB discovery
      powerpc/52xx/lite5200: Move PHB discovery
      powerpc/52xx/media5200: Move PHB discovery
      powerpc/52xx/mpc5200_simple: Move PHB discovery
      powerpc/82xx/*: Move PHB discovery
      powerpc/83xx: Move PHB discovery
      powerpc/amigaone: Move PHB discovery
      powerpc/chrp: Move PHB discovery
      powerpc/embedded6xx/holly: Move PHB discovery
      powerpc/embedded6xx/linkstation: Move PHB discovery
      powerpc/embedded6xx/mpc7448: Move PHB discovery
      powerpc/embedded6xx/mve5100: Move PHB discovery
      powerpc/pasemi: Move PHB discovery
      powerpc/pci: Remove unimplemented prototypes

Pingfan Liu (1):
      powerpc/time: Enable sched clock for irqtime

Po-Hsu Lin (1):
      selftests/powerpc: Make the test check in eeh-basic.sh posix compliant

Qian Cai (2):
      powerpc/powernv/pci: fix a RCU-list lock
      powerpc/mm/book3s64/iommu: fix some RCU-list locks

Sandipan Das (3):
      powerpc/pkeys: Remove unused code
      powerpc/sstep: Fix load-store and update emulation
      powerpc/sstep: Fix darn emulation

Will Springer (1):
      powerpc/compat_sys: swap hi/lo parts of 64-bit syscall args in LE mode

Zheng Yongjun (1):
      ocxl: use DEFINE_MUTEX() for mutex lock


 arch/powerpc/Kconfig                                  |  35 +-
 arch/powerpc/Kconfig.debug                            |   1 +
 arch/powerpc/configs/44x/akebono_defconfig            |   5 +
 arch/powerpc/include/asm/asm-prototypes.h             |  29 --
 arch/powerpc/include/asm/book3s/32/kup.h              |   8 +-
 arch/powerpc/include/asm/book3s/32/mmu-hash.h         |   2 +-
 arch/powerpc/include/asm/book3s/64/kup.h              |   4 +-
 arch/powerpc/include/asm/book3s/64/mmu-hash.h         |   5 +
 arch/powerpc/include/asm/book3s/64/mmu.h              |   2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h          |  23 +-
 arch/powerpc/include/asm/book3s/64/tlbflush-radix.h   |   2 +-
 arch/powerpc/include/asm/book3s/64/tlbflush.h         |   2 +-
 arch/powerpc/include/asm/bug.h                        |   9 +-
 arch/powerpc/include/asm/cacheflush.h                 |   6 +
 arch/powerpc/include/asm/cputime.h                    |  14 +
 arch/powerpc/include/asm/debug.h                      |   4 -
 arch/powerpc/include/asm/firmware.h                   |   2 +-
 arch/powerpc/include/asm/hugetlb.h                    |   2 -
 arch/powerpc/include/asm/hw_irq.h                     |  96 +++--
 arch/powerpc/include/asm/interrupt.h                  | 449 ++++++++++++++=
++++++
 arch/powerpc/include/asm/kexec.h                      |   1 +
 arch/powerpc/include/asm/kup.h                        |   2 +
 arch/powerpc/include/asm/kvm_book3s.h                 |   7 +
 arch/powerpc/include/asm/kvm_ppc.h                    |  10 +-
 arch/powerpc/include/asm/machdep.h                    |   3 +
 arch/powerpc/include/asm/mce.h                        |  20 +-
 arch/powerpc/include/asm/mmu_context.h                |   3 -
 arch/powerpc/include/asm/nmi.h                        |   1 +
 arch/powerpc/include/asm/paca.h                       |  13 +-
 arch/powerpc/include/asm/paravirt.h                   |   1 +
 arch/powerpc/include/asm/perf_event.h                 |   2 +
 arch/powerpc/include/asm/perf_event_server.h          |   5 +-
 arch/powerpc/include/asm/pgtable.h                    |   3 +
 arch/powerpc/include/asm/pkeys.h                      |   6 -
 arch/powerpc/include/asm/ppc-pci.h                    |   7 -
 arch/powerpc/include/asm/ppc_asm.h                    |  24 --
 arch/powerpc/include/asm/ptrace.h                     |   8 +
 arch/powerpc/include/asm/reg.h                        |  22 +-
 arch/powerpc/include/asm/reg_booke.h                  |   3 +
 arch/powerpc/include/asm/rtas.h                       |   2 +-
 arch/powerpc/include/asm/setup.h                      |   6 +-
 arch/powerpc/include/asm/simple_spinlock.h            |   4 +-
 arch/powerpc/include/asm/smp.h                        |   2 +-
 arch/powerpc/include/asm/thread_info.h                |   4 +-
 arch/powerpc/include/asm/time.h                       |   2 +
 arch/powerpc/include/asm/uaccess.h                    |  99 +----
 arch/powerpc/include/asm/vdso/timebase.h              |   6 -
 arch/powerpc/include/asm/xmon.h                       |   4 +-
 arch/powerpc/include/uapi/asm/perf_regs.h             |  28 +-
 arch/powerpc/kernel/Makefile                          |   4 +-
 arch/powerpc/kernel/asm-offsets.c                     |   3 +-
 arch/powerpc/kernel/dbell.c                           |   9 +-
 arch/powerpc/kernel/eeh.c                             | 121 ++++--
 arch/powerpc/kernel/entry_32.S                        | 347 ++-------------
 arch/powerpc/kernel/entry_64.S                        |   8 +-
 arch/powerpc/kernel/exceptions-64e.S                  |   8 +-
 arch/powerpc/kernel/exceptions-64s.S                  | 324 ++++----------
 arch/powerpc/kernel/head_32.h                         |  98 +----
 arch/powerpc/kernel/head_40x.S                        |  11 +-
 arch/powerpc/kernel/head_44x.S                        |   4 +-
 arch/powerpc/kernel/head_8xx.S                        |  13 +-
 arch/powerpc/kernel/head_book3s_32.S                  |  32 +-
 arch/powerpc/kernel/head_booke.h                      |  57 +--
 arch/powerpc/kernel/head_fsl_booke.S                  |   6 +-
 arch/powerpc/kernel/idle_book3s.S                     | 138 +++---
 arch/powerpc/kernel/{syscall_64.c =3D> interrupt.c}     | 203 ++++++---
 arch/powerpc/kernel/iommu.c                           |  46 ++
 arch/powerpc/kernel/irq.c                             |  34 +-
 arch/powerpc/kernel/mce.c                             |  96 +++--
 arch/powerpc/kernel/optprobes.c                       |  21 +-
 arch/powerpc/kernel/pci-common.c                      |  10 +
 arch/powerpc/kernel/pci_dn.c                          |  62 ---
 arch/powerpc/kernel/process.c                         |  13 +-
 arch/powerpc/kernel/prom.c                            |   2 +-
 arch/powerpc/kernel/prom_init.c                       |  12 +-
 arch/powerpc/kernel/ptrace/ptrace.c                   |   4 -
 arch/powerpc/kernel/setup-common.c                    |  13 +-
 arch/powerpc/kernel/setup.h                           |  12 +-
 arch/powerpc/kernel/setup_64.c                        |   7 +-
 arch/powerpc/kernel/signal.c                          |   4 -
 arch/powerpc/kernel/signal_32.c                       |   3 +-
 arch/powerpc/kernel/smp.c                             |   3 +-
 arch/powerpc/kernel/sys_ppc32.c                       |  49 ++-
 arch/powerpc/kernel/syscalls/syscall.tbl              |  20 +-
 arch/powerpc/kernel/tau_6xx.c                         |   6 +-
 arch/powerpc/kernel/time.c                            |   9 +-
 arch/powerpc/kernel/traps.c                           | 274 ++++++------
 arch/powerpc/kernel/watchdog.c                        |  16 +-
 arch/powerpc/kexec/elf_64.c                           |   2 +-
 arch/powerpc/kexec/file_load_64.c                     |  35 ++
 arch/powerpc/kvm/Kconfig                              |   1 +
 arch/powerpc/kvm/book3s_64_mmu_hv.c                   |   1 +
 arch/powerpc/kvm/book3s_emulate.c                     |   4 -
 arch/powerpc/kvm/book3s_hv.c                          |   7 +-
 arch/powerpc/kvm/book3s_hv_builtin.c                  |   1 +
 arch/powerpc/kvm/book3s_xive.c                        |   4 +-
 arch/powerpc/kvm/booke.c                              |   1 +
 arch/powerpc/kvm/powerpc.c                            |   8 +-
 arch/powerpc/lib/pmem.c                               |   1 +
 arch/powerpc/lib/sstep.c                              | 101 ++++-
 arch/powerpc/mm/book3s32/Makefile                     |   4 +-
 arch/powerpc/mm/book3s32/mmu.c                        |   2 +-
 arch/powerpc/mm/book3s64/hash_hugetlbpage.c           |   4 -
 arch/powerpc/mm/book3s64/hash_utils.c                 | 101 +++--
 arch/powerpc/mm/book3s64/internal.h                   |   2 +
 arch/powerpc/mm/book3s64/iommu_api.c                  |  10 +-
 arch/powerpc/mm/book3s64/pgtable.c                    |  13 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                  | 299 ++++++++-----
 arch/powerpc/mm/book3s64/slb.c                        |  40 +-
 arch/powerpc/mm/fault.c                               |  75 ++--
 arch/powerpc/mm/hugetlbpage.c                         |  20 +-
 arch/powerpc/mm/mem.c                                 |  54 ++-
 arch/powerpc/mm/pgtable.c                             |  15 +-
 arch/powerpc/mm/ptdump/segment_regs.c                 |   2 +-
 arch/powerpc/perf/core-book3s.c                       |  96 ++---
 arch/powerpc/perf/core-fsl-emb.c                      |  25 --
 arch/powerpc/perf/hv-24x7.c                           |  15 +
 arch/powerpc/perf/isa207-common.c                     |  67 ++-
 arch/powerpc/perf/isa207-common.h                     |  15 +-
 arch/powerpc/perf/mpc7450-pmu.c                       |   5 +-
 arch/powerpc/perf/perf_regs.c                         |  13 +-
 arch/powerpc/perf/power10-pmu.c                       |   4 +-
 arch/powerpc/perf/power5+-pmu.c                       |   5 +-
 arch/powerpc/perf/power5-pmu.c                        |   5 +-
 arch/powerpc/perf/power6-pmu.c                        |   5 +-
 arch/powerpc/perf/power7-pmu.c                        |   5 +-
 arch/powerpc/perf/ppc970-pmu.c                        |   5 +-
 arch/powerpc/platforms/44x/Kconfig                    |   7 -
 arch/powerpc/platforms/512x/mpc5121_ads.c             |  13 +-
 arch/powerpc/platforms/52xx/efika.c                   |   3 +-
 arch/powerpc/platforms/52xx/lite5200.c                |   3 +-
 arch/powerpc/platforms/52xx/media5200.c               |   3 +-
 arch/powerpc/platforms/52xx/mpc5200_simple.c          |   3 +-
 arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c         |   8 +-
 arch/powerpc/platforms/82xx/mpc8272_ads.c             |   2 +-
 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c          |  13 +-
 arch/powerpc/platforms/82xx/pq2fads.c                 |   3 +-
 arch/powerpc/platforms/83xx/asp834x.c                 |   1 +
 arch/powerpc/platforms/83xx/km83xx.c                  |   1 +
 arch/powerpc/platforms/83xx/misc.c                    |   2 -
 arch/powerpc/platforms/83xx/mpc830x_rdb.c             |   1 +
 arch/powerpc/platforms/83xx/mpc831x_rdb.c             |   1 +
 arch/powerpc/platforms/83xx/mpc832x_mds.c             |   1 +
 arch/powerpc/platforms/83xx/mpc832x_rdb.c             |   1 +
 arch/powerpc/platforms/83xx/mpc834x_itx.c             |   1 +
 arch/powerpc/platforms/83xx/mpc834x_mds.c             |   1 +
 arch/powerpc/platforms/83xx/mpc836x_mds.c             |   1 +
 arch/powerpc/platforms/83xx/mpc836x_rdk.c             |   1 +
 arch/powerpc/platforms/83xx/mpc837x_mds.c             |   1 +
 arch/powerpc/platforms/83xx/mpc837x_rdb.c             |   1 +
 arch/powerpc/platforms/83xx/mpc83xx.h                 |   2 +-
 arch/powerpc/platforms/8xx/machine_check.c            |   2 +-
 arch/powerpc/platforms/amigaone/setup.c               |  10 +-
 arch/powerpc/platforms/cell/pervasive.c               |   1 +
 arch/powerpc/platforms/cell/pervasive.h               |   3 -
 arch/powerpc/platforms/cell/ras.c                     |   6 +-
 arch/powerpc/platforms/cell/ras.h                     |   9 +-
 arch/powerpc/platforms/chrp/pci.c                     |   8 +
 arch/powerpc/platforms/chrp/setup.c                   |  12 +-
 arch/powerpc/platforms/embedded6xx/holly.c            |  10 +-
 arch/powerpc/platforms/embedded6xx/linkstation.c      |  10 +-
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c     |  14 +-
 arch/powerpc/platforms/embedded6xx/mvme5100.c         |  13 +-
 arch/powerpc/platforms/embedded6xx/storcenter.c       |   8 +-
 arch/powerpc/platforms/maple/pci.c                    |   3 +
 arch/powerpc/platforms/maple/setup.c                  |   4 +-
 arch/powerpc/platforms/pasemi/setup.c                 |   3 +-
 arch/powerpc/platforms/powermac/pci.c                 |   4 +
 arch/powerpc/platforms/powermac/setup.c               |   4 +-
 arch/powerpc/platforms/powernv/idle.c                 |   1 +
 arch/powerpc/platforms/powernv/memtrace.c             |  29 ++
 arch/powerpc/platforms/powernv/opal.c                 |   2 +-
 arch/powerpc/platforms/powernv/pci-ioda-tce.c         |   4 +
 arch/powerpc/platforms/powernv/pci-ioda.c             |  27 +-
 arch/powerpc/platforms/powernv/pci.h                  |   1 -
 arch/powerpc/platforms/powernv/setup.c                |   4 +-
 arch/powerpc/platforms/powernv/subcore.h              |   2 +-
 arch/powerpc/platforms/powernv/vas.c                  |  11 +-
 arch/powerpc/platforms/powernv/vas.h                  |   1 +
 arch/powerpc/platforms/pseries/dlpar.c                |  12 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c          |   5 +-
 arch/powerpc/platforms/pseries/pci.c                  |  15 +-
 arch/powerpc/platforms/pseries/pseries.h              |   2 +-
 arch/powerpc/platforms/pseries/ras.c                  |  36 +-
 arch/powerpc/platforms/pseries/setup.c                |  15 +-
 arch/powerpc/xmon/xmon.c                              |   6 +-
 drivers/misc/cxl/cxllib.c                             |   4 +-
 drivers/misc/ocxl/file.c                              |   3 +-
 drivers/spi/spi-mpc52xx.c                             |  12 +-
 tools/testing/selftests/powerpc/eeh/eeh-basic.sh      |  41 +-
 tools/testing/selftests/powerpc/eeh/eeh-functions.sh  | 168 +++++++-
 tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh   |  45 ++
 tools/testing/selftests/powerpc/eeh/eeh-vf-unaware.sh |  35 ++
 193 files changed, 2718 insertions(+), 2133 deletions(-)
 create mode 100644 arch/powerpc/include/asm/interrupt.h
 rename arch/powerpc/kernel/{syscall_64.c =3D> interrupt.c} (69%)
 mode change 100755 =3D> 100644 tools/testing/selftests/powerpc/eeh/eeh-fun=
ctions.sh
 create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
 create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-vf-unaware.sh
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmAznYsACgkQUevqPMjh
pYB5LQ/8Ce9IkOMv3h4pQR6y8lOmM/P1MEZSu8SxrzhJhOo7VHoEALNgBKlHvSsc
cBppRlykEg1t7XMOKotPKregIKUd3UFQop1u3copPevn/USL2JZzsDvGNLvAKsKz
pt0jy/coalSZWeqUE5S91DcpNnvsBRYCdXwz7xYKfShWh1TS8YOh6vHDzOMko2a4
3TvixYm84XW2c6FLwVz2fERBmpDsxIVRUwiLQ3ua4ouJI0ZkNuty4Xhn40ASPXa9
OxacuAV9pRs1pFCvTqGCmPHyqx1C2JhXGcfQA3S34pkq0EwARdSGvwGWIo00WKAu
eiVd/mz+oYKbTegsoKFllYeh0VYRWgbYhiJCU5vdtguBsn/gzl5IDFo6d1Do3U8I
yEVknb6zZD3DA5vc7xU+fwsVKkaq7D74nd0SuUOmqxF2fYLbiHtOqsSTGSBoDf5l
lhQ6FtoZIAnbnRY3Ktjt1/SYapAMn/VK+rf6p6Jz33FRM808veT6QGgMBv4sGmw0
05z93uHYSS5g6jWrw5UjPWuPhcmAjnZdXFZtQFX06JhPKTCMqneShVD6guyZaAfw
ztr5sYJgYjMDOR0+tNC8xb0AeKFUCagT4Ebxm/76JwkIa/s00QZH1v3Ke1C7+QBv
IANgpZdsb+49GJfYv50s/Wk43E2+1flXsBH4EqRh7j2/tqRdkuM=3D
=3DwC/q
-----END PGP SIGNATURE-----
