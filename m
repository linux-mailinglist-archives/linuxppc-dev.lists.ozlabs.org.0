Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D3434E76F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 14:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8pWF2y7Pz3c1d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 23:23:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WK5wU8Qz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WK5wU8Qz; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8pVp6vrpz304L
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 23:22:42 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 007BD619B4;
 Tue, 30 Mar 2021 12:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617106960;
 bh=/aM64zjLfZ9icJTYRZuJLiDfQTnTZcq/QS8CixcectI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WK5wU8QzM2RAlf0A2tPmCsCSrZ6xX/6kymJwUDezvxGq+zEpbtRiqJE6Tk7/uqfXS
 ZWuDra3MPyeLzukYzhLpHEZ3cyApoLPN1Alj/vVZbTad1wWRWYgHApBLjKb+OSQQ0b
 khQj7nJ4uP5lzLP8zR1ohRZgZhkeZk+WPpSV+7k/5QZjHX0PjUYGMkFTEn/AilCqDm
 1+QXeCSskrL3TI3hIq3qv28Ukt2hJG6SDrmUXCr60YaJvYVyhLEqb4KEM4eG9XEBlX
 4YOreXixQ5uL+t7JzueqrMXfoiokiQNL24aC6BcZ2UBMoW/bDqocR+rtAu2Jrsoavg
 9z/uGdduijzXQ==
Date: Tue, 30 Mar 2021 13:22:34 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/18] iommu/fsl_pamu: remove support for multiple windows
Message-ID: <20210330122234.GE5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-6-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:11PM +0100, Christoph Hellwig wrote:
> The only domains allocated forces use of a single window.  Remove all
> the code related to multiple window support, as well as the need for
> qman_portal to force a single window.
> 
> Remove the now unused DOMAIN_ATTR_WINDOWS iommu_attr.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu.c            | 264 +-------------------------
>  drivers/iommu/fsl_pamu.h            |  10 +-
>  drivers/iommu/fsl_pamu_domain.c     | 275 +++++-----------------------
>  drivers/iommu/fsl_pamu_domain.h     |  12 +-
>  drivers/soc/fsl/qbman/qman_portal.c |   7 -
>  include/linux/iommu.h               |   1 -
>  6 files changed, 59 insertions(+), 510 deletions(-)

[...]

> +	set_bf(ppaace->impl_attr, PAACE_IA_ATM, PAACE_ATM_WINDOW_XLATE);
> +	ppaace->twbah = rpn >> 20;
> +	set_bf(ppaace->win_bitfields, PAACE_WIN_TWBAL, rpn);
> +	set_bf(ppaace->addr_bitfields, PAACE_AF_AP, prot);
> +	set_bf(ppaace->impl_attr, PAACE_IA_WCE, 0);
> +	set_bf(ppaace->addr_bitfields, PPAACE_AF_MW, 0);
>  	mb();

(I wonder what on Earth that mb() is doing...)

> diff --git a/drivers/iommu/fsl_pamu_domain.h b/drivers/iommu/fsl_pamu_domain.h
> index 53d359d66fe577..b9236fb5a8f82e 100644
> --- a/drivers/iommu/fsl_pamu_domain.h
> +++ b/drivers/iommu/fsl_pamu_domain.h
> @@ -17,23 +17,13 @@ struct dma_window {
>  };
>  
>  struct fsl_dma_domain {
> -	/*
> -	 * Number of windows assocaited with this domain.
> -	 * During domain initialization, it is set to the
> -	 * the maximum number of subwindows allowed for a LIODN.
> -	 * Minimum value for this is 1 indicating a single PAMU
> -	 * window, without any sub windows. Value can be set/
> -	 * queried by set_attr/get_attr API for DOMAIN_ATTR_WINDOWS.
> -	 * Value can only be set once the geometry has been configured.
> -	 */
> -	u32				win_cnt;
>  	/*
>  	 * win_arr contains information of the configured
>  	 * windows for a domain. This is allocated only
>  	 * when the number of windows for the domain are
>  	 * set.
>  	 */

The last part of this comment is now stale ^^

> -	struct dma_window		*win_arr;
> +	struct dma_window		win_arr[1];
>  	/* list of devices associated with the domain */
>  	struct list_head		devices;
>  	/* dma_domain states:

Acked-by: Will Deacon <will@kernel.org>

Will
