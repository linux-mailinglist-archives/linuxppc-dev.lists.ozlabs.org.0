Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E276E0E3D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 15:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py0Pk52qZz3fSV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 23:13:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n8LWsImf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py0Np6CW4z3cHG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 23:12:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n8LWsImf;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Py0Nn70dVz4xDh;
	Thu, 13 Apr 2023 23:12:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681391546;
	bh=crgB2H34rkuafhrK1Vi28o4cqKi/40bu1huE2OcOQyU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n8LWsImf33Tn7eZ8EBYXAVb86z1pOmBoHfcgiK0ed+Sw511ah+l0y+HfAqvOcXYoa
	 Hgj8K48VeheAH2eYGFuUQQf4SR7f9aDszEmltFh1co2i0gSQfwlI29CIxgybugv7yZ
	 x2hnYp2Cdhju/CldEUiSijKxuzk+HcHl/wvaOHP4OJXtVo52NirX2bd9lgNCXnWsix
	 nGxXTcQRHplZt79u8EnK5s+yCqKFmTY+HrKordqt7ofQGvlDWaR4YnLn9zxFw0T/GP
	 4VA+DY0Pr1aKK0lEIEGPOde8ar5ow8PoekWPAY1gwchswJ2wHtqqhEKUiNairE01Zs
	 SAI6uuWJHk5Pw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH] Remove POWER10_CPU dependency and move
 PPC_MODULE_FEATURE_P10.
In-Reply-To: <20230412181232.2051-1-dtsen@linux.ibm.com>
References: <20230412181232.2051-1-dtsen@linux.ibm.com>
Date: Thu, 13 Apr 2023 23:12:22 +1000
Message-ID: <87wn2g9b9l.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>, appro@cryptogams.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Danny Tsen <dtsen@linux.ibm.com> writes:
> Remove Power10 dependency in Kconfig and detect Power10 feature at runtime.
> Move PPC_MODULE_FEATURE_P10 definition to be in
> arch/powerpc/include/asm/cpufeature.h.

This should be two patches, one for the Kconfig change and one moving
the feature flag.

Also don't you need a cpu feature check in p10_init()? Otherwise the
driver can be loaded on non-P10 CPUs, either by being built-in, or
manually.

cheers

> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> ---
>  arch/powerpc/crypto/Kconfig            | 2 +-
>  arch/powerpc/crypto/aes-gcm-p10-glue.c | 1 -
>  arch/powerpc/include/asm/cpufeature.h  | 1 +
>  3 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
> index 1f8f02b494e1..7113f9355165 100644
> --- a/arch/powerpc/crypto/Kconfig
> +++ b/arch/powerpc/crypto/Kconfig
> @@ -96,7 +96,7 @@ config CRYPTO_AES_PPC_SPE
>  
>  config CRYPTO_AES_GCM_P10
>  	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
> -	depends on PPC64 && POWER10_CPU && CPU_LITTLE_ENDIAN
> +	depends on PPC64 && CPU_LITTLE_ENDIAN
>  	select CRYPTO_LIB_AES
>  	select CRYPTO_ALGAPI
>  	select CRYPTO_AEAD
> diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
> index 1533c8cdd26f..bd3475f5348d 100644
> --- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
> +++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
> @@ -22,7 +22,6 @@
>  #include <linux/module.h>
>  #include <linux/types.h>
>  
> -#define PPC_MODULE_FEATURE_P10	(32 + ilog2(PPC_FEATURE2_ARCH_3_1))
>  #define	PPC_ALIGN		16
>  #define GCM_IV_SIZE		12
>  
> diff --git a/arch/powerpc/include/asm/cpufeature.h b/arch/powerpc/include/asm/cpufeature.h
> index f6f790a90367..2dcc66225e7f 100644
> --- a/arch/powerpc/include/asm/cpufeature.h
> +++ b/arch/powerpc/include/asm/cpufeature.h
> @@ -22,6 +22,7 @@
>   */
>  
>  #define PPC_MODULE_FEATURE_VEC_CRYPTO			(32 + ilog2(PPC_FEATURE2_VEC_CRYPTO))
> +#define PPC_MODULE_FEATURE_P10				(32 + ilog2(PPC_FEATURE2_ARCH_3_1))
>  
>  #define cpu_feature(x)		(x)
>  
> -- 
> 2.31.1
