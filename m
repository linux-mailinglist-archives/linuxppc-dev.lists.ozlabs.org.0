Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E5D351522
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 15:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB3rc4SzTz30JD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 00:27:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tPQZOKwD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tPQZOKwD; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB3rB5CF4z3048
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 00:27:06 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A058961241;
 Thu,  1 Apr 2021 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617283623;
 bh=ZaHUJTjbwUns7JXT//LzMknWL6q18amExZVUaKXxS9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tPQZOKwDhHIr5lXyEm/VCmT3W6pqy/ixtcnXbdgYlJ8ni/2f59nR0dso2anIOy/6D
 yubGrVetOumTcaiZbHX4Olh4hsU0tjohQ7KZR1tENMpRhYzw95x7arHY4ue6E+9WkX
 clEEoWENof9fvWzU58Ok8pHkvy7Zuy52OrSJHN1IH1arMaZPU9GF+HLzz4hGC+Inh/
 buLk1kGm/5OBfSi+8kmpw9NgIzV3NCqRMNsuMHTzntbgKIkhS5WbnN8KMDtIFbQ5gR
 Lneqrq3L7HQIkqlYg8jtbsLKJlGI3o+q19JOhoYOpbzuxTj5LL62tV804S9J+b0JeI
 jTztNA2TZ9zgQ==
Date: Thu, 1 Apr 2021 14:26:58 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 16/18] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
Message-ID: <20210401132657.GA8997@willie-the-truck>
References: <20210316153825.135976-17-hch@lst.de>
 <20210330131149.GP5908@willie-the-truck>
 <a6952aa7-4d7e-54f0-339e-e15f88596dcc@arm.com>
 <20210330135801.GA6187@willie-the-truck>
 <578d6aa5-4239-f5d7-2e9f-686b18e52bba@arm.com>
 <20210331114947.GA7626@willie-the-truck>
 <ef895942-e115-7878-ab86-37e8a1614df5@arm.com>
 <20210331153256.GA7815@willie-the-truck>
 <81dd27fe-28ee-c800-fe5d-aaa64cb93513@arm.com>
 <20210401095945.GA6726@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401095945.GA6726@lst.de>
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
Cc: kvm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 01, 2021 at 11:59:45AM +0200, Christoph Hellwig wrote:
> For now I'll just pass the iommu_domain to iommu_get_dma_strict,
> so that we can check for it.  We can do additional cleanups on top
> of that later.

Sounds good to me, cheers!

Will
