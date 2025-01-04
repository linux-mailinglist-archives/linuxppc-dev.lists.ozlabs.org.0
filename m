Return-Path: <linuxppc-dev+bounces-4657-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D63A01564
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jan 2025 15:50:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQNfK6NKSz2yG9;
	Sun,  5 Jan 2025 01:50:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736002233;
	cv=none; b=h2aKumyknGC9wxcupsNkGFrU13IuaogrLvbDqtebbd+nn4QzSu1Q1vjddDb7Hfz2X14af6l//UdSLVc/8FIpgdTzmWb3Oy6n8dma4wRpxiR0rBZG+mtGKiTQxRruLCUKAk/8QivUsUnELdU6JujvJYFG7B6qW1rQPMJV1ROfNIssZfQkARQHnVlE3D8N1zVvjIi3M02urvIxLY8tP+ixmWtGMGqtXF5aVWsccGuKdEvRJqBOKTdObnlOq1zyzNKdsXbgX+1p3hT6pe8Cl1JDRm2T3dPfSO3wkU7Y5o+yP5TI+0YUSkiwuzxCh/cRB4BZOFOR5+VlbkwkE7p1ai51/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736002233; c=relaxed/relaxed;
	bh=dizPskPb1XlcpOMgY5J5CDbjabB3P8IwDTu5s1a8TtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEzD9x41hJEr+MhRPlLMs2xAxX3AstAEJAfTQJWSiDlaZJo9nKHH4iLhu8jcWUwLescKCwYo/QzpshCayWRNYwd8Lfc2PJvb3Gta4Le7jK8RWrahgWeQH+6lgW+E5pmv64iqW00K3pXFGntuTCPjPsq4TgaJJbywsvkdpiNs/36eJfLZOVRU9Xhg4Yhd8E7+LZgzNRON3an68Xo8vqkW2azrytZg2oz9NVQHtWyhnooUhtCAqvLK/qpA+hMlnIodcf9LREQsZarh+HAfQkjzPIWAA22nxwS8I/lXUT2TN4J2lBBmmC7m6FAlKYfgHorcuyV/aHagIgjtHh3jU3PJwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=rl5uwU4O; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=rl5uwU4O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQNfG4yCRz2y8c
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 01:50:28 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 08C8E240101
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 15:50:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736002221; bh=4bf4pavVpF+pyI0is+w3RLenY4A2F6NwCECyY2dkxh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=rl5uwU4OuvntDMq8rBgwPUrEwIMd+I66KnWs+1P2lDN9Wioj0EorFsJyO98e7j/ER
	 9XdobYCPTiK01ZSbjpI6KZ5Adczm7xDguBide8Ax3hUACLWybsGtdA3Si2kgcM0d8e
	 WEESQzlIcvx+kzuVJtwG6Lx27aAQPoKmbz2Y7ofDw4ziS9RKmUKaT4x9zZ3EjE07g9
	 my/m5u12jMh3LjefePQ6U1Dv+0vKthJ+DTz5V0cx9KOaEzQcrUIGhHI6mUtKtWaSh4
	 vHekfylBkksJjfwOBUNWweByFhBHDQjY50QQ/qlUg9QIRm2rPJsjkgTz5L1c/ljSHe
	 8dtzPkrGnceHA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YQNf04cSFz6twh;
	Sat,  4 Jan 2025 15:50:16 +0100 (CET)
Date: Sat,  4 Jan 2025 14:50:16 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 14/19] powerpc: mpc83xx: Switch to of_platform_populate
Message-ID: <Z3lKqLXphxeI1Gvo@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-14-86f78ba2a7af@posteo.net>
 <CAL_JsqKU0AQ+ym_iDZSN5hNUTMF0bgjqu-aAVtG792Mw_eZTbg@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKU0AQ+ym_iDZSN5hNUTMF0bgjqu-aAVtG792Mw_eZTbg@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 02, 2025 at 12:51:47PM -0600, Rob Herring wrote:
> On Thu, Jan 2, 2025 at 12:32 PM J. Neuschäfer via B4 Relay
> <devnull+j.ne.posteo.net@kernel.org> wrote:
> >
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> >
> > Quoting from drivers/of/platform.c:
> >
> > > of_platform_populate() - [...]
> > > Similar to of_platform_bus_probe(), this function walks the device
> > > tree and creates devices from nodes.  It differs in that it follows
> > > the modern convention of requiring all device nodes to have a
> > > 'compatible' property, and it is suitable for creating devices which
> > > are children of the root node (of_platform_bus_probe will only create
> > > children of the root which are selected by the @matches argument).
> >
> > This is useful for new board ports because it means that the C code does
> > not have to anticipate every node that is placed directly under the root.
> >
> > As a consequence, the of_bus_ids list can be much shorter, and I've
> > trimmed it to the necessary parts:
> >
> >  - device-type = "soc" and compatible = "simple-bus" for the SoC bus
> >  - compatible = "gianfar" for the Ethernet controller (TSEC), which
> >    may contain an MDIO bus, which needs to be probed, as a subnode
> >
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >  arch/powerpc/platforms/83xx/misc.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
> > index 1135c1ab923cc120f377a0d98767fef686cad1fe..bf522ee007bbb1429233355f668fc8563d8ca4e2 100644
> > --- a/arch/powerpc/platforms/83xx/misc.c
> > +++ b/arch/powerpc/platforms/83xx/misc.c
> > @@ -94,18 +94,14 @@ void __init mpc83xx_ipic_init_IRQ(void)
> >
> >  static const struct of_device_id of_bus_ids[] __initconst = {
> >         { .type = "soc", },
> 
> of_platform_populate() won't work on this match unless there's a
> compatible in the node, too. Can we use compatible instead or are
> there a bunch of them?

In arch/powerpc/boot/dts, I can find the following cases of device_type
= "soc" without compatible = "simple-bus":

- arch/powerpc/boot/dts/tqm8xx.dts           (MPC8xx)
- arch/powerpc/boot/dts/mpc885ads.dts        (MPC8xx)
- arch/powerpc/boot/dts/mpc866ads.dts        (MPC8xx)
- arch/powerpc/boot/dts/ep88xc.dts           (MPC8xx)
- arch/powerpc/boot/dts/kuroboxHG.dts        (MPC82xx)
- arch/powerpc/boot/dts/kuroboxHD.dts        (MPC82xx)
- arch/powerpc/boot/dts/storcenter.dts       (MPC82xx)
- arch/powerpc/boot/dts/asp834x-redboot.dts  (MPC83xx!)
- arch/powerpc/boot/dts/ksi8560.dts          (MPC85xx)

i.e. there is one affected devicetree. I can simply patch that one in
the next iteration.

> 
> > -       { .compatible = "soc", },
> >         { .compatible = "simple-bus" },
> >         { .compatible = "gianfar" },
> > -       { .compatible = "gpio-leds", },
> > -       { .type = "qe", },
> > -       { .compatible = "fsl,qe", },
> 
> Better still would be if we could move the remaining ones to the
> default table and just call of_platform_default_populate().

of_platform_default_populate does sound preferable.

I'll investigate why exactly the "gianfar" match is necessary and how to
fix it in the corresponding driver (I don't think it's general enough to
warrant being listed in of_default_bus_match_table).


Best regards,
 jn

