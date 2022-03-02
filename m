Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5540E4CB2AF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 00:00:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K88ht3XbMz3c3b
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 10:00:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18;
 helo=fornost.hmeau.com; envelope-from=herbert@gondor.apana.org.au;
 receiver=<UNKNOWN>)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K88hR4hYrz30Dv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 09:59:49 +1100 (AEDT)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1nPXwQ-0006Dh-Em; Thu, 03 Mar 2022 09:59:31 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 03 Mar 2022 10:59:30 +1200
Date: Thu, 3 Mar 2022 10:59:30 +1200
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Petr Vorel <pvorel@suse.cz>
Subject: Re: [PATCH v4 1/1] crypto: vmx - add missing dependencies
Message-ID: <Yh/20gN+shzCcGYC@gondor.apana.org.au>
References: <20220223151115.28536-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223151115.28536-1-pvorel@suse.cz>
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
Cc: Nicolai Stange <nstange@suse.de>, Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-crypto@vger.kernel.org,
 leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 23, 2022 at 04:11:15PM +0100, Petr Vorel wrote:
> vmx-crypto module depends on CRYPTO_AES, CRYPTO_CBC, CRYPTO_CTR or
> CRYPTO_XTS, thus add them.
> 
> These dependencies are likely to be enabled, but if
> CRYPTO_DEV_VMX=y && !CRYPTO_MANAGER_DISABLE_TESTS
> and either of CRYPTO_AES, CRYPTO_CBC, CRYPTO_CTR or CRYPTO_XTS is built
> as module or disabled, alg_test() from crypto/testmgr.c complains during
> boot about failing to allocate the generic fallback implementations
> (2 == ENOENT):
> 
> [    0.540953] Failed to allocate xts(aes) fallback: -2
> [    0.541014] alg: skcipher: failed to allocate transform for p8_aes_xts: -2
> [    0.541120] alg: self-tests for p8_aes_xts (xts(aes)) failed (rc=-2)
> [    0.544440] Failed to allocate ctr(aes) fallback: -2
> [    0.544497] alg: skcipher: failed to allocate transform for p8_aes_ctr: -2
> [    0.544603] alg: self-tests for p8_aes_ctr (ctr(aes)) failed (rc=-2)
> [    0.547992] Failed to allocate cbc(aes) fallback: -2
> [    0.548052] alg: skcipher: failed to allocate transform for p8_aes_cbc: -2
> [    0.548156] alg: self-tests for p8_aes_cbc (cbc(aes)) failed (rc=-2)
> [    0.550745] Failed to allocate transformation for 'aes': -2
> [    0.550801] alg: cipher: Failed to load transform for p8_aes: -2
> [    0.550892] alg: self-tests for p8_aes (aes) failed (rc=-2)
> 
> Fixes: c07f5d3da643 ("crypto: vmx - Adding support for XTS")
> Fixes: d2e3ae6f3aba ("crypto: vmx - Enabling VMX module for PPC64")
> 
> Suggested-by: Nicolai Stange <nstange@suse.de>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Changes v3->v4:
> * Drop commit which merged CRYPTO_DEV_VMX and CRYPTO_DEV_VMX_ENCRYPT
>   (Herbert)
> 
>  drivers/crypto/vmx/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
