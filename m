Return-Path: <linuxppc-dev+bounces-612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B989C960C9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 15:53:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtTXZ4VpGz2yVV;
	Tue, 27 Aug 2024 23:53:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724761960;
	cv=none; b=EIeu2pO6TshatW1j2EPN2Fv+1Dh86mvVdXmE8TWucFLPGTyVruyTOU2XyQTIK1i3juCBcqVXLnp3SES+oplakOJ72DvyiaJsVDYbk5kHlWoSTlYhkH1dAUrnEaCR0+RLBTtvv9KQBzVHrSf1AuR8R1v3HDqxAZD1XDQOd7YXQuBIlfZAZ7VZlXDQuzuJihgutx6ka+OcHwQqjnObkIbZMWTokLnOnnfR/i3pLopHERsLEEEp9UXlGa6lZVthxvPaEBvn2LBalRuQ/xQAXCYKoEOQI9r5B9CxT9ubU7QYC3hh0ICR5lRnMeSxak59SSy6sfga7+2UwnJvhLu76bPgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724761960; c=relaxed/relaxed;
	bh=M9vEl6rF8ZxKCqQCsR80va83TXNgOvysJQ+FmjX+YOs=;
	h=Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=l9Hv6zPXGfqrWq8Z9KUQLQb3u0Oh3wKgll1a4VQQN39g1gl1/L2dmmsJLTYFHLezj4OiZXxpF5r4P891lkL2YpewlFEYK5iSy6Bgwfukw7lvMdrq2WdI5qbhncVoGA21One0HLELoLnuc7sak9MjuLoNwnsfGUbcU6B5L3ML9zx5WB4UTQmnfR8JV7/+Ij/rG1b9YOFl1A5ii791hhXGrFh1cJqd6/+vByADW9M34FKmi7frK9yuWIgpNe0lDDL0EIm40Exdfvk+yFefKmuRXuH4rJQ0Fdrt+0g0wniX9irgC6VGvsGMyy0lAQgG83ZWp3s/TCxuJzvU45Z7D5l0ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtRlD0YBPz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:32:37 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69B28DA7;
	Tue, 27 Aug 2024 05:32:30 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C67E53F762;
	Tue, 27 Aug 2024 05:32:01 -0700 (PDT)
Message-ID: <91ef4036-6468-4ecc-ac14-0146130d8da4@arm.com>
Date: Tue, 27 Aug 2024 13:31:59 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-mapping: clear mark DMA ops as an architecture
 feature
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
References: <20240824035817.1163502-1-hch@lst.de>
 <20240824035817.1163502-2-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240824035817.1163502-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/08/2024 4:57 am, Christoph Hellwig wrote:
> DMA ops are a helper for architectures and not for drivers to override
> the DMA implementation.  Unfortunately driver authors keep ignoring
> this.  Make this more clear by renaming the symbol to ARCH_DMA_OPS,
> have the three drivers overriding it depend on that.  They should
> probably also be marked broken, but we can give them a bit of a grace
> period for that.

Nit: from a quick survey of "git grep 'select ARCH_'", maybe 
ARCH_HAS_DMA_OPS might be the clearest and most consistent name? 
Otherwise, now that any potential confusion from drivers/iommu is no 
more, I too thoroughly approve of the overall idea.

Acked-by: Robin Murphy <robin.murphy@arm.com>

