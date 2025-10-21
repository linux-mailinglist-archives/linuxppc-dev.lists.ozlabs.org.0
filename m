Return-Path: <linuxppc-dev+bounces-13133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD88BF8D79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 22:57:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crl491Mc0z3bfX;
	Wed, 22 Oct 2025 07:57:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761080265;
	cv=none; b=fa1w4Km4rXWqBaJ5J2mJNBIWhULIG1Mp3NgI8oYCCcaxozxD/Bqh9HZp/VJwDvQ53CVnjX0Z8UDehylmZkvDRJ3zXOTLlEBoN7MnxPAPtvCb8ItR7aoXa1F+jYTREU/JCYYJyGhVJXAfcRJAqBid2W3+xq/kPIgnRXdWfMDPZ5FujWC86t69QzlCkCX9mgcfzADGVW585km+VpInFEs9KCV/59BrCoMbWQOkqwoW5//EfPzepD58YQHmCcOjqNDO7dDp2G7vdkFHzVVHIuul1L1nx8aOjPB7oDKTAAql+B3bYMhO3gHU5h9cRNG3Ty2alEcEwpZWp/EIRua2SGpETw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761080265; c=relaxed/relaxed;
	bh=9bAJqRa8uA5UrlbIgGaXWwm0Ps33WDl0PlkuKaJzgdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ZpJCdFDQfAs1VRPuMcdzMToD8TgJAYhBbbHTRqsDXpHifFez5ebMzFzVOi/IpnKN6z/PCtIh0kzgTUDKRYSOvmgnk84dU2pkz0oBvlBUbPFNi8ojF6UMLSznfyJf2lZe1kkeCiLDOnbKmoMNlj52mrjdUsUlQRdyVHiwl53XVwam3NpX95i585qF9m+2TH79jFpiiQDvHle4H4VJLqe+YONnjgRebTYA+Pb6iUltz0XqFAMgTYKNHMmPibbim+/Q6x4Whl7bPNV86SYOhS6atxih6Aq0gVjvCoXUyiIld+lP0eOEV2+u8YME1ecQqXzMNo5Y/6kaAoTgNldFzEVOTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QK78i5Ak; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QK78i5Ak; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QK78i5Ak;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QK78i5Ak;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crl481vgmz3bfM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 07:57:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761080260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bAJqRa8uA5UrlbIgGaXWwm0Ps33WDl0PlkuKaJzgdU=;
	b=QK78i5AklffzO++S+TKJNDt+LWEv/KUTV9IimMRDndh1yWRCe1ddChiSa+WQ6EWYeNyvo8
	r8BOKr4dno9uM3XPqTpTZt/JYECfGc1dl/CbnZbLV6ZQr3ie4dC3ipgciYWW+Z8ssWRb18
	GDpMs3bdlmDLbecktVyRCTuya28om88=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761080260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bAJqRa8uA5UrlbIgGaXWwm0Ps33WDl0PlkuKaJzgdU=;
	b=QK78i5AklffzO++S+TKJNDt+LWEv/KUTV9IimMRDndh1yWRCe1ddChiSa+WQ6EWYeNyvo8
	r8BOKr4dno9uM3XPqTpTZt/JYECfGc1dl/CbnZbLV6ZQr3ie4dC3ipgciYWW+Z8ssWRb18
	GDpMs3bdlmDLbecktVyRCTuya28om88=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-lfZYpFXcOwuwnxDy4wzKWg-1; Tue, 21 Oct 2025 16:57:36 -0400
