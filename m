Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC25696E61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 21:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGXd33s7mz3cgp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 07:20:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vQOpB4jZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vQOpB4jZ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGXc54bBSz3cCL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 07:19:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1D095B81F0A;
	Tue, 14 Feb 2023 20:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F00C433EF;
	Tue, 14 Feb 2023 20:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676405952;
	bh=8/V8zQrKDfVgeKbs27WthihxgwdivBHQ1xvEeA6uoYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQOpB4jZU06j0E1MKDDJZEPPNRmXS0/cOAjGFTxoXLPrgQIK/B47hTb0QFcKIneZb
	 s0jPY923NwwG0EAaHw8yq2VeY+rnIZejt5UaWx/A6Novye6lAoPweaDLN/vVDTfV4/
	 z2wbU080F9o3lsW1XlbaHeONXQOQPrvD/SUfEbdGlUuV0/0zX3LoW10/MVrsarzBdE
	 ceX7Oa5FeZeJLYpScL4JzHvW13XbOGzyYkvzihDtHpZE/AnlwkFrJ1ZK6bjfdTEzD6
	 0YVc817WUB5hgfgY4gpdM1zFQ3vDBu3uys4X8js6W3ZOQyDxWfawx8vYr8MN57D9M7
	 IlAUpkSGii2pg==
Date: Tue, 14 Feb 2023 12:19:09 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 19/24] xtensa/cpu: Make sure cpu_die() doesn't return
Message-ID: <20230214201909.flqc3g3njnbl5hun@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
 <1b4afd82-83cb-0060-7cab-8e16d2e69ff9@linaro.org>
 <20230214182322.r5tyeowxzloiuh72@treble>
 <CAMo8BfLzV0Oe_i-QrMzE-BE028s6GNvOd827N5+tteELidjpvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMo8BfLzV0Oe_i-QrMzE-BE028s6GNvOd827N5+tteELidjpvA@mail.gmail.com>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-kernel@vger.kernel.org, bsegall@google.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@
 linaro.org>, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de, bristot@redhat.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 14, 2023 at 11:48:41AM -0800, Max Filippov wrote:
> On Tue, Feb 14, 2023 at 10:23 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > On Tue, Feb 14, 2023 at 08:55:32AM +0100, Philippe Mathieu-Daudé wrote:
> > > Can you update the documentation along? Currently we have:
> > >
> > >   /*
> > >    * Called from the idle thread for the CPU which has been shutdown.
> > >    *
> > >    * Note that we disable IRQs here, but do not re-enable them
> > >    * before returning to the caller. This is also the behaviour
> > >    * of the other hotplug-cpu capable cores, so presumably coming
> > >    * out of idle fixes this.
> > >    */
> >
> > void __ref cpu_die(void)
> > {
> >         idle_task_exit();
> >         local_irq_disable();
> >         __asm__ __volatile__(
> >                         "       movi    a2, cpu_restart\n"
> >                         "       jx      a2\n");
> >
> >         BUG();
> > }
> >
> > Hm, not only is the comment wrong, but it seems to be branching to
> > cpu_restart?  That doesn't seem right at all.
> 
> Perhaps the name is a bit misleading. The CPU that enters 'cpu_restart'
> loops there until a call to 'boot_secondary' releases it, after which it goes
> to '_startup'. So it is a restart, but not immediate.

Ah, I see.  That sounds similar to what Xen does.

-- 
Josh
