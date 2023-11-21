Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE317F2692
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 08:44:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dT42X7ba;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZGbz5nt7z3ck4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 18:44:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dT42X7ba;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZGb56bWdz3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 18:43:41 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B32381C0015;
	Tue, 21 Nov 2023 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700552615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t3xCJjkxWbDTmhyET+JWYTIEBodqcC4r6MWWY/ifhBQ=;
	b=dT42X7baSXiBorHZH4H94BtPqndNDcp8eqbqRa5/266PjA697mrwQZuiFMOFV3bqC+LFYf
	JD9t8zFm7iJBbo/uCf/mKJjOP3PTC3GmJI37eI7GTOjuJ8ITZp/wQUz3EpxNLl97kL/Ydd
	npP0GpYKiS9dmO5mpmTMbiXDcLLjlmnLf9w/QSqE/jx7Nk+ez5MHwmRVfmhMUj3fQVPeVf
	1mjEET4IRfcoEu+gEy02lqEJPcaybC3vZ0djc8RWppQTbNOLGdI5ALeXmq/2hlPmpc12Dm
	w/HPmiPybkosUJleovl4ltfmbt1SZUteSF/8l7z5wxKTA+iJ8rqKQbSTnAEgQg==
Date: Tue, 21 Nov 2023 08:43:30 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Li
 Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v9 00/27] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231121084330.4064bf14@bootlin.com>
In-Reply-To: <573c9ca1-a560-4f7a-ba21-80673a2e162e@sirena.org.uk>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
	<20231117164746.0589e955@kernel.org>
	<573c9ca1-a560-4f7a-ba21-80673a2e162e@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft
 .net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark, Jakub, Qiang, Li,

On Mon, 20 Nov 2023 13:30:08 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Fri, Nov 17, 2023 at 04:47:46PM -0800, Jakub Kicinski wrote:
> > On Wed, 15 Nov 2023 15:39:36 +0100 Herve Codina wrote:  
> > >    - Removed Patches 6, 7 and 8 (patches applied)
> > > 
> > >    - Patches 7, 20, 21, 23 (patches 10, 23, 24, 26 in v8)
> > >      Add 'Acked-by: Jakub Kicinski <kuba@kernel.org>'  
> 
> > I thought someone (Mark?) asked for the networking stuff to be put 
> > on a branch. If that's still the preference - is it possible to factor
> > these out as a standalone series, too?  Will they build on their own?  
> 
> Yes, can we *please* at least get the generic non-driver bits of this
> series moving - they seem uncontroversial as far as I can see and are a
> tiny portion of the overall 20 patches.  Patches 21-23 look like they
> can go on a branch in the net tree?

Patch 21 is the framer infrastructure.
Patches 22-25 are the driver for the PEF2256 framer.
Note that patch 24 is the pinmux part of the framer and, IHMO, can be
taken too.
Patch 23 need to be fixed (kernel test robot). The fix will be quite
minor (depends on HAS_IOMEM on the Kconfig file).

For the SoC part (QUICC ENGINE QMC and TSA), what will be the plan ? 
Qiang, Li, any opinion ?

I plan to send the v10 with the patch 23 fixed.
Based on that v10, some patches (21 to 25 at least) could be applied and
I will remove them for the future v11.
I think it will be easier to follow if I iterate on the series removing
patches as soon as they are applied.

Of course, please, let me know if this is not the right way to do.

Best regards,
Hervé
