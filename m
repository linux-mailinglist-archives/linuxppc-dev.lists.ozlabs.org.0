Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B90B743C6D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 11:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfP7z5CdBz2yHb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 20:50:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JOZ8GpxU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JOZ8GpxU; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfP7K15PXz2xWd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 20:50:03 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so1652788pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 02:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=6VB1+HtMoWlmxZg6DmuFfZSYHj4Pa8VXqWmLCaHl0qo=;
 b=JOZ8GpxUgZ76NSL0CvD0lObvGMgZ6a5qqE2oJoQBezuNUR/5WvQ2aLE6b5XPNTKsup
 g+EvFZ+xiWYHNYQbnT+kYuQlcJeyaqbhdX0q8eaYBMJ4wV+oM8y35HSz0xlkNlcSPbtL
 xe083xIdvUTFsS55lI01a/UGAqyszjGiSX+qa3WICivBiwo3GMn8KXdjJ1XL8l5TUxgd
 GbmHPwEnwSdXHziNWaSGIiXPEQuuv5U/c0IzBzKW8qlCgVzOpQcdOF9FaLvcgQcjEjsc
 xx7IKYLIYGykBQeuJjoq1jEoRhULgyto9KxPeP4hVEt+Lv5I3/BL4qBOxkOfbMSGkIGN
 X6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6VB1+HtMoWlmxZg6DmuFfZSYHj4Pa8VXqWmLCaHl0qo=;
 b=k4XRZZbIr0oL6i8i7amrUyarrZssLhdYfFFmnpNMHFHyQ+bSO/J9v7fseyVRpA+kp6
 bXCUUGMn3XPRRek2F3EzjqZmaFB+NpCNvEEPBuTctMCqni/8/cefZzSb5ucz/TVzyAmC
 vThOXt8XSJBnoM3OYCts6QhzAVgQR3wyvFyEvG7PzEcJtf0ClgIjShuh4reyDbtFJoSU
 83pzYtp2dl32sUcKEL6p1tLfz0EgAIlRZYw7xFWhRtF6B0EEPpS6jzKPGf2ToeSf8urw
 qJkVV5ol4uyWULhDvcstYulZQ3ZEYcPO//5jsh3OBaBlNWxkg6bJ/5Xkr5vYisfyWR55
 0EPA==
X-Gm-Message-State: AOAM530UHZOGfr/FQFQHANaWRSmRNFM/pUmT95alnGYNAy+HQtBqMons
 AOaW7CdvnSHGc6P7CfeRtFw=
X-Google-Smtp-Source: ABdhPJzPfg8rYMvyrlgWc5fgBrJcXWAnV63s7xueCC82WvCjt9DHnCM6A8HmRaN6OlfJYcd5q8LYdw==
X-Received: by 2002:a17:90a:5303:: with SMTP id
 x3mr2592573pjh.226.1635328200104; 
 Wed, 27 Oct 2021 02:50:00 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id me3sm3976772pjb.3.2021.10.27.02.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 02:49:59 -0700 (PDT)
Date: Wed, 27 Oct 2021 19:49:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/watchdog: prevent printk and send IPI while
 holding the wd lock
To: benh@kernel.crashing.org, Laurent Dufour <ldufour@linux.ibm.com>,
 mpe@ellerman.id.au, paulus@samba.org
References: <20211026162740.16283-1-ldufour@linux.ibm.com>
 <20211026162740.16283-2-ldufour@linux.ibm.com>
 <1635303699.wgz87uxy4c.astroid@bobo.none>
In-Reply-To: <1635303699.wgz87uxy4c.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1635327848.ktks46hzts.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of October 27, 2021 1:29 pm:
> Excerpts from Laurent Dufour's message of October 27, 2021 2:27 am:
>> When handling the Watchdog interrupt, long processing should not be done
>> while holding the __wd_smp_lock. This prevents the other CPUs to grab it
>> and to process Watchdog timer interrupts. Furhtermore, this could lead t=
o
>> the following situation:
>>=20
>> CPU x detect lockup on CPU y and grab the __wd_smp_lock
>>       in watchdog_smp_panic()
>> CPU y caught the watchdog interrupt and try to grab the __wd_smp_lock
>>       in soft_nmi_interrupt()
>> CPU x wait for CPU y to catch the IPI for 1s in __smp_send_nmi_ipi()
>=20
> CPU y should get the IPI here if it's a NMI IPI (which will be true for=20
>>=3D POWER9 64s).
>=20
> That said, not all platforms support it and the console lock problem
> seems real, so okay.
>=20
>> CPU x will timeout and so has spent 1s waiting while holding the
>>       __wd_smp_lock.
>>=20
>> A deadlock may also happen between the __wd_smp_lock and the console_own=
er
>> 'lock' this way:
>> CPU x grab the console_owner
>> CPU y grab the __wd_smp_lock
>> CPU x catch the watchdog timer interrupt and needs to grab __wd_smp_lock
>> CPU y wants to print something and wait for console_owner
>> -> deadlock
>>=20
>> Doing all the long processing without holding the _wd_smp_lock prevents
>> these situations.
>=20
> The intention was to avoid logs getting garbled e.g., if multiple=20
> different CPUs fire at once.
>=20
> I wonder if instead we could deal with that by protecting the IPI=20
> sending and printing stuff with a trylock, and if you don't get the
> trylock then just return, and you'll come back with the next timer
> interrupt.

