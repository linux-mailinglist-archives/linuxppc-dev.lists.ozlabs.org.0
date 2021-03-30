Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5555C34E7B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 14:44:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8q0J2VSLz3byc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 23:44:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XqjgVkei;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XqjgVkei; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8pzt4KpXz30Bf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 23:44:26 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94D82619A7;
 Tue, 30 Mar 2021 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617108264;
 bh=Cgba8HldB3p1zZnOmguZN9H7CCw3hn4+e9TzO2/HTCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XqjgVkeihtvV0muU9cRH6UOfyOCOIad3+p70dAR0KpfjquoAv9Udl7usitJx6k+BL
 QjydYcgHavFRbcWpgbvPPrWkiV/HoPSK0Y5Al7Wgn8qeEE7Dz7897ny039C66QZuRc
 Aj/mq1osuVlfi5bYrw8gZ7w0/xKHRj1it7sjuQIQuPs/7Lf2GPQHSGtch0QCHfcRhH
 54sfzj/rL7F2gyyuPDAkX+EUBI3YuPHKKPDrOQzuj0iQ59qI4wMM4uxguudNDIGvnN
 U1eVEzquLKFCOh3sFFHAV1h8ykTy7BSJi3dHezZk9HYl0EguBcQW/0R42/h/WW3C0M
 1/q4jESgaIcAw==
Date: Tue, 30 Mar 2021 13:44:18 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/18] iommu/fsl_pamu: replace DOMAIN_ATTR_FSL_PAMU_STASH
 with a direct call
Message-ID: <20210330124418.GG5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-8-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-8-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:13PM +0100, Christoph Hellwig wrote:
> Add a fsl_pamu_configure_l1_stash API that qman_portal can call directly
> instead of indirecting through the iommu attr API.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  arch/powerpc/include/asm/fsl_pamu_stash.h | 12 +++---------
>  drivers/iommu/fsl_pamu_domain.c           | 16 +++-------------
>  drivers/iommu/fsl_pamu_domain.h           |  2 --
>  drivers/soc/fsl/qbman/qman_portal.c       | 18 +++---------------
>  include/linux/iommu.h                     |  1 -
>  5 files changed, 9 insertions(+), 40 deletions(-)

Heh, this thing is so over-engineered.

Acked-by: Will Deacon <will@kernel.org>

Will
