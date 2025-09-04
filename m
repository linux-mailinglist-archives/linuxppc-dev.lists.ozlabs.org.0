Return-Path: <linuxppc-dev+bounces-11751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD8EB448B2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 23:38:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHtC80Vnfz2yx8;
	Fri,  5 Sep 2025 07:38:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757021923;
	cv=none; b=osI3JvhdDDlIX9NrY04Oc30pQJN5XFk2z8X2TTPK0hs2ErD9rU2ufWRFjfU9wub0SUMYcayF7ji01rSkQaY/y6zUMZCoA0xvUUIJ5EP32L3iyjJSndRKA5tbnGzhe5o2vu8Eve7aN8p9/HVLh/GDF54p4dgYWwRsObcJiFLhnNoiXPWGs9JQImRPoSGKJ/Q/AgG6ZixFMsRokGobFpqxzvKa9l0EEMyegP208ogUgi2YdnHjSUoT1xmWCIjGFXhrbQpfp6hKenA7hhpmSI5DsCG2dyaorGW41MgxdYfoT3lqAFoxW/dQYuqhwVbIwItdn6aBIr6+2LgI1QtMu/tP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757021923; c=relaxed/relaxed;
	bh=9rHD7plJVEZkv8PkFJEx5BeBVBt5QFBtzvV5bLJfU1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=HPzy/wxIKn2VG0/nCl/i6BjLeFqo/JcZkhE9Zri9jxYaS9/11EP8zvrd0OUMP57u2EScgcn7/vCikT5dI3g+qC4fAKDw0bOL8N0aYjHP057sbgVKLPpRDpqIkId1LWY+wlRnHCUpAlzE6DjIXUqMjNuLIt7zRVCoGyomdqj6nEuEZsISiWdDgpeWjUjbh6HTuNTJ1c8wrQpVlTzbtKZNKTjq34/957T94NJAq4Mo8WdfhjlhAlHcIGpoOT72MXRXfYLvt9mZZxu/eZKJV/97NfqqNCeiUHLfFRxwTiBwSxuowcwS4x0L27iQofdoLY4+E4D21D61Uz7S4pVu6R0d/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YonimIRa; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YonimIRa; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YonimIRa;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YonimIRa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHtC64N9xz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 07:38:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757021916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rHD7plJVEZkv8PkFJEx5BeBVBt5QFBtzvV5bLJfU1s=;
	b=YonimIRaQfmjZmONKBCfD6uIUf72F7UeUjgj3gOSg/Y+tQDZew2Of2aKrFfKjJoUwkVtGU
	CtwQrj0Yg6Fccrt15AocknIp7VJ4OTOA2l+CAiOi9/Fnik8vGSLbmhjPHG3rtZgsCCMaq+
	KMWT7TwKChngPxKZFUtIPehdExsTFmk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757021916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rHD7plJVEZkv8PkFJEx5BeBVBt5QFBtzvV5bLJfU1s=;
	b=YonimIRaQfmjZmONKBCfD6uIUf72F7UeUjgj3gOSg/Y+tQDZew2Of2aKrFfKjJoUwkVtGU
	CtwQrj0Yg6Fccrt15AocknIp7VJ4OTOA2l+CAiOi9/Fnik8vGSLbmhjPHG3rtZgsCCMaq+
	KMWT7TwKChngPxKZFUtIPehdExsTFmk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-uYSsNQMTNHeiiEOGZGhGBQ-1; Thu, 04 Sep 2025 17:38:34 -0400
X-MC-Unique: uYSsNQMTNHeiiEOGZGhGBQ-1
X-Mimecast-MFC-AGG-ID: uYSsNQMTNHeiiEOGZGhGBQ_1757021913
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45b99c18484so6128145e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Sep 2025 14:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757021913; x=1757626713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rHD7plJVEZkv8PkFJEx5BeBVBt5QFBtzvV5bLJfU1s=;
        b=ft/u4re8jyQK8BdvjbpXLzyDqxBnfL5whZFgS0HfuKUQdjl2oGZKb7TciuqRRNroOv
         T4Jd3NC6g0FALck0fF2pxQOpFSneqYljxm84kzH15GS7VoFdIrDHgSkPl3bPntvMrXSn
         VGKaNjduZkAU7iKwgSGyFi9t5sYXts9q+ZstBjRR9NBx0aRmDDtq4/OuIuEpVKqWhOnT
         5AS45NdA6//M+LMnINYsBg8tT/vBbKFtFsBg6oL+WjN/VIP+AlprIeh9G/Io9HM9cSLL
         zcsuxpIYO3Q7xxfvYGhVSaQvNVE7VuSWQ+vQc6lx4t2FVrYuQnuJtmw05w98UBVlIK54
         mC+w==
