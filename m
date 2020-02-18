Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F6A162AB6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 17:34:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MRJm3ntPzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 03:34:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MRCS3DRDzDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 03:29:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48MRCS2Nkcz8t9F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 03:29:56 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48MRCS21cNz9sRk; Wed, 19 Feb 2020 03:29:56 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48MRCR4C2Zz9sSL
 for <linuxppc-dev@ozlabs.org>; Wed, 19 Feb 2020 03:29:55 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 82176C1A6;
 Tue, 18 Feb 2020 16:29:52 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: Hari Bathini <hbathini@linux.ibm.com>,
 Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>
Subject: [PATCH rebased 2/2] powerpc: avoid adjusting memory_limit for capture
 kernel memory reservation
Date: Tue, 18 Feb 2020 17:28:35 +0100
Message-Id: <5189c44bcdcc903120a3a793c4de78066dfc9c00.1582043081.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <f0e3acbcd3ba16d06d4f3e51b90655c69004768c.1582043081.git.msuchanek@suse.de>
References: <f0e3acbcd3ba16d06d4f3e51b90655c69004768c.1582043081.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Hari Bathini <hbathini@linux.ibm.com>

Currently, if memory_limit is specified and it overlaps with memory to
be reserved for capture kernel, memory_limit is adjusted to accommodate
capture kernel. With memory reservation for capture kernel moved later
(after enforcing memory limit), this adjustment no longer holds water.
So, avoid adjusting memory_limit and error out instead.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Reviewed-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/kernel/fadump.c | 16 ----------------
 arch/powerpc/kexec/core.c    | 22 +++++++++++-----------
 2 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index ff0114aeba9b..54d56ecadf1a 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -472,22 +472,6 @@ int __init fadump_reserve_mem(void)
 		}
 	}
 
-	/*
-	 * Calculate the memory boundary.
-	 * If memory_limit is less than actual memory boundary then reserve
-	 * the memory for fadump beyond the memory_limit and adjust the
-	 * memory_limit accordingly, so that the running kernel can run with
-	 * specified memory_limit.
-	 */
-	if (memory_limit && memory_limit < memblock_end_of_DRAM()) {
-		size = get_fadump_area_size();
-		if ((memory_limit + size) < memblock_end_of_DRAM())
-			memory_limit += size;
-		else
-			memory_limit = memblock_end_of_DRAM();
-		printk(KERN_INFO "Adjusted memory_limit for firmware-assisted"
-				" dump, now %#016llx\n", memory_limit);
-	}
 	if (memory_limit)
 		mem_boundary = memory_limit;
 	else
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 078fe3d76feb..491e08d98c1b 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -126,10 +126,8 @@ void __init reserve_crashkernel(void)
 		crashk_res.end = crash_base + crash_size - 1;
 	}
 
-	if (crashk_res.end == crashk_res.start) {
-		crashk_res.start = crashk_res.end = 0;
-		return;
-	}
+	if (crashk_res.end == crashk_res.start)
+		goto error_out;
 
 	/* We might have got these values via the command line or the
 	 * device tree, either way sanitise them now. */
@@ -171,15 +169,13 @@ void __init reserve_crashkernel(void)
 	if (overlaps_crashkernel(__pa(_stext), _end - _stext)) {
 		printk(KERN_WARNING
 			"Crash kernel can not overlap current kernel\n");
-		crashk_res.start = crashk_res.end = 0;
-		return;
+		goto error_out;
 	}
 
 	/* Crash kernel trumps memory limit */
 	if (memory_limit && memory_limit <= crashk_res.end) {
-		memory_limit = crashk_res.end + 1;
-		printk("Adjusted memory limit for crashkernel, now 0x%llx\n",
-		       memory_limit);
+		pr_err("Crash kernel size can't exceed memory_limit\n");
+		goto error_out;
 	}
 
 	printk(KERN_INFO "Reserving %ldMB of memory at %ldMB "
@@ -191,9 +187,13 @@ void __init reserve_crashkernel(void)
 	if (!memblock_is_region_memory(crashk_res.start, crash_size) ||
 	    memblock_reserve(crashk_res.start, crash_size)) {
 		pr_err("Failed to reserve memory for crashkernel!\n");
-		crashk_res.start = crashk_res.end = 0;
-		return;
+		goto error_out;
 	}
+
+	return;
+error_out:
+	crashk_res.start = crashk_res.end = 0;
+	return;
 }
 
 int overlaps_crashkernel(unsigned long start, unsigned long size)
-- 
2.23.0

