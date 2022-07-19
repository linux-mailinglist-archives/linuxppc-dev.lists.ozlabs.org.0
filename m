Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD29857A634
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 20:12:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnRk461z2z3dp1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 04:11:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k7cidDMq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k7cidDMq;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnRjQ4Fvnz2xt3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 04:11:21 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id j22so28749209ejs.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oFQ5ZoRQ7xPvEwHpT6dAI/Y5WSqaXBBPZHaMSxK+Pcw=;
        b=k7cidDMqq4R9oKOShik+Ajeb6Eb7qxkxuepRuZ3cwNVjjVnas8OG5VYKHSMBO2/X7t
         WLT0xAL5Zn+l/+bmIEXnyt5y9VYk+91PrjKoEGQ0OZCLg1y6O1/ZLTsFQoePt84MUqze
         smT6BeYNwVU8u60qtdZjuljctDReYPEaQgmabWuSW2ucNepkYMPo5xO3duqRnkIgh7lc
         kj/UmBovaggwwiIZOvlqXyQ4ZbU3G0C8kEbV8LtdIeDh5Xc/Si923Nw4hLvD8mFoQC8B
         8uysVk+KVZTYFAT3NxHpLUGluI0NgqGdo/0tcuaVuMy1NfTxzs9pjcXPBEFtTinhPcH4
         jg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oFQ5ZoRQ7xPvEwHpT6dAI/Y5WSqaXBBPZHaMSxK+Pcw=;
        b=i+JrG2N6QXxDN1yFCDIA7iQzaE67TAE1+jW2E8VWnMVP8w7mwL+wKM++3Rjduqwjgz
         cfk1zrzjt9cQZ9hfoqOoXkQyh0J9dhjZl0xvL5w7/6IGidw2uXc+kUKbq8VOFMVK9PpH
         ahI1jngXYXqVJS69NCbG3WkN6ICPCr6v7fqw34tGTZBWH0yGVu3bo1w0y76b8kTSWOvb
         XDTz1ao/7zxlUuUzcRt0vZobTtSbXsRLABzrxg2TiG8ET7tCl/lywFEyCUyean5Pwumy
         vrvJxM5LvUWem3DcDUehy1Nsnk3jTFtJYZ4Al8FJKVA92y67NmTKq0gYIzMkVmxM+F1y
         wrJA==
X-Gm-Message-State: AJIora9uo8wwrbx7DtJkYqZy+BS8YZUpvz/i9h8H/qraYN6HASobodZs
	ti/qavkKbYYAsXAQJ49bSOQ=
X-Google-Smtp-Source: AGRyM1vrzPMh3dqrjGlhh3PwAnXW4KQokX/IMs0HL8VvNPn0GxhvoxzZ3J4dVwz2x5GzvwSBHdZVLA==
X-Received: by 2002:a17:907:7b92:b0:72b:67fb:8985 with SMTP id ne18-20020a1709077b9200b0072b67fb8985mr30618389ejc.569.1658254277894;
        Tue, 19 Jul 2022 11:11:17 -0700 (PDT)
Received: from skbuf ([188.27.185.104])
        by smtp.gmail.com with ESMTPSA id n17-20020a170906089100b006fe0abb00f0sm6911930eje.209.2022.07.19.11.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 11:11:17 -0700 (PDT)
Date: Tue, 19 Jul 2022 21:11:13 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [RFC PATCH net-next 0/9] net: pcs: Add support for devices
 probed in the "usual" manner
Message-ID: <20220719181113.q5jf7mpr7ygeioqw@skbuf>
References: <20220711160519.741990-1-sean.anderson@seco.com>
 <20220719152539.i43kdp7nolbp2vnp@skbuf>
 <bec4c9c3-e51b-5623-3cae-6df1a8ce898f@seco.com>
 <20220719153811.izue2q7qff7fjyru@skbuf>
 <2d028102-dd6a-c9f6-9e18-5abf84eb37a1@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d028102-dd6a-c9f6-9e18-5abf84eb37a1@seco.com>
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

On Tue, Jul 19, 2022 at 11:46:23AM -0400, Sean Anderson wrote:
> I'm saying that patches 4 and 5 [1] provide "...a working migration
> path to [my] PCS driver model." Since enetc/ocelot do not use
> devicetree for the PCS, patch 9 should have no effect.
> 
> That said, if you've tested this on actual hardware, I'm interested
> in your results. I do not have access to enetc/ocelot hardware, so
> I was unable to test whether my proposed migration would work.
> 
> --Sean
> 
> [1] I listed 6 but it seems like it just has some small hunks which should have been in 5 instead

Got it, thanks. So things actually work up until the end, after fixing
the compilation errors and warnings and applying my phy_mask patch first.
However, as mentioned by Russell King, this patch set now gives us the
possibility of doing this, which happily kills the system:

echo "0000:00:00.5-imdio:03" > /sys/bus/mdio_bus/drivers/lynx-pcs/unbind

For your information, pcs-rzn1-miic.c already has a device_link_add()
call to its consumer, and it does avoid the unbinding problem. It is a
bit of a heavy hammer as Russell points out (a DSA switch is a single
struct device, but has multiple net_devices and phylink instances, and
the switch device would be unregistered in its entirety), but on the
other hand, this is one of the simpler things we can do, until we have
something more fine-grained. I, for one, am perfectly happy with a
device link. The alternative would be reworking phylink to react on PCS
devices coming and going. I don't even know what the implications are
upon mac_select_pcs() and such...
