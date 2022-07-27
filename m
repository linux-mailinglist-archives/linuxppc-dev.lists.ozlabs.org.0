Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB4C5825EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 13:53:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtBxw62W8z3c7h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 21:53:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=icKsJe67;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=hqxn=ya=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=icKsJe67;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtBxG47Qdz30Ly
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 21:53:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2DDD7B8202F;
	Wed, 27 Jul 2022 11:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A84C433D6;
	Wed, 27 Jul 2022 11:52:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="icKsJe67"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1658922776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nAk1JDN+XhLzlzzkZr2i7osqynHxkpD7l3bi3JVECoE=;
	b=icKsJe673P3y7lDgpEimTtWlXPcwhYXs9Y5iqFw3F07jEc3OIspnZrJRK4oJLe8Fl1XSJI
	xeA8ztDlCbCkze46H1g6Azp2vj09aOjHtZ0nas30ytcMKGn/149rGBbFJsfhkawazGjzfb
	MHGCZszUCdQHHm3UMzhY1kRRC5CTPXM=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 59388ba0 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 27 Jul 2022 11:52:56 +0000 (UTC)
Date: Wed, 27 Jul 2022 13:52:54 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 0/2] powerpc rng cleanups
Message-ID: <YuEnFgFoauUlS9kj@zx2c4.com>
References: <20220711232448.136765-1-Jason@zx2c4.com>
 <YtVbbMpRbfCWEIFn@zx2c4.com>
 <CAHmME9pMOQKnMUQQyOA+CkN5scQjtLN79pvdYSu70MkuU207cw@mail.gmail.com>
 <87wnbz9pnk.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wnbz9pnk.fsf@mpe.ellerman.id.au>
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Wed, Jul 27, 2022 at 01:54:07PM +1000, Michael Ellerman wrote:
> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> > On Mon, Jul 18, 2022 at 3:09 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >> On Tue, Jul 12, 2022 at 01:24:46AM +0200, Jason A. Donenfeld wrote:
> >> > These are two small cleanups for -next. This v5 rebases on the latest
> >> > git master, as some whitespace was added that made v4 no longer apply.
> >> >
> >> > Jason A. Donenfeld (2):
> >> >   powerpc/powernv: rename remaining rng powernv_ functions to pnv_
> >> >   powerpc/kvm: don't crash on missing rng, and use darn
> >> >
> >> >  arch/powerpc/include/asm/archrandom.h |  7 +--
> >> >  arch/powerpc/kvm/book3s_hv_builtin.c  |  7 +--
> >> >  arch/powerpc/platforms/powernv/rng.c  | 66 ++++++++++-----------------
> >> >  drivers/char/hw_random/powernv-rng.c  |  2 +-
> >> >  4 files changed, 30 insertions(+), 52 deletions(-)
> >>
> >> I think v5 has reached a completion point. Could you queue these up in
> >> some PPC tree for 5.20?
> >
> > Just paging again. Do you think you could queue these up for 5.20?
> > This trivial series is over a month old now.
> 
> It can't claim to fix a guest-triggerable hypervisor crash and also be
> "trivial" :)

:)

> 
> But yes I plan to queue it for v5.20.

Okay great. Would be nice to see this in -next sooner rather than later.

Jason
