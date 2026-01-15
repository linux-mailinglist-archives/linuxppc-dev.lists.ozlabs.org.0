Return-Path: <linuxppc-dev+bounces-15755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A280D22298
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 03:40:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds6fn5z2bz2xrC;
	Thu, 15 Jan 2026 13:40:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768444849;
	cv=none; b=Iu9tYcq/3zQa0/fT3jivYbIBD92z+UdWEviM/E+AaUSJmD98s4idjr2PMvO0+ijMKXdgGY+EBVgp+06XxEWZ2Y42X5+LBErQsD2BrCiSkEnpPNukis4vcdCOug+TYQWLUyBszn+D8R0tMObfreeZlM4ZohYtzABwTm+rykHT1/LHtno/qQ5BQOzA+bZbetgSB8APkUbVIL56K/D+pQgNMflRnviqOb2XfVshDFeeiYvUrnAxsN7XxdDjaVF0o6zPxKfsPeNNQEQjr7qvUSfSRVHpA+I8wtrOQFDluLziBheYHSCC2qpXDE+AMbFkDcecC5wkXc0Ll9GGvew1C8MaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768444849; c=relaxed/relaxed;
	bh=wPg1Rmvkx3e8pTULbrjUB1f5F5lTCXFNy35V+rVVRpY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BfT0g0lBNEH2stUmJeYAFdg8+lgNSRh3aGOsEebtwhqPZTtHj1dS4rgTgn47D4xpFwytKXtftvw1QWgt7b94hsAW+OXRrA9GLfy6n2FKXQQ1GZdxTJcZCBDJqs5twV0Da9Vmux3pM8UqId36hRt339MPfrfBpPakfg2+jkgrQ2EdcQqEDoMMMnvVsJjzzDumnUkdIPbXuuW3jT7WygtrrFhFG0aYF4YuPweAHlktk/zzNNGG0zOj0hvDe1doWErPxK4U66aOlPMgvBipZDE9ZJOy1muqNF6pa+T1ixEXUaVRDw5o6BVT8fYy5oYs4JLr3otiM8xOAZAUNg4ER1SOMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Vfb3gBTf; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Vfb3gBTf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 17537 seconds by postgrey-1.37 at boromir; Thu, 15 Jan 2026 13:40:48 AEDT
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds6fm10NSz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 13:40:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1036C60144;
	Thu, 15 Jan 2026 02:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4C2C4CEF7;
	Thu, 15 Jan 2026 02:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768444844;
	bh=kEIihbTO7hsA7HfHf64JRGq8WxboK1l9W0XcXEHbfeo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Vfb3gBTf+rsrpPAPcJ/Dig6SSOOLelLK4b09yec6FTVrBjTNJT3KBH/W/IuyCOUUG
	 rWCMabju6IaOer0i0XS9FstGNEW6IG96OZlxk9eDNmuYljuhHuOo2Q6G5GIosWUK/o
	 TtHClSrBGTI6P5GEFzOrr+RjoUt0V7nWJ0JUctS8=
Date: Wed, 14 Jan 2026 18:40:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Zi Yan
 <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>, adhavan Srinivasan
 <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Michael
 Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, "David Hildenbrand" <david@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, "Jason Gunthorpe" <jgg@ziepe.ca>, Leon Romanovsky
 <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, "Suren Baghdasaryan"
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, "Balbir Singh"
 <balbirs@nvidia.com>, <linuxppc-dev@lists.ozlabs.org>,
 <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-mm@kvack.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-Id: <20260114184042.64fc3df3e43e6e62870bb705@linux-foundation.org>
In-Reply-To: <aWgr9Fp+0AeTu4zL@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
	<20260114192111.1267147-2-francois.dugast@intel.com>
	<20260114134825.8bf1cb3e897c8e41c73dc8ae@linux-foundation.org>
	<aWgn/THidvOQf9n2@lstrano-desk.jf.intel.com>
	<aWgr9Fp+0AeTu4zL@lstrano-desk.jf.intel.com>
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

On Wed, 14 Jan 2026 15:51:16 -0800 Matthew Brost <matthew.brost@intel.com> wrote:

> On Wed, Jan 14, 2026 at 03:34:21PM -0800, Matthew Brost wrote:
> > On Wed, Jan 14, 2026 at 01:48:25PM -0800, Andrew Morton wrote:
> > > On Wed, 14 Jan 2026 20:19:52 +0100 Francois Dugast <francois.dugast@intel.com> wrote:
> > > 
> > > > Reinitialize metadata for large zone device private folios in
> > > > zone_device_page_init prior to creating a higher-order zone device
> > > > private folio. This step is necessary when the folio’s order changes
> > > > dynamically between zone_device_page_init calls to avoid building a
> > > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > > must be passed in from the caller because the pgmap stored in the folio
> > > > page may have been overwritten with a compound head.
> > > 
> > > Thanks.  What are the worst-case userspace-visible effects of the bug?
> > 
> > If you reallocate a subset of pages from what was originally a large
> > device folio, the pgmap mapping becomes invalid because it was
> > overwritten by the compound head, and this can crash the kernel.
> > 
> > Alternatively, consider the case where the original folio had an order
> > of 9 and _nr_pages was set. If you then reallocate the folio plus one as
> 
> s/_nr_pages/the order was encoded the page flags.
> 
> ...
>
> s/best to have kernel/best to not have kernels
> 

Great, thanks.  I pasted all the above into the changelog to help
explain our reasons.  I'll retain the patch in mm-hotfixes, targeting
6.19-rcX.  The remainder of the series is DRM stuff, NotMyProblem.  I
assume that getting this into 6.19-rcX is helpful to DRM - if not, and
if taking this via the DRM tree is preferable then let's discuss.

Can reviewers please take a look at this reasonably promptly?


btw, this patch uses

+		struct folio *new_folio = (struct folio *)new_page;

Was page_folio() unsuitable?


