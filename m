Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF91C82DA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 08:49:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HkbQ6XBKzDqxl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 16:49:38 +1000 (AEST)
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
 header.s=default header.b=dCZ6mLUc; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HkY86xFhzDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 16:47:38 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D794F2078C;
 Thu,  7 May 2020 06:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588834056;
 bh=hUD5exA4dNKvCcKV83BYNh5VFO685TqU5GU5ToDg3us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dCZ6mLUcN1lIcruUpjFnEcOhlyrmSgxjeyHHlnFw/4co12Hwb9W/Qsgzq6nZ+HnJp
 DibKlr9P4RQGxGYL3/8X8BfHpXRz53ezegCOp/1lVZvRByJvVXChNS4+D1DL4tpB3T
 fOVh6T5cCACfVwnSp8ZDtkKBDaj/Y7C6rRFAF5rg=
Date: Thu, 7 May 2020 08:47:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH net 11/16] net: ethernet: marvell: mvneta: fix fixed-link
 phydev leaks
Message-ID: <20200507064734.GA798308@kroah.com>
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
 <1480357509-28074-12-git-send-email-johan@kernel.org>
 <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
 <20200507064412.GL2042@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507064412.GL2042@localhost>
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Frank Rowand <frowand.list@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Felix Fietkau <nbd@openwrt.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Claudiu Manoil <claudiu.manoil@freescale.com>, Li Yang <leoli@freescale.com>,
 Mugunthan V N <mugunthanvnm@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 John Crispin <blogic@openwrt.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fugang Duan <fugang.duan@nxp.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 Vitaly Bordug <vbordug@ru.mvista.com>, nios2-dev@lists.rocketboards.org,
 Vince Bridgers <vbridger@opensource.altera.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 07, 2020 at 08:44:12AM +0200, Johan Hovold wrote:
> On Thu, May 07, 2020 at 12:27:53AM +0530, Naresh Kamboju wrote:
> > On Tue, 29 Nov 2016 at 00:00, Johan Hovold <johan@kernel.org> wrote:
> > >
> > > Make sure to deregister and free any fixed-link PHY registered using
> > > of_phy_register_fixed_link() on probe errors and on driver unbind.
> > >
> > > Fixes: 83895bedeee6 ("net: mvneta: add support for fixed links")
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> > >  drivers/net/ethernet/marvell/mvneta.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
> > > index 0c0a45af950f..707bc4680b9b 100644
> > > --- a/drivers/net/ethernet/marvell/mvneta.c
> > > +++ b/drivers/net/ethernet/marvell/mvneta.c
> > > @@ -4191,6 +4191,8 @@ static int mvneta_probe(struct platform_device *pdev)
> > >         clk_disable_unprepare(pp->clk);
> > >  err_put_phy_node:
> > >         of_node_put(phy_node);
> > > +       if (of_phy_is_fixed_link(dn))
> > > +               of_phy_deregister_fixed_link(dn);
> > 
> > While building kernel Image for arm architecture on stable-rc 4.4 branch
> > the following build error found.
> > 
> > drivers/net/ethernet/marvell/mvneta.c:3442:3: error: implicit
> > declaration of function 'of_phy_deregister_fixed_link'; did you mean
> > 'of_phy_register_fixed_link'? [-Werror=implicit-function-declaration]
> > |    of_phy_deregister_fixed_link(dn);
> > |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > |    of_phy_register_fixed_link
> > 
> > ref:
> > https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/541374729
> 
> Greg, 3f65047c853a ("of_mdio: add helper to deregister fixed-link
> PHYs") needs to be backported as well for these.
> 
> Original series can be found here:
> 
> 	https://lkml.kernel.org/r/1480357509-28074-1-git-send-email-johan@kernel.org

Ah, thanks for that, I thought I dropped all of the ones that caused
build errors, but missed the above one.  I'll go take the whole series
instead.

greg k-h
