Return-Path: <linuxppc-dev+bounces-1327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD259781B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 15:56:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4wnZ465kz2yGC;
	Fri, 13 Sep 2024 23:56:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726235762;
	cv=none; b=BOWvct6yxndSJO1FAlNgzA7a+4pCylKgkvnM1NrBOwyH1uTxKbeQSIe8QXOgRVp6tERZpEVpPJFacv9QLOAWsz/5meK9IAZ6dOnp8YJwGFAxPzyYYM1thHY0g1FwvoFv2xhWhB/L9kx7Gp3dAO315z2G3lHEbfKFiaOtJLX6u5YL8+RLirNf6a2PGii7X8/Z8P8J8FwkbA2zswSsH1ZZ8MNiTYJGMmrcmxbkEJcCV79HN3L96R3i7pGf0yp+DfLgaBF+dEWCxv6LvHSW9I07/+/ketgzB9AayBknV/M+2X/DqxReOWOGvzYEyjH5XWgDKfOWIsJw8titbn9Zo3c2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726235762; c=relaxed/relaxed;
	bh=jU7+q5ieaf/csyxGZ9+7/oBRvEi3x03CJEOIJU+qmDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsmLSC3Kq4Zp3Pmuob6I0so4VWlflhEygNlqLkjDQRYzA8Gxx5QKkg5kucqdEl3Y2KRYnc7niq3c6jANMG7wX9PI8CUkjtVr84jl8p5dXYUfJnhay3rjV6dkYw40F03XADXk79KIZHWt2e8olbWhR/dDwJMMedDNVd+/FPkH2a4qVCf908dBhvb33eniE/UXbXs/G7Rz830tVpmS4qcSh+zylHgu/Kh5pjG5snLWpr3BuiSEACa/fegndtqfCoiNqTqDiNYe6W7Asj6pTVckze2Eb4pONkGAonf3FM41WWEBWtBYTZRowZcL81mCfu23Pgeqy2KbDMkJ6oaFH37H8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4wnZ1gycz2xnS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 23:56:01 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X4wnT638kz9sfV;
	Fri, 13 Sep 2024 15:55:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NdghGpa9uVpK; Fri, 13 Sep 2024 15:55:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X4wnT56q9z9sVl;
	Fri, 13 Sep 2024 15:55:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B0F68B77C;
	Fri, 13 Sep 2024 15:55:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 00vgt6UPj302; Fri, 13 Sep 2024 15:55:57 +0200 (CEST)
Received: from [192.168.233.70] (unknown [192.168.233.70])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0FB758B766;
	Fri, 13 Sep 2024 15:55:57 +0200 (CEST)
Message-ID: <4742a397-eb68-4a79-a2fa-fc45a81e7c2b@csgroup.eu>
Date: Fri, 13 Sep 2024 15:55:56 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: Removing CRYPTO_AES_GCM_P10.
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
Cc: herbert@gondor.apana.org.au, leitao@debian.org, nayna@linux.ibm.com,
 appro@cryptogams.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 ltcgcw@linux.vnet.ibm.com, dtsen@us.ibm.com
References: <20240913123043.1636183-1-dtsen@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240913123043.1636183-1-dtsen@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/09/2024 à 14:30, Danny Tsen a écrit :
> [Vous ne recevez pas souvent de courriers de dtsen@linux.ibm.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Removing CRYPTO_AES_GCM_P10 in Kconfig first so that we can apply the
> subsequent patches to fix data mismatch over ipsec tunnel.

To deactivate a driver, all you have to do is to add:

	depends on BROKEN

Christophe


> 
> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> ---
>   arch/powerpc/crypto/Kconfig | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
> index 09ebcbdfb34f..96ca2c4c8827 100644
> --- a/arch/powerpc/crypto/Kconfig
> +++ b/arch/powerpc/crypto/Kconfig
> @@ -105,22 +105,22 @@ config CRYPTO_AES_PPC_SPE
>            architecture specific assembler implementations that work on 1KB
>            tables or 256 bytes S-boxes.
> 
> -config CRYPTO_AES_GCM_P10
> -       tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
> -       depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
> -       select CRYPTO_LIB_AES
> -       select CRYPTO_ALGAPI
> -       select CRYPTO_AEAD
> -       select CRYPTO_SKCIPHER
> -       help
> -         AEAD cipher: AES cipher algorithms (FIPS-197)
> -         GCM (Galois/Counter Mode) authenticated encryption mode (NIST SP800-38D)
> -         Architecture: powerpc64 using:
> -           - little-endian
> -           - Power10 or later features
> -
> -         Support for cryptographic acceleration instructions on Power10 or
> -         later CPU. This module supports stitched acceleration for AES/GCM.
> +#config CRYPTO_AES_GCM_P10
> +#      tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
> +#      depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
> +#      select CRYPTO_LIB_AES
> +#      select CRYPTO_ALGAPI
> +#      select CRYPTO_AEAD
> +#      select CRYPTO_SKCIPHER
> +#      help
> +#        AEAD cipher: AES cipher algorithms (FIPS-197)
> +#        GCM (Galois/Counter Mode) authenticated encryption mode (NIST SP800-38D)
> +#        Architecture: powerpc64 using:
> +#          - little-endian
> +#          - Power10 or later features
> +#
> +#        Support for cryptographic acceleration instructions on Power10 or
> +#        later CPU. This module supports stitched acceleration for AES/GCM.
> 
>   config CRYPTO_CHACHA20_P10
>          tristate "Ciphers: ChaCha20, XChacha20, XChacha12 (P10 or later)"
> --
> 2.43.0
> 
> 

