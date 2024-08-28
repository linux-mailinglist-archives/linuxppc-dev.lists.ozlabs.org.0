Return-Path: <linuxppc-dev+bounces-687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA54C962647
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 13:45:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv2fs5XJPz2xTR;
	Wed, 28 Aug 2024 21:45:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4d48:ad52:32c8:5054:ff:fe00:142"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724841540;
	cv=none; b=TfzgeUyZylKazUMlbF/jS3VqopkfCxNyltE8u8makm/D08LGHOBmJIEm7D49OP+SmctqbwixrxavuDXdABaHk9d6sYwWHUgTnJxsqNOh3KT6FEillnX8OsrmbxQBsD1y/q7l12FCHoXtWkLctDfy0JxCsWM4HRR5SYSv66lO14dIQk7CMqZb986+pXIJ/ib2mO0oxwAYP6j2uvb1H6jN63ktvSB+RXqemsI97kijoiXVsJthTlLY/jM4BVRvXN3IF4uTXFkm3me73obJxVdKf+HTMZCkjXvgS12gw8uaah+I+GtcvjB+tOuBsr5ic+UWbveKKjLGvkSUzqJTy4oFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724841540; c=relaxed/relaxed;
	bh=HiHXsrU1uxoz44DKaTX7gem1HpGF3cKfHBXLo1xRc0I=;
	h=DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Sender; b=ac5ntJv4Dba2eRy5kkFsL2pJ/yKeYJhL97Y/NGgTbyoUZQLBQBvM3tzKfKvPw95nZtN8/hkqJOxyHtewJ8Q9m6Clc5uffwwZ3Vfn2hb5VLCR/M/UHxwBUAxTjbytI088iO1uH4ydMcOaQ0omBg1t9JPU/cvvYe76OIZ8DZJKsSZAuShN8uAsIjvfU33k+3J/OylM73Yah+7V1z8xex2M3ZeOxAYwzeSJehXhB48yfFXqqOrsILZ2S7EYnMo9W8fuFQbiopYwTWnI7OzrZuUKBa8AK0wEhSxvk7mNzKfL+znepZat+IwzbVinIaQkRaKQFttenb1WTa1AKPd//gNL6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=koD4xEJo; dkim-atps=neutral; spf=none (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=koD4xEJo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv19Z3YCQz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:38:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HiHXsrU1uxoz44DKaTX7gem1HpGF3cKfHBXLo1xRc0I=; b=koD4xEJolxR4rrnjzgYuXUwenr
	G7d/pX6vMbb+NMG/3KQa5ayqwKAWfdlTSOn0VvdzB+og4f+7CbUUHD+ZXYy5xLsC8N7Bz4RS/8Tnk
	HKF1ajkZTxo8euK2Tq7mtjC/AQ3UsMaR7Jp3VbFTCRNNpyUvswfyYHK9hyaIHqzkwhPgisRd41HXx
	ReF4DzwxixULXa4yCDZt9/iTYUNgGhg3GCRuGyGfbhxpTVpc72KnGPT7o/Jv5lMwWMmzo0SvalvnR
	cJOLTq9pLwKbEfyxnmrx9ZwSvtU/djScjAiF3rL1SmYBqsMLrFtbciDpIiRZD4p2BtaexpsnXZCmt
	oMKW86kA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39482)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sjG4S-0008Ug-0G;
	Wed, 28 Aug 2024 11:38:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sjG4N-0004PU-1l;
	Wed, 28 Aug 2024 11:38:31 +0100
Date: Wed, 28 Aug 2024 11:38:31 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 6/6] net: ethernet: fs_enet: phylink conversion
Message-ID: <Zs7+J5JWpfvSQ8/T@shell.armlinux.org.uk>
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
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Aug 28, 2024 at 11:51:02AM +0200, Maxime Chevallier wrote:
> +static int fs_eth_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
> +{
> +	struct fs_enet_private *fep = netdev_priv(dev);
> +
> +	if (!netif_running(dev))
> +		return -EINVAL;

Why do you need this check?

-- 
*** please note that I probably will only be occasionally responsive
*** for an unknown period of time due to recent eye surgery making
*** reading quite difficult.

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

