Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E29124C76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 17:06:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dKcm7266zDqjv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 03:06:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="z5wPjhUP"; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dKZc13FszDqgn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 03:04:23 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id j6so2750187lja.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 08:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=lx2tYrxH76TzOflvrZdMYwmw6kPdiwBO2AoS02kSF8I=;
 b=z5wPjhUP09OUtbjMjcfRXuIHIwQ6JsCqdqDQrpkHeR2FGTJKRgTZuRVpd8Ejot/uzW
 WkIRJ1o23H1rHR8qrWtCj6uBitDImUrGPYpJ5mMWyp3EmJAhL7rYh6HpljzRDkNNAPx0
 LUjYdc/PK8ZbQZUps8imW7pyun+gW90XpZ53fBcBIDiOV27gBLz+BEehaTKZC5uM8Oqa
 ydjJOsIeBdrZtGFXR3Ff0Wal0p2P05zNibodcJL9uNUAN8pxDWcLGNcXSYNkE83Lm4vk
 MRxOsdbgin+Oe/MgK9nfd0EbUF6BgvQFFgBekQTNtwPB0Nh3TqyAfgcwxiXCuXBEgxgt
 8yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lx2tYrxH76TzOflvrZdMYwmw6kPdiwBO2AoS02kSF8I=;
 b=QzbEuxZgyfBfRDDFhaiu6pq6jL642m8tbI6ORIGPAhF3ea0pZl6MAg+2rW8qUbniaS
 fZzI3Vo5XBLVXArnMpCJuYQ3l+1yo5sPsSd82TFDHU9cAfvHZ/CrOeGuUmUaXRTQChAB
 U9N3d56W9M8/B0/WBWtMtODMSGe/7UBkgr6OY0b0ChOKXWFkYvb+Bp/Tx4PriEODITVg
 haeht8v21ZRVnmVL9CrnnpYUcpIXDkmxzxw5W1sv16kSUao5A4VQJxQ4w2LQdL2vGVLU
 iWsuYcejNmuFdvQ9XxMXMSxWU9nxR4IP+6s9LrB3wUiaEFh/uBnuXl1okwft882hnTbb
 QjYA==
X-Gm-Message-State: APjAAAWeL65cuemCQGWzUdua/bCfKp+osofUadJI4nxZpR4NoTK34GzU
 5zf0gl3ldKBhc0L/XJsfkSmUEw==
X-Google-Smtp-Source: APXvYqwF7pecGZBZMkXKVp15IXhXZo2PGYpkUgZNZl53wUwEdzClRBwVejnpDULy6WyyjOVSSgygvA==
X-Received: by 2002:a2e:9284:: with SMTP id d4mr2361276ljh.226.1576685060830; 
 Wed, 18 Dec 2019 08:04:20 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id j19sm1730231lfb.90.2019.12.18.08.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 08:04:19 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id 5A04D1012CF; Wed, 18 Dec 2019 19:04:20 +0300 (+03)
Date: Wed, 18 Dec 2019 19:04:20 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v11 04/25] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
Message-ID: <20191218160420.gyt4c45e6zsnxqv6@box>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-5-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191216222537.491123-5-jhubbard@nvidia.com>
User-Agent: NeoMutt/20180716
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 16, 2019 at 02:25:16PM -0800, John Hubbard wrote:
> An upcoming patch changes and complicates the refcounting and
> especially the "put page" aspects of it. In order to keep
> everything clean, refactor the devmap page release routines:
> 
> * Rename put_devmap_managed_page() to page_is_devmap_managed(),
>   and limit the functionality to "read only": return a bool,
>   with no side effects.
> 
> * Add a new routine, put_devmap_managed_page(), to handle checking
>   what kind of page it is, and what kind of refcount handling it
>   requires.
> 
> * Rename __put_devmap_managed_page() to free_devmap_managed_page(),
>   and limit the functionality to unconditionally freeing a devmap
>   page.

What the reason to separate put_devmap_managed_page() from
free_devmap_managed_page() if free_devmap_managed_page() has exacly one
caller? Is it preparation for the next patches?

