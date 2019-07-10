Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B083C64A10
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:49:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kNsw2N3dzDqpM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:49:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oYpP1Mw6"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kNHG5bbVzDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:23:06 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id i8so1405345pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 08:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDmQH0iPLwTB1sV/35aHWimh5kfD3Kv9FC0WiuUyuIU=;
 b=oYpP1Mw6iNGnLd4FDi1LxjA3ZHbj15u5QEdty3Ej8gAj4RTQuCFDTsmuziOsDnAofL
 4Wdm5+F8ZvDPqrSbixZs+u1C+00XdA00bD78G7b3SyoqQxxAx0VLmAIUffBJCoqKh4Tc
 EiND3PXvaH6oAaWX11SAyRMF7LKj9jyR/5Y5Od0n9jphPge3n1waypEVRsjBG+h+Ub3T
 aTXyMsqolnNhke7qLi3TIXo9V99rhM079wj9aQGbufBHq9dF4c/oXStEBz83jwOejLqF
 9haxpksuWPxruXzDq6wjxoGIQQ7VgC/gJTqrn/H3++2Ow4OGa+Y/1lvqCNYBrjdDp6TR
 Kpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDmQH0iPLwTB1sV/35aHWimh5kfD3Kv9FC0WiuUyuIU=;
 b=Y/Q0kQyxHJQ0KmzLBsfov9SHR7v8QNYCWbeqdiFLWn/7jnoAPSC86iIqNY8NWPXWpH
 3oZrRKBU8HPWjLJhnxCpjvjExKJCYQyvNlCWQYsM7S7WFCtaLwxgEHex6oSp0CfbBQfL
 Iiq83SsEA/uyGYqTlxgatfTNTCMcd4LUt6r7XIHenrExOBeMILEUD2Xbxx3+BBbrUkhq
 vRisfUen6PGqEx59hkXaGXFctD7/8wxzeYzM6raj3YI6Bt7+VSokoRIexFRYk29cKp5D
 SxGlzUDUlJNFLY45aZ1ULqYSBJAvKyksDQRX9Wo/RaM61X7duU/6CzoxlC/B+28FedB4
 n3Tg==
X-Gm-Message-State: APjAAAUW4185zx1gdmCdoEEaB6mNL8BZqrvyZ5mcsHdpk89cwdNQtkSW
 tblJiq00ykM+Qwyd9TgOpLyySR+zVgw=
X-Google-Smtp-Source: APXvYqy2apX3YNbhgY9odgGlabNRsdfk9nvNZOd7rgdUkz+GiTdzK6fP5Lu/5DgZLFLJDiDVk9ihIg==
X-Received: by 2002:a63:4554:: with SMTP id u20mr38677756pgk.406.1562772183080; 
 Wed, 10 Jul 2019 08:23:03 -0700 (PDT)
Received: from bobo.local0.net (14-203-207-157.tpgi.com.au. [14.203.207.157])
 by smtp.gmail.com with ESMTPSA id
 s22sm2699212pfh.107.2019.07.10.08.23.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:23:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/16] powerpc/64s/powernv: machine check dump SLB contents
Date: Thu, 11 Jul 2019 01:19:42 +1000
Message-Id: <20190710151950.31906-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710151950.31906-1-npiggin@gmail.com>
References: <20190710151950.31906-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Re-use the code introduced in pseries to save and dump the contents
of the SLB in the case of an SLB involved machine check exception.

