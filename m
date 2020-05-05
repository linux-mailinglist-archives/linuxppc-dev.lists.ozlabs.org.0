Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B3A1C59B0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 16:33:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Gj030hHNzDqf5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 00:33:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ghrz41gdzDqcW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 00:27:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=AYudScwg; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Ghrw1s5zz9sTp;
 Wed,  6 May 2020 00:27:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588688864;
 bh=tKWmkjZzDQuTCUpYsJT44pgEzBrMuLquVBArlnJPTok=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=AYudScwgGeF513DR39+vld/7XBnzPx/RmHX/ZpsMbR2xXEUEL2wuQW4p4g7Kvsisv
 9BkStSD8LskDREEIZEUcnucf5n8bIAP/kQu2rNGVG4fIKIdYaiLi+vc3W32DET/0hz
 5nsmqgrX3/E2FGtgYlYHZLqT5wY+S9qw+8b60lg/xiFk9lQCri05hPLII8zOg03WtG
 PzAzrymQXDPh8UfjPGwC7IuvwSJwXnjW1UDF04L9jrzlQAsxufL0jpsgaVkvW/fPcm
 FkzgDihqutVRnj1lbOzrs8G2my6pLc9rXtAY5CntiQp+YF12WDNjpeIJ+Iwrq2Q2bI
 9B+Cn2SIClkKg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com,
 segher@kernel.crashing.org
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
In-Reply-To: <23e680624680a9a5405f4b88740d2596d4b17c26.1587143308.git.christophe.leroy@c-s.fr>
References: <23e680624680a9a5405f4b88740d2596d4b17c26.1587143308.git.christophe.leroy@c-s.fr>
Date: Wed, 06 May 2020 00:27:58 +1000
Message-ID: <87sggecv81.fsf@mpe.ellerman.id.au>
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

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> unsafe_put_user() is designed to take benefit of 'asm goto'.
>
> Instead of using the standard __put_user() approach and branch
> based on the returned error, use 'asm goto' and make the
> exception code branch directly to the error label. There is
> no code anymore in the fixup section.
>
> This change significantly simplifies functions using
> unsafe_put_user()
>
...
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/include/asm/uaccess.h | 61 +++++++++++++++++++++++++-----
>  1 file changed, 52 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 9cc9c106ae2a..9365b59495a2 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -196,6 +193,52 @@ do {								\
>  })
>  
>  
> +#define __put_user_asm_goto(x, addr, label, op)			\
> +	asm volatile goto(					\
> +		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
> +		EX_TABLE(1b, %l2)				\
> +		:						\
> +		: "r" (x), "m<>" (*addr)				\

The "m<>" here is breaking GCC 4.6.3, which we allegedly still support.

Plain "m" works, how much does the "<>" affect code gen in practice?

A quick diff here shows no difference from removing "<>".

cheers
