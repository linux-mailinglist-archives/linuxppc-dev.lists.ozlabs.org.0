Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5975F6B2339
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 12:40:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXS1H1FRvz3chD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 22:40:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QL7WH7Ft;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXS0K59hwz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 22:40:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QL7WH7Ft;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PXS0K4FJTz4xDq;
	Thu,  9 Mar 2023 22:40:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678362001;
	bh=lEFs2mXOoYv/1nHa+J0wMk77rUOAPbtxErIAgCOmt6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QL7WH7FteinOGlbW/AhWNceQii5xASJNpO6UM1twJtj2IWR63uvzNVCmvQ8xjfG1Q
	 cI+XmSX/mjSz8IvF8HjkcyX2LjO8tN3pHa9lXYY6MfvQEvFOMctC0hH47VqsdNQY5k
	 s0LMcxiyRgLJY69rG95Oo/XQC+PTb/8iGoEQRhcdiwf53BTjjWtu84zdMfXvZsSdbU
	 fQdqVs1Kzdk+MzV48qLh6u3j/ZCjv3JeEgSUSOrpsUJj1KmzUOJh6Y+Z5f5QSxZ3FX
	 tVL2rJDSJU3cjxIbzBtlNu7ilJzkUSx7UCcmt6SYLDnuDxm9nfbb+1hbGlapmNlEpD
	 GSebo8W8Fnx1w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, kvm <kvm@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
In-Reply-To: <8398361.16996856.1678123793664.JavaMail.zimbra@raptorengineeringinc.com>
References: <8398361.16996856.1678123793664.JavaMail.zimbra@raptorengineeringinc.com>
Date: Thu, 09 Mar 2023 22:40:01 +1100
Message-ID: <87bkl2ywz2.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Timothy Pearson <tpearson@raptorengineering.com> writes:
> This patch series reenables VFIO support on POWER systems.  It
> is based on Alexey Kardashevskiys's patch series, rebased and
> successfully tested under QEMU with a Marvell PCIe SATA controller
> on a POWER9 Blackbird host.
>
> Alexey Kardashevskiy (3):
>   powerpc/iommu: Add "borrowing" iommu_table_group_ops
>   powerpc/pci_64: Init pcibios subsys a bit later
>   powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
>     domains

As sent the patches had lost Alexey's authorship (no From: line), I
fixed it up when applying so the first 3 are authored by Alexey.

cheers

> Timothy Pearson (1):
>   Add myself to MAINTAINERS for Power VFIO support
>
>  MAINTAINERS                               |   5 +
>  arch/powerpc/include/asm/iommu.h          |   6 +-
>  arch/powerpc/include/asm/pci-bridge.h     |   7 +
>  arch/powerpc/kernel/iommu.c               | 246 +++++++++++++++++++++-
>  arch/powerpc/kernel/pci_64.c              |   2 +-
>  arch/powerpc/platforms/powernv/pci-ioda.c |  36 +++-
>  arch/powerpc/platforms/pseries/iommu.c    |  27 +++
>  arch/powerpc/platforms/pseries/pseries.h  |   4 +
>  arch/powerpc/platforms/pseries/setup.c    |   3 +
>  drivers/vfio/vfio_iommu_spapr_tce.c       |  96 ++-------
>  10 files changed, 338 insertions(+), 94 deletions(-)
>
> -- 
> 2.30.2
