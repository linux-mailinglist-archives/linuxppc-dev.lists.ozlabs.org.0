Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A651A78B6B0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 19:47:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b6pMM8AP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZJ0q464Mz3by8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 03:47:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b6pMM8AP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZHzx0tHkz2xdf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 03:46:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0DA863D70;
	Mon, 28 Aug 2023 17:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47BCC433CC;
	Mon, 28 Aug 2023 17:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693244793;
	bh=rqIgUEJ2gFNDPW2upRgvZqXnuhfLL6A/8Oy8KbEhK4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b6pMM8AP7WAcW0DNuOjVIwOpbQKp0udmz2MPGL4OU24kjJSoblFbwTFvc9NL3kPF6
	 vuEp7gsbBr02Aw1u3QfqhUP1MwmxHH5dAMy2i0BbwQJT8nmUy0KPys/Ss9fs9hXzMI
	 HhkFpPLQ+N+memByUvgZa2aABT7+wtS/orJw+8nhT4eQi8pTC4YRkKBE2FE/gjumKD
	 LpiHqqOaBuLFA7ESXjZT/RQ758nOSoQuogWyFr72yb4BSgibQVPGcJ3huO4YACaU7I
	 pxLZnhYsDu40Baj+ilZaJ17edxzq08FoRbHflsv4Yqru4lMbEiST/PGMgvXwmtKN5q
	 g+5DkhOy8+dNQ==
Date: Mon, 28 Aug 2023 10:46:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ndesaulniers@google.com
Subject: Re: [PATCH] Revert "Revert "powerpc/xmon: Relax frame size for
 clang""
Message-ID: <20230828174631.GA1255864@dev-arch.thelio-3990X>
References: <20230828-ppc_rerevert-v1-1-74f55b818907@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828-ppc_rerevert-v1-1-74f55b818907@google.com>
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
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 28, 2023 at 10:35:26AM -0700, ndesaulniers@google.com wrote:
> This reverts commit 7f3c5d099b6f8452dc4dcfe4179ea48e6a13d0eb.
> 
> Turns out that this is reproducible still under specific compiler
> versions (mea culpa: I did not test every supported version of clang),
> and even a few randconfigs bots found.
> 
> We'll have to revisit this again in the future, for now back this out.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/252#issuecomment-1690371256
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/llvm/202308260344.Vc4Giuk7-lkp@intel.com/
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

I know this is just a straight reapplication of the original workaround
but could we use ccflags here instead of KBUILD_CFLAGS (with it placed
after the NO_MIMINAL_TOC assignment)?

  # clang stores addresses on the stack causing the frame size to blow
  # out. See https://github.com/ClangBuiltLinux/linux/issues/252
  ccflags-$(CONFIG_CC_IS_CLANG) += -Wframe-larger-than=4096

The addition to KBUILD_CFLAGS makes me think this flags will get applied
to the rest of the kernel but I have not actually verified.

Regardless:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Side note, seems like b4 is still doing the thing with "From:".

> ---
>  arch/powerpc/xmon/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> index 7705aa74a24d..d334de392e6c 100644
> --- a/arch/powerpc/xmon/Makefile
> +++ b/arch/powerpc/xmon/Makefile
> @@ -10,6 +10,12 @@ KCSAN_SANITIZE := n
>  # Disable ftrace for the entire directory
>  ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
>  
> +ifdef CONFIG_CC_IS_CLANG
> +# clang stores addresses on the stack causing the frame size to blow
> +# out. See https://github.com/ClangBuiltLinux/linux/issues/252
> +KBUILD_CFLAGS += -Wframe-larger-than=4096
> +endif
> +
>  ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
>  
>  obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o
> 
> ---
> base-commit: 2ee82481c392eec06a7ef28df61b7f0d8e45be2e
> change-id: 20230828-ppc_rerevert-647427f04ce1
> 
> Best regards,
> -- 
> Nick Desaulniers <ndesaulniers@google.com>
> 
