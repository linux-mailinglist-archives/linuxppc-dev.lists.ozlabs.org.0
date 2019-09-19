Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC7BB779E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 12:42:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YthS4zX2zF4rw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 20:42:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YtKR5y4HzF4XX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 20:25:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46YtKQ5srVz9sPT; Thu, 19 Sep 2019 20:25:45 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b4d37a7b6934c0c16930c73f43c08e9a6af22f1a
In-Reply-To: <20190903165147.11099-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>, paulus@samba.org, benh@kernel.crashing.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/powernv: remove the unused
 pnv_npu_try_dma_set_bypass function
Message-Id: <46YtKQ5srVz9sPT@ozlabs.org>
Date: Thu, 19 Sep 2019 20:25:45 +1000 (AEST)
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

On Tue, 2019-09-03 at 16:51:47 UTC, Christoph Hellwig wrote:
> Neither pnv_npu_try_dma_set_bypass nor the pnv_npu_dma_set_32 and
> pnv_npu_dma_set_bypass helpers called by it are used anywhere in the
> kernel tree, so remove them.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/b4d37a7b6934c0c16930c73f43c08e9a6af22f1a

cheers
