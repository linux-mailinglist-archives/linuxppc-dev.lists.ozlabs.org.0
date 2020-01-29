Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDFD14C675
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 07:26:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486tm00mTnzDqYk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 17:26:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sF35R2gzDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sF12qt1z9sSD; Wed, 29 Jan 2020 16:17:40 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: aff8c8242bc638ba57247ae1ec5f272ac3ed3b92
In-Reply-To: <1579558202-26052-1-git-send-email-tyreld@linux.ibm.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries/vio: Fix iommu_table use-after-free
 refcount warning
Message-Id: <486sF12qt1z9sSD@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:40 +1100 (AEDT)
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, aik@ozlabs.ru,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, drt@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-01-20 at 22:10:02 UTC, Tyrel Datwyler wrote:
> From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
> 
> Commit e5afdf9dd515 ("powerpc/vfio_spapr_tce: Add reference counting to
> iommu_table") missed an iommu_table allocation in the pseries vio code.
> The iommu_table is allocated with kzalloc and as a result the associated
> kref gets a value of zero. This has the side effect that during a DLPAR
> remove of the associated virtual IOA the iommu_tce_table_put() triggers
> a use-after-free underflow warning.
> 
> Call Trace:
> [c0000002879e39f0] [c00000000071ecb4] refcount_warn_saturate+0x184/0x190
> (unreliable)
> [c0000002879e3a50] [c0000000000500ac] iommu_tce_table_put+0x9c/0xb0
> [c0000002879e3a70] [c0000000000f54e4] vio_dev_release+0x34/0x70
> [c0000002879e3aa0] [c00000000087cfa4] device_release+0x54/0xf0
> [c0000002879e3b10] [c000000000d64c84] kobject_cleanup+0xa4/0x240
> [c0000002879e3b90] [c00000000087d358] put_device+0x28/0x40
> [c0000002879e3bb0] [c0000000007a328c] dlpar_remove_slot+0x15c/0x250
> [c0000002879e3c50] [c0000000007a348c] remove_slot_store+0xac/0xf0
> [c0000002879e3cd0] [c000000000d64220] kobj_attr_store+0x30/0x60
> [c0000002879e3cf0] [c0000000004ff13c] sysfs_kf_write+0x6c/0xa0
> [c0000002879e3d10] [c0000000004fde4c] kernfs_fop_write+0x18c/0x260
> [c0000002879e3d60] [c000000000410f3c] __vfs_write+0x3c/0x70
> [c0000002879e3d80] [c000000000415408] vfs_write+0xc8/0x250
> [c0000002879e3dd0] [c0000000004157dc] ksys_write+0x7c/0x120
> [c0000002879e3e20] [c00000000000b278] system_call+0x5c/0x68
> 
> Further, since the refcount was always zero the iommu_tce_table_put()
> fails to call the iommu_table release function resulting in a leak.
> 
> Fix this issue be initilizing the iommu_table kref immediately after
> allocation.
> 
> Fixes: e5afdf9dd515 ("powerpc/vfio_spapr_tce: Add reference counting to iommu_table")
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/aff8c8242bc638ba57247ae1ec5f272ac3ed3b92

cheers
