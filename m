Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 842C463190E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 04:52:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFtl033Znz3dvM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 14:52:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G3+BJ6h3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G3+BJ6h3;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFtk14Zmzz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 14:51:52 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id f3so10061654pgc.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 19:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GxntLd/ct95PDR+cb+voA3PVWvgQd225Bxlaz4kUMug=;
        b=G3+BJ6h3S2AwsBJvMKzpLcRAMmfnvNbqghjwS3l9dKG7H2nqHRd+WuWvUxxO4V9t7o
         pSkW2ykPq5piIQ6mXp6Jk628w6L1iflshHCNR7Rk9ja3KpcvZVkXod+WBOpoTGddqns4
         aYz9RO+oEVhTlg7TbVQ8KS/5s4DKt7L+GUMxrPRsn1rvd97A1Ir+OszygWwOKvVmmvOZ
         7jSHc4PX2jnGsX6hOL9G/KVsr7G28ajHEBhISEL00cgRSDqdHgSBEAtjOsK4TanESi0F
         +W65wypspVWFZHnYM5w2Scbxv2l99dKfkH7N6xwNvQeI6JXAOlKDnMaR3tDTRQ6UiFlD
         qBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxntLd/ct95PDR+cb+voA3PVWvgQd225Bxlaz4kUMug=;
        b=umIxzoRP/1W3Vhl2jrUF3N4RDHKSFITtR3mAwSoUmmwE5XOjH3hEgHvr+zVETQIUfX
         iVG5XN43tz80Xxp87Ktw9Qj7Dx93nswhlYWSCYu2X+hMKJVDZBHC6KosP00PNqHPeDB/
         6hY0UEtghK7IuL6aQWfjtnnNJuurBTCLmiQpISAS2Bi+aEV6eCmVMTUEnAJ5LahUJJ7l
         jvzpjcaKURz3IW4o+YH/kC/PHXh5401WVmx9zzrXEnXr+G41xBUplZ9Q7wN6ffYkU5AB
         FbmLs0nywucXr2+da2nBQljhJcucKh0yEV25S2ikNZPZsI0DCL322SU4ZJs7cT3m/uZf
         5OqQ==
X-Gm-Message-State: ANoB5plDDWnVczghOgajogeUxH0MaYvGCTt1VM9YgF1Ed6yzp/j/pTnS
	/7dAYaRiRhIdaZ4LrKZYX7A=
X-Google-Smtp-Source: AA0mqf6GmmnIaAXxRDWdzo2mwsMABgOBqxpoLd1EYj+5NiHrODlNUWz1ysL61n9/fPCAgD3u6ATjwg==
X-Received: by 2002:a63:d241:0:b0:439:8688:a98d with SMTP id t1-20020a63d241000000b004398688a98dmr5641021pgi.424.1669002709390;
        Sun, 20 Nov 2022 19:51:49 -0800 (PST)
Received: from localhost.localdomain ([194.5.48.82])
        by smtp.gmail.com with ESMTPSA id o14-20020a170902d4ce00b00186acb14c4asm8476124plg.67.2022.11.20.19.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 19:51:49 -0800 (PST)
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
To: fweisbec@gmail.com,
	tglx@linutronix.de,
	mingo@kernel.org,
	dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
Date: Mon, 21 Nov 2022 11:51:40 +0800
Message-Id: <20221121035140.118651-1-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During CPU-hotplug torture (CONFIG_NO_HZ_FULL=y), if we try to
offline tick_do_timer_cpu, the operation will fail because in
function tick_nohz_cpu_down:
```
if (tick_nohz_full_running && tick_do_timer_cpu == cpu)
      return -EBUSY;
```
Above bug was first discovered in torture tests performed in PPC VM
of Open Source Lab of Oregon State University, and reproducable in RISC-V
and X86-64 (with additional kernel commandline cpu0_hotplug).

In this patch, we avoid offline tick_do_timer_cpu by distribute
the offlining cpu among remaining cpus.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
 include/linux/tick.h        |  1 +
 kernel/time/tick-common.c   |  1 +
 kernel/time/tick-internal.h |  1 -
 kernel/torture.c            | 10 ++++++++++
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/tick.h b/include/linux/tick.h
index bfd571f18cfd..23cc0b205853 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -14,6 +14,7 @@
 #include <linux/rcupdate.h>
 
 #ifdef CONFIG_GENERIC_CLOCKEVENTS
+extern int tick_do_timer_cpu __read_mostly;
 extern void __init tick_init(void);
 /* Should be core only, but ARM BL switcher requires it */
 extern void tick_suspend_local(void);
diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
index 46789356f856..87b9b9afa320 100644
--- a/kernel/time/tick-common.c
+++ b/kernel/time/tick-common.c
@@ -48,6 +48,7 @@ ktime_t tick_next_period;
  *    procedure also covers cpu hotplug.
  */
 int tick_do_timer_cpu __read_mostly = TICK_DO_TIMER_BOOT;
+EXPORT_SYMBOL_GPL(tick_do_timer_cpu);
 #ifdef CONFIG_NO_HZ_FULL
 /*
  * tick_do_timer_boot_cpu indicates the boot CPU temporarily owns
diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
index 649f2b48e8f0..8953dca10fdd 100644
--- a/kernel/time/tick-internal.h
+++ b/kernel/time/tick-internal.h
@@ -15,7 +15,6 @@
 
 DECLARE_PER_CPU(struct tick_device, tick_cpu_device);
 extern ktime_t tick_next_period;
-extern int tick_do_timer_cpu __read_mostly;
 
 extern void tick_setup_periodic(struct clock_event_device *dev, int broadcast);
 extern void tick_handle_periodic(struct clock_event_device *dev);
diff --git a/kernel/torture.c b/kernel/torture.c
index 789aeb0e1159..bccbdd33dda2 100644
--- a/kernel/torture.c
+++ b/kernel/torture.c
@@ -33,6 +33,7 @@
 #include <linux/delay.h>
 #include <linux/stat.h>
 #include <linux/slab.h>
+#include <linux/tick.h>
 #include <linux/trace_clock.h>
 #include <linux/ktime.h>
 #include <asm/byteorder.h>
@@ -358,7 +359,16 @@ torture_onoff(void *arg)
 			schedule_timeout_interruptible(HZ / 10);
 			continue;
 		}
+#ifdef CONFIG_NO_HZ_FULL
+		/* do not offline tick do timer cpu */
+		if (tick_nohz_full_running) {
+			cpu = (torture_random(&rand) >> 4) % maxcpu;
+			if (cpu >= tick_do_timer_cpu)
+				cpu = (cpu + 1) % (maxcpu + 1);
+		} else
+#else
 		cpu = (torture_random(&rand) >> 4) % (maxcpu + 1);
+#endif
 		if (!torture_offline(cpu,
 				     &n_offline_attempts, &n_offline_successes,
 				     &sum_offline, &min_offline, &max_offline))
-- 
2.34.1

