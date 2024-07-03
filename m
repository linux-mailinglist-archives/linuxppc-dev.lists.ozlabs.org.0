Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7E6925FF0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 14:15:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sD3GuhqY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDdz058qSz3dX7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 22:15:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sD3GuhqY;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDdyK2rgKz3brC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 22:15:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720008905;
	bh=UxJxwgl5X9xFRRy727u0o88lwP6DZx5C/R3IDsogaPQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sD3GuhqYaStocDQF9XC/h/JF8I8fEfGUPye1q2o6ONwncol7PYAQP84mm7e+D2iWX
	 3DBH4gywHI7nZ2bHBrpxQHEdgVmo6P0lCi2jsjpg/2FwV/LnrBfkx6dGzhRFZgQ35e
	 2WgxxuQtIxEdY1KNqBJoMFuInL2GwAM7pEfKHMYmptNV0WHhJ7YlGnC9TEAKDjFsPk
	 3wlyCiIt3pKGb8zdSYrBp8vtUMDgmbvMGsH5vaiShLGDmYvztE5VM6p+noSd3nd88P
	 ZP5/E/of1VOOMWxd5xhG4rmLgJ+L3nfZ/blIxJmX09euQ2o+tPkl3RUBFRhfsgcrGN
	 myKpyZJVVEl0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDdyK0qQFz4w2Q;
	Wed,  3 Jul 2024 22:15:05 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the powerpc tree with the mm tree
In-Reply-To: <20240703094857.3f489d4f@canb.auug.org.au>
References: <20240703094857.3f489d4f@canb.auug.org.au>
Date: Wed, 03 Jul 2024 22:15:04 +1000
Message-ID: <87cynuk6yf.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the powerpc tree got a conflict in:
>
>   arch/powerpc/mm/nohash/Makefile
>
...
> diff --cc arch/powerpc/mm/nohash/Makefile
> index 90e846f0c46c,86d0fe434824..000000000000
> --- a/arch/powerpc/mm/nohash/Makefile
> +++ b/arch/powerpc/mm/nohash/Makefile
> @@@ -1,8 -1,7 +1,7 @@@
>   # SPDX-License-Identifier: GPL-2.0
>   
>   obj-y				+= mmu_context.o tlb.o tlb_low.o kup.o
>  -obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_low_64e.o book3e_pgtable.o
>  +obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_64e.o tlb_low_64e.o book3e_pgtable.o
> - obj-$(CONFIG_40x)		+= 40x.o
>   obj-$(CONFIG_44x)		+= 44x.o
>   obj-$(CONFIG_PPC_8xx)		+= 8xx.o
>   obj-$(CONFIG_PPC_E500)		+= e500.o

Thanks, looks right.

cheers
