Return-Path: <linuxppc-dev+bounces-13134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA91BF8DA6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 22:59:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crl622MMXz3bfX;
	Wed, 22 Oct 2025 07:59:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761080362;
	cv=none; b=KFBtqiB94wTmjhvcjccJVQSzs7u3h61q20ELto0EHckZeHaMd2dmbiKxc9F+tuKcN5SobPk3E1Gnikzig6yNIuukcXL3nqrybEcuzTPaI67fheK6ydB0j9AfmQReb+NKi0RFssSZcSHaofoFwJ612MKxfKgaggAa4FakAnmqDV5ei4mplIIdIOnj/E+CqmDC7v4n21guVt/4uGUP/PBYtt56nQHtq4fzjpcsyMT+q/rDE7gufljdTcEfTuATrm4wrbOYE28f6pZXTpS8Ay5Ya0i5SNZxJli/1BGko7YKi9SObMRSAtmpYJs2ZzYv+H9sf7UabpbQOEx4CPGBOwXCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761080362; c=relaxed/relaxed;
	bh=JKaU+TdmcHMrV3dqR9kS3A74O+yRTxyeV7YGtEGdpzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=R4M2lOD5GuSTBCJXhLrMDsqGTJ+Ik307qORhQNulLK2O8reJlmyOlgTgUBuXbw9yzhO5gRSI7BsQhcHRx/6GR5flJzQq/DmxeZsfHkIP7bzv9gloiz164hdXYk4R677fFd3JMSI5lOfqN+l0nn+hqZZxh7hX5aSf1khPJ8agOJ59jRR1AppPzaursoKLbawNUCOSh1TEyR8I07ZBkSesqRb4mfmAaVYXv7TkGJiae2Hk/7ET7CfcGUJVsIAjqcs8BhixzkkN3n36AyWcS5X0U51wB8F0qg2jXxd5RgmERzIqNosy00y+6kjDrDl8098WbTjCJuaSWEY8h7oxjOI8dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DdhoxZIQ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DdhoxZIQ; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DdhoxZIQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DdhoxZIQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crl611qXFz3bfM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 07:59:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761080358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JKaU+TdmcHMrV3dqR9kS3A74O+yRTxyeV7YGtEGdpzU=;
	b=DdhoxZIQufJGi7VkT90Wc5tvZUMg7FJqPZxC7mvV3Q6OHfqoUlM5aipqoMKhYxCi1P74Oj
	HG13ZestLMIxQrF2JxtucuNsDekXSZVTTiPlxI4kJBjFXhzI/Gs+yHJROrJdWCAH0NfnVn
	eHY0Agf/ENKzTl7LTvLsaqsNkJWPpSo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761080358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JKaU+TdmcHMrV3dqR9kS3A74O+yRTxyeV7YGtEGdpzU=;
	b=DdhoxZIQufJGi7VkT90Wc5tvZUMg7FJqPZxC7mvV3Q6OHfqoUlM5aipqoMKhYxCi1P74Oj
	HG13ZestLMIxQrF2JxtucuNsDekXSZVTTiPlxI4kJBjFXhzI/Gs+yHJROrJdWCAH0NfnVn
	eHY0Agf/ENKzTl7LTvLsaqsNkJWPpSo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-1SFAEzayMp6Pi3xDKVjBzA-1; Tue, 21 Oct 2025 16:59:16 -0400
X-MC-Unique: 1SFAEzayMp6Pi3xDKVjBzA-1
X-Mimecast-MFC-AGG-ID: 1SFAEzayMp6Pi3xDKVjBzA_1761080355
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-426ff59a320so7527870f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 13:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761080355; x=1761685155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKaU+TdmcHMrV3dqR9kS3A74O+yRTxyeV7YGtEGdpzU=;
        b=fSdUhrqXZgDtUT/oNbtPSQ+HWaFWbOYqMlgnp+i9ioaw9FIwLYwaBrkjr4GfoW2Xke
         kDTNlQvCUN3Osq4aV/4/93TOGzdKXFM8QRfvRNPUOtPdXSxWRB+e4mINpFuLnEG6+4UA
         KvbN1Qu368cYLCClCN+ipXyHtCeBspop3KnAUJvCqkpDc7Om+lSnu9cIJ8pgmcRl7cIz
         Of7YqeqaOX1fn4VrR8ajJaEVt0CmiHgq6rmMWpi8HduTXLSBc4Pj4S6rPXCF1cAOl1HN
         Bu5d/ks4+UipvMPGHrBq/OMl+qq+mev8DvCgeR2j0FdMiuIrxE10vnOYrT60KCLhdjdv
         gOHw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Cud4X3A1f5q+OCpMCfQ+xAXF6kDbXSH3XQfTh6R547dEBMffOlHm2qY11ok4YIYG5oNog8poD3nmwxg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzs80O6+U7JgIFLRXxFVGgxJx6a2Bg83s5zvHYY4bOf5p9I8yLe
	CNr101pAqyhj54+pQgWnIcqjtP/ootmhK9/NC64z4bjarXbcP3DpOSjjK1zdulnLtJklR9oMDeJ
	UNfpvgViFceaAk3B0uYKPKP52MLHSrDuGIM7RwOGnJJfIy4piCfAd8OU7tzmF8fhaj9c=
