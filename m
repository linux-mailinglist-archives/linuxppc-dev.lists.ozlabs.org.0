Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ADF7DFEE4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 06:39:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f95nJasf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SM8gy3JFnz3d8x
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 16:39:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f95nJasf;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SM8g313Ccz30fD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 16:38:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698989917;
	bh=JZMMRqeEWCEK12q10Qv605qtznyYarNTMhcLZafSnTM=;
	h=From:To:Cc:Subject:Date:From;
	b=f95nJasfMPFESHSsjIEi/31HN51j16nbNXb4QPU77MmrrqO4ICye3UioH1p9JQNTX
	 70BTE7eUWSp4vYEw7CEGbt64NLtyv4ZNpsLZXjAiMhRylKF6uSdBXcFbO9eUFgPKoD
	 oTOxuJPjD4WN1uquZ9b6FxLtQNiVps+W96IQUNW/fskkpaCBYmqPYe6TbGGViineEU
	 PmsNwu3MedQEFnCA4kx9IS3TTHZcmh8KzvOR/dwkiiYlfTRw2EM79wPRUhcqKPH1yw
	 HXY0993Kl3WS8PFTJg/fWy4VvPPm1DGSj+0MT05PG3ju80RstCMNMhxCPrTzVzLCiV
	 dknddn99WGfag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SM8fw62j4z4xV1;
	Fri,  3 Nov 2023 16:38:32 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.7-1 tag
Date: Fri, 03 Nov 2023 16:38:27 +1100
Message-ID: <878r7fgzvw.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: srikar@linux.vnet.ibm.com, jniethe5@gmail.com, bigeasy@linutronix.de, song@kernel.org, bgray@linux.ibm.com, adityag@linux.ibm.com, tanyuan@tinylab.org, robh@kernel.org, mikey@neuling.org, duminjie@vivo.com, bhe@redhat.com, haren@linux.ibm.com, stanislav.kinsburskii@gmail.com, geert@linux-m68k.org, yangyingliang@huawei.com, nnac123@linux.ibm.com, wangyufen@huawei.com, m.muzzammilashraf@gmail.com, gbatra@linux.vnet.ibm.com, naveen@kernel.org, npiggin@gmail.com, peter@n8pjl.ca, hbathini@linux.ibm.com, linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, visitorckw@gmail.com, linux@treblig.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 6.7.

There's one conflict, where we added Documentation/powerpc/kvm-nested.rst while
upstream moved Documentation/powerpc to Documentation/arch/powerpc. Resolution
is just to add it in the new location.

cheers


The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-1

for you to fetch changes up to 303d77a6e1707498f09c9d8ee91b1dc07ca315a5:

  Merge branch 'topic/ppc-kvm' into next (2023-10-27 20:58:03 +1100)

- ------------------------------------------------------------------
powerpc updates for 6.7

 - Add support for KVM running as a nested hypervisor under development versions
   of PowerVM, using the new PAPR nested virtualisation API.

 - Add support for the BPF prog pack allocator.

 - A rework of the non-server MMU handling to support execute-only on all platforms.

 - Some optimisations & cleanups for the powerpc qspinlock code.

 - Various other small features and fixes.

Thanks to: Aboorva Devarajan, Aditya Gupta, Amit Machhiwal, Benjamin Gray,
Christophe Leroy, Dr. David Alan Gilbert, Gaurav Batra, Gautam Menghani, Geert
Uytterhoeven, Haren Myneni, Hari Bathini, Joel Stanley, Jordan Niethe, Julia
Lawall, Kautuk Consul, Kuan-Wei Chiu, Michael Neuling, Minjie Du, Muhammad
Muzammil, Naveen N Rao, Nicholas Piggin, Nick Child, Nysal Jan K.A, Peter
Lafreniere, Rob Herring, Sachin Sant, Sebastian Andrzej Siewior, Shrikanth
Hegde, Srikar Dronamraju, Stanislav Kinsburskii, Vaibhav Jain, Wang Yufen, Yang
Yingliang, Yuan Tan.

