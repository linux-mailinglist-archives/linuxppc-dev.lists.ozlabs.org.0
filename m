Return-Path: <linuxppc-dev+bounces-15601-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE167D15E4E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 00:55:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqq4l3PLjz2yFw;
	Tue, 13 Jan 2026 10:55:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768262119;
	cv=none; b=DJEszjCc3csDAty2uxinci/NJ46VFemuiTgTYzHO1FPzA9UIuLoPgK/J3TwjN/WDIKhywqkxLkKlEiQ5rYy73vRR/O1DfLPiXfpvzTX4cE5jbP9O81yWD28SYqWe5FYm5bu5WfLFaeN5BZz/N4Frmr0TKhXcRxwBLQCqVnQg5IjRoOnV1JdVrvPNFHvg9IcQIUbywAxSt+pReAoQ/t8TmbxywC83b9rISXW+yOV/FoLyb8X9OwPuJ57kWpq05P/LT5S6l6fvK8PQ6YAzXj7Aww0Wz5DHfa4MvGSFAvteWvj4GIxvwB3GU0SF9H/zErHpOQLpBm7wH32xeRiF9zFAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768262119; c=relaxed/relaxed;
	bh=vbQpTPqvkNza84fX2uyalXQvb9OzER6/e1aJC0fiWDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3o6oMd7tbM4rtiDwgpQDCuWPUGixQI3Bg84ILf6GZGPE98CvQkLpeoKRtS5s80ErN+rmEgcX6T4GOVrc9309gXDnY9HkpHXMFurdpF+dbcGmglVo7wWEcIS3Bm6mVFV+UUTuDesadaoPqGaW0iqzT9uw5KggsX9GQy6XxsFObQBlTOXEIb1bnuk2IY4RHwNiL0V/TtYCtzB50pMxyvUIkRdp/NiH8ABRnaS7qwjl1yCq+OWoE5vOQyJThMl05unnMe9x5CdyemZrp++ulGpJMKQDGtuWujre5dWDA34k6tjb/JSaO4wjIph3/3Gcj1lDxD0ip2s19qvlofLagyIfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YBqo9QpB; dkim-atps=neutral; spf=pass (client-ip=209.85.160.180; helo=mail-qt1-f180.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YBqo9QpB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=209.85.160.180; helo=mail-qt1-f180.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqq4k4L6zz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 10:55:18 +1100 (AEDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ee13dc0c52so60433391cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 15:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768262056; x=1768866856; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vbQpTPqvkNza84fX2uyalXQvb9OzER6/e1aJC0fiWDY=;
        b=YBqo9QpBYsftOPgJZVZrrcdxrgjFA8N5CJeDtLT6ruQPp6PYd/N99e9+WFqBsGdAYT
         Hjjgpv5mBsb99aNxTP5zkSXOrYmBfa2RzobWkz66ZZ8w6aNnm7rQN3gPR3ExqQLdNuj+
         6PWkZOxpW1mlxu5C8kPeruEscvi/sgkk+dXkJiaojaI2dgDG17r70tOVz6J15dmJCabT
         ScMCCMVRON1PAy0jefjOlM9Gzh4HLvc8lI4tph0+pt6bX/+tTtqLILJW8TMKO4VBDm7Q
         /WPh7SSCoHiEejHEoQsMZYiOaMeINNB12B4bx6D3xqg0yqGaizz15oroV2Crn2DgSzRC
         2AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768262056; x=1768866856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbQpTPqvkNza84fX2uyalXQvb9OzER6/e1aJC0fiWDY=;
        b=NuasFFUGUhsakOcJXGj2a0uJS9iGm5KwhRfNyVxQYmuUbAJvgYQDna/wI9h80VeSqj
         LjL/b8219pBQS8q1Zw6ZsSDDEphOsuN7wxqzyQ7Ne/ir9NZmekfzG9kpbHaY104wSj1p
         avPZoTz+y9seZ+YUhM8GLGzP7S6R6nrT1qli5L1SLAJBiPdeSSdhloYtwk8j5l3GFGle
         E/U+f6+y2jxJt7Z6OsMBolu/5bVbdowv3CE9Kl9geaMc9LbL5/a9DPoDmaQYBHNDUDYX
         sizhpq6K+YzS9qCeWSF673FlR+9RO66M+rWzPB+w4m5iO7YcgMBnuYy8q7xmexsAYR9f
         5tkA==
X-Forwarded-Encrypted: i=1; AJvYcCUx7QBzIAJqdZ9QopOPletAzAj352T5YfCJFEVDjZCXsGjxu0w8sdEQhFYWnivA9OolDDjPX/pos1DZNxU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzp4yTDx1xEca1F5cXcD5h/ekldzI8RErIa7CkPuE5ov/8lcUlE
	T+axhrPwf32dZDXFlUTLHXqscLLW+nlrNDvcE6PziYnsbXvJ6rW8dFTYe7g5FI0GA2U=
X-Gm-Gg: AY/fxX4mzxC09aQKHa7jvNs+Svdre2hFYNiJIk0viWSWSPAwweFrDbe+NdKwWaqPsnh
	tPnKvg/pvVm5nvz7sBVZ7x8k79pawlt20X+Q63DXmxGNgXd3nMVMpiX18w6bQAiAr54KHLWkRVe
	9DIN9KiskmF2ZVvt4SbDgkUGt9mvaaXC1W+AYcTgH96pXELslnkTrxSYIPWreJHc3bkELwrGO9e
	UI1LZcZbi49mTfG9rVzZUgB1j/6WQCDtl/Eusaw1ChdDOfHH0DT8i74dxT3zkpWzSuIQGJklFZn
	YLNHckp6D0q8jkFNN+0ehKsieh4CEOaFv3ylwnhFbEMV3ln+EKyIiYpp/7BlxH4M2ASsCoy5/v4
	2nqEMdWmNVxM7Jz4umux/6210hGm7O3ACXnN23Mo1e9cam/1OiPO5wM6oX+1LM0AdoxjXUpDxSN
	Vot0H3xYK4Su0rQXrsT0Z5dzdVAva7jpl4PjAvxCZWHznqAFsnpcsdkfU42gpOU7T/iME=
X-Google-Smtp-Source: AGHT+IFqShnh4nFq4FI+txOqV94h9FNeJmPa4/JUWRJXzRBu2Yp6JXhvTMJ52+U7dVhw4CMApET5TA==
X-Received: by 2002:a05:622a:8d1b:b0:501:3b8c:7d63 with SMTP id d75a77b69052e-5013b8c8686mr4698571cf.26.1768262055766;
        Mon, 12 Jan 2026 15:54:15 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e35dbfsm129011631cf.19.2026.01.12.15.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 15:54:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfRji-00000003fUm-0uFg;
	Mon, 12 Jan 2026 19:54:14 -0400
Date: Mon, 12 Jan 2026 19:54:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Wilcox <willy@infradead.org>,
	Balbir Singh <balbirs@nvidia.com>,
	Francois Dugast <francois.dugast@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
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
	Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-pci@vger.kernel.org, linux-mm@kvack.org,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <20260112235414.GO745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <aWVsUu1RBKgn0VFH@lstrano-desk.jf.intel.com>
 <45A4E73B-F6C2-44B7-8C81-13E24ED12127@nvidia.com>
 <aWWCK0C23CUl9zEq@lstrano-desk.jf.intel.com>
 <fzpd6caij2l73jkdvvmlk4jxlrdbt5ozu4yladpsbdc4c4jvag@d72h42nfolgh>
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
In-Reply-To: <fzpd6caij2l73jkdvvmlk4jxlrdbt5ozu4yladpsbdc4c4jvag@d72h42nfolgh>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 10:44:27AM +1100, Alistair Popple wrote:

> Also drivers may have different strategies than just resetting everything back
> to small pages. For example the may choose to only ever allocate large folios
> making the whole clearing/resetting of folio fields superfluous.

+1

Jason

