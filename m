Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A99051B8A30
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 01:56:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498nxT6S5MzDqbv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 09:56:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498nqn0ZpkzDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 09:51:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 498nqm63yRz9sSg; Sun, 26 Apr 2020 09:51:16 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: feb8e960d780e170e992a70491eec9dd68f4dbf2
In-Reply-To: <540242f7d4573f7cdf1b3bf46bb35f743b2cd68f.1587124651.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/mm: Fix CONFIG_PPC_KUAP_DEBUG on PPC32
Message-Id: <498nqm63yRz9sSg@ozlabs.org>
Date: Sun, 26 Apr 2020 09:51:16 +1000 (AEST)
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

On Fri, 2020-04-17 at 11:58:36 UTC, Christophe Leroy wrote:
> CONFIG_PPC_KUAP_DEBUG is not selectable because it depends on PPC_32
> which doesn't exists.
> 
> Fixing it leads to a deadlock due to a vital register getting
> clobbered in _switch().
> 
> Change dependency to PPC32 and use r0 instead of r4 in _switch()
> 
> Fixes: e2fb9f544431 ("powerpc/32: Prepare for Kernel Userspace Access Protection")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/feb8e960d780e170e992a70491eec9dd68f4dbf2

cheers
