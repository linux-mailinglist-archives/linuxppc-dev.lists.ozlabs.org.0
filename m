Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14319EB4F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 14:55:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wDD33bX0zDqTG
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 22:55:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wD9S6Gx4zDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 22:53:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HDiA0VVo; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48wD9M49qXz9sPF;
 Sun,  5 Apr 2020 22:52:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1586091179;
 bh=lpdUegVcxtzMDa0QBUZMeJV6xtxN40UuoN6wE/Cjkjs=;
 h=From:To:Cc:Subject:Date:From;
 b=HDiA0VVoFoCzgikV2TM4ApE7U+Olip7N3LpucHbrJ1aWSa0n6WF84HLxFS1/FQ19P
 ec73WH8+6Zi5P6oAYaQvHjOkSTQ704PNwu2KceeyHizlBTPZSAoE9FwaBx/QpmYLo6
 g43trgBAv2w53nijdTeNOlz6xgsRqEpCS2/RUVYRluDgXisycB0tYvnp8PbqeTiUOW
 0EuF/iz8dhwwkJf5W7XECuqFgYMZzw9rQxYnV9Fe0Oty2T+6KeOYiS6K2jT3mbP78e
 7QS+IJbdeWhJfrXLSu52iTeofKUqjxQydQl1Rq4jmJG353Dc7fHS6F+TuM+czuvQ7u
 U/AurZxe1JYGA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.7-1 tag
Date: Sun, 05 Apr 2020 22:53:02 +1000
Message-ID: <87h7xyrt5d.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com, shilpa.bhat@linux.vnet.ibm.com,
 gustavold@linux.ibm.com, aik@ozlabs.ru, ndesaulniers@google.com,
 psampat@linux.ibm.com, bala24@linux.ibm.com, grant.likely@arm.com,
 oohall@gmail.com, afzal.mohd.ma@gmail.com, srikar@linux.vnet.ibm.com,
 sfr@canb.auug.org.au, joe.lawrence@redhat.com, maskray@google.com,
 ilie.halip@gmail.com, aneesh.kumar@linux.ibm.com, yuehaibing@huawei.com,
 rppt@linux.ibm.com, chenzhou10@huawei.com, ganeshgr@linux.ibm.com,
 dougmill@linux.vnet.ibm.com, kjain@linux.ibm.com, leonardo@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, agust@denx.de, laurentiu.tudor@nxp.com,
 nathanl@linux.ibm.com, arnd@arndb.de, alistair@popple.id.au, npiggin@gmail.com,
 oss@buserror.net, olof@lixom.net, maddy@linux.ibm.com,
 christophe.jaillet@wanadoo.fr, clg@kaod.org, courbet@google.com,
 vaibhav@linux.ibm.com, bhelgaas@google.com, natechancellor@gmail.com,
 dja@axtens.net, farosas@linux.ibm.com, gregkh@linuxfoundation.org,
 lpechacek@suse.cz, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com,
 joe@perches.com, po-hsu.lin@canonical.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 5.7.

Slightly late as I had to rebase mid-week to insert a bug fix.

