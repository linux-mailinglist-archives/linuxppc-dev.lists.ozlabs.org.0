Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 201106EDB43
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 07:42:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q59r10TV2z3fFG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 15:42:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=167.179.156.38; helo=167-179-156-38.a7b39c.syd.nbn.aussiebb.net; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q59qX5ZTWz308w
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 15:42:00 +1000 (AEST)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1prBQr-001ztQ-9V; Tue, 25 Apr 2023 13:41:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 25 Apr 2023 13:41:42 +0800
Date: Tue, 25 Apr 2023 13:41:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Danny Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH 2/5] Glue code for optmized Chacha20 implementation for
 ppc64le.
Message-ID: <ZEdoFv4tS69ELyNo@gondor.apana.org.au>
References: <20230424184726.2091-1-dtsen@linux.ibm.com>
 <20230424184726.2091-3-dtsen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424184726.2091-3-dtsen@linux.ibm.com>
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
Cc: dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, appro@cryptogams.org, linux-crypto@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 24, 2023 at 02:47:23PM -0400, Danny Tsen wrote:
>
> +static int chacha_p10_stream_xor(struct skcipher_request *req,
> +				 const struct chacha_ctx *ctx, const u8 *iv)
> +{
> +	struct skcipher_walk walk;
> +	u32 state[16];
> +	int err;
> +
> +	err = skcipher_walk_virt(&walk, req, false);
> +	if (err)
> +		return err;
> +
> +	chacha_init_generic(state, ctx->key, iv);
> +
> +	while (walk.nbytes > 0) {
> +		unsigned int nbytes = walk.nbytes;
> +
> +		if (nbytes < walk.total)
> +			nbytes = rounddown(nbytes, walk.stride);
> +
> +		if (!static_branch_likely(&have_p10) ||

You don't need the static branch in the Crypto API code since
the registration is already conditional.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
