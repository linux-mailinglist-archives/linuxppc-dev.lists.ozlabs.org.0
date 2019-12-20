Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6CA1276AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 08:43:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fLMx6yXzzDqwb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 18:43:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18;
 helo=deadmen.hmeau.com; envelope-from=herbert@gondor.apana.org.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gondor.apana.org.au
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fLL72wV7zDqvW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 18:42:07 +1100 (AEDT)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1iiCvA-0000hf-3M; Fri, 20 Dec 2019 15:42:00 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1iiCv6-0007xj-B7; Fri, 20 Dec 2019 15:41:56 +0800
Date: Fri, 20 Dec 2019 15:41:56 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH 08/10] crypto/NX: Add NX GZIP user space API
Message-ID: <20191220074156.pflm3ydpgaxtthhd@gondor.apana.org.au>
References: <1576414240.16318.4066.camel@hbabu-laptop>
 <1576415119.16318.4094.camel@hbabu-laptop>
 <20191217093334.ihvz3fzzfgjwse32@gondor.apana.org.au>
 <1576745384.12797.37.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576745384.12797.37.camel@hbabu-laptop>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: mikey@neuling.org, npiggin@gmail.com, hch@infradead.org,
 linux-crypto@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 19, 2019 at 12:49:44AM -0800, Haren Myneni wrote:
> 
> Virtual Accelerator Switchboard (VAS) can provide support different
> accelerators, Right now only NX is used, but possible to extend to
> others in future. Or different functionalities such as fast thread
> wakeup (VAS feature) with VAS windows. 
> 
> So looking common VAS API for any its accelerators. Need open a window /
> channel - open() and ioctl()) calls, and setup the communications with
> mapping address to NX (mmap()) and close the window. Then user space
> communicates to accelerator directly without kernel involvement.
> Specific drivers should set window attributes such as how many requests
> can be send at same time and etc. All other interfaces should be same
> for any accelerator. 
> 
> Also, since user space sends requests directly, should restrict
> malicious users to prevent overload NX (security issue). Allowing
> sysadmin to restrict /dev/crypto/nx-gzip usage. 

If you are going to place your driver through the Crypto API then
it needs to use the Crypto API interface for user-space access.
That interface is af_alg.

If this is not a good fit then I suggest that you move your API
elsewhere, perhaps to the powerpc tree where the user-space API can
then be properly reviewed.

It is not feasible to review your driver's user-space API through
the crypto tree.

> As you suggested, SW crypto API (af_alg) can be used just for NX
> compression like using API based on the accelerator functionalities. It
> is socket based API with AF_ALG socket family. But is there a way for
> sysadmin to restrict usage from user space? Need just few functions in
> struct proto. 

The af_alg interface does not operate in the manner that you
describe.  It is an interface that maps onto the underlying kernel
Crypto API operations.  We currently don't have an af_alg module
for compression, but if we did we would be closely following the
current kernel compression interface.

One key feature of af_alg is that it normally is agnostic to the
underlying implementation.  That is, even when the hardware is
absent it would seamlessly switch over to a software implementation.

I say normally because there can be exceptions, e.g., with paes
and hardware keys.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
