Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E392E7F5D8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:19:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460PnT1c0hzDqWY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:19:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mZNo71iP"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PM66ybNzDqsL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:02 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id b3so33540005plr.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3b1HLfIRvN9xJNuNjZQhc9HBKLW7KCP6BVSlMgxCDJg=;
 b=mZNo71iPFodwYuUJ2JOo22HikagIcgBBs0574WC7OfMAIl0ZX41lAjRnxxW0c2wJOe
 Xx53+66iD/koztfHiosSVWCycOm/bY7OSInIX9ILsqJZV753RzXb9sXxpCKGsdU0IHxP
 1RC6LprEj+YuxEV7cj3wEe4c4yZJPVrY8qc3Ovw+r7WF1lIZlopw+os8zCHXfJJMbQrR
 VdwYKndBoEYljltoHVy5JaKNZSYaiCnrquqVpaML11LfBX2x3amvsV/+CWh7AqZiF6Vo
 LTGZU1IKHbSTGYZHVirfATlG5CxBumJMTmpQ6K9gqJST0KMD16AM/M2FVr4mV3NLfeYR
 amCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3b1HLfIRvN9xJNuNjZQhc9HBKLW7KCP6BVSlMgxCDJg=;
 b=HS8cnVSeZdNzkJq1g4qSK/7+hD3fwXbvb2nwSBMxPzanAIDwJkM8bDTREsHybgf1wd
 erI4GVzwml5GWPKtJWkM0j/1VdjzQhB6gpKyglvlUC8Uwzo6+JDY9awIVpeWxXaxVn+X
 41QacUvgBJIIyOYx81YuqcXskrTJJ8nc92R6+uoluCumlkhy6wduwxwRLLgiLuFxSxhG
 Wn98dXpMzYJ3hFADsknYBYYhWTSHEx1JssoiCcV4uYqrCthfMi1bT624U+7m79Xk665n
 woUaaV5E12oR52NlbSG2Cb4M3yruJM3Q1ccBHgI5XCC3H8Nk4+1QhDuGFj9+W6/UzTfj
 R9+A==
X-Gm-Message-State: APjAAAWlO0Q9uQl/UzeNl0WXCdGrJsjLFQPFR44yeoO/8YtYt+YpCuoq
 CuuP+55jAxKay+v2T5J2WTa/pXb0miw=
X-Google-Smtp-Source: APXvYqzu2973ltGw5/A9WlhqytMw+wverTGUwAHNuymwQxyxVwMd9WEgk0R5QjHzsT5ebtEQXXXYHQ==
X-Received: by 2002:a17:902:2bc5:: with SMTP id
 l63mr135113418plb.30.1564743599939; 
 Fri, 02 Aug 2019 03:59:59 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.03.59.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 03:59:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/44] powerpc/64s/powernv: machine check dump SLB contents
Date: Fri,  2 Aug 2019 20:56:33 +1000
Message-Id: <20190802105709.27696-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
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
index a814d2dfb5b0..0ea47bc6fca0 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -397,6 +397,8 @@ static int mce_handle_ierror(struct pt_regs *regs,
 		/* attempt to correct the error */
 		switch (table[i].error_type) {
 		case MCE_ERROR_TYPE_SLB:
+			if (local_paca->in_mce == 1)
+				slb_save_contents(local_paca->mce_faulty_slbs);
 			handled = mce_flush(MCE_FLUSH_SLB);
 			break;
 		case MCE_ERROR_TYPE_ERAT:
@@ -482,6 +484,8 @@ static int mce_handle_derror(struct pt_regs *regs,
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
index f5940cc71c37..5546c9562731 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -141,17 +141,19 @@ static void __init fwnmi_init(void)
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
2.22.0

