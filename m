Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B388D57491D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 11:32:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk8R44Jtpz3cSh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 19:32:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Eoari3iu;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GdIk5VPt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Eoari3iu;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GdIk5VPt;
	dkim-atps=neutral
X-Greylist: delayed 406 seconds by postgrey-1.36 at boromir; Thu, 14 Jul 2022 19:31:58 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lk8QQ0FP2z3bmT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 19:31:57 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1657790701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0sevqOoO0yR+Fu0jMJ1cbzLRwE84EUc3tWuJ6vmCvvM=;
	b=Eoari3iuC1jFcIVGijSMqtUlKrF1361LD/j8a7LCccDCfrYEc78nQ68QBaQ837f5olhy4t
	rWarVSn2BhomTEUGolZ13yWJJ7ekR1WufOKQzNuw801Y7qB8BKLSulOSDG70kCoyjDcrMY
	0oxmw93g5ibXGmrM2mN6XWtWMqS63cGMR2OMMjvIBo/2QFbkCdS7JBf5YkXeS93MoQ4mjv
	ZHHLpUSTvZbv3Uoj2fugqxP5k9HcDdBdvU7ERsD32FGHiIq7cUz6XwbC3ioh6uAKhlzMuK
	JMZkMQbutAG6mdinYrYWqJIAHPlrVQlJzKrZ3CvwIv992a2a4BjhJQAwb1nwKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1657790701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0sevqOoO0yR+Fu0jMJ1cbzLRwE84EUc3tWuJ6vmCvvM=;
	b=GdIk5VPtOS9TickkMdzGS8uKNwVQLg0vhPJd4QTmzIOZuNRqSAsB0ErgeTVJnaAH82LdTW
	334lYHgzLKE2JxCg==
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 ldufour@linux.ibm.com, pmladek@suse.com, Julia.Lawall@inria.fr,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 lance@osuosl.org, paulmck@kernel.org, rcu@vger.kernel.org
Subject: Re: [PATCH linux-next] powerpc: use raw_smp_processor_id in
 arch_touch_nmi_watchdog
In-Reply-To: <20220714013131.12648-1-zhouzhouyi@gmail.com>
References: <20220714013131.12648-1-zhouzhouyi@gmail.com>
Date: Thu, 14 Jul 2022 11:31:00 +0206
Message-ID: <87tu7k6o7n.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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

On 2022-07-14, Zhouyi Zhou <zhouzhouyi@gmail.com> wrote:
> use raw_smp_processor_id() in arch_touch_nmi_watchdog
> because when called from watchdog, the cpu is preemptible.

I would expect the correct solution is to make it a non-migration
section. Something like the below (untested) patch.

John Ogness

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index bfc27496fe7e..9d34aa809241 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -450,17 +450,23 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 void arch_touch_nmi_watchdog(void)
 {
 	unsigned long ticks = tb_ticks_per_usec * wd_timer_period_ms * 1000;
-	int cpu = smp_processor_id();
+	int cpu;
 	u64 tb;
 
-	if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
+	cpu = get_cpu();
+
+	if (!cpumask_test_cpu(cpu, &watchdog_cpumask)) {
+		goto out;
 		return;
+	}
 
 	tb = get_tb();
 	if (tb - per_cpu(wd_timer_tb, cpu) >= ticks) {
 		per_cpu(wd_timer_tb, cpu) = tb;
 		wd_smp_clear_cpu_pending(cpu);
 	}
+out:
+	put_cpu();
 }
 EXPORT_SYMBOL(arch_touch_nmi_watchdog);
