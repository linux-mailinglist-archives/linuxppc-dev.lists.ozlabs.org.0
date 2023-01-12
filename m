Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C26666759
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 01:02:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nsl9G0D15z3cBh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 11:02:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sxkg91jN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=2u5t=5j=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sxkg91jN;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nsl8J5893z3bT5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 11:01:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 43B936129D;
	Thu, 12 Jan 2023 00:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA52CC433D2;
	Thu, 12 Jan 2023 00:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673481692;
	bh=gp3ixmSzBGJy8uTYxS5ADZZFIL2F1SvM+d/vmQgSrEU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=sxkg91jNJBJYH7USijDsMpk3B7Rh+pgZSq9kVREeqMKTlsIraCQc2xugar4BcIY30
	 15TqShLgLOsylkvcbhLbEEJwOcyf5HWdcJDQ98MpdAb2iHVzT3VnL7QQN8I6kGoENx
	 4q4cAn1LtVbSg7wtPN53/Nh1vkJIHkv/3GxRmrt4X9ISye/UhBm+6tPDO5SrSmj1f3
	 HxWA1nht/9YSii1cMJY2yU0gamKhpuNX4A9PJDk2XEvyJ8pWnG+iHFn1X4pAIk4GIj
	 rB0wg+LRmAMlFp/jZocqp/R42AFuuzFxU1xtYyiYY1NpsBi3yBRg/jX0fJZZzTNDMk
	 zUmgANE3Zsj4g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5C4965C0AF8; Wed, 11 Jan 2023 16:01:32 -0800 (PST)
Date: Wed, 11 Jan 2023 16:01:32 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH rcu 04/27] arch/powerpc/kvm: Remove "select SRCU"
Message-ID: <20230112000132.GC4028633@paulmck-ThinkPad-P17-Gen-1>
References: <20230105003759.GA1769545@paulmck-ThinkPad-P17-Gen-1>
 <20230105003813.1770367-4-paulmck@kernel.org>
 <87h6wwhbtb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6wwhbtb.fsf@mpe.ellerman.id.au>
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
Cc: kernel-team@meta.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, rcu@vger.kernel.org, rostedt@goodmis.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 12, 2023 at 10:49:04AM +1100, Michael Ellerman wrote:
> "Paul E. McKenney" <paulmck@kernel.org> writes:
> > Now that the SRCU Kconfig option is unconditionally selected, there is
> > no longer any point in selecting it.  Therefore, remove the "select SRCU"
> > Kconfig statements.
> >
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: <linuxppc-dev@lists.ozlabs.org>
> > ---
> >  arch/powerpc/kvm/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Thank you!  I will apply on the next rebase.

							Thanx, Paul

> cheers
> 
> > diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> > index a9f57dad6d916..902611954200d 100644
> > --- a/arch/powerpc/kvm/Kconfig
> > +++ b/arch/powerpc/kvm/Kconfig
> > @@ -22,7 +22,6 @@ config KVM
> >  	select PREEMPT_NOTIFIERS
> >  	select HAVE_KVM_EVENTFD
> >  	select HAVE_KVM_VCPU_ASYNC_IOCTL
> > -	select SRCU
> >  	select KVM_VFIO
> >  	select IRQ_BYPASS_MANAGER
> >  	select HAVE_KVM_IRQ_BYPASS
> > -- 
> > 2.31.1.189.g2e36527f23
