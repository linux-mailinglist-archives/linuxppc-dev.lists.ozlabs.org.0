Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5942F34E818
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 14:58:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8qJN2Ntyz3c1V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 23:58:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DWN42kSz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DWN42kSz; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8qJ102Vbz2xfQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 23:58:24 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57D72619BC;
 Tue, 30 Mar 2021 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617109102;
 bh=5U0XNBMr1VJpT/QJQ4fWikCzjX4441gkw/Sdm3D+wWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DWN42kSzKc2/IQeLw9I9cnky9VKE8OZrRaxIp7imnahbv7MAIlCPAQOEf/2y5NMu8
 vScKgy/fFSn0Fhoux7qMTY9sZe6WF6VjaMVEZkplEDgA2afh3x+8zYKKjzvGPJlt06
 TgRQsOK9uVedQAZ/Jp8IqZ6ws7Nvou7AeWe16C/mwxZuyO+gjDcTWK3EQ4Q5CObwBj
 VbEcwCuxV+jbp7XKHFFopVyoBz4U9/TzMTSXuOeSy23hSGo2eadFh3veqGUn4ZV7xt
 6x9TFJiXvd7XE2fRBfyVs8VtDECvjUN4E+dczmX3kEuavFttoE7YeIPf2oxaLtcDm7
 ZIQdoQHPZqTlA==
Date: Tue, 30 Mar 2021 13:58:17 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/18] iommu/fsl_pamu: remove the snoop_id field
Message-ID: <20210330125816.GK5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-12-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-12-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:17PM +0100, Christoph Hellwig wrote:
> The snoop_id is always set to ~(u32)0.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 5 ++---
>  drivers/iommu/fsl_pamu_domain.h | 1 -
>  2 files changed, 2 insertions(+), 4 deletions(-)

pamu_config_ppaace() takes quite a few useless parameters at this stage,
but anyway:

Acked-by: Will Deacon <will@kernel.org>

Do you know if this driver is actually useful? Once the complexity has been
stripped back, the stubs and default values really stand out.

Will
