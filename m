Return-Path: <linuxppc-dev+bounces-12608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB461BA73EF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 17:21:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZSj15FsMz3d3Q;
	Mon, 29 Sep 2025 01:21:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:2350:5:403::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759072901;
	cv=none; b=gZ730z5dicxINROY04HMy8hc/dA+XrZ2aPCus/XHu/dcj7fjp0/eGFZGehLj7LDKOfKJZsYGmfDyRzvtDirWCP9agjQLDW9/5q44nmmY2W0OgcZNqsP9gjCAWirDgUM/QUVYQhZCn1NirHcBY5xjwf+blIWe6Sm99zxIxYEToD1HLHpflNRbzfgFvxJQmRJTrdX9OEmMtQDnSVPoi2yVPtkjT3NCdKE7gfKSHjZLkBq6/YwNGLJ0EGvxm1V34gywI3rFn3jiNSMMJBWMNLfJjxT9Rmma/jy+tUMGLbLDMgtBF4qO69HEcoQoU+Zcqy0enn1aU2xvpxCKkf4UD8IWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759072901; c=relaxed/relaxed;
	bh=Ghyryt2xK5vvnvf4Q2js9Uw55oy6LtaOfQDvQKr1uy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRnXnsBxF6Tz4YTjo8nJDQn9Z8SgV1VG81oMd1lLvF8GHn2/VsTtgQzWyvWy71xlb+mnrgNy1SBHFyl5//7HwzTJ31kvwpk7ab6KXOsE0nfAiz0YHJIEZtC8MKJqzVv/r6ANRCChxFHPO42F23m/RBR6Z9bXWeRrXQlbgWuNVxX7gw8E5y759v2iS7LRLWa767hM0FklJb4Wn0oVEs80AHlJEyQwPTjL6jjaK2O9Pg+k4HDze8rZc1kCxv2vRmxnOg9BIj5mwXoDqmwNunEICg5GPflYn+BjEvgHVRkwCQU+6E9OZ7ncAzA5p8PXHE+bPf9qOVyviWWIXX+JZRNYjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; dkim=pass (2048-bit key; secure) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=CtT4iU2T; dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=J0+KaShs; dkim-atps=neutral; spf=pass (client-ip=2a02:2350:5:403::1; helo=mailrelay-egress4.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=lists.ozlabs.org) smtp.helo=mailrelay-egress4.pub.mailoutpod2-cph3.one.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=CtT4iU2T;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=J0+KaShs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay-egress4.pub.mailoutpod2-cph3.one.com (client-ip=2a02:2350:5:403::1; helo=mailrelay-egress4.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 179 seconds by postgrey-1.37 at boromir; Mon, 29 Sep 2025 01:21:35 AEST
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:403::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZShv2X0Nz3d36
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 01:21:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1759072832; x=1759677632;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Ghyryt2xK5vvnvf4Q2js9Uw55oy6LtaOfQDvQKr1uy0=;
	b=CtT4iU2T9YA3xTrD4cIA+BE+C15rUkNnZplc587YI58g+wt9Z/k8mKxjom62woRw7fEUsvfTw8Ego
	 OORUvh9fiJQumZdtSymONvY5MMtJ3KJXP3zsnj3KxJxk4Oiw+38jzutzIsRmg9a15NqXsODmCWj0BM
	 /EaEWRy/uNU7FXsutNnhv+ixhqzFL2HZhBJwBMscK6dVEUiiXxvphkGrAHhj1qC784KABlOh0D02mA
	 4cLaxB8a5GgAT75FDK3kfCkRHDAAi479jPbM5IFPQLlR8lLKW/rv/Z+yeGIJUaeXNjpvPYpXFP9UyV
	 lTS7L9y3fNmnKV3eKZ72pOl8CYKOBDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1759072832; x=1759677632;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Ghyryt2xK5vvnvf4Q2js9Uw55oy6LtaOfQDvQKr1uy0=;
	b=J0+KaShsfwnmVbs3PB0EalU1KScQKZ0oCMj0q/S47VSr8rYDdT1FCDrtDwmZlUzToU5sipbu8KD09
	 RgZbdwtBQ==
X-HalOne-ID: ab2e7cf9-9c7e-11f0-845a-494313b7f784
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net [2.105.16.150])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id ab2e7cf9-9c7e-11f0-845a-494313b7f784;
	Sun, 28 Sep 2025 15:20:31 +0000 (UTC)
Date: Sun, 28 Sep 2025 17:20:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
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
Message-ID: <20250928152030.GA136019@ravnborg.org>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
 <20250928151725.GA135708@ravnborg.org>
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
In-Reply-To: <20250928151725.GA135708@ravnborg.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Leon.

On Sun, Sep 28, 2025 at 05:17:25PM +0200, Sam Ravnborg wrote:
> Hi Leon.
> 
> On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > After conversion of arch code to use physical address mapping,
> > there are no users of .map_page() and .unmap_page() callbacks,
> > so let's remove them.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  include/linux/dma-map-ops.h |  7 -------
> >  kernel/dma/mapping.c        | 12 ------------
> >  kernel/dma/ops_helpers.c    |  8 +-------
> >  3 files changed, 1 insertion(+), 26 deletions(-)
> 
> It looks like you missed a few sparc32 bits:

They were included, but the patch is named sparc64,
which is why I missed it.

If you could rename the patch that would be nice.

	Sam

