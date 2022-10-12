Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194ED5FC977
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 18:50:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mndtm6LtJz3bls
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 03:50:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MGKJeoGa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MGKJeoGa;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mndss1GBVz2xG8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 03:49:36 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id p14so12711337pfq.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 09:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9qrjjBbM1UMLpM0hRZ+Jb2A7nD4HhHAvZYWBR2w6NQ=;
        b=MGKJeoGaIP1TfEtKatCtL7CGrRBpr8cXaEDIm0tSltHxR4/WXZ2+QewbhiBSJgKY6T
         EeA17tzCu6pdoyE1r6g/n5zal01XkVyhx0W2aOjMno9rRgDBsux0dfgGZfkynmz3Efiy
         OMAWi+me6zSvR1RXXtBtPsYiGkhzI1QK2hXoZ1N6oMByI81KNC5nn9W17hFUy5fIY2y8
         lfO2zu/YXQotLlXKDN99jst+06W+22wweOz5pcyO2ULdg2LBGeBWBQUpxnAlkFwdUTPl
         xcePQmC8qQcWwPmy0y6cO8hDq+qUns51SSdB51QlfS+bBKp4FtRQ23OM73Ck9SA4Dpht
         VuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9qrjjBbM1UMLpM0hRZ+Jb2A7nD4HhHAvZYWBR2w6NQ=;
        b=2YxFI6CqHH6Ulzy+Rmhz8OrYI0HcsE7/cN7z5EYimhYUD0zYglPR9FTlNwtZl2lDvc
         1GadLhQfXjByoNg8qsr5tJ8xHF/QjagX2vSLTbNAeOtZVYlczB0NmR8tsheRQDaH9GGW
         QqNsGvI0nq3eU25zfjpjOYr/YvxAEg8ZU+CPI2v1p3PWTny6OckzsvGwCawhuM+V45Z1
         01xbW12xKo6QpdGmotf5wcyui65Ksd8XVdQTQSmYdceMGHmyQ8ss5CqvA2hMCw0w5ciP
         I5+Z47zTeeSF0gbixYVUNdfZP7El1tZjTw1NvCpoYHOhlxEfGEy0Mm73GYWnYWj3JBvl
         pzVQ==
X-Gm-Message-State: ACrzQf0In55kRTpuGega3G8vERZb9BUYP0fsn8D08NDGHcAEkmpj3ixC
	5HicIjUOt5jytV+WcEWqw3g=
X-Google-Smtp-Source: AMsMyM5/JurpmI4uq83Wm77V+7LFNGiIpwFTMQac8uw6EQYJIRkY1mTjiQuAFmtacLol+44RXVjn7g==
X-Received: by 2002:a65:6ccd:0:b0:439:2033:6ee with SMTP id g13-20020a656ccd000000b00439203306eemr26806203pgw.271.1665593373887;
        Wed, 12 Oct 2022 09:49:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w72-20020a627b4b000000b005628a30a500sm109831pfc.41.2022.10.12.09.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 09:49:33 -0700 (PDT)
Date: Wed, 12 Oct 2022 09:49:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Message-ID: <20221012164932.GB2990467@roeck-us.net>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net>
 <Y0biBtCUtc2mowbQ@zx2c4.com>
 <Y0bvOreqH2BdyVqt@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0bvOreqH2BdyVqt@zx2c4.com>
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

