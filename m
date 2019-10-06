Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C82CCD966
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2019 00:07:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46md5W40k8zDqGg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2019 09:07:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=damian.tometzki@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FoOm9beX"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46mZDn2GJ3zDqMF
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2019 06:58:45 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id 4so10707827qki.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Oct 2019 12:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=APg736jg0ah1Nn8uMNYIJkW2DcUQUmQs6qDMcBNTRSY=;
 b=FoOm9beXdYeuD1c+g8rePWP5H+HcWgPE076sSAqfiTel4Q0Td54IlBGRZMjKxlUk8L
 HVRy25IZMnNbc8SWFbKQpgGlvGFGDOWhUN+AgLYL92MXWhih+qj8A2fL3VALNocwTpqP
 FQgKEQ9d+gNs/CWsBfMg2M9N1HgEO7l4VgKTRdNRP7srbptNIvK1yLiq9PQFzN97hwJD
 PQqjTJBI9iBcbCgHfkAQivSS8ZhZGWhp7euCX2oVGNcFVVabiEBZ2YQtPZM3E2PwhQNC
 l3CHuJVy6xsLzc6ZK3Xl6/ZmPZbZyzn+7BrsOpcQQthNYmztIX5TH3rU39i5J11LksM6
 OUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=APg736jg0ah1Nn8uMNYIJkW2DcUQUmQs6qDMcBNTRSY=;
 b=r1VWyw9qgiLBYkoNx2TQXHXA5RdROqIFXBcpl0GIYGhKxqJXoxVc6SdPtqhqJrSGXD
 6oON864bIUoYNVdTGDEnfkDc69vnbXsjD10GvxgnQf+XzahXIfaWi1zfpm4bW+tY6IKk
 XDLfLcmq/H8mnv41TZDnh2m2bPvN/2Vgf2bc/vIOJjfqbsR+K6VbXdfa3t3PpvJtT78x
 ZjQ7Xh1jnNOdMVTE/h4ATqcSvZT+pH8t18lhmcs8U9niMyFI+YzZHUByRw/QJPsZjMwQ
 tY2P9qqW0bkWlqR9f1H2OSzTHDBksB9JxjJQdXQuK9TxWq+6qbHk/2S/f3Ib9+0i6Qfc
 DBpg==
X-Gm-Message-State: APjAAAW1SOYHaEQeETmde/iP5neclTjKrgeYRqa6dSiOMDxKQUIa/yfa
 c9RUYwQQ+HcRATV4QcJTTyE=
X-Google-Smtp-Source: APXvYqwd63qnLz5/ty0+jRrhUrnVAvecut6TehXBQWTOiWh9hSCC+3s41ChbAphbo9+h6ZSP8hjXUA==
X-Received: by 2002:a37:4e84:: with SMTP id
 c126mr19418006qkb.334.1570391921654; 
 Sun, 06 Oct 2019 12:58:41 -0700 (PDT)
Received: from freebsd.route53-aws-cloud.de
 (ec2-3-95-91-234.compute-1.amazonaws.com. [3.95.91.234])
 by smtp.gmail.com with ESMTPSA id k2sm6645230qti.24.2019.10.06.12.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 12:58:41 -0700 (PDT)
Date: Sun, 6 Oct 2019 21:58:39 +0200
From: Damian Tometzki <damian.tometzki@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 01/10] mm/memunmap: Don't access uninitialized memmap
 in memunmap_pages()
Message-ID: <20191006195838.GA27160@freebsd.route53-aws-cloud.de>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, x86@kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Logan Gunthorpe <logang@deltatee.com>,
 Ira Weiny <ira.weiny@intel.com>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191006085646.5768-2-david@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 07 Oct 2019 09:06:10 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, linux-sh@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello David,

patch 05/10 is missing in the patch series. 


On Sun, 06. Oct 10:56, David Hildenbrand wrote:
> From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> 
> With an altmap, the memmap falling into the reserved altmap space are
> not initialized and, therefore, contain a garbage NID and a garbage
> zone. Make sure to read the NID/zone from a memmap that was initialzed.
> 
> This fixes a kernel crash that is observed when destroying a namespace:
> 
> [   81.356173] kernel BUG at include/linux/mm.h:1107!
> cpu 0x1: Vector: 700 (Program Check) at [c000000274087890]
>     pc: c0000000004b9728: memunmap_pages+0x238/0x340
>     lr: c0000000004b9724: memunmap_pages+0x234/0x340
> ...
>     pid   = 3669, comm = ndctl
> kernel BUG at include/linux/mm.h:1107!
> [c000000274087ba0] c0000000009e3500 devm_action_release+0x30/0x50
> [c000000274087bc0] c0000000009e4758 release_nodes+0x268/0x2d0
> [c000000274087c30] c0000000009dd144 device_release_driver_internal+0x174/0x240
> [c000000274087c70] c0000000009d9dfc unbind_store+0x13c/0x190
> [c000000274087cb0] c0000000009d8a24 drv_attr_store+0x44/0x60
> [c000000274087cd0] c0000000005a7470 sysfs_kf_write+0x70/0xa0
> [c000000274087d10] c0000000005a5cac kernfs_fop_write+0x1ac/0x290
> [c000000274087d60] c0000000004be45c __vfs_write+0x3c/0x70
> [c000000274087d80] c0000000004c26e4 vfs_write+0xe4/0x200
> [c000000274087dd0] c0000000004c2a6c ksys_write+0x7c/0x140
> [c000000274087e20] c00000000000bbd0 system_call+0x5c/0x68
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Logan Gunthorpe <logang@deltatee.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> [ minimze code changes, rephrase description ]
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memremap.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 557e53c6fb46..8c2fb44c3b4d 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -123,6 +123,7 @@ static void dev_pagemap_cleanup(struct dev_pagemap *pgmap)
>  void memunmap_pages(struct dev_pagemap *pgmap)
>  {
>  	struct resource *res = &pgmap->res;
> +	struct page *first_page;
>  	unsigned long pfn;
>  	int nid;
>  
> @@ -131,14 +132,16 @@ void memunmap_pages(struct dev_pagemap *pgmap)
>  		put_page(pfn_to_page(pfn));
>  	dev_pagemap_cleanup(pgmap);
>  
> +	/* make sure to access a memmap that was actually initialized */
> +	first_page = pfn_to_page(pfn_first(pgmap));
> +
>  	/* pages are dead and unused, undo the arch mapping */
> -	nid = page_to_nid(pfn_to_page(PHYS_PFN(res->start)));
> +	nid = page_to_nid(first_page);

Why we need 'nid = page_to_nid(first_page)' we didnt use it anymore in this function ?

>  
>  	mem_hotplug_begin();
>  	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
> -		pfn = PHYS_PFN(res->start);
> -		__remove_pages(page_zone(pfn_to_page(pfn)), pfn,
> -				 PHYS_PFN(resource_size(res)), NULL);
> +		__remove_pages(page_zone(first_page), PHYS_PFN(res->start),
> +			       PHYS_PFN(resource_size(res)), NULL);
>  	} else {
>  		arch_remove_memory(nid, res->start, resource_size(res),
>  				pgmap_altmap(pgmap));
> -- 
> 2.21.0
>
Best regards
Damian
 
