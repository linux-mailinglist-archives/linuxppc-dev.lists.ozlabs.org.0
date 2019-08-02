Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B228C7EA5A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 04:33:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460B6j45hqzDql6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 12:33:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460B0l3G1fzDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 12:28:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 460B0l2PCPz9sML; Fri,  2 Aug 2019 12:28:23 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d7e23b887f67178c4f840781be7a6aa6aeb52ab1
In-Reply-To: <da89670093651437f27d2975224712e0a130b055.1564552796.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kasan: fix early boot failure on PPC32
Message-Id: <460B0l2PCPz9sML@ozlabs.org>
Date: Fri,  2 Aug 2019 12:28:23 +1000 (AEST)
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

On Wed, 2019-07-31 at 06:01:42 UTC, Christophe Leroy wrote:
> Due to commit 4a6d8cf90017 ("powerpc/mm: don't use pte_alloc_kernel()
> until slab is available on PPC32"), pte_alloc_kernel() cannot be used
> during early KASAN init.
> 
> Fix it by using memblock_alloc() instead.
> 
> Reported-by: Erhard F. <erhard_f@mailbox.org>
> Fixes: 2edb16efc899 ("powerpc/32: Add KASAN support")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/d7e23b887f67178c4f840781be7a6aa6aeb52ab1

cheers
