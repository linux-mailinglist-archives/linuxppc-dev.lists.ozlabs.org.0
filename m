Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7D9715E71
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 14:04:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVrg14LSFz3f5v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 22:04:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FQRcNXuA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVrf461JDz3c9Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 22:03:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FQRcNXuA;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QVrf31PFMz4x1R;
	Tue, 30 May 2023 22:03:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685448236;
	bh=NlMpB9Y8fKEOI5Yr+LlELeQrjM7WIaVHlIeb8yVblew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FQRcNXuAibOUXeC/CPKmGWgD3vEhKTF1Qjx1LQc2xr+qMaRKk5Rmc4gGHPrMyaz6G
	 i60lCc4YLnQuZp/LfDpu+GcYRc8KgMRE44wGBP7b7kyr+7d2KD1JDGFtdVz2f5sAtp
	 MUoVuR1CNcyz5gaZsFu7eIkGXRqOFGe0D00j2AMHgQcorV3Mdx8mVpYLFWyfZnKdcO
	 QIw6mKG/bOM2zYSLCJEyS1S9x9ai0Z5zCjsegMjl7oyJ/6Ef2z0FcLs1vpLqVLjcnB
	 HzdLXMOJ5qIP3awPM3+ncFqFntowGtUIKIIeHxaWiX8bCPn67/S+9SFYWGORpidaYm
	 vh4dNZ/w7wcmw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>, Li
 Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v2 0/3] Remove iommu_group_remove_device() from fsl
In-Reply-To: <ZHP1zv48iZUV5Ypj@nvidia.com>
References: <0-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
 <ZGxcmJ3vH0Smqqxu@8bytes.org> <ZHP1zv48iZUV5Ypj@nvidia.com>
Date: Tue, 30 May 2023 22:03:53 +1000
Message-ID: <87leh658ly.fsf@mail.lhotse>
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
Cc: Robin Murphy <robin.murphy@arm.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, iommu@lists.linux.dev, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jason Gunthorpe <jgg@nvidia.com> writes:
> On Tue, May 23, 2023 at 08:26:32AM +0200, Joerg Roedel wrote:
>> On Tue, May 16, 2023 at 09:35:25PM -0300, Jason Gunthorpe wrote:
>> > With POWER SPAPR now having a real iommu driver and using the normal group
>> > lifecycle stuff fixing FSL will leave only VFIO's no-iommu support as a
>> > user for the iommu_group_add/remove_device() calls. This will help
>> > simplify the understanding of what the core code should be doing for these
>> > functions.
>> > 
>> > Fix FSL to not need to call iommu_group_remove_device() at all.
>> > 
>> > v2:
>> >  - Change the approach to use driver_managed_dma
>> >  - Really simplify fsl_pamu_device_group() and just put everything in one
>> >    function
>> >  - New patch to make missing OF properties a probe failure
>> > v1: https://lore.kernel.org/r/0-v1-1421774b874b+167-ppc_device_group_jgg@nvidia.com
>> > 
>> > Jason Gunthorpe (3):
>> >   iommu/fsl: Always allocate a group for non-pci devices
>> >   iommu/fsl: Move ENODEV to fsl_pamu_probe_device()
>> >   iommu/fsl: Use driver_managed_dma to allow VFIO to work
>> > 
>> >  arch/powerpc/sysdev/fsl_pci.c   |   1 +
>> >  drivers/iommu/fsl_pamu_domain.c | 123 +++++++++-----------------------
>> >  2 files changed, 36 insertions(+), 88 deletions(-)
>> 
>> Any chance someone can test this on real hardware?
>
> There isn't even a MAINTAINERS entry for this, and the git log looks
> pretty dead for a long time. I tried to cc people who might care,
> but I'm not so optimistic - unless Li says something.

I guess it falls under LINUX FOR POWERPC EMBEDDED PPC83XX AND PPC85XX,
but that's basically orphaned these days. Basically all the FSL/NXP
powerpc code is orphaned, although there are still some users.

And things are somewhat complicated because some of the drivers are also
used on their ARM SOCs, so those still get maintained from the ARM side.

But looks like this driver is powerpc only.

Turns out I do have a machine that will probe this driver. AFAICS this
series doesn't regress it, but that's just booting. I don't have it
setup to test KVM/VFIO etc.

I do see some changes in dmesg, eg:

-fsl-pci ffe270000.pcie: Removing from iommu group 61
-pci 0003:00:00.0: Adding to iommu group 60
+pci 0003:00:00.0: Adding to iommu group 64

And lots more like that.

Anything else I can check easily?

cheers
