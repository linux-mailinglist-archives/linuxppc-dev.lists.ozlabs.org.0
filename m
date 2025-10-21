Return-Path: <linuxppc-dev+bounces-13131-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D5BF8CF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 22:52:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crkyT2D8Xz3bfN;
	Wed, 22 Oct 2025 07:52:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761079969;
	cv=none; b=Z+lH9ebO8a5rqWVJUrPmn+zj+y89mS9nK4WRLa+EQ28bQC7pVpu8sxsLJRsnBSUMaqcRnnHxJXFAyFCy/UXEN9gWvQ7fkTt1Pg7RDa5ZxN8u8QxLeGOlO0XpTKZZcZk02PtfAzK218/Pr6H/tTNUD+84AKxVsUl851tUu2Y5Uvt7hXr3Zh2zwBzxa2ihEk3WgeYN4I09LNB1xkAszputJGlhuhk6yC7lCv1vaVTC+8IHOZotnH7aqAKZxePZ9tnJkU5hltbiqml9RCY29wF2oKO28wmRsgXaedi7o6/EpML41g3nUuV86OP8xLrpiRBYa6tCQUYO6I0P0vDh1qRG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761079969; c=relaxed/relaxed;
	bh=70t8xOtesG4UTGBU4t4Siqy1bvWmQnoR0HwnhGPw72o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eOHZhweoBH7cUkZd5U1yxmRMFQa9JDSYtfaOGKk5FvPmuKtNgbeQbFWm15/WteZ1iTOSf9NTxTQSjp/xD0bnW8s426K3Fgmlq0wAvEZNq9doU/7CuPsRhIhJVfkcTn4VlDqXhRFm711sQdSMWgkC3C4Pu/zghWx7b0Ostej3yLxpZoXWCcaQlWZu2GMs1aoJl9qShxkJHrMVGQ6wLKov/UJUCuofrZ7M5HJfiWi8sPGhXc/TWOwwXr3vdZzhsyexsumjinXrJypZHOFdvUSuYaD1s1xJMtuUgetjp1co8hCJi9/AcQExus4pdJxv0+xQf/6R05qqLRYuJG6sP0P3QQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RAMp0XLC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RAMp0XLC; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RAMp0XLC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RAMp0XLC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crkyS37NHz3bfF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 07:52:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761079965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=70t8xOtesG4UTGBU4t4Siqy1bvWmQnoR0HwnhGPw72o=;
	b=RAMp0XLCKqrYmMwqH6eh4qHgimLGxSfvTf+F6WIZt7IsUeHsEmVoTZoPCuloPACz38VebH
	P3QGlpvlZbGBVE1QMLZN8Tv8o6NE2wmfADdxULCuqh4d3/Z0ELFMZkC97mYCiDsKx/+ArO
	FPr7kFwSIaFI9JeGTEmjITN92K5edIY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761079965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=70t8xOtesG4UTGBU4t4Siqy1bvWmQnoR0HwnhGPw72o=;
	b=RAMp0XLCKqrYmMwqH6eh4qHgimLGxSfvTf+F6WIZt7IsUeHsEmVoTZoPCuloPACz38VebH
	P3QGlpvlZbGBVE1QMLZN8Tv8o6NE2wmfADdxULCuqh4d3/Z0ELFMZkC97mYCiDsKx/+ArO
	FPr7kFwSIaFI9JeGTEmjITN92K5edIY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-aNpQkOLHPp-7WkOt0-9XXA-1; Tue, 21 Oct 2025 16:52:41 -0400
X-MC-Unique: aNpQkOLHPp-7WkOt0-9XXA-1
X-Mimecast-MFC-AGG-ID: aNpQkOLHPp-7WkOt0-9XXA_1761079960
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4710c04a403so62464145e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 13:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761079960; x=1761684760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70t8xOtesG4UTGBU4t4Siqy1bvWmQnoR0HwnhGPw72o=;
        b=qKgCa/K099qLVXhzjc50H5XPCqG2aHafOiEItS7y/1psNxc/sfYq0gwU+pGDOWjNbb
         FGql7fODn3OUobhQvOsz9djmEeVhXQVhNdGskgVOvo2zuBjJzkmhG5HJG8bKo1D4RljY
         vZSX/qNQA9yN2sZQFN9hfjWT8tjLyS5ON2vzbyZukXsWdP2HJOzYp+x/m2W+rBm4o1lO
         ogwQr6mS3RCxY884ZL9rdgJSyu2MXAaQHdskYnKywz+0LPXmTAkNY+SDbQQk+nx/OSyt
         K9XBe7hxJKnQOBVOL6riP1JrbM3MrEfE3wyWnHVrc0HdpFhIrbj6JWQKmlWgIClS+egm
         GzUA==
