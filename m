Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E48C36A871A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 17:44:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSH4c5p3kz3cfd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 03:44:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C1V38pM6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C1V38pM6;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSH3l0swZz3cMJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 03:43:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 84F82B81223;
	Thu,  2 Mar 2023 16:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDEFC4339B;
	Thu,  2 Mar 2023 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677775406;
	bh=/3EG9mCgYljy/AeNWULKubu7iLxYcPdrWpi0iqQTytY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C1V38pM6W0R0c4lmN/gk2Mx8h/SqlsjawPWMlCSIv8hZ9pB/m7y0UzuDUVuLP/OFe
	 CExGzW77LyaF8WISi8o3nE7QTvY+XLe1fx22+jLoEMI9pBSE6a3xVBqcz3xIN7WTRy
	 YycmUDrVoA73rZeiT8jdUoh7R02yjc421jVDD+c3vPumzHioshg/naG6t/75sTQmKQ
	 XnHhugdZq143WrmcNLLjeTfpAVC75ISekxuGCzKaHQxUTEed3l+bD6q4ofU37hXO94
	 4QFlZgzfncjEBLKT15uWJkU0v5OjaW+KkvjMVUgWOJGxhaQEjHUxrxvE/Z/55jNt6j
	 EQdf9k+nbJybg==
Date: Thu, 2 Mar 2023 09:43:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/2] powerpc/64: Use -mtune=pwr10/9/8 for clang
Message-ID: <20230302164324.GB3010526@dev-arch.thelio-3990X>
References: <20230302131656.50626-1-mpe@ellerman.id.au>
 <20230302131656.50626-2-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302131656.50626-2-mpe@ellerman.id.au>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Thanks for the workaround and sorry this has come to bite us :/

On Fri, Mar 03, 2023 at 12:16:56AM +1100, Michael Ellerman wrote:
> For the -mtune option clang doesn't accept power10/9/8, instead it
> accepts pwr10/9/8. That will be fixed in future versions of clang, but
> the kernel must support the clang versions in the wild.
> 
> So add support for the "pwr" spelling if clang is in use.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>

I think that should actually be

Reported-by: Nick Desaulniers <ndesaulniers@google.com>

> BugLink: https://github.com/ClangBuiltLinux/linux/issues/1799
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/platforms/Kconfig.cputype | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> Need to confirm the clang <= 16 statement is correct.

Currently, this is indeed the case. It is possible that Nemanja's patch
will get applied to release/16.x before 16.0.0 final but it might not.
We can always update it later. I think we do want to push to get that
patch applied because I forgot that it is only in 16.0.0 that '-mtune'
starts to do something on PowerPC:

https://github.com/llvm/llvm-project/commit/1dc26b80b872a94c581549a21943756a8c3448a3

Prior to that change, '-mtune' was accepted but did nothing. It is only
once it was hooked up to the backend that we got the spew of warnings. I
think that warrants us trying to get Nemanja's patch into 16.0.0, which
may allow us to drop this workaround altogether...

> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 7d7477b73951..e4e0e81be7de 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -278,6 +278,10 @@ config TUNE_CPU
>  	default "-mtune=power10" if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power10)
>  	default "-mtune=power9"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power9)
>  	default "-mtune=power8"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power8)
> +	# clang <= 16 only supports the "pwr" names
> +	default "-mtune=pwr10"   if POWERPC64_CPU && CC_IS_CLANG && $(cc-option,-mtune=pwr10)
> +	default "-mtune=pwr9"    if POWERPC64_CPU && CC_IS_CLANG && $(cc-option,-mtune=pwr9)
> +	default "-mtune=pwr8"    if POWERPC64_CPU && CC_IS_CLANG && $(cc-option,-mtune=pwr8)
>  
>  config PPC_BOOK3S
>  	def_bool y
> -- 
> 2.39.2
> 
