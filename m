Return-Path: <linuxppc-dev+bounces-7504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0997A7F043
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 00:23:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWkJ85HGZz2xrJ;
	Tue,  8 Apr 2025 08:23:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.201
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744044700;
	cv=none; b=lL8BhnU7WksKwginOE2wPtRlIQZ0vbvs2+5zM5LtK74FZMquhKgUyV96+D6cehJElNdqo0HeAuaR2eA9203E24fRIzww76nplo6JPT5OShQu/KX9hbe8jCJrvmGDWq+SiOyEUaSihpZPHMq4919G7ojmmu8fs7V4wPPkUR/HY4QJSxHTTXn6hAsdAS+bgftNe2B9FuQordE1NbQUBkKVLeO0ceVAgZR7nl9RSeJMXmgF9fFt0AwJeDVFLynDvJk4t+hWaR0r37i+X6/VfvmuwREwuQh2DRZ6NrNkXfYBQDVAZXLH0WGQXKmQylGQ5IKEFpgyugi95y8Jo7YoQRsVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744044700; c=relaxed/relaxed;
	bh=H1iMwU3ajJMnMcuSPtx2gxJdVmNL3/UCZFSDfHMc86M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SoPKyeOXV8ciJrkJPZAen6nRvAqpgZdUTeQsl3GmK+TnLED+hGwdUgDSzML5QIYbUyk6qNH/LHVZjWPYHb6V+J1SmEZTh3j+0gwtOn6pvE/fXvBd807l3ET/kHo6q+6GLJCV59DfOGQa/u8FGxrhdMe+1l2h5x9Td5bNqeM1TO0dJsI57ZtvIT1x19aJZhcJgIrQ7joWzUUoTuIxOAuoPW/M/5w6qScdp1ibe4g1bc4ySe1Mmk60EBKHTSeWxAXJPaCH1A3YzbDn6mNynppfHJQowSp/wije/fLbrZzGNfPcxwHHjpMvBkVHnh3LjJZkMoYnxH8zc48i9gJn4XNnsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=QYtsHvD9; dkim-atps=neutral; spf=pass (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=QYtsHvD9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1429 seconds by postgrey-1.37 at boromir; Tue, 08 Apr 2025 02:51:39 AEST
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWZx72Sx5z2yrH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 02:51:38 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D6084439C;
	Mon,  7 Apr 2025 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744044694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H1iMwU3ajJMnMcuSPtx2gxJdVmNL3/UCZFSDfHMc86M=;
	b=QYtsHvD9DTOGiFETvj+We/hzG7h1j54bIDzufGVCgmf9PbORkltx0JqHpWe+aPyMEzw+BY
	BLDFSYOw4BRIzx3SstgbwbImXzPVHlUsTqWNRXQMNtJwh5XyQjekREZy25k9HxtytuDyZN
	qV59Wm1ThVZCXTV3w9PeAglD6hgRNxlH/IwDQIUaCvNdsDNQovSjkUY3vwG7oobLiOXONu
	3fcpBrr6eKbvYY2tiur2Zp4fDRRWjdS+BQCz++nt2rDXujLJerJnif/Ws3w7qaHXJ5i+Nh
	B4dnM/nggzNsA6Hna2/Z08ckKMc22MO7DWqmr40zEGjIdMt7bvIlwiAJxj0IUQ==
Date: Mon, 7 Apr 2025 18:51:29 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Christian Marangi
 <ansuelsmth@gmail.com>, upstream@airoha.com, Heiner Kallweit
 <hkallweit1@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Clark Wang <xiaoning.wang@nxp.com>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, Joyce Ooi
 <joyce.ooi@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Li Yang
 <leoyang.li@nxp.com>, Madalin Bucur <madalin.bucur@nxp.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal
 Simek <michal.simek@amd.com>, Naveen N Rao <naveen@kernel.org>, Nicholas
 Piggin <npiggin@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Rob Herring
 <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Robert Hancock
 <robert.hancock@calian.com>, Saravana Kannan <saravanak@google.com>, Shawn
 Guo <shawnguo@kernel.org>, UNGLinuxDriver@microchip.com, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
Message-ID: <20250407185129.654e7c9c@kmaincent-XPS-13-7390>
In-Reply-To: <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
	<20250407182738.498d96b0@kmaincent-XPS-13-7390>
	<720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfduveekuedtvdeiffduleetvdegteetveetvdelteehhfeuhfegvdeuuedtleegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegledprhgtphhtthhopehsvggrnhdrrghnuggvrhhsohhnsehlihhnuhigrdguvghvpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegur
 ghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhk
X-GND-Sasl: kory.maincent@bootlin.com
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 7 Apr 2025 12:33:28 -0400
Sean Anderson <sean.anderson@linux.dev> wrote:

> On 4/7/25 12:27, Kory Maincent wrote:
> > On Thu,  3 Apr 2025 14:18:54 -0400
> > Sean Anderson <sean.anderson@linux.dev> wrote:
> >  =20
> >> This series adds support for creating PCSs as devices on a bus with a
> >> driver (patch 3). As initial users,
> >>=20
> >> - The Lynx PCS (and all of its users) is converted to this system (pat=
ch 5)
> >> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6=
-8)
> >> - The Cadence MACB driver is converted to support external PCSs (namely
> >>   the Xilinx PCS) (patches 9-10).
> >>=20
> >> The last few patches add device links for pcs-handle to improve boot t=
imes,
> >> and add compatibles for all Lynx PCSs.
> >>=20
> >> Care has been taken to ensure backwards-compatibility. The main source
> >> of this is that many PCS devices lack compatibles and get detected as
> >> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
> >> the devicetree to add appropriate compatibles. =20
> >=20
> > I don't dive into your patch series and I don't know if you have heard
> > about it but Christian Marangi is currently working on fwnode for PCS:
> > https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.c=
om
> >=20
> > Maybe you should sync with him! =20
>=20
> I saw that series and made some comments. He is CC'd on this one.

Oh indeed, you have replied on his v1, sorry I missed it.
It seems he forgot to add you in CC in the v2.

> I think this approach has two advantages:
>=20
> - It completely solves the problem of the PCS being unregistered while the
> netdev (or whatever) is up
> - I have designed the interface to make it easy to convert existing
>   drivers that may not be able to use the "standard" probing process
>   (because they have to support other devicetree structures for
>   backwards-compatibility).

Ok, thanks for the clarification!
I was working on the axienet driver to add support for the 10G version that=
's
why I discovered your series.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

