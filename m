Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DA74F6A70
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 21:50:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYZrH6Tmzz3bfR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 05:50:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mYUVLTE4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=srs0=n8qq=uq=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mYUVLTE4; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYZqb17Z9z2xnP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 05:50:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7342B824E3;
 Wed,  6 Apr 2022 19:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9C4C385A1;
 Wed,  6 Apr 2022 19:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649274612;
 bh=SoJjyI/WBNcM0lAqVjTmAxb1lSDkriU59z6nZNwY+C4=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=mYUVLTE4Rp5cU84Q7lo5MjOlwGr5eGPBjKiS19vsHcAUXqflg3FKq6AwDkjioAI0v
 kVRTXnw40WrrpIruxJu1eRzgKy/Yggqg1Avl4sFCv/Cxto2gicTqrJOMHF7hQWiG/P
 TzeusNF7iV9wuq4MCxdD1SpiWc9UJDUE+jDsl2sJ7e+ov7uBZv7zwBWvYak7bUlX+k
 d80BIocC2CFzWcqEFnGMxChh8z9x9J0fx/n9V2ZT/4dmnJQUFydJU2dfnDnQN9gw+C
 agUzP5m8hOFxCfZog3YavSOSyQLjwzUlaa0GHeFDGLIzvXTnZOP268ocaeB8GfGwCk
 yh3uP28DqL2Tg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id ECB2D5C0B85; Wed,  6 Apr 2022 12:50:11 -0700 (PDT)
Date: Wed, 6 Apr 2022 12:50:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: rcu_sched self-detected stall on CPU
Message-ID: <20220406195011.GP4285@paulmck-ThinkPad-P17-Gen-1>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2zhZaN0+KqP7oMoyXTSkDhLjZwWvnj7coa1ZVve9M+jsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABZP2zhZaN0+KqP7oMoyXTSkDhLjZwWvnj7coa1ZVve9M+jsQ@mail.gmail.com>
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
Reply-To: paulmck@kernel.org
Cc: rcu <rcu@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 07, 2022 at 02:25:59AM +0800, Zhouyi Zhou wrote:
> Hi Paul
> 
> On Thu, Apr 7, 2022 at 1:00 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Wed, Apr 06, 2022 at 05:31:10PM +0800, Zhouyi Zhou wrote:
> > > Hi
> > >
> > > I can reproduce it in a ppc virtual cloud server provided by Oregon
> > > State University.  Following is what I do:
> > > 1) curl -l https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-5.18-rc1.tar.gz
> > > -o linux-5.18-rc1.tar.gz
> > > 2) tar zxf linux-5.18-rc1.tar.gz
> > > 3) cp config linux-5.18-rc1/.config
> > > 4) cd linux-5.18-rc1
> > > 5) make vmlinux -j 8
> > > 6) qemu-system-ppc64 -kernel vmlinux -nographic -vga none -no-reboot
> > > -smp 2 (QEMU 4.2.1)
> > > 7) after 12 rounds, the bug got reproduced:
> > > (http://154.223.142.244/logs/20220406/qemu.log.txt)
> >
> > Just to make sure, are you both seeing the same thing?  Last I knew,
> > Zhouyi was chasing an RCU-tasks issue that appears only in kernels
> > built with CONFIG_PROVE_RCU=y, which Miguel does not have set.  Or did
> > I miss something?
> We are both seeing the same thing, I work in parallel.
> 1) I am chasing the RCU-tasks issue which I will report my discoveries
> to you later.
> 2) I am reproducing the RCU CPU stall issue reported by Miguel
> yesterday. Lucky enough, I can reproduce it and thanks to Oregon State
> University who provides me with the environment! I am also very
> interested in helping chase the reason behind the issue. Lucky enough
> the issue can be reproduced in a non-hardware accelerated qemu
> environment so that I can give a hand.

How quickly does this happen?  The console log that Miguel sent had
within 30 seconds of boot.  If it always happens this quickly, it
should be possible to do a bisection, especially when running qemu.
The trick would be to boot a given commit until you see it fail on the
one hand or until it boots successfully 70 times.  In the latter case,
report success to "git bisect", in the former case report failure.
If the one-out-of-5 failure rate is accurate, you will have a 99.997%
chance of reporting the correct failure state on each step, resulting
in better than a 99.9% chance of converging on the correct commit.

Of course, you would hit the preceding commit hard to double-check.

Does this seem reasonable?  Or am I being overly optimstic on the
failure times?

							Thanx, Paul

