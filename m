Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 996DA7A43C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 10:03:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=mTtoy6Qk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpy3136Pgz3c9y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 18:03:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=mTtoy6Qk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rpy274HJjz2ygy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 18:02:21 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CE67240003;
	Mon, 18 Sep 2023 08:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695024135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Swps3A5n7FEUQFidSq00HP9HJSFws8n5Srz8c0lIaak=;
	b=mTtoy6QkMgiN1fFQIcZ/I6T7HLsDUUmwQoWtrmWRlgrRvSas5Y7ZueYbwoJcUN5yMH2yE2
	rj4dWdQ6co74kek9BKb9F/H6NwOQRX4Jex9aAufBH2aMxpqfbXgnKTgSouDPKghgm3ZIbN
	0VKiQ8YK/f5peyquPIPxk8etPNK4sD54n5G2AQQ80Rx2zng9rBXyVd6nnujIr6FHdWS3ip
	lu2JQGyBg2Xug/JUmjSiIku/CdJGdk7gFmSxLSKKbxxqutDwplBgwnF91+lH+N1nRl0Raz
	oFEGjruxqwEzZCtgwWJYoWD0cq3f49JsenqqV9fSu+rmaOvAaMEcs4CM3BlnmA==
Date: Mon, 18 Sep 2023 10:02:10 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 25/31] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230918100210.2946f1e0@bootlin.com>
In-Reply-To: <20230918094919.03835d40@bootlin.com>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
	<20230912101444.225809-1-herve.codina@bootlin.com>
	<20230912-overplay-donated-080eb97803d6@spud>
	<992a2b31-e21f-eee3-8bfc-a65b69fe5bd7@csgroup.eu>
	<20230918094919.03835d40@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.or
 g>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor@kernel.org>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Simon Horman <horms@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 18 Sep 2023 09:49:19 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Christophe,
> 
> On Tue, 12 Sep 2023 18:49:26 +0000
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
> > Le 12/09/2023 à 20:13, Conor Dooley a écrit :  
> > > Yo,
> > > 
> > > I'm not au fait enough with this to leave particularly meaningful
> > > comments, so just some minor ones for you.
> > > 
> > > On Tue, Sep 12, 2023 at 12:14:44PM +0200, Herve Codina wrote:    
> > >> The Lantiq PEF2256 is a framer and line interface component designed to
> > >> fulfill all required interfacing between an analog E1/T1/J1 line and the
> > >> digital PCM system highway/H.100 bus.
> > >>
> > >> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>    
> > > 
> > > Missing a co-developed-by?    
> > 
> > No, I guess it's a left-over of version v4 that I sent-out while Hervé 
> > was AFK.
> > 
> > If a v6 is sent I think this line can be removed.  
> 
> May I move to reviewed-by ?

Your signed-of tag is present on all patches (left-over of version v4)
May I remove your signed-of (or move to reviewed-by if relevant) in all patches
present in this series ?

Best regards,
Hervé

> 
> > 
> > Christophe  
> 
> 
> 



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
