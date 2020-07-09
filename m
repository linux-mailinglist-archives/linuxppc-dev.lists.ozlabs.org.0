Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACABC219761
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 06:29:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2NVM4B9jzDqGk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 14:29:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Mt645MFzDsRH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 14:01:18 +1000 (AEST)
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com
 [68.65.122.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 6C36C80080
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 00:01:14 -0400 (EDT)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 5366960038;
 Thu,  9 Jul 2020 00:01:08 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.216])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id C4E4760033;
 Thu,  9 Jul 2020 04:01:07 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] Use per-CPU temporary mappings for patching
Date: Wed,  8 Jul 2020 23:03:11 -0500
Message-Id: <20200709040316.12789-1-cmr@informatik.wtf>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: kernel-hardening@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When compiled with CONFIG_STRICT_KERNEL_RWX, the kernel must create
temporary mappings when patching itself. These mappings temporarily
override the strict RWX text protections to permit a write. Currently,
powerpc allocates a per-CPU VM area for patching. Patching occurs as
follows:

	1. Map page of text to be patched to per-CPU VM area w/
	   PAGE_KERNEL protection
	2. Patch text
	3. Remove the temporary mapping

While the VM area is per-CPU, the mapping is actually inserted into the
kernel page tables. Presumably, this could allow another CPU to access
the normally write-protected text - either malicously or accidentally -
via this same mapping if the address of the VM area is known. Ideally,
the mapping should be kept local to the CPU doing the patching (or any
other sensitive operations requiring temporarily overriding memory
protections) [0].

x86 introduced "temporary mm" structs which allow the creation of
mappings local to a particular CPU [1]. This series intends to bring the
notion of a temporary mm to powerpc and harden powerpc by using such a
mapping for patching a kernel with strict RWX permissions.

The first patch introduces the temporary mm struct and API for powerpc
along with a new function to retrieve a current hw breakpoint.

The second patch uses the `poking_init` init hook added by the x86
patches to initialize a temporary mm and patching address. The patching
address is randomized between 0 and DEFAULT_MAP_WINDOW-PAGE_SIZE. The
upper limit is necessary due to how the hash MMU operates - by default
the space above DEFAULT_MAP_WINDOW is not available. For now, both hash
and radix randomize inside this range. The number of possible random
addresses is dependent on PAGE_SIZE and limited by DEFAULT_MAP_WINDOW.

Bits of entropy with 64K page size on BOOK3S_64:

	bits of entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)

	PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
	bits of entropy = log2(128TB / 64K)
	bits of entropy = 31

Randomization occurs only once during initialization at boot.

The third patch replaces the VM area with the temporary mm in the
patching code. The page for patching has to be mapped PAGE_SHARED with
the hash MMU since hash prevents the kernel from accessing userspace
pages with PAGE_PRIVILEGED bit set. On the radix MMU the page is mapped with
PAGE_KERNEL which has the added benefit that we can skip KUAP. 

The fourth and fifth patches implement an LKDTM test "proof-of-concept" which
exploits the previous vulnerability (ie. the mapping during patching is exposed
in kernel page tables and accessible by other CPUS). The LKDTM test is somewhat
"rough" in that it uses a brute-force approach - I am open to any suggestions
and/or ideas to improve this. Currently, the LKDTM test passes with this series
on POWER8 (hash) and POWER9 (radix, hash) and fails without this series (ie.
the temporary mapping for patching is exposed to CPUs other than the patching
CPU).

The test can be applied to a tree without this new series by applying
the last two patches of this series, and then fixing up in
/arch/powerpc/lib/code-patching.c:

 #ifdef CONFIG_STRICT_KERNEL_RWX
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);

+#ifdef CONFIG_LKDTM
+unsigned long read_cpu_patching_addr(unsigned int cpu)
+{
+       return (unsigned long)(per_cpu(text_poke_area, cpu))->addr;
+}
+#endif
+
 static int text_area_cpu_up(unsigned int cpu)
 {
        struct vm_struct *area;

I also have a tree with just linuxppc/next and the LKDTM test here:
https://github.com/cmr-informatik/linux/commits/percpu-lkdtm-only

Tested on Blackbird (8-core POWER9) w/ Hash (`disable_radix`) and Radix
MMUs.

v2:	* Rebase on linuxppc/next:
	  commit 105fb38124a4 ("powerpc/8xx: Modify ptep_get()")
	* Always dirty pte when mapping patch
	* Use `ppc_inst_len` instead of `sizeof` on instructions
	* Declare LKDTM patching addr accessor in header where it
	  belongs	

v1:	* Rebase on linuxppc/next (4336b9337824)
	* Save and restore second hw watchpoint
	* Use new ppc_inst_* functions for patching check and in LKDTM
	  test

rfc-v2:	* Many fixes and improvements mostly based on extensive feedback and
          testing by Christophe Leroy (thanks!).
	* Make patching_mm and patching_addr static and mode '__ro_after_init'
	  to after the variable name (more common in other parts of the kernel)
	* Use 'asm/debug.h' header instead of 'asm/hw_breakpoint.h' to fix
	  PPC64e compile
	* Add comment explaining why we use BUG_ON() during the init call to
	  setup for patching later
	* Move ptep into patch_mapping to avoid walking page tables a second
	  time when unmapping the temporary mapping
	* Use KUAP under non-radix, also manually dirty the PTE for patch
	  mapping on non-BOOK3S_64 platforms
	* Properly return any error from __patch_instruction
	* Do not use 'memcmp' where a simple comparison is appropriate
	* Simplify expression for patch address by removing pointer maths
	* Add LKDTM test


[0]: https://github.com/linuxppc/issues/issues/224
[1]: https://lore.kernel.org/kernel-hardening/20190426232303.28381-1-nadav.amit@gmail.com/

Christopher M. Riedl (5):
  powerpc/mm: Introduce temporary mm
  powerpc/lib: Initialize a temporary mm for code patching
  powerpc/lib: Use a temporary mm for code patching
  powerpc/lib: Add LKDTM accessor for patching addr
  powerpc: Add LKDTM test to hijack a patch mapping

 arch/powerpc/include/asm/code-patching.h |   4 +
 arch/powerpc/include/asm/debug.h         |   1 +
 arch/powerpc/include/asm/mmu_context.h   |  64 +++++++++
 arch/powerpc/kernel/process.c            |   5 +
 arch/powerpc/lib/code-patching.c         | 176 +++++++++++------------
 drivers/misc/lkdtm/core.c                |   1 +
 drivers/misc/lkdtm/lkdtm.h               |   1 +
 drivers/misc/lkdtm/perms.c               |  99 +++++++++++++
 8 files changed, 261 insertions(+), 90 deletions(-)

-- 
2.27.0

