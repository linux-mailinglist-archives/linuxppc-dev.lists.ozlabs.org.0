Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9260C456E49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 12:35:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwZNd45xPz3c4n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 22:35:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dfd0fSIt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dfd0fSIt; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwZJT5T4Lz3bWb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 22:32:09 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id m24so7898176pls.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 03:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bBD6K8XoTAM7ZzTK9IxXY1jKAzzbF/adKK/RRa51jnw=;
 b=dfd0fSItSwBicPk++srUQxWANowTUia0On69KFPdnjJiXE4L+HBc8yV15Q9lP4J34G
 1SDJ8cbGzp82GsjWOBfKmFdKqMongJFjmwWuh2cuOnwScnU7R1tm3kHYa60UGeSY2WFl
 6OvMDp1/oHwpdLpy+Mfrdriez6CeDn11nRcndFutC02vOVUZMd6kwaubzVNjdCt4kk0d
 JuxRrGXJgIKv9yDKMBDJEyHOc3hNB25C0EisT0H5MsQQ1yq4vetUF/SlfeNC04JVp7Pp
 +cGu7mwBNv+Ncr8dkQNQa2nnkv2jSUUHr8EoPr9kXmOHA70Efpmb8kUWDWbxbTQ6CG8z
 sg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bBD6K8XoTAM7ZzTK9IxXY1jKAzzbF/adKK/RRa51jnw=;
 b=LvPU57X5LmLcx3jeAsfMlI13c2WjEY7Hmu4MfGH1c4l17uRkyv64K9sGDPhFD0W6e8
 iiHNwoSyU6pARY3DwXlfCw6QKky8pNnQqp/LhqjKud+pRgdwUdLruDPnczyKQp65sWdo
 56Eo7PMiPXq/Sb4dhpuGpm0jf0egX0gSJV/UpzBINVU4JddM/OYkJnXP9GDqZ03P5wJy
 cNq+k0sQqCKawE+R6oUTD8hYQZEfxj/S0NDYAq+aD1MzDhNk1Gawvsh1sowICXOGHKnl
 ZyDmHmb8yAE7qcOwPE7JImjThBeETMk+fepsyqOOKEISxmxg0kIUgBeC1em2TlM9kp/Q
 ZG8Q==
X-Gm-Message-State: AOAM531bU3oAmJmJRKHQR0UkTnG1bR/4C9V4JMEpNNKucnFrSuEslqiv
 XROwwGidTcnB2/zjgDxNIsHNksa/7aI=
X-Google-Smtp-Source: ABdhPJzF1Ag2X4gJsANTJUSS/F2YgDeoYSVWIukcnGF6+lJCQuyU6cO16szFyVvFpfqhCJyuIOsMGA==
X-Received: by 2002:a17:90a:fe0a:: with SMTP id
 ck10mr3835851pjb.216.1637321527847; 
 Fri, 19 Nov 2021 03:32:07 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-240-2-228.tpgi.com.au. [60.240.2.228])
 by smtp.gmail.com with ESMTPSA id
 g17sm2632626pfv.136.2021.11.19.03.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 03:32:07 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 5/5] powerpc/watchdog: help remote CPUs to flush NMI printk
 output
Date: Fri, 19 Nov 2021 21:31:46 +1000
Message-Id: <20211119113146.752759-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211119113146.752759-1-npiggin@gmail.com>
References: <20211119113146.752759-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
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
This patch requires commit 5d5e4522a7f4 ("printk: restore flushing of
NMI buffers on remote CPUs after NMI backtraces"). If backporting this
to a kernel without commit 93d102f094be ("printk: remove safe buffers"),
then printk_safe_flush() should be used in place of
printk_trigger_flush().

Thanks,
Nick

 arch/powerpc/kernel/watchdog.c | 37 ++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 23745af38d62..bfc27496fe7e 100644
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
@@ -154,6 +155,23 @@ static void wd_lockup_ipi(struct pt_regs *regs)
 	else
 		dump_stack();
 
+	/*
+	 * __wd_nmi_output must be set after we printk from NMI context.
+	 *
+	 * printk from NMI context defers printing to the console to irq_work.
+	 * If that NMI was taken in some code that is hard-locked, then irqs
+	 * are disabled so irq_work will never fire. That can result in the
+	 * hard lockup messages being delayed (indefinitely, until something
+	 * else kicks the console drivers).
+	 *
+	 * Setting __wd_nmi_output will cause another CPU to notice and kick
+	 * the console drivers for us.
+	 *
+	 * xchg is not needed here (it could be a smp_mb and store), but xchg
+	 * gives the memory ordering and atomicity required.
+	 */
+	xchg(&__wd_nmi_output, 1);
+
 	/* Do not panic from here because that can recurse into NMI IPI layer */
 }
 
@@ -227,12 +245,6 @@ static void watchdog_smp_panic(int cpu)
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
 
@@ -337,6 +349,17 @@ static void watchdog_timer_interrupt(int cpu)
 
 	if ((s64)(tb - wd_smp_last_reset_tb) >= (s64)wd_smp_panic_timeout_tb)
 		watchdog_smp_panic(cpu);
+
+	if (__wd_nmi_output && xchg(&__wd_nmi_output, 0)) {
+		/*
+		 * Something has called printk from NMI context. It might be
+		 * stuck, so this this triggers a flush that will get that
+		 * printk output to the console.
+		 *
+		 * See wd_lockup_ipi.
+		 */
+		printk_trigger_flush();
+	}
 }
 
 DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
@@ -386,6 +409,8 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 		print_irqtrace_events(current);
 		show_regs(regs);
 
+		xchg(&__wd_nmi_output, 1); // see wd_lockup_ipi
+
 		if (sysctl_hardlockup_all_cpu_backtrace)
 			trigger_allbutself_cpu_backtrace();
 
-- 
2.23.0

