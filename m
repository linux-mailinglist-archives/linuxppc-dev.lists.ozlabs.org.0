Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B02CF7454CC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:25:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZB74dTjz3c5C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:25:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZ8G0vr6z2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:23:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZ893YGmz4wxW;
	Mon,  3 Jul 2023 15:23:21 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>
In-Reply-To: <0-v1-1421774b874b+167-ppc_device_group_jgg@nvidia.com>
References: <0-v1-1421774b874b+167-ppc_device_group_jgg@nvidia.com>
Subject: Re: [PATCH rc] iommu/power: Remove iommu_del_device()
Message-Id: <168836167608.46386.6958520140413578635.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:21:16 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

On Mon, 15 May 2023 21:12:31 -0300, Jason Gunthorpe wrote:
> Now that power calls iommu_device_register() and populates its groups
> using iommu_ops->device_group it should not be calling
> iommu_group_remove_device().
> 
> The core code owns the groups and all the other related iommu data, it
> will clean it up automatically.
> 
> [...]

Applied to powerpc/fixes.

[1/1] iommu/power: Remove iommu_del_device()
      https://git.kernel.org/powerpc/c/ad593827db9b73f15eb65416ec975ec0311f773a

cheers