- ------------------------------------------------------------------
Aditya Gupta (2):
      powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
      powerpc/vmcore: Add MMU information to vmcoreinfo

Benjamin Gray (12):
      powerpc/configs: Set more PPC debug configs
      powerpc/xive: Fix endian conversion size
      powerpc: Explicitly reverse bytes when checking for byte reversal
      powerpc: Use NULL instead of 0 for null pointers
      powerpc: Remove extern from function implementations
      powerpc: Annotate endianness of various variables and functions
      powerpc/kvm: Force cast endianness of KVM shared regs
      powerpc/opal: Annotate out param endianness
      powerpc/uaccess: Cast away __user annotation after verification
      powerpc: Cast away __iomem in low level IO routines
      powerpc/eeh: Remove unnecessary cast
      powerpc/fadump: Annotate endianness cast with __force

Christophe Leroy (38):
      powerpc: Only define __parse_fpscr() when required
      powerpc/40x: Remove stale PTE_ATOMIC_UPDATES macro
      powerpc: Remove pte_ERROR()
      powerpc: Deduplicate prototypes of ptep_set_access_flags() and phys_mem_access_prot()
      powerpc: Refactor update_mmu_cache_range()
      powerpc: Untangle fixmap.h and pgtable.h and mmu.h
      powerpc/nohash: Remove {pte/pmd}_protnone()
      powerpc/nohash: Refactor declaration of {map/unmap}_kernel_page()
      powerpc/nohash: Move 8xx version of pte_update() into pte-8xx.h
      powerpc/nohash: Replace #ifdef CONFIG_44x by IS_ENABLED(CONFIG_44x) in pgtable.h
      powerpc/nohash: Refactor pte_update()
      powerpc/nohash: Refactor checking of no-change in pte_update()
      powerpc/nohash: Deduplicate _PAGE_CHG_MASK
      powerpc/nohash: Deduplicate pte helpers
      powerpc/nohash: Refactor ptep_test_and_clear_young()
      powerpc/nohash: Deduplicate ptep_set_wrprotect() and ptep_get_and_clear()
      powerpc/nohash: Refactor pte_clear()
      powerpc/nohash: Refactor __ptep_set_access_flags()
      powerpc/e500: Simplify pte_mkexec()
      powerpc: Implement and use pgprot_nx()
      powerpc: Fail ioremap() instead of silently ignoring flags when PAGE_USER is set
      powerpc: Remove pte_mkuser() and pte_mkpriviledged()
      powerpc: Rely on address instead of pte_user()
      powerpc: Refactor permission masks used for __P/__S table and kernel memory flags
      powerpc/8xx: Use generic permission masks
      powerpc/64s: Use generic permission masks
      powerpc/nohash: Add _PAGE_WRITE to supplement _PAGE_RW
      powerpc/nohash: Replace pte_user() by pte_read()
      powerpc/e500: Introduce _PAGE_READ and remove _PAGE_USER
      powerpc/44x: Introduce _PAGE_READ and remove _PAGE_USER
      powerpc/40x: Introduce _PAGE_READ and remove _PAGE_USER
      powerpc/32s: Add _PAGE_WRITE to supplement _PAGE_RW
      powerpc/32s: Introduce _PAGE_READ and remove _PAGE_USER
      powerpc/ptdump: Display _PAGE_READ and _PAGE_WRITE
      powerpc: Finally remove _PAGE_USER
      powerpc: Support execute-only on all powerpc
      powerpc: Remove cpm_dp...() macros
      powerpc/code-patching: Perform hwsync in __patch_instruction() in case of failure

Dr. David Alan Gilbert (1):
      powerpc: Use shared font data

Gaurav Batra (1):
      powerpc/pseries/iommu: enable_ddw incorrectly returns direct mapping for SR-IOV device

