Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE04C12936
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:57:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPc02LynzDqDs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:57:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKc4CNqzDqQ0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKb2wTjz9sBb; Fri,  3 May 2019 16:59:31 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 5f18cbdbdd42b050c51eb9859f8ce43db3f51846
X-Patchwork-Hint: ignore
In-Reply-To: <20190502073947.6481-1-ruscur@russell.cc>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] powerpc/mm/ptdump: Wrap seq_printf() to handle
 NULL pointers
Message-Id: <44wNKb2wTjz9sBb@ozlabs.org>
Date: Fri,  3 May 2019 16:59:31 +1000 (AEST)
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
Cc: Julia.Lawall@lip6.fr, rashmica.g@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-05-02 at 07:39:46 UTC, Russell Currey wrote:
> Lovingly borrowed from the arch/arm64 ptdump code.
> 
> This doesn't seem to be an issue in practice, but is necessary for my
> upcoming commit.
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/5f18cbdbdd42b050c51eb9859f8ce43d

cheers