X-Forwarded-Encrypted: i=1; AJvYcCUljXvtCVed9+z6UK3Vbyyxn7fze64hX1HoW1hMwjvqvRZaZ1kNTJsFssv4bAi5Pdjsw1WXX9miAp7NGeM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJn9Kjv2v2h9RstkeF3u30hTbQ/GroRcbmuA8Rp9w0FaXf3x68
	Z3dN0lSV6DrhzKQaozo7yI7rRWlBGUAUHCBfy9UiPcpO+LktpKug46pqghY67HBG/odl4yjhQ6b
	wH1U2InzvmhPMLoG0UXtWLdjIofaVj2TQnI2ejDcwjhk9PumJmntDXuGqvm5y9rxpEbk=
X-Gm-Gg: ASbGncskyAWtu0lOD3xpqva3/2Jgxkqt5CHEhXqqLfNCRDFT5BmJtufD+MRUYw6wxCp
	ySo80+plarnzDtVq0YG/qHKY9lpM4un78LXdBbMQbWVN5mSdKxD7iJ5LwqQP86sOGnjqM/xlXb+
	4mFxfUTaZV3KHSXLlpfXe74MJc43EcsxRnBG9ruC5p6AR79lM0RCNwZcFr7KqOkZ8Qr3EBdaoKO
	n2/WISbVKvnm9jDuANkwCz+vyNNF/pDaGPjWr71bLTRYDQBl7fZ2PMjCv0qm6ljOXRnSZdZYvkL
	W+hXbBKjX5FGPXeWYEmSIuW4kwfqNDSpCRNefqLJMDDDhInSo1bE2aI02Lq8rEZAg7lp
X-Received: by 2002:a05:600c:4ec9:b0:46e:2562:e7b8 with SMTP id 5b1f17b1804b1-471179123admr133168905e9.21.1761079960040;
        Tue, 21 Oct 2025 13:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzW0J+zMAHmrBKy98NPR2F9AVZqblG/q03JHaUVQ2fhOgcretSouuM7HYbCnzUNTNzgIF2SQ==
X-Received: by 2002:a05:600c:4ec9:b0:46e:2562:e7b8 with SMTP id 5b1f17b1804b1-471179123admr133168635e9.21.1761079959412;
        Tue, 21 Oct 2025 13:52:39 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce678sm22293933f8f.51.2025.10.21.13.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 13:52:38 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:52:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v1 07/23] mm/balloon_compaction: use a device-independent
 balloon (list) lock
Message-ID: <20251021165040-mutt-send-email-mst@kernel.org>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021125929.377194-8-david@redhat.com>
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
In-Reply-To: <20251021125929.377194-8-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iDMSmJcHbg4AmjdKYGIMw-nXHVglGvCf0CwztlqmOIc_1761079960
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 21, 2025 at 02:59:12PM +0200, David Hildenbrand wrote:
> In order to remove the dependency on the page lock for balloon
> pages, we need a lock that is independent of the page.
> 
> It's crucial that we can handle the scenario where balloon deflation
> (clearing page->private) can race with page isolation (using
> page->private to obtain the balloon_dev_info where the lock currently
> resides).
> 
> The current lock in balloon_dev_info is therefore not suitable.
> 
> Fortunately, we never really have more than a single balloon device
> per VM, so we can just keep it simple and use a static lock to protect
> all balloon devices.
> 
> Based on this change we will remove the dependency on the page lock
> next.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/balloon_compaction.h |  6 ++---
>  mm/balloon_compaction.c            | 36 +++++++++++++++++-------------
>  2 files changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
> index 3109d3c43d306..e2d9eb40e1fbb 100644
> --- a/include/linux/balloon_compaction.h
> +++ b/include/linux/balloon_compaction.h
> @@ -21,10 +21,10 @@
>   *   i. Setting the PG_movable_ops flag and page->private with the following
>   *	lock order
>   *	    +-page_lock(page);
> - *	      +--spin_lock_irq(&b_dev_info->pages_lock);
> + *	      +--spin_lock_irq(&balloon_pages_lock);
>   *
>   *  ii. isolation or dequeueing procedure must remove the page from balloon
> - *      device page list under b_dev_info->pages_lock.
> + *      device page list under &balloon_pages_lock

Using &balloon_pages_lock with an & is kinda weird here.