There is one conflict in fs/sysfs/group.c, between our:

  9255782f7061 ("sysfs: Wrap __compat_only_sysfs_link_entry_to_kobj functio=
n to change the symlink name")

And:

  303a42769c4c ("sysfs: add sysfs_group{s}_change_owner()")

The resolution is to take all of the changes from 303a42769c4c, except that=
 the
EXPORT_SYMBOL_GPL prior to sysfs_group_attrs_change_owner() should be:

EXPORT_SYMBOL_GPL(compat_only_sysfs_link_entry_to_kobj);

not:

EXPORT_SYMBOL_GPL(__compat_only_sysfs_link_entry_to_kobj);

cheers


The following changes since commit 11a48a5a18c63fd7621bb050228cebf13566e4d8:

  Linux 5.6-rc2 (2020-02-16 13:16:59 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.7-1

for you to fetch changes up to c17eb4dca5a353a9dbbb8ad6934fe57af7165e91:

  powerpc: Make setjmp/longjmp signature standard (2020-04-01 14:30:51 +110=
0)

- ------------------------------------------------------------------
powerpc updates for 5.7

 - A large series from Nick for 64-bit to further rework our exception vect=
ors,
   and rewrite portions of the syscall entry/exit and interrupt return in C=
. The
   result is much easier to follow code that is also faster in general.

 - Cleanup of our ptrace code to split various parts out that had become ba=
dly
   intertwined with #ifdefs over the years.

 - Changes to our NUMA setup under the PowerVM hypervisor which should
   hopefully avoid non-sensical topologies which can lead to warnings from =
the
   workqueue code and other problems.

 - MAINTAINERS updates to remove some of our old orphan entries and update =
the
   status of others.

 - Quite a few other small changes and fixes all over the map.

Thanks to:
  Abdul Haleem, afzal mohammed, Alexey Kardashevskiy, Andrew Donnellan, Ane=
esh
  Kumar K.V, Balamuruhan S, C=C3=A9dric Le Goater, Chen Zhou, Christophe JA=
ILLET,
  Christophe Leroy, Christoph Hellwig, Clement Courbet, Daniel Axtens, David
  Gibson, Douglas Miller, Fabiano Rosas, Fangrui Song, Ganesh Goudar, Gauth=
am R.
  Shenoy, Greg Kroah-Hartman, Greg Kurz, Gustavo Luiz Duarte, Hari Bathini,=
 Ilie
  Halip, Jan Kara, Joe Lawrence, Joe Perches, Kajol Jain, Larry Finger,
  Laurentiu Tudor, Leonardo Bras, Libor Pechacek, Madhavan Srinivasan, Mahe=
sh
  Salgaonkar, Masahiro Yamada, Masami Hiramatsu, Mauricio Faria de Oliveira,
  Michael Neuling, Michal Suchanek, Mike Rapoport, Nageswara R Sastry, Nath=
an
  Chancellor, Nathan Lynch, Naveen N. Rao, Nicholas Piggin, Nick Desaulnier=
s,
  Oliver O'Halloran, Po-Hsu Lin, Pratik Rajesh Sampat, Rasmus Villemoes, Ra=
vi
  Bangoria, Roman Bolshakov, Sam Bobroff, Sandipan Das, Santosh S, Sedat Di=
lek,
  Segher Boessenkool, Shilpasri G Bhat, Sourabh Jain, Srikar Dronamraju, St=
ephen
  Rothwell, Tyrel Datwyler, Vaibhav Jain, YueHaibing.

- ------------------------------------------------------------------
Alexey Kardashevskiy (2):
      powerpc/book3s64: Fix error handling in mm_iommu_do_alloc()
      powerpc/prom_init: Pass the "os-term" message to hypervisor

Aneesh Kumar K.V (2):
      powerpc/hash64/devmap: Use H_PAGE_THP_HUGE when setting up huge devma=
p PTE entries
      powerpc/64: Avoid isync in flush_dcache_range()

Balamuruhan S (1):
      powerpc/sstep: Fix DS operand in ld encoding to appropriate value

Chen Zhou (1):
      PCI: rpaphp: Remove unused variable 'value'

Christophe JAILLET (2):
      powerpc/83xx: Fix some typo in some warning message
      powerpc/83xx: Add some error handling in 'quirk_mpc8360e_qe_enet10()'

Christophe Leroy (32):
      powerpc/process: Remove unneccessary #ifdef CONFIG_PPC64 in copy_thre=
ad_tls()
      powerpc/32s: Don't flush all TLBs when flushing one page
      powerpc/32: Warn and return ENOSYS on syscalls from kernel
      powerpc: Don't use thread struct for saving SRR0/1 on syscall.
      powerpc/32s: Slenderize _tlbia() for powerpc 603/603e
      powerpc/32: don't restore r0, r6-r8 on exception entry path after tra=
ce_hardirqs_off()
      powerpc/32: refactor pmd_offset(pud_offset(pgd_offset...
      powerpc/32: drop get_pteptr()
      powerpc/mm: Don't kmap_atomic() in pte_offset_map() on PPC32
      powerpc: Add current_stack_pointer as a register global
      powerpc/irq: Use current_stack_pointer in check_stack_overflow()
      powerpc/irq: use IS_ENABLED() in check_stack_overflow()
      powerpc/irq: Use current_stack_pointer in do_IRQ()
      powerpc/32: Fix missing NULL pmd check in virt_to_kpte()
      selftests/powerpc: Add tlbie_test in .gitignore
      powerpc/kprobes: Remove redundant code
      powerpc/kasan: Fix kasan_remap_early_shadow_ro()
      powerpc/32s: reorder Linux PTE bits to better match Hash PTE bits.
      powerpc/kprobes: Ignore traps that happened in real mode
      powerpc: Move ptrace into a subdirectory.
      powerpc/ptrace: remove unused header includes
      powerpc/ptrace: drop unnecessary #ifdefs CONFIG_PPC64
      powerpc/ptrace: drop PARAMETER_SAVE_AREA_OFFSET
      powerpc/ptrace: split out VSX related functions.
      powerpc/ptrace: split out ALTIVEC related functions.
      powerpc/ptrace: split out SPE related functions.
      powerpc/ptrace: split out TRANSACTIONAL_MEM related functions.
      powerpc/ptrace: move register viewing functions out of ptrace.c
      powerpc/ptrace: split out ADV_DEBUG_REGS related functions.
      powerpc/ptrace: create ptrace_get_debugreg()
      powerpc/ptrace: create ppc_gethwdinfo()
      powerpc/ptrace: move ptrace_triggered() into hw_breakpoint.c

Clement Courbet (1):
      powerpc: Make setjmp/longjmp signature standard

C=C3=A9dric Le Goater (4):
      powerpc/xive: Use XIVE_BAD_IRQ instead of zero to catch non configure=
d IPIs
      powerpc/xive: Fix xmon support on the PowerNV platform
      powerpc/xmon: Add source flags to output of XIVE interrupts
      powerpc/xive: Add a debugfs file to dump internal XIVE state

Daniel Axtens (1):
      powerpc/64: Setup a paca before parsing device tree etc.

Douglas Miller (1):
      powerpc/xmon: Add ASCII dump to d1,d2,d4,d8 commands.

Fabiano Rosas (1):
      powerpc/prom_init: Remove leftover comment

Fangrui Song (1):
      powerpc/boot: Delete unneeded .globl _zimage_start

Ganesh Goudar (1):
      powerpc/pseries: Handle UE event for memcpy_mcsafe

Greg Kroah-Hartman (6):
      powerpc/kernel: no need to check return value of debugfs_create funct=
ions
      powerpc/kvm: no need to check return value of debugfs_create functions
      powerpc/mm: book3s64: hash_utils: no need to check return value of de=
bugfs_create functions
      powerpc/mm: ptdump: no need to check return value of debugfs_create f=
unctions
      powerpc/cell/axon_msi: no need to check return value of debugfs_creat=
e functions
      powerpc/powernv: no need to check return value of debugfs_create func=
tions

Gustavo Luiz Duarte (2):
      selftests/powerpc: Add tm-signal-pagefault test
      selftests/powerpc: Don't rely on segfault to rerun the test

Ilie Halip (1):
      powerpc/pmac/smp: Avoid unused-variable warnings

Joe Lawrence (1):
      powerpc/vdso: remove deprecated VDS64_HAS_DESCRIPTORS references

Joe Perches (1):
      powerpc/cell: Use fallthrough;

Kajol Jain (1):
      powerpc/kernel/sysfs: Add new config option PMU_SYSFS to enable PMU S=
PRs sysfs file creation

Laurentiu Tudor (1):
      powerpc/fsl_booke: Avoid creating duplicate tlb1 entry

Leonardo Bras (1):
      powerpc/cputable: Remove unnecessary copy of cpu_spec->oprofile_type

Libor Pechacek (1):
      powerpc/pseries: Avoid NULL pointer dereference when drmem is unavail=
able

Madhavan Srinivasan (1):
      powerpc/kernel/sysfs: Refactor current sysfs.c

Michael Ellerman (22):
      powerpc/Makefile: Mark phony targets as PHONY
      powerpc: Rename current_stack_pointer() to current_stack_frame()
      Merge branch 'fixes' into next
      selftests/powerpc: Add a test of sigreturn vs VDSO
      powerpc/kuap: PPC_KUAP_DEBUG should depend on PPC_KUAP
      powerpc/xmon: Lower limits on nidump and ndump
      powerpc/64s: Fix section mismatch warnings from boot code
      powerpc/64: Prevent stack protection in early boot
      powerpc: Update MAINTAINERS
      powerpc: Update wiki link in MAINTAINERS
      powerpc: Remove PA SEMI MAINTAINERS entries
      powerpc: Mark 4xx as Orphan in MAINTAINERS
      powerpc: Drop XILINX MAINTAINERS entry
      powerpc: Update MPC5XXX MAINTAINERS entry
      powerpc: Update powermac MAINTAINERS entry
      powerpc: Update 83xx/85xx MAINTAINERS entry
      powerpc: Switch 8xx MAINTAINERS entry to Christophe
      powerpc/smp: Drop superfluous NULL check
      powerpc/smp: Use IS_ENABLED() to avoid #ifdef
      powerpc/64/tm: Don't let userspace set regs->trap via sigreturn
      powerpc/vmlinux.lds: Explicitly retain .gnu.hash
      selftests/powerpc: Fix try-run when source tree is not writable

Mike Rapoport (1):
      powerpc/32: drop unused ISA_DMA_THRESHOLD

Nathan Chancellor (1):
      powerpc/maple: Fix declaration made after definition

Naveen N. Rao (2):
      powerpc: Drop -fno-dwarf2-cfi-asm
      powerpc: Suppress .eh_frame generation

Nicholas Piggin (34):
      powerpc/64s/radix: Fix CONFIG_SMP=3Dn build
      powerpc/lib: Fix emulate_step() std test
      powerpc/pseries: Avoid harmless preempt warning
      powerpc/64: mark emergency stacks valid to unwind
      powerpc/64s/exception: Introduce INT_DEFINE parameter block for code =
generation
      powerpc/64s/exception: Add GEN_COMMON macro that uses INT_DEFINE para=
meters
      powerpc/64s/exception: Add GEN_KVM macro that uses INT_DEFINE paramet=
ers
      powerpc/64s/exception: Expand EXC_COMMON and EXC_COMMON_ASYNC macros
      powerpc/64s/exception: Move all interrupt handlers to new style code =
gen macros
      powerpc/64s/exception: Remove old INT_ENTRY macro
      powerpc/64s/exception: Remove old INT_COMMON macro
      powerpc/64s/exception: Remove old INT_KVM_HANDLER
      powerpc/64s/exception: Add ISIDE option
      powerpc/64s/exception: Move real to virt switch into the common handl=
er
      powerpc/64s/exception: Move soft-mask test to common code
      powerpc/64s/exception: Move KVM test to common code
      powerpc/64s/exception: Remove confusing IEARLY option
      powerpc/64s/exception: Remove the SPR saving patch code macros
      powerpc/64s/exception: Trim unused arguments from KVMTEST macro
      powerpc/64s/exception: Avoid touching the stack in hdecrementer
      powerpc/64s/exception: Re-inline some handlers
      powerpc/64s/exception: Clean up SRR specifiers
      powerpc/64s/exception: Add more comments for interrupt handlers
      powerpc/64s/exception: Only test KVM in SRR interrupts when PR KVM is=
 supported
      powerpc/64s/exception: Reconcile interrupts in system_reset
      powerpc/64s/exception: Soft NMI interrupt should not use ret_from_exc=
ept
      powerpc/64/syscall: Remove non-volatile GPR save optimisation
      powerpc/64/sstep: Ifdef the deprecated fast endian switch syscall
      powerpc/64/sycall: Implement syscall entry/exit logic in C
      powerpc/64/syscall: Zero volatile registers when returning
      powerpc/64: Implement soft interrupt replay in C
      powerpc/64s: Implement interrupt exit logic in C
      powerpc/64s/exception: Remove lite interrupt return
      powerpc/64/syscall: Reconcile interrupts

Nick Desaulniers (1):
      powerpc: Prefer __section and __printf from compiler_attributes.h

Oliver O'Halloran (12):
      powerpc/pseries/vio: Remove stray #ifdef CONFIG_PPC_PSERIES
      powerpc/pseries/Makefile: Remove CONFIG_PPC_PSERIES check
      powerpc/powernv: Treat an empty reboot string as default
      powerpc/powernv: Add explicit fast-reboot support
      cpufreq: powernv: Fix use-after-free
      cpufreq: powernv: Fix unsafe notifiers
      powerpc/eeh: Add sysfs files in late probe
      powerpc/eeh: Remove eeh_add_device_tree_late()
      powerpc/eeh: Do early EEH init only when required
      powerpc/eeh: Remove PHB check in probe
      powerpc/eeh: Make early EEH init pseries specific
      powerpc/eeh: Rework eeh_ops->probe()

Po-Hsu Lin (1):
      selftests/powerpc: Turn off timeout setting for benchmarks, dscr, sig=
nal, tm

Pratik Rajesh Sampat (1):
      cpufreq: powernv: Fix frame-size-overflow in powernv_cpufreq_work_fn

Shilpasri G Bhat (1):
      powerpc/powernv: Add documentation for the opal sensor_groups sysfs i=
nterfaces

Sourabh Jain (6):
      Documentation/ABI: Add ABI documentation for /sys/kernel/fadump_*
      sysfs: Wrap __compat_only_sysfs_link_entry_to_kobj function to change=
 the symlink name
      powerpc/fadump: Reorganize /sys/kernel/fadump_* sysfs files
      powerpc/powernv: Move core and fadump_release_opalcore under new kobj=
ect
      Documentation/ABI: Mark /sys/kernel/fadump_* sysfs files deprecated
      powerpc/fadump: sysfs for fadump memory reservation

Srikar Dronamraju (6):
      powerpc/smp: Use nid as fallback for package_id
      powerpc/vphn: Check for error from hcall_vphn
      powerpc/numa: Handle extra hcall_vphn error cases
      powerpc/numa: Use cpu node map of first sibling thread
      powerpc/numa: Early request for home node associativity
      powerpc/numa: Remove late request for home node associativity

Stephen Rothwell (1):
      tty: evh_bytechan: Fix out of bounds accesses

Tyrel Datwyler (1):
      powerpc/pseries: Fix of_read_drc_info_cell() to point at next record

Vaibhav Jain (1):
      powerpc/papr_scm: Mark papr_scm_ndctl() as static

YueHaibing (1):
      powerpc/pmac/smp: Drop unnecessary volatile qualifier

afzal mohammed (1):
      powerpc: Replace setup_irq() by request_irq()


 Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled          |    9 +
 Documentation/ABI/obsolete/sysfs-kernel-fadump_registered       |   10 +
 Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem      |   10 +
 Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore  |    9 +
 Documentation/ABI/testing/sysfs-firmware-opal-sensor-groups     |   21 +
 Documentation/ABI/testing/sysfs-kernel-fadump                   |   40 +
 Documentation/powerpc/firmware-assisted-dump.rst                |   32 +-
 MAINTAINERS                                                     |   49 +-
 arch/powerpc/Makefile                                           |   12 +-
 arch/powerpc/boot/Makefile                                      |    2 +
 arch/powerpc/boot/crt0.S                                        |    3 -
 arch/powerpc/include/asm/asm-prototypes.h                       |   15 +-
 arch/powerpc/include/asm/book3s/32/hash.h                       |    8 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h                    |    6 +-
 arch/powerpc/include/asm/book3s/64/hash-4k.h                    |    6 +
 arch/powerpc/include/asm/book3s/64/hash-64k.h                   |    8 +-
 arch/powerpc/include/asm/book3s/64/kup-radix.h                  |   24 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h                    |    4 +-
 arch/powerpc/include/asm/book3s/64/radix.h                      |    5 +
 arch/powerpc/include/asm/cache.h                                |    2 +-
 arch/powerpc/include/asm/cacheflush.h                           |    6 +-
 arch/powerpc/include/asm/cputime.h                              |   33 +
 arch/powerpc/include/asm/dma.h                                  |    3 +-
 arch/powerpc/include/asm/drmem.h                                |    4 +-
 arch/powerpc/include/asm/eeh.h                                  |   26 +-
 arch/powerpc/include/asm/exception-64s.h                        |    4 -
 arch/powerpc/include/asm/hw_irq.h                               |    6 +-
 arch/powerpc/include/asm/kvm_host.h                             |    3 -
 arch/powerpc/include/asm/mce.h                                  |    2 +
 arch/powerpc/include/asm/nohash/32/pgtable.h                    |    6 +-
 arch/powerpc/include/asm/opal-api.h                             |    1 +
 arch/powerpc/include/asm/perf_event.h                           |    2 +-
 arch/powerpc/include/asm/pgtable.h                              |   19 +
 arch/powerpc/include/asm/ptrace.h                               |    5 +
 arch/powerpc/include/asm/reg.h                                  |    4 +-
 arch/powerpc/include/asm/setjmp.h                               |    6 +-
 arch/powerpc/include/asm/signal.h                               |    3 +
 arch/powerpc/include/asm/switch_to.h                            |   11 +
 arch/powerpc/include/asm/time.h                                 |    4 +-
 arch/powerpc/include/asm/topology.h                             |   10 +-
 arch/powerpc/include/asm/vdso.h                                 |   24 -
 arch/powerpc/kernel/Makefile                                    |   11 +-
 arch/powerpc/kernel/btext.c                                     |    2 +-
 arch/powerpc/kernel/cputable.c                                  |    1 -
 arch/powerpc/kernel/dt_cpu_ftrs.c                               |    1 -
 arch/powerpc/kernel/eeh.c                                       |  145 +-
 arch/powerpc/kernel/entry_32.S                                  |   38 +-
 arch/powerpc/kernel/entry_64.S                                  |  895 ++-=
--
 arch/powerpc/kernel/exceptions-64e.S                            |  287 +-
 arch/powerpc/kernel/exceptions-64s.S                            | 2043 +++=
+++++----
 arch/powerpc/kernel/fadump.c                                    |  134 +-
 arch/powerpc/kernel/head_32.S                                   |    9 +-
 arch/powerpc/kernel/head_32.h                                   |   28 +-
 arch/powerpc/kernel/head_64.S                                   |    4 +-
 arch/powerpc/kernel/head_booke.h                                |    5 +-
 arch/powerpc/kernel/hw_breakpoint.c                             |   16 +
 arch/powerpc/kernel/irq.c                                       |  192 +-
 arch/powerpc/kernel/kprobes.c                                   |   84 +-
 arch/powerpc/kernel/mce.c                                       |   14 +
 arch/powerpc/kernel/mce_power.c                                 |    8 +-
 arch/powerpc/kernel/misc.S                                      |    4 +-
 arch/powerpc/kernel/of_platform.c                               |   12 +-
 arch/powerpc/kernel/paca.c                                      |   14 +-
 arch/powerpc/kernel/pci-common.c                                |    6 -
 arch/powerpc/kernel/pci-hotplug.c                               |    2 -
 arch/powerpc/kernel/process.c                                   |  124 +-
 arch/powerpc/kernel/prom_init.c                                 |    4 +-
 arch/powerpc/kernel/ptrace.c                                    | 3468 ---=
-----------------
 arch/powerpc/kernel/ptrace/Makefile                             |   20 +
 arch/powerpc/kernel/ptrace/ptrace-adv.c                         |  492 +++
 arch/powerpc/kernel/ptrace/ptrace-altivec.c                     |  128 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h                        |  184 ++
 arch/powerpc/kernel/ptrace/ptrace-noadv.c                       |  265 ++
 arch/powerpc/kernel/ptrace/ptrace-novsx.c                       |   57 +
 arch/powerpc/kernel/ptrace/ptrace-spe.c                         |   68 +
 arch/powerpc/kernel/ptrace/ptrace-tm.c                          |  851 +++=
++
 arch/powerpc/kernel/ptrace/ptrace-view.c                        |  904 +++=
++
 arch/powerpc/kernel/ptrace/ptrace-vsx.c                         |  151 +
 arch/powerpc/kernel/ptrace/ptrace.c                             |  481 +++
 arch/powerpc/kernel/{ =3D> ptrace}/ptrace32.c                     |   11 -
 arch/powerpc/kernel/setup-common.c                              |    3 +-
 arch/powerpc/kernel/setup.h                                     |    6 +
 arch/powerpc/kernel/setup_32.c                                  |    1 -
 arch/powerpc/kernel/setup_64.c                                  |   32 +-
 arch/powerpc/kernel/signal.h                                    |    2 -
 arch/powerpc/kernel/signal_64.c                                 |    4 +-
 arch/powerpc/kernel/smp.c                                       |   31 +-
 arch/powerpc/kernel/stacktrace.c                                |    6 +-
 arch/powerpc/kernel/syscall_64.c                                |  379 +++
 arch/powerpc/kernel/syscalls/syscall.tbl                        |   22 +-
 arch/powerpc/kernel/sysfs.c                                     |  381 ++-
 arch/powerpc/kernel/systbl.S                                    |    9 +-
 arch/powerpc/kernel/time.c                                      |    9 -
 arch/powerpc/kernel/traps.c                                     |   25 +-
 arch/powerpc/kernel/vdso.c                                      |    5 -
 arch/powerpc/kernel/vector.S                                    |    2 +-
 arch/powerpc/kernel/vmlinux.lds.S                               |    1 +
 arch/powerpc/kexec/Makefile                                     |    3 -
 arch/powerpc/kvm/book3s_64_mmu_hv.c                             |    5 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c                          |    5 +-
 arch/powerpc/kvm/book3s_hv.c                                    |    9 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                         |   11 -
 arch/powerpc/kvm/book3s_segment.S                               |    7 -
 arch/powerpc/kvm/timing.c                                       |   17 +-
 arch/powerpc/lib/sstep.c                                        |    5 +-
 arch/powerpc/lib/test_emulate_step.c                            |    7 +-
 arch/powerpc/mm/book3s32/hash_low.S                             |   27 +-
 arch/powerpc/mm/book3s32/mmu.c                                  |    2 +-
 arch/powerpc/mm/book3s32/tlb.c                                  |   11 +-
 arch/powerpc/mm/book3s64/hash_utils.c                           |    7 +-
 arch/powerpc/mm/book3s64/iommu_api.c                            |   39 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c                        |    1 +
 arch/powerpc/mm/book3s64/radix_tlb.c                            |    7 +-
 arch/powerpc/mm/kasan/kasan_init_32.c                           |   10 +-
 arch/powerpc/mm/mem.c                                           |    6 -
 arch/powerpc/mm/nohash/40x.c                                    |    4 +-
 arch/powerpc/mm/nohash/tlb_low.S                                |   12 +-
 arch/powerpc/mm/numa.c                                          |   97 +-
 arch/powerpc/mm/pgtable_32.c                                    |   41 +-
 arch/powerpc/mm/ptdump/bats.c                                   |    8 +-
 arch/powerpc/mm/ptdump/hashpagetable.c                          |    7 +-
 arch/powerpc/mm/ptdump/ptdump.c                                 |    8 +-
 arch/powerpc/mm/ptdump/segment_regs.c                           |    8 +-
 arch/powerpc/platforms/44x/warp.c                               |    3 -
 arch/powerpc/platforms/52xx/efika.c                             |    1 -
 arch/powerpc/platforms/83xx/km83xx.c                            |    9 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c                       |   11 +-
 arch/powerpc/platforms/8xx/cpm1.c                               |    9 +-
 arch/powerpc/platforms/8xx/m8xx_setup.c                         |    9 +-
 arch/powerpc/platforms/Kconfig.cputype                          |    8 +-
 arch/powerpc/platforms/amigaone/setup.c                         |    1 -
 arch/powerpc/platforms/cell/axon_msi.c                          |    6 +-
 arch/powerpc/platforms/cell/spufs/switch.c                      |    2 +-
 arch/powerpc/platforms/chrp/setup.c                             |   15 +-
 arch/powerpc/platforms/maple/setup.c                            |   34 +-
 arch/powerpc/platforms/powermac/pic.c                           |   29 +-
 arch/powerpc/platforms/powermac/setup.c                         |    1 -
 arch/powerpc/platforms/powermac/smp.c                           |   20 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c                    |   37 +-
 arch/powerpc/platforms/powernv/memtrace.c                       |    7 -
 arch/powerpc/platforms/powernv/opal-core.c                      |   55 +-
 arch/powerpc/platforms/powernv/opal-imc.c                       |   24 +-
 arch/powerpc/platforms/powernv/pci-ioda.c                       |    5 -
 arch/powerpc/platforms/powernv/setup.c                          |    4 +-
 arch/powerpc/platforms/powernv/vas-debug.c                      |   37 +-
 arch/powerpc/platforms/pseries/Makefile                         |    2 -
 arch/powerpc/platforms/pseries/eeh_pseries.c                    |   87 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c                 |    8 +-
 arch/powerpc/platforms/pseries/lpar.c                           |   10 +-
 arch/powerpc/platforms/pseries/of_helpers.c                     |    2 +-
 arch/powerpc/platforms/pseries/papr_scm.c                       |    5 +-
 arch/powerpc/platforms/pseries/pci_dlpar.c                      |    2 +-
 arch/powerpc/platforms/pseries/ras.c                            |    3 +
 arch/powerpc/platforms/pseries/vio.c                            |    2 -
 arch/powerpc/platforms/pseries/vphn.c                           |    3 +-
 arch/powerpc/sysdev/xive/common.c                               |  126 +-
 arch/powerpc/sysdev/xive/native.c                               |    7 +-
 arch/powerpc/sysdev/xive/spapr.c                                |   23 +-
 arch/powerpc/sysdev/xive/xive-internal.h                        |    9 +
 arch/powerpc/xmon/Makefile                                      |    3 -
 arch/powerpc/xmon/xmon.c                                        |   14 +-
 drivers/cpufreq/powernv-cpufreq.c                               |   30 +-
 drivers/pci/hotplug/rpadlpar_core.c                             |    2 +-
 drivers/pci/hotplug/rpaphp_core.c                               |    5 +-
 drivers/pci/hotplug/rpaphp_pci.c                                |    4 +-
 drivers/tty/ehv_bytechan.c                                      |   21 +-
 fs/sysfs/group.c                                                |   28 +-
 include/linux/sysfs.h                                           |   12 +
 tools/testing/selftests/powerpc/benchmarks/Makefile             |    2 +
 tools/testing/selftests/powerpc/benchmarks/settings             |    1 +
 tools/testing/selftests/powerpc/dscr/Makefile                   |    2 +
 tools/testing/selftests/powerpc/dscr/settings                   |    1 +
 tools/testing/selftests/powerpc/mm/.gitignore                   |    1 +
 tools/testing/selftests/powerpc/pmu/ebb/Makefile                |    1 +
 tools/testing/selftests/powerpc/signal/.gitignore               |    1 +
 tools/testing/selftests/powerpc/signal/Makefile                 |    4 +-
 tools/testing/selftests/powerpc/signal/settings                 |    1 +
 tools/testing/selftests/powerpc/signal/sigreturn_vdso.c         |  127 +
 tools/testing/selftests/powerpc/tm/.gitignore                   |    1 +
 tools/testing/selftests/powerpc/tm/Makefile                     |    5 +-
 tools/testing/selftests/powerpc/tm/settings                     |    1 +
 tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c |   74 +-
 tools/testing/selftests/powerpc/tm/tm-signal-pagefault.c        |  284 ++
 183 files changed, 7989 insertions(+), 6154 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_register=
ed
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_release_=
mem
 create mode 100644 Documentation/ABI/removed/sysfs-kernel-fadump_release_o=
palcore
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-opal-sensor-gr=
oups
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump
 delete mode 100644 arch/powerpc/kernel/ptrace.c
 create mode 100644 arch/powerpc/kernel/ptrace/Makefile
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-adv.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-altivec.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-decl.h
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-noadv.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-novsx.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-spe.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-tm.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-view.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-vsx.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace.c
 rename arch/powerpc/kernel/{ =3D> ptrace}/ptrace32.c (96%)
 create mode 100644 arch/powerpc/kernel/syscall_64.c
 create mode 100644 tools/testing/selftests/powerpc/benchmarks/settings
 create mode 100644 tools/testing/selftests/powerpc/dscr/settings
 create mode 100644 tools/testing/selftests/powerpc/signal/settings
 create mode 100644 tools/testing/selftests/powerpc/signal/sigreturn_vdso.c
 create mode 100644 tools/testing/selftests/powerpc/tm/settings
 create mode 100644 tools/testing/selftests/powerpc/tm/tm-signal-pagefault.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl6J1FoACgkQUevqPMjh
pYBpVQ/9H139JlzRhwGlWekfNskHKPMNWkveqeMGRr/OY1bv2XPl39q56TmbKnbs
afAmWn6AK24chQk2nQ2cPnoL+mcJ2sX6v2hwxT4vy3vrEzAf9om1MXtJPc5IvYzh
n4+1cOtZFnqRIFryJ0wrN/tXck//9z5IfUV5MNUjIkmTcoiUkwfTBM+Nq7nrDTCe
NcPU5Uf9eXsPrZUxOryeghSQD620lr6kzE10N56ewj3RIf6jDQdaFk4dBCgRzUEp
sNxDDKWWUL6ftd62RSzHflwbRSBHLr2ulWFlUw3CsBiiwK2zV4oq36R1GMRmMn+C
FbIxM3+8+G/rb9SwU5yRo55oWMFs/+0UodX7XXM1diKkg5KYqfQF2IIR2Ygmb82h
QNJP/eaS2AmVT1fD/P0ogfkb3SxU1fKt2OfJWGMLTTcYTOGGur471L6twGSCp5ON
tM1mFyMO76w0vNRuezsM6KhrLUz9O4d3OdQVB70Zv7dEUTiz0WNPWpPSvj4oTZTm
35dAx2EsGB6eQ0xDqyRAWrHmaxloSb/rbOThaUVgIcQHYwFA0C7+fG8Q7p6OPicN
zdmNix39/6Szy8763m+dXhCkB77nDDwICIJIblsKmHgtThULulQuOeITbrLnyH0J
LT9rzZHkBtHcDVQm7EQprPOu0++Ydbwb3MQ0OdQXEVnBot3FX9E=3D
=3D3l6Y
-----END PGP SIGNATURE-----