This patch also avoids allocating the SLB save array on pseries radix.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce.c              |  6 ++++++
 arch/powerpc/kernel/mce_power.c        |  4 ++++
 arch/powerpc/platforms/powernv/setup.c |  9 +++++++++
 arch/powerpc/platforms/pseries/setup.c | 24 +++++++++++++-----------
 4 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index b18df633eae9..38b560f92d12 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -486,6 +486,12 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 	subtype = evt->error_class < ARRAY_SIZE(mc_error_class) ?
 		mc_error_class[evt->error_class] : "Unknown";
 	printk("%sMCE: CPU%d: %s\n", level, evt->cpu, subtype);
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	/* Display faulty slb contents for SLB errors. */
+	if (evt->error_type == MCE_ERROR_TYPE_SLB)
+		slb_dump_contents(local_paca->mce_faulty_slbs);
+#endif
 }
 EXPORT_SYMBOL_GPL(machine_check_print_event_info);
 
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index e39536aad30d..c4d0e0c6e7d3 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -398,6 +398,8 @@ static int mce_handle_ierror(struct pt_regs *regs,
 		/* attempt to correct the error */
 		switch (table[i].error_type) {
 		case MCE_ERROR_TYPE_SLB:
+			if (local_paca->in_mce == 1)
+				slb_save_contents(local_paca->mce_faulty_slbs);
 			handled = mce_flush(MCE_FLUSH_SLB);
 			break;
 		case MCE_ERROR_TYPE_ERAT:
@@ -483,6 +485,8 @@ static int mce_handle_derror(struct pt_regs *regs,
 		/* attempt to correct the error */
 		switch (table[i].error_type) {
 		case MCE_ERROR_TYPE_SLB:
+			if (local_paca->in_mce == 1)
+				slb_save_contents(local_paca->mce_faulty_slbs);
 			if (mce_flush(MCE_FLUSH_SLB))
 				handled = 1;
 			break;
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index a5e52f9eed3c..83498604d322 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -24,6 +24,7 @@
 #include <linux/bug.h>
 #include <linux/pci.h>
 #include <linux/cpufreq.h>
+#include <linux/memblock.h>
 
 #include <asm/machdep.h>
 #include <asm/firmware.h>
@@ -166,6 +167,14 @@ static void __init pnv_init(void)
 	else
 #endif
 		add_preferred_console("hvc", 0, NULL);
+
+	if (!radix_enabled()) {
+		int i;
+
+		/* Allocate per cpu area to save old slb contents during MCE */
+		for_each_possible_cpu(i)
+			paca_ptrs[i]->mce_faulty_slbs = memblock_alloc_node(mmu_slb_size, __alignof__(*paca_ptrs[i]->mce_faulty_slbs), cpu_to_node(i));
+	}
 }
 
 static void __init pnv_init_IRQ(void)
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index ab38a6c8dffb..637d59f4c5ce 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -139,17 +139,19 @@ static void __init fwnmi_init(void)
 	}
 
 #ifdef CONFIG_PPC_BOOK3S_64
-	/* Allocate per cpu slb area to save old slb contents during MCE */
-	size = sizeof(struct slb_entry) * mmu_slb_size * nr_cpus;
-	slb_ptr = memblock_alloc_try_nid_raw(size, sizeof(struct slb_entry),
-					MEMBLOCK_LOW_LIMIT, ppc64_rma_size,
-					NUMA_NO_NODE);
-	if (!slb_ptr)
-		panic("Failed to allocate %zu bytes below %pa for slb area\n",
-		      size, &ppc64_rma_size);
-
-	for_each_possible_cpu(i)
-		paca_ptrs[i]->mce_faulty_slbs = slb_ptr + (mmu_slb_size * i);
+	if (!radix_enabled()) {
+		/* Allocate per cpu area to save old slb contents during MCE */
+		size = sizeof(struct slb_entry) * mmu_slb_size * nr_cpus;
+		slb_ptr = memblock_alloc_try_nid_raw(size,
+				sizeof(struct slb_entry), MEMBLOCK_LOW_LIMIT,
+				ppc64_rma_size, NUMA_NO_NODE);
+		if (!slb_ptr)
+			panic("Failed to allocate %zu bytes below %pa for slb area\n",
+			      size, &ppc64_rma_size);
+
+		for_each_possible_cpu(i)
+			paca_ptrs[i]->mce_faulty_slbs = slb_ptr + (mmu_slb_size * i);
+	}
 #endif
 }
 
-- 
2.20.1

