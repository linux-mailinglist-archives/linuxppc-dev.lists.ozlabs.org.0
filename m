Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id F0BD18D19BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 13:36:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpVh85Zxsz7BQ9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 21:31:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpVgm1G9mz7BDS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 21:30:43 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDA14339;
	Tue, 28 May 2024 04:30:36 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C08213F762;
	Tue, 28 May 2024 04:30:09 -0700 (PDT)
Date: Tue, 28 May 2024 12:30:07 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 00/29] arm64: Permission Overlay Extension
Message-ID: <20240528113007.GB1072039@e124191.cambridge.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503130147.1154804-1-joey.gouly@arm.com>
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 03, 2024 at 02:01:18PM +0100, Joey Gouly wrote:
> Hi all,
> 
> This series implements the Permission Overlay Extension introduced in 2022
> VMSA enhancements [1]. It is based on v6.9-rc5.
> 
> One possible issue with this version, I took the last bit of HWCAP2.
> 
> Changes since v3[2]:
> 	- Moved Kconfig to nearer the end of the series
> 	- Reworked MMU Fault path, to check for POE faults earlier, under the mm lock
> 	- Rework VM_FLAGS to use Kconfig option
> 	- Don't check POR_EL0 in MTE sync tags function
> 	- Reworked KVM to fit into VNCR/VM configuration changes
> 	- Use new AT instruction in KVM
> 	- Rebase onto v6.9-rc5
> 
> The Permission Overlay Extension allows to constrain permissions on memory
> regions. This can be used from userspace (EL0) without a system call or TLB
> invalidation.
> 
> POE is used to implement the Memory Protection Keys [3] Linux syscall.
> 
> The first few patches add the basic framework, then the PKEYS interface is
> implemented, and then the selftests are made to work on arm64.
> 
> I have tested the modified protection_keys test on x86_64, but not PPC.
> I haven't build tested the x86/ppc arch changes.
> 
> Thanks,
> Joey

I found a silly off by one error, so I will be sending a v5 at some point.

> 
> Joey Gouly (29):
>   powerpc/mm: add ARCH_PKEY_BITS to Kconfig
>   x86/mm: add ARCH_PKEY_BITS to Kconfig
>   mm: use ARCH_PKEY_BITS to define VM_PKEY_BITN
>   arm64: disable trapping of POR_EL0 to EL2
>   arm64: cpufeature: add Permission Overlay Extension cpucap
>   arm64: context switch POR_EL0 register
>   KVM: arm64: Save/restore POE registers
>   KVM: arm64: make kvm_at() take an OP_AT_*
>   KVM: arm64: use `at s1e1a` for POE
>   arm64: enable the Permission Overlay Extension for EL0
>   arm64: re-order MTE VM_ flags
>   arm64: add POIndex defines
>   arm64: convert protection key into vm_flags and pgprot values
>   arm64: mask out POIndex when modifying a PTE
>   arm64: handle PKEY/POE faults
>   arm64: add pte_access_permitted_no_overlay()
>   arm64: implement PKEYS support
>   arm64: add POE signal support
>   arm64: enable PKEY support for CPUs with S1POE
>   arm64: enable POE and PIE to coexist
>   arm64/ptrace: add support for FEAT_POE
>   arm64: add Permission Overlay Extension Kconfig
>   kselftest/arm64: move get_header()
>   selftests: mm: move fpregs printing
>   selftests: mm: make protection_keys test work on arm64
>   kselftest/arm64: add HWCAP test for FEAT_S1POE
>   kselftest/arm64: parse POE_MAGIC in a signal frame
>   kselftest/arm64: Add test case for POR_EL0 signal frame records
>   KVM: selftests: get-reg-list: add Permission Overlay registers
> 
>  Documentation/arch/arm64/elf_hwcaps.rst       |   2 +
>  arch/arm64/Kconfig                            |  22 +++
>  arch/arm64/include/asm/cpufeature.h           |   6 +
>  arch/arm64/include/asm/el2_setup.h            |  10 +-
>  arch/arm64/include/asm/hwcap.h                |   1 +
>  arch/arm64/include/asm/kvm_asm.h              |   3 +-
>  arch/arm64/include/asm/kvm_host.h             |   4 +
>  arch/arm64/include/asm/mman.h                 |   8 +-
>  arch/arm64/include/asm/mmu.h                  |   1 +
>  arch/arm64/include/asm/mmu_context.h          |  51 ++++++-
>  arch/arm64/include/asm/pgtable-hwdef.h        |  10 ++
>  arch/arm64/include/asm/pgtable-prot.h         |   8 +-
>  arch/arm64/include/asm/pgtable.h              |  34 ++++-
>  arch/arm64/include/asm/pkeys.h                | 110 ++++++++++++++
>  arch/arm64/include/asm/por.h                  |  33 +++++
>  arch/arm64/include/asm/processor.h            |   1 +
>  arch/arm64/include/asm/sysreg.h               |   3 +
>  arch/arm64/include/asm/traps.h                |   1 +
>  arch/arm64/include/asm/vncr_mapping.h         |   1 +
>  arch/arm64/include/uapi/asm/hwcap.h           |   1 +
>  arch/arm64/include/uapi/asm/sigcontext.h      |   7 +
>  arch/arm64/kernel/cpufeature.c                |  23 +++
>  arch/arm64/kernel/cpuinfo.c                   |   1 +
>  arch/arm64/kernel/process.c                   |  28 ++++
>  arch/arm64/kernel/ptrace.c                    |  46 ++++++
>  arch/arm64/kernel/signal.c                    |  52 +++++++
>  arch/arm64/kernel/traps.c                     |  12 +-
>  arch/arm64/kvm/hyp/include/hyp/fault.h        |   5 +-
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h    |  29 ++++
>  arch/arm64/kvm/sys_regs.c                     |   8 +-
>  arch/arm64/mm/fault.c                         |  56 ++++++-
>  arch/arm64/mm/mmap.c                          |   9 ++
>  arch/arm64/mm/mmu.c                           |  40 +++++
>  arch/arm64/tools/cpucaps                      |   1 +
>  arch/powerpc/Kconfig                          |   4 +
>  arch/x86/Kconfig                              |   4 +
>  fs/proc/task_mmu.c                            |   2 +
>  include/linux/mm.h                            |  20 ++-
>  include/uapi/linux/elf.h                      |   1 +
>  tools/testing/selftests/arm64/abi/hwcap.c     |  14 ++
>  .../testing/selftests/arm64/signal/.gitignore |   1 +
>  .../arm64/signal/testcases/poe_siginfo.c      |  86 +++++++++++
>  .../arm64/signal/testcases/testcases.c        |  27 +---
>  .../arm64/signal/testcases/testcases.h        |  28 +++-
>  .../selftests/kvm/aarch64/get-reg-list.c      |  14 ++
>  tools/testing/selftests/mm/Makefile           |   2 +-
>  tools/testing/selftests/mm/pkey-arm64.h       | 139 ++++++++++++++++++
>  tools/testing/selftests/mm/pkey-helpers.h     |   8 +
>  tools/testing/selftests/mm/pkey-powerpc.h     |   3 +
>  tools/testing/selftests/mm/pkey-x86.h         |   4 +
>  tools/testing/selftests/mm/protection_keys.c  | 109 ++++++++++++--
>  51 files changed, 1027 insertions(+), 66 deletions(-)
>  create mode 100644 arch/arm64/include/asm/pkeys.h
>  create mode 100644 arch/arm64/include/asm/por.h
>  create mode 100644 tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c
>  create mode 100644 tools/testing/selftests/mm/pkey-arm64.h
> 
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
