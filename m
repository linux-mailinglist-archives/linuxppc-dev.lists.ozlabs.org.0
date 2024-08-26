Return-Path: <linuxppc-dev+bounces-499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0438A95EA7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:32:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsj7K56JWz2yFP;
	Mon, 26 Aug 2024 17:32:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653021;
	cv=none; b=kqlw4bJ2+k4WFaKv2Y5lCmYQ50TlKe8mCvgy6ilm2hkVERfpVJkhUErCoodwlu2TonZWuetVTt7yLqM2J0kvJukXVn3B/gY3DBetX2vCLZZhTslcHTT14yF0h+9hkuVeBF52PQTJYHkhs3q0DpeZDig+AvFrbhyPm8/RGj02wtlQCrwOP2iE3+pOiDNhghyoRSBfTclKHUTr7Xnoup1a8giiGnZOqXaMqdIT7gxiE5qWbdr8COcGNFuHjs05bBQlnaiXBFEEANloG7r6+r1qW3QcjvbFW+QbMIggCWjmhlyuN+Ubkn9Ox7pf3ptu/lVaMRHmDFafWwMhMQC4oIP6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653021; c=relaxed/relaxed;
	bh=dB1NfwLF4sboQ9oAiJsmEAd6cRRc4sOW3f5DA5Z/91g=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 X-Mimecast-Spam-Score:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding; b=RqRAth230wO1ORzVliw+df+3ewmpfAdXPQ93m4GWD58IbMBdlgybueNlSp+769//iL426FBgwI+i9HJiTLmceQCOn4AxvIdSGnlCj9YIpLaQcJr9e3vpp1KoBFK4Oi8qbY3728pMYVnHZP3es6EzejQvwFxYqqavpMYIByiOqjNcXhB7PPBHL4dqUT5l3Vu5sivvTWr1QBdZAxZSx8Bg4YS2AOxD1kVx2EwwiGPn8RyZf9HoVueLD9pPsu0CTkhOE52j7qvrKqHdW13IE8CKY6Axmd2+y1xY1zHZd6x+Ixy5inpgh4xaMRUH9USq6kpfgPQ9SDNCq7jvkiW3786DLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MY/sKCaT; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lq/xZKh9; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jasowang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MY/sKCaT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lq/xZKh9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jasowang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsgSD6kKgz2xYq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 16:16:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dB1NfwLF4sboQ9oAiJsmEAd6cRRc4sOW3f5DA5Z/91g=;
	b=MY/sKCaTjrBl8RIwTRt5lROwGlvJy1hjkLtRdC5LcqW5orl0kRGm4pr+30eActr3c3HICe
	lg1aiRhcPkqwke68sdAUGmpOh7T/a0peC4r0OiIxo8y5PkhY/tEgQzlRhlBZHoPV98QYHj
	B01PVTjOfiPp4IdnVg1iAJ6GommMvEE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dB1NfwLF4sboQ9oAiJsmEAd6cRRc4sOW3f5DA5Z/91g=;
	b=Lq/xZKh9UM/uD3X7Mlt2ym5KqVlIvwEfacro/EOvMFix5PoF1YbjxZ2n4LsF957dthLdUF
	X+ZCx5cIp2rgLZQDggL0CNLC6ErwqAFVU0t223hbpeyL2RIqnq3Xur7x89KTU3hUuIxkUq
	o5zs1C3AwLBnlMCB+Eq3eYEuNyYZx+4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-qn3DtpnqOHqOzXkK3zqCzA-1; Mon, 26 Aug 2024 02:16:49 -0400
X-MC-Unique: qn3DtpnqOHqOzXkK3zqCzA-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2d404dffd54so4668694a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2024 23:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724653009; x=1725257809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dB1NfwLF4sboQ9oAiJsmEAd6cRRc4sOW3f5DA5Z/91g=;
        b=FN+niTznuhIhwrRKpLb12V9nl2WPLFlEIYlx9N0t5bKt68hAddW5BTwjD+cwvUQrLB
         dFvRZVgHm8AyHlnYX1QuOD/mdANU/YRHiQXrZM3UizmK35p5yWlYO6Neh0src6J+03FF
         RkN8ooIuvhTW/gBNkMipNIjlkxPtd20hKfqV7jtj55PRI3Fz3H9JK06v9wE61su+j55g
         PIWG8d6gd+qbHrhrQBu9S7J2K3GD6LQL3fALsTaMqZlT8+pMCSYK3WxvwNqwNtkYcu/g
         iJzZeqOeQIDEi6WrBnKuuGtpOQHpJpMVREFKeeyKBCLX7esD7Va4joZ69L2bpr2nK32t
         XtWA==
X-Forwarded-Encrypted: i=1; AJvYcCVfcgynG8g0iEmVEYv6EEQJ3Jvz1nVPlKyBVhMYXrpyChR8m7XbuAIcM4eE/q5fQHUgdEh3EKa5KegCKXQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx2a33HPcKwT/3MR0ZSYTxckWHJCBMrSuIIgkvM7CvZc9U/DEM+
	SKJ5Lce7XvFbhEVj1AJMv3MtiCaJAcsnqfUxND9hC0894ykOb8rIJ9qyN5oinOqeL0KPq+ymVGw
	E7qFbIhbkaakkDyV7O5FycyytyJj9NtOC0ecoguY5YinPpoE/J0y7jWADhXvjMAGgPafPMHMkJy
	91xEb4i/00ENDLT2neW6zUVv7eTIf/8j44QChvrA==
X-Received: by 2002:a17:90a:6287:b0:2d3:cd27:c480 with SMTP id 98e67ed59e1d1-2d646d247f9mr9809265a91.33.1724653008869;
        Sun, 25 Aug 2024 23:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0WjIzDYmdUX7OY9EeJBLH76SMB2mi2zdVZl4NauXJ/eBoNO23zRck1BCKv7ZS6PzenwJTH61bASpm1vxRFd8=
X-Received: by 2002:a17:90a:6287:b0:2d3:cd27:c480 with SMTP id
 98e67ed59e1d1-2d646d247f9mr9809253a91.33.1724653008351; Sun, 25 Aug 2024
 23:16:48 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240824035817.1163502-1-hch@lst.de>
In-Reply-To: <20240824035817.1163502-1-hch@lst.de>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Aug 2024 14:16:36 +0800
Message-ID: <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com>
Subject: Re: clearly mark DMA_OPS support as an architecture feasture
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2024 at 11:58=E2=80=AFAM Christoph Hellwig <hch@lst.de> wro=
te:
>
> Hi all,
>
> we've had a long standing problems where drivers try to hook into the
> DMA_OPS mechanisms to override them for something that is not DMA, or
> to introduce additional dispatching.
>
> Now that we are not using DMA_OPS support for dma-iommu and can build
> kernels without DMA_OPS support on many common setups this becomes even
> more problematic.
>
> This series renames the option to ARCH_DMA_OPS and adds very explicit
> comment to not use it in drivers.  The ipu6 and vdpa_sim/user drivers
> that abuse the mechanism are made to depend on the option instead of
> selecting it with a big comment, but I expect this to be fixed rather
> sooner than later (I know the ipu6 maintainers are on it based on a
> previous discussion).
>

I will try to fix the simulator considering virtio has already had
mapping ops now.

Thanks


