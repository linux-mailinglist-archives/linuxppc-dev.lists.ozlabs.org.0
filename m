Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3A03DF18B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 17:31:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfJjz5LcKz3cNc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 01:31:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OqjOI/Fb;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+B9KGpXL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=OqjOI/Fb; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=+B9KGpXL; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfJjW2zFgz2yNx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 01:30:39 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1628004633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JYAidDTtZlwD0eAmDJGiwHLKb2zrViR5iopfW/47ycc=;
 b=OqjOI/FbmrK18S3ZvolMVu6MnmqMbOBo9jrdeXX3wxV7sqCVpdjTRar0H7i0ExNzY5bR/X
 PdP6sVQRAPdOYEMbxPgbQpXhiP/YVGhgrClPXAfjkOLUjk6nKsl2opF1S0+2EWZi8fdTVQ
 OyF18c9yESpVQ1ED39gaPl7oFtEgs51vYZX7ouRviNrfeq89w+mkATGMlPRG116iVVa1sP
 aAVNstXlI6g5+Od+hSIym7JtGUKKUBCybkbw6Tq9/SDXhAX0rTcnPPRvsN0GraIj3Cb00c
 qPHfZgWp/+9IGkAMNPiGT1MYOTT8EI5B06YAqc4VThaM1sSv5Bxo5RItB4a/cg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1628004633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JYAidDTtZlwD0eAmDJGiwHLKb2zrViR5iopfW/47ycc=;
 b=+B9KGpXLz+WiAwY5HjTHSwrgLkU2AO4ktjbvjOzrUjWKgCCoYGx8mHsRRMGq0543zI3G5c
 yoN+x2AyyiqMdSCw==
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH printk v1 03/10] kgdb: delay roundup if holding printk
 cpulock
In-Reply-To: <20210803142558.cz7apumpgijs5y4y@maple.lan>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
 <20210803142558.cz7apumpgijs5y4y@maple.lan>
Date: Tue, 03 Aug 2021 17:36:32 +0206
Message-ID: <87tuk635rb.fsf@jogness.linutronix.de>
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H.
 Peter Anvin" <hpa@zytor.com>, Chengyang Fan <cy.fan@huawei.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, kgdb-bugreport@lists.sourceforge.net,
 Petr Mladek <pmladek@suse.com>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-08-03, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
>> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
>> during cpu roundup. This will conflict with the printk cpulock.
>
> When the full vision is realized what will be the purpose of the printk
> cpulock?
>
> I'm asking largely because it's current role is actively unhelpful
> w.r.t. kdb. It is possible that cautious use of in_dbg_master() might
> be a better (and safer) solution. However it sounds like there is a
> larger role planned for the printk cpulock...

The printk cpulock is used as a synchronization mechanism for
implementing atomic consoles, which need to be able to safely interrupt
the console write() activity at any time and immediately continue with
their own printing. The ultimate goal is to move all console printing
into per-console dedicated kthreads, so the primary function of the
printk cpulock is really to immediately _stop_ the CPU/kthread
performing write() in order to allow write_atomic() (from any context on
any CPU) to safely and reliably take over.

Atomic consoles are actually quite similar to the kgdb_io ops. For
example, comparing:

serial8250_console_write_atomic() + serial8250_console_putchar_locked()

with

serial8250_put_poll_char()

The difference is that serial8250_console_write_atomic() is line-based
and synchronizing with serial8250_console_write() so that if the kernel
crashes while outputing to the console, write() can be interrupted by
write_atomic() and cleanly formatted crash data can be output.

Also serial8250_put_poll_char() is calling into __pm_runtime_resume(),
which includes a spinlock and possibly sleeping. This would not be
acceptable for atomic consoles. Although, as Andy pointed out [0], I
will need to figure out how to deal with suspended consoles. Or just
implement a policy that registered atomic consoles may never be
suspended.

I had not considered merging kgdb_io ops with atomic console ops. But
now that I look at it more closely, there may be some useful overlap. I
will consider this. Thank you for this idea.

>> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
>> index 3d0c933937b4..1b546e117f10 100644
>> --- a/kernel/printk/printk.c
>> +++ b/kernel/printk/printk.c
>> @@ -214,6 +215,7 @@ int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
>>  #ifdef CONFIG_SMP
>>  static atomic_t printk_cpulock_owner = ATOMIC_INIT(-1);
>>  static atomic_t printk_cpulock_nested = ATOMIC_INIT(0);
>> +static unsigned int kgdb_cpu = -1;
>
> Is this the flag to provoke retriggering? It appears to be a write-only
> variable (at least in this patch). How is it consumed?

Critical catch! Thank you. I am quite unhappy to see these hunks were
accidentally dropped when generating this series.

@@ -3673,6 +3675,9 @@ EXPORT_SYMBOL(__printk_cpu_trylock);
  */
 void __printk_cpu_unlock(void)
 {
+	bool trigger_kgdb = false;
+	unsigned int cpu;
+
 	if (atomic_read(&printk_cpulock_nested)) {
 		atomic_dec(&printk_cpulock_nested);
 		return;
@@ -3683,6 +3688,12 @@ void __printk_cpu_unlock(void)
 	 * LMM(__printk_cpu_unlock:A)
 	 */
 
+	cpu = smp_processor_id();
+	if (kgdb_cpu == cpu) {
+		trigger_kgdb = true;
+		kgdb_cpu = -1;
+	}
+
 	/*
 	 * Guarantee loads and stores from this CPU when it was the
 	 * lock owner are visible to the next lock owner. This pairs
@@ -3703,6 +3714,21 @@ void __printk_cpu_unlock(void)
 	 */
 	atomic_set_release(&printk_cpulock_owner,
 			   -1); /* LMM(__printk_cpu_unlock:B) */
+
+	if (trigger_kgdb) {
+		pr_warn("re-triggering kgdb roundup for CPU#%d\n", cpu);
+		kgdb_roundup_cpu(cpu);
+	}
 }
 EXPORT_SYMBOL(__printk_cpu_unlock);

John Ogness

[0] https://lore.kernel.org/lkml/YQlKAeXS9MPmE284@smile.fi.intel.com
