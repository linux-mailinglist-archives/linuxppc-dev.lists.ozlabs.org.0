Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0CD12904
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:42:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPGg071SzDqZN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:42:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKR6S6yzDqQB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKR4m2Pz9sNC; Fri,  3 May 2019 16:59:23 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 5ba666d56c4ff9b011c1b029dcc689cff8b176fb
X-Patchwork-Hint: ignore
In-Reply-To: <3814377306ac3acdd404e2f23ff05dcf7e6bee26.1556202029.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, aneesh.kumar@linux.ibm.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 01/11] powerpc/mm: fix erroneous duplicate
 slb_addr_limit init
Message-Id: <44wNKR4m2Pz9sNC@ozlabs.org>
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

On Thu, 2019-04-25 at 14:29:27 UTC, Christophe Leroy wrote:
> Commit 67fda38f0d68 ("powerpc/mm: Move slb_addr_linit to
> early_init_mmu") moved slb_addr_limit init out of setup_arch().
> 
> Commit 701101865f5d ("powerpc/mm: Reduce memory usage for mm_context_t
> for radix") brought it back into setup_arch() by error.
> 
> This patch reverts that erroneous regress.
> 
> Fixes: 701101865f5d ("powerpc/mm: Reduce memory usage for mm_context_t for radix")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Patches 1-10 applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/5ba666d56c4ff9b011c1b029dcc689cf

cheers
