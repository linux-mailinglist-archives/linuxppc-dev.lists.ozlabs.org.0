Return-Path: <linuxppc-dev+bounces-12368-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55234B8510A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 16:12:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSHdC4sDdz2yGM;
	Fri, 19 Sep 2025 00:11:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758204719;
	cv=none; b=NJC0CAakEIg7n6ZRlcdsYFt5PL+DSG13F4n/Fxzl0sHHPJwETutQkZslzaaFq2VXaohb5YzMvWoEgaVScUETYsHGIkP0fzI+lxl/pamBI49C1cwHvk6gOZQLMH4lMXcmTWXrBeyOWFrgfF3t6uUn2NRhTLHaBURAbcn1srrN2v7dXRiEQHDzm9KyNQ2UV3bUIvVp/7jSMtWUfUm0U1C4Sl9ChqFVyMkU2iPVISF2p2JA3nj1d/u+udP4RPwnxkH5zXpvpLk33QJQvKb68v1hyoXQQupm4gLTLwkQOtJXQzRGay8xHQ9A6CaFz1WmolaPBwE2qWPdClWWyND8aNENmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758204719; c=relaxed/relaxed;
	bh=2WK7RF7NsYG+8NsyTTvySh7GNGT5jm6UcDa778flAEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiZY793vEARhKrRufzxPzIU/UgVvTni8355WWqDTD+qbx9NTrXodkPlmqIQPagnELg6EwAWr0yYV294UadC8dM7+ohwjgPgeRRWGfAY7Z83SIBUqbOXH8VdNmMUY7N5tl0B+H4PZ2KfyPu48vHFFypaBsc3ZuljdsiOKGfPI86Cy52r+4kcTDLVznCkEQfeRBVYWgXluFTdrlWUwGB0ZhwBqXQGjti4IsM6J9lvQZJYhSXlAqO6bIhTlRBj80X5Fv/J87NWtcOuOqdf4MgYfnckP3srBblWJpY8XRd7mIv2Exs3aVGkSoQqrYBFMaSu+RsMjP2vgiT6ykCiacHzYWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=mffiEw3N; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=mffiEw3N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
X-Greylist: delayed 2236 seconds by postgrey-1.37 at boromir; Fri, 19 Sep 2025 00:11:58 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSHdB5mwRz2xlR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 00:11:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2WK7RF7NsYG+8NsyTTvySh7GNGT5jm6UcDa778flAEQ=; b=mffiEw3N0Xsy0iehgYkPk5d+dg
	sWKIhv5XK/zUNW+x7cpwzMKn+fWVigxBkekrLwF/YIOd76oce1YtRzHGNOghxSvsx4TZKrO8BB5yX
	oA6G/OA6kjESeDYNowdA/HoKupolfgZZgm9ZJ1RTWZMa7p8eDc9puB5qodRd9gcxhoms=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uzEmL-008pSt-MZ; Thu, 18 Sep 2025 15:34:29 +0200
Date: Thu, 18 Sep 2025 15:34:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Andreas Larsson <andreas@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Message-ID: <ca6fc8dc-d1ee-41a8-a1c9-11ed2907207f@lunn.ch>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> * Marvell mv78xx0 and kirkwood (armv5 pj1) were fairly
>   powerful in 2008 and could support at least 1GB of RAM,
>   but I only found one machine (OpenBlocks A7) that does
>   this. It's unclear if anyone is still updating kernels
>   on this machine, but they could /probably/ use
>   VMSPLIT_3G_OPT if they do.

If i remember correctly, there was a design issue with the OpenBlocks
A7, and it would not run with its full amount of memory. To get a
stable system you had to limit the RAM. I don't remember if that was
just with the NULL series, and it was fixed for mass production
devices, or they are all broken.

I doubt there are any mv78xx0 machines left, why where never very
popular, but there are still Kirkwood NAS boxes around. I keep mine up
to date, put an LTS kernel on it once a year, update to the latest
debian sid.

	Andrew

