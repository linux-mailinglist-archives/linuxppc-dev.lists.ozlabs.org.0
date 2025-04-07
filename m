Return-Path: <linuxppc-dev+bounces-7505-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A1DA7F04A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 00:27:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWkNw60TXz2yGN;
	Tue,  8 Apr 2025 08:27:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:2ec0:3002::65"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744048345;
	cv=none; b=mpCJdVa6EGa2jp9p/BTjtV09JM9sUM4icKeEn9KWZbM3xQhNKInjsKmiWjtzKb0Rsn7/BdEIP1ABKHouzDXuIgRAtdqWvBkLpVzn/pnxzpTEN+Bw3g2fN0rmtCwzDyW8m/QwfTbr/ZqAS4WF81hJms04/G/a2O21PfwcSz8rRSoRQB/+j65u/rgyfKK/gIr5kB5D+H1VQVseJI+mE+CPIQVaY32AmHb+skY0aMaK/iuSIlTjgPdJCBiIlkWLds5yFyb3Yb/3+HetE2XlF6LxHn3Ob5G+efsLAwxctgY7+Xb4WLo8YtRsW7qu3jAbeC2O/cv0xrzVX7xeTN6OTPsLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744048345; c=relaxed/relaxed;
	bh=++nZliEInb52Af0F7ImnPYG12hmNF9tNL0uCFy3jTw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDDPLUestUvC43yBwQXPAqHGtLEnCk5k8JcfFIKR4FyrZyE7zBEI0goZ2RLstHZZbsT+/d1ks6f+QZOV268gmGSu22sYGXs83mT1FSF/SO/Jn/dZySUnHCk8R3wKnFsVz6vveNIaLWTLMw2ediGjwXwbHJYKWrk38HtZ2uF+DjAc30sqgzPWVetme5+s3g3mwnciQeYm/ow4uUBhcPzsPhk6U0hfM5yTudzlXpWnQegHpdEWTwMhOuz+Z9tXcSMoTD8rdQS8xPcUkOWop6DJDgCGyu0w3BZwJrNQi+rL9nCEYvnxIebC+ahY3dXj6/PgOFBqrc4+RjIJTK0qYkC3IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass (client-ip=2a07:2ec0:3002::65; helo=pidgin.makrotopia.org; envelope-from=daniel@makrotopia.org; receiver=lists.ozlabs.org) smtp.mailfrom=makrotopia.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=makrotopia.org (client-ip=2a07:2ec0:3002::65; helo=pidgin.makrotopia.org; envelope-from=daniel@makrotopia.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 1548 seconds by postgrey-1.37 at boromir; Tue, 08 Apr 2025 03:52:22 AEST
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [IPv6:2a07:2ec0:3002::65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWcHB0yPQz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 03:52:22 +1000 (AEST)
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u1qEH-000000008Gs-2MWH;
	Mon, 07 Apr 2025 17:25:49 +0000
Date: Mon, 7 Apr 2025 18:25:43 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Sean Anderson <sean.anderson@linux.dev>,
	Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	upstream@airoha.com, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>, Joyce Ooi <joyce.ooi@intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Li Yang <leoyang.li@nxp.com>, Madalin Bucur <madalin.bucur@nxp.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <michal.simek@amd.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Robert Hancock <robert.hancock@calian.com>,
	Saravana Kannan <saravanak@google.com>,
	Shawn Guo <shawnguo@kernel.org>, UNGLinuxDriver@microchip.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
Message-ID: <Z_QKl-4563l05WB3@makrotopia.org>
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390>
 <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
 <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com>
 <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
 <CA+_ehUzeMBFrDEb7Abn3UO3S7VVjMiKc+2o=p5RGjPDkfLPVtQ@mail.gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUzeMBFrDEb7Abn3UO3S7VVjMiKc+2o=p5RGjPDkfLPVtQ@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Apr 07, 2025 at 07:21:38PM +0200, Christian Marangi (Ansuel) wrote:
> Il giorno lun 7 apr 2025 alle ore 19:00 Sean Anderson
> > I agree that a "cells" approach would require this, but
> >
> > - There are no in-tree examples of where this is necessary
> > - I think this would be easy to add when necessary
> >
> 
> There are no in-tree cause only now we are starting to support
> complex configuration with multiple PCS placed outside the MAC.
> 
> I feel it's better to define a standard API for them now before
> we permit even more MAC driver to implement custom property
> and have to address tons of workaround for compatibility.

Qualcomm's PCS driver will require offering multiple phylink_pcs by a
single device/of_node. So while it's true that there is currently no
in-tree user for that, that very user is already knocking on our doors.

See
https://patchwork.kernel.org/project/netdevbpf/list/?series=931658&state=*