Geert Uytterhoeven (1):
      powerpc: Replace GPL 2.0+ README.legal boilerplate with SPDX

Haren Myneni (1):
      powerpc/vas: Limit open window failure messages in log bufffer

Hari Bathini (7):
      vmcore: remove dependency with is_kdump_kernel() for exporting vmcore
      powerpc/fadump: make is_kdump_kernel() return false when fadump is active
      powerpc/code-patching: introduce patch_instructions()
      powerpc/bpf: implement bpf_arch_text_copy
      powerpc/bpf: implement bpf_arch_text_invalidate for bpf_prog_pack
      powerpc/bpf: rename powerpc64_jit_data to powerpc_jit_data
      powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]

Jordan Niethe (10):
      KVM: PPC: Always use the GPR accessors
      KVM: PPC: Introduce FPR/VR accessor functions
      KVM: PPC: Rename accessor generator macros
      KVM: PPC: Use accessors for VCPU registers
      KVM: PPC: Use accessors for VCORE registers
      KVM: PPC: Book3S HV: Use accessors for VCPU registers
      KVM: PPC: Book3S HV: Introduce low level MSR accessor
      KVM: PPC: Add helper library for Guest State Buffers
      KVM: PPC: Book3s HV: Hold LPIDs in an unsigned long
      KVM: PPC: Add support for nestedv2 guests

Julia Lawall (2):
      powerpc/powermac: add missing of_node_put
      powerpc/kexec_file: add missing of_node_put

Kuan-Wei Chiu (1):
      powerpc/perf: Optimize find_alternatives_list() using binary search

Michael Ellerman (5):
      Merge branch fixes into next
      powerpc: Hide empty pt_regs at base of the stack
      powerpc/32s: Implement local_flush_tlb_page_psize()
      Revert "powerpc: add `cur_cpu_spec` symbol to vmcoreinfo"
      Merge branch 'topic/ppc-kvm' into next

Michael Neuling (1):
      docs: powerpc: Document nested KVM on POWER

Minjie Du (1):
      powerpc/pseries: use kfree_sensitive() in plpks_gen_password()

Muhammad Muzammil (1):
      powerpc/bpf: Fixed 'instead' typo in bpf_jit_build_body()

Naveen N Rao (2):
      powerpc/tools: Pass -mabi=elfv2 to gcc-check-mprofile-kernel.sh
      powerpc/trace: Add support for HAVE_FUNCTION_ARG_ACCESS_API

Nicholas Piggin (6):
      powerpc/perf: Fix disabling BHRB and instruction sampling
      powerpc/qspinlock: stop queued waiters trying to set lock sleepy
      powerpc/qspinlock: propagate owner preemptedness rather than CPU number
      powerpc/qspinlock: don't propagate the not-sleepy state
      powerpc/qspinlock: Propagate sleepy if previous waiter is preempted
      powerpc/qspinlock: Rename yield_propagate_owner tunable

Nick Child (1):
      powerpc/boot: Add version to install filenames

Peter Lafreniere (1):
      powerpc/configs: Remove ReiserFS from defconfig

Rob Herring (1):
      powerpc/fsl_msi: Use device_get_match_data()

Sebastian Andrzej Siewior (1):
      powerpc/imc-pmu: Use the correct spinlock initializer.

Srikar Dronamraju (1):
      powerpc/paravirt: Improve vcpu_is_preempted

Stanislav Kinsburskii (1):
      powerpc/io: Expect immutable pointer in virt_to_phys() prototype

Wang Yufen (1):
      powerpc/pseries: fix potential memory leak in init_cpu_associativity()

Yang Yingliang (1):
      macintosh/macio-adb: add missing iounmap() on error in macio_init()

