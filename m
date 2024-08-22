Return-Path: <linuxppc-dev+bounces-361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA43E95B974
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:12:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWM2zhKz2yft;
	Fri, 23 Aug 2024 01:11:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339519;
	cv=none; b=Wadz6O5hGY0nZD0G+3PXY7K08P5BSnVL18sY6ndzNZ7KgN0WEEta9lr4YeYT4ho0Expx8ZwbY3PLp7IWODR+vPdFFdxMXT0gN1Fz5rTshPTx/mXFnO1Vw4aXSJSq3GFjDd99e0Bta+zwDd2wIjOw81LZtWHZsmBt4x7k9tA+TsC3rZ77uSnNaSlWqcCYHzLCGdYM41fX6ToTCFYioXqyzv9d5solAAYLSi1/d2uTRbOtHqn/mP4j1pro/z36GVusKW+Fvos6lL/7h0jmgYT1TMlpa9benseWTcMJ5wvyMTpRRlL74qmU1PlQbOkLQU/B9MeGWV8VXpv564maHUe3Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339519; c=relaxed/relaxed;
	bh=1oMaKLN3AtqVYOoRQKNxswTCUzkgsbT4GtGNXCGcqwc=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding; b=KM6XirxP3ti32IPsSSSAiimI0pMGtBCcP5uagbP3SQcxTO42nHh8Vn/JowHUhfq1pmvpPvAdL/Fq+r3bAsnxH+YDNMATX8WalJA6KO2WFF/2iWIhGa+vWFoj1VpAEtXT/RgD3jdMqwv42ZReedLJz9GJhYErJVKrsEh+HjmI3rEHAl2rEUvW615jc0gKaTgjE0a96OZFS5RIV7D5vQs7hIvvUBsGHixFsbvEZe1yEje++eSR08TocI4KF/JqsfBXi++lQkAaka/RszAQv3tJmyoG364Q8axvx2vhXrUv2n0ZMZ8MWxn4oiuLKlV4rvarLzRS6UiBHuV6LwatReIJyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWL4QfBz2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:11:56 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B47FDA7;
	Thu, 22 Aug 2024 08:11:50 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A0263F58B;
	Thu, 22 Aug 2024 08:11:20 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	maz@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	will@kernel.org,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 00/30] Permission Overlay Extension
Date: Thu, 22 Aug 2024 16:10:43 +0100
Message-Id: <20240822151113.1479789-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series implements the Permission Overlay Extension introduced in 2022
VMSA enhancements [1]. It is based on v6.11-rc4.

Changes since v4[2]:
	- Added Acks and R-bs, thanks!
	- KVM:
		- Move POR_EL{0,1} handling inside TCR_EL2 blocks
		- Add visibility functions for registers [4]
		- Make ID_AA64MMFR3_EL1 writable
	- use system_supports_poe() more consistently
	- use BIT instead of hex constants
	- fix off-by-one in arch_max_pkey() macro
	- add PKEY_DISABLE_EXECUTE and PKEY_DISABLE_READ
	- Update some comments and commit messages.
	- No change to when we save/restore POR_EL0 for signals!

Conflicts with GCS:
	- Uses the same (last) bit in HWCAP2
	- Uses the same VM_HIGH_ARCH_5

Conflicts with arm64 KVM:
	- Maz has taken patch 8 into one of his own series
	- I have taken and modified a patch from Maz (patch 9)

The Permission Overlay Extension allows to constrain permissions on memory
regions. This can be used from userspace (EL0) without a system call or TLB
invalidation.

POE is used to implement the Memory Protection Keys [3] Linux syscall.

The first few patches add the basic framework, then the PKEYS interface is
implemented, and then the selftests are made to work on arm64.

I have tested the modified protection_keys test on x86_64, but not PPC.
I haven't build tested the x86/ppc arch changes.

Thanks,
Joey

[1] https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/arm-a-profile-architecture-2022
[2] https://lore.kernel.org/linux-arm-kernel/20240503130147.1154804-1-joey.gouly@arm.com/
[3] Documentation/core-api/protection-keys.rst
[4] https://lore.kernel.org/linux-arm-kernel/20240806-kvm-arm64-get-reg-list-v2-0-1d3fbc7b6844@kernel.org/

