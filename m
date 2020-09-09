Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3267F262FBC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 16:26:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmkpc0ZWKzDq5k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 00:26:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjWG0wRBzDqFL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjWF5Pj0z9sVR; Wed,  9 Sep 2020 23:27:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Leonardo Bras <leobras.c@gmail.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Dai <zdai@linux.vnet.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Brian King <brking@linux.vnet.ibm.com>
In-Reply-To: <20200805030455.123024-1-leobras.c@gmail.com>
References: <20200805030455.123024-1-leobras.c@gmail.com>
Subject: Re: [PATCH v5 0/4] Allow bigger 64bit window by removing default DMA
 window
Message-Id: <159965717483.808686.14535897310310541742.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:53 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 5 Aug 2020 00:04:51 -0300, Leonardo Bras wrote:
> There are some devices in which a hypervisor may only allow 1 DMA window
> to exist at a time, and in those cases, a DDW is never created to them,
> since the default DMA window keeps using this resource.
> 
> LoPAR recommends this procedure:
> 1. Remove the default DMA window,
> 2. Query for which configs the DDW can be created,
> 3. Create a DDW.
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/pseries/iommu: Create defines for operations in ibm, ddw-applicable
      https://git.kernel.org/powerpc/c/cac3e629086f1b2e31c87a6c9b0130d29843ae86
[2/4] powerpc/pseries/iommu: Update call to ibm, query-pe-dma-windows
      https://git.kernel.org/powerpc/c/80f0251231131d164eddab78d2b6c1b8e37d0093
[3/4] powerpc/pseries/iommu: Move window-removing part of remove_ddw into remove_dma_window
      https://git.kernel.org/powerpc/c/74d0b3994e147a2b503170b5e02f1d07dc086586
[4/4] powerpc/pseries/iommu: Allow bigger 64bit window by removing default DMA window
      https://git.kernel.org/powerpc/c/8c0d51592f6f0123953633d1ecf21e843fce0bfd

cheers
