Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D9411896
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 17:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCpmx4smTz2ywV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 01:45:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NQfTBETI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NQfTBETI; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCpmF0QyTz2xvf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 01:45:17 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A27E761159;
 Mon, 20 Sep 2021 15:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632152713;
 bh=EC+9dyajYM2OPNtBQsJoiGoRd9MZ5dbX2yOO9/Uoq6U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQfTBETIlpVtKbA/+UDc+h1Ycdfi45SAPzATlwtFJTjYsBq6Mc3UvwPR2UUgVqSPq
 xMXRQo1l8idyhR9VJ30vQYai5gQlAlgRocso5YwY4Vcp9vzACHWjMQ3DDxSY762Zoa
 AIaqdF8h2C2XItW7pFDb/SjOj+f6fgKw7Ox/Nw/YJW/i6ZyOdiGkbruY6Ls6Z6VNBx
 g/AaCCjaTcD21MCKHy4OQH0nDr6o23qJlVRtwvqrcV7uNhudKLLt5z9KImL0KiPZJa
 APYEnZkJhTzK2mQVdHruVNHCkizkjfvMiP9HQ/PR1iX6fW3O1Z2fvNouaPyCv3RXJo
 8YN/X+jF8hiuw==
Date: Mon, 20 Sep 2021 08:45:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH v3] lib/zlib_inflate/inffast: Check config in C to avoid
 unused function warning
Message-ID: <YUishGbHeaDMJDj+@archlinux-ax161>
References: <20210920084332.5752-1-pmenzel@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920084332.5752-1-pmenzel@molgen.mpg.de>
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
Cc: llvm@lists.linux.dev, Zhen Lei <thunder.leizhen@huawei.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 20, 2021 at 10:43:33AM +0200, Paul Menzel wrote:
> Building Linux for ppc64le with Ubuntu clang version 12.0.0-3ubuntu1~21.04.1
> shows the warning below.
> 
>     arch/powerpc/boot/inffast.c:20:1: warning: unused function 'get_unaligned16' [-Wunused-function]
>     get_unaligned16(const unsigned short *p)
>     ^
>     1 warning generated.
> 
> Fix it, by moving the check from the preprocessor to C, so the compiler
> sees the use.
> 
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
> v2: Use IS_ENABLED
> v3: Use if statement over ternary operator as requested by Christophe
> 
>  lib/zlib_inflate/inffast.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/zlib_inflate/inffast.c b/lib/zlib_inflate/inffast.c
> index f19c4fbe1be7..2843f9bb42ac 100644
> --- a/lib/zlib_inflate/inffast.c
> +++ b/lib/zlib_inflate/inffast.c
> @@ -253,13 +253,12 @@ void inflate_fast(z_streamp strm, unsigned start)
>  
>  			sfrom = (unsigned short *)(from);
>  			loops = len >> 1;
> -			do
> -#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> -			    *sout++ = *sfrom++;
> -#else
> -			    *sout++ = get_unaligned16(sfrom++);
> -#endif
> -			while (--loops);
> +			do {
> +			    if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
> +				*sout++ = *sfrom++;
> +			    else
> +				*sout++ = get_unaligned16(sfrom++);
> +			} while (--loops);
>  			out = (unsigned char *)sout;
>  			from = (unsigned char *)sfrom;
>  		    } else { /* dist == 1 or dist == 2 */
> -- 
> 2.33.0
> 
