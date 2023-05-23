Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E69F70D406
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 08:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQPdN0GkMz3f7G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 16:32:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=8bytes.org header.i=@8bytes.org header.a=rsa-sha256 header.s=default header.b=ifU74kFs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=8bytes.org (client-ip=2a01:238:42d9:3f00:e505:6202:4f0c:f051; helo=mail.8bytes.org; envelope-from=joro@8bytes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=8bytes.org header.i=@8bytes.org header.a=rsa-sha256 header.s=default header.b=ifU74kFs;
	dkim-atps=neutral
X-Greylist: delayed 330 seconds by postgrey-1.36 at boromir; Tue, 23 May 2023 16:32:11 AEST
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQPcW4tJwz3bfk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 16:32:11 +1000 (AEST)
Received: from 8bytes.org (p200300c2773e310086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:773e:3100:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9932C2481A0;
	Tue, 23 May 2023 08:26:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1684823193;
	bh=PRjIinwlO62Z38DPKedPiQioIsmBR7lM8yRZDg3jYtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifU74kFsAuq8c6tOPQQtxpVpG8N5xd/1ixox0Mdj43a/vwKK0/XUILIh0Etrobzn7
	 LuJs1DP1FJcXRKePLIgH3pPAW/GpzoeYL07PYS1i7TTNZEuyYb7Hca4HTPAuyEF31d
	 oKiwTeZIYmtPDlr/zhe3JxIfDgxPS6Nc65QEvAL23IFrIA6u0ZYky46s+za2nuPNSw
	 ez5RztQKPRQO+YaN8V76aCM9KTb4z+k0Bm3WxDgW7xsr9KU4Isy28HF0baX2/hq0/h
	 ZLt7VW7QscTOmtkMmFmaDlNLegk3htEB7QnbpcJqVn3naS+nEJa9HPLb4zu5I4DhBx
	 rBTpVJoWQUwdg==
Date: Tue, 23 May 2023 08:26:32 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 0/3] Remove iommu_group_remove_device() from fsl
Message-ID: <ZGxcmJ3vH0Smqqxu@8bytes.org>
References: <0-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
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
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Li Yang <leoyang.li@nxp.com>, iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 16, 2023 at 09:35:25PM -0300, Jason Gunthorpe wrote:
> With POWER SPAPR now having a real iommu driver and using the normal group
> lifecycle stuff fixing FSL will leave only VFIO's no-iommu support as a
> user for the iommu_group_add/remove_device() calls. This will help
> simplify the understanding of what the core code should be doing for these
> functions.
> 
> Fix FSL to not need to call iommu_group_remove_device() at all.
> 
> v2:
>  - Change the approach to use driver_managed_dma
>  - Really simplify fsl_pamu_device_group() and just put everything in one
>    function
>  - New patch to make missing OF properties a probe failure
> v1: https://lore.kernel.org/r/0-v1-1421774b874b+167-ppc_device_group_jgg@nvidia.com
> 
> Jason Gunthorpe (3):
>   iommu/fsl: Always allocate a group for non-pci devices
>   iommu/fsl: Move ENODEV to fsl_pamu_probe_device()
>   iommu/fsl: Use driver_managed_dma to allow VFIO to work
> 
>  arch/powerpc/sysdev/fsl_pci.c   |   1 +
>  drivers/iommu/fsl_pamu_domain.c | 123 +++++++++-----------------------
>  2 files changed, 36 insertions(+), 88 deletions(-)

Any chance someone can test this on real hardware?

Regards,

	Joerg