X-MC-Unique: lfZYpFXcOwuwnxDy4wzKWg-1
X-Mimecast-MFC-AGG-ID: lfZYpFXcOwuwnxDy4wzKWg_1761080256
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4278c82dce6so2411903f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 13:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761080255; x=1761685055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bAJqRa8uA5UrlbIgGaXWwm0Ps33WDl0PlkuKaJzgdU=;
        b=a0r9ZcogS7z9h9QCiAI0hBb2IpfMKF9IdLytH9Eo5r4cbvF9U/YZrBgFzQPZTVgj7N
         yjzlH34/Q/++VWm/aat3+i43Lw+bUNnS3y4KBX5zVcY5mi++WhyLibFcRluS09KnYd0E
         AGRr0uD5eHLTXSKpyhH0r0B88ThZxPh3BOI31tNabshX8RlBa5vnn1OxghkbHX75NMqj
         +6+hdIMdQcsGH3fCNtgEbxGqyeYVx6bJUammxhkqgEJ0sKElwrawRX1U7g/XD+9uTOOW
         X62z/tUkYbl580zW0zrlaRFARpk1V5T9zKcbIu12dxGgi5SkOfHExd40MAlxoVSbOR1Y
         tjQA==
X-Forwarded-Encrypted: i=1; AJvYcCWKJfnG/pT1csjT7xQtDvpZn3C7EsZYeUd5+hEsfmLzYYlcCnMZL5ddD/+yP3eX2ahqk20/XR/uYGSYCjE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbS0BbJYB/SiZcoPKbHdHOFma3DDEbisLSurl6zcWAS2X5Y+Ym
	/aIIPRp5ctp6IEGUdbkohJUlGy++1+2xjmhd7oeJFJloPr3aq9D/+OsnUx6AfKC8nOI2VG86M9a
	mbT35/i7y1lXVYbRD8cMJJ7YfJ6o4llgiFMNlsp3rKIkwBBAWqz4bt3iUPFvkZxt+Two=
X-Gm-Gg: ASbGncuN0DpGP04a8Iw9VAqIetrjUKGILtKWPhxUo9r0lfsuWX30kzc2VFWy/UkiZya
	TjCNA8GIj15tZq7SK7v7uYOX1n7iJ5sK/46YHQOZCvCtk3KmA4vXtK95qFHMg4JUG+7DhKsQVyW
	Nw3BkLVH6VkRe7YkSJiUu9qdCmoqcvosMON3lF51tvlLdHC4X+npxC4d2RC99oStLIfIkPShFn8
	1e2UC/fKaj0lGLc+PrTY6Mhy5Qgi8HHuti8ZUAecxXqEra3PJj73kCrq8iIKeGz1+H3ZtbNZawu
	A0e55i6xkYKUx1lxfASjpPie357oM3kKSpTcTu9rOYaIdW+o9x2GYicjJQRIByz6bQND
X-Received: by 2002:a05:600c:8b8c:b0:46e:4287:a85e with SMTP id 5b1f17b1804b1-471178a4af1mr109338245e9.13.1761080255571;
        Tue, 21 Oct 2025 13:57:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnSG23+FoLb+GmLuXvkTK9R1YegvexPcW+2uOk5jzx98hZ61iH9ju7jBpY4P6BKlTjZs87DA==
X-Received: by 2002:a05:600c:8b8c:b0:46e:4287:a85e with SMTP id 5b1f17b1804b1-471178a4af1mr109337965e9.13.1761080255096;
        Tue, 21 Oct 2025 13:57:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428e9b2sm9981535e9.5.2025.10.21.13.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 13:57:34 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:57:28 -0400
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
Subject: Re: [PATCH v1 06/23] vmw_balloon: stop using the balloon_dev_info
 lock
Message-ID: <20251021165626-mutt-send-email-mst@kernel.org>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021125929.377194-7-david@redhat.com>
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
In-Reply-To: <20251021125929.377194-7-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w4XdGw_fN6cYoCDlDroprURXj_WEbQ5ehKEVAj45h2o_1761080256
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 21, 2025 at 02:59:11PM +0200, David Hildenbrand wrote:
> Let's not piggy-back on the existing lock and use a separate lock for the
> huge page list.

which is fine but it is worth documenting that we are also
no longer disabling interrupts while taking this lock.