>   *
>   * The functions provided by this interface are placed to help on coping with
>   * the aforementioned balloon page corner case, as well as to ensure the simple
> @@ -52,7 +52,6 @@
>   */
>  struct balloon_dev_info {
>  	unsigned long isolated_pages;	/* # of isolated pages for migration */
> -	spinlock_t pages_lock;		/* Protection to pages list */
>  	struct list_head pages;		/* Pages enqueued & handled to Host */
>  	int (*migratepage)(struct balloon_dev_info *, struct page *newpage,
>  			struct page *page, enum migrate_mode mode);
> @@ -71,7 +70,6 @@ extern size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
>  static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
>  {
>  	balloon->isolated_pages = 0;
> -	spin_lock_init(&balloon->pages_lock);
>  	INIT_LIST_HEAD(&balloon->pages);
>  	balloon->migratepage = NULL;
>  	balloon->adjust_managed_page_count = false;
> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> index fd9ec47cf4670..97e838795354d 100644
> --- a/mm/balloon_compaction.c
> +++ b/mm/balloon_compaction.c
> @@ -11,6 +11,12 @@
>  #include <linux/export.h>
>  #include <linux/balloon_compaction.h>
>  
> +/*
> + * Lock protecting the balloon_dev_info of all devices. We don't really
> + * expect more than one device.
> + */
> +static DEFINE_SPINLOCK(balloon_pages_lock);
> +
>  static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
>  				     struct page *page)
>  {
> @@ -47,13 +53,13 @@ size_t balloon_page_list_enqueue(struct balloon_dev_info *b_dev_info,
>  	unsigned long flags;
>  	size_t n_pages = 0;
>  
> -	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
> +	spin_lock_irqsave(&balloon_pages_lock, flags);
>  	list_for_each_entry_safe(page, tmp, pages, lru) {
>  		list_del(&page->lru);
>  		balloon_page_enqueue_one(b_dev_info, page);
>  		n_pages++;
>  	}
> -	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
> +	spin_unlock_irqrestore(&balloon_pages_lock, flags);
>  	return n_pages;
>  }
>  EXPORT_SYMBOL_GPL(balloon_page_list_enqueue);
> @@ -83,7 +89,7 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
>  	unsigned long flags;
>  	size_t n_pages = 0;
>  
> -	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
> +	spin_lock_irqsave(&balloon_pages_lock, flags);
>  	list_for_each_entry_safe(page, tmp, &b_dev_info->pages, lru) {
>  		if (n_pages == n_req_pages)
>  			break;
> @@ -106,7 +112,7 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
>  		dec_node_page_state(page, NR_BALLOON_PAGES);
>  		n_pages++;
>  	}
> -	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
> +	spin_unlock_irqrestore(&balloon_pages_lock, flags);
>  
>  	return n_pages;
>  }
> @@ -149,9 +155,9 @@ void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
>  {
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
> +	spin_lock_irqsave(&balloon_pages_lock, flags);
>  	balloon_page_enqueue_one(b_dev_info, page);
> -	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
> +	spin_unlock_irqrestore(&balloon_pages_lock, flags);
>  }
>  EXPORT_SYMBOL_GPL(balloon_page_enqueue);
>  
> @@ -191,11 +197,11 @@ struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info)
>  		 * BUG() here, otherwise the balloon driver may get stuck in
>  		 * an infinite loop while attempting to release all its pages.
>  		 */
> -		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
> +		spin_lock_irqsave(&balloon_pages_lock, flags);
>  		if (unlikely(list_empty(&b_dev_info->pages) &&
>  			     !b_dev_info->isolated_pages))
>  			BUG();
> -		spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
> +		spin_unlock_irqrestore(&balloon_pages_lock, flags);
>  		return NULL;
>  	}
>  	return list_first_entry(&pages, struct page, lru);
> @@ -213,10 +219,10 @@ static bool balloon_page_isolate(struct page *page, isolate_mode_t mode)
>  	if (!b_dev_info)
>  		return false;
>  
> -	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
> +	spin_lock_irqsave(&balloon_pages_lock, flags);
>  	list_del(&page->lru);
>  	b_dev_info->isolated_pages++;
> -	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
> +	spin_unlock_irqrestore(&balloon_pages_lock, flags);
>  
>  	return true;
>  }
> @@ -230,10 +236,10 @@ static void balloon_page_putback(struct page *page)
>  	if (WARN_ON_ONCE(!b_dev_info))
>  		return;
>  
> -	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
> +	spin_lock_irqsave(&balloon_pages_lock, flags);
>  	list_add(&page->lru, &b_dev_info->pages);
>  	b_dev_info->isolated_pages--;
> -	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
> +	spin_unlock_irqrestore(&balloon_pages_lock, flags);
>  }
>  
>  static int balloon_page_migrate(struct page *newpage, struct page *page,
> @@ -253,7 +259,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
>  	rc = b_dev_info->migratepage(b_dev_info, newpage, page, mode);
>  	switch (rc) {
>  	case 0:
> -		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
> +		spin_lock_irqsave(&balloon_pages_lock, flags);
>  
>  		/* Insert the new page into the balloon list. */
>  		get_page(newpage);
> @@ -272,7 +278,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
>  		}
>  		break;
>  	case -ENOENT:
> -		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
> +		spin_lock_irqsave(&balloon_pages_lock, flags);
>  
>  		/* Old page was deflated but new page not inflated. */
>  		__count_vm_event(BALLOON_DEFLATE);
> @@ -285,7 +291,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
>  	}
>  
>  	b_dev_info->isolated_pages--;
> -	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
> +	spin_unlock_irqrestore(&balloon_pages_lock, flags);
>  
>  	/* Free the now-deflated page we isolated in balloon_page_isolate(). */
>  	balloon_page_finalize(page);
> -- 
> 2.51.0


