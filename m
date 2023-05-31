Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04556717780
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 09:04:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWKyc4gc3z3f95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 17:04:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Msgcco8W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWKxk04Dmz3bgV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 17:04:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Msgcco8W;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QWKxg2Cjyz4whk;
	Wed, 31 May 2023 17:04:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685516649;
	bh=QTIfO3Zt/MDKwwC7w7B3sh+nL8ekhE3DoJAK+oNicmE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Msgcco8WDpbdcaRZlMk3qkAc0XV2iv0xna1IAU2hY+Ji34DbSo9nRsWtshzZohNg1
	 fWS6+DZUQ4uKCGA8MxaG+CmgC8X42mcrVHr49k1Y8D1biC4eqY//0GKujHdiSf0eVy
	 RXxUDsWvKB9jQIdaMlHuCxYAZOPMPAKsPIdN+oBD8KEcfsOxdNlL2BMEYVhA84K+Jt
	 CXfQh1IwTxbSW6FxRa05Dmhhsa+LHpEx51ra494RLKQKapQwAwO5Gr3aeO4zTKt2qR
	 MvN1XUIy3PgL1TIfYhaf1/UXnJBNFVS/9XwR2WlrKA4um2mZboQd/vJb5JnZpo+aP7
	 Ex33nJnvLrVJg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 0/3] Remove iommu_group_remove_device() from fsl
In-Reply-To: <ZHX9nu234ehZWVwU@nvidia.com>
References: <0-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
 <ZGxcmJ3vH0Smqqxu@8bytes.org> <ZHP1zv48iZUV5Ypj@nvidia.com>
 <87leh658ly.fsf@mail.lhotse> <ZHX9nu234ehZWVwU@nvidia.com>
Date: Wed, 31 May 2023 17:04:04 +1000
Message-ID: <87leh5yobf.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Nicholas Piggin <npiggin@gmail.com>, Li Yang <leoyang.li@nxp.com>, iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jason Gunthorpe <jgg@nvidia.com> writes:
> On Tue, May 30, 2023 at 10:03:53PM +1000, Michael Ellerman wrote:
>> Jason Gunthorpe <jgg@nvidia.com> writes:
>> > On Tue, May 23, 2023 at 08:26:32AM +0200, Joerg Roedel wrote:
>> >> On Tue, May 16, 2023 at 09:35:25PM -0300, Jason Gunthorpe wrote:
>> >> > With POWER SPAPR now having a real iommu driver and using the normal group
>> >> > lifecycle stuff fixing FSL will leave only VFIO's no-iommu support as a
>> >> > user for the iommu_group_add/remove_device() calls. This will help
>> >> > simplify the understanding of what the core code should be doing for these
>> >> > functions.
>> >> > 
>> >> > Fix FSL to not need to call iommu_group_remove_device() at all.
>> >> > 
>> >> > v2:
>> >> >  - Change the approach to use driver_managed_dma
>> >> >  - Really simplify fsl_pamu_device_group() and just put everything in one
>> >> >    function
>> >> >  - New patch to make missing OF properties a probe failure
>> >> > v1: https://lore.kernel.org/r/0-v1-1421774b874b+167-ppc_device_group_jgg@nvidia.com
>> >> > 
>> >> > Jason Gunthorpe (3):
>> >> >   iommu/fsl: Always allocate a group for non-pci devices
>> >> >   iommu/fsl: Move ENODEV to fsl_pamu_probe_device()
>> >> >   iommu/fsl: Use driver_managed_dma to allow VFIO to work
>> >> > 
>> >> >  arch/powerpc/sysdev/fsl_pci.c   |   1 +
>> >> >  drivers/iommu/fsl_pamu_domain.c | 123 +++++++++-----------------------
>> >> >  2 files changed, 36 insertions(+), 88 deletions(-)
>> >> 
>> >> Any chance someone can test this on real hardware?
>> >
>> > There isn't even a MAINTAINERS entry for this, and the git log looks
>> > pretty dead for a long time. I tried to cc people who might care,
>> > but I'm not so optimistic - unless Li says something.
>> 
...
>
>> Anything else I can check easily?
>
> Wow Great, I think that is a Tested-by. :) Honestly booting at all is
> 99% of the battle..

Great, yep consider it:

Tested-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
