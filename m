Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 904817067A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 14:10:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLsQ9335dz3f95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 22:10:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZyvRzNxZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLsPJ2XBLz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 22:10:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZyvRzNxZ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QLsPB3yCGz4x1f;
	Wed, 17 May 2023 22:10:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684325410;
	bh=Ugo6kiXu55PcZr+hR/ZzjsX8h/mgEpTIvZm7PzEg/B0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZyvRzNxZDgTENMcc7SO6HSQZLRnklkuNI5jYSrlwk6eDS9QWzDhA4Mlg+TUDrpiUK
	 wLpbE3kCiyIHkalylcZ0heknZPBtx/6ufj6LVXv6Zj89y1P0n8uorniOzcD0tebJKW
	 UG/Nfr88ShLGuN4YKxkgvLtg/vif8ZiijQOiI6nxnzXmbxkTfHjzskwg0MK4oyjAZQ
	 rAvNZoXbvkvoQR4Q8o0Ljv6XOUkz5ihAvg/QZkSHSJ3kXNH0qx6tUA9GJDATpQ1lbS
	 0OlPwkxkLKqlJ9DRBdQSPVdSl92FxvY62sOUMHoaMius03AxgJtWhcVPjKg4ULpYil
	 2tzwTdFSumZTA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Nicholas
 Piggin <npiggin@gmail.com>
Subject: Re: [PATCH rc] iommu/power: Remove iommu_del_device()
In-Reply-To: <0-v1-1421774b874b+167-ppc_device_group_jgg@nvidia.com>
References: <0-v1-1421774b874b+167-ppc_device_group_jgg@nvidia.com>
Date: Wed, 17 May 2023 22:10:05 +1000
Message-ID: <87ttwbyx9e.fsf@mail.lhotse>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <jroedel@suse.de>, Alexey Kardashevskiy <aik@ozlabs.ru>, iommu@lists.linux.dev, Timothy Pearson <tpearson@raptorengineering.com>, Alex Williamson <alex.williamson@redhat.com>, Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jason Gunthorpe <jgg@nvidia.com> writes:
> Now that power calls iommu_device_register() and populates its groups
> using iommu_ops->device_group it should not be calling
> iommu_group_remove_device().
>
> The core code owns the groups and all the other related iommu data, it
> will clean it up automatically.
>
> Remove the bus notifiers and explicit calls to
> iommu_group_remove_device().
>
> Cc: iommu@lists.linux.dev
> Fixes: a940904443e4 ("powerpc/iommu: Add iommu_ops to report capabilities and allow blocking domains")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/powerpc/include/asm/iommu.h       |  5 -----
>  arch/powerpc/kernel/iommu.c            | 17 -----------------
>  arch/powerpc/platforms/powernv/pci.c   | 25 -------------------------
>  arch/powerpc/platforms/pseries/iommu.c | 25 -------------------------
>  4 files changed, 72 deletions(-)
>
> Michael, please take this on the PPC tree to -rc thanks

Will do, thanks.

cheers
