Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C124C4074AD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 04:37:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5xjX4vzDz305S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 12:37:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=2001:67c:2050::465:103;
 helo=mout-p-103.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 463 seconds by postgrey-1.36 at boromir;
 Sat, 11 Sep 2021 12:37:14 AEST
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org
 [IPv6:2001:67c:2050::465:103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5xj63m4Cz2xWy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 12:37:14 +1000 (AEST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4H5xWz1xwkzQk2T;
 Sat, 11 Sep 2021 04:29:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 0/4] Use per-CPU temporary mappings for patching on Radix
 MMU
Date: Fri, 10 Sep 2021 21:29:00 -0500
Message-Id: <20210911022904.30962-1-cmr@bluescreens.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2E6A226C
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
Cc: linux-hardening@vger.kernel.org
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

x86 introduced "temporary mm" structs which allow the creation of mappings
local to a particular CPU [1]. This series intends to bring the notion of a
temporary mm to powerpc's Book3s64 Radix MMU and harden it by using such a
mapping for patching a kernel with strict RWX permissions.

Tested boot and ftrace:
	- QEMU+KVM (host: POWER9 Blackbird): Radix MMU w/ KUAP
	- QEMU+KVM (host: POWER9 Blackbird): Hash MMU

Tested boot:
	- QEMU+TCG: ppc44x (bamboo)
	- QEMU+TCG: g5 (mac99)

I also tested with various extra config options enabled as suggested in
section 12) in Documentation/process/submit-checklist.rst.

v6:	* Split series to separate powerpc percpu temporary mm
	  implementation and LKDTM test (still working on this one) and
	  implement some of Christophe Leroy's feedback.
	* Rebase on linuxppc/next: powerpc-5.15-1

v5:	* Only support Book3s64 Radix MMU for now. There are some issues with
	  the previous implementation on the Hash MMU as pointed out by Nick
	  Piggin. Fixing these is not trivial so we only support the Radix MMU
	  for now.

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

Christopher M. Riedl (4):
  powerpc/64s: Introduce temporary mm for Radix MMU
  powerpc: Rework and improve STRICT_KERNEL_RWX patching
  powerpc: Use WARN_ON and fix check in poking_init
  powerpc/64s: Initialize and use a temporary mm for patching on Radix

 arch/powerpc/include/asm/debug.h |   1 +
 arch/powerpc/kernel/process.c    |   5 +
 arch/powerpc/lib/code-patching.c | 215 ++++++++++++++++++++++++++-----
 3 files changed, 191 insertions(+), 30 deletions(-)

-- 
2.32.0

