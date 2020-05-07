Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D291C9E3A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 00:07:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49J6y83XTBzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 08:07:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=naresh.kamboju@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kOcLODoK; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49J6w20DQtzDqj4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 08:05:19 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id h4so8037561ljg.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 15:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nPPvWhYSDBZH/W9ZzOHKWz2UFG4yFEnZgxOOVnctufk=;
 b=kOcLODoKztByz0UBmzjXeqlmhusevIjl+c2HbLw3k5rPnNKk0UOKclN/cgZBe7f2BE
 KEqsud4Rf5RdhjLb6rTlhUM5ds3Xzk7FnKfAsKFuTOitseFo/B4W7DCsQHn6MIDZOtdM
 XpjV+SB82Z1h1ka5YTJZ7+6LcnBoSsPmQiuy7w3g1RSKnALtjhnggH/JTqnX8Bs27TGN
 ood1tyTML/spLGCWlwrocHp6j+kCbFQp1TxUGnP/5eZHSKTDWrjMVOJMV0mMmz5OWK8f
 xD7VPnGMNREiVpMw0n8DDrvcOIkqDBd0J/2WjILG0vEpGGnV+iSSQP4JFsm6KT8nJ2Q/
 xEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nPPvWhYSDBZH/W9ZzOHKWz2UFG4yFEnZgxOOVnctufk=;
 b=b4WdM/UVjMIUaT3C4HjSlHrw2U3snM6qPwtZu/ndgKdSragG7iLrwxFY/XhGArfLGb
 anHgcNcszws7Fk6+sqhVUg/ZWcT2mrN2J9oaXj//pZQV3llw3eJ6QK5f5MvHU+LoVTei
 y8SzgnzFgshM4cQsS6GqFqWKzMR0Q+EuCxBQ/6FvW2QtS18ly4gIclPzgk037gsqAwlT
 RyI7lJ5dq3bJSHI0lT4i5pj+caMRDnSgmEC45WOg73SRkBr/JP3+/tbukHntTEIfk2xE
 cEqewLV3GK/aiNgfpSVAQvD+xYkW8R7YqCFrnG/jpf6a1+Tkntq3GREPm8K3Hqdt/QEv
 3Uow==
X-Gm-Message-State: AGi0PuZbIbfH/tIKv6SnIrumF64tddbwPPXT1o9NRt3nMpeo+ozm1exl
 /PHrR3+GpoCrGeXhSoCGhcRIcMs8I8iN5R1XqBiY9w==
X-Google-Smtp-Source: APiQypKNdCY3OtiIkeJWX0PcE2nxNIMwzLCH+DsayspwmtDmIkVB8t6LffEY5ZO8WubCZPRo18ZG04Dd+peMVypsg08=
X-Received: by 2002:a2e:2e16:: with SMTP id u22mr10215821lju.243.1588889114309; 
 Thu, 07 May 2020 15:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
 <1480357509-28074-12-git-send-email-johan@kernel.org>
 <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
 <20200507064412.GL2042@localhost> <20200507064734.GA798308@kroah.com>
 <20200507111312.GA1497799@kroah.com>
In-Reply-To: <20200507111312.GA1497799@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 8 May 2020 03:35:02 +0530
Message-ID: <CA+G9fYu2SrkEHyAzF57xJz5WjgHv361qdL2wPqON_pGS4Vtxmw@mail.gmail.com>
Subject: Re: [PATCH net 11/16] net: ethernet: marvell: mvneta: fix fixed-link
 phydev leaks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 7 May 2020 at 16:43, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
<trim>
> > >
> > > Greg, 3f65047c853a ("of_mdio: add helper to deregister fixed-link
> > > PHYs") needs to be backported as well for these.
> > >
> > > Original series can be found here:
> > >
> > >     https://lkml.kernel.org/r/1480357509-28074-1-git-send-email-johan=
@kernel.org
> >
> > Ah, thanks for that, I thought I dropped all of the ones that caused
> > build errors, but missed the above one.  I'll go take the whole series
> > instead.
>
> This should now all be fixed up, thanks.

While building kernel Image for arm architecture on stable-rc 4.4 branch
the following build error found.

of_mdio: add helper to deregister fixed-link PHYs
commit 3f65047c853a2a5abcd8ac1984af3452b5df4ada upstream.

Add helper to deregister fixed-link PHYs registered using
of_phy_register_fixed_link().

Convert the two drivers that care to deregister their fixed-link PHYs to
use the new helper, but note that most drivers currently fail to do so.

Signed-off-by: Johan Hovold <johan@kernel.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
[only take helper function for 4.4.y - gregkh]

 # make -sk KBUILD_BUILD_USER=3DTuxBuild -C/linux -j16 ARCH=3Darm
CROSS_COMPILE=3Darm-linux-gnueabihf- HOSTCC=3Dgcc CC=3D"sccache
arm-linux-gnueabihf-gcc" O=3Dbuild zImage
70 #
71 ../drivers/of/of_mdio.c: In function =E2=80=98of_phy_deregister_fixed_li=
nk=E2=80=99:
72 ../drivers/of/of_mdio.c:379:2: error: implicit declaration of
function =E2=80=98fixed_phy_unregister=E2=80=99; did you mean =E2=80=98fixe=
d_phy_register=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
73  379 | fixed_phy_unregister(phydev);
74  | ^~~~~~~~~~~~~~~~~~~~
75  | fixed_phy_register
76 ../drivers/of/of_mdio.c:381:22: error: =E2=80=98struct phy_device=E2=80=
=99 has no
member named =E2=80=98mdio=E2=80=99; did you mean =E2=80=98mdix=E2=80=99?
77  381 | put_device(&phydev->mdio.dev); /* of_phy_find_device() */
78  | ^~~~
79  | mdix

>
> greg k-h