Yuan Tan (2):
      powerpc/32: Add dependencies of POWER_RESET for pmac32
      powerpc/32: Enable POWER_RESET in pmac32_defconfig


 Documentation/arch/powerpc/index.rst            |   1 +
 Documentation/arch/powerpc/kvm-nested.rst       | 634 +++++++++++++
 arch/powerpc/Kconfig                            |   1 +
 arch/powerpc/Kconfig.debug                      |  14 +
 arch/powerpc/boot/install.sh                    |  16 +-
 arch/powerpc/configs/44x/sam440ep_defconfig     |   1 -
 arch/powerpc/configs/debug.config               |   4 +
 arch/powerpc/configs/g5_defconfig               |   4 -
 arch/powerpc/configs/pmac32_defconfig           |   2 +-
 arch/powerpc/configs/ppc64e_defconfig           |   4 -
 arch/powerpc/configs/ppc6xx_defconfig           |   5 -
 arch/powerpc/include/asm/book3s/32/pgtable.h    |  83 +-
 arch/powerpc/include/asm/book3s/32/tlbflush.h   |   2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h    |  37 +-
 arch/powerpc/include/asm/book3s/pgtable.h       |  33 -
 arch/powerpc/include/asm/code-patching.h        |   1 +
 arch/powerpc/include/asm/cpm1.h                 |   5 -
 arch/powerpc/include/asm/cpm2.h                 |   4 -
 arch/powerpc/include/asm/fixmap.h               |  16 +-
 arch/powerpc/include/asm/guest-state-buffer.h   | 995 ++++++++++++++++++++
 arch/powerpc/include/asm/hvcall.h               |  30 +
 arch/powerpc/include/asm/imc-pmu.h              |  16 +-
 arch/powerpc/include/asm/io.h                   |   2 +-
 arch/powerpc/include/asm/kexec.h                |   8 +-
 arch/powerpc/include/asm/kvm_book3s.h           | 220 ++++-
 arch/powerpc/include/asm/kvm_book3s_64.h        |   8 +-
 arch/powerpc/include/asm/kvm_booke.h            |  10 +
 arch/powerpc/include/asm/kvm_host.h             |  22 +-
 arch/powerpc/include/asm/kvm_ppc.h              | 110 ++-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h    |   1 -
 arch/powerpc/include/asm/nohash/32/pgtable.h    | 201 +---
 arch/powerpc/include/asm/nohash/32/pte-40x.h    |  21 +-
 arch/powerpc/include/asm/nohash/32/pte-44x.h    |  20 +-
 arch/powerpc/include/asm/nohash/32/pte-85xx.h   |  20 +-
 arch/powerpc/include/asm/nohash/32/pte-8xx.h    |  92 +-
 arch/powerpc/include/asm/nohash/64/pgtable.h    | 120 +--
 arch/powerpc/include/asm/nohash/pgtable.h       | 217 +++--
 arch/powerpc/include/asm/nohash/pte-e500.h      |  41 +-
 arch/powerpc/include/asm/opal.h                 |   2 +-
 arch/powerpc/include/asm/paravirt.h             |  47 +-
 arch/powerpc/include/asm/pgtable-masks.h        |  32 +
 arch/powerpc/include/asm/pgtable.h              |  35 +
 arch/powerpc/include/asm/plpar_wrappers.h       | 267 +++++-
 arch/powerpc/include/asm/ptrace.h               |  17 +
 arch/powerpc/include/asm/uaccess.h              |   2 +-
 arch/powerpc/kernel/btext.c                     | 360 +------
 arch/powerpc/kernel/crash_dump.c                |  12 +
 arch/powerpc/kernel/eeh_driver.c                |   4 +-
 arch/powerpc/kernel/head_40x.S                  |  19 +-
 arch/powerpc/kernel/head_44x.S                  |  40 +-
 arch/powerpc/kernel/head_85xx.S                 |  12 +-
 arch/powerpc/kernel/head_book3s_32.S            |  63 +-
 arch/powerpc/kernel/io.c                        |  12 +-
 arch/powerpc/kernel/iommu.c                     |   8 +-
 arch/powerpc/kernel/process.c                   |  26 +-
 arch/powerpc/kernel/prom_init.c                 |   2 +-
 arch/powerpc/kernel/ptrace/ptrace.c             |   5 +-
 arch/powerpc/kernel/setup_64.c                  |   2 +-
 arch/powerpc/kernel/signal.c                    |   5 +-
 arch/powerpc/kernel/signal.h                    |   7 +-
 arch/powerpc/kernel/traps.c                     |   6 +-
 arch/powerpc/kexec/core.c                       |   3 +
 arch/powerpc/kexec/core_64.c                    |   4 +-
 arch/powerpc/kexec/file_load_64.c               |  14 +-
 arch/powerpc/kvm/Makefile                       |   4 +
 arch/powerpc/kvm/book3s.c                       |  38 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c             |   7 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c          |  31 +-
 arch/powerpc/kvm/book3s_64_vio.c                |  12 +-
 arch/powerpc/kvm/book3s_hv.c                    | 358 ++++---
 arch/powerpc/kvm/book3s_hv.h                    |  76 ++
 arch/powerpc/kvm/book3s_hv_builtin.c            |  11 +-
 arch/powerpc/kvm/book3s_hv_nested.c             |  44 +-
 arch/powerpc/kvm/book3s_hv_nestedv2.c           | 994 +++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_p9_entry.c           |   4 +-
 arch/powerpc/kvm/book3s_hv_ras.c                |   4 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c             |   8 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c            |   4 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c              |   2 +-
 arch/powerpc/kvm/book3s_xive.c                  |  12 +-
 arch/powerpc/kvm/book3s_xive_native.c           |   2 +-
 arch/powerpc/kvm/emulate_loadstore.c            |   6 +-
 arch/powerpc/kvm/guest-state-buffer.c           | 621 ++++++++++++
 arch/powerpc/kvm/powerpc.c                      |  76 +-
 arch/powerpc/kvm/test-guest-state-buffer.c      | 328 +++++++
 arch/powerpc/lib/code-patching.c                | 146 ++-
 arch/powerpc/lib/qspinlock.c                    | 122 +--
 arch/powerpc/mm/book3s32/hash_low.S             |  32 +-
 arch/powerpc/mm/book3s32/mmu.c                  |   6 +-
 arch/powerpc/mm/book3s64/pgtable.c              |  10 +-
 arch/powerpc/mm/drmem.c                         |   2 +-
 arch/powerpc/mm/fault.c                         |   9 +-
 arch/powerpc/mm/init_32.c                       |   1 +
 arch/powerpc/mm/ioremap.c                       |   6 +-
 arch/powerpc/mm/mem.c                           |   1 +
 arch/powerpc/mm/nohash/40x.c                    |  19 +-
 arch/powerpc/mm/nohash/8xx.c                    |   2 +
 arch/powerpc/mm/nohash/book3e_pgtable.c         |   2 +-
 arch/powerpc/mm/nohash/e500.c                   |   6 +-
 arch/powerpc/mm/nohash/e500_hugetlbpage.c       |   3 +-
 arch/powerpc/mm/pgtable.c                       |  26 +-
 arch/powerpc/mm/ptdump/8xx.c                    |   5 -
 arch/powerpc/mm/ptdump/shared.c                 |  14 +-
 arch/powerpc/net/bpf_jit.h                      |  18 +-
 arch/powerpc/net/bpf_jit_comp.c                 | 149 ++-
 arch/powerpc/net/bpf_jit_comp32.c               |  15 +-
 arch/powerpc/net/bpf_jit_comp64.c               |  10 +-
 arch/powerpc/perf/core-book3s.c                 |   5 +-
 arch/powerpc/perf/hv-24x7.c                     |   2 +-
 arch/powerpc/perf/imc-pmu.c                     |  13 +-
 arch/powerpc/perf/power6-pmu.c                  |  46 +-
 arch/powerpc/platforms/4xx/soc.c                |   2 +-
 arch/powerpc/platforms/83xx/misc.c              |   2 +
 arch/powerpc/platforms/8xx/cpm1.c               |   1 +
 arch/powerpc/platforms/book3s/vas-api.c         |  34 +-
 arch/powerpc/platforms/powermac/Kconfig         |   1 +
 arch/powerpc/platforms/powermac/feature.c       |   3 +-
 arch/powerpc/platforms/powermac/low_i2c.c       |   4 +-
 arch/powerpc/platforms/powermac/smp.c           |   4 +-
 arch/powerpc/platforms/powernv/opal-fadump.h    |   2 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c |   3 +-
 arch/powerpc/platforms/pseries/iommu.c          |   8 +-
 arch/powerpc/platforms/pseries/lpar.c           |  12 +-
 arch/powerpc/platforms/pseries/plpks.c          |   4 +-
 arch/powerpc/platforms/pseries/vas.c            |   4 +-
 arch/powerpc/sysdev/fsl_msi.c                   |  10 +-
 arch/powerpc/sysdev/mpic.c                      |   2 +-
 arch/powerpc/sysdev/xive/native.c               |   2 +-
 arch/powerpc/tools/gcc-check-mprofile-kernel.sh |  11 +-
 drivers/macintosh/macio-adb.c                   |   1 +
 drivers/soc/fsl/qe/qe_common.c                  |   4 +-
 include/linux/crash_dump.h                      |   8 +-
 lib/fonts/Kconfig                               |   2 +-
 133 files changed, 5788 insertions(+), 1675 deletions(-)
 create mode 100644 Documentation/arch/powerpc/kvm-nested.rst
 create mode 100644 arch/powerpc/include/asm/guest-state-buffer.h
 create mode 100644 arch/powerpc/include/asm/pgtable-masks.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_nestedv2.c
 create mode 100644 arch/powerpc/kvm/guest-state-buffer.c
 create mode 100644 arch/powerpc/kvm/test-guest-state-buffer.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmVEhrwACgkQUevqPMjh
