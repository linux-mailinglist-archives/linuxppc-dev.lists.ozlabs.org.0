Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2C8229CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 04:00:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456htj1pBWzDqJg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 12:00:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="DgtPfu3o"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456hsK5ZpNzDqGJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 11:59:15 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id i21so5952159pgi.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 18:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=cfMVUA9OHUdd5CDYIB9t/NcZ2QxAx68ucJtfg3HumEY=;
 b=DgtPfu3otLiv9qY9QtIMym29sEKjSBgirtSpoBV3ktnaE57i/3Pa82u6EsNSHZFw4Y
 CQkBjaP6LY6wF+XBomC4uPNQZgcGBQ0+sx0gOss35QFw71IwpRwR+kU0jSzYo2JcbFrU
 QKj6iC2q2AQaOj6sgFLGL0CZUj3xBZuOaxFXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=cfMVUA9OHUdd5CDYIB9t/NcZ2QxAx68ucJtfg3HumEY=;
 b=HUmb20TnJ0D1wLJ3kXE6fJTvhEQm077FlVz7I+xtsqAzNtBWElWRzeOehLyxwoDvcu
 MlFSAxxBG7A3cB+WIZ0crzLfWiSk8y0FGMQICQ3XwTUmri475BMKt5TbMOD8swa0g7RQ
 lqiH2i0FpkuEKevAj5gTxownWcq4DVjGvaesj709Vpm7LtL5+cS1y6MHyFXydB4vMK+G
 C5AkoUB/2zAVr/nuQ7zKhG+7bRgsF1akbkHQcMQsqG8JeR0eVpqGleoMQ9xEq+PQlmTy
 nfwfD+kmXsaXyBsVO+Dm2YaOrhAzutI7h6s9v1yb+XorpMAM/lXAaE7oaF/HR2lwT1kw
 TC7w==
X-Gm-Message-State: APjAAAX+4N5G+kgs60shtuY6wApx6pbVacp2fGADy0qvfwkmlA74wuTn
 uruMUSH6yjVlKIo00ylUhwEWXA==
X-Google-Smtp-Source: APXvYqwiinPVc2YzhEDXGip4I/nfanOcL+4bEKa+BGmzUf0Y6zIMqM/QDPYW/hfRPIPv1BgkhwnIzA==
X-Received: by 2002:a63:2d87:: with SMTP id
 t129mr72619662pgt.451.1558317551425; 
 Sun, 19 May 2019 18:59:11 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id h123sm24653201pfe.80.2019.05.19.18.59.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 19 May 2019 18:59:10 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: mpe@ellerman.id.au, ebiggers@kernel.org, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: vmx - CTR: always increment IV as quadword
In-Reply-To: <20190515102450.30557-1-dja@axtens.net>
References: <20190515102450.30557-1-dja@axtens.net>
Date: Mon, 20 May 2019 11:59:05 +1000
Message-ID: <87r28tzy1i.fsf@dja-thinkpad.axtens.net>
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
Cc: leo.barbosa@canonical.com, Stephan Mueller <smueller@chronox.de>,
 nayna@linux.ibm.com, omosnacek@gmail.com, leitao@debian.org,
 pfsmorigo@gmail.com, marcelo.cerri@canonical.com, gcwilson@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:

> The kernel self-tests picked up an issue with CTR mode:
> alg: skcipher: p8_aes_ctr encryption test failed (wrong result) on test vector 3, cfg="uneven misaligned splits, may sleep"
>
> Test vector 3 has an IV of FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD, so
> after 3 increments it should wrap around to 0.
>
> In the aesp8-ppc code from OpenSSL, there are two paths that
> increment IVs: the bulk (8 at a time) path, and the individual
> path which is used when there are fewer than 8 AES blocks to
> process.
>
> In the bulk path, the IV is incremented with vadduqm: "Vector
> Add Unsigned Quadword Modulo", which does 128-bit addition.
>
> In the individual path, however, the IV is incremented with
> vadduwm: "Vector Add Unsigned Word Modulo", which instead
> does 4 32-bit additions. Thus the IV would instead become
> FFFFFFFFFFFFFFFFFFFFFFFF00000000, throwing off the result.
>
> Use vadduqm.
>
> This was probably a typo originally, what with q and w being
> adjacent. It is a pretty narrow edge case: I am really
> impressed by the quality of the kernel self-tests!
>
> Fixes: 5c380d623ed3 ("crypto: vmx - Add support for VMS instructions by ASM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Axtens <dja@axtens.net>
>
> ---
>
> I'll pass this along internally to get it into OpenSSL as well.

I passed this along to OpenSSL and got pretty comprehensively schooled:
https://github.com/openssl/openssl/pull/8942

It seems we tweak the openssl code to use a 128-bit counter, whereas
the original code was in fact designed for a 32-bit counter. We must
have changed the vaddu instruction in the bulk path but not in the
individual path, as they're both vadduwm (4x32-bit) upstream.

I think this change is still correct with regards to the kernel,
but I guess it's probably something where I should have done a more
thorough read of the documentation before diving in to the code, and
perhaps we should note it in the code somewhere too. Ah well.

Regards,
Daniel

> ---
>  drivers/crypto/vmx/aesp8-ppc.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/crypto/vmx/aesp8-ppc.pl b/drivers/crypto/vmx/aesp8-ppc.pl
> index de78282b8f44..9c6b5c1d6a1a 100644
> --- a/drivers/crypto/vmx/aesp8-ppc.pl
> +++ b/drivers/crypto/vmx/aesp8-ppc.pl
> @@ -1357,7 +1357,7 @@ Loop_ctr32_enc:
>  	addi		$idx,$idx,16
>  	bdnz		Loop_ctr32_enc
>  
> -	vadduwm		$ivec,$ivec,$one
> +	vadduqm		$ivec,$ivec,$one
>  	 vmr		$dat,$inptail
>  	 lvx		$inptail,0,$inp
>  	 addi		$inp,$inp,16
> -- 
> 2.19.1
