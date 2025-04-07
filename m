Return-Path: <linuxppc-dev+bounces-7503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A3A7F040
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 00:23:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWkHl0Kwpz2xqJ;
	Tue,  8 Apr 2025 08:23:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744044268;
	cv=none; b=O85DgMQMNm8VGgXtQfSDaAaE5RnfhSxExFNB0hccTdl8Mj+81MXmHZkoZfFHmmsvUB/EcyqIVTGPkX4ANlmWPTDe4L2THZb5a3sDs/131WFwYOwJr7ERu+u54xkWETNstLEgeLGeTZW7JeE2577Yd4lmQCMEl72rwQO20ut7QhXXshdnI2JWel/XwJBZkzMeJ+jmiYAZxScyCHAMneykTUyvUrCaGseLkzefckZRJAJQo6NslmpsjNhKcbxL+/YSRLw4TWJ0T3dy+MsdE+3XwbFPO9D6C5ks7NuNMxUK+XVaVu7J8KYJXDfpSUfIfpbRmOdiyUMlvlOcuB+8obrzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744044268; c=relaxed/relaxed;
	bh=T37MrcReRu3n4dLXt3U+NVNLtXb9JL/zdt0u4v0w6kk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b3h8pjNVJCAaDD2yQHhOmZV7XhxkY4VC+xPc/pkO1wrR4W2HjhqQYxTGCYdVFLiKkyaJNuqzop9xvrgIUfDIKFmulIZ3ZdDT9qMq6zgy83jiKKnMIGUwJq8VbxeyxGosjhF6m7mOmuZDTXM9IjDBHnHH8rxnH5KtlGxyHvgsd7JilxIGEDy3GXsVtm7NcHKb3zRrelfKmwdejsUHiebfBzOyhmatOkKZOud4ZFADiU+Iq5oJGtV4V07xiCBWepvsjwV52c2luQujaqjEtXUC6dRaM9+jvX5JtWkcA0sKxxTzBcPdvozqNexYpVgy/VH3KVg2Kc/zfArepK0qBX2oXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=CObBzKRS; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=kory.maincent@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=CObBzKRS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=kory.maincent@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWZmp1FSsz2ydw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 02:44:25 +1000 (AEST)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 692905868E6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 16:27:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 024C943DF3;
	Mon,  7 Apr 2025 16:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744043263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T37MrcReRu3n4dLXt3U+NVNLtXb9JL/zdt0u4v0w6kk=;
	b=CObBzKRSeL3FF/dNWuapvRiAGerYon6k1J7eOu+wHYiv/SYAjEC1TrS8OEnMvC9J4gx5tz
	2BPZJmMRr4PoA71CjpwNB2ITH4wo9rTbBOVmD5TonuC4l5kqbZRKeH+ok6zIBy793sE4PG
	t2aJE8rZ25xbV2tWEgfkK00Sk6TVYVnRYLQo9oe9hn/ckUxe9RpDAs0wmyrTvi+x1oOGRq
	9gruGm8B08dtES4D6QVlqBnQQjmCrxAsrnx5R69zSz/D3U1Yf+dxZkSI9/20h/EKu+5ZJV
	pBZ95mXvYPNfC5yr3qXNex+r4MWhxUhGkUyfMo3iuX9RYCFhZ78PGZhEX8mICg==
Date: Mon, 7 Apr 2025 18:27:38 +0200
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
Message-ID: <20250407182738.498d96b0@kmaincent-XPS-13-7390>
In-Reply-To: <20250403181907.1947517-1-sean.anderson@linux.dev>
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfduveekuedtvdeiffduleetvdegteetveetvdelteehhfeuhfegvdeuuedtleegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegledprhgtphhtthhopehsvggrnhdrrghnuggvrhhsohhnsehlihhnuhigrdguvghvpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegur
 ghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhk
X-GND-Sasl: kory.maincent@bootlin.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu,  3 Apr 2025 14:18:54 -0400
Sean Anderson <sean.anderson@linux.dev> wrote:

> This series adds support for creating PCSs as devices on a bus with a
> driver (patch 3). As initial users,
>=20
> - The Lynx PCS (and all of its users) is converted to this system (patch =
5)
> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
> - The Cadence MACB driver is converted to support external PCSs (namely
>   the Xilinx PCS) (patches 9-10).
>=20
> The last few patches add device links for pcs-handle to improve boot time=
s,
> and add compatibles for all Lynx PCSs.
>=20
> Care has been taken to ensure backwards-compatibility. The main source
> of this is that many PCS devices lack compatibles and get detected as
> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
> the devicetree to add appropriate compatibles.

I don't dive into your patch series and I don't know if you have heard abou=
t it
but Christian Marangi is currently working on fwnode for PCS:
https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com

Maybe you should sync with him!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

