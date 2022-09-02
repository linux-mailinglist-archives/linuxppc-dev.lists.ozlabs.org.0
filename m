Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4355AAAB6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 10:56:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJsGN4YYVz3blV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 18:56:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HjYPR05u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HjYPR05u;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJsC80Dl6z3045
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 18:53:39 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso4918677pjk.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Sep 2022 01:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4DeiqY99QkvZf7iajUQ3VuxFWu8Pod4otWG68owJ71s=;
        b=HjYPR05u1EwjWLaEhkD8mOYSdTF+qG3YK9zwMBezJPc4s0PYSDZppVsl3cLJDdaIae
         BGJsN8DzphaT8YBPTB0rpynXKSmAMCcMGaD7zQdX/6nUqGx8VBlTov14X6Qsg9trBCex
         B/ipfLnH4WzY2MU69oequ8aytIG9Jx2VJK/8MsbhDAKK/zV7PUSfXHDksTUfQdE7MoSu
         7qgT14Ew58kP564YQgb4WX5rTGdHD/jii0STcib5i0NUZxiO2dxZ467vCQ9tg4rWw/+h
         BOElhUhjut8naeBSKQI1UARArLimBD3VWSdwFyoKgXz3mS15WKljQsbDjkVRdMp8ooNk
         KZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4DeiqY99QkvZf7iajUQ3VuxFWu8Pod4otWG68owJ71s=;
        b=LJvgQvHHJBCmtSedNDG5Put0m5k3pD9NdbKBvfoRimOWdtVyY5MkE103qcrils6SG4
         JUhsyM6HL9zRKo8rEhJ3QeJDKG+PeAOGWjeXiAdu92c89TCHudnM0D8FWtsi0fsqLQZc
         f/xqXBpMsotTbO50vjipfcv4kK4PvQ+EnL9f75b0fXJpixgaYmIL1lympxfrfftQ3pHR
         lMKOi0gAFo4hteCXgEBWwW4Qt3PvrTfg4k3J3VXY3cU87W/Wtwg13Lc1O/J1bpJ9sjYN
         Yhlm3YlHnM369eimI/fLJnOkdh/yROII0j6Komwv39ouhTKMZduB4OYlz58rQ+XBiijB
         qQgw==
X-Gm-Message-State: ACgBeo2+JQIGVu5IRxVQYYbIFqKoMqfhJ9H//BrOY8l1kT0ePT3q266X
	6YRyqnUuYaDowvn4+Nl1xUzSEL2mPgI=
X-Google-Smtp-Source: AA6agR5ah4z9BANiZT51dMbsS5ttx89tQOQimgf9z9XfzWPOdt7hobvr89B5P8F8YE2bKsiweOh8Sw==
X-Received: by 2002:a17:902:e745:b0:174:dfce:bdcd with SMTP id p5-20020a170902e74500b00174dfcebdcdmr20926201plf.12.1662108817116;
        Fri, 02 Sep 2022 01:53:37 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090322c400b001750b31faabsm1039130plg.262.2022.09.02.01.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 01:53:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] powerpc/pseries: Move dtl scanning and steal time accounting to pseries platform
Date: Fri,  2 Sep 2022 18:53:16 +1000
Message-Id: <20220902085316.2071519-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902085316.2071519-1-npiggin@gmail.com>
References: <20220902085316.2071519-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dtl is the PAPR Dispatch Trace Log, which is entirely a pseries feature.
The pseries platform alrady has a file dealing with the dtl, so move
scanning for stolen time accounting there from kernel/time.c.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/cputime.h   |  2 +-
 arch/powerpc/include/asm/dtl.h       |  8 ---
 arch/powerpc/include/asm/time.h      |  5 +-
 arch/powerpc/kernel/time.c           | 92 ++--------------------------
 arch/powerpc/platforms/pseries/dtl.c | 81 ++++++++++++++++++++++++
 5 files changed, 90 insertions(+), 98 deletions(-)

diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
index 6d2b27997492..431ae2343022 100644
--- a/arch/powerpc/include/asm/cputime.h
+++ b/arch/powerpc/include/asm/cputime.h
@@ -95,7 +95,7 @@ static notrace inline void account_stolen_time(void)
 		struct lppaca *lp = local_paca->lppaca_ptr;
 
 		if (unlikely(local_paca->dtl_ridx != be64_to_cpu(lp->dtl_idx)))
-			accumulate_stolen_time();
+			pseries_accumulate_stolen_time();
 	}
 #endif
 }
