Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBB3123E4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 05:12:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d1nZ2ZttzDqF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 15:12:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d1cl6GgHzDqLL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 15:05:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47d1ck6pJpz9sR0; Wed, 18 Dec 2019 15:05:10 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 0601546f23fb70d84b807e73cfe8e789d054c98d
In-Reply-To: <56648921986a6b3e7315b1fbbf4684f21bd2dea8.1576310997.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/8xx: fix bogus __init on mmu_mapin_ram_chunk()
Message-Id: <47d1ck6pJpz9sR0@ozlabs.org>
Date: Wed, 18 Dec 2019 15:05:10 +1100 (AEDT)
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

On Sat, 2019-12-14 at 08:10:29 UTC, Christophe Leroy wrote:
> Remove __init qualifier for mmu_mapin_ram_chunk() as it is called by
> mmu_mark_initmem_nx() and mmu_mark_rodata_ro() which are not __init
> functions.
> 
> At the same time, mark it static as it is only used in this file.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: a2227a277743 ("powerpc/32: Don't populate page tables for block mapped pages except on the 8xx")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/0601546f23fb70d84b807e73cfe8e789d054c98d

cheers
