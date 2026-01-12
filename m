Return-Path: <linuxppc-dev+bounces-15547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEE9D142BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 17:51:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqdgL41kyz2xKh;
	Tue, 13 Jan 2026 03:51:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768236670;
	cv=none; b=la/bc3+B3iy+D251u27+ltRHzkAttFmRqkFeWhvTLdpbMMiK4pNFnbGVZ0UPkBA5Mzi3VSZuBnQfzsRVaUYHNGP237DR2/nRsbQ22gqteC2qzMOvLnWOeehtdQ4mNseREOnkLUhheQDrZ/3sLGeyeuEFx212HqoU36L07yXTGx+GTj31YI0dSwDdQC0FuE1wqdA+gEvJeqDHweG+B+gjt1Sbpu5ATDJh7xS94XUl9AQPYII4gqaiAJtv8rZd8NFc+/QVVLuECH5jdDk2rXlbtd4CU5TDcE0gV7b+FRX7HnMavMbbs2RAtElYNzNdXXjxq1UGlaVh57+XevnSdKKEug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768236670; c=relaxed/relaxed;
	bh=eAxh70JY3ShLNfnDxBWsRZWpalCHcaRfsM5YzKZ+W9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AS7lxozrKl0voIVhxusDhSmfq3OEY28gsXpg1qpUSb9O/aRgv2GJuRYs45O579jet8sbWtoQV7ULAE/SF63qtFRsba757SOBs6hb6CNNS1SkcW8aDMWmcVOuDJ6tK/SZcrqJpvYIFtzvj1zceObJ+GGEKxFgHFFV0RyYk8j2pt+fr21FoNf7wFchCC6FD8/J5R4A8bcXJfo9SWmgx64cJmkjuRjVEClNdl7AyvsvIS03nBz2WKQDFXgBCG2Pdv86CUf1XxG5j0jb4ydiJVII9e5S5GRS9ZoCl81oKXskHqRxXArBnlzD6NsfAXZaQ13J1AYhQQRGsOMaadBt2ucpDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oUbbvSH2; dkim-atps=neutral; spf=pass (client-ip=209.85.160.174; helo=mail-qt1-f174.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oUbbvSH2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=209.85.160.174; helo=mail-qt1-f174.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqdgG0ZHrz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 03:51:05 +1100 (AEDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ee13dc0c52so57665741cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 08:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768236603; x=1768841403; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eAxh70JY3ShLNfnDxBWsRZWpalCHcaRfsM5YzKZ+W9w=;
        b=oUbbvSH22yT/KzaHisExzQKYqUUDiYB/IIZcP9MmxPEypfWIE+1vvLS3EKWLvEec6w
         l84Hgy99OZeuEqnPSIqBhpj/+8SVO01KK+cq/eIjkVMwR15qVQ9RPDIVHgxS9YcCwGwH
         p3KYAoJmcRBOh13BbOeNXOwOJt5M+R/OtL+HOLP2shoF4mUJftmWZzG9C/slIVbxgRMS
         V+xGWk4Y9A1JFFPJWgD8OqaMKlKfLe+LpgmRHPN8qanSOwMbLtDyriERPjHIDm/B33cF
         3A3edsHg0TF0YO9k86nuZmFNFjUO9dNKRsQtGHE5Y6AemZtUx0zVWCkClspqsCYSKTY3
         gsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768236603; x=1768841403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAxh70JY3ShLNfnDxBWsRZWpalCHcaRfsM5YzKZ+W9w=;
        b=qVmNFaYOwTqDkdCelS30E7m0TlveXicDYLmCy3sehu30nxV/H7sY7UAxuSkbTkyqLq
         nooGLd/zOJyzqdsViA/LVs6xQqJ6XEHwSMX6NaDgDLR8Vezh3Qxpvc8J5BvTgnUGxnKs
         wvyfyaSVDkOH00rL09a8F8ZDLoin4koj/v4ARJPQXVHMwohExsUH+iqBK5AthsxN6afL
         o9+TyYJDzrkASm33zi0zK+5bPUWSs0v1y+xWPscY6oRVqZCPTkqaG3oZLU8AtenmHE5i
         PBIsG9dK7bu0SLioT7JmXN+vUATUseP42DeaYbtQZwGlstZRGc7OATkxn7okmkBfQP69
         cKeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGebbfqCenUkgqrBlPeEVrDAQrT/O/Fcel8k1UEpGdodlj8cUqgwoIcnODV1kptnq/rbGgez4PnB1/bcs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBGQu6J8kQJQHKeJUCen+jiONgQk8RFm/SJOu4337s1x1dQvO+
	VKPpTvX1BNazMCh4P/eBbB4MRwNcBuJegd7mZOmC8JAebuSFD+IMt6LkZ460GZB8Xs4=
X-Gm-Gg: AY/fxX6PGf0aZ080wyO8iS281Rn/ak+x0A87qwMB/WsO8Ck7GUuDfN+tOP/wgqzE5WX
	arXNRNz90fOdYcEA+mFSCFkP4l06gz5jTbn4UukzOKcQK6pXudSrR8XwuvzEu3zS4pN0L1qHUZt
	vxGxvox/xvy315PDRcaXOmPS+II8xBwJR6LfrSKBSIOiHSkWOoXWAkDluAtfzRTs/5Pe3ynwQm4
	M+oEOxm0zUVVZRDfoGEozOozL6d9l8WVGBeyQj08GWFcB/RTtQDOMGEpID1VXqL06gR2TGk8qX8
	p1f/KaTT9d5yh58mM0KmSYIqBwjgxalpBDfHcROmxNGg84sJfVo7W1U2fWoLpr5sIgAYX7lZ+9W
	WCai4YoBnqsPXn27eQCPSh7S388XjwB3QxMVrR55igXMOY69sYKA9yDojrCC1zzeiu4ps4EKVle
	bG1yt7YRts4uA4Qqs1JmmLtBqb+dbFGVU4Vv62hKekfT46yhKjjqtJfmbr6/xTwNc5v5o=
X-Google-Smtp-Source: AGHT+IE/A98Uf8f6ySXPvh9xamBlLANpUoYS4iXttzp8YDJn905I/7mcjcPxPkNVMXbRPnmf8UaJPg==
X-Received: by 2002:ac8:6f1a:0:b0:4ee:208a:fbec with SMTP id d75a77b69052e-4ffb4a1ed32mr255276771cf.66.1768236602551;
        Mon, 12 Jan 2026 08:50:02 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077253218sm139285396d6.43.2026.01.12.08.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 08:50:02 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfL7B-00000003RcK-2R9k;
	Mon, 12 Jan 2026 12:50:01 -0400
Date: Mon, 12 Jan 2026 12:50:01 -0400
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
Message-ID: <20260112165001.GG745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
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
In-Reply-To: <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 12, 2026 at 11:31:04AM -0500, Zi Yan wrote:
> > folio_free()
> >
> > 1) Allocator finds free memory
> > 2) zone_device_page_init() allocates the memory and makes refcount=1
> > 3) __folio_put() knows the recount 0.
> > 4) free_zone_device_folio() calls folio_free(), but it doesn't
> >    actually need to undo prep_compound_page() because *NOTHING* can
> >    use the page pointer at this point.
> > 5) Driver puts the memory back into the allocator and now #1 can
> >    happen. It knows how much memory to put back because folio->order
> >    is valid from #2
> > 6) #1 happens again, then #2 happens again and the folio is in the
> >    right state for use. The successor #2 fully undoes the work of the
> >    predecessor #2.
> 
> But how can a successor #2 undo the work if the second #1 only allocates
> half of the original folio? For example, an order-9 at PFN 0 is
> allocated and freed, then an order-8 at PFN 0 is allocated and another
> order-8 at PFN 256 is allocated. How can two #2s undo the same order-9
> without corrupting each other’s data?

What do you mean? The fundamental rule is you can't read the folio or
the order outside folio_free once it's refcount reaches 0.

So the successor #2 will write updated heads and order to the order 8
pages at PFN 0 and the ones starting at PFN 256 will remain with
garbage.

This is OK because nothing is allowed to read them as their refcount
is 0.

If later PFN256 is allocated then it will get updated head and order
at the same time it's refcount becomes 1.

There is corruption and they don't corrupt each other's data.

> > If the allocator is using the struct page memory then step #5 should
> > also clean up the struct page with the allocator data before returning
> > it to the allocator.
> 
> Do you mean ->folio_free() callback should undo prep_compound_page()
> instead?

I wouldn't say undo, I was very careful to say it needs to get the
struct page memory into a state that the allocator algorithm expects,
whatever that means.

Jason

