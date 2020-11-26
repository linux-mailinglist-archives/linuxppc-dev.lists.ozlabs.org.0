Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C68B2C520E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:33:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChYxQ1pXVzDrNj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 21:32:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hsE1nv3L; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChYnF5BBNzDr8C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 21:25:53 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id y7so1245915pfq.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TALi3yNEcnDT+oKKCl6yUQr7dUdd5v6MK4AhhpQy4Q4=;
 b=hsE1nv3LXHijDTuxZScpjZ/OXOQ52OSNR8aVKa2qNXUwBhDkRXyArropU26cYhP1k/
 h0WujkloPeN1N0lCKzXwQT+Z1w8wqG+b6yVD/rdZoImiCtLO+AD7SXx6ZjfKMo+M7XsK
 Lx3M22IINastS6rpf21nhfq0lYSl8XYtp8B5kRpvf/PKQhNF4kLKqnuBEUGAzVnBbsEX
 46QPv+/rtKuySdxNczJ/4WB23e0bsX3gC5h5Vmq9koXw8f4n6L9W6OG5gIUjX8Rx9n+2
 +zuL24Fc9AoZe6hpj7uzpvIZms4GnKxX2mtDPs4uRRcStmeWrZOEpy5hXAyzkipObqa9
 gbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TALi3yNEcnDT+oKKCl6yUQr7dUdd5v6MK4AhhpQy4Q4=;
 b=OZZ7qJ+RL465u2h/efnrg2wrFQ15VR8tIkm8zqGxKyNyK7uamvgzoXnvdmYyCpCiW7
 oeU3rpNrbRorhxyci7FV36QlEFsoZWzBFzdfUE2Y+hNA2t9I+Lhgr2fSRnhbqetmDlX/
 krazPhOR8hEQ8dzK1MeGBJivex8CggMqjWNUbfjKKR5FEiCmrqFqgw5rNd0MaMBIMYGm
 puE77aefITrrkfUOUOggEm9Uaayg5pwsP7HnwOVkUSIcT138yk4whcfRmVISgZ7I9Gzn
 IZyjchQKxBMH1PQB1EBsedwE9N8CeG0UcoU9eOcFWXfSJkRmyU2sdsCPSXB4aFLQrZAx
 Okcw==
X-Gm-Message-State: AOAM530Zq60qEinZ1aCgKCVpPzy6YlaNK6ClBsnEzHU96dnNjKVEdccr
 JnuRI7XGjlecZ/lAt7u/AOqg9nCjlriT+Q==
X-Google-Smtp-Source: ABdhPJzYKmU+lOaVRFHnqTI+TMOb/YjktcBmx+7qcfghYTHOA4YMFrkV1Io/0wb9cVvJIhy3523EQA==
X-Received: by 2002:a63:e90e:: with SMTP id i14mr2023764pgh.298.1606386350476; 
 Thu, 26 Nov 2020 02:25:50 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id h7sm4338134pgr.33.2020.11.26.02.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 02:25:50 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/64s: Trim offlined CPUs from mm_cpumasks
Date: Thu, 26 Nov 2020 20:25:30 +1000
Message-Id: <20201126102530.691335-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201126102530.691335-1-npiggin@gmail.com>
References: <20201126102530.691335-1-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Milton Miller <miltonm@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When offlining a CPU, powerpc/64s does not flush TLBs, rather it just
leaves the CPU set in mm_cpumasks, so it continues to receive TLBIEs
to manage its TLBs.

However the exit_flush_lazy_tlbs() function expects that after
returning, all CPUs (except self) have flushed TLBs for that mm, in
which case TLBIEL can be used for this flush. This breaks for offline
CPUs because they don't get the IPI to flush their TLB. This can lead
to stale translations.

Fix this by clearing the CPU from mm_cpumasks, then flushing all TLBs
before going offline.

