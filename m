Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C449205C07
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 21:43:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rxY42Tb6zDqXq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 05:43:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=epRGMsi9; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rxW73prnzDqX6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:42:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uE1WLCQUPvJEJsvbQwFweWHVAK/38fkHD46qsvvbHvk=; b=epRGMsi9Ah9RMq2mhFHBzYVDr6
 kIfFn6bgGQ6vpQbi5pz8dFZ0uLIT8WssXCX48AfYwh2T7Phe8R3a18rTBByRw0dJgC0XVraaLpIWh
 V5/d+ulw0Y1BYvpMFhA2AVT9b9gFrC3snb3UTYfIy8yjsqzPg8L/izYJxKa1tjtN++2adcmRjZVXV
 mUygc39bMIrv1jqz4r+yhta4Y/xWM863QrUkMjVIxQeWPcrgx/1MBUFUj99jiFuNDLpdY3+HQ4F2Z
 f2mFQWt9ldQ+pHiGOxsFce6QXqmUfZ6ERMeRiMVCMNhbkt7DzU08pT9WJ6NEuRutw5OpdY5ymGP/r
 EiH8eWfA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnonZ-0002xv-Oo; Tue, 23 Jun 2020 19:41:38 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 90E10983A87; Tue, 23 Jun 2020 21:41:32 +0200 (CEST)
Date: Tue, 23 Jun 2020 21:41:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200623194132.GC2483@worktop.programming.kicks-ass.net>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
 <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
 <20200623163730.GA4800@hirez.programming.kicks-ass.net>
 <20200623175957.GA106514@elver.google.com>
 <20200623181232.GB4800@hirez.programming.kicks-ass.net>
 <CANpmjNMmYYa-mVo_Ao_n+9KzwxhGYcb6B6C72yCHyD9sZudDfA@mail.gmail.com>
 <20200623191335.GA86296@elver.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623191335.GA86296@elver.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bigeasy@linutronix.de, the arch/x86 maintainers <x86@kernel.org>,
 heiko.carstens@de.ibm.com, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, "David S. Miller" <davem@davemloft.net>,
 Qian Cai <cai@lca.pw>, "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 sparclinux@vger.kernel.org, linux@armlinux.org.uk,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 09:13:35PM +0200, Marco Elver wrote:
> I see the below report when I boot with your branch + KCSAN and
> PROVE_LOCKING. config attached. Trying to make sense of what's
> happening.

Ah, I was still playing with tip/master + PROVE_LOCKING + KCSAN and
slowly removing parts of that annotation patch to see what would come
unstuck.

I think I just hit a genuine but unavoidable lockdep report on
report_lock.

> ------ >8 ------
> 
> [   10.182354] ------------[ cut here ]------------
> [   10.183058] WARNING: CPU: 7 PID: 136 at kernel/locking/lockdep.c:398 lockdep_hardirqs_on_prepare+0x1c6/0x270
> [   10.184347] Modules linked in:
> [   10.184771] CPU: 7 PID: 136 Comm: systemd-journal Not tainted 5.8.0-rc1+ #3
> [   10.185706] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1 04/01/2014
> [   10.186821] RIP: 0010:lockdep_hardirqs_on_prepare+0x1c6/0x270
> [   10.187594] Code: 75 28 65 48 8b 04 25 28 00 00 00 48 3b 44 24 08 0f 85 b9 00 00 00 48 83 c4 10 5b 41 5e 41 5f c3 65 48 ff 05 d4 24 4e 75 eb d8 <0f> 0b 90 41 c7 86 c4 08 00 00 00 00 00 00 eb c8 e8 65 09 71 01 85
> [   10.190203] RSP: 0018:ffffa7ee802b7848 EFLAGS: 00010017
> [   10.190989] RAX: 0000000000000001 RBX: ffff955e92a34ab0 RCX: 0000000000000001
> [   10.192053] RDX: 0000000000000006 RSI: ffff955e92a34a88 RDI: ffff955e92a341c0
> [   10.193117] RBP: ffffa7ee802b7be8 R08: 0000000000000000 R09: 0000ffffffffffff
> [   10.194186] R10: 0000ffffffffffff R11: 0000ffff8d07e268 R12: 0000000000000001
> [   10.195249] R13: ffffffff8e41bb10 R14: ffff955e92a341c0 R15: 0000000000000001
> [   10.196312] FS:  00007fd6862aa8c0(0000) GS:ffff955e9fd80000(0000) knlGS:0000000000000000
> [   10.197513] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   10.198373] CR2: 00007fd6837dd000 CR3: 0000000812acc001 CR4: 0000000000760ee0
> [   10.199436] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   10.200494] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   10.201554] PKRU: 55555554
> [   10.201967] Call Trace:
> [   10.202348]  ? _raw_spin_unlock_irqrestore+0x40/0x70
> [   10.203093]  trace_hardirqs_on+0x56/0x60			<----- enter IRQ flags tracing code?
> [   10.203686]  _raw_spin_unlock_irqrestore+0x40/0x70  		<----- take report_lock
> [   10.204406]  prepare_report+0x11f/0x150
> [   10.204986]  kcsan_report+0xca/0x6c0 			<----- generating a KCSAN report
> [   10.212669]  kcsan_found_watchpoint+0xe5/0x110

That appears to be warning about a lockdep_recursion underflow, weird.
I'll go stare at it.


