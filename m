Return-Path: <linuxppc-dev+bounces-11724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98326B43ACC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 13:54:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHdF71cMkz301B;
	Thu,  4 Sep 2025 21:54:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756986875;
	cv=none; b=NAVoTrj3CyfWV2F5A/fqho4DnZH2usdcCmfZSyYJ8lvTSyutpefwp64EpnU4JTg/LBqFGch+ee8CzUX1Ye3AtghubvxK6cvpnbTQTZehaUM+8pUwoMw8zswjOmlnJsTQ3pfJ+dRCagga1vaOA2ZPpgz3vbqK5FxGmwyGAKkhGdKhRda0hmptpD0Gzd50wRkwcxxQmpv54uhPI/swb4SwWHEO5GAIp0aWkMhV0xyDFgYfJ1bJRk3k/XuDp+8nRcei67d9K7QuXsU3lltNeoWRDOlfcxWrfoRk9M69QEol5cfd/WjKpsHc3ch2UMxUuRVXcyGi2Z3SQZU7BXs85Hqr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756986875; c=relaxed/relaxed;
	bh=d3eb554Z7Ch0HcrIOHymmXDKFwkxTvkgcWCnRMUziz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKvetJMVxu0jxCUAPGv5+u6OfbZDr12x5d9UitikqmwDrybvqHqOHdFmincVy8hgEiNU9tBImWziXdAekVAzXJ30Mp7c3akjRIC4jmyjg+ngVPFUTuaDh8RSoR9ZZ7t6Xxm8SIPxTuj/Em7svOqJSpjmWneb+orrOAA/n2CLbuXAM8+gd2jp0zCYQRVlwJZKLOKQ56FdccSp9a7+UGupMbrfaI4A3OZ8I5oNAZy44V+U0pWee9zrdCt68cFT8B5aIXjiUG5cx4zdTNt7c+BTvkRdnqakUK9TQDoJKdIccCYeDMlAClvQHIgcYnCRMAiPdPGfLkKVEt8BiK1HWPki+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BTJP35JU; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BTJP35JU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHdF648Cxz2yrZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 21:54:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F212409D2;
	Thu,  4 Sep 2025 11:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDABC4CEF0;
	Thu,  4 Sep 2025 11:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756986872;
	bh=XNw4rOgmiaWNTpi2TJxzNFfkmGLCRGvr1utyFAJh0o4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTJP35JUbDeQc+Ux8kuW6NTKeHZlYtCpvd5Y8hwmpXzhYILW8ENPq6hqSReA5g5/6
	 hOGPCxSKn2qv5RUsEt5nNpjBiltFo/1MRjz68DyYzmcbGjr5igdtoLfs5ouTlPr4Ee
	 3yDV37FRzkBEVcqKKTjw4tgWqJgRTwgLMYbPrk0/OXslt07SIo25uSg/GlGwm0iAhF
	 pGn8i6YHMAWNn5ahy/gQXK67j3TEuBgFMnVlMDIkSZ2wMzzU19AdJHnrvY5CVqAFpe
	 kdWJ/VlmVVSdDdbkfxzS3KlHP63+mdVglkhuJwMdFlFFV6c6uz6NkFHArciCBPeJX8
	 R5uzN9QaWbXIw==
Date: Thu, 4 Sep 2025 14:54:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 3/7] x86: Stop calling page_address() in free_pages()
Message-ID: <aLl98MQs-FlHo6bW@kernel.org>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-4-vishal.moola@gmail.com>
 <aLl9KneqOYTujcCh@kernel.org>
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
In-Reply-To: <aLl9KneqOYTujcCh@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 04, 2025 at 02:51:14PM +0300, Mike Rapoport wrote:
> On Wed, Sep 03, 2025 at 11:59:17AM -0700, Vishal Moola (Oracle) wrote:
> > free_pages() should be used when we only have a virtual address. We
> > should call __free_pages() directly on our page instead.
> > 
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> > ---
> >  arch/x86/mm/init_64.c          | 2 +-
> >  arch/x86/platform/efi/memmap.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> > index b9426fce5f3e..0e4270e20fad 100644
> > --- a/arch/x86/mm/init_64.c
> > +++ b/arch/x86/mm/init_64.c
> > @@ -1031,7 +1031,7 @@ static void __meminit free_pagetable(struct page *page, int order)
> >  		free_reserved_pages(page, nr_pages);
> >  #endif
> >  	} else {
> > -		free_pages((unsigned long)page_address(page), order);
> > +		__free_pages(page, order);
> >  	}
> >  }
> >  
> > diff --git a/arch/x86/platform/efi/memmap.c b/arch/x86/platform/efi/memmap.c
> > index 061b8ecc71a1..023697c88910 100644
> > --- a/arch/x86/platform/efi/memmap.c
> > +++ b/arch/x86/platform/efi/memmap.c
> > @@ -42,7 +42,7 @@ void __init __efi_memmap_free(u64 phys, unsigned long size, unsigned long flags)
> >  		struct page *p = pfn_to_page(PHYS_PFN(phys));
> >  		unsigned int order = get_order(size);
> >  
> > -		free_pages((unsigned long) page_address(p), order);
> 
> Could be just free_pages((unsigned long)phys_to_virt(phys), order), then
> the page is not needed at all.

Or even __free_pages(phys_to_page(phys), order);
 
> > +		__free_pages(p, order);
> >  	}
> >  }
> >  
> > -- 
> > 2.51.0
> > 
> > 
> 
> -- 
> Sincerely yours,
> Mike.

-- 
Sincerely yours,
Mike.

