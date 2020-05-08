Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 669CB1CAA4B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:10:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JTfn483QzDr3S
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 22:10:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Twetzls2; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JTTY74PJzDqsq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 22:02:09 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44B0B208DB;
 Fri,  8 May 2020 12:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588939327;
 bh=MVgAInBlHbFucqqOMS2zpzCl41mt8McPbpWInuTvt7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Twetzls2F3Jeu+KmG5FUOutvjCz/WoqfrsBaX8GvAALNLGFDnKHPy8LdLPUulm0yK
 tBOfN6D3JwamP0kQgp3199ol6mSEtcR3ZeMDY8UHhllndREBSrWk/ouW1UclYwkLr1
 L125iRZ6ei661Ah3Bz5HYH2pfNhM462Cs2rBmyg0=
Date: Fri, 8 May 2020 14:02:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH net 11/16] net: ethernet: marvell: mvneta: fix fixed-link
 phydev leaks
Message-ID: <20200508120205.GA4089177@kroah.com>
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
 <1480357509-28074-12-git-send-email-johan@kernel.org>
 <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
 <20200507064412.GL2042@localhost>
 <20200507064734.GA798308@kroah.com>
 <20200507111312.GA1497799@kroah.com>
 <CA+G9fYu2SrkEHyAzF57xJz5WjgHv361qdL2wPqON_pGS4Vtxmw@mail.gmail.com>
 <20200508062119.GE25962@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200508062119.GE25962@localhost>
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
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fugang Duan <fugang.duan@nxp.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 08, 2020 at 08:21:19AM +0200, Johan Hovold wrote:
> On Fri, May 08, 2020 at 03:35:02AM +0530, Naresh Kamboju wrote:
> > On Thu, 7 May 2020 at 16:43, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > <trim>
> > > > >
> > > > > Greg, 3f65047c853a ("of_mdio: add helper to deregister fixed-link
> > > > > PHYs") needs to be backported as well for these.
> > > > >
> > > > > Original series can be found here:
> > > > >
> > > > >     https://lkml.kernel.org/r/1480357509-28074-1-git-send-email-johan@kernel.org
> > > >
> > > > Ah, thanks for that, I thought I dropped all of the ones that caused
> > > > build errors, but missed the above one.  I'll go take the whole series
> > > > instead.
> > >
> > > This should now all be fixed up, thanks.
> > 
> > While building kernel Image for arm architecture on stable-rc 4.4 branch
> > the following build error found.
> > 
> > of_mdio: add helper to deregister fixed-link PHYs
> > commit 3f65047c853a2a5abcd8ac1984af3452b5df4ada upstream.
> > 
> > Add helper to deregister fixed-link PHYs registered using
> > of_phy_register_fixed_link().
> > 
> > Convert the two drivers that care to deregister their fixed-link PHYs to
> > use the new helper, but note that most drivers currently fail to do so.
> > 
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > Signed-off-by: David S. Miller <davem@davemloft.net>
> > [only take helper function for 4.4.y - gregkh]
> > 
> >  # make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j16 ARCH=arm
> > CROSS_COMPILE=arm-linux-gnueabihf- HOSTCC=gcc CC="sccache
> > arm-linux-gnueabihf-gcc" O=build zImage
> > 70 #
> > 71 ../drivers/of/of_mdio.c: In function ‘of_phy_deregister_fixed_link’:
> > 72 ../drivers/of/of_mdio.c:379:2: error: implicit declaration of
> > function ‘fixed_phy_unregister’; did you mean ‘fixed_phy_register’?
> > [-Werror=implicit-function-declaration]
> > 73  379 | fixed_phy_unregister(phydev);
> > 74  | ^~~~~~~~~~~~~~~~~~~~
> > 75  | fixed_phy_register
> > 76 ../drivers/of/of_mdio.c:381:22: error: ‘struct phy_device’ has no
> > member named ‘mdio’; did you mean ‘mdix’?
> > 77  381 | put_device(&phydev->mdio.dev); /* of_phy_find_device() */
> > 78  | ^~~~
> > 79  | mdix
> 
> Another dependency: 5bcbe0f35fb1 ("phy: fixed: Fix removal of phys.")
> 
> Greg, these patches are from four years ago so can't really remember if
> there are other dependencies or reasons against backporting them (the
> missing stable tags are per Dave's preference), sorry.
> 
> The cover letter also mentions another dependency, but that may just
> have been some context conflict.
> 
> Perhaps you better drop these unless you want to review them closer.

Good idea, I've dropped them all for now, sorry for the noise.

greg k-h
