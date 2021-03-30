Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 534EA34E821
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 14:59:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8qK42Q8Zz3bx7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 23:59:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o5qO9v1/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o5qO9v1/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8qJg1rwqz3047
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 23:58:59 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFB5160200;
 Tue, 30 Mar 2021 12:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617109137;
 bh=XD13IlVE5uT31vxwz23Jmf3sYXSwPZBETQyhziZVg1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o5qO9v1/5yE7DNsd35X75e1Llwq33tg4kigypRa3ZhYgV00jzvR9GlwBCVFsbNk0v
 oMnKd3KVAbRmQ1sjqyQ92YOZncHMmpKCLiTh4dPeiztw7uFlbD1bJ05GHujP9ADwJh
 6ZdZRkEYDQ60hyfQYFS0uVB/yMEOtRvgq9X3SLO1pV+/bJJYUFfoLZAvysDjxUL3D8
 S9JfwoBK5zGUZ0DMA6urCc6Z+xnlM/C3/f7EhVPixFnTWgP93un8Lru5r6WBRTfU9d
 K13Y0M6X1NZ37mnWnoGFNOuQLte4Qkf53UBYgWPq/EeMtt2wYORmDVKx07mNQTLBYB
 NswLspENY0LWg==
Date: Tue, 30 Mar 2021 13:58:51 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/18] iommu: remove DOMAIN_ATTR_PAGING
Message-ID: <20210330125851.GL5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-13-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-13-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:18PM +0100, Christoph Hellwig wrote:
> DOMAIN_ATTR_PAGING is never used.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/iommu.c | 5 -----
>  include/linux/iommu.h | 1 -
>  2 files changed, 6 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
