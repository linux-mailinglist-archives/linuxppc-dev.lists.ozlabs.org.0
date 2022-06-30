Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B10A0562089
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 18:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYkl44gn1z3dsZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 02:47:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Pruj7/PB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=bce9=xf=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Pruj7/PB;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYkkL4xgtz3blG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 02:46:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D3782B82BD5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 16:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D799C341CB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 16:46:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Pruj7/PB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1656607586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=chJ72QITXlnYA5OzTrEw7eBxyMlJ3rDs7gvs+j+z3aU=;
	b=Pruj7/PB3kWSgzS6NrsIH4hAXE1qUqVO7VcXObrYlRokO4SdhziWrnuCrT+thAwd00cT68
	C2f/ZWP+JBWys1gxMWE179o58blXtZ/94mDyKPn+iTZuuJjryVRv9sWbwSe1Y1PxvDKy8t
	+yALw/UedGzS3gp1+dkriOwa22+BBqQ=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ff468dc4 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Thu, 30 Jun 2022 16:46:25 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id u20so19687290iob.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 09:46:25 -0700 (PDT)
X-Gm-Message-State: AJIora//CvwRDJ+uYGqaEtowpnfHslajBa+NzJLpDJCSob1iJpYVhxp3
	9vA5P/qA4mu39lKMuL77e5/N4tt2jb2YPX0TjqE=
X-Google-Smtp-Source: AGRyM1tcQRmciYSKskubeNhjRX5oJYFTEE6dB3qwaRrecz2Iv0EOxSzDcvpC3VtAiMQ0NsvlUFXrmqVNAMqXuB9avMc=
X-Received: by 2002:a05:6638:2104:b0:33c:be1e:8d67 with SMTP id
 n4-20020a056638210400b0033cbe1e8d67mr5990081jaj.196.1656607584476; Thu, 30
 Jun 2022 09:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220630140108.129434-1-Jason@zx2c4.com> <DFCB9812-6138-400F-9AF8-DE18B61C3667@linux.ibm.com>
In-Reply-To: <DFCB9812-6138-400F-9AF8-DE18B61C3667@linux.ibm.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Jun 2022 18:46:13 +0200
X-Gmail-Original-Message-ID: <CAHmME9oJuFzoQ7ARuMQd8AKpofUWEnFauRCxJbvymrp8cWj6fg@mail.gmail.com>
Message-ID: <CAHmME9oJuFzoQ7ARuMQd8AKpofUWEnFauRCxJbvymrp8cWj6fg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] powerpc rng cleanups
To: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sachin, Michael,