> This is a preparation for changing the locking used to protect
> balloon_dev_info.
> 
> While at it, talk about "page migration" instead of "page compaction".
> We'll change that in core code soon as well.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/misc/vmw_balloon.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
> index 52b8c0f1eead7..53e9335b6718c 100644
> --- a/drivers/misc/vmw_balloon.c
> +++ b/drivers/misc/vmw_balloon.c
> @@ -354,10 +354,15 @@ struct vmballoon {
>  	/**
>  	 * @huge_pages - list of the inflated 2MB pages.
>  	 *
> -	 * Protected by @b_dev_info.pages_lock .
> +	 * Protected by @huge_pages_lock.
>  	 */
>  	struct list_head huge_pages;
>  
> +	/**
> +	 * @huge_pages_lock: lock for the list of inflated 2MB pages.
> +	 */
> +	spinlock_t huge_pages_lock;
> +
>  	/**
>  	 * @vmci_doorbell.
>  	 *
> @@ -987,7 +992,6 @@ static void vmballoon_enqueue_page_list(struct vmballoon *b,
>  					unsigned int *n_pages,
>  					enum vmballoon_page_size_type page_size)
>  {
> -	unsigned long flags;
>  	struct page *page;
>  
>  	if (page_size == VMW_BALLOON_4K_PAGE) {
> @@ -995,9 +999,9 @@ static void vmballoon_enqueue_page_list(struct vmballoon *b,
>  	} else {
>  		/*
>  		 * Keep the huge pages in a local list which is not available
> -		 * for the balloon compaction mechanism.
> +		 * for the balloon page migration.
>  		 */
> -		spin_lock_irqsave(&b->b_dev_info.pages_lock, flags);
> +		spin_lock(&b->huge_pages_lock);
>  
>  		list_for_each_entry(page, pages, lru) {
>  			vmballoon_mark_page_offline(page, VMW_BALLOON_2M_PAGE);
> @@ -1006,7 +1010,7 @@ static void vmballoon_enqueue_page_list(struct vmballoon *b,
>  		list_splice_init(pages, &b->huge_pages);
>  		__count_vm_events(BALLOON_INFLATE, *n_pages *
>  				  vmballoon_page_in_frames(VMW_BALLOON_2M_PAGE));
> -		spin_unlock_irqrestore(&b->b_dev_info.pages_lock, flags);
> +		spin_unlock(&b->huge_pages_lock);
>  	}
>  
>  	*n_pages = 0;
> @@ -1033,7 +1037,6 @@ static void vmballoon_dequeue_page_list(struct vmballoon *b,
>  {
>  	struct page *page, *tmp;
>  	unsigned int i = 0;
> -	unsigned long flags;
>  
>  	/* In the case of 4k pages, use the compaction infrastructure */
>  	if (page_size == VMW_BALLOON_4K_PAGE) {
> @@ -1043,7 +1046,7 @@ static void vmballoon_dequeue_page_list(struct vmballoon *b,
>  	}
>  
>  	/* 2MB pages */
> -	spin_lock_irqsave(&b->b_dev_info.pages_lock, flags);
> +	spin_lock(&b->huge_pages_lock);
>  	list_for_each_entry_safe(page, tmp, &b->huge_pages, lru) {
>  		vmballoon_mark_page_online(page, VMW_BALLOON_2M_PAGE);
>  
> @@ -1054,7 +1057,7 @@ static void vmballoon_dequeue_page_list(struct vmballoon *b,
>  
>  	__count_vm_events(BALLOON_DEFLATE,
>  			  i * vmballoon_page_in_frames(VMW_BALLOON_2M_PAGE));
> -	spin_unlock_irqrestore(&b->b_dev_info.pages_lock, flags);
> +	spin_unlock(&b->huge_pages_lock);
>  	*n_pages = i;
>  }
>  
> @@ -1828,6 +1831,7 @@ static int __init vmballoon_init(void)
>  		balloon.b_dev_info.migratepage = vmballoon_migratepage;
>  
>  	INIT_LIST_HEAD(&balloon.huge_pages);
> +	spin_lock_init(&balloon.huge_pages_lock);
>  	spin_lock_init(&balloon.comm_lock);
>  	init_rwsem(&balloon.conf_sem);
>  	balloon.vmci_doorbell = VMCI_INVALID_HANDLE;
> -- 
> 2.51.0


