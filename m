Return-Path: <linuxppc-dev+bounces-15545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D47BD12E22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 14:46:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqYZ21lVnz2yQJ;
	Tue, 13 Jan 2026 00:46:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768225578;
	cv=none; b=QWX1Uh/Ju807+zmtW5+ZXkz6kzL06BPFeWbEg1DNhqdlwJQfvZCZy/97J6zOzZQV78Fgm6a9l1WjN9Q3khqG6nUvChpflKLEMELmidU8LCKCJVocbURTQ33G2TAUdNbAWqYPd1Zentqzq9OYw0HjGT1W1DDbkYmTKBJzcLydcl8GDtPSPNF5Sgvuu1H/uhYCat3hNO4+S32qZn0OMBy/g19oz5qAwTLjr54M5hmDTpWHafTA94ULjWH3LaUpJ6anSd+s+WaapNHggR9qESTHt4wjP2aVM5mup/berg2NMTJypyvHQcYTFimvrEgOGAQDhexdOe31AtTwI7o8ht3e8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768225578; c=relaxed/relaxed;
	bh=oQVWjYpPCtwp4dXF89g7hQK6KDriflVp74tvOjx72Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxpYVlHxT09IB13DFl0k3pQCnjZsALHH5OrI0Jw1LN8XZVs2pKpeF4uCxxl5Xe/tLY98s62xOuN6sj2eQFuTfHii76glr5kJ6CL2/KKt5mTBuJBURBsxA8F0Mt9V/hGHnDPuCGOlUThw4sSX9fiHbRVKDuVKnsPuy0+mWmJTDjSj1LKnTqWDzCeDlq5qYXrn3iq/Co+iToEyrbnghLUqzfF9Vd3CCT4i3Fhzd8FGNmWVbsACxJ12+gJDmEmp8DtWpWNNpKtx1Up7WZghudzTWQIHCRhPqx9L3U74XlOBmvUySv4aq4NXt3xvz+Vz0NJnB9aoJU13J8sMiGJ9DXAT+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AcczSSh3; dkim-atps=neutral; spf=pass (client-ip=209.85.160.170; helo=mail-qt1-f170.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AcczSSh3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=209.85.160.170; helo=mail-qt1-f170.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqYZ04KnCz2xPW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 00:46:15 +1100 (AEDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ee1939e70bso72171501cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 05:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768225513; x=1768830313; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQVWjYpPCtwp4dXF89g7hQK6KDriflVp74tvOjx72Jc=;
        b=AcczSSh3JQDPS3Sce3qO2Vlde1ndYjY6fLZ+Op2Hd6IjWi71Ab+q4nqVfRpHKftdAC
         W8JbFWAz3qtqlxIdk3RWtbYAl25nipV2x3/z3mCkcJFcXrRlUD1TM8Yj7D3ImFV99kn3
         IFwXEK2YBNPhhc8XKqOeQMeA29fIBcWfX9VS7YggDlLO4Pa9n4u19AnIRFo3NxnepILy
         LPoKGnxNA/7+usfGWCLB+ZO7MU8q0NZ5Tbxe3Yh+gexXQfeI0VpDxtDX+4MdqfORl4/T
         eWl0TEz2mrV4D9tTTEroQgl4iFhM59grbsZpOA7GkhB2117GWm0oEWmWv/4/hWIHHujL
         bapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225513; x=1768830313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQVWjYpPCtwp4dXF89g7hQK6KDriflVp74tvOjx72Jc=;
        b=S6y9qxY02S4dRBD+OoMT98HAlprvMEV+qFHEdir3PJE1V0Lu1ElFmhb/aFkQHei8FE
         SjiJ2F73WZo6px3kssse8Wl6dbTYhiA3vV1kSQy9/ED+jYM+lBYbfmZ2Q7pOaIwYuAUP
         YxK8jH/zpPtX7wOx+lYVHQa9dySlyYgrJmShLHKcsGwGM/zkr9Bm7b7NcH7MXMY/NseN
         jNxYrwyx3QIk8TJZc2vjVfLgo9XyiU+u4WBzM4RrLXBFg0pcURt+OgVquCdPFkvtG2WI
         zQKJU5GBeg/A4hoSAEulXJcSZPAZob0d8eIc49lKXO63NXbGRmIBwbA25K/AHcjRY3P0
         ZzQw==
X-Forwarded-Encrypted: i=1; AJvYcCVhv1xlCb7wXkbUQgTXCSb0VbbhpDyLRfk/8V1/zRPyHsRkL1coCCC9utmN1VppDxT68+B6HAQvkx8FtLw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxBW4W+DdNCSeohrxX+PkEFuz0oFEMjH0rARacVZZZGGXE5hyh
	E1jxlXHzBNQSLR0Y1mHHeC/Uf8VUb32k7L40wwP0ViQGbUZgfGxB+Jt0Q21UQh+WPEw=
X-Gm-Gg: AY/fxX6rfGABgbv2RfGS6Lr0/hOglflV1FKWHil6/GWgZnUIVh/qwqqExg5e6Oi0NI0
	YQRv5Xo0zLv8K8lwYnMhAqLx9KUh1tiHtM8E8sHuNpDmslGQG6ZdtVoOsDrufqKXZvneG4J/7e4
	q8cAUi6drw9bq/NLZdA7c9M9dTx0u2NV8CTpTc9/8HOoMotTSEGKsHopLJSSj6ctJq8s+yjwvZ8
	1Iei+A4O5zHjES03MzqUUZOkGJn1cNHmreJVUfDRs21b/3TEGyHCuwXuj0swNGQMWFE504KbaxK
	r8xJWNCcWFhlz32ywQA88fQgzZ/E6HYb2KoiqyIcxTwp96772XaLPoIB55Mk+k+jORmt3LV+Huy
	o1x8mM2NtDqToy9gh2u1Q5X/TLUg17FzBgZYic+ZMOOhqrlwSVhOVjfxr2nmPYmKTBVj/U4EbPb
	i8gA6vlM2zTffWyjZs9bsGj2Kkg2uGwGFkjYBOJSbxv+fgBBYb8MMPKwixgKznogAil0mIV5gJi
	4k3Rw==
X-Google-Smtp-Source: AGHT+IG20+wZaR0cdbZzmqo1CbORIU0XkpxQP0kdASvCc3hNxGR2kbLwFGbi9bRoyfQYpJE34s/36Q==
X-Received: by 2002:ac8:7f4e:0:b0:4ed:6803:6189 with SMTP id d75a77b69052e-4ffb49998dfmr285683391cf.53.1768225512643;
        Mon, 12 Jan 2026 05:45:12 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e36232sm124159891cf.22.2026.01.12.05.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:45:11 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfIEI-00000003Q1m-3fo1;
	Mon, 12 Jan 2026 09:45:10 -0400
Date: Mon, 12 Jan 2026 09:45:10 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>, Balbir Singh <balbirs@nvidia.com>,
	Francois Dugast <francois.dugast@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
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
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-pci@vger.kernel.org, linux-mm@kvack.org,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <20260112134510.GC745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Jan 11, 2026 at 07:51:01PM -0500, Zi Yan wrote:
> On 11 Jan 2026, at 19:19, Balbir Singh wrote:
> 
> > On 1/12/26 08:35, Matthew Wilcox wrote:
> >> On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
> >>> The core MM splits the folio before calling folio_free, restoring the
> >>> zone pages associated with the folio to an initialized state (e.g.,
> >>> non-compound, pgmap valid, etc...). The order argument represents the
> >>> folio’s order prior to the split which can be used driver side to know
> >>> how many pages are being freed.
> >>
> >> This really feels like the wrong way to fix this problem.
> >>
> 
> Hi Matthew,
> 
> I think the wording is confusing, since the actual issue is that:
> 
> 1. zone_device_page_init() calls prep_compound_page() to form a large folio,
> 2. but free_zone_device_folio() never reverse the course,
> 3. the undo of prep_compound_page() in free_zone_device_folio() needs to
>    be done before driver callback ->folio_free(), since once ->folio_free()
>    is called, the folio can be reallocated immediately,
> 4. after the undo of prep_compound_page(), folio_order() can no longer provide
>    the original order information, thus, folio_free() needs that for proper
>    device side ref manipulation.

There is something wrong with the driver if the "folio can be
reallocated immediately".

The flow generally expects there to be a driver allocator linked to
folio_free()

1) Allocator finds free memory
2) zone_device_page_init() allocates the memory and makes refcount=1
3) __folio_put() knows the recount 0.
4) free_zone_device_folio() calls folio_free(), but it doesn't
   actually need to undo prep_compound_page() because *NOTHING* can
   use the page pointer at this point.
5) Driver puts the memory back into the allocator and now #1 can
   happen. It knows how much memory to put back because folio->order
   is valid from #2
6) #1 happens again, then #2 happens again and the folio is in the
   right state for use. The successor #2 fully undoes the work of the
   predecessor #2.

If you have races where #1 can happen immediately after #3 then the
driver design is fundamentally broken and passing around order isn't
going to help anything.

If the allocator is using the struct page memory then step #5 should
also clean up the struct page with the allocator data before returning
it to the allocator.

I vaugely remember talking about this before in the context of the Xe
driver.. You can't just take an existing VRAM allocator and layer it
on top of the folios and have it broadly ignore the folio_free
callback.

Jsaon

