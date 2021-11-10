Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3932844BA87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 04:05:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpqTY0QXNz2yyf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 14:05:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NNr5/G4A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NNr5/G4A; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpqSv4pCgz2yLd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 14:04:29 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id b13so1853890plg.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 19:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UlTc3b84Y5XFtpxW6N6VQAShslDKIYT2HTCZS1BLsFw=;
 b=NNr5/G4AVzwgOBKiT8FLCxzeC5dxCvSqRtdc0LCJMRGfnxs2z0RpuRxFgr+B96N8rU
 cj7wZ6Cw20G3SLZgI5ZgpHNQ3osEIsw3F7Y35wxdssPkSooU0uzG7fo3svnSLM+Dl5PA
 s4K1pzNG3zen22J2p2grcRZuhfDzrRtwjxlTVrjuk5VwA29lW9YeXRdntVeDrmehMGQG
 gn2wEb6Lp+bBXlcmkUetE5NbQbxFyd4uhGkK0T/mIcAduKtx9NJwkzdSU6xWwhrf1+k6
 S60dCjOKaAfSP0qiTLNG0OIjxK0V77eXC+/ItnJJcBtPv5YpZUR51zelxTtzyA1BwiMr
 Wtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UlTc3b84Y5XFtpxW6N6VQAShslDKIYT2HTCZS1BLsFw=;
 b=Jq6Y6FnOUtK+rg2ibYSL4azL/TdV+kajXNEN0SFaJYcrCr+4b+gfHRO2eIprLX7PBR
 +An8Gp5KmwH8TrYBH3SISMeuY95gniqvayLJMOJ2ZPXBhics444Hl2SzWYwsnZScZgvV
 sgabOlEE2h7l0WDSaW2gj3SHp1D1z3pLYs8f2BYscXuexvUTXp8izIZpJVuQljXYV420
 pDYUfnn5uPIYt8pZ94MpA8n3VuSdjTsbtDp30AI2rf4QciCCxCVXJbLW/OjhBQjZkJOI
 b6gkvpuLw4aL+m/zPgZYLZ63z3MHXwbKRlty4/HGksUvyEX3HlOa88/zk8L6PAKSGPlO
 2H4w==
X-Gm-Message-State: AOAM532VapaDXfAWpkV7mtGcopfpFVKs8snifGCxRJiV80qnD1iSdafN
 5F9PT0JDXn7AMwloKw/DNh332ZWffRyniQ==
X-Google-Smtp-Source: ABdhPJzGMz6Y8QvP8HnSgBBgzqg+vGT8Xwhr84wMZzcwchbsQOISfwLd6D+LyfItkyjz1v7ezQtocQ==
X-Received: by 2002:a17:90a:1b2a:: with SMTP id
 q39mr13329461pjq.219.1636513466140; 
 Tue, 09 Nov 2021 19:04:26 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.146.48.179])
 by smtp.gmail.com with ESMTPSA id t8sm16922387pgk.66.2021.11.09.19.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 19:04:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1] powerpc/watchdog: help remote CPUs to flush NMI printk
 output
Date: Wed, 10 Nov 2021 13:04:16 +1000
Message-Id: <20211110030416.2085103-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The printk layer at the moment does not seem to have a good way to force
flush printk messages that are created in NMI context, except in the
panic path.

NMI-context printk messages normally get to the console with irq_work,
but that won't help if the CPU is stuck with irqs disabled, as can be
the case for hard lockup watchdog messages.

The watchdog currently flushes the printk buffers after detecting a
lockup on remote CPUs, but they may not have processed their NMI IPI
yet by that stage, or they may have self-detected a lockup in which
case they won't go via this NMI IPI path.

Improve the situation by having NMI-context mark a flag if it called
printk, and have watchdog timer interrupts check if that flag was set
and try to flush if it was. Latency is not a big problem because we
were already stuck for a while, just need to try to make sure the
messages eventually make it out.

Cc: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This patch is actually based on top of this one which is planned to go
upstream in rc1/2. https://marc.info/?l=linux-kernel&m=163626070312052&w=2

Prior to commit 93d102f094be that is fixed by the above, we had a printk
flush function with a different name but basically does the same job, so
this patch can be backported, just needs some care. I'm posting it for
review now for feedback so it's ready to go when the printk patch is
upstream.

Thanks,
Nick

 arch/powerpc/kernel/watchdog.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index b6533539386b..a7b6b0691203 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -86,6 +86,7 @@ static DEFINE_PER_CPU(u64, wd_timer_tb);
 /* SMP checker bits */
 static unsigned long __wd_smp_lock;
 static unsigned long __wd_reporting;
+static unsigned long __wd_nmi_output;
 static cpumask_t wd_smp_cpus_pending;
 static cpumask_t wd_smp_cpus_stuck;
 static u64 wd_smp_last_reset_tb;
@@ -154,6 +155,18 @@ static void wd_lockup_ipi(struct pt_regs *regs)
 	else
 		dump_stack();
 
+	/*
+	 * We printk()ed from NMI context, the contents may not get flushed
+	 * if we return to a context with interrupts disabled because
+	 * printk uses irq_work to schedule flushes of NMI output.
+	 * __wd_nmi_output says there has been output from NMI context, so
+	 * other CPUs are recruited to help flush it.
+	 *
+	 * xchg is not needed here (it could be a simple atomic store), but
+	 * it gives the memory ordering and atomicity required.
+	 */
+	xchg(&__wd_nmi_output, 1);
+
 	/* Do not panic from here because that can recurse into NMI IPI layer */
 }
 
@@ -227,12 +240,6 @@ static void watchdog_smp_panic(int cpu)
 		cpumask_clear(&wd_smp_cpus_ipi);
 	}
 
-	/*
-	 * Force flush any remote buffers that might be stuck in IRQ context
-	 * and therefore could not run their irq_work.
-	 */
-	printk_trigger_flush();
-
 	if (hardlockup_panic)
 		nmi_panic(NULL, "Hard LOCKUP");
 
@@ -337,6 +344,14 @@ static void watchdog_timer_interrupt(int cpu)
 
 	if ((s64)(tb - wd_smp_last_reset_tb) >= (s64)wd_smp_panic_timeout_tb)
 		watchdog_smp_panic(cpu);
+
+	if (__wd_nmi_output && xchg(&__wd_nmi_output, 0)) {
+		/*
+		 * This triggers a flush to try get stuck NMI printk output
+		 * from remote CPUs out to the console. See wd_lockup_ipi.
+		 */
+		printk_trigger_flush();
+	}
 }
 
 DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
@@ -386,6 +401,8 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 		print_irqtrace_events(current);
 		show_regs(regs);
 
+		xchg(&__wd_nmi_output, 1); // see wd_lockup_ipi
+
 		if (sysctl_hardlockup_all_cpu_backtrace)
 			trigger_allbutself_cpu_backtrace();
 
-- 
2.23.0

