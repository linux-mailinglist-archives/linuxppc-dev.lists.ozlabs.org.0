Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E8757A2EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 17:26:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnN312TMTz3dpD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 01:26:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UzC/7xvo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UzC/7xvo;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnN2P6lVZz2xmy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 01:25:47 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id os14so27877143ejb.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZH7Pn/I57bUXWGtdU7bf61RroXUjVX251kWCY9hsq4Y=;
        b=UzC/7xvopJVsdv4jGEBq7Tu9ikuO292arAqnpQ2ZVsAceyfPUCVZcdWYAi990sEklL
         /Qrq6zYv6QrfMYoNlYWyzJdKqSsnQHVBtV1ouUjeF5y8gB0EbdsI0DnoEI/MyUE5kyP7
         57XKUbiEcCjX9w8hYQLVdQH3xbh/Xay54IipVmAlw7p9ZW05KEmShvf+uCEeOw7VHOrG
         01dlbrAY0kqao12sE1/wPCS0nhzjFuEVY8VlyDlbOSmzLd1FEiznk+fZpWlRczAe3Skh
         EHeRu8tXebfjb5zQ6hUs8mQjdcu0VgKsSM/DYKTkQD9Xp+p+u/ZMiK/0szWaBLppvuq7
         AB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZH7Pn/I57bUXWGtdU7bf61RroXUjVX251kWCY9hsq4Y=;
        b=7kv+SSpL4uzIuv/bzpjO02eHWzwrF3EEKZ+Zoa+AMz64rkGl8M2dprRGkl+mEubQNk
         jXeHxThIP/lNfTrlRj8myqPX2EoH74t4TkzQf9QWRsItX8F8hO+u3O1XH5sqmnbRQjjZ
         3lENxbiEGskN86fB61KIKpWHRQg4gB6kETMKirWBZmfvnunx/6yEy3AjzYzYQk4FHUfd
         onTvHdX+dbwT7zh8nZ2OdAse+8vBYqMv1EGqiSsyRQjeqijm0DwGuUw6x/pItRxK4Ac+
         va38WKJe2XcTyhGU/9uipE63fq7nXLyjeklO95PpOhowTtqOtiBW/rpJLMWWizNOEqf2
         pLsg==
X-Gm-Message-State: AJIora+WOPVTLUibo8RdZQQfccYBmUr4heSJSYf6BaSZezIf7bW9K04b
	Zx+VinjbSYjvgL+Zv/JF6VU=
X-Google-Smtp-Source: AGRyM1vatk5TFzxFEFwNt9LS2/4BdxUT9VICrFNvS8bqC/Uv8jcKr5XKGx9RSbKWcCXHBrrbqPW8UQ==
X-Received: by 2002:a17:906:5d04:b0:722:f46c:b891 with SMTP id g4-20020a1709065d0400b00722f46cb891mr31704110ejt.4.1658244343619;
        Tue, 19 Jul 2022 08:25:43 -0700 (PDT)
Received: from skbuf ([188.27.185.104])
        by smtp.gmail.com with ESMTPSA id a15-20020a1709066d4f00b00715705dd23asm6772150ejt.89.2022.07.19.08.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 08:25:42 -0700 (PDT)
Date: Tue, 19 Jul 2022 18:25:39 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [RFC PATCH net-next 0/9] net: pcs: Add support for devices
 probed in the "usual" manner
Message-ID: <20220719152539.i43kdp7nolbp2vnp@skbuf>
References: <20220711160519.741990-1-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711160519.741990-1-sean.anderson@seco.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Madalin Bucur <madalin.bucur@nxp.com>, Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, UNGLinuxDriver@microchip.com, Frank Rowand <frowand.list@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Saravana Kannan <saravanak@google.com>, Russell King <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.c
 om>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sean,

On Mon, Jul 11, 2022 at 12:05:10PM -0400, Sean Anderson wrote:
> For a long time, PCSs have been tightly coupled with their MACs. For
> this reason, the MAC creates the "phy" or mdio device, and then passes
> it to the PCS to initialize. This has a few disadvantages:
> 
> - Each MAC must re-implement the same steps to look up/create a PCS
> - The PCS cannot use functions tied to device lifetime, such as devm_*.
> - Generally, the PCS does not have easy access to its device tree node
> 
> I'm not sure if these are terribly large disadvantages. In fact, I'm not
> sure if this series provides any benefit which could not be achieved
> with judicious use of helper functions. In any case, here it is.
> 
> NB: Several (later) patches in this series should not be applied. See
> the notes in each commit for details on when they can be applied.

Sorry to burst your bubble, but the networking drivers on NXP LS1028A
(device tree at arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi, drivers
at drivers/net/ethernet/freescale/enetc/ and drivers/net/dsa/ocelot/)
do not use the Lynx PCS through a pcs-handle, because the Lynx PCS in
fact has no backing OF node there, nor do the internal MDIO buses of the
ENETC and of the switch.

It seems that I need to point this out explicitly: you need to provide
at least a working migration path to your PCS driver model. Currently
there isn't one, and as a result, networking is broken on the LS1028A
with this patch set.
