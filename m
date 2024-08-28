Return-Path: <linuxppc-dev+bounces-706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B62963457
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 00:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvJNQ0G81z2xHw;
	Thu, 29 Aug 2024 08:04:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724863950;
	cv=none; b=H/MzM4E5OsmPjujUdHkMI+kNR9HxKxpWzBGlAloreIy2Ad+K+T5phj1VelZrcFWKg/t9O01z4AOGIVu5ku8v+45lGIbsTlYMhv23wwf8abi/OOvyX6y8G3wE/EnqdSTT9Q4nuGPKJ1dk3gd+1EdqKmnOePgQxfihegutRG85vF2cYInILQ90B2ZUxWj3iGZJ5FGYXssnPKVFgQusThgGFVi6piqBu3Y8dZEkJarlsIsh5gf8AMBAvf0RexA3/yuvKGg7cev9R5z7kbBiw3qIydXtMfDXVyjmX6//cyYSQfCmpOfvzGgM6vfS3BjHavk4x2dHFtznkdeaEeCn9xfSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724863950; c=relaxed/relaxed;
	bh=U8t1b1VLPlwy0y+Etl/WukA+64dZqdNkgFU9fWAqUlc=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=G/4zX4DVnYvu9wgPK+qfEH3vcQ8YCv+fgNs+nI6Hh+4AvonUfUYR9+xLvMSCaCJ4MiUYe0vXHp7HI0vvMqy3/FEA6z7lTebr79ye5p9sEO/ZqyW+ygSkCm+1SCK0sLFqKEOwfl5E/UYC05EUMZ/HWYvWi+a8WhBk8fEHfHcjW06szkVT0AyzjZ+2iRtLhFKzKmyLjxlR21Kc5t/o3AcYtjqzRsV7Tk5pA/gJUvE0HWIF1My4miz9MWIII/+W+KYj0Vxxz0Xp69HIvjqZD9KE8ZHs+Z9+RieQzMPlYjtlsIm4v41Q3Wf0CLe/nbGQkSOyC+JjEs5kxxAv6RCC61LbIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pR5/59CT; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pR5/59CT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv9SZ1yvpz2yZ3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 02:52:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ED13CA42707;
	Wed, 28 Aug 2024 16:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433E5C515B4;
	Wed, 28 Aug 2024 16:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724862749;
	bh=IcOpHz8GgohndUTMyAYMIG+hCu7kJbe6e1APBKfYgPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pR5/59CTcmE9y0TjuQtpRRU3O8DmJUlgFo4Y3OfmCeqIgIPRE4+iuwlxl+bC5IsIE
	 gOXLu02v+azXCkwZ0eRQPL5UavCwaAq5b9aMsznsCN1YvMX9YFvIiX07ApHGdRN9Er
	 pCEJo7LHnlfTP/Jf5UKH3EukXS7kRH1Igoi71h4PRA+PLaLfuyggj6/FYeNUS5RfzR
	 48neoiCmzP/+8UggeZ5ic1cAanCrHwwYo5exk6A++87m0f1fb/qG2b6cX4YBKKlUuj
	 60Z25CRgS416qfMPZlbg2HmXe1Y0MshwxeUoMlSIL9uTD1rMqLZE05g4LvQoDqujex
	 f4aeE+c9aSomQ==
Date: Wed, 28 Aug 2024 17:32:24 +0100
From: Simon Horman <horms@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 6/6] net: ethernet: fs_enet: phylink conversion
Message-ID: <20240828163224.GT1368797@kernel.org>
References: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
 <20240828095103.132625-7-maxime.chevallier@bootlin.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828095103.132625-7-maxime.chevallier@bootlin.com>

On Wed, Aug 28, 2024 at 11:51:02AM +0200, Maxime Chevallier wrote:
> fs_enet is a quite old but still used Ethernet driver found on some NXP
> devices. It has support for 10/100 Mbps ethernet, with half and full
> duplex. Some variants of it can use RMII, while other integrations are
> MII-only.
> 
> Add phylink support, thus removing custom fixed-link hanldling.
> 
> This also allows removing some internal flags such as the use_rmii flag.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Hi Maxime,

Some minor issues from my side: not a full review by any stretch of
the imagination.

...

> @@ -911,7 +894,7 @@ static int fs_enet_probe(struct platform_device *ofdev)
>  	if (!IS_ERR(clk)) {
>  		ret = clk_prepare_enable(clk);
>  		if (ret)
> -			goto out_deregister_fixed_link;
> +			goto out_phylink;
>  
>  		fpi->clk_per = clk;
>  	}

This goto will result in a dereference of fep.
But fep is not initialised until the following line,
which appears a little below this hunk.

	fep = netdev_priv(ndev);

This goto will also result in the function returning without
releasing clk.

Both flagged by Smatch.

> @@ -936,6 +919,26 @@ static int fs_enet_probe(struct platform_device *ofdev)
>  	fep->fpi = fpi;
>  	fep->ops = ops;
>  
> +	fep->phylink_config.dev = &ndev->dev;
> +	fep->phylink_config.type = PHYLINK_NETDEV;
> +	fep->phylink_config.mac_capabilities = MAC_10 | MAC_100;
> +
> +	__set_bit(PHY_INTERFACE_MODE_MII,
> +		  fep->phylink_config.supported_interfaces);
> +
> +	if (of_device_is_compatible(ofdev->dev.of_node, "fsl,mpc5125-fec"))
> +		__set_bit(PHY_INTERFACE_MODE_RMII,
> +			  fep->phylink_config.supported_interfaces);
> +
> +	phylink = phylink_create(&fep->phylink_config, dev_fwnode(fep->dev),
> +				 phy_mode, &fs_enet_phylink_mac_ops);
> +	if (IS_ERR(phylink)) {
> +		ret = PTR_ERR(phylink);
> +		goto out_free_fpi;

This also appears to leak clk, as well as ndev.

I didn't look for other cases.

> +	}
> +
> +	fep->phylink = phylink;
> +
>  	ret = fep->ops->setup_data(ndev);
>  	if (ret)
>  		goto out_free_dev;
> @@ -968,8 +971,6 @@ static int fs_enet_probe(struct platform_device *ofdev)
>  
>  	ndev->ethtool_ops = &fs_ethtool_ops;
>  
> -	netif_carrier_off(ndev);
> -
>  	ndev->features |= NETIF_F_SG;
>  
>  	ret = register_netdev(ndev);
> @@ -988,10 +989,8 @@ static int fs_enet_probe(struct platform_device *ofdev)
>  	free_netdev(ndev);
>  out_put:
>  	clk_disable_unprepare(fpi->clk_per);
> -out_deregister_fixed_link:
> -	of_node_put(fpi->phy_node);
> -	if (of_phy_is_fixed_link(ofdev->dev.of_node))
> -		of_phy_deregister_fixed_link(ofdev->dev.of_node);
> +out_phylink:
> +	phylink_destroy(fep->phylink);
>  out_free_fpi:
>  	kfree(fpi);
>  	return ret;

...

