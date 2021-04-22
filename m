Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A3E367A48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 08:56:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQp9c0LLHz30GN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 16:56:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQp9F5rr4z2xZQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 16:56:00 +1000 (AEST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1lZTFc-0002Bn-FW; Thu, 22 Apr 2021 16:55:49 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 22 Apr 2021 16:55:48 +1000
Date: Thu, 22 Apr 2021 16:55:48 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [V3 PATCH 13/16] crypto/nx: Rename nx-842-pseries file name to
 nx-common-pseries
Message-ID: <20210422065548.GA5486@gondor.apana.org.au>
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <ead7ef3bc33dac05fbb8b2ef59d5d0110ba318be.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ead7ef3bc33dac05fbb8b2ef59d5d0110ba318be.camel@linux.ibm.com>
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
Cc: npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 17, 2021 at 02:11:15PM -0700, Haren Myneni wrote:
> 
> Rename nx-842-pseries.c to nx-common-pseries.c to add code for new
> GZIP compression type. The actual functionality is not changed in
> this patch.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  drivers/crypto/nx/Makefile                                  | 2 +-
>  drivers/crypto/nx/{nx-842-pseries.c => nx-common-pseries.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/crypto/nx/{nx-842-pseries.c => nx-common-pseries.c} (100%)
> 
> diff --git a/drivers/crypto/nx/Makefile b/drivers/crypto/nx/Makefile
> index bc89a20e5d9d..d00181a26dd6 100644
> --- a/drivers/crypto/nx/Makefile
> +++ b/drivers/crypto/nx/Makefile
> @@ -14,5 +14,5 @@ nx-crypto-objs := nx.o \
>  obj-$(CONFIG_CRYPTO_DEV_NX_COMPRESS_PSERIES) += nx-compress-pseries.o nx-compress.o
>  obj-$(CONFIG_CRYPTO_DEV_NX_COMPRESS_POWERNV) += nx-compress-powernv.o nx-compress.o
>  nx-compress-objs := nx-842.o
> -nx-compress-pseries-objs := nx-842-pseries.o
> +nx-compress-pseries-objs := nx-common-pseries.o
>  nx-compress-powernv-objs := nx-common-powernv.o
> diff --git a/drivers/crypto/nx/nx-842-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
> similarity index 100%
> rename from drivers/crypto/nx/nx-842-pseries.c
> rename to drivers/crypto/nx/nx-common-pseries.c

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
