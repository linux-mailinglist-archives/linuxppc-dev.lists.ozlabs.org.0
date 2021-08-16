Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 648383ECC8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 04:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GnyHr2lmyz3ckr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 12:08:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18;
 helo=deadmen.hmeau.com; envelope-from=herbert@gondor.apana.org.au;
 receiver=<UNKNOWN>)
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GnyHM6Swzz309r
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 12:07:58 +1000 (AEST)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
 id 1mFS2Q-0002cg-A7; Mon, 16 Aug 2021 10:07:42 +0800
Received: from herbert by gondobar with local (Exim 4.92)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1mFS2J-0002cw-Pr; Mon, 16 Aug 2021 10:07:35 +0800
Date: Mon, 16 Aug 2021 10:07:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] crypto: DRBG - select SHA512
Message-ID: <20210816020735.GA10021@gondor.apana.org.au>
References: <304ee0376383d9ceecddbfd216c035215bbff861.camel@chronox.de>
 <20210716081411.GA2062@gondor.apana.org.au>
 <YRft/tuKE6MjHhY7@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRft/tuKE6MjHhY7@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stephan Mueller <smueller@chronox.de>, sachinp@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 14, 2021 at 06:23:26PM +0200, Borislav Petkov wrote:
> On Fri, Jul 16, 2021 at 04:14:12PM +0800, Herbert Xu wrote:
> > Stephan Mueller <smueller@chronox.de> wrote:
> > > With the swtich to use HMAC(SHA-512) as the default DRBG type, the
> > > configuration must now also select SHA-512.
> > > 
> > > Fixes: 9b7b94683a9b "crypto: DRBG - switch to HMAC SHA512 DRBG as default
> > > DRBG"
> > > Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> > > Signed-off-by: Stephan Mueller <smueller@chronox.com>
> > > ---
> > > crypto/Kconfig | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Patch applied.  Thanks.
> 
> Is that patch going to Linus anytime soon?
> 
> I still see it on latest rc5+:

I'll push it up this week.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
