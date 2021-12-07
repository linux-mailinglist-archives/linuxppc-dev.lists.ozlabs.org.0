Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C9B46C0B2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 17:28:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7m1w5XsZz3c72
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 03:28:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dOpVfFOq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dOpVfFOq; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7m1G3CfDz2yb5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 03:27:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2197B816ED;
 Tue,  7 Dec 2021 16:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC70C341C3;
 Tue,  7 Dec 2021 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638894460;
 bh=8nN/fY1mhHkeTR7cezH7UxSxdsu1XjxSVOY8LyupowA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dOpVfFOqRj17/JwcQnRMwePsIiutNjHTdd/k4gW0nYPbZbBtFbjIY0utf+DnLBMEY
 qyTH/g4FRR+x3mN6RShkNs1TNcZ4VavW+um63UU5+ELEqZU/I2WG1elWIN9mhq3q6I
 Cq626YNvBB+FW/L27EY9DoEisVJ8YykiTPCTDFVyF7NPspFiZUDwNuT3PA7bDgs077
 ZKbS2BhpAmWgV8xyi3sxwxWB0ZaRKY0ehVv9v67pBFIhgdBBssC6OM1cJdeWHLRHnW
 K3aKny+mYazyYMDl9v0zCJfqK2uFalMdZ7QwxnpUlR5lH0SjpdXpFBF7RV4T2d/L3z
 beBG9fBP1BS6A==
Date: Tue, 7 Dec 2021 09:27:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] powerpc: platforms: cell: pervasive: fix clang
 -Wimplicit-fallthrough
Message-ID: <Ya+Ld7OG70Dn9Dub@archlinux-ax161>
References: <20211207110228.698956-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207110228.698956-1-anders.roxell@linaro.org>
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
Cc: arnd@arndb.de, Naresh Kamboju <naresh.kamboju@linaro.org>,
 llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 07, 2021 at 12:02:28PM +0100, Anders Roxell wrote:
> Clang warns:
> 
> arch/powerpc/platforms/cell/pervasive.c:81:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>         case SRR1_WAKEEE:
>         ^
> arch/powerpc/platforms/cell/pervasive.c:81:2: note: insert 'break;' to avoid fall-through
>         case SRR1_WAKEEE:
>         ^
>         break;
> 1 error generated.
> 
> Clang is more pedantic than GCC, which does not warn when failing
> through to a case that is just break or return. Clang's version
> is more in line with the kernel's own stance in deprecated.rst.
> Add athe missing break to silence the warning.

      ^ small typo, probably not worth a resend

> 
> Fixes: 6e83985b0f6e ("powerpc/cbe: Do not process external or decremeter interrupts from sreset")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/platforms/cell/pervasive.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/platforms/cell/pervasive.c b/arch/powerpc/platforms/cell/pervasive.c
> index 5b9a7e9f144b..dff8d5e7ab82 100644
> --- a/arch/powerpc/platforms/cell/pervasive.c
> +++ b/arch/powerpc/platforms/cell/pervasive.c
> @@ -78,6 +78,7 @@ static int cbe_system_reset_exception(struct pt_regs *regs)
>  	switch (regs->msr & SRR1_WAKEMASK) {
>  	case SRR1_WAKEDEC:
>  		set_dec(1);
> +		break;
>  	case SRR1_WAKEEE:
>  		/*
>  		 * Handle these when interrupts get re-enabled and we take
> -- 
> 2.33.0
> 
