Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 865DC555082
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 17:58:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSp2D2qmQz3f3H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 01:58:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSnw51Fjfz3br0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 01:52:53 +1000 (AEST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LSnvD2wrwzDqqv;
	Wed, 22 Jun 2022 23:52:08 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:41 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:41 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
Subject: [PATCH v5 00/33] objtool: add base support for arm64
Date: Wed, 22 Jun 2022 23:48:47 +0800
Message-ID: <20220622154920.95075-1-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
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
Cc: mark.rutland@arm.com, madvenka@linux.microsoft.com, michal.lkml@markovi.net, pasha.tatashin@soleen.com, peterz@infradead.org, catalin.marinas@arm.com, masahiroy@kernel.org, ndesaulniers@google.com, chenzhongjin@huawei.com, rmk+kernel@armlinux.org.uk, broonie@kernel.org, will@kernel.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series enables objtool to start doing stack validation and orc
generation on arm64 kernel builds.

Based on Julien's previous work(1)(2), Now I have finished most of work
for objtool enable on arm64. This series includes objtool part [1-13]
and arm64 support part [14-33], the second part is to make objtool run
correctly with no warning on arm64 so if necessary it can be taken apart
as two series.

ORC generation feature is implemented but not used because we don't have
an unwinder_orc on arm64, now it only be used to check whether objtool
has correct validation.

This series depends on (https://lkml.org/lkml/2022/6/22/463)
I moved some changes which work for all architectures to that series
because this one becomes too big now.
And it is rebased to tip/objtool/core branch.

I think the series is complete enough so I removed the RFC.
However now there are still (maybe only) two unsolved problems:

1. the switch optimization and dynamic jump
Although this problem has been troubling us for a long time and
temporarily resolved by -no-jump-table. Hopefully we have chance
to fix it. I'm trying for that and it will be updated in next version.

2. alternative_cb
alternative_cb in arm64 is an dynamic patch mechanism on arm64 which is
similiar to alternative instruction but doesn't give instructions explicitly.
It cause trouble when there is a jump instructions inside it and causes some
branch that objtool can't reach.
I have solved some of them by adding UNWIND_HINT one macro
"mitigate_spectre_bhb_loop" can't be fixed because it is used in
different assembly files.

(1) https://lkml.org/lkml/2021/3/3/1135
(2) https://github.com/julien-thierry/linux.git
---
v5 Changes:
Compare to last RFC v4 series, this series does a lot of changes, including
code rebase, refactoring and solution for several warning in last series.
After refactoring and moving some patches out, the number of lines in this
series decrease a thousand.

Here are changes for each patch.

[1] Removed unnecessary part from insn.h and insn.c to avoid extra
dependencies and wired hack. So the patch to add head files also be removed.

[2] Rebase Makefile, clear sync-check for insn.h/c and add arm64 elf
relocation types in elf.h.
Remove other callee saved registers tracking except FP and LR. Beacause
in arm64 there are lots of branches store these CSRs in different order
or positions, tracking them will cause some false stack state mismatch
warnings.

[3-6] Refactor code. Add some macros to make code more clean.
For instructions load/store on stack, Simplifies the logic of moving SP
and accessing data because the order of ops makes no differences.

[7-8] Remove delete in record_invalid_insn because now we don't need to
handle special undecoded instructions.

[13] New patch to enable ORC generation.

[12, 14, 17] Rebase to current branch.

[19-21] Add annotations for trans_pgd-asm.S and some unreachable
branches.

[29] Moves kuser32.S and sigreturn32.S to rodata because they are VDSO.

[31] Remove ignores for hibernate.c.

[33] New patch to fix a fallthrough problem.

---
v4 Changes:
- fix EX_ENTRY_SIZE from 8 to 12.
- modify arm64 for supporting objtool, including annotation,
	asm code modification, ignoring some validation, to make objtool
	be enable to pass arm64 builds.

v3 Changes:
- rebase Julien's version to mainstream and solve conflicts.
- Merge dumplicate "*type = INSN_OTHER".
- When meeting unrecognized instructions such as datas
	in .text code or 0x0 padding insns, last version used
	"loc->ignorable" to mark and remove them from objtool insn list.

	However there are two problems to do so:
	1. when meeting insns can't be decoded or excluded, objtool will
	just stop.
	
	2. deleting every insn can cause problems in fellow procedure.

	So I changed "record_invalid_insn" that we can delete one insn or
	just set it ignored. Now check will throw an error and going on when
	meeting undecodable instructions.

	Also, to prevent the confusion between "loc->ignorable" and
	"insn->ignore" I changed "ignore" to "delete".

v2 Changes:
	- Drop gcc plugin in favor of -fno-jump-tables
	- miscelaneous fixes and cleanups
___
Chen Zhongjin (33):
  tools: arm64: Make aarch64 instruction decoder available to tools
  objtool: arm64: Add base definition for arm64 backend
  objtool: arm64: Decode add/sub instructions
  objtool: arm64: Decode jump and call related instructions
  objtool: arm64: Decode other system instructions
  objtool: arm64: Decode load/store instructions
  objtool: arm64: Decode LDR instructions
  objtool: arm64: Accept non-instruction data in code sections
  objtool: check: Support data in text section
  objtool: arm64: Handle supported relocations in alternatives
  objtool: arm64: Ignore replacement section for alternative callback
  objtool: arm64: Enable stack validation for arm64
  objtool: arm64: Enable ORC for arm64
  objtool: arm64: Add annotate_reachable() for objtools
  arm64: bug: Add reachable annotation to warning macros
  arm64: kgdb: Add reachable annotation after kgdb brk
  objtool: arm64: Add unwind_hint support
  arm64: Change symbol type annotations
  arm64: Annotate unwind_hint for symbols with empty stack
  arm64: entry: Annotate unwind_hint for entry
  arm64: kvm: Annotate unwind_hint for hyp entry
  arm64: efi-header: Mark efi header as data
  arm64: head: Mark constants as data
  arm64: proc: Mark constant as data
  arm64: crypto: Mark constant as data
  arm64: crypto: Remove unnecessary stackframe
  arm64: Set intra-function call annotations
  arm64: sleep: Properly set frame pointer before call
  arm64: compat: Move VDSO code to .rodata section
  arm64: entry: Align stack size for alternative
  arm64: kernel: Skip validation of proton-pack.c
  arm64: irq-gic: Replace unreachable() with -EINVAL
  objtool: revert c_file fallthrough detection for arm64

 arch/arm64/Kconfig                            |   2 +
 arch/arm64/Kconfig.debug                      |  31 ++
 arch/arm64/Makefile                           |   4 +
 arch/arm64/crypto/aes-neonbs-core.S           |  14 +-
 arch/arm64/crypto/crct10dif-ce-core.S         |   5 +
 arch/arm64/crypto/poly1305-armv8.pl           |   4 +
 arch/arm64/crypto/sha512-armv8.pl             |  29 +-
 arch/arm64/include/asm/assembler.h            |   2 +
 arch/arm64/include/asm/bug.h                  |   6 +-
 arch/arm64/include/asm/kgdb.h                 |   1 +
 arch/arm64/include/asm/module.h               |   7 +
 arch/arm64/include/asm/orc_types.h            |  68 +++
 arch/arm64/include/asm/unwind_hints.h         |  26 +
 arch/arm64/kernel/cpu-reset.S                 |   2 +
 arch/arm64/kernel/efi-entry.S                 |   2 +
 arch/arm64/kernel/efi-header.S                |   2 +
 arch/arm64/kernel/entry.S                     |  30 +-
 arch/arm64/kernel/head.S                      |  76 +--
 arch/arm64/kernel/hibernate-asm.S             |   2 +
 arch/arm64/kernel/kuser32.S                   |   1 +
 arch/arm64/kernel/proton-pack.c               |   2 +
 arch/arm64/kernel/relocate_kernel.S           |   2 +
 arch/arm64/kernel/sigreturn32.S               |   1 +
 arch/arm64/kernel/sleep.S                     |   8 +-
 arch/arm64/kernel/vmlinux.lds.S               |   3 +
 arch/arm64/kvm/hyp/entry.S                    |   9 +-
 arch/arm64/kvm/hyp/hyp-entry.S                |   4 +
 arch/arm64/kvm/hyp/vgic-v3-sr.c               |   7 +-
 arch/arm64/mm/proc.S                          |   4 +-
 arch/arm64/mm/trans_pgd-asm.S                 |   3 +
 drivers/irqchip/irq-gic-v3.c                  |   2 +-
 include/linux/compiler.h                      |   9 +
 scripts/Makefile                              |   6 +-
 tools/arch/arm64/include/asm/insn.h           | 458 +++++++++++++++++
 tools/arch/arm64/include/asm/orc_types.h      |  68 +++
 tools/arch/arm64/include/asm/unwind_hints.h   |  26 +
 tools/arch/arm64/lib/insn.c                   | 335 +++++++++++++
 tools/objtool/Makefile                        |   5 +
 tools/objtool/arch/arm64/Build                |   9 +
 tools/objtool/arch/arm64/decode.c             | 466 ++++++++++++++++++
 .../arch/arm64/include/arch/cfi_regs.h        |  14 +
 tools/objtool/arch/arm64/include/arch/elf.h   |  12 +
 .../arch/arm64/include/arch/endianness.h      |   9 +
 .../objtool/arch/arm64/include/arch/special.h |  22 +
 tools/objtool/arch/arm64/orc.c                | 117 +++++
 tools/objtool/arch/arm64/special.c            |  36 ++
 tools/objtool/arch/x86/decode.c               |   5 +
 tools/objtool/check.c                         |  22 +-
 tools/objtool/elf.c                           |  14 +
 tools/objtool/include/objtool/arch.h          |   2 +
 tools/objtool/include/objtool/elf.h           |   1 +
 tools/objtool/include/objtool/objtool.h       |   2 +-
 tools/objtool/objtool.c                       |   1 +
 53 files changed, 1925 insertions(+), 73 deletions(-)
 create mode 100644 arch/arm64/include/asm/orc_types.h
 create mode 100644 arch/arm64/include/asm/unwind_hints.h
 create mode 100644 tools/arch/arm64/include/asm/insn.h
 create mode 100644 tools/arch/arm64/include/asm/orc_types.h
 create mode 100644 tools/arch/arm64/include/asm/unwind_hints.h
 create mode 100644 tools/arch/arm64/lib/insn.c
 create mode 100644 tools/objtool/arch/arm64/Build
 create mode 100644 tools/objtool/arch/arm64/decode.c
 create mode 100644 tools/objtool/arch/arm64/include/arch/cfi_regs.h
 create mode 100644 tools/objtool/arch/arm64/include/arch/elf.h
 create mode 100644 tools/objtool/arch/arm64/include/arch/endianness.h
 create mode 100644 tools/objtool/arch/arm64/include/arch/special.h
 create mode 100644 tools/objtool/arch/arm64/orc.c
 create mode 100644 tools/objtool/arch/arm64/special.c

-- 
2.17.1

