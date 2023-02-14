Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A379696CEB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 19:29:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGV9H72Syz3cLc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 05:29:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bHhn4MxW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bHhn4MxW;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGV8P4v2xz3c34
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 05:28:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9971F61839;
	Tue, 14 Feb 2023 18:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5279BC433D2;
	Tue, 14 Feb 2023 18:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676399315;
	bh=FbF6sDzVu8IYeXRzBwpTRcd2V9cyuwcFeFjq0Ymm7Do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHhn4MxW4jaWFJ2rWLLTx3PrN1UgQYhr8rIIi09a5nKp9q1ESDXYN6B61WfPK+RCk
	 kGOo0Ttnppg2I0ImN2NZWVnYn5Hj3XaN0LDcyDf/bwqXXcmVPP3k8vhBjHFmJR2Bwl
	 59QsKYYCyuVJKOZH8QhykBvzswD6lxU5Dm7UQEUn/f61z0n0wk0iCLguGpDT9BQtko
	 BMamtHKjb0Kw6J2wXAyHy1UIJAIQSjMfecn63l73DrJUySuInHCUTNK20Fu4b0MRwy
	 oFsYNMAp0xS4VwbLeGrloRppo8ZqhdA7joLLtCUVdDhIWqqYlEK1n6Wnc+Yaj98vfY
	 KvhcfOKc0ivxg==
Date: Tue, 14 Feb 2023 10:28:31 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 13/24] sh/cpu: Make sure play_dead() doesn't return
Message-ID: <20230214182831.7l73rzoeqjowbyly@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <d0c3ff5349adfe8fd227acc236ae2c278a05eb4c.1676358308.git.jpoimboe@kernel.org>
 <2575e5f7-b11a-020f-06ef-ba42301d7415@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2575e5f7-b11a-020f-06ef-ba42301d7415@linaro.org>
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

On Tue, Feb 14, 2023 at 08:57:39AM +0100, Philippe Mathieu-Daudé wrote:
> On 14/2/23 08:05, Josh Poimboeuf wrote:
> > play_dead() doesn't return.  Make that more explicit with a BUG().
> > 
> > BUG() is preferable to unreachable() because BUG() is a more explicit
> > failure mode and avoids undefined behavior like falling off the edge of
> > the function into whatever code happens to be next.
> > 
> > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > ---
> >   arch/sh/include/asm/smp-ops.h | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/sh/include/asm/smp-ops.h b/arch/sh/include/asm/smp-ops.h
> > index e27702130eb6..63866b1595a0 100644
> > --- a/arch/sh/include/asm/smp-ops.h
> > +++ b/arch/sh/include/asm/smp-ops.h
> > @@ -27,6 +27,7 @@ static inline void plat_smp_setup(void)
> >   static inline void play_dead(void)
> >   {
> >   	mp_ops->play_dead();
> > +	BUG();
> >   }
> 
> Shouldn't we decorate plat_smp_ops::play_dead() as noreturn first?

I guess it really depends on how far we want to go down the __noreturn
rabbit hole.  To keep the patch set constrained yet still useful I
stopped when I got to a function pointer, as I think it still needs a
BUG() afterwards either way.

That said, there would still be benefits of adding __noreturn to
function pointers, I just wanted to keep the patch set down to a
manageable size ;-)

-- 
Josh
