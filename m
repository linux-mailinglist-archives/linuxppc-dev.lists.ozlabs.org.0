Return-Path: <linuxppc-dev+bounces-12610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CEABA7425
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 17:31:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZSvy2K9yz3cyf;
	Mon, 29 Sep 2025 01:31:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759073470;
	cv=none; b=K+o+UrapBLWVVaUaPcqvd09jfeBORXrKGJLUPTafP1TJGpxGlSMT1KLAouMnCUKdADXVeaNT/SznM5jN9TS5S38M9kXDrJIAb9wlKE01tLX23mJqgTs3WccKaEg6pxYfI/bE2fr9gKQ4AYRJ3mv5olLzClZIUDkaAzzgVtx1YyNZDBjpsGFhARuaKd08VkQCU9CGmAEtp+QqD6jAe9fvICvEdWbl7qcmwygoiulj2drEzqEsPSZWNjbORv+bF1wuemvKAGOJ5FlR+d+OzeWQnCN5J/WBqfjLTMRwz3a9Ok4Pw0H9wAvz1rozGwTGnvZAM4y81jDULcszx+NGsgeNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759073470; c=relaxed/relaxed;
	bh=6W5evHU2YmmAKdG/HmjWb60bwX6URNUxnkCR7NY90vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZgoUktSx3X+D4OYKY+kfgYSTQYJ8GxJ7c3OPV3GiC2QmN47sGFVMhFajT15CTBpqxzoh40Ho3xxZmyVZlUa6HYWlGt9TdxBEukenzoMTehdUJbKg7lV6S6dfKviUK0ao2mA3+6gxACucfPpIyfSY8DNqRpigykp3mds+YI9xa7OLc6o7T44Whj83a4nFGC9dIlTIp9ffuAUr6erkWGpB9zMN3mOMmlC/0n/TWEJQhW+KmbYjO4yNlYXK6SEqdiPlr9yVxJv/BwZ/Lpx1H1m8qmppDUTFv1G/DHlKOXxwCsi7eRvyuleqNXVEu/UF3EhabthrbizhFO5b0oBjLNpew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o16pSV0P; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o16pSV0P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZSvx4bsHz3cyc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 01:31:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AB1A6218F;
	Sun, 28 Sep 2025 15:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FAEC4CEF5;
	Sun, 28 Sep 2025 15:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759073467;
	bh=lGCIsTrsyWZ8QOPIKq8I5fg/cOuQCrmM7ZcLWOcdn9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o16pSV0PpKM0QT5VYemmYPv3rNvw+gxL11Fj3yidIo2Gut35r6WcPhG9ZUyHgf10N
	 HDoUvAriBjQKKzLaUqSq/NvZQviTbP6Clkx6YJlm8tmGye4n+XchUKfL6k9zPTRZMV
	 TDipWjxyMkDPns3af7oj7M+e1Jre+95S/Gx9tN+Vm4PlrusP/lU9slnofDh6/ZsSSX
	 kT5XAqaDTqgR+UVNQA8g7H75XmRpBDadQzy2MAo6TwB1QXQn4VdvPL1TspAL2PuX9a
	 zblg3faGha9PBO5W1YWwMCeUXrGEmQnur9K8XOOjy19L+pJZmPK1bf0y+sm4i/+kU3
	 fsu9L2JRJahmg==
Date: Sun, 28 Sep 2025 18:31:03 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 9/9] dma-mapping: remove unused map_page callback
Message-ID: <20250928153103.GB324804@unreal>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
 <20250928151725.GA135708@ravnborg.org>
 <20250928152030.GA136019@ravnborg.org>
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
In-Reply-To: <20250928152030.GA136019@ravnborg.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 28, 2025 at 05:20:30PM +0200, Sam Ravnborg wrote:
> Hi Leon.
> 
> On Sun, Sep 28, 2025 at 05:17:25PM +0200, Sam Ravnborg wrote:
> > Hi Leon.
> > 
> > On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > After conversion of arch code to use physical address mapping,
> > > there are no users of .map_page() and .unmap_page() callbacks,
> > > so let's remove them.
> > > 
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > ---
> > >  include/linux/dma-map-ops.h |  7 -------
> > >  kernel/dma/mapping.c        | 12 ------------
> > >  kernel/dma/ops_helpers.c    |  8 +-------
> > >  3 files changed, 1 insertion(+), 26 deletions(-)
> > 
> > It looks like you missed a few sparc32 bits:
> 
> They were included, but the patch is named sparc64,
> which is why I missed it.
> 
> If you could rename the patch that would be nice.

Let's see if new version is required.

Thanks

> 
> 	Sam
> 

