Return-Path: <linuxppc-dev+bounces-915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2744F969D22
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 14:14:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wyl0R0RXgz2xbd;
	Tue,  3 Sep 2024 22:13:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725356392;
	cv=none; b=lb3H7XNHr0rjdyPUD55bpWaRWxNUZvLjpw/fYmEqzq1XlP4f3fayLTeMY8Ms0S4pEiSo4L6+SJ7yNEUa9IKu0TF9RHIAvO3FVR0ubWjDVAGBIb8L3hD+fxirGngWVZVCR+PhklSoPF073YN1nEU87pLpw9skhdAzvUibGhN3Q9ymfw+Qk1hwO/om6bUxI6c50nyZKb/jv7uJutJg7j4dhpNJGBmA7oxskiKMYY76mSa8DhAb+axwHc63hyrjZGhU1Yg0rNbDLeY1S7XG03NsJonrj6R1tJJ9SpGjjmjBcc20ezaiMWS4zOhsGt/qtL1U2UL/Bxg8OclukKInrPtoag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725356392; c=relaxed/relaxed;
	bh=cIxA/7+yR2jXA4ieeKPuD5EUL5lArHR8csGiCMl6eW4=;
	h=DKIM-Signature:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:In-Reply-To:Content-Type:
	 Content-Disposition; b=I8aLFFawEuUZ2I+PsSCDHQwXSB7ALyouP8PrgvAV6gBhRWFrknOgnUrg+1hKEgF8+2kNtSgAiUniZKTKl6zf3eiJUVySm4qYO2QQ2KLLjGbsU6iVT/1C/cRb9STjwQaAHVJ1lCMpBeRfQ/VISp8AdcoDmTPUdBEQyltClho2vw/vNoJo2kUWcB/JQnM1P2OTiwzApiJ4OIXr6KxvY3qicohDRddA6HvTzCvH9YJFfnxMQayISmdVb3PBZbAJLFXK2j7IDcgnhq37SVJIIYwi6RwgkLZqmdzZ129eMEMaj+kUZXV1H8woQc8gY8P5aifeFM+gUcOjdq6YMFhapLOjlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fhPDW5L2; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fhPDW5L2; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fhPDW5L2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fhPDW5L2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WygZb4f73z2xWT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 19:39:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cIxA/7+yR2jXA4ieeKPuD5EUL5lArHR8csGiCMl6eW4=;
	b=fhPDW5L2uJebhd9d+81e/CelovJrJDO4Ir5ZTciVA7XvIrhOdZjtET48BB9UT6DeZoGgVt
	FVHA7MwCx8+hgyHiXM+joISrNy8W9ohWXsdN8H1N5g2BOugDKc4ne2NGBzf6mzhHTl3kXP
	8ZylniDs2uEF0oHxb0b0a2TZy7FeOJs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cIxA/7+yR2jXA4ieeKPuD5EUL5lArHR8csGiCMl6eW4=;
	b=fhPDW5L2uJebhd9d+81e/CelovJrJDO4Ir5ZTciVA7XvIrhOdZjtET48BB9UT6DeZoGgVt
	FVHA7MwCx8+hgyHiXM+joISrNy8W9ohWXsdN8H1N5g2BOugDKc4ne2NGBzf6mzhHTl3kXP
	8ZylniDs2uEF0oHxb0b0a2TZy7FeOJs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-tN-MLSFpOEqamHvpq8QCzg-1; Tue, 03 Sep 2024 05:39:46 -0400
X-MC-Unique: tN-MLSFpOEqamHvpq8QCzg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-428040f49f9so47754175e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2024 02:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725356385; x=1725961185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIxA/7+yR2jXA4ieeKPuD5EUL5lArHR8csGiCMl6eW4=;
        b=s/Vv4fBwm2EljVl2m/1/328WqcXcNhryxB572qyxopnBDbTQ81FxXx6trnL4mI2x6V
         vxIDf3tvLDLTnM1eIUEW2GNLPwLCYMFuAStURzh5YLBCmuqfWDPNbgDsFlZ3eSU7W8fU
         01pPIYgdR4I2UYhAxaBylYX8ezugWe9mffzqdhEAwZjB6/7V1Xo4X8fMGic2sg2D7Y1Q
         u2AA0BBikwFjJYZnKI9SeTTffnJD5ZX33rhdeVF/XDOd2PjcMa6biw4zqaS38fZMXe3a
         4YyOH9uQMwOWaMpoipNUtpQOavizs0z3CesVGu+w7iep2pska4LyaQViQToH9sbTDRir
         j7qw==
X-Forwarded-Encrypted: i=1; AJvYcCXRRTbTsqlNhYLB14MRa0bPXwxnaJTAgnAGKT7XyANubEBOSb67fM8dDjaZ9cBoS2eNv2dMhnJrIrJUsnY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwiRX3UgLSSnub4DVr4LvhZ3IwW5zITBrlETItszwXFNwqTJ7kk
	Td7/1ZWzn589agEoUZC+3X9l59HwbML3itu7e4gnMjNQm6Z6z2oiBWsreIjn5KjDdt9yKg2KW3P
	hzBKJwxdufU7P7gS7YoYOe7idIqsDR8xOnfdxSc9dphwwse945FLRDlqT3yumZPw=
X-Received: by 2002:a05:600c:1f90:b0:429:dc88:7e65 with SMTP id 5b1f17b1804b1-42bb02ecb7emr124596435e9.12.1725356385061;
        Tue, 03 Sep 2024 02:39:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx9ZT+cp/JOzMdJ0eMMwlRMn2QkU5Mi38V0c6sZIqJTMhc/MD50iSbcQF046e0ymvaKlJlng==
X-Received: by 2002:a05:600c:1f90:b0:429:dc88:7e65 with SMTP id 5b1f17b1804b1-42bb02ecb7emr124595995e9.12.1725356384137;
        Tue, 03 Sep 2024 02:39:44 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0f41sm164222235e9.19.2024.09.03.02.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:39:43 -0700 (PDT)
Date: Tue, 3 Sep 2024 05:39:39 -0400
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
Subject: Re: clearly mark DMA_OPS support as an architecture feature v2
Message-ID: <20240903053917-mutt-send-email-mst@kernel.org>
References: <20240828061104.1925127-1-hch@lst.de>
 <20240903072744.GA2082@lst.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
In-Reply-To: <20240903072744.GA2082@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 09:27:44AM +0200, Christoph Hellwig wrote:
> I've pulled this into the dma-mapping for-next tree, although I'd
> love to see one of the vdpa maintainers look over patch 1.  I'm
> pretty sure it's correct, but a confirmation would be good.

Missed patch 1, I was wondering why I'm CC'd. Looks good, thanks.


