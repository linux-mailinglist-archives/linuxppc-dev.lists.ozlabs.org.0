Return-Path: <linuxppc-dev+bounces-486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE8095E339
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2024 14:14:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsCRH5Gy7z2xgv;
	Sun, 25 Aug 2024 22:14:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724585602;
	cv=none; b=lSAmFzB+dvAti6VwMKlX7dAV8H2YdF+43n9PwtbPLnRp/FY3WnDj3Fito0X+YiXIOBGENAnaDHOzz8fVJvbJGN93hsXL31Ots+IYDNaZT5sJ7N8BMtKy8zrxFyRWcdapj9jVHAOyTU4lgfqAuuy3grDeXcqtlJy5R+KsuWix0ipPMDfkIh3o8xJWJIq5d3qA4FsPy/K/kzs9Dh6CuuBHn3YMdo8Tu0zTjJtwo75MkXxVcdNTM8inshh7cLx0L8Y1lZBr8jR3BIR2QKFiorx//7xI/djimwzpfP3mBGbpJar52oGi+Alqb54cfm8fp7Gb9GjaAamLoBCyEiA7Olodfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724585602; c=relaxed/relaxed;
	bh=traTpRXPEY3SvX85V4UNHLV9avrLQDajKAbi9KW9Mas=;
	h=From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type; b=aHHkk/5loap9O0LLKf5qs66z8uK+h6Xp88BTM9Ad4QPqOojkN14bknIMgbyTfMU+N0ruCHAbnBAg8hQSpsXbtjJi+aV8e5TW3LYQSrbKDWf18NR4rzA2+qKNk8AWKPbawuwi8wW7krSwau6CM8Mky7ihCata1sGmamY8Z3wd7qLiibjqWVEXwA+jXMWwQDHvochH9vXh8iUneNFF/tyZm0SaQvMvWWWdEXVtjNlz26fNgrDdAJ+xpfjQ/fEU7yYW3/cFM/7ZkzhoIGu/tB8tA2ZUppVLzDAlQqcH6Z8dN6vUxleAdURKT6sS/5gbCiAr/v+Ipb6+li471WLlD7W4KQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qn2bhicO; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=362fE7OT; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qn2bhicO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=362fE7OT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsBWj3vbNz2xbd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2024 21:33:21 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724585594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=traTpRXPEY3SvX85V4UNHLV9avrLQDajKAbi9KW9Mas=;
	b=qn2bhicOfVHkdU7ck2v9tQF6W6WaJTXtqZEiWMHDfSL0Ev8o4KvGgHaALZgsyIAuFmttgs
	z5VnO+/6JY/fpXdhsiJya6hJDEm92zNzekboN60EFMExyIDu4ptFxzhH4F3Ic/cIAkD5Z3
	eTpykbtlXrP26a2G14buyr1ILLvcF3Fwjw+fU4Ds0yx9zmYL070XfvOjMbFbx0+G7GP/qN
	QWk0cMlQW6lVQzcayW3GOUwF4N5MKvBs+rCVlIVgoMHKGRHCRYdZj9qmfE8WafyxZ6YmSX
	+njM55adqgFTMeTO5hcBsEL9u4XGST4sctn9iwM/3LHcUT2tKJnm1xD+iixu3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724585594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=traTpRXPEY3SvX85V4UNHLV9avrLQDajKAbi9KW9Mas=;
	b=362fE7OT8P33AoXzNCnYkmiiNxEZ9GS9ZEvhn7ufxaWm1AsSruiz/SNKSgf7TwmCNyijB9
	4r4ytqAeRlb3O+Cg==
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
 <robin.murphy@arm.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] dma-mapping: clear mark DMA ops as an architecture feature
In-Reply-To: <20240824035817.1163502-2-hch@lst.de>
References: <20240824035817.1163502-1-hch@lst.de>
 <20240824035817.1163502-2-hch@lst.de>
Date: Sun, 25 Aug 2024 13:33:13 +0200
Message-ID: <87ed6cg7ly.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Aug 24 2024 at 05:57, Christoph Hellwig wrote:
> DMA ops are a helper for architectures and not for drivers to override
> the DMA implementation.  Unfortunately driver authors keep ignoring
> this.  Make this more clear by renaming the symbol to ARCH_DMA_OPS,
> have the three drivers overriding it depend on that.  They should
> probably also be marked broken, but we can give them a bit of a grace
> period for that.

One week :)

> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

