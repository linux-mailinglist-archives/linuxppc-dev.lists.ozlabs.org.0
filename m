Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1920696CB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 19:24:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGV3N4rSfz3cFZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 05:24:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ewo4sNIk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ewo4sNIk;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGV2V15z0z3bgv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 05:23:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4E155B81EB9;
	Tue, 14 Feb 2023 18:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3376FC433EF;
	Tue, 14 Feb 2023 18:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676399005;
	bh=6EEHFrLsabjvymp2QY0maJnB4Ezo1N96TizvWsxliSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewo4sNIkf4SKN8X81e1VZLV0gftWY9x5Idojfu6eT2b5ZqWCugH7cdipfgrW/yItW
	 dqagFjGOxb/3bL82FQa8uuxe//ztDAd9OjP7hBFIDi33dsqHZZjtip3V1HJ2oMssgq
	 JOC+Yor+xpMwuL0MvLKpSDnAPlafCWbIbj+fVaPjRgLXxBLYj2+reObJ0duhgkj1On
	 B/RwdybgTkIi3ajOUQ2j7ORpSeUDMZz187rZ02sRoCPqHerIGi+6Ive3pLH2MHMcC/
	 Wt6l7B+BR9KKMKD4veoKROyWZ38VxJ/Bk61QLyW3eGZbXyZkY95I+3EgwPU2h+98Tw
	 pND7dbVAeFWAA==
Date: Tue, 14 Feb 2023 10:23:22 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 19/24] xtensa/cpu: Make sure cpu_die() doesn't return
Message-ID: <20230214182322.r5tyeowxzloiuh72@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
 <1b4afd82-83cb-0060-7cab-8e16d2e69ff9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b4afd82-83cb-0060-7cab-8e16d2e69ff9@linaro.org>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-kern
 el@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 14, 2023 at 08:55:32AM +0100, Philippe Mathieu-Daudé wrote:
> Hi Josh,
> 
> On 14/2/23 08:05, Josh Poimboeuf wrote:
> > cpu_die() doesn't return.  Make that more explicit with a BUG().
> > 
> > BUG() is preferable to unreachable() because BUG() is a more explicit
> > failure mode and avoids undefined behavior like falling off the edge of
> > the function into whatever code happens to be next.
> > 
> > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > ---
> >   arch/xtensa/kernel/smp.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/xtensa/kernel/smp.c b/arch/xtensa/kernel/smp.c
> > index 4dc109dd6214..7bad78495536 100644
> > --- a/arch/xtensa/kernel/smp.c
> > +++ b/arch/xtensa/kernel/smp.c
> 
> Can you update the documentation along? Currently we have:
> 
>   /*
>    * Called from the idle thread for the CPU which has been shutdown.
>    *
>    * Note that we disable IRQs here, but do not re-enable them
>    * before returning to the caller. This is also the behaviour
>    * of the other hotplug-cpu capable cores, so presumably coming
>    * out of idle fixes this.
>    */

void __ref cpu_die(void)
{
	idle_task_exit();
	local_irq_disable();
	__asm__ __volatile__(
			"	movi	a2, cpu_restart\n"
			"	jx	a2\n");

	BUG();
}

Hm, not only is the comment wrong, but it seems to be branching to
cpu_restart?  That doesn't seem right at all.

Max/Chris?

-- 
Josh