Something like this (untested) should basically hold off concurrency on
watchdog panics. It does not serialize output from IPI targets but it
should prevent multiple CPUs trying to send IPIs at once, without=20
holding the lock.

---

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.=
c
index 2ffeb3f8b5a7..3a0db577da56 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -85,6 +85,7 @@ static DEFINE_PER_CPU(u64, wd_timer_tb);
=20
 /* SMP checker bits */
 static unsigned long __wd_smp_lock;
+static unsigned long __wd_printing;
 static cpumask_t wd_smp_cpus_pending;
 static cpumask_t wd_smp_cpus_stuck;
 static u64 wd_smp_last_reset_tb;
@@ -131,10 +132,10 @@ static void wd_lockup_ipi(struct pt_regs *regs)
 	/* Do not panic from here because that can recurse into NMI IPI layer */
 }
=20
-static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
+static void set_cpu_stuck(int cpu, u64 tb)
 {
-	cpumask_or(&wd_smp_cpus_stuck, &wd_smp_cpus_stuck, cpumask);
-	cpumask_andnot(&wd_smp_cpus_pending, &wd_smp_cpus_pending, cpumask);
+	cpumask_set_cpu(cpu, &wd_smp_cpus_stuck);
+	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
 	if (cpumask_empty(&wd_smp_cpus_pending)) {
 		wd_smp_last_reset_tb =3D tb;
 		cpumask_andnot(&wd_smp_cpus_pending,
@@ -142,10 +143,6 @@ static void set_cpumask_stuck(const struct cpumask *cp=
umask, u64 tb)
 				&wd_smp_cpus_stuck);
 	}
 }
-static void set_cpu_stuck(int cpu, u64 tb)
-{
-	set_cpumask_stuck(cpumask_of(cpu), tb);
-}
=20
 static void watchdog_smp_panic(int cpu, u64 tb)
 {
@@ -160,6 +157,10 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 		goto out;
 	if (cpumask_weight(&wd_smp_cpus_pending) =3D=3D 0)
 		goto out;
+	if (__wd_printing)
+		goto out;
+	__wd_printing =3D 1;
+	wd_smp_unlock(&flags);
=20
 	pr_emerg("CPU %d detected hard LOCKUP on other CPUs %*pbl\n",
 		 cpu, cpumask_pr_args(&wd_smp_cpus_pending));
@@ -172,24 +173,31 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 		 * Try to trigger the stuck CPUs, unless we are going to
 		 * get a backtrace on all of them anyway.
 		 */
-		for_each_cpu(c, &wd_smp_cpus_pending) {
+		for_each_online_cpu(c) {
 			if (c =3D=3D cpu)
 				continue;
+			if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending))
+				continue;
+			wd_smp_lock(&flags);
+			if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
+				wd_smp_unlock(&flags);
+				continue;
+			}
+			/* Take the stuck CPU out of the watch group */
+			set_cpu_stuck(cpu, tb);
+			wd_smp_unlock(&flags);
+
 			smp_send_nmi_ipi(c, wd_lockup_ipi, 1000000);
 		}
 	}
=20
-	/* Take the stuck CPUs out of the watch group */
-	set_cpumask_stuck(&wd_smp_cpus_pending, tb);
-
-	wd_smp_unlock(&flags);
-
 	if (sysctl_hardlockup_all_cpu_backtrace)
 		trigger_allbutself_cpu_backtrace();
=20
 	if (hardlockup_panic)
 		nmi_panic(NULL, "Hard LOCKUP");
=20
+	__wd_printing =3D 0;
 	return;
=20
 out:
@@ -204,8 +212,6 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 		if (unlikely(cpumask_test_cpu(cpu, &wd_smp_cpus_stuck))) {
 			struct pt_regs *regs =3D get_irq_regs();
=20
-			wd_smp_lock(&flags);
-
 			pr_emerg("CPU %d became unstuck TB:%lld\n",
 				 cpu, tb);
 			print_irqtrace_events(current);
@@ -214,6 +220,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 			else
 				dump_stack();
=20
+			wd_smp_lock(&flags);
 			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
 			wd_smp_unlock(&flags);
 		}
@@ -263,8 +270,16 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 			wd_smp_unlock(&flags);
 			return 0;
 		}
+		if (__wd_printing) {
+			wd_smp_unlock(&flags);
+			return 0;
+		}
+		__wd_printing =3D 1;
+
 		set_cpu_stuck(cpu, tb);
=20
+		wd_smp_unlock(&flags);
+
 		pr_emerg("CPU %d self-detected hard LOCKUP @ %pS\n",
 			 cpu, (void *)regs->nip);
 		pr_emerg("CPU %d TB:%lld, last heartbeat TB:%lld (%lldms ago)\n",
@@ -274,13 +289,13 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 		print_irqtrace_events(current);
 		show_regs(regs);
=20
-		wd_smp_unlock(&flags);
-
 		if (sysctl_hardlockup_all_cpu_backtrace)
 			trigger_allbutself_cpu_backtrace();
=20
 		if (hardlockup_panic)
 			nmi_panic(regs, "Hard LOCKUP");
+
+		__wd_printing =3D 0;
 	}
 	if (wd_panic_timeout_tb < 0x7fffffff)
 		mtspr(SPRN_DEC, wd_panic_timeout_tb);
