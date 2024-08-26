Return-Path: <linuxppc-dev+bounces-501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF095EA87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:33:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsj8R41YMz2yGv;
	Mon, 26 Aug 2024 17:33:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653668;
	cv=none; b=mcbsuLQvNvcAc0xXZ6g+1mK7eTnrGb63txT7pRz0QCG0ZP4Wq2DnUSdMR+Ax1Jwhsuo4dVg5BRP2EDNZU6WUhs/l8mfg0mHvJGvsWmNl14zRhgongXvqmKJx7UHbMFer18IxWM7hBG4F+WyTVAR04LJTFIKcO1WFE5bxNF0Zm1tiI/aXPmFjeMgwGGrXOCTp1qVQQK5cD3dFJR/NZiBFTcaKewpNQSekhP65k5TDf0KrjeN3VE8AuJFxYcKNsoSs/EF/wvZsqbrQTzsXG/cX7YGX38apueJWUgeIc0O5a0nW20xPFcSaX9pv+yu13b7PJ6BKUzj+lhy3uB5mzZKvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653668; c=relaxed/relaxed;
	bh=Rs8AUYhSmmGXuJkf0JZ3EFqr6hWEcb9C7Q1wG4ibjBY=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 X-Mimecast-Spam-Score:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding; b=Y1EOb0wJYOpZEtt2fBMhRhm1LPlQ4KT2StIEtaWJjuvG3/6e7p1gjrcLKDv+HY5wcB9jRVNS2Dp+txhcKPfChyZSkLvMALP/BqiG94MTEStBRnGkVhqfdcWXNtnfZ5DcgudmMUcJ3jzv9ULunCtvX5FVgao4RhiMl9+bc2cBWOxFWrQfPDLms0j92Z4VdEKRYOWPOAyfJz/iPPubSt9GYY/S5SEI1dT2rv72oDb24kN5wCZCcD7jWvqdutwR6+MFNoAy+dWDf03A2CW/381YoPBpOQ9o8Lb2doUdboaH01bIIxRXE6TLEYsv5YF3etw+5TDlyTWp8lXLPWx3jRxuVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UsdQ93ON; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QUUE5btv; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jasowang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UsdQ93ON;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QUUE5btv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jasowang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsghg6LSHz2xsd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 16:27:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rs8AUYhSmmGXuJkf0JZ3EFqr6hWEcb9C7Q1wG4ibjBY=;
	b=UsdQ93ON3VLcEl6ay87yKZheFJX2fLWFSltLAH3M9fxYyug1urqq7ApX4gAbsofWe52dl+
	o4lX7MGIFIkVkcqehLsGNahHAnT97pFsSdnU4bMmrklatEk4Iqp1PWTqMir9lJxlC355B6
	QPmsLJFJwKUwGM2uPVW2ionjm9SjNCE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rs8AUYhSmmGXuJkf0JZ3EFqr6hWEcb9C7Q1wG4ibjBY=;
	b=QUUE5btv6RfWxCyQDJ/2p9TcfOTYnP7Db37oj4pjFUN1V//urHQ7fJtRcWoikQm/qkEs/Q
	LcK/LH3bqSZvC6qolazKP1EjNt5V5gI+v8kdZZsbcZKzEwfFYV7nPj1LAfVZHkoNz5Imr4
	ysCOBykQ1lEmXMtecPrMY0vF0qTxxBU=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-tThXXDcyOF6uurb-j6u_kg-1; Mon, 26 Aug 2024 02:27:40 -0400
X-MC-Unique: tThXXDcyOF6uurb-j6u_kg-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2d3c976e426so4918741a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2024 23:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724653659; x=1725258459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs8AUYhSmmGXuJkf0JZ3EFqr6hWEcb9C7Q1wG4ibjBY=;
        b=A3wdEbo31U0i5d/Bg06xMHbub43yJ2MNNF0sK2bIvu2dwKBVBe4I8nEmiUm6+BWqGZ
         hDcsfeOxYO2GF2oQyALVDvp0vvsXqf/MSxRUmtItcU0RKR5x3OYIwb22O18G1w/jkFcM
         sVHmTfN3I2nfFrWnU5Uy44xtfk7en982DxfujZNaFUZMo8UdbiK3rmKtqN9zb7f6YarY
         jjxw9ab8wPXKYmEpfxq1jyBQoh4eguj95/4uQvxWQDKLcz4ppPCLLspATghmriKV/uHb
         qOyqEPIQkswyXxZiFf9rbdGqXbzE/C6t2NDFzeOFp0NY+qk0vUed5GhYyMj6ChGw4uiq
         Qvnw==
X-Forwarded-Encrypted: i=1; AJvYcCUb9RU+ABs2BjQxhK4y1RN4R0oiWlJ6AgjBToXGtjKBDJXBtwDOWEdEhsKBACiLwuA9MtuuSbZ8QyZh2ho=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwnsQ5KVfivMwBpLVrdtZJc6xEDFfv9BkfIG1UdPkF7IaK2Ewks
	NE17bo7rsNrcevamBTV5I+Quvpc4SUt06qjyoxQVzirvNEgWH75WwBT9sgN+V3BCKvWBDEigEeX
	DsfUpATBmnqMtPQM10JKWTO6fA/znlzx0BdfkV/w4UhH4v1/ZuRWWA/hVGilKDbHJXJjzXabHPt
	H+h5Txx1P8gH/yw2NPY6Ot5pL7fkn7Ji4pCrYzUg==
X-Received: by 2002:a17:90b:ecd:b0:2cd:619:6826 with SMTP id 98e67ed59e1d1-2d646d4dcfbmr11272928a91.34.1724653659613;
        Sun, 25 Aug 2024 23:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP3GZqzlMhqPuuYHeWu96SGn+Tu3LWd1hDEbxpGhfc1OXWvtkUWRElPm7DPTwJzR3LmdWyUKTz2DeMu9Do6/Q=
X-Received: by 2002:a17:90b:ecd:b0:2cd:619:6826 with SMTP id
 98e67ed59e1d1-2d646d4dcfbmr11272892a91.34.1724653659123; Sun, 25 Aug 2024
 23:27:39 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240824035817.1163502-1-hch@lst.de> <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com>
In-Reply-To: <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Aug 2024 14:27:27 +0800
Message-ID: <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com>
Subject: Re: clearly mark DMA_OPS support as an architecture feasture
To: Christoph Hellwig <hch@lst.de>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 2:16=E2=80=AFPM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Sat, Aug 24, 2024 at 11:58=E2=80=AFAM Christoph Hellwig <hch@lst.de> w=
rote:
> >
> > Hi all,
> >
> > we've had a long standing problems where drivers try to hook into the
> > DMA_OPS mechanisms to override them for something that is not DMA, or
> > to introduce additional dispatching.
> >
> > Now that we are not using DMA_OPS support for dma-iommu and can build
> > kernels without DMA_OPS support on many common setups this becomes even
> > more problematic.
> >
> > This series renames the option to ARCH_DMA_OPS and adds very explicit
> > comment to not use it in drivers.  The ipu6 and vdpa_sim/user drivers
> > that abuse the mechanism are made to depend on the option instead of
> > selecting it with a big comment, but I expect this to be fixed rather
> > sooner than later (I know the ipu6 maintainers are on it based on a
> > previous discussion).
> >
>
> I will try to fix the simulator considering virtio has already had
> mapping ops now.

Actually I meant, we can extend the virtio_config_ops to allow mapping
ops there, then simulator and VDUSE can hook the map ops there.

Not sure if Michael is fine with this.

Thanks

>
> Thanks


