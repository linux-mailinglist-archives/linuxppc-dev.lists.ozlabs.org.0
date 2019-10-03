Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A385CB226
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 01:09:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kpc25b23zDqcK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 09:09:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kpWr6wlJzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 09:05:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46kpWr3kTYz9sPp; Fri,  4 Oct 2019 09:05:44 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 8996ae8f05a1cc5559120aaec36183edb9c68c50
In-Reply-To: <20190930101342.36c1afa0@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Message-Id: <46kpWr3kTYz9sPp@ozlabs.org>
Date: Fri,  4 Oct 2019 09:05:44 +1000 (AEST)
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-09-30 at 00:13:42 UTC, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc64
> allnoconfig) failed like this:
> 
> arch/powerpc/mm/book3s64/pgtable.c: In function 'flush_partition':
> arch/powerpc/mm/book3s64/pgtable.c:216:3: error: implicit declaration of fu=
> nction 'radix__flush_all_lpid_guest'; did you mean 'radix__flush_all_lpid'?=
>  [-Werror=3Dimplicit-function-declaration]
>   216 |   radix__flush_all_lpid_guest(lpid);
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |   radix__flush_all_lpid
> 
> Caused by commit
> 
>   99161de3a283 ("powerpc/64s/radix: tidy up TLB flushing code")
> 
> radix__flush_all_lpid_guest() is only declared for CONFIG_PPC_RADIX_MMU
> which is not set for this build.
> 
> I am not sure why this did not show up earlier (maybe a Kconfig
> change?).
> 
> I added the following hack for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 30 Sep 2019 10:09:17 +1000
> Subject: [PATCH] powerpc/64s/radix: fix for "tidy up TLB flushing code" and
>  !CONFIG_PPC_RADIX_MMU
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/8996ae8f05a1cc5559120aaec36183edb9c68c50

cheers
