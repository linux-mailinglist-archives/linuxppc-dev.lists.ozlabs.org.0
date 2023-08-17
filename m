Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C210177FE0C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 20:44:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T+jlv3pi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRYnR5hddz3cNW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 04:44:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T+jlv3pi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRYmb0gmmz3c2y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 04:43:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A3E416171B;
	Thu, 17 Aug 2023 18:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870FFC433C8;
	Thu, 17 Aug 2023 18:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692297804;
	bh=s+FzHkTZ7+/nW6qy/nbs3G+I2zrdi33vjcZOKl+Q+hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+jlv3pikyACaX5+5tYE0q05lEhoQfHk86P1UDmp9AsD/2vlUHk7uH1BGH7ByFuqa
	 YL5U1O9Fn2ywEeDQ57nNINNwUsrWKPZTomZd++JYV0p99OswFKJdBBnEAbCZRC7z4V
	 EC/CjxnCAeRHNFgKxyIzw+5NZX+jbmjjiAh4Q1pPsq8w7T6Uz60m2m137qzh1XXIX7
	 Ns5iYVtvJhFuYlXT5yzLp/3+DTce4q7PmvWUasW9npOtCfV7TGwXqTUDaHdatGwuXr
	 WWAyv+/kCJASktTurxIp17IuknhhgjhXufCCG64jjnyk7b0PESpj9qGZUqyOhT/wV1
	 +pHGVRvytH/yw==
Date: Thu, 17 Aug 2023 11:43:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ndesaulniers@google.com
Subject: Re: [PATCH] Revert "powerpc/xmon: Relax frame size for clang"
Message-ID: <20230817184321.GA2428970@dev-arch.thelio-3990X>
References: <20230817-ppc_xmon-v1-1-8cc2d51b9995@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817-ppc_xmon-v1-1-8cc2d51b9995@google.com>
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
Cc: llvm@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 17, 2023 at 11:11:56AM -0700, ndesaulniers@google.com wrote:
> This reverts commit 9c87156cce5a63735d1218f0096a65c50a7a32aa.
> 
> I have not been able to reproduce the reported -Wframe-larger-than=
> warning (or disassembly) with clang-11 or clang-18.
> 
> I don't know precisely when this was fixed in llvm, but it may be time
> to revert this.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/252
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/xmon/Makefile | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> index d334de392e6c..7705aa74a24d 100644
> --- a/arch/powerpc/xmon/Makefile
> +++ b/arch/powerpc/xmon/Makefile
> @@ -10,12 +10,6 @@ KCSAN_SANITIZE := n
>  # Disable ftrace for the entire directory
>  ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
>  
> -ifdef CONFIG_CC_IS_CLANG
> -# clang stores addresses on the stack causing the frame size to blow
> -# out. See https://github.com/ClangBuiltLinux/linux/issues/252
> -KBUILD_CFLAGS += -Wframe-larger-than=4096
> -endif
> -
>  ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
>  
>  obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o
> 
> ---
> base-commit: 16931859a6500d360b90aeacab3b505a3560a3ed
> change-id: 20230817-ppc_xmon-d288d803610e
> 
> Best regards,
> -- 
> Nick Desaulniers <ndesaulniers@google.com>
> 
