Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B91F3881E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 23:13:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fl7yY2KDTz30FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 07:13:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jW7Z5QSA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jW7Z5QSA; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fl7y51VHzz2yWs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 07:13:01 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDE79611BF;
 Tue, 18 May 2021 21:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621372378;
 bh=+XwfrEanFh4KN53uNfFPtVzdxotlHS4G0gMOF3X0WWU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jW7Z5QSAQBCRP3CKw+PHGutOzM5iOK9y1tHxZ6wz9E3G9YwJphlNGn4YXcrY5VVvU
 /8G7pnwdxTS8Be9nMmIT4mMf34ma2lXxCrYCifz10pMNCgGPrbq1D3MafdTe0cD180
 thyhN50YhNCqhYek5zhBP7w5KqK9BRQO1b6/QgZFq14s/+WJxLlz1TEmrOYMw25STx
 lwQEf8oR297grjB9ipFruYyE0UgGB830qqXQR6kDeYYSpe/fXNMfZWPiSHYeeOqdeo
 AjjIYQxIbigYb/4UmQ1iZ1QJrJDC6hULdYEy7tg9dN72d4Km1cerHjsoJHVYejXtSB
 pFCddv1n/5rnw==
Subject: Re: [PATCH] powerpc: Kconfig: disable CONFIG_COMPAT for clang < 12
To: Nick Desaulniers <ndesaulniers@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210518205858.2440344-1-ndesaulniers@google.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <fe638f4e-4dea-2f5e-2193-2f8b63aaf7a8@kernel.org>
Date: Tue, 18 May 2021 14:12:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518205858.2440344-1-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/18/2021 1:58 PM, Nick Desaulniers wrote:
> Until clang-12, clang would attempt to assemble 32b powerpc assembler in
> 64b emulation mode when using a 64b target triple with -m32, leading to
> errors during the build of the compat VDSO. Simply disable all of
> CONFIG_COMPAT; users should upgrade to the latest release of clang for
> proper support.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1160
> Link: https://github.com/llvm/llvm-project/commits/2288319733cd5f525bf7e24dece08bfcf9d0ff9e
> Link: https://groups.google.com/g/clang-built-linux/c/ayNmi3HoNdY/m/XJAGj_G2AgAJ
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   arch/powerpc/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index ce3f59531b51..2a02784b7ef0 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -289,6 +289,7 @@ config PANIC_TIMEOUT
>   config COMPAT
>   	bool "Enable support for 32bit binaries"
>   	depends on PPC64
> +	depends on !CC_IS_CLANG || CLANG_VERSION >= 120000
>   	default y if !CPU_LITTLE_ENDIAN
>   	select ARCH_WANT_OLD_COMPAT_IPC
>   	select COMPAT_OLD_SIGACTION
> 

