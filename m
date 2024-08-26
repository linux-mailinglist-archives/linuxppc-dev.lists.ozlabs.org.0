Return-Path: <linuxppc-dev+bounces-492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B58B695E8C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 08:30:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsglT3MdDz2yDg;
	Mon, 26 Aug 2024 16:30:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724653813;
	cv=none; b=d3BuCpJDtQ1nl3h+in2kmIeaoebpobyveWxHmoHc10ozv2cPL90+aw/UHnmdrUpVaAAHa/XGR5zv6PsxhMVo16cN1lYjRFDS4US+qtN0TNczvtSh1DLpYriqw4dAF15tRcaLkV6z3l8C2mf4etqZARCSA3uYWdxgLgANwQgbReqKN38lZ7qbVqbv635vXCMxTbxP7O70PhN2Q2L1RgyLgKtR7P2ZsN75Y+7FtTsGElMdKCLmwIVulZx7ez2BlJld/MfXaGC8gMgBHngAozZIK+lGAcoQj+CCBRl19PvXPUMXPrUkiOuoPszOYnRDEfldHSClF/Xbp5RCqpbJUDeX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724653813; c=relaxed/relaxed;
	bh=I5vPQa5B0qSf1a0XhjsHqZRzzkETp0uhy9XwdCafnAA=;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent; b=Cq6go5YCYyMmtFjvO8VZ6c7U61HdoNS5/AOYLXJL3KG+9qLIwLKNBkD8ux/33LpM+SlD+H3ZCSxlDJ61VRKpVkSZSdNezvnxESqJ26KYi33Y3r7tWLFK/4wL4N7014+/c1bwBJ6cRj9LATzK5ssz97QfUZb46kqfiThsR8VDbNa0G9IIeIGcxC5GdMTJyP1KkAEjNFEiTFBhjrm/jGx1qvJyI7xgQPdg7/OH2FuxrH2LDqrLpOtT710RMaUQ2LU8DwJ16uqyUtu68sFI+miqH+di4aFZS/Ru5JA2QyHe6CIedkSyvwdApANMa94czdMG3mOoGV+IFwOsXdlwBi/Zyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsglS4H5Pz2xsd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 16:30:11 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8552E68AA6; Mon, 26 Aug 2024 08:30:03 +0200 (CEST)
Date: Mon, 26 Aug 2024 08:30:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Wang <jasowang@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, "Michael S . Tsirkin" <mst@redhat.com>,
	iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: clearly mark DMA_OPS support as an architecture feasture
Message-ID: <20240826063002.GA30266@lst.de>
References: <20240824035817.1163502-1-hch@lst.de> <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com> <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Aug 26, 2024 at 02:27:27PM +0800, Jason Wang wrote:
> Actually I meant, we can extend the virtio_config_ops to allow mapping
> ops there, then simulator and VDUSE can hook the map ops there.

From a quick glance that feels like the right layer of abstraction,
although the config part of the name feels wrong at that point.


