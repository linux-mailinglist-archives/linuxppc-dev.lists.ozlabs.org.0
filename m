Return-Path: <linuxppc-dev+bounces-2283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AE699E8E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 14:10:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSXxX2Drgz3bn4;
	Tue, 15 Oct 2024 23:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728994256;
	cv=none; b=Oq91zF23Ct0JnxKet12jWsnWLre39HpW6M7dtb9l8MRGVqs5+MXOAstoz3kXNIzrS8twnEuA3+Us0RF/DO+ttwQAT52tYVogxbBatc74uNwA1urLMqTfHUSBVlgRPjOf2zR/8PjvHjV6e7AiZPQhlgP0oFh5rPGxZKi7u6LhoToT3JRWp6ZIkBdgNHwWB0kqYNp1UzzmjDcw2e5PNWEjS4HqLCuAkOb7hBjKejwaH35lCmDidaZlK+dOBQDSBL4iAbGAlbt/gVVzybK781KEaIdB3ps1TXJkFOmVn6f3ZwQubssHU81kyRG+54+32joL0v7C+gpbger3xvrUW5pYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728994256; c=relaxed/relaxed;
	bh=TqaisbRYUNuIJTtDdcsMc/KX537f+XPwg8SJ7MtncJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CslPvhvrvHmCsarIYkSXae0D5kXkFtwvOPmbtHxXCQt17kc9EgiBuY+FyPlmQlt1ZyjRj5KoCT5GYDLLMoT7Ag8xGjJc41iTjbZMzW+ZkEisq2Usb7B4/KazE117/13YXS7dJfJhhsXDFctd1KeyDtIMk8iy20Dojoy1dN0Q/kQI/E0NcsIlGS4vjl3QKe7W/ZhMkpPHhEaDTWAYTr0oT/8CWQBAP3A7RuJV6+dghU1isOnpXhl2W8evvp0BKo/NW8veotcDVHJ8lOYVZbmseGPLEjySkrQeZAk+WL2kcgkRhjJXHqoxktwdCXrnM+sD4x7eFtWU6uoN9BYABgmYZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RaN+i4Qs; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RaN+i4Qs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSXxW0rxPz3bkY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 23:10:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F5D15C58C6;
	Tue, 15 Oct 2024 12:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463DEC4CEC6;
	Tue, 15 Oct 2024 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728994251;
	bh=y+TgaiI7J/jSSYzxAw22Eb8Kte8Q1JyRu7C9LHRxYNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RaN+i4Qsf+ngZdxNJefPuqntIcEuA6A2ATjaapyVQA0uknJ48fWgfnDpbaI2GwRgY
	 JLCSHppy/NGNEEvQwVG/KPco3oCyA+wRadCCHpUxug0BXsS260Q6ERi64dJDw47QhV
	 b3RKAVWX6xnxVzQkGFkGAF/Fy97xy3VyHBj4TTiSPffpYs0qomYBvL306UYltxIiIF
	 v1AgitFso53aumLsDp1o9OWeFMOYcpX2s6gavzYnTpevCys4cgFgl+d6PvfRFwjw15
	 1WVlvIiAgrVk9RYfBhsT5eBhUg07LkxjHpGL7GyQj9WXO0ntZ05qW7CB+9RyMYPOLA
	 yAhxyYnvloLGA==
Date: Tue, 15 Oct 2024 13:10:47 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/2] net: ethernet: freescale: Use %pa to format
 resource_size_t
Message-ID: <20241015121047.GE569285@kernel.org>
References: <20241014-net-pa-fmt-v1-0-dcc9afb8858b@kernel.org>
 <20241015072448.6ssv6vsyjpv4vnhi@DEN-DL-M70577>
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
In-Reply-To: <20241015072448.6ssv6vsyjpv4vnhi@DEN-DL-M70577>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 15, 2024 at 07:24:48AM +0000, Daniel Machon wrote:
> > Hi,
> > 
> > This short series addersses the formatting of variables of
> > type resource_size_t in freescale drivers.
> > 
> > The correct format string for resource_size_t is %pa which
> > acts on the address of the variable to be formatted [1].
> > 
> > [1] https://elixir.bootlin.com/linux/v6.11.3/source/Documentation/core-api/printk-formats.rst#L229
> > 
> > These problems were introduced by
> > commit 9d9326d3bc0e ("phy: Change mii_bus id field to a string")
> > 
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Closes: https://lore.kernel.org/netdev/711d7f6d-b785-7560-f4dc-c6aad2cce99@linux-m68k.org/
> > 
> > ---
> > Simon Horman (2):
> >       net: fec_mpc52xx_phy: Use %pa to format resource_size_t
> >       net: ethernet: fs_enet: Use %pa to format resource_size_t
> > 
> >  drivers/net/ethernet/freescale/fec_mpc52xx_phy.c     | 2 +-
> >  drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > base-commit: 6aac56631831e1386b6edd3c583c8afb2abfd267
> > 
> 
> Hi Simon,
> 
> Is this for net-next? I dont see a target tree name :-)

Hi Daniel,

Yes, it is. Sorry for forgetting to include that in the subject.

> Looking at the docs, %pa seems correct to me.
> 
> For the series:
> 
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
> 

