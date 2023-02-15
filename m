Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F06984C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 20:46:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH7r00NtZz3f39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:46:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nR0NlH9I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nR0NlH9I;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH7q12RSvz3btb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 06:45:49 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1F756B821C3;
	Wed, 15 Feb 2023 19:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43254C433EF;
	Wed, 15 Feb 2023 19:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676490341;
	bh=jEHEKJREN3+faSwa9KQfDCZrIk1boGFeW1CEIEtwaE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nR0NlH9Idu9r6K5BB6SiskW/nN4Duv8oUu4t8oAsMW/BA2jHnn50sUmTtFA09snEM
	 MM4Q1KeVxIEK0CQ3heZ6KGEcJDJrmingPvv4ff3yLJnpeg2zJ4He1vCJjQd4s9mOGJ
	 HhE0qrDT5xUO3xGvs5zweCTvugYIA2adLOusrfvLPAxv6b4Cny+j0eHRlRanyAeAV0
	 ysxu48fte0a0SA7XcnPw1U31MXQzSfjcPpTrp4Qgi04O07kA/LeXjWVthIX5CMIF30
	 JAfOEJGYLSGZoEytWeIGwTCLRlwIMdQ5V+BaoKw5Pr+bw7iEZ2yNGIfGT3LJDZnQTo
	 qDwCO7AGpVLow==
Date: Wed, 15 Feb 2023 11:45:38 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 04/24] arm64/cpu: Mark cpu_die() __noreturn
Message-ID: <20230215194538.aiiris3uabnuvkkg@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <e47fc487980d5330e6059ac6e16416bec88cda0e.1676358308.git.jpoimboe@kernel.org>
 <14274f04-2991-95bd-c29b-07e86e8755c1@linaro.org>
 <Y+zZgZIP7RPIgyQf@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+zZgZIP7RPIgyQf@FVFF77S0Q05N>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, jiaxun.yang@flygoat.com, linux-kernel@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, chenhuacai@kernel.org, paulmck@kernel.org, linux-xtensa@linux-xtensa.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, Philippe =?utf-8?Q?Mathieu-D
 aud=C3=A9?= <philmd@linaro.org>, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de, bristot@redhat.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 15, 2023 at 01:09:21PM +0000, Mark Rutland wrote:
> On Tue, Feb 14, 2023 at 09:13:08AM +0100, Philippe Mathieu-Daudé wrote:
> > On 14/2/23 08:05, Josh Poimboeuf wrote:
> > > cpu_die() doesn't return.  Annotate it as such.  By extension this also
> > > makes arch_cpu_idle_dead() noreturn.
> > > 
> > > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > > ---
> > >   arch/arm64/include/asm/smp.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> > > index fc55f5a57a06..5733a31bab08 100644
> > > --- a/arch/arm64/include/asm/smp.h
> > > +++ b/arch/arm64/include/asm/smp.h
> > > @@ -100,7 +100,7 @@ static inline void arch_send_wakeup_ipi_mask(const struct cpumask *mask)
> > >   extern int __cpu_disable(void);
> > >   extern void __cpu_die(unsigned int cpu);
> > > -extern void cpu_die(void);
> > > +extern void __noreturn cpu_die(void);
> > >   extern void cpu_die_early(void);
> > 
> > Shouldn't cpu_operations::cpu_die() be declared noreturn first?
> 
> The cpu_die() function ends with a BUG(), and so does not return, even if a
> cpu_operations::cpu_die() function that it calls erroneously returned.
> 
> We *could* mark cpu_operations::cpu_die() as noreturn, but I'd prefer that we
> did not so that the compiler doesn't optimize away the BUG() which is there to
> catch such erroneous returns.
> 
> That said, could we please add __noreturn to the implementation of cpu_die() in
> arch/arm64/kernel/smp.c? i.e. the fixup below.

Done.

> With that fixup:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks!

-- 
Josh