pYD5KxAAnpC38GWKIx4JDjiRfptiCT61/H+Ezs4au/wyr4JzH57kwQrYAbbsb+w6
1pDnXeLURUCuXPu6fyMmcSziTGeMKnC3LaEp6jbl9nCFp6+12Vwn0pn0fk6VuKTs
yMxz+85S8Ehzg/ym89VLRvLmaj5q3Ycgp0i6U/cXbblMmO0HIqHmiJYgBtNk35I1
RTJIEE14zRzJansGZ3FkMDvHlmr1XFyggid/Z9nh+dvhkSHygfImrpNrO+JB6wlu
fTj+1cM+udOFFs7fY3zbFvv/oZ57K321or3RMDsiqiWcUG3IqFFNXdw0Vdigy6Rl
Zu7Di8vE3GQZJe91mUR/SZJq1avPWftoOWFaNWkyFnbaRM/D2LWdr5VPXagx8IjP
qgXvA4xHeosa7s6YcLPVrO3DbW/UHIhpmONGoeAxx/OD+TSXqZckdOthyaCjfHHA
9lDVWGWrzh8op5gTIHaI39lZbwMAq5yherZ1thIj264yKQN83sS4K5XQL62MsE1Q
P7d3h1vRt4ajUOjmTYvESTRM4rx5MKuKBIk47MGvtsbrkyTZQCQIFrbwNXhbz9Dp
OmfpBEXtui9kmmWR9agdkNcCMDd3bYbUr4qEQULmqLat4TgPlZA5MVf5o+fcMCPu
89jyJTck6slAxtqsso9MjbJv+6eR66Y3+cg7mayZMNQhwx7jhzU=
=L+Ar
-----END PGP SIGNATURE-----
