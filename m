Return-Path: <linuxppc-dev+bounces-3079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3029C33D3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2024 17:45:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xmdp22dQjz2y7M;
	Mon, 11 Nov 2024 03:45:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc0:41:216:3eff:fe56:8398"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731257114;
	cv=none; b=gUDK+u+CbxH/RCR/94pv+vkOMLOOGAuib1TsN4qLrcVtNGULFQ+fX7iEo8YNUet9doWqRx/irDhC1urztD1b5O7r6VSwJvyb/6Kp65g/wx5943s+dlVDkV7Fnn6PO/PrL58grCBlY++LFW0qAfmEdhhaeePR3exv/p7hGq5Iyj55/sTgGjKNvAW6JoND/Y4gZ71IjFAeFv3nybubqUTXBety7HY8XMQg8dLMM6yTRvWNF9gdoFYvEFxjBZZahz4+Ds5MGiWop8Ij/yFL4hi19D0gHewmEx3SAKXAXj4nypn08wpMiHKkQ6+2fLfh4xXG9Hs9eUUpwq1SOLYAJqRU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731257114; c=relaxed/relaxed;
	bh=5+y2QMykRjhaG+PDz43DPVOX9kNsX0ZYGqEKpJPmxSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5M39Ewgc6lmhpuIbyoa6ZFAAplCPd3w8YkDmYzB0a/RtiidzPYC4n4boCzuMlg9micq8F1UlCXoP8YC+ZDxm4z2SwSWb0pisFi4nezwt+EqJvsDELrG8hqR6dx5Bb2movjR9WVr3EsllzlPt0TCbSyNElkIZ+X+ilDh3H6PSFSBzIBX88Xvf+JJA9bWl4ZEvKPK6v8EF1fwaqSdhDnv4NrSwylbctjSf75CWb5qG0K4Q3EG8ypf47pn2exHnXqVxLzI6thZAUoWbPkXtx72lRoIfGSHaOxgK49lUXyTNoPdOd0q4lkDAf4sfOVjnknG5ZwSNHOEh0vujqjiO3upUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fr.zoreil.com; dkim=pass (1024-bit key; unprotected) header.d=fr.zoreil.com header.i=@fr.zoreil.com header.a=rsa-sha256 header.s=v20220413 header.b=FFkxxDRa; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc0:41:216:3eff:fe56:8398; helo=violet.fr.zoreil.com; envelope-from=romieu@fr.zoreil.com; receiver=lists.ozlabs.org) smtp.mailfrom=fr.zoreil.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fr.zoreil.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=fr.zoreil.com header.i=@fr.zoreil.com header.a=rsa-sha256 header.s=v20220413 header.b=FFkxxDRa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fr.zoreil.com (client-ip=2001:4b98:dc0:41:216:3eff:fe56:8398; helo=violet.fr.zoreil.com; envelope-from=romieu@fr.zoreil.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 309 seconds by postgrey-1.37 at boromir; Mon, 11 Nov 2024 03:45:10 AEDT
Received: from violet.fr.zoreil.com (violet.fr.zoreil.com [IPv6:2001:4b98:dc0:41:216:3eff:fe56:8398])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xmdny2fSVz2y3Z
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 03:45:10 +1100 (AEDT)
Received: from violet.fr.zoreil.com ([127.0.0.1])
	by violet.fr.zoreil.com (8.17.1/8.17.1) with ESMTP id 4AAGbouY3930604;
	Sun, 10 Nov 2024 17:37:50 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 violet.fr.zoreil.com 4AAGbouY3930604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fr.zoreil.com;
	s=v20220413; t=1731256670;
	bh=5+y2QMykRjhaG+PDz43DPVOX9kNsX0ZYGqEKpJPmxSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFkxxDRaq1CSSsHRAAocoXu+u98Fyc5BN4GR4nHWXkWF9G4P4eEIgMKVy9d4t4ZBx
	 67hd1nY0BOtuujJ85otrSRji5KektIdUuvhwvsToPqe4Q8utQnGKfPgxcaEBz42GxQ
	 aqLq3/kra2W7ijiY9fEnrh/5yk7KY5bQZ8QjDUt0=
Received: (from romieu@localhost)
	by violet.fr.zoreil.com (8.17.1/8.17.1/Submit) id 4AAGblIR3930603;
	Sun, 10 Nov 2024 17:37:47 +0100
Date: Sun, 10 Nov 2024 17:37:47 +0100
From: Francois Romieu <romieu@fr.zoreil.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
        Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Vladimir Oltean <olteanv@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Marcin Wojtas <marcin.s.wojtas@gmail.com>,
        Byungho An <bh74.an@samsung.com>,
        Kevin Brace <kevinbrace@bracecomputerlab.com>,
        Michal Simek <michal.simek@amd.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Zhao Qiang <qiang.zhao@nxp.com>,
        "open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        "open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next] net: use pdev instead of OF funcs
Message-ID: <20241110163747.GA3930570@electric-eye.fr.zoreil.com>
References: <20241109233821.8619-1-rosenp@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109233821.8619-1-rosenp@gmail.com>
X-Organisation: Land of Sunshine Inc.
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Rosen Penev <rosenp@gmail.com> :
> np here is ofdev->dev.of_node. Better to use the proper functions as
> there's no use of children or anything else.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
[...]
> diff --git a/drivers/net/ethernet/via/via-rhine.c b/drivers/net/ethernet/via/via-rhine.c
> index 894911f3d560..f079242c33e2 100644
> --- a/drivers/net/ethernet/via/via-rhine.c
> +++ b/drivers/net/ethernet/via/via-rhine.c
> @@ -1127,7 +1127,7 @@ static int rhine_init_one_platform(struct platform_device *pdev)
>  	if (IS_ERR(ioaddr))
>  		return PTR_ERR(ioaddr);
>  
> -	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +	irq = platform_get_irq(pdev, 0);
>  	if (!irq)
>  		return -EINVAL;
>  
> diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethernet/via/via-velocity.c
> index dd4a07c97eee..4aac9599c14d 100644
> --- a/drivers/net/ethernet/via/via-velocity.c
> +++ b/drivers/net/ethernet/via/via-velocity.c
> @@ -2950,7 +2950,7 @@ static int velocity_platform_probe(struct platform_device *pdev)
>  	if (!info)
>  		return -EINVAL;
>  
> -	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +	irq = platform_get_irq(pdev, 0);
>  	if (!irq)
>  		return -EINVAL;
>  

The change makes sense. However neither the description nor the commit message
really match here.

-- 
Ueimor

