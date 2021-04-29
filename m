Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADBF36EBCA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:02:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHJC1hNNz30D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:02:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHHt6d11z2xfY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:18 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHHs754mz9sXM; Fri, 30 Apr 2021 00:02:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210301063653.51003-1-aik@ozlabs.ru>
References: <20210301063653.51003-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2] powerpc/iommu: Annotate nested lock for lockdep
Message-Id: <161970488550.4033873.235569973862535887.b4-ty@ellerman.id.au>
Date: Fri, 30 Apr 2021 00:01:25 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 1 Mar 2021 17:36:53 +1100, Alexey Kardashevskiy wrote:
> The IOMMU table is divided into pools for concurrent mappings and each
> pool has a separate spinlock. When taking the ownership of an IOMMU group
> to pass through a device to a VM, we lock these spinlocks which triggers
> a false negative warning in lockdep (below).
> 
> This fixes it by annotating the large pool's spinlock as a nest lock
> which makes lockdep not complaining when locking nested locks if
> the nest lock is locked already.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/iommu: Annotate nested lock for lockdep
      https://git.kernel.org/powerpc/c/cc7130bf119add37f36238343a593b71ef6ecc1e

cheers
