Return-Path: <linuxppc-dev+bounces-15919-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFB8D37948
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 18:21:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt67v4cGmz2xnj;
	Sat, 17 Jan 2026 04:20:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768584059;
	cv=none; b=aP1fatKYMZm3r01MXeND4JcFaDZ5haOvGpgeTahHeQBuZAbvaOeEoyM76HB5GI/zUJhncZpBLaAoJpi+6Y1uXr27P8yvXgSJps1ZM5e85wF5X7f9jed1vHbaLKL35LB9iIBJ6DTs8sVrdIJD/fO+Ee5Y6f2DWdR3/vsFmoUG7ckV4pSh+SiAag2/tQkXIDIfKdu6nPVyXlmhWwtUcjA4iS1sTwNgNgv6Eh9kiL12eItLjipQDpGECitK2a/6qvU+PStfXGYxmotpkaWC4qs/nOVP3sCc2VrZ9u37bhvRktByjt3fJHlKSnfZ/oEZj1awptVmlIBNKIZW+jozt2lsKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768584059; c=relaxed/relaxed;
	bh=ke97Rr0JZ7eY7fCVBJ0MTKU0b1sPJJtx1nolStxn4zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3feFFDWtqGfmcCRScWzW0k7X7P+EmjfkBvLKc0I1moFixVHdNRZvLFQ+GDfLdH0XpfTIZsHC0Vw/0UvwEglR+KNJ03cwZ7cWGn3SYS2ja+/143x4hSatBgL8sNROlu5jT8djJSDHLIPwDRC47bxbnQiqE+Rf4ybZpDWlcJeUqcYSFIVPfvZ8ibsWD/47KSLkAXFJtL66tp6V5CJI3baBeEDFEhf3pLsNItFFzxUjNtFqxsZMpvs5pgwjRzDYKQ7XPm94TDhUBqvZi+w9wGWK40B0qYKC3vDt+fQmfUQI4bq/yp4behn+Xr/N7EYBgl4zrriRxh03R6gXR/rET/YSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=IlF2wYdj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=IlF2wYdj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt67t05Kyz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 04:20:57 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-88a2f2e5445so27748786d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 09:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768584053; x=1769188853; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ke97Rr0JZ7eY7fCVBJ0MTKU0b1sPJJtx1nolStxn4zc=;
        b=IlF2wYdjL50aJLNuTIVVB5KOJm8Vi0e0/KhTvnTcfLpPp1gqaqZk6t0nJ4mSZjIipY
         7NoF9O7ly2t75IwGDKIyayRkVlIPOdX0bjajlLl08Zv8kD3+bn1x5IpfmkdPVB8DCWAa
         aJ6g2Xpuf5c7DDWFRGLcWXShjqLQsu4CmbRGv22ZIPSUM573xOxI+q/KesYpB5GOPQKn
         rxhSgJGR9DMcuKHbi7Ez+180Kj/lRrWFDtNopzqkovp46D469jZxRr/4BFH2vnyThSCc
         0Oe1Y52kclEeTdrEmdKCzPtJJO613KMYVvaXsiRMMZcfoNk/rFzPwqR3CSyorhrpOHoU
         lgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768584053; x=1769188853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ke97Rr0JZ7eY7fCVBJ0MTKU0b1sPJJtx1nolStxn4zc=;
        b=NSRfmv0MLUBcjWVgKbzhuOhxXHom8hAxkal7panvRdEzsQdDywj3jKf8mSN//Kfqsd
         7L4H1da1xihwvH7K98YoNLIAnrsSSVLvNdcpQY0qp9t7LTCQuQ/07EdwNfB32bwBLns5
         mA3aWDb8M5I9ZpsRsWZAo+bdVWF8+cEyAl6TRw+2dxXAPt9+UceeEvsSt7pORYa467x5
         G9cGtWCK9J9T+Qoe3NK8r2IJme+CYkRc2LcBn758EFdx44lM79sT433sM9s1VytWSoHi
         tQ+XZ9+e4t0qJStW6NIz8RlIk3OIG2v0Ue6Dd8YXlQdOcNzHIzSJ9M6BQzR0T5yddzUy
         c/mA==
