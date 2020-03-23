Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A488018EEF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 06:01:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m2Jv037ZzDqkg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 16:01:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m2GW21fZzDqXZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 15:58:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48m2GV6zxmz8t5m
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 15:58:58 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48m2GV5xnWz9sRR; Mon, 23 Mar 2020 15:58:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
X-Greylist: delayed 448 seconds by postgrey-1.36 at bilbo;
 Mon, 23 Mar 2020 15:58:57 AEDT
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48m2GT4cZdz9sPk
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 15:58:57 +1100 (AEDT)
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com
 [198.54.127.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id CFB27807F2
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 00:51:26 -0400 (EDT)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id EBD506004E
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 00:51:21 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.230])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id 987666004C
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 04:51:21 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org
Subject: [RFC PATCH 2/3] powerpc/lib: Initialize a temporary mm for code
 patching
Date: Sun, 22 Mar 2020 23:52:04 -0500
Message-Id: <20200323045205.20314-3-cmr@informatik.wtf>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323045205.20314-1-cmr@informatik.wtf>
References: <20200323045205.20314-1-cmr@informatik.wtf>
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

When code patching a STRICT_KERNEL_RWX kernel the page containing the
address to be patched is temporarily mapped with permissive memory
protections. Currently, a per-cpu vmalloc patch area is used for this
purpose. While the patch area is per-cpu, the temporary page mapping is
inserted into the kernel page tables for the duration of the patching.
The mapping is exposed to CPUs other than the patching CPU - this is
undesirable from a hardening perspective.

Use the `poking_init` init hook to prepare a temporary mm and patching
address. Initialize the temporary mm by copying the init mm. Choose a
randomized patching address inside the temporary mm userspace address
portion. The next patch uses the temporary mm and patching address for
code patching.

Based on x86 implementation:

commit 4fc19708b165
("x86/alternatives: Initialize temporary mm for patching")

Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
---
 arch/powerpc/lib/code-patching.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 3345f039a876..18b88ecfc5a8 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -11,6 +11,8 @@
 #include <linux/cpuhotplug.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/sched/task.h>
+#include <linux/random.h>
 
 #include <asm/pgtable.h>
 #include <asm/tlbflush.h>
@@ -39,6 +41,30 @@ int raw_patch_instruction(unsigned int *addr, unsigned int instr)
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
+
+__ro_after_init struct mm_struct *patching_mm;
+__ro_after_init unsigned long patching_addr;
+
+void __init poking_init(void)
+{
+	spinlock_t *ptl; /* for protecting pte table */
+	pte_t *ptep;
+
+	patching_mm = copy_init_mm();
+	BUG_ON(!patching_mm);
+
+	/*
+	 * In hash we cannot go above DEFAULT_MAP_WINDOW easily.
+	 * XXX: Do we want additional bits of entropy for radix?
+	 */
+	patching_addr = (get_random_long() & PAGE_MASK) %
+		(DEFAULT_MAP_WINDOW - PAGE_SIZE);
+
+	ptep = get_locked_pte(patching_mm, patching_addr, &ptl);
+	BUG_ON(!ptep);
+	pte_unmap_unlock(ptep, ptl);
+}
+
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
 
 static int text_area_cpu_up(unsigned int cpu)
-- 
2.25.1