On Wed, Oct 12, 2022 at 10:45:46AM -0600, Jason A. Donenfeld wrote:
> On Wed, Oct 12, 2022 at 09:49:26AM -0600, Jason A. Donenfeld wrote:
> > On Wed, Oct 12, 2022 at 07:18:27AM -0700, Guenter Roeck wrote:
> > > NIP [c000000000031630] .replay_soft_interrupts+0x60/0x300
> > > LR [c000000000031964] .arch_local_irq_restore+0x94/0x1c0
> > > Call Trace:
> > > [c000000007df3870] [c000000000031964] .arch_local_irq_restore+0x94/0x1c0 (unreliable)
> > > [c000000007df38f0] [c000000000f8a444] .__schedule+0x664/0xa50
> > > [c000000007df39d0] [c000000000f8a8b0] .schedule+0x80/0x140
> > > [c000000007df3a50] [c00000000092f0dc] .try_to_generate_entropy+0x118/0x174
> > > [c000000007df3b40] [c00000000092e2e4] .urandom_read_iter+0x74/0x140
> > > [c000000007df3bc0] [c0000000003b0044] .vfs_read+0x284/0x2d0
> > > [c000000007df3cd0] [c0000000003b0d2c] .ksys_read+0xdc/0x130
> > > [c000000007df3d80] [c00000000002a88c] .system_call_exception+0x19c/0x330
> > > [c000000007df3e10] [c00000000000c1d4] system_call_common+0xf4/0x258
> > 
> > Obviously the first couple lines of this concern me a bit. But I think
> > actually this might just be a catalyst for another bug. You could view
> > that function as basically just:
> > 
> >     while (something)
> >     	schedule();
> > 
> > And I guess in the process of calling the scheduler a lot, which toggles
> > interrupts a lot, something got wedged.
> > 
> > Curious, though, I did try to reproduce this, to no avail. My .config is
> > https://xn--4db.cc/rBvHWfDZ . What's yours?
> 
> I also just tried using your github linux-build-test scripts as a guide
> for construction a config -- https://xn--4db.cc/B0HpEQDQ -- and loaded
> up your rootfs over sdhci and such, and still couldn't manage to
> reproduce. I tried commenting out the line "if (!bits)" in
> _credit_init_bits(), so that the rng would never initialize, so that the
> schedule() loop would just keep on running indefinitely, but still no
> dice.
> 
> But also, I'm running Linus' tree. From your log, I see
> "6.0.0-rc2-00163-ga5edf9815dd7". So maybe these bugs got fixed
> elsewhere?
> 

Blame me for not attaching the latest crash report.

Guenter

