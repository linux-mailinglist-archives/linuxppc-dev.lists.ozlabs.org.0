Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6980A91731A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 23:13:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ArcIuk0u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7yGc6Tm0z3dwG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 07:12:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ArcIuk0u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7yFw4XVNz3cZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 07:12:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4626CCE1F2C;
	Tue, 25 Jun 2024 21:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F61C32781;
	Tue, 25 Jun 2024 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719349937;
	bh=hyygwZzV0TA9MeTrczY+xfhnsSFmoluW/aMTxSPPF7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArcIuk0uRfsESHfkGfkKUOWRPGGQRoYshDAKXgfL7RAidYC2yoPUOF4EOIWRth/zx
	 ykHnbRshuPVKR4UsTmEqJpfbjR7Lxb1MgohaxTO7sN4G186OXUULYfjTSoMk/JACVy
	 rDH4YFTTQFVhxEeWdIOOD5ronHyHYn5GlVnw+3JtZFiKhbLmGLU7w1aHq4GtR8VqXx
	 zOrwlDLRr/Fxt5QON7ooh6qk8zgpeQFn4BGJ4f8p9B/da2ub1m3VU/0NxxHk78cBsC
	 Ylf78UIPjF87TiTkhrpWjEAnrqweWrfQoiMdjHdFmTSchTgaZPSVi6dGjUTTadSf7V
	 tnFI4Gu0p7ohg==
Date: Tue, 25 Jun 2024 23:12:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from
 del_timer_sync()
Message-ID: <73yvglxha45d5ft74m3y5fdmkgatm2yftvhza2msg4ombjz42f@wz43pubhbpdz>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
 <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
 <CAG+cZ04suU53wR5f0PhudgNmkxTRtwEXTS1cWH1o9_rTNM94Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG+cZ04suU53wR5f0PhudgNmkxTRtwEXTS1cWH1o9_rTNM94Cg@mail.gmail.com>
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
Cc: alsa-devel@alsa-project.org, Vignesh Raghavendra <vigneshr@ti.com>, Michael Turquette <mturquette@baylibre.com>, Li Zetao <lizetao1@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Piotr,

On Fri, Jun 21, 2024 at 02:08:03PM GMT, Piotr Wojtaszczyk wrote:
> On Fri, Jun 21, 2024 at 12:57 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > On Thu, Jun 20, 2024 at 07:56:41PM GMT, Piotr Wojtaszczyk wrote:
> > > When del_timer_sync() is called in an interrupt context it throws a warning
> > > because of potential deadlock. Threaded irq handler fixes the potential
> > > problem.
> > >
> > > Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> >
> > did you run into a lockdep splat?
> >
> > Anything against using del_timer(), instead? Have you tried?
> 
> I didn't get a lockdep splat but console was flooded with warnings from
> https://github.com/torvalds/linux/blob/v6.10-rc4/kernel/time/timer.c#L1655
> In the linux kernel v5.15 I didn't see these warnings.
> 
> I'm not a maintainer of the driver and I didn't do any research on
> what kind of impact
> would have using del_timer() instad. Maybe Vladimir Zapolskiy will know that.

Your patch is definitely correct, no doubt about that.

And I don't have anything aginast changing irq handlers to
threaded handlers. But I would be careful at doing that depending
on the use of the controller and for accepting such change I
would need an ack from someone who knows the device. Vladimir,
perhaps?

There are cases where using threaded handlers are not totally
right, for example when the controller is used at early boot for
power management handling. I don't think it's the case for this
driver, but I can't be 100% sure.

If you were able to see the flood of WARN_ON's, would be
interesting to know how it behaves with del_timer(). Mind
giving it a test?

Thanks,
Andi
