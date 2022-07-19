Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D742B57A355
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 17:38:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnNKS6C1Kz3ds4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 01:38:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fk80keQB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fk80keQB;
	dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnNJr4H6Vz3byL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 01:38:19 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id l23so27926265ejr.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 08:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qnD9woDxfn+LSOscfoHzvBXGTCCBlK5kWUK/hmrm5mc=;
        b=Fk80keQB94yN1hbOFQ/8Ik5Dn9qiQizXFjlxyiFnOIDjj72zZryknDAIRwKat35COn
         +g0IvgCMxP7p10jhYIzT40U5BaoqkG0DTfQu17WaQl7LSW8FbPLWr5beE0bClHN7vfI5
         QX0wRoDtYjxJn3mp/8Utao5/XI+8/wOB29nWOvd5Mof/UnO/Pv3D4ytDzD2qfzp0Kbe8
         aDhWld/Pid6oLQ2LEXnCXrybVDU0psRQKzsCromDxv98lw1l2FKTcgPkGgRuG7QQhIW1
         kfs6zo4Tzg+qSTSQep4w+4prkaQm2Lx2E3nx4DiI6udE/ynQaH1Hc7VAfFKu8qGrudA3
         jygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qnD9woDxfn+LSOscfoHzvBXGTCCBlK5kWUK/hmrm5mc=;
        b=Nbb6Mtvs1zWO0s9PtFJc3abBuOoeF4vg/RkY8XXiO0vqVwynDawbtcqi/babrfsp0n
         0QDUEjt3Vz+IpdKsMmvg0lkKg2mCHbvNTU8MetZb6AentKF+tIJJR0MGddueN2XxthIe
         qEpHo7l5sl9y1t2f3kuwqRc+E66u1hSJe3NkFpzulRTUne3AUKlFRxKi/tsqZAYN9Tad
         K+yPXuf4dRgwpclbQHXHhD065O1N2U4ZH8GjRUN8K21Ddn91OzAbgLSA1IwMMkya558D
         PkP3LbBtnlJoHYQ8eUgW1WbvlVo0Y9iRGm6ctUj3S/OAOHqDWGg/PEYwssvJeWluaTx2
         Ua1g==
X-Gm-Message-State: AJIora9hUAhPzZ3a4Rb8+ZfxW9NtaS9xeDP+vpYf3yBzqjpmaUf9P5Yb
	piUpJvECPv9BCmzKmG8BZYc=
X-Google-Smtp-Source: AGRyM1sF+tywVSO3QfunBktfmfaVi0fddzmm/dxFRUi3UiykwFMhU7B4f2YxJkBqXVs7l0XmJXPUNw==
X-Received: by 2002:a17:907:16ab:b0:72c:7533:7262 with SMTP id hc43-20020a17090716ab00b0072c75337262mr29330300ejc.288.1658245095723;
        Tue, 19 Jul 2022 08:38:15 -0700 (PDT)
Received: from skbuf ([188.27.185.104])
        by smtp.gmail.com with ESMTPSA id s9-20020a170906a18900b00722e5b234basm6939832ejy.179.2022.07.19.08.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 08:38:14 -0700 (PDT)
Date: Tue, 19 Jul 2022 18:38:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [RFC PATCH net-next 0/9] net: pcs: Add support for devices
 probed in the "usual" manner
Message-ID: <20220719153811.izue2q7qff7fjyru@skbuf>
References: <20220711160519.741990-1-sean.anderson@seco.com>
 <20220719152539.i43kdp7nolbp2vnp@skbuf>
 <bec4c9c3-e51b-5623-3cae-6df1a8ce898f@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bec4c9c3-e51b-5623-3cae-6df1a8ce898f@seco.com>
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

On Tue, Jul 19, 2022 at 11:28:42AM -0400, Sean Anderson wrote:
> Hi Vladimir,
> 
> On 7/19/22 11:25 AM, Vladimir Oltean wrote:
> > Hi Sean,
> > 
> > On Mon, Jul 11, 2022 at 12:05:10PM -0400, Sean Anderson wrote:
> >> For a long time, PCSs have been tightly coupled with their MACs. For
> >> this reason, the MAC creates the "phy" or mdio device, and then passes
> >> it to the PCS to initialize. This has a few disadvantages:
> >> 
> >> - Each MAC must re-implement the same steps to look up/create a PCS
> >> - The PCS cannot use functions tied to device lifetime, such as devm_*.
> >> - Generally, the PCS does not have easy access to its device tree node
> >> 
> >> I'm not sure if these are terribly large disadvantages. In fact, I'm not
> >> sure if this series provides any benefit which could not be achieved
> >> with judicious use of helper functions. In any case, here it is.
> >> 
> >> NB: Several (later) patches in this series should not be applied. See
> >> the notes in each commit for details on when they can be applied.
> > 
> > Sorry to burst your bubble, but the networking drivers on NXP LS1028A
> > (device tree at arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi, drivers
> > at drivers/net/ethernet/freescale/enetc/ and drivers/net/dsa/ocelot/)
> > do not use the Lynx PCS through a pcs-handle, because the Lynx PCS in
> > fact has no backing OF node there, nor do the internal MDIO buses of the
> > ENETC and of the switch.
> > 
> > It seems that I need to point this out explicitly: you need to provide
> > at least a working migration path to your PCS driver model. Currently
> > there isn't one, and as a result, networking is broken on the LS1028A
> > with this patch set.
> > 
> 
> Please refer to patches 4, 5, and 6.

I don't understand, could you be more clear? Are you saying that I
shouldn't have applied patch 9 while testing? When would be a good
moment to apply patch 9?
