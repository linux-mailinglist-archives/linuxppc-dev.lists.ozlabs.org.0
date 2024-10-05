Return-Path: <linuxppc-dev+bounces-1766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173B99149E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2024 07:36:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XLDfR663yz2yFK;
	Sat,  5 Oct 2024 15:35:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728106559;
	cv=none; b=cP1TZXlRH+lcGPpj0yZFqcAcOT5OkBU6tvrb+7um3uJuSSsbb8rI12SB5AdqolxgLvNYwltjPJ3WCftptbOutalrhdn1Zrxm9e+rjpybp0HSodfo6XSn2bTuwgxcnBDq78qYC/mVWxcnC+CMlDcVpa9C9M3eZ8TxNW7F1NUEr5PAQLbYoWhmM7EstqN39OrZRG8oNmosKZLNgeFDQDHwqNVBkrzMkvDnUcphyAtnPEjCxlySX7QoykS+LEJB1pMvgukaF2GErOVri1l4Y5+y50YcQWQ9LufvkmX/QlUEvZweqXWPklIa1UJFw9TdWmcpP4ZNZlfT69ADJLQBAc6oaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728106559; c=relaxed/relaxed;
	bh=Cm/+r/Iu7iT6qjqotRyzDFVjq3VicaFGGYKMIAH+pZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V21gFCsZaT/OIS0TC234fnH87KKn0yRZo/DFh6/dSntP2Iotw+cp9YMwEZU/lAthGcoq5LCoqCIbUb5DlqUBZ1C5AsW3TF3vOPt8SZZiCKreKRsWBQ/e2IRiAHM0gNRiYueasCntTNMVUX6Glwa3yw1vfKmpV9KpBt1ecK9HXUYVxjzNKKgy3YSV1wFfQgTvDBcJEKICdh7YTk/eTZdF3RPaGbIeUZN7+CQZVL4ll6HrnnvGa4OpXOxj32UNgfsUK3v3zXn4HbxckInalnpB93gPIuphwqWiMUj9Qz5m+I5zMhhR3dgXf0HsNzbfoExujA0q2hHdPqXkwTxZiu39bA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=bT4fUEiE; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=bT4fUEiE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XLDfP6Q01z2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2024 15:35:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Cm/+r/Iu7iT6qjqotRyzDFVjq3VicaFGGYKMIAH+pZQ=; b=bT4fUEiE0R4OQ3Jn19EjBbst3h
	/GULhvNMTDaKPlxeuW4LZeQV4LUEce/O1ovahnW9CimmKIL2fVpNvMrOaNR/HAu2txg8yDYQ9yCvA
	55EQWfbGNRyweHmFxiZB+AiLlVrnrhGEFG3eidD5AlC/aKaKlwozSczoy8jQQcbdxAo9mkvzdVGlw
	JG19blDhjeRPK9hKJWZ3RGBTn0MaJK9BAIIAJqKZvvaZP/8/NaRLZRsyd+Rys6Nmhf/LzTaJ5nvMH
	p2dlOvpMderqf9yYTDzBcgjWybS1BywLfac5/tgcuE2Nkt8ct/Ff8P3S19Qb/6kupjDb9cf715BGZ
	t7FEKkeg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1swxIG-0071bZ-2j;
	Sat, 05 Oct 2024 13:35:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 05 Oct 2024 13:35:42 +0800
Date: Sat, 5 Oct 2024 13:35:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Danny Tsen <dtsen@linux.ibm.com>
Cc: linux-crypto@vger.kernel.org, stable@vger.kernel.org, leitao@debian.org,
	nayna@linux.ibm.com, appro@cryptogams.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au, ltcgcw@linux.vnet.ibm.com, dtsen@us.ibm.com
Subject: Re: [PATCH 0/3] crypto: Fix data mismatch over ipsec tunnel
 encrypted/decrypted with ppc64le AES/GCM module.
Message-ID: <ZwDQLmwA1LvWx5Dg@gondor.apana.org.au>
References: <20240923133040.4630-1-dtsen@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923133040.4630-1-dtsen@linux.ibm.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Sep 23, 2024 at 09:30:37AM -0400, Danny Tsen wrote:
> Fix data mismatch over ipsec tunnel encrypted/decrypted with ppc64le AES/GCM module.
> 
> This patch is to fix an issue when simd is not usable that data mismatch
> may occur. The fix is to register algs as SIMD modules so that the
> algorithm is excecuted when SIMD instructions is usable.
> 
> A new module rfc4106(gcm(aes)) is also added. Re-write AES/GCM assembly
> codes with smaller footprints and small performance gain.
> 
> This patch has been tested with the kernel crypto module tcrypt.ko and
> has passed the selftest.  The patch is also tested with
> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.
> 
> Fixes: fd0e9b3e2ee6 ("crypto: p10-aes-gcm - An accelerated AES/GCM stitched implementation")
> Fixes: cdcecfd9991f ("crypto: p10-aes-gcm - Glue code for AES/GCM stitched implementation")
> Fixes: 45a4672b9a6e2 ("crypto: p10-aes-gcm - Update Kconfig and Makefile")
> 
> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> 
> Danny Tsen (3):
>   crypto: Re-write AES/GCM stitched implementation for ppcle64.
>   crypto: Register modules as SIMD modules for ppcle64 AES/GCM algs.
>   crypto: added CRYPTO_SIMD in Kconfig for CRYPTO_AES_GCM_P10.
> 
>  arch/powerpc/crypto/Kconfig            |    2 +-
>  arch/powerpc/crypto/aes-gcm-p10-glue.c |  141 +-
>  arch/powerpc/crypto/aes-gcm-p10.S      | 2421 +++++++++++-------------
>  3 files changed, 1187 insertions(+), 1377 deletions(-)
> 
> -- 
> 2.43.0

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