X-Gm-Gg: ASbGncuV6alHS7q6yjAiedne7TVcCx0Eh51OJRxzB7+3Z281B+S016z+RdM6XY+jTnQ
	Tez7mjzKjjMhlQC6DM2DsoGjJw/lbPy76zR8sl4foJEyDV9FbeLxIti7wmFK1v+I7GC3J1FrBrG
	oU/VPRyIiJdeaDn4BN6o+oC84BaQwBx3I7IidP9EqlE8QxTMbmlt8L83No2aaYNb+PCW70iATvo
	JN8xOjPWPsViUeW2oeQy25UY8/DgTAZh7aO1R3Y0osSpto6niLwQ7yYcn2XSvuDyBr1LuUolHUe
	dpwonE+TwznNRD2YUAdtyTITxo++00+TAaa9PfmZg50hkfM+Ov00AODi/5rJTe44cTbu
X-Received: by 2002:a05:6000:25c7:b0:427:854:787 with SMTP id ffacd0b85a97d-4270854085bmr11773164f8f.51.1761080354932;
        Tue, 21 Oct 2025 13:59:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm6nUHK4Q2KcRAx2gRXyZZ7eczPX8h4ab+8B0PRAUXehLh5qUDHKRiFzbQIJWCndKqsBf56w==
X-Received: by 2002:a05:6000:25c7:b0:427:854:787 with SMTP id ffacd0b85a97d-4270854085bmr11773131f8f.51.1761080354419;
        Tue, 21 Oct 2025 13:59:14 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4369b33sm9493345e9.14.2025.10.21.13.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 13:59:13 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:59:10 -0400
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
Subject: Re: [PATCH v1 11/23] drivers/virtio/virtio_balloon: stop using
 balloon_page_push/pop()
Message-ID: <20251021165854-mutt-send-email-mst@kernel.org>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021125929.377194-12-david@redhat.com>
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
In-Reply-To: <20251021125929.377194-12-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VATXxoO5dFI7Y2cEXws1H6Ifye86WxOTrHXS6BHygkY_1761080355
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 21, 2025 at 02:59:16PM +0200, David Hildenbrand wrote:
> Let's stop using these function

these functions

> so we can remove them. They look like
> belonging to the balloon API for managing the device balloon list when
> really they are just simple helpers only used by virtio-balloon.
> 
> Let's just inline them and switch to a proper
> list_for_each_entry_safe().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/virtio/virtio_balloon.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index f7d6a4a6e54f5..4b22de6a5f845 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -242,8 +242,8 @@ static void set_page_pfns(struct virtio_balloon *vb,
>  static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
>  {
>  	unsigned int num_allocated_pages;
> +	struct page *page, *next;
>  	unsigned int num_pfns;
> -	struct page *page;
>  	LIST_HEAD(pages);
>  
>  	/* We can only do one array worth at a time. */
> @@ -262,14 +262,15 @@ static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
>  			break;
>  		}
>  
> -		balloon_page_push(&pages, page);
> +		list_add(&page->lru, &pages);
>  	}
>  
>  	mutex_lock(&vb->balloon_lock);
>  
>  	vb->num_pfns = 0;
>  
> -	while ((page = balloon_page_pop(&pages))) {
> +	list_for_each_entry_safe(page, next, &pages, lru) {
> +		list_del(&page->lru);
>  		balloon_page_enqueue(&vb->vb_dev_info, page);
>  
>  		set_page_pfns(vb, vb->pfns + vb->num_pfns, page);
> @@ -474,15 +475,19 @@ static inline s64 towards_target(struct virtio_balloon *vb)
>  static unsigned long return_free_pages_to_mm(struct virtio_balloon *vb,
>  					     unsigned long num_to_return)
>  {
> -	struct page *page;
> -	unsigned long num_returned;
> +	unsigned long num_returned = 0;
> +	struct page *page, *next;
> +
> +	if (unlikely(!num_to_return))
> +		return 0;
>  
>  	spin_lock_irq(&vb->free_page_list_lock);
> -	for (num_returned = 0; num_returned < num_to_return; num_returned++) {
> -		page = balloon_page_pop(&vb->free_page_list);
> -		if (!page)
> -			break;
> +
> +	list_for_each_entry_safe(page, next, &vb->free_page_list, lru) {
> +		list_del(&page->lru);
>  		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
> +		if (++num_returned == num_to_return)
> +			break;
>  	}
>  	vb->num_free_page_blocks -= num_returned;
>  	spin_unlock_irq(&vb->free_page_list_lock);
> @@ -717,7 +722,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
>  		}
>  		virtqueue_kick(vq);
>  		spin_lock_irq(&vb->free_page_list_lock);
> -		balloon_page_push(&vb->free_page_list, page);
> +		list_add(&page->lru, &vb->free_page_list);
>  		vb->num_free_page_blocks++;
>  		spin_unlock_irq(&vb->free_page_list_lock);
>  	} else {
> -- 
> 2.51.0


