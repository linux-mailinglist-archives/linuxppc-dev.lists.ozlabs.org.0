Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4105FCAC8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 20:39:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnhJ10nV8z3cf2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 05:38:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=EbB3hbWd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=g+ig=2n=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=EbB3hbWd;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnhH238scz3blw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 05:38:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6EA02B8161D;
	Wed, 12 Oct 2022 18:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42431C433D6;
	Wed, 12 Oct 2022 18:37:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="EbB3hbWd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665599874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mH1YH8iZJgTt44uLDgFWnHBdALElFzORZFNsA0EO3Gg=;
	b=EbB3hbWdmITNqmE0mJo7NoeYeL+vhhWWjJ1jRsIZFYdkbXbvzAsb5seUub34Yf1R0k46jJ
	MT07mlWNgGZ2vWu64irvQcO4t5uVkJt/zSyl6s+TAd0rh75mNEO4edUvXBYGIca6F+9oq1
	/w9XfndFs6HV4aiAlur8+ElMZQ0An0M=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6d3f2353 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 12 Oct 2022 18:37:54 +0000 (UTC)
Date: Wed, 12 Oct 2022 12:37:50 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Message-ID: <Y0cJfoPLGeuzm/gQ@zx2c4.com>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net>
 <Y0biBtCUtc2mowbQ@zx2c4.com>
 <20221012164452.GA2990467@roeck-us.net>
 <Y0b3ZsTRHWG6jGK8@zx2c4.com>
 <20221012174826.GB2995920@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221012174826.GB2995920@roeck-us.net>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, aneesh.kumar@linux.ibm.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022 at 10:48:26AM -0700, Guenter Roeck wrote:
> > I've also managed to not hit this bug a few times. When it triggers,
> > after "kprobes: kprobe jump-optimization is enabled. All kprobes are
> > optimized if possible.", there's a long hang - tens seconds before it
> > continues. When it doesn't trigger, there's no hang at that point in the
> > boot process.
> > 
> 
> That probably explains why my attempts to bisect the problem were
> unsuccessful.

So I just did this:

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 2fe28eeb2f38..2d70bc09db7e 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1212,6 +1212,7 @@ static void __cold try_to_generate_entropy(void)
        struct entropy_timer_state stack;
        unsigned int i, num_different = 0;
        unsigned long last = random_get_entropy();
+       return;

        for (i = 0; i < NUM_TRIAL_SAMPLES - 1; ++i) {
                stack.entropy = random_get_entropy();

And then ran it, and now we get the lockup from the idle process:

udhcpc: started, v1.33.0
udhcpc: sending discover
watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper/0:0]
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.0.0-28380-gde492c83cae0-dirty #10
Hardware name: PowerMac3,1 PPC970FX 0x3c0301 PowerMac
NIP:  c0000000000300f8 LR: c0000000000304e8 CTR: c00000000001a410
REGS: c0000000028c79a8 TRAP: 0900   Not tainted  (6.0.0-28380-gde492c83cae0-dirty)
MSR:  800000000000b032 <SF,EE,FP,ME,IR,DR,RI>  CR: 24088442  XER: 00000000
IRQMASK: 0
GPR00: c0000000000304e8 c0000000028c7b30 c000000001435500 c0000000028c79a8
GPR04: c0000000013366c0 0000000000000000 000000000010029c 0000000000000000
GPR08: c000000002d3bbb0 0000000000000000 c000000002883d00 c000000002915500
GPR12: 0000000044088442 c000000002e00000 0000000000000007 0000000002295698
GPR16: 00000000039400e8 0000000002295258 0000000002295660 00000000022953d0
GPR20: 0000000002295b10 00000000022b34d0 0000000002295b38 0000000003945500
GPR24: 0000000003945500 0000000000080000 c000000002883d80 c000000002883d00
GPR28: c00000000290d0c0 0000000000000001 c00000000290d018 c00000000290cc78
NIP [c0000000000300f8] .replay_soft_interrupts+0x28/0x2d0
LR [c0000000000304e8] .arch_local_irq_restore+0x148/0x1a0
Call Trace:
[c0000000028c7b30] [c0000000000304e8] .arch_local_irq_restore+0x148/0x1a0 (unreliable)
[c0000000028c7bb0] [c00000000001a388] .arch_cpu_idle+0xb8/0x140
[c0000000028c7c30] [c000000000fd4940] .default_idle_call+0x80/0xc8
[c0000000028c7ca0] [c000000000148480] .do_idle+0x150/0x1a0
[c0000000028c7d50] [c000000000148748] .cpu_startup_entry+0x38/0x40
[c0000000028c7dd0] [c0000000000113a8] .rest_init+0x168/0x170
[c0000000028c7e60] [c000000002004224] .arch_post_acpi_subsys_init+0x0/0x24
[c0000000028c7ed0] [c000000002004ba8] .start_kernel+0x8d0/0x924
[c0000000028c7f90] [c00000000000d4ac] start_here_common+0x1c/0x20
Instruction dump:
60000000 60000000 7c0802a6 f8010010 f821fe01 60000000 60000000 38610078
e92d0af8 f92101f8 39200000 4803a491 <60000000> 39200000 e9410180 f92101b0
Kernel panic - not syncing: softlockup: hung tasks
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G             L     6.0.0-28380-gde492c83cae0-dirty #10
Hardware name: PowerMac3,1 PPC970FX 0x3c0301 PowerMac
Call Trace:
[c0000000028c74a0] [c000000000f93b90] .dump_stack_lvl+0x7c/0xc4 (unreliable)
[c0000000028c7530] [c0000000000d2a58] .panic+0x180/0x438
[c0000000028c75e0] [c000000000232424] .watchdog_timer_fn+0x3a4/0x410
[c0000000028c76a0] [c0000000001cb964] .__hrtimer_run_queues+0x1f4/0x590
[c0000000028c77a0] [c0000000001cc354] .hrtimer_interrupt+0x134/0x300
[c0000000028c7860] [c000000000021cd4] .timer_interrupt+0x1c4/0x5d0
[c0000000028c7930] [c0000000000302f8] .replay_soft_interrupts+0x228/0x2d0
[c0000000028c7b30] [c0000000000304e8] .arch_local_irq_restore+0x148/0x1a0
[c0000000028c7bb0] [c00000000001a388] .arch_cpu_idle+0xb8/0x140
[c0000000028c7c30] [c000000000fd4940] .default_idle_call+0x80/0xc8
[c0000000028c7ca0] [c000000000148480] .do_idle+0x150/0x1a0
[c0000000028c7d50] [c000000000148748] .cpu_startup_entry+0x38/0x40
[c0000000028c7dd0] [c0000000000113a8] .rest_init+0x168/0x170
[c0000000028c7e60] [c000000002004224] .arch_post_acpi_subsys_init+0x0/0x24
[c0000000028c7ed0] [c000000002004ba8] .start_kernel+0x8d0/0x924
[c0000000028c7f90] [c00000
