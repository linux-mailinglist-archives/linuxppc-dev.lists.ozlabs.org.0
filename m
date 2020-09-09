Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5734C262F4C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 15:47:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmjy36fZbzDqFD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 23:47:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjVw6SgVzDqF0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjVv64yJz9sVZ; Wed,  9 Sep 2020 23:27:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: hch@infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <50098f49877cea0f46730a9df82dcabf84160e4b.1597384512.git.christophe.leroy@csgroup.eu>
References: <50098f49877cea0f46730a9df82dcabf84160e4b.1597384512.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/4] powerpc: Remove flush_instruction_cache for
 book3s/32
Message-Id: <159965716831.808686.749950598970188021.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:35 +1000 (AEST)
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

On Fri, 14 Aug 2020 05:56:24 +0000 (UTC), Christophe Leroy wrote:
> The only callers of flush_instruction_cache() are:
> 
> arch/powerpc/kernel/swsusp_booke.S:	bl flush_instruction_cache
> arch/powerpc/mm/nohash/40x.c:	flush_instruction_cache();
> arch/powerpc/mm/nohash/44x.c:	flush_instruction_cache();
> arch/powerpc/mm/nohash/fsl_booke.c:	flush_instruction_cache();
> arch/powerpc/platforms/44x/machine_check.c:			flush_instruction_cache();
> arch/powerpc/platforms/44x/machine_check.c:		flush_instruction_cache();
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc: Remove flush_instruction_cache for book3s/32
      https://git.kernel.org/powerpc/c/e426ab39f41045a4c163031272b2f48d944b69c0
[2/4] powerpc: Move flush_instruction_cache() prototype in asm/cacheflush.h
      https://git.kernel.org/powerpc/c/f663f3312051402d32952c44d156a20c0b854753
[3/4] powerpc: Rewrite 4xx flush_cache_instruction() in C
      https://git.kernel.org/powerpc/c/de39b19452e784de5f90ae899851ab29a29bb42c
[4/4] powerpc: Rewrite FSL_BOOKE flush_cache_instruction() in C
      https://git.kernel.org/powerpc/c/704dfe931df951895dea98bd1d9cacbb601b6451

cheers