> This is originally based on a separate patch by Ira Weiny, which
> applied to an early version of the put_user_page() experiments.
> Since then, Jérôme Glisse suggested the refactoring described above.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Suggested-by: Jérôme Glisse <jglisse@redhat.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  include/linux/mm.h | 17 +++++++++++++----
>  mm/memremap.c      | 16 ++--------------
>  mm/swap.c          | 24 ++++++++++++++++++++++++
>  3 files changed, 39 insertions(+), 18 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c97ea3b694e6..77a4df06c8a7 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -952,9 +952,10 @@ static inline bool is_zone_device_page(const struct page *page)
>  #endif
>  
>  #ifdef CONFIG_DEV_PAGEMAP_OPS
> -void __put_devmap_managed_page(struct page *page);
> +void free_devmap_managed_page(struct page *page);
>  DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
> -static inline bool put_devmap_managed_page(struct page *page)
> +
> +static inline bool page_is_devmap_managed(struct page *page)
>  {
>  	if (!static_branch_unlikely(&devmap_managed_key))
>  		return false;
> @@ -963,7 +964,6 @@ static inline bool put_devmap_managed_page(struct page *page)
>  	switch (page->pgmap->type) {
>  	case MEMORY_DEVICE_PRIVATE:
>  	case MEMORY_DEVICE_FS_DAX:
> -		__put_devmap_managed_page(page);
>  		return true;
>  	default:
>  		break;
> @@ -971,7 +971,14 @@ static inline bool put_devmap_managed_page(struct page *page)
>  	return false;
>  }
>  
> +bool put_devmap_managed_page(struct page *page);
> +
>  #else /* CONFIG_DEV_PAGEMAP_OPS */
> +static inline bool page_is_devmap_managed(struct page *page)
> +{
> +	return false;
> +}
> +
>  static inline bool put_devmap_managed_page(struct page *page)
>  {
>  	return false;
> @@ -1028,8 +1035,10 @@ static inline void put_page(struct page *page)
>  	 * need to inform the device driver through callback. See
>  	 * include/linux/memremap.h and HMM for details.
>  	 */
> -	if (put_devmap_managed_page(page))
> +	if (page_is_devmap_managed(page)) {
> +		put_devmap_managed_page(page);

put_devmap_managed_page() has yet another page_is_devmap_managed() check
inside. It looks strange.

>  		return;
> +	}
>  
>  	if (put_page_testzero(page))
>  		__put_page(page);
> diff --git a/mm/memremap.c b/mm/memremap.c
> index e899fa876a62..2ba773859031 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -411,20 +411,8 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
>  EXPORT_SYMBOL_GPL(get_dev_pagemap);
>  
>  #ifdef CONFIG_DEV_PAGEMAP_OPS
> -void __put_devmap_managed_page(struct page *page)
> +void free_devmap_managed_page(struct page *page)
>  {
> -	int count = page_ref_dec_return(page);
> -
> -	/* still busy */
> -	if (count > 1)
> -		return;
> -
> -	/* only triggered by the dev_pagemap shutdown path */
> -	if (count == 0) {
> -		__put_page(page);
> -		return;
> -	}
> -
>  	/* notify page idle for dax */
>  	if (!is_device_private_page(page)) {
>  		wake_up_var(&page->_refcount);
> @@ -461,5 +449,5 @@ void __put_devmap_managed_page(struct page *page)
>  	page->mapping = NULL;
>  	page->pgmap->ops->page_free(page);
>  }
> -EXPORT_SYMBOL(__put_devmap_managed_page);
> +EXPORT_SYMBOL(free_devmap_managed_page);
>  #endif /* CONFIG_DEV_PAGEMAP_OPS */
> diff --git a/mm/swap.c b/mm/swap.c
> index 5341ae93861f..49f7c2eea0ba 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -1102,3 +1102,27 @@ void __init swap_setup(void)
>  	 * _really_ don't want to cluster much more
>  	 */
>  }
> +
> +#ifdef CONFIG_DEV_PAGEMAP_OPS
> +bool put_devmap_managed_page(struct page *page)
> +{
> +	bool is_devmap = page_is_devmap_managed(page);
> +
> +	if (is_devmap) {

Reversing the condition would save you an indentation level.

> +		int count = page_ref_dec_return(page);
> +
> +		/*
> +		 * devmap page refcounts are 1-based, rather than 0-based: if
> +		 * refcount is 1, then the page is free and the refcount is
> +		 * stable because nobody holds a reference on the page.
> +		 */
> +		if (count == 1)
> +			free_devmap_managed_page(page);
> +		else if (!count)
> +			__put_page(page);
> +	}
> +
> +	return is_devmap;
> +}
> +EXPORT_SYMBOL(put_devmap_managed_page);
> +#endif
> -- 
> 2.24.1
> 
> 

-- 
 Kirill A. Shutemov
