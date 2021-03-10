Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D19303337FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 09:58:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwQwM6RYJz3d4G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 19:58:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwQw324pJz30N8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 19:58:11 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8BF2268BEB; Wed, 10 Mar 2021 09:58:06 +0100 (CET)
Date: Wed, 10 Mar 2021 09:58:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Will Deacon <will@kernel.org>
Subject: Re: [Freedreno] [PATCH 16/17] iommu: remove DOMAIN_ATTR_IO_PGTABLE_CFG
Message-ID: <20210310085806.GB5928@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-17-hch@lst.de>
 <d567ad5c-5f89-effa-7260-88c6d86b4695@arm.com>
 <CAF6AEGtTs-=aO-Ntp0Qn6mYDSv4x0-q3y217QxU7kZ6H1b1fiQ@mail.gmail.com>
 <20210305100012.GB22536@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305100012.GB22536@willie-the-truck>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, kvm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Li Yang <leoyang.li@nxp.com>,
 Rob Clark <robdclark@gmail.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 05, 2021 at 10:00:12AM +0000, Will Deacon wrote:
> > But one thing I'm not sure about is whether
> > IO_PGTABLE_QUIRK_ARM_OUTER_WBWA is something that other devices
> > *should* be using as well, but just haven't gotten around to yet.
> 
> The intention is certainly that this would be a place to collate per-domain
> pgtable quirks, so I'd prefer not to tie that to the GPU.

So the overall consensus is to just keep this as-is for now?
