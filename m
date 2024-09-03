Return-Path: <linuxppc-dev+bounces-906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1B4969557
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 09:28:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WycfM3zZMz2xbY;
	Tue,  3 Sep 2024 17:27:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725348475;
	cv=none; b=gTz9vPPtbj5alDM5tF0YKGEI99tQDkxbv/5yMOljTgUodZIlRObNmkMquyqUr9W12vaL4mdaItNBmU4mN6FRVEzKPj8S99FjpfzKiaaXq1ooqmh6q8QN+/atX1LcQFux5574r+GgkopHTBeJaxYA/+si+30qV/hFKAXbgPRdmxKGa5udNIllTIjd2qN/bF8nrMHllvco2Bz/0BNp7XvJ6yQ8/vpnkp7JqvRgHd4+ASqefIy3AoTfIW71Mq2ByItTF0DQn44PJnsfUt1pPojECE/JE0DgRjpe3qbr9Cn7793xnJfSOap3wrhRH6kBM++n2Idpt4tV/kB5lH8p41Lg7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725348475; c=relaxed/relaxed;
	bh=166Aw0xPi9Hy02yLSJA4pIz6S7Y3Yj/bimJ0SL1PUpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLJ6LsFAMdpEy+yqobusGcbB+NofO2HaeDELl3qin44ZmdqlCBTscAEJy4eLmyOxKGYeiqY/oq9RZb0dJemZ1l4yvskd37g60/vyHfqVD4VH+1W976eodELTdEh5bLNGLdZ1uHmM91Zw/kgHg4w4QGX6Tjarz1J38WUe2nq4N77LDSILIJCFW+i7r8STCkSngLHvpJKn20vTq+g74lkEKdumvQKC0r/q7GDoRaC2lA+ZfC0KgYELMWT6nEx23g/BxUIa9VELfsztQaTu7Lw6FBvq44qcqquZHIJhYOU8ZdIGcnOJTtsYcdCuLvXN0iXdfhyhqf27EJCeMydRwZZctA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WycfL5BTZz2xbF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 17:27:53 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id C1D91227A8E; Tue,  3 Sep 2024 09:27:44 +0200 (CEST)
Date: Tue, 3 Sep 2024 09:27:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin " <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: clearly mark DMA_OPS support as an architecture feature v2
Message-ID: <20240903072744.GA2082@lst.de>
References: <20240828061104.1925127-1-hch@lst.de>
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
In-Reply-To: <20240828061104.1925127-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

I've pulled this into the dma-mapping for-next tree, although I'd
love to see one of the vdpa maintainers look over patch 1.  I'm
pretty sure it's correct, but a confirmation would be good.


