Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0541FC285
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:24:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DGJy2J9ZzF7PM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:24:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxZ15QJzF4xG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:07:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxY1P4Hz9sPL; Thu, 14 Nov 2019 20:07:44 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: f5817191b0a3257d9963a574c53d085d9f443e7d
In-Reply-To: <20190807150752.17894-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>, benh@kernel.crashing.org, paulus@samba.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc: use <asm-generic/dma-mapping.h>
Message-Id: <47DFxY1P4Hz9sPL@ozlabs.org>
Date: Thu, 14 Nov 2019 20:07:44 +1100 (AEDT)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-08-07 at 15:07:52 UTC, Christoph Hellwig wrote:
> The powerpc version of dma-mapping.h only contains a version of
> get_arch_dma_ops that always return NULL.  Replace it with the
> asm-generic version that does the same.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/f5817191b0a3257d9963a574c53d085d9f443e7d

cheers
