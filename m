Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A62B5949E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 18:30:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BztV4DGTzDqgx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 02:30:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="BxmwhJll";
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bzqv5lKlzDqhF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 02:28:08 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id gn20so1209492plb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 09:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dtollBZp7Cd+ev2dDovCVJwksY+nLROyjuudRVM9OKw=;
 b=BxmwhJllUMx6b1ZbOB0Bait3CD4aF8Nn7N71cUa/X450cNrv63L2ssIVE3JWtHagWE
 KMf79uArWdp5TpG5aurF+084leROU41Y0YRKJsgFfXB+X01NaQgX/UgLRy5iHzyIwQtl
 iNjLpw5NRpqOuli+PZSjJgLgxOYvTz5hhoRb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dtollBZp7Cd+ev2dDovCVJwksY+nLROyjuudRVM9OKw=;
 b=cBPP+QzLA5ennDW0ubfCYUgjS91xiyVYkF9EELucW7cHFQ6XnomByshcWxxFeHrPT4
 OMUnWMAGD9dgbJ2cg6X7YBmy6eK4dPj0J74kwVT+RXfMDxzoIveAtELDNHnHHIF2GHog
 kc4LoT0Hj/Wke4a5RsV6cO5CrBA1cC0zYmkTsxSRMVpvk8sgGvjmq0+fkloOktX19w9V
 BfwMg6Bj3SUaP+9p2B9sAP02I97BJ8qvOwj4ojeVocqpJGXb5+ZMlH0tZwEY28wM+mm/
 p6zTlG8vOuMtfsKjU0n5t7PN1FOz6krWB5HxcOasjVSjU4mZ5kvvUVDxvDsaagJOgl1r
 jGkQ==
X-Gm-Message-State: APjAAAXIu1Vm6gp3EUbTeQ4akDYc064HcGO9dPMOW3gX/EAlAlgK1d6P
 e7NTArqIiQPulxcaoGxFTtGsUg==
X-Google-Smtp-Source: APXvYqz3swKpzU6/ulxtva6MdU20KzGqbm9MWaVfUX9EOYMl0e2vdxdyIjU27bv/Fze8Pmx0gRuQ8w==
X-Received: by 2002:a17:902:be03:: with SMTP id
 r3mr23853750pls.156.1566232085869; 
 Mon, 19 Aug 2019 09:28:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x2sm16090710pja.22.2019.08.19.09.28.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 19 Aug 2019 09:28:05 -0700 (PDT)
Date: Mon, 19 Aug 2019 09:28:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 1/3] powerpc: don't use __WARN() for WARN_ON()
Message-ID: <201908190917.9C65E23D6A@keescook>
References: <a6781075192afe0c909ce7d091de7931183a5d93.1566219503.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6781075192afe0c909ce7d091de7931183a5d93.1566219503.git.christophe.leroy@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Drew Davenport <ddavenport@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 19, 2019 at 01:06:28PM +0000, Christophe Leroy wrote:
> __WARN() used to just call __WARN_TAINT(TAINT_WARN)
> 
> But a call to printk() has been added in the commit identified below
> to print a "---- cut here ----" line.
> 
> This change only applies to warnings using __WARN(), which means
> WARN_ON() where the condition is constant at compile time.
> For WARN_ON() with a non constant condition, the additional line is
> not printed.
> 
> In addition, adding a call to printk() forces GCC to add a stack frame
> and save volatile registers. Powerpc has been using traps to implement
> warnings in order to avoid that.
> 
> So, call __WARN_TAINT(TAINT_WARN) directly instead of using __WARN()
> in order to restore the previous behaviour.
> 
> If one day powerpc wants the decorative "---- cut here ----" line, it
> has to be done in the trap handler, not in the WARN_ON() macro.
> 
> Fixes: 6b15f678fb7d ("include/asm-generic/bug.h: fix "cut here" for WARN_ON for __WARN_TAINT architectures")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Ah! Hmpf. Yeah, that wasn't an intended side-effect of this fix.

It seems PPC is not alone in this situation of making this code much
noisier. It looks like there needs to be a way to indicate to the trap
handler that a message was delivered or not. Perhaps we can add another
taint flag?

-kees

> ---
>  arch/powerpc/include/asm/bug.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index fed7e6241349..3928fdaebb71 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -99,7 +99,7 @@
>  	int __ret_warn_on = !!(x);				\
>  	if (__builtin_constant_p(__ret_warn_on)) {		\
>  		if (__ret_warn_on)				\
> -			__WARN();				\
> +			__WARN_TAINT(TAINT_WARN);		\
>  	} else {						\
>  		__asm__ __volatile__(				\
>  		"1:	"PPC_TLNEI"	%4,0\n"			\
> -- 
> 2.13.3
> 

-- 
Kees Cook
