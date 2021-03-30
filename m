Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A6F34E732
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 14:11:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8pFg4XwTz3byl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 23:11:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V6AwhAf1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=V6AwhAf1; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8pFG2BgRz30Cn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 23:10:58 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB48A61989;
 Tue, 30 Mar 2021 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617106256;
 bh=x9ekBX8ubp5TbQCSOWJz4iBqTKfUoj1TbGKvNKFHBCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V6AwhAf1QgHJ9X1lDR7o2HkHOdHkt3V8vAvvWfz2AHqpyY2l/Fep/z6lg9kDQbauC
 4y1XZlSQfHxkf5nJp7n5VKoSDsRpRIvd7Q6K6T95XjE1o61jNca8OXezTBC5axyzuh
 IT3g9JXwM1vLMOLl3yOYj0aMGjfEXTlmIQtAF1IbGF0fPyxLKJtpZY5UsEQWkilqqL
 SGdhmOricP9XMO5hJycrVsxTgSV8ERQtWAgJsZ1LV7210oSFaZQl7d6atPYq+EP12r
 93GDdaLCudVDSgkEgkxYlhKl24qbesurPj6XXgDMZa+OVe889sGvMT7cy4P/XVi4Mb
 eXvJGcyvHpaGw==
Date: Tue, 30 Mar 2021 13:10:50 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/18] iommu/fsl_pamu: remove fsl_pamu_get_domain_attr
Message-ID: <20210330121050.GB5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-3-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:08PM +0100, Christoph Hellwig wrote:
> None of the values returned by this function are ever queried.  Also
> remove the DOMAIN_ATTR_FSL_PAMUV1 enum value that is not otherwise used.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 30 ------------------------------
>  include/linux/iommu.h           |  4 ----
>  2 files changed, 34 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
