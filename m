Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EEA6EDB4A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 07:45:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q59v73DLxz3f5G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 15:45:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=167.179.156.38; helo=167-179-156-38.a7b39c.syd.nbn.aussiebb.net; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q59tg0GGFz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 15:44:42 +1000 (AEST)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1prBTZ-001zum-5I; Tue, 25 Apr 2023 13:44:31 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 25 Apr 2023 13:44:30 +0800
Date: Tue, 25 Apr 2023 13:44:30 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Danny Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH 4/5] Glue code for optmized Poly1305 implementation for
 ppc64le.
Message-ID: <ZEdovn1XbEUptK+m@gondor.apana.org.au>
References: <20230424184726.2091-1-dtsen@linux.ibm.com>
 <20230424184726.2091-5-dtsen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424184726.2091-5-dtsen@linux.ibm.com>
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

On Mon, Apr 24, 2023 at 02:47:25PM -0400, Danny Tsen wrote:
>
> +	if (likely(srclen >= POLY1305_BLOCK_SIZE)) {
> +		bytes = round_down(srclen, POLY1305_BLOCK_SIZE);
> +		used = crypto_poly1305_setdctxkey(dctx, src, bytes);
> +		if (likely(used)) {
> +			srclen -= used;
> +			src += used;
> +		}
> +		if (srclen >= POLY1305_BLOCK_SIZE*4) {
> +			vsx_begin();

Your chacha code has a SIMD-fallback, how come this one doesn't?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
