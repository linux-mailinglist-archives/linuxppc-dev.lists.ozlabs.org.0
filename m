Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D4D1FA907
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 08:44:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mJbJ0WSWzDqgx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 16:44:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mJWw6rMVzDqgp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 16:41:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PP1k5vKe; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49mJWv0wSTz9sR4;
 Tue, 16 Jun 2020 16:41:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592289707;
 bh=iJTDsS6ame+Ky3TXaa4W+AdR7BdwTxwCOXYjQwKjUxw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PP1k5vKeHmTarCtWTnPIlWTyoP4sbjziolrzcisFbc0FLJK/kMjbWaSbiZtgHH71W
 2pTR1bqJn8XypW74uR2vGT/bHXWbOzI86OCT/XsAIB7kH4/U4J9mR3ZP6wUPZlr+xY
 Z3eIn2qKMQaH7qDFixGsdcyIVeDg/Asd2usTO0D3+6XfAv3j2R4FYmPkLLWnGPGa2O
 NKZHjXEKEszNrl0ZtKDtaJrlwqnWbyqHkSntCJdQlAOXASQ/o/giP18VcAsFHjeKXl
 zV3TLFYPJV0pb+i9+AuCFxcXxbXpMEUzsqXwsjW8kHl1o+f8U5GuPhBiGCLxxSXXNe
 UGYhp1Von902g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/ptdump: Fix build failure in hashpagetable.c
In-Reply-To: <795158fc1d2b3dff3bf7347881947a887ea9391a.1592227105.git.christophe.leroy@csgroup.eu>
References: <795158fc1d2b3dff3bf7347881947a887ea9391a.1592227105.git.christophe.leroy@csgroup.eu>
Date: Tue, 16 Jun 2020 16:42:11 +1000
Message-ID: <87tuzbecl8.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> H_SUCCESS is only defined when CONFIG_PPC_PSERIES is defined.

It's always defined in hvcall.h, but it doesn't always get included via
plpar_wrappers.h.

It looks to be CONFIG_SMP=n that causes that, for SMP=y we get a copy
via asm/spinlock.h

> != H_SUCCESS means != 0. Modify the test accordingly.

I guess that's an OK solution.

> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 65e701b2d2a8 ("powerpc/ptdump: drop non vital #ifdefs")
> Cc: stable@vger.kernel.org

I don't think it needs to go to stable, none of the defconfigs hit it,
we don't even really support SMP=n for 64-bit book3s.

cheers

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/ptdump/hashpagetable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
> index a2c33efc7ce8..5b8bd34cd3a1 100644
> --- a/arch/powerpc/mm/ptdump/hashpagetable.c
> +++ b/arch/powerpc/mm/ptdump/hashpagetable.c
> @@ -258,7 +258,7 @@ static int pseries_find(unsigned long ea, int psize, bool primary, u64 *v, u64 *
>  	for (i = 0; i < HPTES_PER_GROUP; i += 4, hpte_group += 4) {
>  		lpar_rc = plpar_pte_read_4(0, hpte_group, (void *)ptes);
>  
> -		if (lpar_rc != H_SUCCESS)
> +		if (lpar_rc)
>  			continue;
>  		for (j = 0; j < 4; j++) {
>  			if (HPTE_V_COMPARE(ptes[j].v, want_v) &&
> -- 
> 2.25.0
