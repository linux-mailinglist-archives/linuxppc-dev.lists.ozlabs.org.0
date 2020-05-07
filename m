Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3817F1C82C7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 08:46:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HkWk1wxMzDqXQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 16:46:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HkTS2kgwzDqvg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 16:44:24 +1000 (AEST)
Received: by mail-lj1-f195.google.com with SMTP id y4so5058943ljn.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 May 2020 23:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KPHo05lQ60Sgmm/o6B6Lw5R77cey+JqtyoXZZ3TP7Og=;
 b=YASIYdKd7QQEP9saW3BzN8sz0TvK9sgUnohwEcRB3F1cUiqYODNKrp4b9iyNKBsNSw
 MjT1aEJerfgc3Ok/xPW4sJpJmyzxiWktaKTvUc7rVSV8699gA5x8e9lwsnZhC++6y6Nu
 U9EnSZ/WdhMD8VQC5IzYwGLk0hFU3NhMr3ZE1v0Hjh0RENl48557MoEkygxZzH/QlwgR
 XJpL2bmJ95bdysspAFd7ELBVzBDOUbJprrHp8w3Kd33zbc2qOzLmektlbZdbvTyTWH3H
 vIFAAnLSXEHfG+oBONmBvbCvOfbPbTGdRayeF8pRAboHz3h0K9BS5SZPT0sCqNkB8806
 pixw==
X-Gm-Message-State: AGi0PuabAjxuwpa7lUASAFy/eMY8k/FVMASOg87MQHO7tDXW4Ipjtzj1
 kmUzRvT+9aBH6ZWXZ39FxWI=
X-Google-Smtp-Source: APiQypIpQr2fTJp7sK/Z45NvIbcu6kYbSACpGgviZMKo6vxLEoYdxdc72K9eQNDS8kRJ9TzuUBJ2bQ==
X-Received: by 2002:a2e:b44c:: with SMTP id o12mr6880195ljm.240.1588833860796; 
 Wed, 06 May 2020 23:44:20 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id o20sm3131820lfc.39.2020.05.06.23.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 23:44:19 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jWaGS-0008Rt-A0; Thu, 07 May 2020 08:44:12 +0200
Date: Thu, 7 May 2020 08:44:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH net 11/16] net: ethernet: marvell: mvneta: fix fixed-link
 phydev leaks
Message-ID: <20200507064412.GL2042@localhost>
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
 <1480357509-28074-12-git-send-email-johan@kernel.org>
 <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
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
 Claudiu Manoil <claudiu.manoil@freescale.com>, Li Yang <leoli@freescale.com>,
 Mugunthan V N <mugunthanvnm@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Johan Hovold <johan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 John Crispin <blogic@openwrt.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fugang Duan <fugang.duan@nxp.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 Vitaly Bordug <vbordug@ru.mvista.com>, Netdev <netdev@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org,
 Vince Bridgers <vbridger@opensource.altera.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 07, 2020 at 12:27:53AM +0530, Naresh Kamboju wrote:
> On Tue, 29 Nov 2016 at 00:00, Johan Hovold <johan@kernel.org> wrote:
> >
> > Make sure to deregister and free any fixed-link PHY registered using
> > of_phy_register_fixed_link() on probe errors and on driver unbind.
> >
> > Fixes: 83895bedeee6 ("net: mvneta: add support for fixed links")
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  drivers/net/ethernet/marvell/mvneta.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
> > index 0c0a45af950f..707bc4680b9b 100644
> > --- a/drivers/net/ethernet/marvell/mvneta.c
> > +++ b/drivers/net/ethernet/marvell/mvneta.c
> > @@ -4191,6 +4191,8 @@ static int mvneta_probe(struct platform_device *pdev)
> >         clk_disable_unprepare(pp->clk);
> >  err_put_phy_node:
> >         of_node_put(phy_node);
> > +       if (of_phy_is_fixed_link(dn))
> > +               of_phy_deregister_fixed_link(dn);
> 
> While building kernel Image for arm architecture on stable-rc 4.4 branch
> the following build error found.
> 
> drivers/net/ethernet/marvell/mvneta.c:3442:3: error: implicit
> declaration of function 'of_phy_deregister_fixed_link'; did you mean
> 'of_phy_register_fixed_link'? [-Werror=implicit-function-declaration]
> |    of_phy_deregister_fixed_link(dn);
> |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |    of_phy_register_fixed_link
> 
> ref:
> https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/541374729

Greg, 3f65047c853a ("of_mdio: add helper to deregister fixed-link
PHYs") needs to be backported as well for these.

Original series can be found here:

	https://lkml.kernel.org/r/1480357509-28074-1-git-send-email-johan@kernel.org

Johan