X-Forwarded-Encrypted: i=1; AJvYcCWzxFkAXTg7lXKFECMYJsZ2QIVzuKvY/HRXeXmwNnhI2mCMqCk7LUNdTIZl3qFsuHWkGvvg8C0Sy6MMd/U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyDmySyhSBozvaJLjTyDhEL0HabzQ2zWC6EY0GdUg3EttBsQA4G
	vj1yZYZBmd3HFQIK4Ag4rs6SshFHYQNLph8XMwi52UVkiEEDEg94OP+Xw6JgowEo+9E=
X-Gm-Gg: AY/fxX5WbNd1OjoSKGDGvV56Cd7kUF6w5obZs1AREihEGtkdT47zg1DB5comtLi1qzQ
	bd0T8r9OAsIvDW1YSO0gbeAd9QWs5Lv3yRraP2fkFKPztL77dH9Nu3zyJNGMo5oAH5FLTYjcTAu
	JdMcpSaTCh742v7JaKmVxjtFFdfIZrDcrQrqHj1zi/Ip9VCRC1NZ4qxDBocDQ49cUO1z8t1PVWs
	lk+xL0kcgUW+lJsw5/ZbUlGgEBtLwO1q9bfXl9l+eHucLYQu9CW3nSTmbtWdCLA4tLrlq+AxOJ9
	ShcdipCklL6NPoeU/ifdSZirlDzvaAIwQHaK/k8SBLQtUyDMfzlvAp+3jGq6fGKLIadR6c1O7N1
	2o/ela+0/qXExvyd8RwOcK+sueN37AEuayMbg+ndG6i3QXm2xSrbxPXnablBiZ9WCYWDV+OosoT
	O5XWhTq1uRrOppa1oCEaiI8Cfmda2Ts+nTQIEHO7SBARtHNIGaP8hcPb88Zf30MOWn1VM=
X-Received: by 2002:a05:6214:d08:b0:88a:529a:a543 with SMTP id 6a1803df08f44-8942e543175mr46699756d6.69.1768584053510;
        Fri, 16 Jan 2026 09:20:53 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6ad606sm26895826d6.33.2026.01.16.09.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 09:20:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vgnVE-00000004kb4-0KMs;
	Fri, 16 Jan 2026 13:20:52 -0400
Date: Fri, 16 Jan 2026 13:20:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Francois Dugast <francois.dugast@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	adhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Balbir Singh <balbirs@nvidia.com>,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-mm@kvack.org,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <20260116172052.GC961572@ziepe.ca>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <ed6ca250-67ee-4f7a-bc3b-66169494549a@suse.cz>
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
In-Reply-To: <ed6ca250-67ee-4f7a-bc3b-66169494549a@suse.cz>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 05:07:09PM +0100, Vlastimil Babka wrote:
> On 1/16/26 12:10, Francois Dugast wrote:
> > From: Matthew Brost <matthew.brost@intel.com>
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 63c6ab4fdf08..ac7be07e3361 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -477,10 +477,43 @@ void free_zone_device_folio(struct folio *folio)
> >  	}
> >  }
> >  
> > -void zone_device_page_init(struct page *page, unsigned int order)
> > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > +			   unsigned int order)
> >  {
> > +	struct page *new_page = page;
> > +	unsigned int i;
> > +
> >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >  
> > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > +		struct folio *new_folio = (struct folio *)new_page;
> > +
> > +		/*
> > +		 * new_page could have been part of previous higher order folio
> > +		 * which encodes the order, in page + 1, in the flags bits. We
> > +		 * blindly clear bits which could have set my order field here,
> > +		 * including page head.
> > +		 */
> > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > +
> > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > +		/*
> > +		 * This pointer math looks odd, but new_page could have been
> > +		 * part of a previous higher order folio, which sets _nr_pages
> > +		 * in page + 1 (new_page). Therefore, we use pointer casting to
> > +		 * correctly locate the _nr_pages bits within new_page which
> > +		 * could have modified by previous higher order folio.
> > +		 */
> > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > +#endif
> > +
> > +		new_folio->mapping = NULL;
> > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > +	}
> > +
> >  	/*
> >  	 * Drivers shouldn't be allocating pages after calling
> >  	 * memunmap_pages().
> 
> Can't say I'm a fan of this. It probably works now (so I'm not nacking) but
> seems rather fragile. It seems likely to me somebody will try to change some
> implementation detail in the page allocator and not notice it breaks this,
> for example. I hope we can eventually get to something more robust.

These pages shouldn't be in the buddy allocator at all? The driver
using the ZONE_DEVICE pages is responsible to provide its own
allocator.

Did you mean something else?

Jason
 

