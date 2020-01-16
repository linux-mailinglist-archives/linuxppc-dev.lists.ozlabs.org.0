Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBDF13D50C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 08:31:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ywq117RKzDqWm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 18:31:09 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ywmb3Wr9zDqJm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 18:29:01 +1100 (AEDT)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1irzaL-0005Xm-15; Thu, 16 Jan 2020 15:28:57 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1irzaJ-0000n4-7f; Thu, 16 Jan 2020 15:28:55 +0800
Date: Thu, 16 Jan 2020 15:28:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] crypto: vmx/xts - reject inputs that are too short
Message-ID: <20200116072855.x3zktbdasy23xpp3@gondor.apana.org.au>
References: <20200108050646.29220-1-dja@axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108050646.29220-1-dja@axtens.net>
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
Cc: pfsmorigo@gmail.com, nayna@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-crypto@vger.kernel.org, ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 08, 2020 at 04:06:46PM +1100, Daniel Axtens wrote:
> When the kernel XTS implementation was extended to deal with ciphertext
> stealing in commit 8083b1bf8163 ("crypto: xts - add support for ciphertext
> stealing"), a check was added to reject inputs that were too short.
> 
> However, in the vmx enablement - commit 239668419349 ("crypto: vmx/xts -
> use fallback for ciphertext stealing"), that check wasn't added to the
> vmx implementation. This disparity leads to errors like the following:
> 
> alg: skcipher: p8_aes_xts encryption unexpectedly succeeded on test vector "random: len=0 klen=64"; expected_error=-22, cfg="random: inplace may_sleep use_finup src_divs=[<flush>66.99%@+10, 33.1%@alignmask+1155]"
> 
> Return -EINVAL if asked to operate with a cryptlen smaller than the AES
> block size. This brings vmx in line with the generic implementation.
> 
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206049
> Fixes: 239668419349 ("crypto: vmx/xts - use fallback for ciphertext stealing")
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: stable@vger.kernel.org # v5.4+
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> [dja: commit message]
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>  drivers/crypto/vmx/aes_xts.c | 3 +++
>  1 file changed, 3 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
