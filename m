Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D1E22252F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:20:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6xHQ4tsdzDqNV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:20:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQB6SfkzDqlY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vQ4596Jz9sVd; Thu, 16 Jul 2020 22:56:12 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200705133557.443607-1-oohall@gmail.com>
References: <20200705133557.443607-1-oohall@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/powernv: Make pnv_pci_sriov_enable() and
 friends static
Message-Id: <159490400643.3805857.6624760376298129538.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:12 +1000 (AEST)
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 5 Jul 2020 23:35:56 +1000, Oliver O'Halloran wrote:
> The kernel test robot noticed these are non-static which causes Clang to
> print some warnings. These are called via ppc_md function pointers so
> there's no need for them to be non-static.

Applied to powerpc/next.

[1/2] powerpc/powernv: Make pnv_pci_sriov_enable() and friends static
      https://git.kernel.org/powerpc/c/93eacd94e09db2b1bb0343f8115385e5c34abf0a
[2/2] powerpc/powernv: Move pnv_ioda_setup_bus_dma under CONFIG_IOMMU_API
      https://git.kernel.org/powerpc/c/e3417faec526cbf97773dca691dcd743f5bfeb64

cheers
