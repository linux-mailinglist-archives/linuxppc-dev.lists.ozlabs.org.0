Return-Path: <linuxppc-dev+bounces-841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 717BF966D17
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2024 01:59:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwZr22cytz30Sx;
	Sat, 31 Aug 2024 09:59:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725052138;
	cv=none; b=DMAPLAChw2y1LcERFrtX1HseYysmClddGdp+Nmgqpuqkeuw+stuQbmB7fnd0l+TIhwEfiacIITN3YNz8gx7xWkVrS/8xXZYtexgYZnLULqbYeJvpU/WJkvgnjzJgGs7QP7KoSjSyPwHN3CMKvK7TcD22EoASZETYb6OA33aeSaikxXKZkyW/T3sifBWdg199OUAyrwsR43HfXTOGTEUmkq2IFBAkIitUHQ0hYnAVIGLAVTPhs8ElPERZ1VQJlGR/ysdQ3DiBW1ZVy9Z+NBNKLBqJq+AbKeunxt4jkVSYKEqf3puRjvLirQ8X+Atb+UNCDWLdUB7c5QQxegyu5OLuag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725052138; c=relaxed/relaxed;
	bh=Gb6Pua4+8qmxqMEF4Vk4GZvcFYXa7AIs24hySnHa/ko=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=cj/4IBmxmBj7wentSN6RuXAZfXdYLpG1tCioaB3jtRMoWwJSf2tuNvTTanTTC9/MYOMxcAdnF5CUzCcdA1f+Rd0uYJBqsffYD1creWtDskuDz9O+0L7/aCvnE9ke3/HUEOPn4E0ZO3GRnmZqXhvCrI+RUYuOitLrUArHam3m6QKyvLZK2tPlbZnXJWZ46FGBIOLGDHR5+RIGMLKPeai8HLzZvvJuX+IzRTh0ydMc0srtVNWk50Q+uW2j5pQr3oW+QMPWJZsNpdl8OZgLhXHR69gn++x+GjzDuOs6LPUGM2yQ18Ld2Da5AR5fHZDWAVvtvhQvYb3ZhpmfrfitTFrgiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=R6G6RBdL; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=R6G6RBdL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwW3Z0Hmdz2yyb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 07:08:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Gb6Pua4+8qmxqMEF4Vk4GZvcFYXa7AIs24hySnHa/ko=; b=R6G6RBdL3mLd/omM3HVHj0sO3o
	1hS8E8rRq0e9MQpdhQ4ebSWo7V5KSNf7/7U9vs67Z0HW/Eklikg4jZtMdFe4iYFcmlkWrxkv3cKC9
	ac7A06OkeBFufwAKOcWf3djGO6nbTu19dzMwtf3A7AlHHKI+I6u7gTzP9mOlZNAyOpuc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sk8rO-006AJh-Ek; Fri, 30 Aug 2024 23:08:46 +0200
Date: Fri, 30 Aug 2024 23:08:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v2 5/7] net: ethernet: fs_enet: fcc: use macros
 for speed and duplex values
Message-ID: <102be9c5-96d0-4e8a-ac1f-0a00b1c4257d@lunn.ch>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
 <20240829161531.610874-6-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20240829161531.610874-6-maxime.chevallier@bootlin.com>

On Thu, Aug 29, 2024 at 06:15:28PM +0200, Maxime Chevallier wrote:
> The PHY speed and duplex should be manipulated using the SPEED_XXX and
> DUPLEX_XXX macros available. Use it in the fcc, fec and scc MAC for fs_enet.
> 
> Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

