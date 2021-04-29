Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E8A36E60A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 09:32:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW6fN67qcz3c7m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 17:32:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=2001:67c:2050:1::465:209;
 helo=mout-y-209.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org
 [IPv6:2001:67c:2050:1::465:209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW6cZ50mGz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 17:31:09 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4FW6PJ0HC6zQjPj;
 Thu, 29 Apr 2021 09:21:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id rGefw_lcfphY; Thu, 29 Apr 2021 09:21:20 +0200 (CEST)
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 00/11] Use per-CPU temporary mappings for patching
Date: Thu, 29 Apr 2021 02:20:46 -0500
Message-Id: <20210429072057.8870-1-cmr@bluescreens.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -1.58 / 15.00 / 15.00
X-Rspamd-Queue-Id: 9CC1D1810
X-Rspamd-UID: 7651b5
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When compiled with CONFIG_STRICT_KERNEL_RWX, the kernel must create
temporary mappings when patching itself. These mappings temporarily
override the strict RWX text protections to permit a write. Currently,
powerpc allocates a per-CPU VM area for patching. Patching occurs as
follows:

	1. Map page in per-CPU VM area w/ PAGE_KERNEL protection
	2. Patch text
	3. Remove the temporary mapping

While the VM area is per-CPU, the mapping is actually inserted into the
kernel page tables. Presumably, this could allow another CPU to access
the normally write-protected text - either malicously or accidentally -
via this same mapping if the address of the VM area is known. Ideally,
the mapping should be kept local to the CPU doing the patching [0].

x86 introduced "temporary mm" structs which allow the creation of
mappings local to a particular CPU [1]. This series intends to bring the
notion of a temporary mm to powerpc and harden powerpc by using such a
mapping for patching a kernel with strict RWX permissions.

The first four patches implement an LKDTM test "proof-of-concept" which
exploits the potential vulnerability (ie. the temporary mapping during
patching is exposed in the kernel page tables and accessible by other
CPUs) using a simple brute-force approach. This test is implemented for
both powerpc and x86_64. The test passes on powerpc with this new
series, fails on upstream powerpc, passes on upstream x86_64, and fails
on an older (ancient) x86_64 tree without the x86_64 temporary mm
patches. The remaining patches add support for and use a temporary mm
for code patching on powerpc.

Tested boot, ftrace, and repeated LKDTM "hijack":
	- QEMU+KVM (host: POWER9 Blackbird): Radix MMU w/ KUAP
	- QEMU+KVM (host: POWER9 Blackbird): Hash MMU w/o KUAP
	- QEMU+KVM (host: POWER9 Blackbird): Hash MMU w/ KUAP

Tested repeated LKDTM "hijack":
	- QEMU+KVM (host: AMD desktop): x86_64 upstream
	- QEMU+KVM (host: AMD desktop): x86_64 w/o percpu temp mm to
	  verify the LKDTM "hijack" fails

Tested boot and ftrace:
	- QEMU+TCG: ppc44x (bamboo)
	- QEMU+TCG: g5 (mac99)

I also tested with various extra config options enabled as suggested in
section 12) in Documentation/process/submit-checklist.rst.

v4:	* It's time to revisit this series again since @jpn and @mpe fixed
	  our known STRICT_*_RWX bugs on powerpc/64s.
	* Rebase on linuxppc/next:
          commit ee1bc694fbaec ("powerpc/kvm: Fix build error when PPC_MEM_KEYS/PPC_PSERIES=n")
	* Completely rework how map_patch() works on book3s64 Hash MMU
	* Split the LKDTM x86_64 and powerpc bits into separate patches
	* Annotate commit messages with changes from v3 instead of
	  listing them here completely out-of context...

