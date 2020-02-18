Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0809162AAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 17:32:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MRGP442hzDqY2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 03:32:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MRCR4v4jzDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 03:29:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48MRCR4Tbjz8t9F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 03:29:55 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48MRCR45zyz9sSG; Wed, 19 Feb 2020 03:29:55 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 48MRCR15Dtz9sRk
 for <linuxppc-dev@ozlabs.org>; Wed, 19 Feb 2020 03:29:54 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B979EC1A3;
 Tue, 18 Feb 2020 16:29:49 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: Hari Bathini <hbathini@linux.ibm.com>,
 Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>
Subject: [PATCH rebased 1/2] powerpc: reserve memory for capture kernel after
 hugepages init
Date: Tue, 18 Feb 2020 17:28:34 +0100
Message-Id: <f0e3acbcd3ba16d06d4f3e51b90655c69004768c.1582043081.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <156166326909.13320.3330203549978146193.stgit@hbathini.in.ibm.com>
References: <156166326909.13320.3330203549978146193.stgit@hbathini.in.ibm.com>
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

Sometimes, memory reservation for KDump/FADump can overlap with memory
marked for hugepages. This overlap leads to error, hang in KDump case
and copy error reported by f/w in case of FADump, while trying to
capture dump. Report error while setting up memory for the capture
kernel instead of running into issues while capturing dump, by moving
KDump/FADump reservation below MMU early init and failing gracefully
when hugepages memory overlaps with capture kernel memory.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/prom.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 6620f37abe73..0f14dc9c4dab 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -735,14 +735,6 @@ void __init early_init_devtree(void *params)
 	if (PHYSICAL_START > MEMORY_START)
 		memblock_reserve(MEMORY_START, 0x8000);
 	reserve_kdump_trampoline();
-#if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
-	/*
-	 * If we fail to reserve memory for firmware-assisted dump then
-	 * fallback to kexec based kdump.
-	 */
-	if (fadump_reserve_mem() == 0)
-#endif
-		reserve_crashkernel();
 	early_reserve_mem();
 
 	/* Ensure that total memory size is page-aligned. */
@@ -781,6 +773,14 @@ void __init early_init_devtree(void *params)
 #endif
 
 	mmu_early_init_devtree();
+#if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
+	/*
+	 * If we fail to reserve memory for firmware-assisted dump then
+	 * fallback to kexec based kdump.
+	 */
+	if (fadump_reserve_mem() == 0)
+#endif
+		reserve_crashkernel();
 
 #ifdef CONFIG_PPC_POWERNV
 	/* Scan and build the list of machine check recoverable ranges */
-- 
2.23.0