diff --git a/arch/powerpc/include/asm/dtl.h b/arch/powerpc/include/asm/dtl.h
index 1625888f27ef..4bcb9f9ac764 100644
--- a/arch/powerpc/include/asm/dtl.h
+++ b/arch/powerpc/include/asm/dtl.h
@@ -37,14 +37,6 @@ struct dtl_entry {
 extern struct kmem_cache *dtl_cache;
 extern rwlock_t dtl_access_lock;
 
-/*
- * When CONFIG_VIRT_CPU_ACCOUNTING_NATIVE = y, the cpu accounting code controls
- * reading from the dispatch trace log.  If other code wants to consume
- * DTL entries, it can set this pointer to a function that will get
- * called once for each DTL entry that gets processed.
- */
-extern void (*dtl_consumer)(struct dtl_entry *entry, u64 index);
-
 extern void register_dtl_buffer(int cpu);
 extern void alloc_dtl_buffers(unsigned long *time_limit);
 extern long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity);
diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 1e5643a9b1f2..9f50766c4623 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -116,8 +116,9 @@ unsigned long long tb_to_ns(unsigned long long tb_ticks);
 
 void timer_broadcast_interrupt(void);
 
-/* SPLPAR */
-void accumulate_stolen_time(void);
+/* SPLPAR and VIRT_CPU_ACCOUNTING_NATIVE */
+void pseries_accumulate_stolen_time(void);
+u64 pseries_calculate_stolen_time(u64 stop_tb);
 
 #endif /* __KERNEL__ */
 #endif /* __POWERPC_TIME_H */
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 587adcc12860..ae3e33b4ef95 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -178,92 +178,6 @@ static inline unsigned long read_spurr(unsigned long tb)
 	return tb;
 }
 