v3:	* Rebase on linuxppc/next: commit 9123e3a74ec7 ("Linux 5.9-rc1")
	* Move temporary mm implementation into code-patching.c where it
	  belongs
	* Implement LKDTM hijacker test on x86_64 (on IBM time oof) Do
	* not use address zero for the patching address in the
	  temporary mm (thanks @dja for pointing this out!)
	* Wrap the LKDTM test w/ CONFIG_SMP as suggested by Christophe
	  Leroy
	* Comments to clarify PTE pre-allocation and patching addr
	  selection

v2:	* Rebase on linuxppc/next:
	  commit 105fb38124a4 ("powerpc/8xx: Modify ptep_get()")
	* Always dirty pte when mapping patch
	* Use `ppc_inst_len` instead of `sizeof` on instructions
	* Declare LKDTM patching addr accessor in header where it belongs	

v1:	* Rebase on linuxppc/next (4336b9337824)
	* Save and restore second hw watchpoint
	* Use new ppc_inst_* functions for patching check and in LKDTM test

rfc-v2:	* Many fixes and improvements mostly based on extensive feedback
          and testing by Christophe Leroy (thanks!).
	* Make patching_mm and patching_addr static and move
	  '__ro_after_init' to after the variable name (more common in
	  other parts of the kernel)
	* Use 'asm/debug.h' header instead of 'asm/hw_breakpoint.h' to
	  fix PPC64e compile
	* Add comment explaining why we use BUG_ON() during the init
	  call to setup for patching later
	* Move ptep into patch_mapping to avoid walking page tables a
	  second time when unmapping the temporary mapping
	* Use KUAP under non-radix, also manually dirty the PTE for patch
	  mapping on non-BOOK3S_64 platforms
	* Properly return any error from __patch_instruction
        * Do not use 'memcmp' where a simple comparison is appropriate
	* Simplify expression for patch address by removing pointer maths
	* Add LKDTM test

[0]: https://github.com/linuxppc/issues/issues/224
[1]: https://lore.kernel.org/kernel-hardening/20190426232303.28381-1-nadav.amit@gmail.com/

Christopher M. Riedl (11):
  powerpc: Add LKDTM accessor for patching addr
  lkdtm/powerpc: Add test to hijack a patch mapping
  x86_64: Add LKDTM accessor for patching addr
  lkdtm/x86_64: Add test to hijack a patch mapping
  powerpc/64s: Add ability to skip SLB preload
  powerpc: Introduce temporary mm
  powerpc/64s: Make slb_allocate_user() non-static
  powerpc: Initialize and use a temporary mm for patching
  lkdtm/powerpc: Fix code patching hijack test
  powerpc: Protect patching_mm with a lock
  powerpc: Use patch_instruction_unlocked() in loops

 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
 arch/powerpc/include/asm/book3s/64/mmu.h      |   3 +
 arch/powerpc/include/asm/code-patching.h      |   8 +
 arch/powerpc/include/asm/debug.h              |   1 +
 arch/powerpc/include/asm/mmu_context.h        |  13 +
 arch/powerpc/kernel/epapr_paravirt.c          |   9 +-
 arch/powerpc/kernel/optprobes.c               |  22 +-
 arch/powerpc/kernel/process.c                 |   5 +
 arch/powerpc/lib/code-patching.c              | 348 +++++++++++++-----
 arch/powerpc/lib/feature-fixups.c             | 114 ++++--
 arch/powerpc/mm/book3s64/mmu_context.c        |   2 +
 arch/powerpc/mm/book3s64/slb.c                |  60 +--
 arch/powerpc/xmon/xmon.c                      |  22 +-
 arch/x86/include/asm/text-patching.h          |   4 +
 arch/x86/kernel/alternative.c                 |   7 +
 drivers/misc/lkdtm/core.c                     |   1 +
 drivers/misc/lkdtm/lkdtm.h                    |   1 +
 drivers/misc/lkdtm/perms.c                    | 149 ++++++++
 18 files changed, 608 insertions(+), 162 deletions(-)

-- 
2.26.1

