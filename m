Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C857912917
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:50:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPST1yf9zDqnk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:50:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKY2ly6zDqQ0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKX3tkmz9sPV; Fri,  3 May 2019 16:59:27 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 8a23fdec3dbdc8bfde6f806d36e773236dab6663
X-Patchwork-Hint: ignore
In-Reply-To: <1103b2c9715bab90d680dcf78303619ff49debd0.1556627571.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3 01/16] powerpc/32: Refactor EXCEPTION entry macros for
 head_8xx.S and head_32.S
Message-Id: <44wNKX3tkmz9sPV@ozlabs.org>
Date: Fri,  3 May 2019 16:59:27 +1000 (AEST)
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

On Tue, 2019-04-30 at 12:38:50 UTC, Christophe Leroy wrote:
> EXCEPTION_PROLOG is similar in head_8xx.S and head_32.S
> 
> This patch creates head_32.h and moves EXCEPTION_PROLOG macro
> into it. It also converts it from a GCC macro to a GAS macro
> in order to ease refactorisation with 40x later, since
> GAS macros allows the use of #ifdef/#else/#endif inside it.
> And it also has the advantage of not requiring the uggly "; \"
> at the end of each line.
> 
> This patch also moves EXCEPTION() and EXC_XFER_XXXX() macros which
> are also similar while adding START_EXCEPTION() out of EXCEPTION().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/8a23fdec3dbdc8bfde6f806d36e77323

cheers
