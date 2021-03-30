Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC7A34E863
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:06:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8qT40SvRz3c4H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 00:06:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ASq3k8Nq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ASq3k8Nq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8qSg1RgHz30Cn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 00:05:55 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9376C619C7;
 Tue, 30 Mar 2021 13:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617109553;
 bh=9DMOAy0WF/TXjALvJ8cxeKA4ftJYf/NNqPLbi+DnD68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ASq3k8Nq/tvCuQ2EmFyEMaSv7t7NeIApY9eI7x9ee+vSZV/QpfSPyj4afiU/w/YeA
 V6T+ShFu6z2IUCDRNQ5m2kI8xpNcjbpAZt7wh1Hoef8T0oxlu6hh9L/d/mfulZ1C25
 aJP3lB5UTHltpSOc3b20Y5nFKnkgQr6MzMzUL42CpuN89rPVZfrbrXFVd/iN0moIwb
 4Yh8HJjmloXXxeWDqJdJoIHBvugrH2WjPBifz2Y5tDyWWy+l5Cv1lueJ8YoDy4u18r
 eKOzHPNwfXiotj2ibhvmC+6DxLpk2ngR797aZOhmV45MM2MizHt0h9oBwa887iRPan
 0tJ7tm6PImUDw==
Date: Tue, 30 Mar 2021 14:05:47 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 15/18] iommu: remove iommu_set_cmd_line_dma_api and
 iommu_cmd_line_dma_api
Message-ID: <20210330130546.GO5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-16-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-16-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 16, 2021 at 04:38:21PM +0100, Christoph Hellwig wrote:
> Don't obsfucate the trivial bit flag check.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/iommu/iommu.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
