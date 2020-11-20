Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E57CC2BA0BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 04:03:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CchFd6kzLzDqws
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 14:03:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p+MHfL8N; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cch7Z56J4zDqvR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 13:58:18 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id 10so6487712pfp.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 18:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ir+QYQ1CAfcL3SlhgU8WhF6YDpMkKzdlNHyr16xwtf8=;
 b=p+MHfL8NcM1ig3OnaW5iyOUPQCwHoq4L023gDboj7aoYhUdAdd9TqicTgAoQUdQ4QM
 D4fGAWEZakrU5IWyHz/UieaX+5vNAx1wlymR2KwonYhcynW4VZgAsZH3sZI99Pf+o5ue
 iUU+lNMCnbpYUYD7zQkCun+nze7j42Dm4WDmlU72bF304xdDhyrJA+Y+d8cDDMWylqtQ
 q9jzi796Ppa8zdTkESQW9PRPFXOyEMM8r9/CqmHWinw5C0qsVF+QlfC8dLhdhdycMxfb
 evW6qZGBsC7MRNDXhGD+v/b8KJlfRNSA/fwikaUWKK36nzjnYFbKhjDHICkUvPvlLLuo
 bNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ir+QYQ1CAfcL3SlhgU8WhF6YDpMkKzdlNHyr16xwtf8=;
 b=idw2n3m4aWVlkLWXpVcvVJOflA42GaFIQ8qPK5Gtv7RTZKSUEP6w5OZ/V7OnACV3B1
 U0K/6UiRBPALJLR1uPALlBKam5sN3jQYSBQ3q8BzPY0XgkOJJ092bHyXxiEeaJ0ehWc3
 IGHUg2PKUrJpS31znRKZpo/+DgncTMd3J77Uzd9TAJejC/TA4ucSc2i8c1hw/1N1Wh6Z
 sCF68euge3vOLHgeiNuWbo7KHyeSIQU1QbuS4ahc9T7TEyYvfhNp2YhA8wihTcRil2FF
 Lvz+ykymx+WEbkkd5Rj0pkDao5+zWMn/qzfBecCNAEo0bw8Op8QqanVnLDewiERQlLDZ
 h4sg==
X-Gm-Message-State: AOAM531zQezmUnwVo13jqFo4SEzSxy+6itF0tdNaXGYQSBOc0LAIk/3+
 wg6FeBbMLihMR0Aj0APDF4xxSI/PlGg=
X-Google-Smtp-Source: ABdhPJzmUMslLyf6QKSIzNwiUtfWA/PCdCn6oFS8zoZyzByAVt4wJwrVAAFIoEZy7on+FxR2Bi1MIw==
X-Received: by 2002:a17:90a:fa04:: with SMTP id
 cm4mr7519731pjb.24.1605841096090; 
 Thu, 19 Nov 2020 18:58:16 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id i130sm1181212pgc.7.2020.11.19.18.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 18:58:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s: Trim offlined CPUs from mm_cpumasks
Date: Fri, 20 Nov 2020 12:57:57 +1000
Message-Id: <20201120025757.325930-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201120025757.325930-1-npiggin@gmail.com>
References: <20201120025757.325930-1-npiggin@gmail.com>
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
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Anton Vorontsov <anton.vorontsov@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
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

