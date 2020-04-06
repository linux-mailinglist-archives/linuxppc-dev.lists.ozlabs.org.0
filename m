Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F02D019F721
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 15:41:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wsBR5gJKzDrCv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 23:41:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wrPv3x1MzDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 23:05:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48wrPp3nXMz9sSJ; Mon,  6 Apr 2020 23:05:47 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 54fc3c681ded9437e4548e2501dc1136b23cfa9a
In-Reply-To: <20200331012338.23773-1-aik@ozlabs.ru>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH kernel] powerpc/pseries/ddw: Extend upper limit for huge
 DMA window for persistent memory
Message-Id: <48wrPp3nXMz9sSJ@ozlabs.org>
Date: Mon,  6 Apr 2020 23:05:47 +1000 (AEST)
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
Cc: Brian J King <bjking1@us.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-03-31 at 01:23:38 UTC, Alexey Kardashevskiy wrote:
> Unlike normal memory ("memory" compatible type in the FDT),
> the persistent memory ("ibm,pmemory" in the FDT) can be mapped anywhere
> in the guest physical space and it can be used for DMA.
> 
> In order to maintain 1:1 mapping via the huge DMA window, we need to
> know the maximum physical address at the time of the window setup.
> So far we've been looking at "memory" nodes but "ibm,pmemory" does not
> have fixed addresses and the persistent memory may be mapped afterwards.
> 
> Since the persistent memory is still backed with page structs,
> use MAX_PHYSMEM_BITS as the upper limit.
> 
> This effectively disables huge DMA window in LPAR under pHyp if
> persistent memory is present but this is the best we can do.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/54fc3c681ded9437e4548e2501dc1136b23cfa9a

cheers
