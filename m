Return-Path: <linuxppc-dev+bounces-502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8291B95EA89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:33:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsj8m35vZz2yLC;
	Mon, 26 Aug 2024 17:33:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653955;
	cv=none; b=OI+uG6SkiPb8zUiG9TL7t6kAZKCec/a9k5NWoE/jxzZdVetvqa7crzzheQ/jxRLLkC6eTc8Zd9rhkMEX4xngN/zvOMAP/fbgwuzEBecoCOilUzPTSksT1L412EyducmRix6hejMryQ+nG6NPvUsrNqu3ZRMt/icrGyuSlxH/itQzdvN25NziYoV7I4mgUrKXtDFTi6wa2NpHxFf/86bTMKBk3zZDo3m+oQQHRLGVR0EQaCKaDnrPKFnEGEkF39HpJ+sMnWKry21HDJVI7i/uxH7ITGYr8T8SJif/y2MM3ieOocgcBVuMBBwzQDHVi7WuD6cec/5ycV0K2UZtDbgI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653955; c=relaxed/relaxed;
	bh=JESifInmWvZeQwWI8Jn8J0cYeIeDZ3prAXhvDlTsSj8=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 X-Mimecast-Spam-Score:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding; b=bATeEJnIJEAFQzO99W1RYGD9SUF+2Z6nY8EsKfXDC2S9sl/J2DGBiy1BheeQBEM/TZfgGagVDfK5EE4CXeYGeXHFPEmS8GrIr8q3OZUfZut732OpXrXs6foYQ5Bycm9RmowLURQgY6o1s/xBC0STNQECrLHGTQOV58+WsOGm26AKZJr54+/scEZisc2f6OkZ/dk/hKTzWmMKFNHQHOUfh/6S6lLS7BBB4LpMq0RWfqiFlCEwncjbt8sMz4PKzABgx9AryS8e6ul55LaIeKl4dJtWmaDDr7wo4SlJ9dbtfDtQWCbgrYW2z6kXgl5HuUw5rjcKmvFmklomWymE/nvINw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E6kGQxY4; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ObQY/mH9; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jasowang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E6kGQxY4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ObQY/mH9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jasowang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsgpC2YFgz2xsd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 16:32:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JESifInmWvZeQwWI8Jn8J0cYeIeDZ3prAXhvDlTsSj8=;
	b=E6kGQxY4xYiApSOlxL+UwCD068R0rgW2rO3CvvjD0WWae/XH95I5/A3nD01OT3+h0l+NkD
	QNOTW9GQ9Pt3Ocp3hGp60v3xX2RNiyAByuxWXnGSMz0pwOf/pgt/rfjZikGNGfdNq8KN5O
	X0QK3iumZ6bIojjfODaFgcI3atBhU/k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JESifInmWvZeQwWI8Jn8J0cYeIeDZ3prAXhvDlTsSj8=;
	b=ObQY/mH9voyymi5S9Rw1pLU/ngEAYvlWxECldEI7tp4ctKZyp7h+RUnX11EOwqU1iZxSps
	9LIOc60DFRtcngSyIbGTsqRJJOW1QlIyk1TBuhvr2FUDFyDRhIAgkU7IVxpGzIIXyN+S73
	evYGjHwuUoWe/ttTzmRyi4RqAGBRqY0=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-tzIGdC6jMyuFzXJ9Vz2AVg-1; Mon, 26 Aug 2024 02:32:31 -0400
X-MC-Unique: tzIGdC6jMyuFzXJ9Vz2AVg-1
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-498d9003facso1514186137.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2024 23:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724653951; x=1725258751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JESifInmWvZeQwWI8Jn8J0cYeIeDZ3prAXhvDlTsSj8=;
        b=RqiEVqHjXSKB8pQ42COEKoms/GUM8U3JslYRjFEyffscDs9lmTM/Uv5VvzWEBkvIq5
         fhYqAGCdqWCCDAnWk5yXTeCMOTNszogBjEL2nz0euIy9Lnmp0V+8AVbxM7A97iAJEXRS
         qGRxuhEsuVWAdTEBEPLY/yD09HKKUfo5SO1diaQ7v4OmZWxysKlBdZC/esbYNIlOExi+
         GG9LM4OnTO6L8bsbI+LVSfUb6vUYoT4uCyxGNdXpzWzO3y+3E+ILTZzeCyBH40bxhQjF
         QtscblyXZLxaOr6FR4wrsfJAN3OB1j5cTPw+yNxFSLkWA16Y+bNlbtkZukTTxwCOE9sg
         VOnA==
X-Forwarded-Encrypted: i=1; AJvYcCXsnyUtsPc8Eh2232Lpu1yE4q6IWSMJ3OWB1wkCG1SLauetehKST0YpleVN6f20KGJxfnQWvEe3hxy2TXw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw4oxgEOOGeQQjURV+/piUxOutuFEIMN196+Q9aAYsCj9PeW6mF
	ocg7nQYTzGN/zhEOu9PWQPyUAT2Tb7XPzhkqsTwl+NAlhAftZIq3+quhYze7bChR1Z71BLZJ0U6
	rM22oHNY85SAOL8itqSqaFdR4jJg+srnuKJQnMecvnogsW8yUWvQX//8NxcALJh1sTvqF2w1WU/
	ha91h7VN8rVRBTNz8uXCoXobL0mWno4gj4JYs6PA==
X-Received: by 2002:a05:6102:3f0f:b0:498:cca9:8b3 with SMTP id ada2fe7eead31-498f4768d98mr6498554137.31.1724653950687;
        Sun, 25 Aug 2024 23:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwydcuFOVlgtFmwjWlxiF2u2xtiMO6UvY+/x7l/PEgUFs/udwBSaHF5gxdau0K58G8iWDDv631otNdoDoL8Rg=
X-Received: by 2002:a05:6102:3f0f:b0:498:cca9:8b3 with SMTP id
 ada2fe7eead31-498f4768d98mr6498530137.31.1724653950260; Sun, 25 Aug 2024
 23:32:30 -0700 (PDT)
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
 <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com> <20240826063002.GA30266@lst.de>
In-Reply-To: <20240826063002.GA30266@lst.de>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Aug 2024 14:32:15 +0800
Message-ID: <CACGkMEvB20-iwNKepBdJBNAvxN-5+MduxnX6XDbPFsVA4hNz5A@mail.gmail.com>
Subject: Re: clearly mark DMA_OPS support as an architecture feasture
To: Christoph Hellwig <hch@lst.de>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, iommu@lists.linux.dev, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-media@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 2:30=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Mon, Aug 26, 2024 at 02:27:27PM +0800, Jason Wang wrote:
> > Actually I meant, we can extend the virtio_config_ops to allow mapping
> > ops there, then simulator and VDUSE can hook the map ops there.
>
> From a quick glance that feels like the right layer of abstraction,
> although the config part of the name feels wrong at that point.

Right, or we could have a dedicated map_ops instead of trying to use
virtio_config_ops.

Thanks

>


