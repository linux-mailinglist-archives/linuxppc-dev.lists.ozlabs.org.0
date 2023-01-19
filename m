Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D864D674132
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 19:45:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyWm25YLtz3fDT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 05:45:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KVvIxldf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KVvIxldf;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyWl52q4wz3fF2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 05:44:49 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AAECDB826A0;
	Thu, 19 Jan 2023 18:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D091EC433EF;
	Thu, 19 Jan 2023 18:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674153884;
	bh=faXqnVFxCaTO+HtK1xtCzq7sAIRKpPiqBX5y1aM7img=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVvIxldflGICga3EBD5uaWrtAUhoh/WyERGIzSbbuIGRrw6/PseX4Tx1/TlDHTBVj
	 VngIeotz5JNDs5M+U8Q+XSuJF/fGsAUaou+vEHp9wQuqfSnQ8xyP9TPAfYNmjxYO+d
	 6EeGzkl+0fc6OC9Wl5QWvJY8taGwaWkdM07++BbHxAml957M6Rfsvh+6PRKL7I7dP7
	 7tPbGwvVMsV2wQ8alBZDhED5dNbA6g1prHu/pvgSt5E9DQ9zhOk+wcuyfTuKfQlwDA
	 5EhCex68o/NXykbN1N/2xWxoUkkWoa+gdhvgqwO0VJ2gTCu6auDaZkXSH3T3Ghkv45
	 16el007k447Dw==
Date: Thu, 19 Jan 2023 11:44:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
Message-ID: <Y8mPmqDWiRJNdXs/@thelio-3990X>
References: <20230119082447.152020-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119082447.152020-1-masahiroy@kernel.org>
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 19, 2023 at 05:24:47PM +0900, Masahiro Yamada wrote:
> crtsavres.o is linked to modules, but as commit d0e628cd817f ("kbuild:
> doc: clarify the difference between extra-y and always-y") explained,
> 'make modules' does not build extra-y.
> 
> The following command fails:
> 
>   $ make ARCH=powerpc LLVM=1 mrproper ps3_defconfig modules
>     [snip]
>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory
>   make[1]: *** [scripts/Makefile.modfinal:61: arch/powerpc/platforms/cell/spufs/spufs.ko] Error 1
>   make: *** [Makefile:1924: modules] Error 2
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  arch/powerpc/lib/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index c53618c34b70..aa34854bc9f5 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -43,7 +43,7 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
>  # so it is only needed for modules, and only for older linkers which
>  # do not support --save-restore-funcs
>  ifndef CONFIG_LD_IS_BFD
> -extra-$(CONFIG_PPC64)	+= crtsavres.o
> +always-$(CONFIG_PPC64)	+= crtsavres.o
>  endif
>  
>  obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
> -- 
> 2.34.1
> 