---
BUG: soft lockup - CPU#0 stuck for 23s! [dd:111]
Modules linked in:
CPU: 0 PID: 111 Comm: dd Not tainted 6.0.0-11414-g49da07006239 #1
Hardware name: PowerMac3,1 PPC970FX 0x3c0301 PowerMac
NIP:  c000000000031630 LR: c000000000031964 CTR: 0000000000000000
REGS: c000000007d5b6a8 TRAP: 0900   Not tainted  (6.0.0-11414-g49da07006239)
MSR:  8000000000009032 <SF,EE,ME,IR,DR,RI>  CR: 28002228  XER: 00000000
IRQMASK: 0
GPR00: c000000000031964 c000000007d5b870 c0000000013e5500 c000000007d5b6a8
GPR04: c00000000125e1c0 0000000000000000 c000000007d5b814 c00000000291d018
GPR08: c000000002d4bbb8 0000000000000000 c000000007356400 c000000002d21098
GPR12: 0000000028002222 c000000002e20000 00000000100d32e0 00000000100d32b4
GPR16: 00000000100d3301 00000000100d32b9 00000000100d3358 00000000100d32bf
GPR20: 0000000000002000 00000000100d3372 00000000100d331e c000000007356c18
GPR24: 0000000000000000 0000000000000e60 0000000000000900 0000000000000500
GPR28: 0000000000000a00 0000000000000f00 0000000000000002 0000000000000003
NIP [c000000000031630] .replay_soft_interrupts+0x60/0x300
LR [c000000000031964] .arch_local_irq_restore+0x94/0x1c0
Call Trace:
[c000000007d5b870] [c000000000031964] .arch_local_irq_restore+0x94/0x1c0 (unreliable)
[c000000007d5b8f0] [c000000000f8bac4] .__schedule+0x664/0xa50
[c000000007d5b9d0] [c000000000f8bf30] .schedule+0x80/0x140
[c000000007d5ba50] [c00000000093085c] .try_to_generate_entropy+0x118/0x174
[c000000007d5bb40] [c00000000092fa64] .urandom_read_iter+0x74/0x140
[c000000007d5bbc0] [c0000000003b0044] .vfs_read+0x284/0x2d0
[c000000007d5bcd0] [c0000000003b0d2c] .ksys_read+0xdc/0x130
[c000000007d5bd80] [c00000000002a88c] .system_call_exception+0x19c/0x330
[c000000007d5be10] [c00000000000c1d4] system_call_common+0xf4/0x258
--- interrupt: c00 at 0x7fffb5c9d49c
NIP:  00007fffb5c9d49c LR: 000000001000da90 CTR: 0000000000000000
REGS: c000000007d5be80 TRAP: 0c00   Not tainted  (6.0.0-11414-g49da07006239)
MSR:  800000000000f032 <SF,EE,PR,FP,ME,IR,DR,RI>  CR: 22002422  XER: 00000000
IRQMASK: 0
GPR00: 0000000000000003 00007ffff6dcc220 00007fffb5d97300 0000000000000000
GPR04: 00000000101102a0 0000000000000020 0000000000000000 0000000000000000
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR12: 0000000000000000 00007fffb5e6aac0 00000000100d32e0 00000000100d32b4
GPR16: 00000000100d3301 00000000100d32b9 00000000100d3358 00000000100d32bf
GPR20: 0000000000002000 00000000100d3372 00000000100d331e 0000000000000000
GPR24: 7fffffffffffffff 00000000100b3a9c 00000000101102a0 0000000000000020
GPR28: 00000000101025c0 0000000000000020 0000000000000000 0000000000000000
NIP [00007fffb5c9d49c] 0x7fffb5c9d49c
LR [000000001000da90] 0x1000da90
--- interrupt: c00
Instruction dump:
3b600500 3b800a00 3ba00f00 f8010010 f821fdc1 60000000 60000000 38610078
e92d0af8 f92101f8 39200000 48039745 <60000000> 39000000 e9410180 892d0933
Kernel panic - not syncing: softlockup: hung tasks
CPU: 0 PID: 111 Comm: dd Tainted: G             L     6.0.0-11414-g49da07006239 #1
Hardware name: PowerMac3,1 PPC970FX 0x3c0301 PowerMac
Call Trace:
[c000000007d5b180] [c000000000f59b40] .dump_stack_lvl+0x7c/0xc4 (unreliable)
[c000000007d5b210] [c0000000000d5b58] .panic+0x174/0x42c
[c000000007d5b2c0] [c000000000231054] .watchdog_timer_fn+0x3a4/0x3e0
[c000000007d5b380] [c0000000001cc65c] .__hrtimer_run_queues+0x1fc/0x650
[c000000007d5b490] [c0000000001cd5cc] .hrtimer_interrupt+0x11c/0x320
[c000000007d5b550] [c000000000021f5c] .timer_interrupt+0x1cc/0x600
[c000000007d5b630] [c0000000000316c8] .replay_soft_interrupts+0xf8/0x300
[c000000007d5b870] [c000000000031964] .arch_local_irq_restore+0x94/0x1c0
[c000000007d5b8f0] [c000000000f8bac4] .__schedule+0x664/0xa50
[c000000007d5b9d0] [c000000000f8bf30] .schedule+0x80/0x140
[c000000007d5ba50] [c00000000093085c] .try_to_generate_entropy+0x118/0x174
[c000000007d5bb40] [c00000000092fa64] .urandom_read_iter+0x74/0x140
[c000000007d5bbc0] [c0000000003b0044] .vfs_read+0x284/0x2d0
[c000000007d5bcd0] [c0000000003b0d2c] .ksys_read+0xdc/0x130
[c000000007d5bd80] [c00000000002a88c] .system_call_exception+0x19c/0x330
[c000000007d5be10] [c00000000000c1d4] system_call_common+0xf4/0x258
--- interrupt: c00 at 0x7fffb5c9d49c
NIP:  00007fffb5c9d49c LR: 000000001000da90 CTR: 0000000000000000
REGS: c000000007d5be80 TRAP: 0c00   Tainted: G             L      (6.0.0-11414-g49da07006239)
MSR:  800000000000f032 <SF,EE,PR,FP,ME,IR,DR,RI>  CR: 22002422  XER: 00000000
IRQMASK: 0
GPR00: 0000000000000003 00007ffff6dcc220 00007fffb5d97300 0000000000000000
GPR04: 00000000101102a0 0000000000000020 0000000000000000 0000000000000000
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR12: 0000000000000000 00007fffb5e6aac0 00000000100d32e0 00000000100d32b4
GPR16: 00000000100d3301 00000000100d32b9 00000000100d3358 00000000100d32bf
GPR20: 0000000000002000 00000000100d3372 00000000100d331e 0000000000000000
GPR24: 7fffffffffffffff 00000000100b3a9c 00000000101102a0 0000000000000020
GPR28: 00000000101025c0 0000000000000020 0000000000000000 0000000000000000
NIP [00007fffb5c9d49c] 0x7fffb5c9d49c
LR [000000001000da90] 0x1000da90
--- interrupt: c00

