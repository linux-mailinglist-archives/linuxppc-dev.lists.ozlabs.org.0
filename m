Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D276BC517
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 05:04:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcYYY1BBVz3cfJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 15:04:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=167.179.156.38; helo=167-179-156-38.a7b39c.syd.nbn.aussiebb.net; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcYXz4mCzz3cMS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 15:04:01 +1100 (AEDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pceq6-004zOf-DZ; Thu, 16 Mar 2023 12:03:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 16 Mar 2023 12:03:42 +0800
Date: Thu, 16 Mar 2023 12:03:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] crypto: p10-aes-gcm - remove duplicate include header
Message-ID: <ZBKVHvlNEKG4t8Pv@gondor.apana.org.au>
References: <202303141631511535639@zte.com.cn>
 <dbbd6ff3-5e17-9b63-9027-359e37ace668@csgroup.eu>
 <ZBA1EVdy1DvfxgRO@gondor.apana.org.au>
 <87mt4fobmj.fsf@mpe.ellerman.id.au>
 <ZBE8/Rg9mK3JGBi8@gondor.apana.org.au>
 <87r0tpmjoz.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0tpmjoz.fsf@mpe.ellerman.id.au>
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
Cc: "ye.xingchen@zte.com.cn" <ye.xingchen@zte.com.cn>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>, dtsen@linux.ibm.com, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 16, 2023 at 02:58:04PM +1100, Michael Ellerman wrote:
>
> Although one question I do have for you is what rules, if any, do we
> have for deciding whether crypto code goes in drivers/crypto vs
> arch/*/crypto?

If it's on the CPU then it should probably live under arch.  Yes
there have been exceptions in the past, with VIA PadLock on x86
and vmx on PPC being prime examples.

> I wonder if we should move drivers/crypto/vmx into arch/powerpc/crypto,
> so that all the powerpc CRYPTOGAMS code is in one place. That would help
> to clean up some of the duplication of perl scripts we now have.

Yes I think that would certainly make sense.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
