Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B962F3AD627
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 01:50:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6Fz73czhz3c2h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 09:50:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DOvQjNeS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=DOvQjNeS; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6Fyb3Kdzz2yyt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 09:49:40 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id a127so8914066pfa.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 16:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1LjPznQ/uIsBDTfnzklraJ3U4KjBtmygs7CsvfkuOpE=;
 b=DOvQjNeS+IMvZE3V2rm/bsTOIE2+ElVWYpXBZFcbc3+qR4DzP1GrEt9yKpj0PRQqM5
 QK21+zJTSoN1Btb1LpXsZEUBLD482NwV90tCJzDecrk9yRXIR7/iS40hHtUX6HWl3Caq
 KqA7e5DTfGdu/IRPBaotih4QTz2Uw9/rrROpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1LjPznQ/uIsBDTfnzklraJ3U4KjBtmygs7CsvfkuOpE=;
 b=pcCkIQABU8v8Ll8kxh9Ohx4kon3k/6OX/RRIvdIYZqLKCGCI3Zf60382HBWzz8wJG+
 mb/GrQ0noEPos8kumdirebp07naQG7/6zUuDWVHpGlzGn+ATHqgwjrFggRP8Yf1tMO7W
 q5Vt7Rovsx0R3W6GbRLRu/Zf9gNUR3a4hux55MyR77ag32bpTfjNiaQyEjms5t04BgeN
 CTnkR2osIF1NuHMPP8ObVH7JDwkS4r9ZhK/np4fH5NjQ5eEFmQi1lAjJwFdlNEI3w6I8
 bRUNADKG9M8yjN/Lw1WUlhSo5pUiBGwJsKmb9SGa7L6fgrM6w9CqRUhX+Q8nCaNF9get
 tG7w==
X-Gm-Message-State: AOAM5327jzM1rioXkn1Lv3ETUk5o3uHA9v5+HNemZX3D6qRbPdQq4c2y
 HHu2TzU+buV0iM1SPuu7LTp+hw==
X-Google-Smtp-Source: ABdhPJwZim075DfvinUYZnIyBpgJHTRdBHlySZ9Lv5z4lp07rXwavP5/Oq5awRv5qpMc/S7ulDSg/Q==
X-Received: by 2002:a63:d47:: with SMTP id 7mr12346532pgn.339.1624060177005;
 Fri, 18 Jun 2021 16:49:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b1sm472127pjk.51.2021.06.18.16.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 16:49:36 -0700 (PDT)
Date: Fri, 18 Jun 2021 16:49:34 -0700
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] crypto: nx: Fix memcpy() over-reading in nonce
Message-ID: <202106181648.0C5FA93@keescook>
References: <20210616203459.1248036-1-keescook@chromium.org>
 <87zgvpqb00.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgvpqb00.fsf@mpe.ellerman.id.au>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-crypto@vger.kernel.org,
 Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 17, 2021 at 04:08:15PM +1000, Michael Ellerman wrote:
> Kees Cook <keescook@chromium.org> writes:
> > Fix typo in memcpy() where size should be CTR_RFC3686_NONCE_SIZE.
> >
> > Fixes: 030f4e968741 ("crypto: nx - Fix reentrancy bugs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Thanks.
> 
> > ---
> >  drivers/crypto/nx/nx-aes-ctr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/crypto/nx/nx-aes-ctr.c b/drivers/crypto/nx/nx-aes-ctr.c
> > index 13f518802343..6120e350ff71 100644
> > --- a/drivers/crypto/nx/nx-aes-ctr.c
> > +++ b/drivers/crypto/nx/nx-aes-ctr.c
> > @@ -118,7 +118,7 @@ static int ctr3686_aes_nx_crypt(struct skcipher_request *req)
> >  	struct nx_crypto_ctx *nx_ctx = crypto_skcipher_ctx(tfm);
> >  	u8 iv[16];
> >  
> > -	memcpy(iv, nx_ctx->priv.ctr.nonce, CTR_RFC3686_IV_SIZE);
> > +	memcpy(iv, nx_ctx->priv.ctr.nonce, CTR_RFC3686_NONCE_SIZE);
> >  	memcpy(iv + CTR_RFC3686_NONCE_SIZE, req->iv, CTR_RFC3686_IV_SIZE);
> >  	iv[12] = iv[13] = iv[14] = 0;
> >  	iv[15] = 1;
> 
> Where IV_SIZE is 8 and NONCE_SIZE is 4.
> 
> And iv is 16 bytes, so it's not a buffer overflow.
> 
> But priv.ctr.nonce is 4 bytes, and at the end of the struct, so it reads
> 4 bytes past the end of the nx_crypto_ctx, which is not good.
> 
> But then immediately overwrites whatever it read with req->iv.
> 
> So seems pretty harmless in practice?

Right -- there's no damage done, but future memcpy() FORTIFY work alerts
on this, so I'm going through cleaning all of these up. :)

-- 
Kees Cook
