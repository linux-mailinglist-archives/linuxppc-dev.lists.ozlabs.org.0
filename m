Return-Path: <linuxppc-dev+bounces-15154-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD0BCEE8A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 13:30:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djNMY1p9Bz2xrC;
	Fri, 02 Jan 2026 23:30:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.32.30.218
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767357049;
	cv=none; b=RZGcRZe3R9aBe5wToe9iPYqAayvfiK4ujZO+LFWFVV03l5zz+FUF7dQMQxmH1x11VrBQubG5SPPjl7IaiBFf1f3EGY2DwCk8OVY4fqvZgbJoOC0HZbID8Nml2uC8E/n8oNUc/9nUk+fx+skuN9WhCy2/wex81TxB4BRE1YU8YkQQW7k90J51cZVxdpzMSXy2RK1kKDQK/Sea+GOxUgYBgUZ8AusMXf0p3pvY7uYq5Tmf5YicBRAODbklLXyv2qFnWvOkBlzcQmYKUKFG9ieI8mXqP6DYqHaIroPKo4Hwm3+12ukNh+rwt3xHrUrraTA3h+NaGVKYzwLbAv/51N2ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767357049; c=relaxed/relaxed;
	bh=6sNsz3nStghYSzY+sXXm0yt/UqQQAPm0N+js139ygxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8HOXobFQ69MhA5zDszbgzfnDxYD21Zgi6CpuziBfu7kxCH26YfBieYThX00W5OsUQcTTzwuRyBvjhw2JGzJQlzloHwXk/fa0U8/h5omdluNUk24i1Ao7W18Q/kuP8yz5OlelL8NdJc9oN+dCqaas6ZIfrTIJDSgtjcmj0OPbEkniRx7culqVIpElKFGotpqtj9QPWsatTE25c52MkEgg95m5aeLv0Iuqt9kwhCzCsKVFtNWFaXCAqZ7r1+/YO+v5v8WyURHrx2cjb04sjnZA7LzGWTBmN9aeEKyrFgF6ws3sWo9iZOeB9FqE/9vzXdhn9+eCCgXwJzw2r4qJ9Wqlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=eWZ6M1Lx; dkim-atps=neutral; spf=none (client-ip=78.32.30.218; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=eWZ6M1Lx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=78.32.30.218; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 932 seconds by postgrey-1.37 at boromir; Fri, 02 Jan 2026 23:30:46 AEDT
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djNMV236cz2x9W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 23:30:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6sNsz3nStghYSzY+sXXm0yt/UqQQAPm0N+js139ygxI=; b=eWZ6M1LxOy7uZXqanWlIQGUAO+
	MOCPLQXa7avZ/2SNw8YuSx1jkWfO8OQ2ROHAeH7unCs2xIfsNw/4UUpt+9+QVaCduJDkuggJPHLqQ
	+327Ef6QUxiHHK2+tyxckPNJbeSqfqB6lFY8F/tWC93NKL95phJOb//iOLMJMQJmVuTwom+mEt04b
	5Jm12IMW8W3uamxmcV+Go/CNG2VMe2q6mX+OUHl+3P1DTg2N6vBeNSeV7P/d//HXpT0+RBtxTu/kl
	GvnzBlqGY0Vl6AzymRFKx//5iAs1ik1f8ldQMYgjme1eLHQ5KGd/U/ZHPOLaXzgvaQ1tX+Vf6IOu9
	+Nmf+7Aw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41622)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vbe1F-000000005x6-2g7a;
	Fri, 02 Jan 2026 12:12:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vbe1A-00000000523-3D6T;
	Fri, 02 Jan 2026 12:12:32 +0000
Date: Fri, 2 Jan 2026 12:12:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthew Wilcox <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH 3/4] ARM: remove support for highmem on VIVT
Message-ID: <aVe2MH0TUsobPaKL@shell.armlinux.org.uk>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-4-arnd@kernel.org>
 <20251219171412.GG254720@nvidia.com>
 <513078d3-976a-4e6d-b311-dcfcfea99238@app.fastmail.com>
 <aUtPRFdbpSQ20eOx@nvidia.com>
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
In-Reply-To: <aUtPRFdbpSQ20eOx@nvidia.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 23, 2025 at 10:26:12PM -0400, Jason Gunthorpe wrote:
> On Fri, Dec 19, 2025 at 09:34:33PM +0100, Arnd Bergmann wrote:
> > On Fri, Dec 19, 2025, at 18:14, Jason Gunthorpe wrote:
> > > On Fri, Dec 19, 2025 at 05:15:58PM +0100, Arnd Bergmann wrote:
> > >>  arch/arm/Kconfig                    |  1 +
> > >>  arch/arm/configs/gemini_defconfig   |  1 -
> > >>  arch/arm/configs/multi_v5_defconfig |  1 -
> > >>  arch/arm/configs/mvebu_v5_defconfig |  1 -
> > >>  arch/arm/include/asm/highmem.h      | 56 ++---------------------------
> > >>  arch/arm/mm/cache-feroceon-l2.c     | 31 ++--------------
> > >>  arch/arm/mm/cache-xsc3l2.c          | 47 +++---------------------
> > >>  arch/arm/mm/dma-mapping.c           | 12 ++-----
> > >>  arch/arm/mm/flush.c                 | 19 +++-------
> > >>  9 files changed, 16 insertions(+), 153 deletions(-)
> > >
> > > This looks great, but do you think there should be a boot time crash
> > > if a VIVT and HIGHMEM are enabled, just incase?
> > 
> > Do you mean in the common code or just for Arm?
> > 
> > We could use the Arm specific cache_is_vivt() macro, but it feels like
> > the 'dpends on !CPU_CACHE_VIVT' Kconfig check I added is both
> > safer and simpler.
> 
> Okay, so maybe I'm asking if !CPU_CACHE_VIVT then the kernel fails to
> boot on vivt systems, maybe it already does?

The cache modes (CPU_CACHE_xxx) are (were) selected by the processor
config entries. Not having the correct processor support built in to
the kernel will cause a boot failure.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

