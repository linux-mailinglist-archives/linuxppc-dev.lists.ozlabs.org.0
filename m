Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F263F6E9C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 06:55:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvYZm4VH9z3052
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 14:55:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D2Nwdl+Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=D2Nwdl+Z; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvYYY2kgNz2yPB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 14:54:40 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GvYYV4ptyz9sW4;
 Wed, 25 Aug 2021 14:54:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629867279;
 bh=6USkAhJ0oXluViRbqhukVgyp9Ff7O5VeFJemuQn0/z0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=D2Nwdl+ZVgX3SeYJ2ojs0HTtnSjp/ebc7zdM9XMo70wcykh9w69FAZguzIykAggIT
 gP2IjEe2OpeLyOJC1U/IKVmcxeqhXZDL69Tn7QVrvPTTzKIwUotqVshZn48lr0qTzX
 trmBFTGN1Ojx37NzfaEIvLa7SP6LFDJsU6e9dtyKqbTHvoubOhluSK7h0Q7DpmUY32
 b1lLJbGeeVggmb+9YkX4UjsoP+Uh8JH4kYMkZW48AF6iTV2oMmMvwoxx8oUPc5Gnpx
 ooq6Vj+n4kdfga4chsOukErEhGdcsEnwnT9/lc28RHBRqN1sJf8uOwsUCTVJjMcToM
 hXnLapTZCVWMw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 npiggin@gmail.com
Subject: Re: [PATCH v3 3/3] powerpc: Define and use MSR_RI only on non
 booke/40x
In-Reply-To: <627ead32d40c840f9e8a329b60647b649eceb2aa.1629707037.git.christophe.leroy@csgroup.eu>
References: <385ead49ccb66a259b25fee3eebf0bd4094068f3.1629707037.git.christophe.leroy@csgroup.eu>
 <627ead32d40c840f9e8a329b60647b649eceb2aa.1629707037.git.christophe.leroy@csgroup.eu>
Date: Wed, 25 Aug 2021 14:54:32 +1000
Message-ID: <8735qyceev.fsf@mpe.ellerman.id.au>
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
> 40x and BOOKE don't have MSR_RI.
>
> Define MSR_RI only for platforms where it exists. For the other ones,
> defines it as BUILD_BUG for C and do not define it for ASM.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v3: Fixes kvm_emul.S and include <linux/bug.h> in <asm/reg.h>
> ---
>  arch/powerpc/include/asm/reg.h       |  5 +++++
>  arch/powerpc/include/asm/reg_booke.h |  6 +++---
>  arch/powerpc/kernel/head_32.h        |  4 ++++
>  arch/powerpc/kernel/kvm_emul.S       | 13 +++++++++++++
>  arch/powerpc/kernel/process.c        |  2 +-
>  arch/powerpc/lib/sstep.c             |  2 +-
>  6 files changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index be85cf156a1f..b270b570fb51 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -109,7 +109,12 @@
>  #ifndef MSR_PMM
>  #define MSR_PMM		__MASK(MSR_PMM_LG)	/* Performance monitor */
>  #endif
> +#if !defined(CONFIG_BOOKE) && !defined(CONFIG_40x)
>  #define MSR_RI		__MASK(MSR_RI_LG)	/* Recoverable Exception */

This breaks 64-bit BookE, which is using MSR_RI in bookehv_interrupts.S.

eg. ppc64_book3e_allmodconfig gives:

  arch/powerpc/kvm/bookehv_interrupts.S: Assembler messages:
  arch/powerpc/kvm/bookehv_interrupts.S:221: Error: invalid operands (*ABS* and *UND* sections) for `|'
  etc.

ISA v2.07B says MSR_RI is Book3S only, but looking at the e500mc manual
it does have bit 62 defined as RI.

I can fix it with:

+#if !(defined(CONFIG_BOOKE) && !defined(CONFIG_PPC_BOOK3E)) && !defined(CONFIG_40x)
 #define MSR_RI         __MASK(MSR_RI_LG)       /* Recoverable Exception */


But that's getting really ugly, and we'd have to repeat it elsewhere.

I think we need a kconfig symbol that captures which platforms should
use MSR_RI, something like:

  CONFIG PPC_MSR_RI
    def_bool y
    depends on !40x && (!BOOKE || PPC_BOOK3E)


Or maybe we should just define MSR_RI to 0 for platforms that don't use
it, to avoid so much ifdefing?

cheers
