Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2C8675AED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:16:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz5kW2wtsz3fG7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 04:16:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kr62xPGX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=lee@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kr62xPGX;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz5jX6ljSz3cFW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 04:15:28 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6074E62011;
	Fri, 20 Jan 2023 17:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB65C433D2;
	Fri, 20 Jan 2023 17:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674234924;
	bh=ZsNYnowGZyqeCXP2rOS1YvAQ7xngouKtFjdbSVyw/TU=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=kr62xPGXLSR9sfgMXRHrcfjhe90gzccyj6btrYEMYzgUp+QKNvLdj24R+B3ZwWH/C
	 yJwgCn14oHWTI5O+2/i5iCBu1IUUa7SRPn4Meo180eQNjMvkx91nT0q5G3hqUo8aL6
	 pA/GcxGIp38FYQac0yfGTzZl8awTZ78nWVunprv7iJpfinyDspHn+OIpi4T62EKKLQ
	 F+/e3IH6sPnaCOO7laJ5+XFcyeAsVwl+4ETHzoczwepS7E/BICLOyJdnvdJN6Smt39
	 SpsNq4ak52j79sqU489MgQhGtWatZqCi25MES8aCN+BrjFOkHd4zwQ+L4R4jOKnl2B
	 BVHhxL1pfV/jg==
Date: Fri, 20 Jan 2023 17:15:17 +0000
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND 0/8] Resend LED patches
Message-ID: <Y8rMJcX0cqThKj2N@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <db008af4-2918-4458-aa68-2392674475c8@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db008af4-2918-4458-aa68-2392674475c8@app.fastmail.com>
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, soc@kernel.org, Pavel Machek <pavel@ucw.cz>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 Jan 2023, Arnd Bergmann wrote:

> On Mon, Dec 26, 2022, at 13:36, Pali Rohár wrote:
> > Linus Walleij suggested me to send these patches to SoC tree [1]
> > instead. So I'm doing it.
> >
> > This patch series contains LED patches which are on the linux-leds
> > mailing list for a long time without any future movement. Could you
> > please handle them here via SoC tree? Thanks.
> >
> > [1] - 
> > https://lore.kernel.org/linux-leds/CACRpkdad6WDo7rGfa4MW8zz0mLXmcPHo+SEC-yLQnRz_kdrryA@mail.gmail.com/
> 
> I'm going through the backlog of patches sent to soc@kernel.org
> and came across this series. While I don't mind taking these
> patches through the soc tree in principle, it is important
> that this is only done as an exception, and with all the
> relevant parties on Cc.
> 
> In particular, the original series that you got no
> feedback for did not include the arch/powerpc/ changes,
> and I would assume those should go through the powerpc
> tree anyway. We have recently decided to take
> risc-v and loongarch dts changes through the soc
> tree, and I don't mind doing it for powerpc as well
> if the powerpc maintainers prefer that, but this is
> not something we have even discussed so far.
> 
> I've added everyone to Cc on this mail, but please
> resend the series once more so everyone has the patches,
> and then we can decide who will pick up what.

Thanks Arnd (PSB).

> > Marek Behún (3):
> >   leds: turris-omnia: support HW controlled mode via private trigger
> >   leds: turris-omnia: initialize multi-intensity to full
> >   leds: turris-omnia: change max brightness from 255 to 1
> >
> > Pali Rohár (5):
> >   dt-bindings: leds: register-bit-led: Add active-low property
> >   leds: syscon: Implement support for active-low property
> >   powerpc/85xx: DTS: Add CPLD definitions for P1021RDB Combo Board CPL
> >     Design
> >   dt-bindings: leds: Add cznic,turris1x-leds.yaml binding
> >   leds: Add support for Turris 1.x LEDs
> >
> >  .../testing/sysfs-class-led-driver-turris1x   |  31 ++
> >  .../bindings/leds/cznic,turris1x-leds.yaml    | 118 +++++
> >  .../bindings/leds/register-bit-led.yaml       |   5 +
> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi    |  92 ++++
> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts |   6 +-
> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts |   6 +-
> >  arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts     |  44 +-
> >  arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi    |  37 ++
> >  arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts |   4 +-
> >  arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts |   4 +-
> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi    |  37 ++
> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts |   5 +-
> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts |   5 +-
> >  arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi    |  33 +-

> >  drivers/leds/Kconfig                          |  10 +
> >  drivers/leds/Makefile                         |   1 +
> >  drivers/leds/leds-syscon.c                    |  14 +-
> >  drivers/leds/leds-turris-1x.c                 | 474 ++++++++++++++++++
> >  drivers/leds/leds-turris-omnia.c              |  46 +-

If everyone is convinced that applying these drivers is the correct
thing to do, I'd be happy to (rather) take them via LEDs.

-- 
Lee Jones [李琼斯]
