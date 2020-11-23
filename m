Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FBE2BFFB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 06:46:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CfbkT6YvMzDqN3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 16:46:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfbhX5zmSzDqKv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 16:45:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hNLe2ztR; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CfbhX1Wjrz9s0b;
 Mon, 23 Nov 2020 16:44:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606110300;
 bh=JCWT/BkCaLR69CmasXNkdacTh3raLDAPr1ckx6cXBAI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hNLe2ztRh2I76Vzu1mLqpY4mGNMFJXfX9sAc8GYMlhSLdLkySwWLlSYeH7U+Mx1ep
 UCAilbGWp4bkhg+9XNjz9r0WKxfP3msDpCimNMPtFZk+pvDdmFQVTyG2GQQFBDNVfX
 ykVg3GupZi/1dHkR4SoD3KUVUo9vPCReF9ghIvZghMECNmUz2Hv6VQM48uo6aWUj/p
 uwVaUJb5tHDSqrdRVXLzhQt6YVZRBdE6SkHs6VThgZN+NZw8oD8mK0vZ+e1pCiod6j
 FN+GOJtxHwk/juLrLLQ/yIE8fageCS5ojxslmeN4cO9VB8QyRrbuv4IzsXNvMGpAkn
 w1o/pBsYEHuyw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bill Wendling <morbo@google.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 3/3] powerpc/64s: feature: Work around inline asm issues
In-Reply-To: <20201120224034.191382-4-morbo@google.com>
References: <20201118223513.2704722-1-morbo@google.com>
 <20201120224034.191382-1-morbo@google.com>
 <20201120224034.191382-4-morbo@google.com>
Date: Mon, 23 Nov 2020 16:44:56 +1100
Message-ID: <87d0041vaf.fsf@mpe.ellerman.id.au>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bill,

Bill Wendling <morbo@google.com> writes:
> The clang toolchain treats inline assembly a bit differently than
> straight assembly code. In particular, inline assembly doesn't have the
> complete context available to resolve expressions. This is intentional
> to avoid divergence in the resulting assembly code.
>
> We can work around this issue by borrowing a workaround done for ARM,
> i.e. not directly testing the labels themselves, but by moving the
> current output pointer by a value that should always be zero. If this
> value is not null, then we will trigger a backward move, which is
> explicitly forbidden.
>
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
>  arch/powerpc/include/asm/feature-fixups.h | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
> index b0af97add751..f81036518edb 100644
> --- a/arch/powerpc/include/asm/feature-fixups.h
> +++ b/arch/powerpc/include/asm/feature-fixups.h
> @@ -36,6 +36,18 @@ label##2:						\
>  	.align 2;					\
>  label##3:
>  
> +/*
> + * If the .org directive fails, it means that the feature instructions
> + * are smaller than the alternate instructions. This used to be written
> + * as
> + *
> + * .ifgt (label##4b-label##3b) - (label##2b-label##1b)
> + *      .error "Feature section else case larger than body"
> + * .endif
> + *
> + * but clang's assembler complains about the expression being non-absolute
> + * when the code appears in an inline assembly statement.
> + */
>  #define MAKE_FTR_SECTION_ENTRY(msk, val, label, sect)		\
>  label##4:							\
>  	.popsection;						\
> @@ -48,12 +60,9 @@ label##5:							\
>  	FTR_ENTRY_OFFSET label##2b-label##5b;			\
>  	FTR_ENTRY_OFFSET label##3b-label##5b;			\
>  	FTR_ENTRY_OFFSET label##4b-label##5b;			\
> -	.ifgt (label##4b- label##3b)-(label##2b- label##1b);	\
> -	.error "Feature section else case larger than body";	\
> -	.endif;							\
> +	.org . - ((label##4b-label##3b) > (label##2b-label##1b)); \
>  	.popsection;

When I have an oversize alt section this doesn't seem to give me any
error using binutils?

If I hard code:

	.org . - (1);

It fails as expected.

But if I hard code:

	.org . - (1 > 0);

It builds?

cheers
