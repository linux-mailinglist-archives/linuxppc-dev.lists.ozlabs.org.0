Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F9C9DCCF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 06:50:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hbys3zx3zDqsD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 14:50:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hbx60YhQzDqlS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 14:48:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Hbx52WCgz9s00;
 Tue, 27 Aug 2019 14:48:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel v2 4/4] powerpc/powernv/ioda: Remove obsolete
 iommu_table_ops::exchange callbacks
In-Reply-To: <20190826061705.92048-5-aik@ozlabs.ru>
References: <20190826061705.92048-1-aik@ozlabs.ru>
 <20190826061705.92048-5-aik@ozlabs.ru>
Date: Tue, 27 Aug 2019 14:48:41 +1000
Message-ID: <87mufv2oye.fsf@concordia.ellerman.id.au>
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
Cc: kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> As now we have xchg_no_kill/tce_kill, these are not used anymore so
> remove them.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  arch/powerpc/include/asm/iommu.h          | 10 -----
>  arch/powerpc/kernel/iommu.c               | 26 +-----------
>  arch/powerpc/platforms/powernv/pci-ioda.c | 50 -----------------------
>  3 files changed, 1 insertion(+), 85 deletions(-)

This doesn't build:

arch/powerpc/platforms/pseries/iommu.c:652:3: error: 'struct iommu_table_ops' has no member named 'exchange'
  .exchange = tce_exchange_pseries,
   ^~~~~~~~
arch/powerpc/platforms/pseries/iommu.c:652:14: error: initialization of 'int (*)(struct iommu_table *, long int,  long unsigned int *, enum dma_data_direction *, bool)' {aka 'int (*)(struct iommu_table *, long int,  long unsigned int *, enum dma_data_direction *, _Bool)'} from incompatible pointer type 'int (*)(struct iommu_table *, long int,  long unsigned int *, enum dma_data_direction *)' [-Werror=incompatible-pointer-types]
  .exchange = tce_exchange_pseries,
              ^~~~~~~~~~~~~~~~~~~~

cheers
