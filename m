Return-Path: <linuxppc-dev+bounces-12382-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EC0B860C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 18:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSLls2zR7z2yMw;
	Fri, 19 Sep 2025 02:32:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758213177;
	cv=none; b=TwcWtohUo0sqYMq/E66qQ248lu56mkNvlcA6ssw99TfKd4SC+oUzc/NzLtmQTzVIf3F2pfiVS3dELnmf+2dfK54UW8oABoz2BNXPwHtPu75JLQ+47X1ltxMiCT7PvT0hCOiDfw+UwUuwkkkMLEyxGOknpJoE7/RGJBw1g6Ga1zKP85NS3tqAcWdNk1+4C4HOPLcyEageO0iMwOz5NbAeGk3+iNuQotntGjzv6GMhMhmos79zdVnb2b05S5YYq8vu0jAMq3yOV3zFw82mdYFUucB5RoZn3hNV62xljogxfLJvJx32/XxnJXyDtv5GFjh6JvT8tHPRddSR/oOr0YPL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758213177; c=relaxed/relaxed;
	bh=0ks/Dt/gG06zpcviyC2RmuMfALb4spkC/mj20Xhc7U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkNQbIZjvQcMrLOXSxhTt92x4+JHYhEMmjH5urZlmVUpxwfU/wigmGBJAX7PQCVyG73sTWbIcTHac+zgGkxzxlXFfd9KoBBedIBz+DpAyy7Vd9IeLWgIJClxZPRPoCKGXHaT9DnPWy6JKYAo6iBd04nmS42mU5g/jihda3AjtH/mv+VPqAEFZm0FItosAwu5WkMf96t2RUcA66GTi8phrGqr4MpNIL2BKkRcq4B9SvtqMMRMFF3iyoSDEoo9+s80znT1DHiG9lP+pCeITVXxbLiOX1XeUWaos2XJN173Ljj0xPuDQ0B9AyI8L7e/1v5ynptgHnQiXhqjkhAK/dz7zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=KoLiEW3a; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=KoLiEW3a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSLlq5qcRz2xlR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 02:32:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0ks/Dt/gG06zpcviyC2RmuMfALb4spkC/mj20Xhc7U4=; b=KoLiEW3a+FctGMCYTji6G0piKX
	6+2sXpnGjpyCiB9GZ1aJLpE4MPYaT4SHrv8fw7rBSREmCDqF4nuUIBFZIIYmv+i3ReGtxZ8MGrp+s
	j+YRd0HmYRcGKfIR/k6IHWq3t+jxGCnOm+ADllcYsPkFk37j3Kv81W5EGdi5YRAO43vk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uzHYr-008qze-89; Thu, 18 Sep 2025 18:32:45 +0200
Date: Thu, 18 Sep 2025 18:32:45 +0200
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
Message-ID: <f4154621-be77-4c08-89d4-ab931ac3df30@lunn.ch>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <ca6fc8dc-d1ee-41a8-a1c9-11ed2907207f@lunn.ch>
 <ea6562f4-ec8c-4e99-98ec-000c25c34a3e@app.fastmail.com>
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
In-Reply-To: <ea6562f4-ec8c-4e99-98ec-000c25c34a3e@app.fastmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> Do you know of any kirkwood machines beside the OpenBlocks A7
> that have more than 512MB of RAM?

No.

	Andrew

