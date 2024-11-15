Return-Path: <linuxppc-dev+bounces-3249-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF779CDE28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 13:19:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xqbfz72Wvz301w;
	Fri, 15 Nov 2024 23:19:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731673163;
	cv=none; b=NZMAISLFzSr//SzFDiipJJa8AP6R/2AtFZ9UTdso4yS6C9JybD1aEMnO6M7RUMN09gru14cOQ/EEqC3pHze3JqGdm0RxtWQAq/sS2axZBeGtoDeO1gE+pyrf8/nlTpERCUmBYDBGhk5OqGDFEFqXz9WeHgALHd1WIglB12GRNzxYVJ2bXWvBniSbUDewdy23Yw2sfXEM/RBL3QOyuT6EqUOxSCHvx60JtPychnAn2fHW5/JPeC/3VpAJkvKOkiqCXa5RQ5vUiAw56XvgqmftWCQv5bWJLQoQT4D+aTxDL8XioRr5f22P8jLt2HS3v3JmS7GWo3W4kUmooPSjEn0w7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731673163; c=relaxed/relaxed;
	bh=lieZ2BaJSbYb2YjrQK5pVbn/qvdQhFj1UGUa8nbqXIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLfOyM6Vw0lDcjZ6ZZEEeryhAuq66d0Oxi0QhTr8TS18Gkx2wQPpPGMEeTuuD6th82+UUN8LpJX2EX+u9j0XkNvRY5YEsaz8OK+OUcIxXEp4sYlt1kKLQYJneaEaDVacnV75i5rQQv7ejJqggEZCn3v+SgcISerKz1KE8zQhVFxOiaMuCRACIDYC2m0L47kd1vJ7VTk6JmhUTcPxnI9K8G3VlLoE41OLx7yW4b+PXdTs4zu7+6+V7yJHLptSvfaGGnSwwHCAMywUx+eP03UmwDUj+RxzQUR9itqV7a83g6RseU3T+hM/LqkHUtAb6rgd3zajYTbjqLuQwDLORYr0zQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hgp2erme; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hgp2erme;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xqbfy4jJ9z2yNP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 23:19:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3C415C6259;
	Fri, 15 Nov 2024 12:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D463EC4CECF;
	Fri, 15 Nov 2024 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731673159;
	bh=xYQ9TNp9p5kYBx3sWMGmhMUu5MqStfTQnH3N5bBDZJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hgp2ermerQoEtA7rDHw8fmjZvMztpbM6wzYhbqM2dYdaYgpB3s7A2zNC5RUoQUExz
	 EWON/IPsj0QzBO0ybOKrRxgw7bgnE5FrwLJ969oQFLtmAiCWTyxblXbsnBgnXBEwDD
	 KV2XdzQ0Mjfo0DisVOxFYLAVidMOxlVPpJX9P/ruVUaefgrxnm9bWc9WVUSZEPWOzW
	 tFZQbG9M083rPlm8lnCUzkoa7tXVuqzvA3MyGheGxFQMxbtpGKjBniaL659U2akiQC
	 kxwl+CVy45uP7aIZUqT+wynK25ye9nFWmWqai+3yguXZzNZf9g9PGuYzBMzCkWnYwK
	 OAyU/ogCBDf7w==
Date: Fri, 15 Nov 2024 12:19:14 +0000
From: Simon Horman <horms@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v2 01/10] net: freescale: ucc_geth: Drop support
 for the "interface" DT property
Message-ID: <20241115121914.GL1062410@kernel.org>
References: <20241114153603.307872-1-maxime.chevallier@bootlin.com>
 <20241114153603.307872-2-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20241114153603.307872-2-maxime.chevallier@bootlin.com>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 14, 2024 at 04:35:52PM +0100, Maxime Chevallier wrote:
> In april 2007, ucc_geth was converted to phylib with :
> 
> commit 728de4c927a3 ("ucc_geth: migrate ucc_geth to phylib").
> 
> In that commit, the device-tree property "interface", that could be used to
> retrieve the PHY interface mode was deprecated.
> 
> DTS files that still used that property were converted along the way, in
> the following commit, also dating from april 2007 :
> 
> commit 0fd8c47cccb1 ("[POWERPC] Replace undocumented interface properties in dts files")
> 
> 17 years later, there's no users of that property left and I hope it's
> safe to say we can remove support from that in the ucc_geth driver,
> making the probe() function a bit simpler.
> 
> Should there be any users that have a DT that was generated when 2.6.21 was
> cutting-edge, print an error message with hints on how to convert the
> devicetree if the 'interface' property is found.
> 
> With that property gone, we can greatly simplify the parsing of the
> phy-interface-mode from the devicetree by using of_get_phy_mode(),
> allowing the removal of the open-coded parsing in the driver.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V2: No changes
> 
>  drivers/net/ethernet/freescale/ucc_geth.c | 63 +++++------------------
>  1 file changed, 12 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c

...

> @@ -3627,18 +3588,17 @@ static int ucc_geth_probe(struct platform_device* ofdev)
>  	/* Find the TBI PHY node.  If it's not there, we don't support SGMII */
>  	ug_info->tbi_node = of_parse_phandle(np, "tbi-handle", 0);
>  
> -	/* get the phy interface type, or default to MII */
> -	prop = of_get_property(np, "phy-connection-type", NULL);
> -	if (!prop) {
> -		/* handle interface property present in old trees */
> -		prop = of_get_property(ug_info->phy_node, "interface", NULL);
> -		if (prop != NULL) {
> -			phy_interface = enet_to_phy_interface[*prop];
> -			max_speed = enet_to_speed[*prop];
> -		} else
> -			phy_interface = PHY_INTERFACE_MODE_MII;
> -	} else {
> -		phy_interface = to_phy_interface((const char *)prop);
> +	prop = of_get_property(ug_info->phy_node, "interface", NULL);
> +	if (prop) {
> +		dev_err(&ofdev->dev,
> +			"Device-tree property 'interface' is no longer supported. Please use 'phy-connection-type' instead.");
> +		goto err_put_tbi;

Hi Maxime,

This goto will result in err being returned by this function.
But here err is 0. Should it be set to an error value instead?

Flagged by Smatch.

> +	}
> +
> +	err = of_get_phy_mode(np, &phy_interface);
> +	if (err) {
> +		dev_err(&ofdev->dev, "Invalid phy-connection-type");
> +		goto err_put_tbi;
>  	}
>  
>  	/* get speed, or derive from PHY interface */
> @@ -3746,6 +3706,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
>  err_deregister_fixed_link:
>  	if (of_phy_is_fixed_link(np))
>  		of_phy_deregister_fixed_link(np);
> +err_put_tbi:
>  	of_node_put(ug_info->tbi_node);
>  	of_node_put(ug_info->phy_node);
>  	return err;
> -- 
> 2.47.0
> 
> 

