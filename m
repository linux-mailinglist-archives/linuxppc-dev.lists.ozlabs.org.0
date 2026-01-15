Return-Path: <linuxppc-dev+bounces-15803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A91D238F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:32:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHp76Hm5z309N;
	Thu, 15 Jan 2026 20:32:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768469567;
	cv=none; b=oxgni4iSu07kborvutGg+hX5yD3oCuy21ytd+wKbD0fmxTEjxWphsLDUcfmCRPIFBK8WYFecjyW3/bv2So5k+/5JDJ2EPhVGNzfZsZ/Z39PTy4gNmhfjo1zM9xECq5LFGcncvBkby/9LEGMBwtrPf9ApCtcoXT0t5UQtRQMhX0kVd+6fadyOmjJuGHioFyc5vV/IMNjVefhrM/v4BCr1fOf5maBPFd2P+vmtmwm8/CvxflZKM+Hc/O8A0FeOe04UZzfnnY2Cl4xd5aPgej2vwldN/VsqBebs4s20QGHbmatkVWMmq5XQ9cvHI/dlE7yZeqT12b+fUoWgGhGeLDPAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768469567; c=relaxed/relaxed;
	bh=C4Jd2k3tJmH6usMx/hzIeIrNAyuq9j42Ypf29Ccd2co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SaOunEmAJqN+RwxPG0wDqFD+EHwSbFz0ax1+MnP7OrB7+gRGnXZlY88wEcMzIhbEz/VGpKlOllqbotyzEPNHIWDlpAGp7ruacGs9Ii4SjrRxIx4sZxsh/W7ajpumVRMmcpa/A373sDG07a1xsdTY4ykMqx80jOIXuJbKtalLGkW4HaVLXSGHNrr3sB4/pK/r2hX4UpecdcQiya6e/E6HWpI/QVm4J60Fx4RoOWrG4gG5KcxPdbSfCUmTMxKEHaqW8HcPaHm2x0OASZ0LbsWvz1gFtST6Bw+G7+A4k4R/6QASKlPcEw35N1dgydtaN+hrYZXRXimUBg+K8vb3XBJgmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LeyevfOw; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LeyevfOw; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LeyevfOw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LeyevfOw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHp63p1pz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:32:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768469560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4Jd2k3tJmH6usMx/hzIeIrNAyuq9j42Ypf29Ccd2co=;
	b=LeyevfOwHDIGsrfXe9WHxt+oBhKtvDkP9J88zjs/3+H73+RvBXLTeEh1fTsHOj8HtbGuqx
	hb1lGVKCHyJCBLSfyuG4FK5kCygd7ShYS61i0TE4zkGGz9SU+I0VR2f09/892ZLtAPanaW
	a47QOMuqhJiwcJhvFGiKEreWRjt9FOI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768469560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4Jd2k3tJmH6usMx/hzIeIrNAyuq9j42Ypf29Ccd2co=;
	b=LeyevfOwHDIGsrfXe9WHxt+oBhKtvDkP9J88zjs/3+H73+RvBXLTeEh1fTsHOj8HtbGuqx
	hb1lGVKCHyJCBLSfyuG4FK5kCygd7ShYS61i0TE4zkGGz9SU+I0VR2f09/892ZLtAPanaW
	a47QOMuqhJiwcJhvFGiKEreWRjt9FOI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-8maycUT_PEuqXmYhJNaciA-1; Thu, 15 Jan 2026 04:32:35 -0500
X-MC-Unique: 8maycUT_PEuqXmYhJNaciA-1
X-Mimecast-MFC-AGG-ID: 8maycUT_PEuqXmYhJNaciA_1768469554
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-431026b6252so625827f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 01:32:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469554; x=1769074354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4Jd2k3tJmH6usMx/hzIeIrNAyuq9j42Ypf29Ccd2co=;
        b=dTX7eKVwUCv14GHPD89r/rbu1tEU4ZEM62C6EbUS4R426SWS0U6fZZ9QwsLvUgrVny
         myRPlPnjW4tbc4NHmHugFa/QPcF6Zm94WNYO05lLM18oMS8dAHqxpfyNNyz5evt1RPNv
         XzQeBLYVfyBSv6kD3VeuS7CoONQXYE1nl5KqorG1PUi4HI185Lb+0+4f8j3mdJL7o3AB
         hieEmfgzJqUw5BEm8EaIMIz5TVO2KtDwz3YJII5Fk3azoEx84OrAsJr8q9jXexv64ImX
         AVQNaOSDS+/1SEy2npm0adfQHQI9b8fERxmvUTl39R4pfHVS5RwVnStqEk5r1QbKMt2d
         lzzA==
