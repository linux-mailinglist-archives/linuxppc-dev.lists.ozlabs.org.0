Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AE21FDC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 04:32:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454Fn21XS6zDqXf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 12:32:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mxuvneyk"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Flh6TMJzDqX6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 12:30:56 +1000 (AEST)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACA6720843;
 Thu, 16 May 2019 02:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557973853;
 bh=wM9TNClsZacWcRgk7xTDNK0BYza1+wzkgKUWbX29yrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MxuvneykuaKmPMU593+C93QcL9NYo0U3hIQ3jPbZUw9YVhW3okQwsdkSF23jGw6Vs
 E47HWjp4V2AI4tkf9BtC9jDKrM3vOeIuB5S4G1NQveQFaD7L9HQKfCIvLEr7cqAVpo
 Sa9VmLheapfklWiIY0Pu9I17VSa/syzd6uR1jgC8=
Date: Wed, 15 May 2019 19:30:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] crypto: talitos - fix skcipher failure due to wrong
 output IV
Message-ID: <20190516023050.GA23200@sol.localdomain>
References: <a5b0d31d8fc9fc9bc2b69baa5330466090825a39.1557923113.git.christophe.leroy@c-s.fr>
 <VI1PR0402MB34858D80A15D4B55F64570E398090@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <29db3f20-f931-efc6-02a8-fe160ab8b484@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29db3f20-f931-efc6-02a8-fe160ab8b484@c-s.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Horia Geanta <horia.geanta@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2019 at 08:49:48PM +0200, Christophe Leroy wrote:
> 
> 
> Le 15/05/2019 à 16:05, Horia Geanta a écrit :
> > On 5/15/2019 3:29 PM, Christophe Leroy wrote:
> > > Selftests report the following:
> > > 
> > > [    2.984845] alg: skcipher: cbc-aes-talitos encryption test failed (wrong output IV) on test vector 0, cfg="in-place"
> > > [    2.995377] 00000000: 3d af ba 42 9d 9e b4 30 b4 22 da 80 2c 9f ac 41
> > > [    3.032673] alg: skcipher: cbc-des-talitos encryption test failed (wrong output IV) on test vector 0, cfg="in-place"
> > > [    3.043185] 00000000: fe dc ba 98 76 54 32 10
> > > [    3.063238] alg: skcipher: cbc-3des-talitos encryption test failed (wrong output IV) on test vector 0, cfg="in-place"
> > > [    3.073818] 00000000: 7d 33 88 93 0f 93 b2 42
> > > 
> > > This above dumps show that the actual output IV is indeed the input IV.
> > > This is due to the IV not being copied back into the request.
> > > 
> > > This patch fixes that.
> > > 
> > > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > Reviewed-by: Horia Geantă <horia.geanta@nxp.com>
> 
> It's missing a Fixes: tag and a Cc: to stable.
> 
> I'll resend tomorrow.
> 
> > 
> > While here, could you please check ecb mode (which by definition does not have
> > an IV) is behaving correctly?
> > Looking in driver_algs[] list of crypto algorithms supported by talitos,
> > ecb(aes,des,3des) are declared with ivsize != 0.
> 
> According to /proc/crypto, test are passed for ecb.
> 

Did you try enabling CONFIG_CRYPTO_MANAGER_EXTRA_TESTS?  There is now a check
that the driver's ivsize matches the generic implementation's:

        if (ivsize != crypto_skcipher_ivsize(generic_tfm)) {
                pr_err("alg: skcipher: ivsize for %s (%u) doesn't match generic impl (%u)\n",
                       driver, ivsize, crypto_skcipher_ivsize(generic_tfm));
                err = -EINVAL;
                goto out;
        }

For ECB that means the ivsize must be 0.

AFAICS the talitos driver even accesses the IV for ECB, which is wrong; and the
only reason this isn't crashing the self-tests already is that they are confused
by the declared ivsize being nonzero so they don't pass NULL as they should.

- Eric
