Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E203112905
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:43:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPJ13X7bzDqNS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:43:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKS2bC6zDqQh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKS0PfWz9s9y; Fri,  3 May 2019 16:59:23 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a521c44c3ded9fe184c5de3eed3a442af2d26f00
X-Patchwork-Hint: ignore
In-Reply-To: <11addb677de7449523fd0023a9ca43b8898c207a.1556258135.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, aneesh.kumar@linux.ibm.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 03/17] powerpc/book3e: drop mmu_get_tsize()
Message-Id: <44wNKS0PfWz9s9y@ozlabs.org>
Date: Fri,  3 May 2019 16:59:23 +1000 (AEST)
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

On Fri, 2019-04-26 at 05:59:38 UTC, Christophe Leroy wrote:
> This function is not used anymore, drop it.
> 
> Fixes: b42279f0165c ("powerpc/mm/nohash: MM_SLICE is only used by book3s 64")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Patches 3-17 applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a521c44c3ded9fe184c5de3eed3a442a

cheers
