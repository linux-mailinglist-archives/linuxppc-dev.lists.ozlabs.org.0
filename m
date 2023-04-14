Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3569B6E2403
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:09:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PycGZ2Jmvz3fWP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:09:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AI6TsBJJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PycFk4h8Hz3cBp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:08:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AI6TsBJJ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PycFc55W0z4xDp;
	Fri, 14 Apr 2023 23:08:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681477701;
	bh=oj/wAWvWwblyAy9BivgS9S5w0Qg18/UMB9ocKCFLE8Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AI6TsBJJTv4I2Vv0XN3pvsY3994LZ5BmYemqW7/MsyiHQSzEbkP4SLwc6hEgrLyVq
	 5rUJB7vaqMls8qsgrvRV+qmzBf1xOsiYZu3fg4JSrpcQw5CfBJbbeeLwqi46ImlnWu
	 i+6ravrfwv1mRDgDxcwojXWeQ4gw/GAw7rYsUQslDrO4M8LFRr6uuNf0xczs8helCM
	 YeC+wisOnp9G5rlqdLZD+m7Lr5asYDIst48O9Mzxhw+ic+YEHr/tR5OnGaid2u9OWz
	 RXUi5j7bUDEDhaC4VyrHTNicU+uelac+Dormr2/kWG0eIKdh3EhgbSgjo3g9e3csCV
	 o/ponLWrNh3IQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Remove POWER10_CPU dependency.
In-Reply-To: <20230413194625.10631-2-dtsen@linux.ibm.com>
References: <20230413194625.10631-1-dtsen@linux.ibm.com>
 <20230413194625.10631-2-dtsen@linux.ibm.com>
Date: Fri, 14 Apr 2023 23:08:14 +1000
Message-ID: <87ildya9xd.fsf@mpe.ellerman.id.au>
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

... using the existing call to module_cpu_feature_match() :)

> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> ---
>  arch/powerpc/crypto/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

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
> -- 
> 2.31.1
