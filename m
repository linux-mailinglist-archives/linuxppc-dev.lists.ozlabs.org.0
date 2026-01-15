Return-Path: <linuxppc-dev+bounces-15758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E042BD223BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 04:02:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds77D1qpcz2xrC;
	Thu, 15 Jan 2026 14:02:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768446120;
	cv=none; b=d/tQ3DJvMeY8LBihT6mufBZcdnneQulvXQ+VKAALnnxbEvE0whDxd5041jTRIUjtAtuWqR9wRuAgSwJ8G0F5CCd78fVql/Mkbnpn8ICtF0Ok9ee1rN0ETRGfn19+5mrdGH7SYAXfQ3KMYnVU3n2UWHMbnhyKP+myRGPLw39pXh6U10nAIrLoAxFUcv3p/o28I7k57SpCnzjA+Kh5T5F+tGp9PvVRXv/lu5NNZQqc3cfTprBcVw6g/kl3rMOyrWcDRU8CbbXgsDQrLiXBlpIza4E3p2/a9yY6BvkfkLAvN8Qn2ul1NMSu5fmgf78+vFiCySin8NTfJ4X3gSLVKBuz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768446120; c=relaxed/relaxed;
	bh=5zQLK1Kx4KSHBdB8iyadgaDb9pVP4BI/1Am6eQhl6y0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CP1VxL089HAYH2hclQsvWqnwgrV0yKG5JVtMg6R3D4ptUt0CIiihgYcgW6Y6qDPHY7Z8Bzq2be2uSwqdMX2BLIV/hX+kjRxiociprHDt6X4j6clPuVh+83IxK1q5/bkuUbGXhf7CuMns8sJykkRxFSyCHuFMrhyt8PV7Onr6NjSg/6mpQ44CitaQh1x6xeA2uOVStbC8ALJjcqxhgvTeGkpeVxq+0pxOgZF3sty/hBHdEGB8MZ1z4Qx7bDiMGLMyEvXXe8ak4gIBMAgPAoDCKTvFm1JZD26s44ZJ44uTfzzzwnpM0+J1OB/h7nqfeMTMDGzDpWfh2ZLtTwvIEB2l2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=omuyeZrw; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=omuyeZrw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds77C2ZKXz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 14:01:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51D4660140;
	Thu, 15 Jan 2026 03:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A77C4CEF7;
	Thu, 15 Jan 2026 03:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768446116;
	bh=t62plHsTL0NzPFD3kffjbbJXeKPsO+HXKRB8ZhdlO8k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=omuyeZrwDujiPdNf06U42mHqbJE+T8krxLxsXa0Dh7kwj5wgnsDsccsWbhd7wdXP4
	 UC66ZVu6CpbnfNPYvmLzhn5wXv+rRL9cYqbyE5VJMvghF+HKu7COLRojjM/kTPkbVc
	 +6YenfbpT4eR4UVzrm/t6nRiEN5v/+/MXNu4aqwo=
Date: Wed, 14 Jan 2026 19:01:54 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Matthew
 Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas
 Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Balbir Singh
 <balbirs@nvidia.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-Id: <20260114190154.c05e460ebf4054828430633f@linux-foundation.org>
In-Reply-To: <20260114192111.1267147-2-francois.dugast@intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
	<20260114192111.1267147-2-francois.dugast@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 14 Jan 2026 20:19:52 +0100 Francois Dugast <francois.dugast@intel.com> wrote:

> From: Matthew Brost <matthew.brost@intel.com>
> 
> Reinitialize metadata for large zone device private folios in
> zone_device_page_init prior to creating a higher-order zone device
> private folio. This step is necessary when the folio’s order changes
> dynamically between zone_device_page_init calls to avoid building a
> corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> must be passed in from the caller because the pgmap stored in the folio
> page may have been overwritten with a compound head.
> 
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  					struct drm_pagemap_zdd *zdd)
>  {
>  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> -	zone_device_page_init(page, 0);
> +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
>  }

drivers/gpu/drm/drm_pagemap.c:200:40: error: 'struct drm_pagemap_zdd' has no member named 'dpagemap'

I guess this was accidentally fixed in a later patch?

Please let's decide whether to fast-track the [1/N] fix into mainline
and if so, prepare something which compiles!

