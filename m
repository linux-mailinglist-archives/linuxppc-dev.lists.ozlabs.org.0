Return-Path: <linuxppc-dev+bounces-2982-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B968E9C045D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 12:43:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkgF53bc8z3blN;
	Thu,  7 Nov 2024 22:43:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730979801;
	cv=none; b=e+ULt97s4E+8rrSR1GSKF+5+T8i3EIvOLU38Qm/TMIGnPhG4IUJmuCzUL/ofU71S5VNd1fhkfTBtWtUxrR424Atk1PFsUUSjMSHuceicYng2R+bL3FFQRq8YSPAZiBYW+x+Wpft40unAbvcf72DR5lbbegkf1ud096lq5JHqswdUEfhJah0W0rzOVD0FSWdFZzkzhO20n+bqWOk5VniDaJMtiIbM9BN9VnNuAfJ3jB5hQilezwR7dbpDwGxTGDwJDcjm9eUn88+3s7AZcNXH20EHp43KpZI5tdb/Zl8PyY/vRztMOOS37ASX5tqlKGU2HCFHiGoVDSzSNl6J5Ei4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730979801; c=relaxed/relaxed;
	bh=4Okfvzd2eQr6dRNHt7yCDBwWw5/wg/dsUal/yL3Sw/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Lydlve5MsuguvdgNs+N9lBpuisfR/HafhUmqqoQ5qLw8IfYzsURLhvDt9a87uV/HYLOXuCAO9qJsrescO2WpA+sqilkDTAp5Fk6L1bcEuZ/Vo0IGJXy6AgAff9NPR3xinRj9ZrgS2UlqB9FFJXgV55x+VWnWDYCHFd3jiJaCiXzxxM3vuxB1zGgH+JXVEykLgPcMwcKNlnWk+6ojN55apSihHj793WwL+gbkrX7tLO2Kmwf4bf6TW7qRk/yyUe/N2A1SfM8te8n+BLz5idSZJEwY9QT0hnagJA/7gmM8S+92bpt5Wl7zDKEYCrxHg9HhfYq3Njz9xG2/ZEai4BDY9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BiEwpqK0; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BiEwpqK0;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkgF43RpXz2yGD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 22:43:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730979798;
	bh=4Okfvzd2eQr6dRNHt7yCDBwWw5/wg/dsUal/yL3Sw/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BiEwpqK0s4x0OUCGOD+kvoaKS9tuCWyAZUnpNV+P05pY47FA+NDLfZ/JWKZp6/PeK
	 LPiJEMlpsFmhZgbLj+pEAU9H/nqekHkImAjNmt9grjgLaFNs7JUGP9HkNorncmuHx/
	 AZp4AlFzI9YMvuzlyB1EMBaFnxG0S2CllABXenX1m6YqEFeypKN3+u1YUFnmMfwNtg
	 xJWlA+ULvM64H9YSotQPBK3I+svyN6uMFBK/8axmH0XDREP0LvfJESv7I5akm96VCI
	 ujNar4HQrlP1e8LDBiJB9dmNthjjdZ3aDAgGlqI58SIdn9gkdBAG9x1ry5DnVm6lPY
	 LM7Hgj+n5bn6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkgF02sDzz4wcj;
	Thu,  7 Nov 2024 22:43:16 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: Michal Suchanek <msuchanek@suse.de>, "David S. Miller"
 <davem@davemloft.net>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Danny Tsen
 <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolai Stange <nstange@suse.com>
Subject: Re: [PATCH] aes-gcm-p10: Use the correct bit to test for P10
In-Reply-To: <20241106121019.25629-1-msuchanek@suse.de>
References: <20240923133040.4630-3-dtsen@linux.ibm.com>
 <20241106121019.25629-1-msuchanek@suse.de>
Date: Thu, 07 Nov 2024 22:43:17 +1100
Message-ID: <87h68jclre.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Michal Suchanek <msuchanek@suse.de> writes:
> A hwcap feature bit is passed to cpu_has_feature, resulting in testing
> for CPU_FTR_MMCRA instead of the 3.1 platform revision.

Ouch. Good find.

Notably all IBM Power CPUs have MMCRA set, so the feature test is
essentially a nop.

> Fixes: c954b252dee9 ("crypto: powerpc/p10-aes-gcm - Register modules as SIMD")

^ which is only in linux-next so no stable tag needed.

> Reported-by: Nicolai Stange <nstange@suse.com>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  arch/powerpc/crypto/aes-gcm-p10-glue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
> index e52629334cf8..1f8b67775658 100644
> --- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
> +++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
> @@ -414,7 +414,7 @@ static int __init p10_init(void)
>  {
>  	int ret;
>  
> -	if (!cpu_has_feature(PPC_FEATURE2_ARCH_3_1))
> +	if (!cpu_has_feature(CPU_FTR_ARCH_31))
>  		return 0;
>  
>  	ret = simd_register_aeads_compat(gcm_aes_algs,
> -- 
> 2.46.1

