Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC47C1C7ACB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 21:56:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HS5w2YrFzDqXP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 05:56:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=naresh.kamboju@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ENs11Z2E; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HQpc47KczDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 04:58:11 +1000 (AEST)
Received: by mail-lf1-x144.google.com with SMTP id x73so2277504lfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 May 2020 11:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2hhU7YC1mHWJXOQCa9/YtvMX0AvTF/51BQ11Lkp2if0=;
 b=ENs11Z2E6PTphR/O7XEptV9DrkitQZwLiWGfUE3J1NThoeRLPWDK4tDps5BoTcWit1
 zxwc6iaDbar5hppPTNmyGg+DQIeMEcKomHQdFBhyU8VETMfHL8W2a1Jd5FtPT4MSFPlx
 pW5uAwDfiblCrXtvPdUyMV5XllzXhrrMlu3/oW6uuJTz36qgimok4gbXBH4xnjVurcCX
 lcUe+U7g7T87tsCxaKgUy1ztqhvZkOlPI1dRGORUz42KQ/uPPuoOll0V3+DBw/rjO1OW
 I1Q/zUwoATalGf6bzwzmulWBAfKNsUBbxb1ZM1A5ACSkMtfwmtHD9gRLESdsOugAfng+
 xmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2hhU7YC1mHWJXOQCa9/YtvMX0AvTF/51BQ11Lkp2if0=;
 b=lvNHJ12boBPG3b6okqXhJPi7le762uJS2W33hp0j8jOuPbF2T1H5k+kw7zvdZFksNR
 mDyTZLuS4/TEJUySjvu0eFufJYwowH+DJYPxI7dijsgOJLbIRnuJtWq99bBckOWyoB8g
 shSkrgjpRzXj/Sq7R4u8SBX/8HuXl8oYIde//bpMG1WAhWWmpmUXFgOXHqzlWxswtrc9
 IHfoU4YX055XyVX8X6G2AOHrPOwUUTC1mgaEopjw2+B+E62tr8KCxc+Qx7C4o+eUDoKt
 7UnMCJPOXgPeroZ4NWiJ7HimBADmfGhxVgbl8JmScl7xMqDOx8gAVx/vtl1yMl6taYk6
 YSeg==
X-Gm-Message-State: AGi0PuajvrZNizgIuiRoTtqsVqxwjN0VPcIeysNf+81HHm56AghxbAuN
 WMdVRQ/qByHWQej6EeRgeqMP2afgHlGzsmaYnIfThg==
X-Google-Smtp-Source: APiQypK2/BS9DNLQgUdve0DnZIP+ggCdF8l9P6mtknH7uy4q8+KLPietCh0cyMKc+/gJFltqkIhzsPf/UxXxP4Q5v8I=
X-Received: by 2002:a19:40d2:: with SMTP id n201mr6168784lfa.82.1588791485423; 
 Wed, 06 May 2020 11:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
 <1480357509-28074-12-git-send-email-johan@kernel.org>
In-Reply-To: <1480357509-28074-12-git-send-email-johan@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 7 May 2020 00:27:53 +0530
Message-ID: <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
Subject: Re: [PATCH net 11/16] net: ethernet: marvell: mvneta: fix fixed-link
 phydev leaks
To: Johan Hovold <johan@kernel.org>, linux- stable <stable@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 07 May 2020 05:54:52 +1000
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
 Frank Rowand <frowand.list@gmail.com>, Felix Fietkau <nbd@openwrt.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
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
 linux-renesas-soc@vger.kernel.org, Vitaly Bordug <vbordug@ru.mvista.com>,
 nios2-dev@lists.rocketboards.org,
 Vince Bridgers <vbridger@opensource.altera.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 29 Nov 2016 at 00:00, Johan Hovold <johan@kernel.org> wrote:
>
> Make sure to deregister and free any fixed-link PHY registered using
> of_phy_register_fixed_link() on probe errors and on driver unbind.
>
> Fixes: 83895bedeee6 ("net: mvneta: add support for fixed links")
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/net/ethernet/marvell/mvneta.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
> index 0c0a45af950f..707bc4680b9b 100644
> --- a/drivers/net/ethernet/marvell/mvneta.c
> +++ b/drivers/net/ethernet/marvell/mvneta.c
> @@ -4191,6 +4191,8 @@ static int mvneta_probe(struct platform_device *pdev)
>         clk_disable_unprepare(pp->clk);
>  err_put_phy_node:
>         of_node_put(phy_node);
> +       if (of_phy_is_fixed_link(dn))
> +               of_phy_deregister_fixed_link(dn);

While building kernel Image for arm architecture on stable-rc 4.4 branch
the following build error found.

drivers/net/ethernet/marvell/mvneta.c:3442:3: error: implicit
declaration of function 'of_phy_deregister_fixed_link'; did you mean
'of_phy_register_fixed_link'? [-Werror=implicit-function-declaration]
|    of_phy_deregister_fixed_link(dn);
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    of_phy_register_fixed_link

ref:
https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/541374729

- Naresh