On Thu, Jun 30, 2022 at 6:12 PM Sachin Sant <sachinp@linux.ibm.com> wrote:
> > On 30-Jun-2022, at 7:31 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > These are two small cleanups for -next.
> >
> > I'm sending this v3 because very likely
> > https://lore.kernel.org/all/20220630121654.1939181-1-Jason@zx2c4.com/
> > will land first, in which case this needs a small adjustment.
> >
> > Jason A. Donenfeld (2):
> >  powerpc/powernv: rename remaining rng powernv_ functions to pnv_
> >  powerpc/kvm: don't crash on missing rng, and use darn
> >
> > arch/powerpc/include/asm/archrandom.h |  7 +--
> > arch/powerpc/kvm/book3s_hv_builtin.c  |  7 +--
> > arch/powerpc/platforms/powernv/rng.c  | 65 ++++++++++-----------------
> > drivers/char/hw_random/powernv-rng.c  |  2 +-
> > 4 files changed, 30 insertions(+), 51 deletions(-)
> >
>
> I tried these 2 patches + previous one (to fix kobject warning) on
> top of 5.19.0-rc4-next-20220630 next on a Power8 server.
>
> 5.19.0-rc4-next-20220630 +
> powerpc/powernv: delay rng of node creation until later in boot +
> powerpc/powernv: rename remaining rng powernv_ functions to pnv_ +
> powerpc/kvm: don't crash on missing rng, and use darn
>
> Unfortunately it fails to boot with following crash
>
> [    0.000000] ftrace: allocated 13 pages with 3 groups
> [    0.000000] trace event string verifier disabled
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=80.
> [    0.000000]  Rude variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=80
> [    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
> [    0.000000] ICS OPAL backend registered
> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    0.000001] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
> [    0.000182] clocksource: timebase mult[1f40000] shift[24] registered
> [    0.001905] BUG: Unable to handle kernel data access on read at 0x3ffff40000000
> [    0.002032] Faulting instruction address: 0xc0000000000d7990
> [    0.002132] Oops: Kernel access of bad area, sig: 7 [#1]
> [    0.002226] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
> [    0.002338] Modules linked in:
> [    0.002396] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.19.0-rc4-next-20220630-dirty #20
> [    0.002539] NIP:  c0000000000d7990 LR: c00000000201fa74 CTR: c0000000000d7960
> [    0.002663] REGS: c000000002a0fa60 TRAP: 0300   Not tainted  (5.19.0-rc4-next-20220630-dirty)
> [    0.002812] MSR:  9000000002001033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 44000228  XER: 20000000
> [    0.002979] CFAR: c00000000201fa70 DAR: 0003ffff40000000 DSISR: 00000002 IRQMASK: 1
> [    0.002979] GPR00: c00000000201fa74 c000000002a0fd00 c000000002a12000 c000000002a0fe90
> [    0.002979] GPR04: 0000000000000001 0000000000000000 c000000000deb578 000000000000006f
> [    0.002979] GPR08: 0000000000000000 0003ffff40000000 c000000007040080 0000000000000000
> [    0.002979] GPR12: c0000000000d7960 c000000002d00000 0000000000000003 0000000000000000
> [    0.002979] GPR16: 0000000000000000 0000000000000000 0000000000000278 c000000002a4dfe0
> [    0.002979] GPR20: c000000002a52238 c000000002a52820 c0000000000d7960 c000000000fe6c50
> [    0.002979] GPR24: 0000000000000001 c000000002a0fe90 c000000000fe6c40 c000000002141ff8
> [    0.002979] GPR28: 0000000000000800 c0000000070400a0 c000000002ab0150 0000000000000000
> [    0.004279] NIP [c0000000000d7990] pnv_get_random_long+0x30/0xd0
> [    0.004390] LR [c00000000201fa74] pnv_get_random_long_early+0x268/0x2d0
> [    0.004509] Call Trace:
> [    0.004553] [c000000002a0fd00] [c00000000201fa4c] pnv_get_random_long_early+0x240/0x2d0 (unreliable)
> [    0.004718] [c000000002a0fe20] [c000000002060d5c] random_init+0xc0/0x214
> [    0.004844] [c000000002a0fec0] [c0000000020048c0] start_kernel+0x990/0xbf8
> [    0.004972] [c000000002a0ff90] [c00000000000d878] start_here_common+0x1c/0x24
> [    0.005102] Instruction dump:
> [    0.005156] 3c4c0294 3842a6a0 7c0802a6 60000000 7d2000a6 71290010 41820048 e94d0030
> [    0.005309] 3d22ff73 3929fff8 7d4a482a e92a0008 <7d204eea> e8ea0010 7d2803f4 7ce94a78
> [    0.005465] ---[ end trace 0000000000000000 ]---
> [    0.005545]
> [    1.005574] Kernel panic - not syncing: Fatal exception
> [    1.005671] Rebooting in 10 seconds..
>
> Reverting powerpc/kvm: don't crash on missing rng, and use darn helps to boot
> the server successfully.

Huh! Thanks for testing that so fast.

That commit has this block in it:

+       if (mfmsr() & MSR_DR) {
+               rng = raw_cpu_read(pnv_rng);
+               *v = rng_whiten(rng, __raw_rm_readq(rng->regs_real));

The idea was that `mfmsr() & MSR_DR` would be true if we're in real
mode. But I don't actually know what that's doing; mpe suggested it to
me. Is it possible the condition is inverted and I should have done
`!(mfmsr() & MSR_DR)`? Or maybe there's a better flag to check than
the DR one?

Jason
