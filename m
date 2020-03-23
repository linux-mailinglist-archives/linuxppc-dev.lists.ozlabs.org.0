Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5290A18EEF4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 06:03:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m2MY3n9zzDqkV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 16:03:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m2GW3rGFzDqcV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 15:58:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48m2GV71Rfz9BRD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 15:58:58 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48m2GV60BVz9sRY; Mon, 23 Mar 2020 15:58:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48m2GT5Bgxz9sRN
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 15:58:57 +1100 (AEDT)
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com
 [198.54.127.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id C2FE7807B8
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 00:51:26 -0400 (EDT)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id 3E8406004A
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 00:51:21 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.230])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id 0966760049
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 04:51:20 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org
Subject: [RFC PATCH 0/3] Use per-CPU temporary mappings for patching
Date: Sun, 22 Mar 2020 23:52:02 -0500
Message-Id: <20200323045205.20314-1-cmr@informatik.wtf>
X-Mailer: git-send-email 2.25.1
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

	bits-o-entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)

	PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
	bits-o-entropy = log2(128TB / 64K)
	bits-o-entropy = 31

Currently, randomization occurs only once during initialization at boot.

The third patch replaces the VM area with the temporary mm in the
patching code. The page for patching has to be mapped PAGE_SHARED with
the hash MMU since hash prevents the kernel from accessing userspace
pages with PAGE_PRIVILEGED bit set. There is on-going work on my side to
explore if this is actually necessary in the hash codepath.

Testing so far is limited to booting on QEMU (power8 and power9 targets)
and a POWER8 VM along with setting some simple xmon breakpoints (which
makes use of code-patching). A POC lkdtm test is in-progress to actually
exploit the existing vulnerability (ie. the mapping during patching is
exposed in kernel page tables and accessible by other CPUS) - this will
accompany a future v1 of this series.

[0]: https://github.com/linuxppc/issues/issues/224
[1]: https://lore.kernel.org/kernel-hardening/20190426232303.28381-1-nadav.amit@gmail.com/

Christopher M. Riedl (3):
  powerpc/mm: Introduce temporary mm
  powerpc/lib: Initialize a temporary mm for code patching
  powerpc/lib: Use a temporary mm for code patching

 arch/powerpc/include/asm/debug.h       |   1 +
 arch/powerpc/include/asm/mmu_context.h |  56 +++++++++-
 arch/powerpc/kernel/process.c          |   5 +
 arch/powerpc/lib/code-patching.c       | 140 ++++++++++++++-----------
 4 files changed, 137 insertions(+), 65 deletions(-)

-- 
2.25.1

