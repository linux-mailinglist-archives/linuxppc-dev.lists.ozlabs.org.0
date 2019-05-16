Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F31FDD6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 04:57:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454GLL6qgCzDqXX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 12:57:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="f8xAWeto"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454GJn6zsSzDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 12:56:09 +1000 (AEST)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6762520848;
 Thu, 16 May 2019 02:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557975366;
 bh=TQQOh+GWzjppP/yoefvWnQUIY57aNXLvaCVcxSM4Cos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f8xAWetoxViGqcLLrXE1ZBoxuj5LXHi+Y3NQ0zuqiKCzm80F58a3w5bUE5CJx6LM/
 Y0mtyMb19YeFXtRsO8JaRBMX63pIyDl1Lel6Lft9oy7jwqcEVmsn3Gqe5+33Bx0APv
 3NOCsjwtmxfPokAtzdTUsHHw+nKK0TIV0YFF5nc8=
Date: Wed, 15 May 2019 19:56:04 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] crypto: vmx - fix copy-paste error in CTR mode
Message-ID: <20190516025603.GB23200@sol.localdomain>
References: <87imvkwqdh.fsf@dja-thinkpad.axtens.net>
 <2c8b042f-c7df-cb8b-3fcd-15d6bb274d08@linux.vnet.ibm.com>
 <8736mmvafj.fsf@concordia.ellerman.id.au>
 <20190506155315.GA661@sol.localdomain>
 <20190513005901.tsop4lz26vusr6o4@gondor.apana.org.au>
 <87pnomtwgh.fsf@concordia.ellerman.id.au>
 <877eat0wi0.fsf@dja-thinkpad.axtens.net>
 <20190515035336.y42wzhs3wzqdpwzn@gondor.apana.org.au>
 <874l5w1axv.fsf@dja-thinkpad.axtens.net>
 <871s0z171b.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871s0z171b.fsf@dja-thinkpad.axtens.net>
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
Cc: leo.barbosa@canonical.com, nayna@linux.ibm.com,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Stephan Mueller <smueller@chronox.de>, Nayna <nayna@linux.vnet.ibm.com>,
 omosnacek@gmail.com, marcelo.cerri@canonical.com, pfsmorigo@gmail.com,
 linux-crypto@vger.kernel.org, leitao@debian.org,
 George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 16, 2019 at 12:12:48PM +1000, Daniel Axtens wrote:
> 
> I'm also seeing issues with ghash with the extended tests:
> 
> [    7.582926] alg: hash: p8_ghash test failed (wrong result) on test vector 0, cfg="random: use_final src_divs=[<reimport>9.72%@+39832, <reimport>18.2%@+65504, <reimport,nosimd>45.57%@alignmask+18, <reimport,nosimd>15.6%@+65496, 6.83%@+65514, <reimport,nosimd>1.2%@+25, <reim"
> 
> It seems to happen when one of the source divisions has nosimd and the
> final result uses the simd finaliser, so that's interesting.
> 

The bug is that p8_ghash uses different shash_descs for the SIMD and no-SIMD
cases.  So if you start out doing the hash in SIMD context but then switch to
no-SIMD context or vice versa, the digest will be wrong.  Note that there can be
an ->export() and ->import() in between, so it's not quite as obscure a case as
one might think.

To fix it I think you'll need to make p8_ghash use 'struct ghash_desc_ctx' just
like ghash-generic so that the two code paths can share the same shash_desc.
That's similar to what the various SHA hash algorithms do.

- Eric
