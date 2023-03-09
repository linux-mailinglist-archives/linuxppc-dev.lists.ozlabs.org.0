Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 104256B2335
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 12:39:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRzj6kJVz3chJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 22:39:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CBZwty3Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRym4gJLz2ypJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 22:38:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CBZwty3Q;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PXRyh09xkz4xDl;
	Thu,  9 Mar 2023 22:38:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678361917;
	bh=TiYrTB9e3gxSfoaCH8f+uTiFsYylfTZ4EDaBxO70Vxk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CBZwty3Q6WJgFrMC511xe+NTyZ9zNysV7WyQ7CuH3BgET+ooM23k3iFpIWRN/zIiI
	 /QzDSMxyn29RLaAnh+fTHfaFiGagieH3JogLhvll3k2qbz2X8GBe0h8mq4YI2Q4/FO
	 0k6WzZzSSqjKy5/B4fgEucTC5nOqabltDbKcM7/kgMe44oHIgq2M6I8w/G6OPEmzVd
	 EJf3V49QT+0JEzXHzuN8rJsDgwHy6tcnk0AWdhDEe8D0KQdrOtYIMBPrY8x9xTcmUZ
	 7kAUyxfwWA9qHdeg99Au7uXTk35i0ejSwQwLfZIkl3QTvQxBvYqJzxWwabFTNnntUr
	 aXM+Is99x+NqQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alex Williamson <alex.williamson@redhat.com>, Timothy Pearson
 <tpearson@raptorengineering.com>
Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
In-Reply-To: <20230306164607.1455ee81.alex.williamson@redhat.com>
References: <8398361.16996856.1678123793664.JavaMail.zimbra@raptorengineeringinc.com>
 <20230306164607.1455ee81.alex.williamson@redhat.com>
Date: Thu, 09 Mar 2023 22:38:33 +1100
Message-ID: <87edpyyx1i.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alex Williamson <alex.williamson@redhat.com> writes:
> On Mon, 6 Mar 2023 11:29:53 -0600 (CST)
> Timothy Pearson <tpearson@raptorengineering.com> wrote:
>
>> This patch series reenables VFIO support on POWER systems.  It
>> is based on Alexey Kardashevskiys's patch series, rebased and
>> successfully tested under QEMU with a Marvell PCIe SATA controller
>> on a POWER9 Blackbird host.
>> 
>> Alexey Kardashevskiy (3):
>>   powerpc/iommu: Add "borrowing" iommu_table_group_ops
>>   powerpc/pci_64: Init pcibios subsys a bit later
>>   powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
>>     domains
>> 
>> Timothy Pearson (1):
>>   Add myself to MAINTAINERS for Power VFIO support
>> 
>>  MAINTAINERS                               |   5 +
>>  arch/powerpc/include/asm/iommu.h          |   6 +-
>>  arch/powerpc/include/asm/pci-bridge.h     |   7 +
>>  arch/powerpc/kernel/iommu.c               | 246 +++++++++++++++++++++-
>>  arch/powerpc/kernel/pci_64.c              |   2 +-
>>  arch/powerpc/platforms/powernv/pci-ioda.c |  36 +++-
>>  arch/powerpc/platforms/pseries/iommu.c    |  27 +++
>>  arch/powerpc/platforms/pseries/pseries.h  |   4 +
>>  arch/powerpc/platforms/pseries/setup.c    |   3 +
>>  drivers/vfio/vfio_iommu_spapr_tce.c       |  96 ++-------
>>  10 files changed, 338 insertions(+), 94 deletions(-)
>> 
>
> For vfio and MAINTAINERS portions,
>
> Acked-by: Alex Williamson <alex.williamson@redhat.com>

Thanks.

cheers