X-Forwarded-Encrypted: i=1; AJvYcCUx0aRWVzdoe6ADdy0fSPnnPfA62lIXFP6F7UaT6cK9mrQwBR3caUMyJ7R10bMTjdwuq0UN1PNsWSZS4v4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwcgSsWnj8Bi7ZrCUMhQYHjfFqocv1TfZ+ptY/U/MXqVZAW0nVB
	aEQzI6BIDZbrRp5JHpJE0ZOkcU7uqV1FDCMBHPEWIqd/J32yUBovNfVk1DXpCPr579jE7Ef3vQp
	vCtMj8NuAQFUP4pB692YJvZbDIHALi/9dKmIT09LFb/A5U3BKWIqdwej0HjN9FU9PySs=
X-Gm-Gg: ASbGncu1xOK1mhUhJVCoxTMcdOOFqm6Yt2Od8yVZoj3S51S1SyG+4bNh8s9LrAG9U/k
	y/VXeYQV4yCkOc/0DQGPGHBZ3O3AzANdYCUB1PqtmyZd9noSvW/pbkimysc7HTifxI0t9S8V+2M
	wz8jzTblxdXPwrC+GtI6Q2EENFF9HiyAmvCXWd4hDrxHqEV4zqzIY6RVdJQ2baUujcJ/uycN1Vv
	uiA8ts7ESKgzi7+ddqGXMZktj5MpSYrYSdKJCIq20fcOvV/hqfcXOPPfZtZIjw+1ofLCp4NvoPi
	fweoj/L/optENzMMk1XuTVwOKz4IiyQXrQmmxEYq7gfIEupvrSIx5LBq9WoJ5fzUsQ==
X-Received: by 2002:a05:600c:1d10:b0:45b:891f:afcf with SMTP id 5b1f17b1804b1-45b891fb24dmr144597915e9.27.1757021913371;
        Thu, 04 Sep 2025 14:38:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWbBDlkpyRRxeIt/+qH4VagktWDBCJazVbSXDHRMhx/diXSZUFSBaQ6M24PtRDNYL0yu7m/g==
X-Received: by 2002:a05:600c:1d10:b0:45b:891f:afcf with SMTP id 5b1f17b1804b1-45b891fb24dmr144597725e9.27.1757021912965;
        Thu, 04 Sep 2025 14:38:32 -0700 (PDT)
Received: from redhat.com (93-51-222-138.ip268.fastwebnet.it. [93.51.222.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf3458a67fsm1872200f8f.62.2025.09.04.14.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 14:38:32 -0700 (PDT)
Date: Thu, 4 Sep 2025 17:38:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 7/7] virtio_balloon: Stop calling page_address() in
 free_pages()
Message-ID: <20250904173824-mutt-send-email-mst@kernel.org>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-8-vishal.moola@gmail.com>
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
In-Reply-To: <20250903185921.1785167-8-vishal.moola@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FyfzgIAfRkqF_Zioe0KKM4VFJylAsljNcFDQBWiv-QY_1757021913
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 03, 2025 at 11:59:21AM -0700, Vishal Moola (Oracle) wrote:
> free_pages() should be used when we only have a virtual address. We
> should call __free_pages() directly on our page instead.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/virtio/virtio_balloon.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index eae65136cdfb..7f3fd72678eb 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -488,8 +488,7 @@ static unsigned long return_free_pages_to_mm(struct virtio_balloon *vb,
>  		page = balloon_page_pop(&vb->free_page_list);
>  		if (!page)
>  			break;
> -		free_pages((unsigned long)page_address(page),
> -			   VIRTIO_BALLOON_HINT_BLOCK_ORDER);
> +		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
>  	}
>  	vb->num_free_page_blocks -= num_returned;
>  	spin_unlock_irq(&vb->free_page_list_lock);
> @@ -719,8 +718,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
>  	if (vq->num_free > 1) {
>  		err = virtqueue_add_inbuf(vq, &sg, 1, p, GFP_KERNEL);
>  		if (unlikely(err)) {
> -			free_pages((unsigned long)p,
> -				   VIRTIO_BALLOON_HINT_BLOCK_ORDER);
> +			__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
>  			return err;
>  		}
>  		virtqueue_kick(vq);
> @@ -733,7 +731,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
>  		 * The vq has no available entry to add this page block, so
>  		 * just free it.
>  		 */
> -		free_pages((unsigned long)p, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
> +		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
>  	}
>  
>  	return 0;
> -- 
> 2.51.0


