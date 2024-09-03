Return-Path: <linuxppc-dev+bounces-914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F18A969D1D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 14:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WykzZ3vzdz2xXV;
	Tue,  3 Sep 2024 22:13:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725356358;
	cv=none; b=nWkdX+ctochKDhE+xOz9QJ4FwkOIDCnVshvX9eExoz4gBja6bJEuHiRGX7QpHkGG1RD1HLg+MFxKtH1OF6qeIxBlf0F8fkVh/DxB764/Ul45gorjAg42x4HInhFE7sfu4/J308MANpnL1edPmMp1m8x3JAx9a5/2h7haZCGw3acR49wEFYx8KLGz2WvDqk2eUrj9cof7JJCUbkkQnM/sgc4SQ0XIoKfqS9FT2dNvfPBRrN0ckuj1rzL9XpzMDtW1rGXzyMDr6oe5/aTutwwXqPzRADagVOJzA7xqyMUJpgo/H4vjKm9BTjC0/AB4DBZ+LUR/KnmGsPF/Lbhb7ew2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725356358; c=relaxed/relaxed;
	bh=ROekkmcoe+OX/H/SJ0CegmonvJxcYbn0m80zXzGYZLw=;
	h=DKIM-Signature:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:In-Reply-To:Content-Type:
	 Content-Disposition; b=R9WePcQY/6Bl/DseOJSbgX9qzOnmPluJJo4Pf50MdoQwm94rErOshNwS6GxWhp5NRZivHggOFuUzxCBT3ynSs2i6kj+Tyd2pruYLUw1uDodhszXVLIUpJYxOJOefgLs3Sdly3Fe9yDxPvoo3dUPYtd84/EYuNW6MhDhr/SL9e4qNkiMMvavRHxePcFhlWtDVXkpiTcIRwHa+iebgzLC5do2UBazghf+D/DTGUQ4UbgbGx7frOJKrvifYeWx1oCwjUrFBqcnE41u4jGtylBb6qdFBnDI4ppleNhuuM7KGmCWzy3iuBC4TfAgBHN+WDk0h/Xn7pN7fSQGBvTl5tzMd+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dzg0MTH8; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dzg0MTH8; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dzg0MTH8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dzg0MTH8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WygYx3821z2xWT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 19:39:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ROekkmcoe+OX/H/SJ0CegmonvJxcYbn0m80zXzGYZLw=;
	b=Dzg0MTH81X5MuDrt2OLTZjTsfh9S3IMwT3enhoGoSO6WkamznRckYPFV/zOLIYifHtDPca
	1BhbhhsTEHZPay5jkVb1UzEAC5MMmXvBQ+sjnV4TH/VcTe8ZWyQmeNvCC9sazU0q3Vk4Zx
	a1E8p1kuNnRNg9omv2MGxYn1oIYzP+I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ROekkmcoe+OX/H/SJ0CegmonvJxcYbn0m80zXzGYZLw=;
	b=Dzg0MTH81X5MuDrt2OLTZjTsfh9S3IMwT3enhoGoSO6WkamznRckYPFV/zOLIYifHtDPca
	1BhbhhsTEHZPay5jkVb1UzEAC5MMmXvBQ+sjnV4TH/VcTe8ZWyQmeNvCC9sazU0q3Vk4Zx
	a1E8p1kuNnRNg9omv2MGxYn1oIYzP+I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-CFq7ul8HMWOLjBK3t3fArw-1; Tue, 03 Sep 2024 05:39:11 -0400
X-MC-Unique: CFq7ul8HMWOLjBK3t3fArw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42c80412dc1so21029005e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2024 02:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725356350; x=1725961150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROekkmcoe+OX/H/SJ0CegmonvJxcYbn0m80zXzGYZLw=;
        b=cJFw+j+dv7/scdhj4n1d6XO/UH6m8MY0aOkusADXue7s902avowtf9v8skCSVt7J9p
         Siyy5o3usY73YnKNmLSQxTyGIPBTO6xvO44wEHfEpN0926uuc/MfB18sUv9Wph1Zj8hv
         Z//VzMqaT3SU+ma2WB5wrkHf2kVwBBcwfv28ngfeNr7jXil/2d5wIYdeAOqpoxC5Q6S4
         14kqBCOGcQHS5JLxreA0yW8S970zFjgNYEw5CaU/EIA6zsR7MmX/C9i5XgZyuzk6bfqz
         u5ykrprUw0YgEcGJxJ1W3yoeNXkuerZfLef4uZcMvXsa4QK4igbRGFUecrIMfjTk0dmp
         Fitg==
X-Forwarded-Encrypted: i=1; AJvYcCUas+aVbJVsPqa2OgAOzNViZs/uU7cqqlQevek3MecyVDVlGltSZhuuWXenDVummFriqxUv1lHXc8hz8bY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx/f2H0MF5U04FDClf/QfyYQrlHAt+WbP/PDiGJ9m1eAtKj88mh
	DueMKGSWOmR5suPUZjI9T+Z/ozKaMSh4O2ynC+x+7XyUvFoqKa5m0MdQcNeA7gN5yvo2A4dUAn/
	bYUrVNlHi6ASpoX3dqP5l56rAP8O/aG5RiBNF0WZ19TYHiRZvXYzErTicsHy1itI=
X-Received: by 2002:a05:600c:3d0d:b0:426:4f47:6037 with SMTP id 5b1f17b1804b1-42bdc6375abmr66533105e9.19.1725356350124;
        Tue, 03 Sep 2024 02:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmeosf/mJIf4OuBVOC1FXDQtaN47WobnVUFS/lrBzspPK+LAJFhvAiwYTR4QIKkjIzV+Hhfw==
X-Received: by 2002:a05:600c:3d0d:b0:426:4f47:6037 with SMTP id 5b1f17b1804b1-42bdc6375abmr66532735e9.19.1725356349385;
        Tue, 03 Sep 2024 02:39:09 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bba57bb20sm142356975e9.4.2024.09.03.02.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:39:08 -0700 (PDT)
Date: Tue, 3 Sep 2024 05:39:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-media@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] vdpa_sim: don't select DMA_OPS
Message-ID: <20240903053857-mutt-send-email-mst@kernel.org>
References: <20240828061104.1925127-1-hch@lst.de>
 <20240828061104.1925127-2-hch@lst.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
In-Reply-To: <20240828061104.1925127-2-hch@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 28, 2024 at 09:10:28AM +0300, Christoph Hellwig wrote:
> vdpa_sim has been fixed to not override the dma_map_ops in commit
> 6c3d329e6486 ("vdpa_sim: get rid of DMA ops"), so don't select the
> symbol and don't depend on HAS_DMA.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/vdpa/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
> index 5265d09fc1c409..b08de3b7706109 100644
> --- a/drivers/vdpa/Kconfig
> +++ b/drivers/vdpa/Kconfig
> @@ -11,8 +11,7 @@ if VDPA
>  
>  config VDPA_SIM
>  	tristate "vDPA device simulator core"
> -	depends on RUNTIME_TESTING_MENU && HAS_DMA
> -	select DMA_OPS
> +	depends on RUNTIME_TESTING_MENU
>  	select VHOST_RING
>  	select IOMMU_IOVA
>  	help
> -- 
> 2.43.0


