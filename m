Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC7D34E8B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:16:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8qj00sxSz3c3G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 00:16:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l1jGuJCF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l1jGuJCF; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8qhZ3CpXz3bp3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 00:16:14 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC2AD600CD;
 Tue, 30 Mar 2021 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617110172;
 bh=oFXOyKxZKWj8q01FK45XVtCIPwg3akZJbcVTrbuBLVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l1jGuJCF4w1qP0WDBFRJLJbU4g/DIEbv74dOL2tJmCIJybKQT/Nk25Yv0qXeq5IaC
 EisAJbuKCJR8lIBRsfnD7dSAWI3QM8tCB0T4wmdwHhk0eojOnRHrf3takMiJpJwGys
 qw9rVNUl438UrVnp+OEcnv9h6o59f29jn7JL4MjeriTt710N2VzyfvUgJkzuLUdgJx
 4Y2jHOJXj+PRMj3LOs3p9/SoE/WlKyknigr1X7t5UGpaPbgNBBHfe0p2oKPY6K334d
 WE4pAmPZzxHYIndqKqgDdIvzbqUmJFYVOWwBPIBWWv8bjLCKMWwTnaXYTxNqTxJ/U6
 pwVpVBFdgZ8rw==
Date: Tue, 30 Mar 2021 14:16:06 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/18] iommu: remove iommu_domain_{get,set}_attr
Message-ID: <20210330131606.GA6122@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-19-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-19-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:24PM +0100, Christoph Hellwig wrote:
> Remove the now unused iommu attr infrastructure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/iommu/iommu.c | 26 --------------------------
>  include/linux/iommu.h | 36 ------------------------------------
>  2 files changed, 62 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