These offlined CPU bits stuck in the cpumask also prevents the cpumask
from being trimmed back to local mode, which means continual broadcast
IPIs or TLBIEs are needed for TLB flushing. This patch prevents that
situation too.

A cast of many were involved in working this out, but in particular
Milton, Aneesh, Paul made key discoveries.

Fixes: 0cef77c7798a7 ("powerpc/64s/radix: flush remote CPUs out of single-threaded mm_cpumask")
Debugged-by: Milton Miller <miltonm@us.ibm.com>
Debugged-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Debugged-by: Paul Mackerras <paulus@samba.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h     | 12 ++++++++++++
 arch/powerpc/mm/book3s64/mmu_context.c       | 20 ++++++++++++++++++++
 arch/powerpc/platforms/powermac/smp.c        |  2 ++
 arch/powerpc/platforms/powernv/smp.c         |  3 +++
 arch/powerpc/platforms/pseries/hotplug-cpu.c |  3 +++
 5 files changed, 40 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index e0b52940e43c..750918451dd2 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -242,6 +242,18 @@ extern void radix_init_pseries(void);
 static inline void radix_init_pseries(void) { };
 #endif
 
+#ifdef CONFIG_HOTPLUG_CPU
+#define arch_clear_mm_cpumask_cpu(cpu, mm)				\
+	do {								\
+		if (cpumask_test_cpu(cpu, mm_cpumask(mm))) {		\
+			atomic_dec(&(mm)->context.active_cpus);		\
+			cpumask_clear_cpu(cpu, mm_cpumask(mm));		\
+		}							\
+	} while (0)
+
+void cleanup_cpu_mmu_context(void);
+#endif
+
 static inline int get_user_context(mm_context_t *ctx, unsigned long ea)
 {
 	int index = ea >> MAX_EA_BITS_PER_CONTEXT;
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index 1c54821de7bf..0c8557220ae2 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -17,6 +17,7 @@
 #include <linux/export.h>
 #include <linux/gfp.h>
 #include <linux/slab.h>
+#include <linux/cpu.h>
 
 #include <asm/mmu_context.h>
 #include <asm/pgalloc.h>
@@ -307,3 +308,22 @@ void radix__switch_mmu_context(struct mm_struct *prev, struct mm_struct *next)
 	isync();
 }
 #endif
+
+/**
+ * cleanup_cpu_mmu_context - Clean up MMU details for this CPU (newly offlined)
+ *
+ * This clears the CPU from mm_cpumask for all processes, and then flushes the
+ * local TLB to ensure TLB coherency in case the CPU is onlined again.
+ *
+ * KVM guest translations are not necessarily flushed here. If KVM started
+ * using mm_cpumask or the Linux APIs which do, this would have to be resolved.
+ */
+#ifdef CONFIG_HOTPLUG_CPU
+void cleanup_cpu_mmu_context(void)
+{
+	int cpu = smp_processor_id();
+
+	clear_tasks_mm_cpumask(cpu);
+	tlbiel_all();
+}
+#endif
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 74ebe664b016..adae2a6712e1 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -911,6 +911,8 @@ static int smp_core99_cpu_disable(void)
 
 	mpic_cpu_set_priority(0xf);
 
+	cleanup_cpu_mmu_context();
+
 	return 0;
 }
 
diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index 54c4ba45c7ce..cbb67813cd5d 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -143,6 +143,9 @@ static int pnv_smp_cpu_disable(void)
 		xive_smp_disable_cpu();
 	else
 		xics_migrate_irqs_away();
+
+	cleanup_cpu_mmu_context();
+
 	return 0;
 }
 
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index f2837e33bf5d..a02012f1b04a 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -90,6 +90,9 @@ static int pseries_cpu_disable(void)
 		xive_smp_disable_cpu();
 	else
 		xics_migrate_irqs_away();
+
+	cleanup_cpu_mmu_context();
+
 	return 0;
 }
 
-- 
2.23.0

