Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 429581CA3D1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 08:25:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JL1c0xtGzDr3f
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 16:25:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.195;
 helo=mail-lj1-f195.google.com; envelope-from=jhovold@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JKwT0jrhzDqV3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 16:21:28 +1000 (AEST)
Received: by mail-lj1-f195.google.com with SMTP id l19so436358lje.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 23:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=l07sjg7wad11JybQiwBPplAsmA/VCV2GQr8sTEyBm88=;
 b=arMgVPOOta/G47ixuK143JIy8hNiXqQc8VJYQLnKqXEsvxbN4VapEmlAtwZu6yYMjD
 759LdVMG09VMreFSz48bDTD65vAiEvspVLXPw03XixNsMYpVwU2R6TCZ+cUExkUbAzdW
 /yZVZ8urK7kAvOjPcO1O/+3APkhdV+96ui2UIMp74DlhO45bpldr4QTd71fKYh0dX9y/
 T1cf3tLO2lYHX3GOMVZTdAEz2AQK0GzmzhkOCsvc+YAzthJVrjpX8hOoDM7aA+S+Ir/7
 cz7fYiZgoo8OUQWxjbF5QiT4ZpV0jyagH20anfVQaBP+H5PONjS4QsmMaXDQIhKV5pX9
 CQkA==
X-Gm-Message-State: AOAM530YLzvpiRMbWiGpDBs0z8nsRZOKJMwevLdo1ANicoOeIWolyT/H
 BbZytcduVETWHCOvES1Euoc=
X-Google-Smtp-Source: ABdhPJzQwccjomPZVXTofZDq7QNMtMm+acyePCPBUNykc5Wt6G9pf/ArU7L/ehrFMv9M6FmHt7FVvw==
X-Received: by 2002:a05:651c:549:: with SMTP id
 q9mr624525ljp.236.1588918884533; 
 Thu, 07 May 2020 23:21:24 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id z64sm428692lfa.50.2020.05.07.23.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:21:23 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jWwNr-0001TQ-0H; Fri, 08 May 2020 08:21:19 +0200
Date: Fri, 8 May 2020 08:21:19 +0200
From: Johan Hovold <johan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH net 11/16] net: ethernet: marvell: mvneta: fix fixed-link
 phydev leaks
Message-ID: <20200508062119.GE25962@localhost>
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
 <1480357509-28074-12-git-send-email-johan@kernel.org>
 <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
 <20200507064412.GL2042@localhost>
 <20200507064734.GA798308@kroah.com>
 <20200507111312.GA1497799@kroah.com>
 <CA+G9fYu2SrkEHyAzF57xJz5WjgHv361qdL2wPqON_pGS4Vtxmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+G9fYu2SrkEHyAzF57xJz5WjgHv361qdL2wPqON_pGS4Vtxmw@mail.gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, lkft-triage@lists.linaro.org,
 Frank Rowand <frowand.list@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fugang Duan <fugang.duan@nxp.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, nios2-dev@lists.rocketboards.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 08, 2020 at 03:35:02AM +0530, Naresh Kamboju wrote:
> On Thu, 7 May 2020 at 16:43, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> <trim>
> > > >
> > > > Greg, 3f65047c853a ("of_mdio: add helper to deregister fixed-link
> > > > PHYs") needs to be backported as well for these.
> > > >
> > > > Original series can be found here:
> > > >
> > > >     https://lkml.kernel.org/r/1480357509-28074-1-git-send-email-johan@kernel.org
> > >
> > > Ah, thanks for that, I thought I dropped all of the ones that caused
> > > build errors, but missed the above one.  I'll go take the whole series
> > > instead.
> >
> > This should now all be fixed up, thanks.
> 
> While building kernel Image for arm architecture on stable-rc 4.4 branch
> the following build error found.
> 
> of_mdio: add helper to deregister fixed-link PHYs
> commit 3f65047c853a2a5abcd8ac1984af3452b5df4ada upstream.
> 
> Add helper to deregister fixed-link PHYs registered using
> of_phy_register_fixed_link().
> 
> Convert the two drivers that care to deregister their fixed-link PHYs to
> use the new helper, but note that most drivers currently fail to do so.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: David S. Miller <davem@davemloft.net>
> [only take helper function for 4.4.y - gregkh]
> 
>  # make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j16 ARCH=arm
> CROSS_COMPILE=arm-linux-gnueabihf- HOSTCC=gcc CC="sccache
> arm-linux-gnueabihf-gcc" O=build zImage
> 70 #
> 71 ../drivers/of/of_mdio.c: In function ‘of_phy_deregister_fixed_link’:
> 72 ../drivers/of/of_mdio.c:379:2: error: implicit declaration of
> function ‘fixed_phy_unregister’; did you mean ‘fixed_phy_register’?
> [-Werror=implicit-function-declaration]
> 73  379 | fixed_phy_unregister(phydev);
> 74  | ^~~~~~~~~~~~~~~~~~~~
> 75  | fixed_phy_register
> 76 ../drivers/of/of_mdio.c:381:22: error: ‘struct phy_device’ has no
> member named ‘mdio’; did you mean ‘mdix’?
> 77  381 | put_device(&phydev->mdio.dev); /* of_phy_find_device() */
> 78  | ^~~~
> 79  | mdix

Another dependency: 5bcbe0f35fb1 ("phy: fixed: Fix removal of phys.")

Greg, these patches are from four years ago so can't really remember if
there are other dependencies or reasons against backporting them (the
missing stable tags are per Dave's preference), sorry.

The cover letter also mentions another dependency, but that may just
have been some context conflict.

Perhaps you better drop these unless you want to review them closer.

Johan
