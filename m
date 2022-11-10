Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C8E62471D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 17:35:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7SBC3nNDz3cLW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 03:35:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=prm2DHsV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=prm2DHsV;
	dkim-atps=neutral
X-Greylist: delayed 1891 seconds by postgrey-1.36 at boromir; Fri, 11 Nov 2022 03:34:41 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7S9F5VS6z3cKL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 03:34:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=D8Um2SWESyWwAoQ0Hp9/x5Na8vtfvbENXwnpCxX3ROY=; b=prm2DHsV5YAlzHXZNaeodoW5qC
	KVVvbi+niGkOnDkEvts551Z+HwtHFPgpmktCmgRrcb0AlY/sV9SjYkuMr7//dCosqX+cHwzBAcIl8
	51BgYUtbIUd847zJCt9gtMNirT5IcN7UXZGK2iU+5LK8KT+fnoZAvqaRT2ddP2LCgJ9Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ot9zi-0022yz-Er; Thu, 10 Nov 2022 17:01:34 +0100
Date: Thu, 10 Nov 2022 17:01:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v2 00/11] net: pcs: Add support for devices
 probed in the "usual" manner
Message-ID: <Y20gXppMemnHSTG9@lunn.ch>
References: <20221103210650.2325784-1-sean.anderson@seco.com>
 <20221109224110.erfaftzja4fybdbc@skbuf>
 <bcb87445-d80d-fea0-82f2-a15b20baaf06@seco.com>
 <20221110152925.3gkkp5opf74oqrxb@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110152925.3gkkp5opf74oqrxb@skbuf>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Madalin Bucur <madalin.bucur@nxp.com>, Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, Frank Rowand <frowand.list@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Saravana Kannan <saravanak@google.com>, Sean Anderson <sean.anderson@seco.com>, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux
 -kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Vladimir Oltean <olteanv@gmail.com>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 10, 2022 at 03:29:26PM +0000, Vladimir Oltean wrote:
> On Thu, Nov 10, 2022 at 09:55:32AM -0500, Sean Anderson wrote:
> > On 11/9/22 17:41, Vladimir Oltean wrote:
> > > On Thu, Nov 03, 2022 at 05:06:39PM -0400, Sean Anderson wrote:
> > >> Several (later) patches in this series cannot be applied until a stable
> > >> release has occured containing the dts updates.
> > > 
> > > New kernels must remain compatible with old device trees.
> > 
> > Well, this binding is not present in older device trees, so it needs to
> > be added before these patches can be applied. It also could be possible
> > to manually bind the driver using e.g. a helper function (like what is
> > done with lynx_pcs_create_on_bus). Of course this would be tricky,
> > because we would need to unbind any generic phy driver attached, but
> > avoid unbinding an existing Lynx PCS driver.
> 
> If you know the value of the MII_PHYSID1 and MII_PHYSID2 registers for
> these PCS devices, would it be possible to probe them in a generic way
> as MDIO devices, if they lack a compatible string?

That is not how it currently works. If a device on an MDIO bus has a
compatible, it is assumed to be an mdio device, and it is probed in a
generic way as an sort of mdio device. It could be an Ethernet switch,
or Broadcom has some generic PHYs which are mdio devices, etc.

If there is no compatible, the ID registers are read and it is assumed
to be a PHY. It will be probed as a PHY. The probe() function will be
given a phydev etc.

It will need some core changes to allow an mdio device to be probed
via the ID registers.

    Andrew
