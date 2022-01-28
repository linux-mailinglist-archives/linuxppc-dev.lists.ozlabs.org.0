Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFA649FC63
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 16:03:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlghH6lnbz3bct
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 02:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TAf70PRY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TAf70PRY; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jlggd3t51z30Kn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 02:03:09 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 47807B8260D;
 Fri, 28 Jan 2022 15:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428DFC340E6;
 Fri, 28 Jan 2022 15:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643382183;
 bh=8977n+KmEj7ReKrjHl1AOxf+fEeuIQ9yNfDB243E+VA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TAf70PRYBmouertX+8zGnt2OA3GOBrW9BKCpiTUx/FKHWD8ko5NU1Vh8QZNSaxIwb
 sB0InlJEntDtGxIJ4eeYMQCU8lro++RobJOjjiEvmxbnmNuQIqxDXYt8gOJ0jscXHw
 20aCKTLze0angQC074KZ8UKsg8Bu1tWavkoh0PxIYHT3qP+dLUM4HgchtUw7Jde4uG
 YKI+rDpnRCEBU8jJXzr+Cuy4RqV/RPLTwPRVyKG8pLNqEo/bxwcTbjvb2NW8asttuE
 BbXtKU8q3bRr9/sxWMA4m11Da4Ngdxry+oRzte9AU4thAGc1Ht26yOJn0gfjiW137D
 CHxtGdTxCj+Dg==
Date: Fri, 28 Jan 2022 08:02:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCHv3] powerpc: mm: radix_tlb: rearrange the if-else block
Message-ID: <YfQFom4xDcysN1yb@dev-arch.archlinux-ax161>
References: <20220128131713.299198-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128131713.299198-1-anders.roxell@linaro.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 28, 2022 at 02:17:13PM +0100, Anders Roxell wrote:
> Clang warns:
> 
> arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
>                                 __tlbiel_va_range(hstart, hend, pid,
>                                                   ^~~~~~
> arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning
>                 unsigned long hstart, hend;
>                                     ^
>                                      = 0
> arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is uninitialized when used here [-Werror,-Wuninitialized]
>                                 __tlbiel_va_range(hstart, hend, pid,
>                                                           ^~~~
> arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the variable 'hend' to silence this warning
>                 unsigned long hstart, hend;
>                                           ^
>                                            = 0
> 2 errors generated.
> 
> Rework the 'if (IS_ENABLE(CONFIG_TRANSPARENT_HUGEPAGE))' so hstart/hend
> always gets initialized, this will silence the warnings. That will also
> simplify the 'else' path. Clang is getting confused with these warnings,
> but the warnings is a false-positive.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/mm/book3s64/radix_tlb.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 7724af19ed7e..5172d5cec2c0 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -1171,15 +1171,12 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
>  			}
>  		}
>  	} else {
> -		bool hflush = false;
> +		bool hflush;
>  		unsigned long hstart, hend;
>  
> -		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
> -			hstart = (start + PMD_SIZE - 1) & PMD_MASK;
> -			hend = end & PMD_MASK;
> -			if (hstart < hend)
> -				hflush = true;
> -		}
> +		hstart = (start + PMD_SIZE - 1) & PMD_MASK;
> +		hend = end & PMD_MASK;
> +		hflush = IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && hstart < hend;
>  
>  		if (type == FLUSH_TYPE_LOCAL) {
>  			asm volatile("ptesync": : :"memory");
> -- 
> 2.34.1
> 
