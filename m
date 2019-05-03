Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A331291D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:53:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPWH3DfCzDqml
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:52:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKZ5hQ9zDqQ0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKY110Nz9sPY; Fri,  3 May 2019 16:59:28 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c9e0fc33b8be52a7134ed0ee79b6a1e332e1b9d0
X-Patchwork-Hint: ignore
In-Reply-To: <20190430182739.21961-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>, aneesh.kumar@linux.ibm.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: remove the __kernel_io_end export
Message-Id: <44wNKY110Nz9sPY@ozlabs.org>
Date: Fri,  3 May 2019 16:59:28 +1000 (AEST)
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

On Tue, 2019-04-30 at 18:27:39 UTC, Christoph Hellwig wrote:
> This export was added in this merge window, but without any actual
> user, or justification for a modular user.
> 
> Fixes: a35a3c6f6065 ("powerpc/mm/hash64: Add a variable to track the end of IO mapping")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c9e0fc33b8be52a7134ed0ee79b6a1e3

cheers
