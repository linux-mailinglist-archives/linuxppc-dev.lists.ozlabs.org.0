Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE9A6FFF07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 04:43:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHY3k12Tjz3fX8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 12:43:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dIps/oqn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHY2w2MVsz3bhC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 12:42:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dIps/oqn;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QHY2v2286z4x5R;
	Fri, 12 May 2023 12:42:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683859368;
	bh=UHonVxCxl9tE/BE4saKmOTqDfW/Z+XH0atlSFKqQKFw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dIps/oqn68QXS/wtfWcyekxrrBV800VlhYXyckk0yyHlNuAi/OANA1HtUmq/Dm9HY
	 RCiAcMCb25X2GkBordupXcyG4V4fbQ21NRVicTRxpC+ul9+wr55ARw5deXskUIusKV
	 A89LRqgyTf2iZog4EKY6eRpyMZI2Og/axtJ7SqtKHDnysjUjgr1MLwuvMgrcsChKxW
	 Tn2qFReh+IIS6pyD5m3dl/jn19fXV3tTJtc0MPNh86ctlPKzO7xmR2cz77y5pDu1Lj
	 MfpgFo/YdkymlLAJvrkNWgdTIxMES90GDKurKIxsqVbTZxQfmtWNicbivLkrkYQk0o
	 7shnTEqgaAJpA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] powerpc: Drop MPC5200 LocalPlus bus FIFO driver
In-Reply-To: <20230509082153.jcy2qpvyd44bjaee@pengutronix.de>
References: <20221228145129.31700-1-u.kleine-koenig@pengutronix.de>
 <20230412150524.ojsvukh47hing6db@pengutronix.de>
 <87zg7cabf6.fsf@mpe.ellerman.id.au>
 <20230413061642.kqkor4wkt7lp2mhp@pengutronix.de>
 <20230509082153.jcy2qpvyd44bjaee@pengutronix.de>
Date: Fri, 12 May 2023 12:42:46 +1000
Message-ID: <873542l17d.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Anatolij Gustschin <agust@denx.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
> On Thu, Apr 13, 2023 at 08:16:42AM +0200, Uwe Kleine-K=C3=B6nig wrote:
>> While mpc5200b.dtsi contains a device that this driver can bind to, the
>> only purpose of a bound device is to be used by the four exported functi=
ons
>> mpc52xx_lpbfifo_submit(), mpc52xx_lpbfifo_abort(), mpc52xx_lpbfifo_poll()
>> and mpc52xx_lpbfifo_start_xfer(). However there are no callers to this
>> function and so the driver is effectively superfluous and can be deleted.
>> Also drop some defines and a struct from <asm/mpc52xx.h> that are unused
>> now together with the declarations of the four mentioned functions.
>>=20
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> ---
>> On Thu, Apr 13, 2023 at 10:11:25AM +1000, Michael Ellerman wrote:
>> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
>> > > On Wed, Dec 28, 2022 at 03:51:29PM +0100, Uwe Kleine-K=C3=B6nig wrot=
e:
>> > >> The four exported functions mpc52xx_lpbfifo_submit(),
>> > >> mpc52xx_lpbfifo_abort(), mpc52xx_lpbfifo_poll(), and
>> > >> mpc52xx_lpbfifo_start_xfer() are not used. So they can be dropped a=
nd the
>> > >> definitions needed to call them can be moved into the driver file.
>> > >>=20
>> > >> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e>
>> > >
>> > > I never got feedback about this driver and it has not appeared in ne=
xt
>> > > up to now. Did it fell through the cracks?
>> >=20
>> > Yeah. I was hoping someone would explain what's going on with the
>> > driver.
>> >=20
>> > Presumably there are some out-of-tree drivers that use the routines
>> > provided by this driver?
>>=20
>> I googled for the function names but the only related hits were
>> references to this thread :-)
>>=20
>> > I think rather than merging this patch, which keeps the code but makes
>> > it completely useless, do you mind sending a patch to remove the whole
>> > driver? Maybe that will get someone's attention.
>>=20
>> fair enough, here it is.
>
> What is your thought about this patch? If you (also) think getting it
> into next soon after a merge window closed, around now would be a good
> opportunity to do so ..

I was hoping someone would explain why we have a driver that does
nothing useful :) But I guess it's too old for anyone to remember/care.

So yeah I'll take this, we can always put it back if someone needs it.

I base my next on rc2, so I'll pick this up next week.

cheers