X-Forwarded-Encrypted: i=1; AJvYcCXxAXu1TphjeRz0hBR+NeteYL7U59IPSXx20qL6y880bSEroTzJ7i0pyfGLf/73PiLAGUX1J1PD9/SEUSU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1VD0io+tyOYDaWnkcgM32arS7fap7h2Tx+BZBv+l2BtAoXhqe
	wJSC27h/4uE8bvGmM/C3JjmG+Ja6+ojo2m8lxILiBTFYlDVHmvaQVQxw+lyur6Ct2fntY70p5GK
	6um7h8EpPxtHWCWwegH2PURjtE8wQKnh3KH6DspExZcoT3se0vvxauzEu8iEz8b46t5c=
X-Gm-Gg: AY/fxX4rHXsV86jFuUvRuHufTrsiQNX6eU99g2tfkXc2M+zXGkLEf/fazoWP7MmMnwm
	QkibFyXCIeaPqKxrGurjhAy8n4lH5W+2dboIzsNjKGObLPdceyFbPBJO3ygfZessXsm3Np3RUr7
	gky3mTKpkxkDyrjrt+BKj8YDunHnSzWvjOctFEcxZK3PxvSKtjcUIp3qukfgA2LsFXmP8fBHmxL
	cFWMuUKDBpVD1Cj+uzMTTmPiQOOCFw+jVwGbTgpMvFAxSdT9s3+HTYoLupWE6dKwlG1GBnZdG4t
	2DHWOOL2Q/7JEUlwWHMCT9xVgkNq7jspFsEb4K2FDyhwe6FAnGdL0w3/DXf09yWqERBlWR+mwuE
	OjAGsNW8UcJjMMGkdsq59r9Yt0ysNtA==
X-Received: by 2002:a05:6000:402b:b0:430:f41f:bd5a with SMTP id ffacd0b85a97d-4342c5727bamr6648850f8f.57.1768469553994;
        Thu, 15 Jan 2026 01:32:33 -0800 (PST)
X-Received: by 2002:a05:6000:402b:b0:430:f41f:bd5a with SMTP id ffacd0b85a97d-4342c5727bamr6648783f8f.57.1768469553541;
        Thu, 15 Jan 2026 01:32:33 -0800 (PST)
Received: from redhat.com (IGLD-80-230-35-22.inter.net.il. [80.230.35.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af65f649sm4794185f8f.19.2026.01.15.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:32:32 -0800 (PST)
Date: Thu, 15 Jan 2026 04:32:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
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
Subject: Re: [PATCH v2 23/23] MAINTAINERS: move memory balloon infrastructure
 to "MEMORY MANAGEMENT - BALLOON"
Message-ID: <20260115043136-mutt-send-email-mst@kernel.org>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-24-david@kernel.org>
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
In-Reply-To: <20260115092015.3928975-24-david@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kfzTfN9QDrNcTQ10S0ZoCsffAb4X3RFVxbKRGtlbs4A_1768469554
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:20:13AM +0100, David Hildenbrand (Red Hat) wrote:
> Nowadays, there is nothing virtio-balloon specific anymore about these
> files, the basic infrastructure is used by multiple memory balloon
> drivers.
> 
> For now we'll route it through Andrew's tree, maybe in some future it
> makes sense to route this through a separate tree.
> 
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
> ---
>  MAINTAINERS | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index de8f89ca1149f..b974f8c1c2225 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16454,6 +16454,16 @@ T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
>  F:	mm/
>  F:	tools/mm/
>  
> +MEMORY MANAGEMENT - BALLOON
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +L:	linux-mm@kvack.org

I'd still like virtualization@lists.linux.dev included, too.

> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/balloon.h
> +F:	mm/balloon.c
> +
>  MEMORY MANAGEMENT - CORE
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
> @@ -27536,9 +27546,7 @@ M:	David Hildenbrand <david@kernel.org>
>  L:	virtualization@lists.linux.dev
>  S:	Maintained
>  F:	drivers/virtio/virtio_balloon.c
> -F:	include/linux/balloon.h
>  F:	include/uapi/linux/virtio_balloon.h
> -F:	mm/balloon.c
>  
>  VIRTIO BLOCK AND SCSI DRIVERS
>  M:	"Michael S. Tsirkin" <mst@redhat.com>
> -- 
> 2.52.0


