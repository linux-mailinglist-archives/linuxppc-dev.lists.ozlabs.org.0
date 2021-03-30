Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD16F34E75A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 14:17:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8pNw4kspz3c4n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 23:17:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c25S81Bm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c25S81Bm; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8pNV55jBz3047
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 23:17:14 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCFD861613;
 Tue, 30 Mar 2021 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617106632;
 bh=R1A+HSQkC8e4xAjjBa78+nl1HCzgHqTXI4btq91BvAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c25S81BmNCVGy2OObw4tONoA0BojMCxtSOklHDKSIj3LBTHzA1/vu4ULOtdwrhaKd
 WDRfAnsEctJcADLUnZE7e4rCMh20iy3euLeexNN3WbVyaj2Jtsudf1lTE+dAEff4Na
 EbBkVoLWPCMK4kXmg1lZUi472g/zewPckNo6IUv1xppwSMzqP67IcdaAjBBbbJIPdj
 bAU/Cefcsji1sn251Az9hG84M4pKR8GSzh27H1MZGWktXOEdnAXajGUbYVkL8ZQkNK
 2pHZBINx71bFOqfhE2/GG/OPglg0+vCFbhdOxQ2PvsQfLAlsrPgsJIVJGbkCeEVtuv
 jx7d9GgoKNuyg==
Date: Tue, 30 Mar 2021 13:17:06 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/18] iommu/fsl_pamu: merge iommu_alloc_dma_domain into
 fsl_pamu_domain_alloc
Message-ID: <20210330121706.GD5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-5-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:10PM +0100, Christoph Hellwig wrote:
> Keep the functionality to allocate the domain together.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 34 ++++++++++-----------------------
>  1 file changed, 10 insertions(+), 24 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
