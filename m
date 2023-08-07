Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D88B7727F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 16:37:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HmQ6EWLU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKJnQ4LpSz30fm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 00:37:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HmQ6EWLU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKJmM6qDlz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 00:36:34 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7938E0008;
	Mon,  7 Aug 2023 14:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691418990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CoovJrYPxkDFGogd5wvVhZC1R5Dq4lKn3YHaDGn4/LM=;
	b=HmQ6EWLUrDj97BUk7IGsXLcmAJ2miJvyMgaSQlOietWT5pvqGoMYmO6yr+Bhc0Lx67tKD6
	df7Z6+KBom37uNEQWfw8FJht1ZSI3QWLiHNjcNXBmvIwSynDxYMQivLHbJtb7uzGw5pJZ2
	EAinCJbElQ6rO13JeWO3s9sPGU4+27Q8M5T52pS7PcbF+R8WyuQKAjhFeLCmKcp+6TWkuR
	IdO0UMWLzMibIMpfP4ahj/zKwHCDxTgVc0R059ZGQaSUIC06o5hsPMQ2XYgtkWYBNaUzS4
	qP1VmAe+U2gpEDS1hmzhbhx0eTbGq6h1G2uNh4GG0oC80TOYZeIgosi77P7S8A==
Date: Mon, 7 Aug 2023 16:36:26 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 24/28] pinctrl: Add support for the Lantic PEF2256
 pinmux
Message-ID: <20230807163626.79a5ca7b@bootlin.com>
In-Reply-To: <eb99e739-6578-4aee-a0f4-7a0c5e5e81ef@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-25-herve.codina@bootlin.com>
	<CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
	<CACRpkdZebvrdGXooLXmgXhUcgdgxBczJBpdEoEyJDR39abaAqQ@mail.gmail.com>
	<eb99e739-6578-4aee-a0f4-7a0c5e5e81ef@lunn.ch>
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
Cc: alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Linus, Andrew,

On Mon, 7 Aug 2023 15:17:11 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Mon, Aug 07, 2023 at 03:06:42PM +0200, Linus Walleij wrote:
> > On Mon, Aug 7, 2023 at 3:05 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >   
> > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> > >
> > > So it is a bridge chip? Please use that terminology since Linux
> > > DRM often talks about bridges.  
> > 
> > Replying to self: no it's not a bridge, it's a WAN thingy.
> > 
> > So perhaps write that this is a WAN interface adapter chip.  
> 
> Hi Linus
> 
> In the E1/T1/J1 world, framer is a well understood concept. Maybe the
> text needs a bit more background information to explain what this is
> to somebody who does not have an old school telecoms background.
> 
>    Andrew

Maybe I can add in my commit log:
--- 8< ---
This kind of component can be found in old telecommunication system.
It was used to digital transmission of many simultaneous telephone calls
by time-division multiplexing. Also using HDLC protocol, WAN networks
can be reached through the framer.
--- 8< ---

Do you think it will be better ?

Regards,
Hervé Codina

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