> Thanks
> Zhouyi
> >
> > Miguel is instead seeing an RCU CPU stall warning where RCU's grace-period
> > kthread slept for three milliseconds, but did not wake up for more than
> > 20 seconds.  This kthread would normally have awakened on CPU 1, but
> > CPU 1 looks to me to be very unhealthy, as can be seen in your console
> > output below (but maybe my idea of what is healthy for powerpc systems
> > is outdated).  Please see also the inline annotations.
> >
> > Thoughts from the PPC guys?
> >
> >                                                         Thanx, Paul
> >
> > ------------------------------------------------------------------------
> >
> > [   21.186912] rcu: INFO: rcu_sched self-detected stall on CPU
> > [   21.187331] rcu:     1-...!: (4712629 ticks this GP) idle=2c1/0/0x3 softirq=8/8 fqs=0
> > [   21.187529]  (t=21000 jiffies g=-1183 q=3)
> > [   21.187681] rcu: rcu_sched kthread timer wakeup didn't happen for 20997 jiffies! g-1183 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
> >
> >         The grace-period kthread is still asleep (->state=0x402).
> >         This indicates that the three-jiffy timer has somehow been
> >         prevented from expiring for almost a full 21 seconds.  Of course,
> >         if timers don't work, RCU cannot work.
> >
> > [   21.187770] rcu:     Possible timer handling issue on cpu=1 timer-softirq=1
> > [   21.187927] rcu: rcu_sched kthread starved for 21001 jiffies! g-1183 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=1
> > [   21.188019] rcu:     Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
> > [   21.188087] rcu: RCU grace-period kthread stack dump:
> > [   21.188196] task:rcu_sched       state:I stack:    0 pid:   10 ppid:     2 flags:0x00000800
> > [   21.188453] Call Trace:
> > [   21.188525] [c0000000061e78a0] [c0000000061e78e0] 0xc0000000061e78e0 (unreliable)
> > [   21.188900] [c0000000061e7a90] [c000000000017210] __switch_to+0x250/0x310
> > [   21.189210] [c0000000061e7b00] [c0000000003ed660] __schedule+0x210/0x660
> > [   21.189315] [c0000000061e7b80] [c0000000003edb14] schedule+0x64/0x110
> > [   21.189387] [c0000000061e7bb0] [c0000000003f6648] schedule_timeout+0x1d8/0x390
> > [   21.189473] [c0000000061e7c80] [c00000000011111c] rcu_gp_fqs_loop+0x2dc/0x3d0
> > [   21.189555] [c0000000061e7d30] [c0000000001144ec] rcu_gp_kthread+0x13c/0x160
> > [   21.189633] [c0000000061e7dc0] [c0000000000c1770] kthread+0x110/0x120
> > [   21.189714] [c0000000061e7e10] [c00000000000c9e4] ret_from_kernel_thread+0x5c/0x64
> >
> >         The above stack trace is expected behavior when the RCU
> >         grace-period kthread is waiting to do its next FQS scan.
> >
> > [   21.189938] rcu: Stack dump where RCU GP kthread last ran:
> >
> >         And here is the stalled CPU, which also happens to be the CPU
> >         that RCU last ran on:
> >
> > [   21.189992] Task dump for CPU 1:
> > [   21.190059] task:swapper/1       state:R  running task     stack:    0 pid:    0 ppid:     1 flags:0x00000804
> > [   21.190169] Call Trace:
> > [   21.190194] [c0000000061ef2d0] [c0000000000c9a40] sched_show_task+0x180/0x1c0 (unreliable)
> > [   21.190278] [c0000000061ef340] [c000000000116ca0] rcu_check_gp_kthread_starvation+0x16c/0x19c
> > [   21.190370] [c0000000061ef3c0] [c000000000114f7c] rcu_sched_clock_irq+0x7ec/0xaf0
> > [   21.190448] [c0000000061ef4b0] [c000000000120fdc] update_process_times+0xbc/0x140
> > [   21.190524] [c0000000061ef4f0] [c000000000136a24] tick_nohz_handler+0xf4/0x1b0
> > [   21.190608] [c0000000061ef540] [c00000000001c828] timer_interrupt+0x148/0x2d0
> > [   21.190699] [c0000000061ef590] [c0000000000098e8] decrementer_common_virt+0x208/0x210
> > [   21.190837] --- interrupt: 900 at arch_local_irq_restore+0x168/0x170
> >
> >         Up through this point is just the stack trace of the the
> >         code doing the stack dump that the RCU CPU stall warning code
> >         asked for.
> >
> > [   21.190941] NIP:  c000000000013608 LR: c0000000003f8114 CTR: c0000000000dc630
> >
> >         This NIP does not look at all good to me.  But I freely confess
> >         that I am out of date on what Power machines do.
> >
> > [   21.191031] REGS: c0000000061ef600 TRAP: 0900   Not tainted  (5.18.0-rc1)
> > [   21.191109] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22000202  XER: 00000000
> > [   21.191274] CFAR: 0000000000000000 IRQMASK: 0
> > [   21.191274] GPR00: c00000000009c368 c0000000061ef8a0 c00000000116a700 0000000000000000
> > [   21.191274] GPR04: 0000000000000000 0000000000000000 000000001ee30000 ffffffffffffffff
> > [   21.191274] GPR08: 000000001ee30000 0000000000000000 0000000000008002 7265677368657265
> > [   21.191274] GPR12: c0000000000dc630 c00000001ffe5800 0000000000000000 0000000000000000
> > [   21.191274] GPR16: 0000000000000282 0000000000000000 0000000000000000 c0000000061eff00
> > [   21.191274] GPR20: 0000000000000000 0000000000000001 c0000000061b9f80 c000000001195a10
> > [   21.191274] GPR24: c000000001193a00 00000000fffb6cc4 000000000000000a c0000000010721e8
> > [   21.191274] GPR28: c000000001076800 c000000001070380 c0000000010716d8 c0000000061b9f80
> > [   21.191932] NIP [c000000000013608] arch_local_irq_restore+0x168/0x170
> > [   21.192024] LR [c0000000003f8114] __do_softirq+0xd4/0x2ec
> > [   21.192118] --- interrupt: 900
> > [   21.192158] [c0000000061ef8a0] [c0000000061b9f80] 0xc0000000061b9f80 (unreliable)
> > [   21.192227] [c0000000061ef9b0] [c00000000009c368] irq_exit+0xc8/0x110
> > [   21.192307] [c0000000061ef9d0] [c00000000001c858] timer_interrupt+0x178/0x2d0
> > [   21.192397] [c0000000061efa20] [c0000000000098e8] decrementer_common_virt+0x208/0x210
> > [   21.192495] --- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
> > [   21.192566] NIP:  c000000000072988 LR: c000000000074fa8 CTR: c000000000074f10
> > [   21.192615] REGS: c0000000061efa90 TRAP: 0900   Not tainted  (5.18.0-rc1)
> > [   21.192659] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28000202  XER: 00000000
> > [   21.192755] CFAR: 0000000000000000 IRQMASK: 0
> > [   21.192755] GPR00: 0000000028000202 c0000000061efd30 c00000000116a700 0000000000000000
> > [   21.192755] GPR04: c00000001fea0280 ffffffffffffffff 0000000001f40000 000000019d088fcf
> > [   21.192755] GPR08: 000000001ee30000 c00000001ffe5400 0000000000000001 0000000100000000
> > [   21.192755] GPR12: c000000000074f10 c00000001ffe5800 0000000000000000 0000000000000000
> > [   21.192755] GPR16: 0000000000000000 0000000000000000 0000000000000000 c0000000061eff00
> > [   21.192755] GPR20: c00000000003d440 0000000000000001 c000000001195b30 c000000001195a10
> > [   21.192755] GPR24: 0000000000080000 c0000000061ba000 c000000001195a98 0000000000000001
> > [   21.192755] GPR28: 0000000000000001 c0000000010716d0 c0000000010716d8 c0000000010716d0
> > [   21.193290] NIP [c000000000072988] plpar_hcall_norets_notrace+0x18/0x2c
> > [   21.193363] LR [c000000000074fa8] pseries_lpar_idle+0x98/0x1b0
> > [   21.193428] --- interrupt: 900
> > [   21.193457] [c0000000061efd30] [0000000000000001] 0x1 (unreliable)
> > [   21.193512] [c0000000061efdb0] [c000000000018b54] arch_cpu_idle+0x44/0x180
> > [   21.193590] [c0000000061efde0] [c0000000003f75bc] default_idle_call+0x4c/0x7c
> > [   21.193679] [c0000000061efe00] [c0000000000e1384] do_idle+0x114/0x1e0
> > [   21.193747] [c0000000061efe60] [c0000000000e1664] cpu_startup_entry+0x34/0x40
> > [   21.193901] [c0000000061efe90] [c00000000003f044] start_secondary+0x624/0xa00
> > [   21.194002] [c0000000061eff90] [c00000000000cd54] start_secondary_prolog+0x10/0x14
> > [   21.194245] Task dump for CPU 1:
> > [   21.194284] task:swapper/1       state:R  running task     stack:    0 pid:    0 ppid:     1 flags:0x00000804
> > [   21.194374] Call Trace:
> > [   21.194400] [c0000000061ef2b0] [c0000000000c9a40] sched_show_task+0x180/0x1c0 (unreliable)
> > [   21.194479] [c0000000061ef320] [c000000000116df8] rcu_dump_cpu_stacks+0x128/0x188
> > [   21.194567] [c0000000061ef3c0] [c000000000114f9c] rcu_sched_clock_irq+0x80c/0xaf0
> > [   21.194642] [c0000000061ef4b0] [c000000000120fdc] update_process_times+0xbc/0x140
> > [   21.194712] [c0000000061ef4f0] [c000000000136a24] tick_nohz_handler+0xf4/0x1b0
> > [   21.194828] [c0000000061ef540] [c00000000001c828] timer_interrupt+0x148/0x2d0
> > [   21.194942] [c0000000061ef590] [c0000000000098e8] decrementer_common_virt+0x208/0x210
> > [   21.195035] --- interrupt: 900 at arch_local_irq_restore+0x168/0x170
> > [   21.195104] NIP:  c000000000013608 LR: c0000000003f8114 CTR: c0000000000dc630
> > [   21.195152] REGS: c0000000061ef600 TRAP: 0900   Not tainted  (5.18.0-rc1)
> > [   21.195199] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22000202  XER: 00000000
> > [   21.195296] CFAR: 0000000000000000 IRQMASK: 0
> > [   21.195296] GPR00: c00000000009c368 c0000000061ef8a0 c00000000116a700 0000000000000000
> > [   21.195296] GPR04: 0000000000000000 0000000000000000 000000001ee30000 ffffffffffffffff
> > [   21.195296] GPR08: 000000001ee30000 0000000000000000 0000000000008002 7265677368657265
> > [   21.195296] GPR12: c0000000000dc630 c00000001ffe5800 0000000000000000 0000000000000000
> > [   21.195296] GPR16: 0000000000000282 0000000000000000 0000000000000000 c0000000061eff00
> > [   21.195296] GPR20: 0000000000000000 0000000000000001 c0000000061b9f80 c000000001195a10
> > [   21.195296] GPR24: c000000001193a00 00000000fffb6cc4 000000000000000a c0000000010721e8
> > [   21.195296] GPR28: c000000001076800 c000000001070380 c0000000010716d8 c0000000061b9f80
> > [   21.195850] NIP [c000000000013608] arch_local_irq_restore+0x168/0x170
> > [   21.195944] LR [c0000000003f8114] __do_softirq+0xd4/0x2ec
> > [   21.196027] --- interrupt: 900
> > [   21.196056] [c0000000061ef8a0] [c0000000061b9f80] 0xc0000000061b9f80 (unreliable)
> > [   21.196119] [c0000000061ef9b0] [c00000000009c368] irq_exit+0xc8/0x110
> > [   21.196192] [c0000000061ef9d0] [c00000000001c858] timer_interrupt+0x178/0x2d0
> > [   21.196282] [c0000000061efa20] [c0000000000098e8] decrementer_common_virt+0x208/0x210
> > [   21.196373] --- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
> > [   21.196439] NIP:  c000000000072988 LR: c000000000074fa8 CTR: c000000000074f10
> > [   21.196489] REGS: c0000000061efa90 TRAP: 0900   Not tainted  (5.18.0-rc1)
> > [   21.196534] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28000202  XER: 00000000
> > [   21.196627] CFAR: 0000000000000000 IRQMASK: 0
> > [   21.196627] GPR00: 0000000028000202 c0000000061efd30 c00000000116a700 0000000000000000
> > [   21.196627] GPR04: c00000001fea0280 ffffffffffffffff 0000000001f40000 000000019d088fcf
> > [   21.196627] GPR08: 000000001ee30000 c00000001ffe5400 0000000000000001 0000000100000000
> > [   21.196627] GPR12: c000000000074f10 c00000001ffe5800 0000000000000000 0000000000000000
> > [   21.196627] GPR16: 0000000000000000 0000000000000000 0000000000000000 c0000000061eff00
> > [   21.196627] GPR20: c00000000003d440 0000000000000001 c000000001195b30 c000000001195a10
> > [   21.196627] GPR24: 0000000000080000 c0000000061ba000 c000000001195a98 0000000000000001
> > [   21.196627] GPR28: 0000000000000001 c0000000010716d0 c0000000010716d8 c0000000010716d0
> > [   21.197168] NIP [c000000000072988] plpar_hcall_norets_notrace+0x18/0x2c
> > [   21.197239] LR [c000000000074fa8] pseries_lpar_idle+0x98/0x1b0
> > [   21.197305] --- interrupt: 900
> > [   21.197333] [c0000000061efd30] [0000000000000001] 0x1 (unreliable)
> > [   21.197390] [c0000000061efdb0] [c000000000018b54] arch_cpu_idle+0x44/0x180
> > [   21.197470] [c0000000061efde0] [c0000000003f75bc] default_idle_call+0x4c/0x7c
> > [   21.197556] [c0000000061efe00] [c0000000000e1384] do_idle+0x114/0x1e0
> > [   21.197620] [c0000000061efe60] [c0000000000e1664] cpu_startup_entry+0x34/0x40
> > [   21.197696] [c0000000061efe90] [c00000000003f044] start_secondary+0x624/0xa00
> > [   21.197820] [c0000000061eff90] [c00000000000cd54] start_secondary_prolog+0x10/0x1I4
