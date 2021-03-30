Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCE934E830
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:00:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8qLr0tDpz3c61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 00:00:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q+OSrGSv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q+OSrGSv; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8qLM0dg2z3047
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 00:00:27 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6723461959;
 Tue, 30 Mar 2021 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617109224;
 bh=m3TvkxvqPC7Tpakpaq16UQpVjJGrx5gC57aV7gCm8GE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q+OSrGSvrWc7WYths8Js73WEMx795hdLZQgMXoL3dU2M1loRm7gpXJPstw5r96wE+
 MHERTkZdUmMqt0s1BPvMPCPEFoJZkJamnTKDq4K4rys4fqbm/nejUkGZhZ84T7bvZv
 Ler6sSRcp45AsVGHeW+zKyc/iZ0K+xWrwbiiAvOv9AdkdKTu7n28KdSWcWg3TCBiwH
 efhhakrMIGdlWHG5y8cLowYyjKPeJvPwVS1ZDVu/G3v2OfwKusR9D1kPYvmwIyRcwB
 RPVE1raY7AUORsYfBkgmuAg8ie5APSgAugC4iRu1nKmYUKDnrH6tc0xtIdlm9sb2o9
 UNwLXhfk0L68Q==
Date: Tue, 30 Mar 2021 14:00:19 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 13/18] iommu: remove DOMAIN_ATTR_GEOMETRY
Message-ID: <20210330130019.GM5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-14-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-14-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:19PM +0100, Christoph Hellwig wrote:
> The geometry information can be trivially queried from the iommu_domain
> struture.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/iommu.c           | 20 +++-----------------
>  drivers/vfio/vfio_iommu_type1.c | 26 ++++++++++++--------------
>  drivers/vhost/vdpa.c            | 10 +++-------
>  include/linux/iommu.h           |  1 -
>  4 files changed, 18 insertions(+), 39 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