-#ifdef CONFIG_PPC_SPLPAR
-
-#include <asm/dtl.h>
-
-void (*dtl_consumer)(struct dtl_entry *, u64);
-
-/*
- * Scan the dispatch trace log and count up the stolen time.
- * Should be called with interrupts disabled.
- */
-static u64 scan_dispatch_log(u64 stop_tb)
-{
-	u64 i = local_paca->dtl_ridx;
-	struct dtl_entry *dtl = local_paca->dtl_curr;
-	struct dtl_entry *dtl_end = local_paca->dispatch_log_end;
-	struct lppaca *vpa = local_paca->lppaca_ptr;
-	u64 tb_delta;
-	u64 stolen = 0;
-	u64 dtb;
-
-	if (!dtl)
-		return 0;
-
-	if (i == be64_to_cpu(vpa->dtl_idx))
-		return 0;
-	while (i < be64_to_cpu(vpa->dtl_idx)) {
-		dtb = be64_to_cpu(dtl->timebase);
-		tb_delta = be32_to_cpu(dtl->enqueue_to_dispatch_time) +
-			be32_to_cpu(dtl->ready_to_enqueue_time);
-		barrier();
-		if (i + N_DISPATCH_LOG < be64_to_cpu(vpa->dtl_idx)) {
-			/* buffer has overflowed */
-			i = be64_to_cpu(vpa->dtl_idx) - N_DISPATCH_LOG;
-			dtl = local_paca->dispatch_log + (i % N_DISPATCH_LOG);
-			continue;
-		}
-		if (dtb > stop_tb)
-			break;
-		if (dtl_consumer)
-			dtl_consumer(dtl, i);
-		stolen += tb_delta;
-		++i;
-		++dtl;
-		if (dtl == dtl_end)
-			dtl = local_paca->dispatch_log;
-	}
-	local_paca->dtl_ridx = i;
-	local_paca->dtl_curr = dtl;
-	return stolen;
-}
-
-/*
- * Accumulate stolen time by scanning the dispatch trace log.
- * Called on entry from user mode.
- */
-void notrace accumulate_stolen_time(void)
-{
-	u64 sst, ust;
-	struct cpu_accounting_data *acct = &local_paca->accounting;
-
-	sst = scan_dispatch_log(acct->starttime_user);
-	ust = scan_dispatch_log(acct->starttime);
-	acct->stime -= sst;
-	acct->utime -= ust;
-	acct->steal_time += ust + sst;
-}
-
-static inline u64 calculate_stolen_time(u64 stop_tb)
-{
-	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
-		return 0;
-
-	if (get_paca()->dtl_ridx != be64_to_cpu(get_lppaca()->dtl_idx))
-		return scan_dispatch_log(stop_tb);
-
-	return 0;
-}
-
-#else /* CONFIG_PPC_SPLPAR */
-static inline u64 calculate_stolen_time(u64 stop_tb)
-{
-	return 0;
-}
-
-#endif /* CONFIG_PPC_SPLPAR */
-
 /*
  * Account time for a transition between system, hard irq
  * or soft irq state.
@@ -322,7 +236,11 @@ static unsigned long vtime_delta(struct cpu_accounting_data *acct,
 
 	*stime_scaled = vtime_delta_scaled(acct, now, stime);
 
-	*steal_time = calculate_stolen_time(now);
+	if (IS_ENABLED(CONFIG_PPC_SPLPAR) &&
+			firmware_has_feature(FW_FEATURE_SPLPAR))
+		*steal_time = pseries_calculate_stolen_time(now);
+	else
+		*steal_time = 0;
 
 	return stime;
 }
diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index 352af5b14a0f..1b1977bc78e7 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -37,6 +37,15 @@ static u8 dtl_event_mask = DTL_LOG_ALL;
 static int dtl_buf_entries = N_DISPATCH_LOG;
 
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
+
+/*
+ * When CONFIG_VIRT_CPU_ACCOUNTING_NATIVE = y, the cpu accounting code controls
+ * reading from the dispatch trace log.  If other code wants to consume
+ * DTL entries, it can set this pointer to a function that will get
+ * called once for each DTL entry that gets processed.
+ */
+static void (*dtl_consumer)(struct dtl_entry *entry, u64 index);
+
 struct dtl_ring {
 	u64	write_index;
 	struct dtl_entry *write_ptr;
@@ -48,6 +57,78 @@ static DEFINE_PER_CPU(struct dtl_ring, dtl_rings);
 
 static atomic_t dtl_count;
 
+/*
+ * Scan the dispatch trace log and count up the stolen time.
+ * Should be called with interrupts disabled.
+ */
+static notrace u64 scan_dispatch_log(u64 stop_tb)
+{
+	u64 i = local_paca->dtl_ridx;
+	struct dtl_entry *dtl = local_paca->dtl_curr;
+	struct dtl_entry *dtl_end = local_paca->dispatch_log_end;
+	struct lppaca *vpa = local_paca->lppaca_ptr;
+	u64 tb_delta;
+	u64 stolen = 0;
+	u64 dtb;
+
+	if (!dtl)
+		return 0;
+
+	if (i == be64_to_cpu(vpa->dtl_idx))
+		return 0;
+	while (i < be64_to_cpu(vpa->dtl_idx)) {
+		dtb = be64_to_cpu(dtl->timebase);
+		tb_delta = be32_to_cpu(dtl->enqueue_to_dispatch_time) +
+			be32_to_cpu(dtl->ready_to_enqueue_time);
+		barrier();
+		if (i + N_DISPATCH_LOG < be64_to_cpu(vpa->dtl_idx)) {
+			/* buffer has overflowed */
+			i = be64_to_cpu(vpa->dtl_idx) - N_DISPATCH_LOG;
+			dtl = local_paca->dispatch_log + (i % N_DISPATCH_LOG);
+			continue;
+		}
+		if (dtb > stop_tb)
+			break;
+		if (dtl_consumer)
+			dtl_consumer(dtl, i);
+		stolen += tb_delta;
+		++i;
+		++dtl;
+		if (dtl == dtl_end)
+			dtl = local_paca->dispatch_log;
+	}
+	local_paca->dtl_ridx = i;
+	local_paca->dtl_curr = dtl;
+	return stolen;
+}
+
+/*
+ * Accumulate stolen time by scanning the dispatch trace log.
+ * Called on entry from user mode.
+ */
+void notrace pseries_accumulate_stolen_time(void)
+{
+	u64 sst, ust;
+	struct cpu_accounting_data *acct = &local_paca->accounting;
+
+	sst = scan_dispatch_log(acct->starttime_user);
+	ust = scan_dispatch_log(acct->starttime);
+	acct->stime -= sst;
+	acct->utime -= ust;
+	acct->steal_time += ust + sst;
+}
+
+u64 pseries_calculate_stolen_time(u64 stop_tb)
+{
+	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
+		return 0;
+
+	if (get_paca()->dtl_ridx != be64_to_cpu(get_lppaca()->dtl_idx))
+		return scan_dispatch_log(stop_tb);
+
+	return 0;
+}
+
 /*
  * The cpu accounting code controls the DTL ring buffer, and we get
  * given entries as they are processed.
-- 
2.37.2

