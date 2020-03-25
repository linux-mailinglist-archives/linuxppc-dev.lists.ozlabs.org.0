Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8581926E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 12:12:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nQS71CFMzDqDM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 22:12:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPp73mKbzDqlQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:42:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PPAh879i; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48nPp65x6Mz9sR4;
 Wed, 25 Mar 2020 21:42:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585132959;
 bh=MIDM4vlJXdEfVW+ViGJHSFPdc7Mk/IuOQUQ1rBvfuCw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PPAh879iuIuGEf2yGiujeAw6ewMCs3lEi/MG3GEuRkpvFIa5Pg4/t3zaQ3X2MoutK
 I0lilZsHBtLI/jgHQ2fra/KEXkHYkIuVQqZoimwpHDUcTQRI5Hub3TTvXeSGcBxY0q
 rU2q7jz7Gs+en0nIvQsAefrP9IyV5MtzFT+oG8DwrJlGJkB1CTnOTJf//0Wd5tTw4G
 SK60p40ufvlG9+TchDs8eFSAjQS3MljVBaNbJxrAswKhZdKbT02SifcRvfOAy2MjTB
 uyFz/eXghtNm/u3nfmiw9Kv8JqjZSsBhtVqorKefjkPpLzOkPBMUMJaSKUwWF2FfJw
 FV/EsDrwyDeFQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Fangrui Song <maskray@google.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/boot: Delete unneeded .globl _zimage_start
In-Reply-To: <20200325051820.163253-1-maskray@google.com>
References: <20200325051820.163253-1-maskray@google.com>
Date: Wed, 25 Mar 2020 21:42:46 +1100
Message-ID: <87sghwww9l.fsf@mpe.ellerman.id.au>
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
Cc: clang-built-linux@googlegroups.com,
 Nick Desaulniers <ndesaulniers@google.com>, Joel Stanley <joel@jms.id.au>,
 Fangrui Song <maskray@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fangrui Song <maskray@google.com> writes:
> .globl sets the symbol binding to STB_GLOBAL while .weak sets the
> binding to STB_WEAK. They should not be used together. It is accidetal
> rather then intentional that GNU as let .weak override .globl while
> clang integrated assembler let the last win.

> Fixes: cd197ffcf10b "[POWERPC] zImage: Cleanup and improve zImage entry point"
> Fixes: ee9d21b3b358 "powerpc/boot: Ensure _zimage_start is a weak symbol"
> Link: https://github.com/ClangBuiltLinux/linux/issues/937
> Signed-off-by: Fangrui Song <maskray@google.com>

So it seems the patch is OK but people don't agree with the explanation
in the changelog.

Please send a v2 that captures the responses from Segher and Alan.

cheers

> diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
> index 92608f34d312..1d83966f5ef6 100644
> --- a/arch/powerpc/boot/crt0.S
> +++ b/arch/powerpc/boot/crt0.S
> @@ -44,9 +44,6 @@ p_end:		.long	_end
>  p_pstack:	.long	_platform_stack_top
>  #endif
>  
> -	.globl	_zimage_start
> -	/* Clang appears to require the .weak directive to be after the symbol
> -	 * is defined. See https://bugs.llvm.org/show_bug.cgi?id=38921  */
>  	.weak	_zimage_start
>  _zimage_start:
>  	.globl	_zimage_start_lib
> -- 
> 2.25.1.696.g5e7596f4ac-goog
