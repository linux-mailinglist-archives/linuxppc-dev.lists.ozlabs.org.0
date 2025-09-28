Return-Path: <linuxppc-dev+bounces-12609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BF5BA7408
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 17:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZSs31frLz3d8Z;
	Mon, 29 Sep 2025 01:28:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759073319;
	cv=none; b=GAOFELLM0jeG02IzFs5/hzYyfqZrJhALX9lI5ipS17KG4vj8OQG4c4mqIItPeT+wGi1VFu/x5HKyMu/yMJohjYamTxcRBiSNdqFkaKaykoGUa0HvRQOPj52ZWzn7qWzKLP/TOvbzKuWPAQo7BaBKf9+zro4085neWslG1Xrj0XQkPllfdZ6XmwufeKQCr1FdV9FANJMMnDenvhTjugtdWuWuSHNs9RJW1OQRKaua0GwzERee36pYcx004FDKcT2VPVFdGjRHTkG2c4ZAxkpPDm3fxqF5qOZCO+1ujBzlaWUvzndfILuYPN/Fp2QpmKz/JtpPh2czOnO3rA4WnYT7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759073319; c=relaxed/relaxed;
	bh=rxIWKtjcZOXpf2PWvpzrZKBVTXyvJFkhupky+t0gZZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrhY/vLwhIPaL0x4K4Xo8LqmHa8X5wLHcFKF96SWAuh4GKjJPOJatgaeP0Z/GkpV4i9s8iMwAKgd86P290mY92wVN55tR8p1fMmp2AyyqrOEBV8FKyDuLK6Qmg/PDwbpNrnSjij9Y1//quBKgKwul48DlIxtKqANSOD/Ft63XFl4oEJpN/VoIhJ2it8xVFzvcK9UW2C/5kjVbB4Spn97UXXGjHnlK3B4s8nK6AuC2yCythFbMK9JeE324O9RryU6RF4es5iNq5ahY04yKXevm/FADRCDmP848JhQtzWqlTvW0aY81jrxmJvETZi3/w0rpvFFivoV5iqhj/ZrJA4dvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f1YhjVPK; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f1YhjVPK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZSs21p0zz3d8S
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 01:28:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 756A46218E;
	Sun, 28 Sep 2025 15:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D567C4CEF0;
	Sun, 28 Sep 2025 15:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759073315;
	bh=j3dJ7dm9Jex7hj7zDSOs/rnehFATrVSGsSj9oi0KREM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1YhjVPKUf7C/0/LxXAZBncp5RteetEhwJWXFm/vEFPUulFmvL8IxH077S1rMLJtr
	 d2ZgZgVpCx6rd1totAk5q+h7xqPmOOTtzW5w30YaKisVYvwJq5gRqIDGRHY5T/f4gQ
	 O0PYgjbB/cH7oJ1jFPBNLr3rGkOI2qMk/87YL11RjncJuK6Qjt9VPe0h+TqS18yZyA
	 BZqpYFUKRf23DvC6/+sd1BLnzDDD/hXAh8aUEZqIXh4WqdIZHr4zt3c9wvIaaQFzw4
	 UZD9hcw+AzQFsbXJe27so0nVBzGtUu2qhqiGBcZy6B5qFDuhtL/1hVaC8gTpWufr4a
	 sdkGg8+AkSuEw==
Date: Sun, 28 Sep 2025 18:28:30 +0300
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
Message-ID: <20250928152830.GA324804@unreal>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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
> mm/iommu.c:
> static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
> #ifdef CONFIG_SBUS
>         .alloc                  = sbus_iommu_alloc,
>         .free                   = sbus_iommu_free,
> #endif
>         .map_page               = sbus_iommu_map_page_gflush,
>         .unmap_page             = sbus_iommu_unmap_page,
>         .map_sg                 = sbus_iommu_map_sg_gflush,
> 
> mm/io-unit.c:
> static const struct dma_map_ops iounit_dma_ops = {
> #ifdef CONFIG_SBUS
>         .alloc                  = iounit_alloc,
>         .free                   = iounit_free,
> #endif
>         .map_page               = iounit_map_page,
>         .unmap_page             = iounit_unmap_page,
>         .map_sg                 = iounit_map_sg,
> 
> I did not compile test, but from a quick look they need to be updated.

There were updated, see patch #5.
https://lore.kernel.org/all/bac909dab3c82fc6a7a4f5a31f22bac9a69f7f07.1759071169.git.leon@kernel.org/T/#u

arch/sparc/mm/iommu.c:
  426 static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
  427 #ifdef CONFIG_SBUS
  428         .alloc                  = sbus_iommu_alloc,
  429         .free                   = sbus_iommu_free,
  430 #endif
  431         .map_phys               = sbus_iommu_map_phys_gflush,
  432         .unmap_phys             = sbus_iommu_unmap_phys,
  433         .map_sg                 = sbus_iommu_map_sg_gflush,
  434         .unmap_sg               = sbus_iommu_unmap_sg,
  435 };

arch/sparc/mm/io-unit.c:
  276 static const struct dma_map_ops iounit_dma_ops = {
  277 #ifdef CONFIG_SBUS
  278         .alloc                  = iounit_alloc,
  279         .free                   = iounit_free,
  280 #endif
  281         .map_phys               = iounit_map_phys,
  282         .unmap_phys             = iounit_unmap_phys,
  283         .map_sg                 = iounit_map_sg,
  284         .unmap_sg               = iounit_unmap_sg,
  285 };

Thanks

> 
> 	Sam
> 