Joey Gouly (30):
  powerpc/mm: add ARCH_PKEY_BITS to Kconfig
  x86/mm: add ARCH_PKEY_BITS to Kconfig
  mm: use ARCH_PKEY_BITS to define VM_PKEY_BITN
  arm64: disable trapping of POR_EL0 to EL2
  arm64: cpufeature: add Permission Overlay Extension cpucap
  arm64: context switch POR_EL0 register
  KVM: arm64: Save/restore POE registers
  KVM: arm64: make kvm_at() take an OP_AT_*
  KVM: arm64: use `at s1e1a` for POE
  KVM: arm64: Sanitise ID_AA64MMFR3_EL1
  arm64: enable the Permission Overlay Extension for EL0
  arm64: re-order MTE VM_ flags
  arm64: add POIndex defines
  arm64: convert protection key into vm_flags and pgprot values
  arm64: mask out POIndex when modifying a PTE
  arm64: handle PKEY/POE faults
  arm64: add pte_access_permitted_no_overlay()
  arm64: implement PKEYS support
  arm64: add POE signal support
  arm64/ptrace: add support for FEAT_POE
  arm64: enable POE and PIE to coexist
  arm64: enable PKEY support for CPUs with S1POE
  arm64: add Permission Overlay Extension Kconfig
  kselftest/arm64: move get_header()
  selftests: mm: move fpregs printing
  selftests: mm: make protection_keys test work on arm64
  kselftest/arm64: add HWCAP test for FEAT_S1POE
  kselftest/arm64: parse POE_MAGIC in a signal frame
  kselftest/arm64: Add test case for POR_EL0 signal frame records
  KVM: selftests: get-reg-list: add Permission Overlay registers

 Documentation/arch/arm64/elf_hwcaps.rst       |   2 +
 arch/arm64/Kconfig                            |  23 +++
 arch/arm64/include/asm/cpufeature.h           |   6 +
 arch/arm64/include/asm/el2_setup.h            |  10 +-
 arch/arm64/include/asm/hwcap.h                |   1 +
 arch/arm64/include/asm/kvm_asm.h              |   3 +-
 arch/arm64/include/asm/kvm_host.h             |   4 +
 arch/arm64/include/asm/mman.h                 |  10 +-
 arch/arm64/include/asm/mmu.h                  |   1 +
 arch/arm64/include/asm/mmu_context.h          |  46 +++++-
 arch/arm64/include/asm/pgtable-hwdef.h        |  10 ++
 arch/arm64/include/asm/pgtable-prot.h         |   8 +-
 arch/arm64/include/asm/pgtable.h              |  34 ++++-
 arch/arm64/include/asm/pkeys.h                | 108 ++++++++++++++
 arch/arm64/include/asm/por.h                  |  33 +++++
 arch/arm64/include/asm/processor.h            |   1 +
 arch/arm64/include/asm/sysreg.h               |   3 +
 arch/arm64/include/asm/traps.h                |   1 +
 arch/arm64/include/asm/vncr_mapping.h         |   1 +
 arch/arm64/include/uapi/asm/hwcap.h           |   1 +
 arch/arm64/include/uapi/asm/mman.h            |   9 ++
 arch/arm64/include/uapi/asm/sigcontext.h      |   7 +
 arch/arm64/kernel/cpufeature.c                |  23 +++
 arch/arm64/kernel/cpuinfo.c                   |   1 +
 arch/arm64/kernel/process.c                   |  28 ++++
 arch/arm64/kernel/ptrace.c                    |  46 ++++++
 arch/arm64/kernel/signal.c                    |  62 ++++++++
 arch/arm64/kernel/traps.c                     |   6 +
 arch/arm64/kvm/hyp/include/hyp/fault.h        |   5 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h    |  27 ++++
 arch/arm64/kvm/sys_regs.c                     |  25 +++-
 arch/arm64/mm/fault.c                         |  55 ++++++-
 arch/arm64/mm/mmap.c                          |  11 ++
 arch/arm64/mm/mmu.c                           |  45 ++++++
 arch/arm64/tools/cpucaps                      |   1 +
 arch/powerpc/Kconfig                          |   4 +
 arch/x86/Kconfig                              |   4 +
 fs/proc/task_mmu.c                            |   2 +
 include/linux/mm.h                            |  20 ++-
 include/uapi/linux/elf.h                      |   1 +
 tools/testing/selftests/arm64/abi/hwcap.c     |  14 ++
 .../testing/selftests/arm64/signal/.gitignore |   1 +
 .../arm64/signal/testcases/poe_siginfo.c      |  86 +++++++++++
 .../arm64/signal/testcases/testcases.c        |  27 +---
 .../arm64/signal/testcases/testcases.h        |  28 +++-
 .../selftests/kvm/aarch64/get-reg-list.c      |  14 ++
 tools/testing/selftests/mm/Makefile           |   2 +-
 tools/testing/selftests/mm/pkey-arm64.h       | 139 ++++++++++++++++++
 tools/testing/selftests/mm/pkey-helpers.h     |   8 +
 tools/testing/selftests/mm/pkey-powerpc.h     |   3 +
 tools/testing/selftests/mm/pkey-x86.h         |   4 +
 tools/testing/selftests/mm/protection_keys.c  | 109 ++++++++++++--
 52 files changed, 1060 insertions(+), 63 deletions(-)
 create mode 100644 arch/arm64/include/asm/pkeys.h
 create mode 100644 arch/arm64/include/asm/por.h
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c
 create mode 100644 tools/testing/selftests/mm/pkey-arm64.h

-- 
2.25.1


