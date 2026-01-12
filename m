Return-Path: <linuxppc-dev+bounces-15551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31572D14C20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 19:26:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqgmt58S6z2xKh;
	Tue, 13 Jan 2026 05:26:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768242366;
	cv=none; b=Y1kiM2fjYYIPdsejpBV45dRBM77MHGBQ3mj2Nk4RmEMVFzZgz1wt7yW+BR7qvAfcXyoOehqE/kzB0k2fpApR6pQLYs7IskY9whpAnMbdMBHoDMJxiXeGvjM/F5XU0/BJsa/zS8ytzPxP9KL/7MhnESn08mHK4CJ/6meGoSNVLzz0F3QJa9t4M4cT0DHAdjXNqOQLRZCXY2AoW2eQpI5rKfJtdQMrPkCSH8R5YKlf3zsbF0fH3wfeaTBE4F1221yw0UcpuZu2edXdtCTRXJ9Q6eReOWWnwe1yzu0jBrSICgGq82Gbh7PhejWLEhZVpEVQkFCGhSri7Vl71dLJcURi/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768242366; c=relaxed/relaxed;
	bh=jdD8MqriJAO2uyiGLSo7KkiIHx3VWLqLd6aNoF+yCm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPhhk1dutvUqSNmHAvjf425zoAX+6kLkxM29jHiuPiKoyBJ7oEJ+nzoeRHLG7+qVPhSxMbLzy2upE2xxlUbhBBTjfUDFlupiPkWZzwr+sQxoVH152zvnl+/h+uX9/PH6Q22mm3tOKOBUKN5/lB3w8JXwbhNx1bCREn1t1ti3p0x3jqiTQeFMT12BW1Ea9mzAHA0wtM0xMeqx99FffwHu0AOPMwVEtdjdlpJfNlPphq1hmPlGFhyGPMVEw8Uxvz+vnpgxoml7m8ESqB2arkuj27caVwK1HrDszbg0vrPnCqLy7ym45rdR1B0GNZ+UCjZiTfgKy0h6VAZpyYj58PE1mA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NsVw10Yz; dkim-atps=neutral; spf=pass (client-ip=209.85.219.44; helo=mail-qv1-f44.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NsVw10Yz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=209.85.219.44; helo=mail-qv1-f44.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqgmr3WD2z2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 05:26:03 +1100 (AEDT)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a2ad13c24so64722626d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 10:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768242301; x=1768847101; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jdD8MqriJAO2uyiGLSo7KkiIHx3VWLqLd6aNoF+yCm8=;
        b=NsVw10Yz2iPwPCHyUxhAdF4qhbz055yJy2MWUNyWYKdnFwrA7jyTWdteuNpJWFs+Jr
         f3VbeOaEvXEmEmjk9wtkaE03Jo/hDQ92Qi181KBmHMFpvLYkzefuPH6Rl6YyurbXF35C
         vUqKkXUXtAoCJgFrhMKbBx9J1Tch5NH74qQtiQZLGH4YHoMwaa+h3Fq/Pr3dEQUmU+8L
         RZuEy9g/N6ritqAgiRyIDTRkIjLxkyComNP9Th5vwyejlzSMN/sZMX0536zWZuKV3/NU
         bVf6/H78QOSMkg9Wnv71l6dzxcalyL3dxI5tWvN6yiwHbihzZmlQAjJuc83B0WmVAhZ7
         w9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768242301; x=1768847101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdD8MqriJAO2uyiGLSo7KkiIHx3VWLqLd6aNoF+yCm8=;
        b=mqGkwOCAXVE9IwnPJ1c8WFq/PSZAWNu8H0iHyStQC48dfW6npAptsRvRK2im7KSqj3
         o0tpkIWwjxV17LPVKwZe16lfAm3JqFdX0r86u0aYOkQmQMUfauiXG2S+pyRSMJpUsWob
         QO/9TwdnrwBCuOTcnd6tDhhwu402jx9Eb7y3dSS9eChcjiDP3hjc3UZ1ON0Ow5hGGXrY
         oWPuI5ZUMHy9zYpd+r3+H1qOwO8/bHAGiSIhq9KQmeQKmc6VT+y7Ufg06kJ/6L2PjXyW
         p2Q8oDjsfGtHJm+cFYoAJSb1SkFIjUYrfsBGL4SXu4ETWWK4WfBhsH576c+K1AmrerBH
         gUHw==
X-Forwarded-Encrypted: i=1; AJvYcCWK+u6N6gVl3p4pBunAjHdB25uRzwB6SG+mFbfsUTsmunbwlvNVdyfXNissDuRexZruT4D/NxlwazQEmL4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZvzQDW6iSvZES3NmA1sMiRoW5W4ygC3/e4UsLjSeOYM5F9j44
	UgAKunK56xmJgi8PzvEQ6Q1zVU3f2RLiD1bEbZPMc5i7bqPQ40gjcBg9pQC82um4GSM=
X-Gm-Gg: AY/fxX6Xn+gCtIpnjUXlK4KCgpIt7KIjdruZdeECQ9mVaVoqda1QpbPJ8wpPptfwVTv
	OpUF/c6vCM1OduvXSh6+gsO20jEVHqxdSXcylPSIgvQfOnH1S3DH45xM+kV59SBDUGhFAG1HQt0
	61exuR4KoJiJ1H4P9Q3StVu/tL2uLNluc5cj2NlJBsGiGoDtxO6ytLhmQBrzb5A1r3bgA/1Dumg
	Oah/RvGNZPjH/kKFB4/77d/GkDqJgXhSgZoY8bvXcfLq6jhaJqtFDITXBwS8qWxlWHJE4qWkKi0
	PTU28P59Y7iwu+c5mlN8ekWPVRm1kq9ozXNzIaHOXlaHEVduT7yAZAxBVNFwm6mV6qGUQq9YIUC
	R9zycLURrimgJuKwX6HqG56IfLd2S+cg2f+fuT6zugYzmpAbT98AhQeEqjCsLWq9q+u0nvyzlBc
	WApyBjLfN2op99XN17A51d5xpsz9mwfWSEJp+lLIQrbHwFja7K0brZmoLjHlV5EU+WyJ4=
X-Google-Smtp-Source: AGHT+IGn2SBiEVfPnYP4nrga1XlmOOc9x/h3J7lqU+usVoOUoaNofJJs2v26tTONjDwmwZ1AsmIeFg==
X-Received: by 2002:a05:6214:428e:b0:88e:9f73:2c08 with SMTP id 6a1803df08f44-89084179da3mr258471116d6.5.1768242300986;
        Mon, 12 Jan 2026 10:25:00 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce985sm138366276d6.11.2026.01.12.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:25:00 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfMb6-00000003SfZ-05E0;
	Mon, 12 Jan 2026 14:25:00 -0400
Date: Mon, 12 Jan 2026 14:25:00 -0400
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
Message-ID: <20260112182500.GI745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
 <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
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
In-Reply-To: <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 12, 2026 at 12:46:57PM -0500, Zi Yan wrote:
> On 12 Jan 2026, at 11:50, Jason Gunthorpe wrote:
> 
> > On Mon, Jan 12, 2026 at 11:31:04AM -0500, Zi Yan wrote:
> >>> folio_free()
> >>>
> >>> 1) Allocator finds free memory
> >>> 2) zone_device_page_init() allocates the memory and makes refcount=1
> >>> 3) __folio_put() knows the recount 0.
> >>> 4) free_zone_device_folio() calls folio_free(), but it doesn't
> >>>    actually need to undo prep_compound_page() because *NOTHING* can
> >>>    use the page pointer at this point.
> >>> 5) Driver puts the memory back into the allocator and now #1 can
> >>>    happen. It knows how much memory to put back because folio->order
> >>>    is valid from #2
> >>> 6) #1 happens again, then #2 happens again and the folio is in the
> >>>    right state for use. The successor #2 fully undoes the work of the
> >>>    predecessor #2.
> >>
> >> But how can a successor #2 undo the work if the second #1 only allocates
> >> half of the original folio? For example, an order-9 at PFN 0 is
> >> allocated and freed, then an order-8 at PFN 0 is allocated and another
> >> order-8 at PFN 256 is allocated. How can two #2s undo the same order-9
> >> without corrupting each other’s data?
> >
> > What do you mean? The fundamental rule is you can't read the folio or
> > the order outside folio_free once it's refcount reaches 0.
> 
> There is no such a rule. In core MM, folio_split(), which splits a high
> order folio to low order ones, freezes the folio (turning refcount to 0)
> and manipulates the folio order and all tail pages compound_head to
> restructure the folio.

That's different, I am talking about reaching 0 because it has been
freed, meaning there are no external pointers to it.

Further, when a page is frozen page_ref_freeze() takes in the number
of references the caller has ownership over and it doesn't succeed if
there are stray references elsewhere.

This is very important because the entire operating model of split
only works if it has exclusive locks over all the valid pointers into
that page.

Spurious refcount failures concurrent with split cannot be allowed.

I don't see how pointing at __folio_freeze_and_split_unmapped() can
justify this series.

> Your fundamental rule breaks this.  Allowing compound information
> to stay after a folio is freed means you cannot tell whether a folio
> is under split or freed.

You can't refcount a folio out of nothing. It has to come from a
memory location that already is holding a refcount, and then you can
incr it.

For example lockless GUP fast will read the PTE, adjust to the head
page, attempt to incr it, then recheck the PTE.

If there are races then sure maybe the PTE will point to a stray tail
page that refers to an already allocated head page, but the re-check
of the PTE wille exclude this. The refcount system already has to
tolerate spurious refcount incrs because of GUP fast.

Nothing should be looking at order and refcount to try to guess if
concurrent split is happening!!

Jason

