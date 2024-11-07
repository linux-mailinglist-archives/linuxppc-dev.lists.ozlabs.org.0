Return-Path: <linuxppc-dev+bounces-2983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 163049C04F5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 12:54:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkgTy51nBz3bmN;
	Thu,  7 Nov 2024 22:54:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730980470;
	cv=none; b=IWhhBaEaJduxfSdvQxBzYsAIiQmXHDe89YdYoJRWKomxUN556QjdhYZUU6LIGmsVKN0L2HLdLhPKqDgRNvuenRvVXkcsvq6RXv1wBtLSdzrpWNN9HOA6+u3V27naj6LlIFu7LccMOJamfMG9nEzEGhq3YONB+zg/TPKDfMFg3paosqy/WN9Wxd7h8waTYtBzijAVrkXEOO/0db/BA5xmVqyXZmQo7fww94dRjgwa3s9HEDCnRBfkMSFC1SDXPd+GQBIQ+qkLnzIc1xz+UKJ2/u6wqt0McngJUlWWro6I9a+WPRLLGxJwdOBQOrEe7KfU9GG3sHTP7tL2W8RY2KFP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730980470; c=relaxed/relaxed;
	bh=isnKO7lKL0QWK7slYWLO5kTqSbzMU+FYZ7MF91y2dP0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NxbRTzGyLPdRKuQxOxg8nqGCp/jrdx7JQQmv7ecopufHJvaF/mhRViJdRU04PMhLZkbprxiCHa8TcSytUnfmthzyIQ/bviChj/zms+YrETPEE6e6zX2VxetQI55XQ54mBNGrBF8fjQa2yfcz7RN4M9jzYKCWlWMadqJIAvEir+XPRiiWwwkOZjrAa/+CCHK+Yo4TShCQHMAwmpgG0yBagESmRH5i7rsy6RM5NGtoSabxH0sabV3M9U6iJ+H98woWcvAqHs2gZRjJi818EbzVzk3p6T9m/ZOb6/8ZXmj5jBl3YabxbVJy2Hnnr0QNSSAqpwu6JCgixrzHQRKr53rFCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XeOwG6qy; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XeOwG6qy;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkgTx6PvDz3bmH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 22:54:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730980467;
	bh=isnKO7lKL0QWK7slYWLO5kTqSbzMU+FYZ7MF91y2dP0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XeOwG6qydOK8MXn0X2TY88FZnwKiqzb6yxFxekrL4L/7H+6NJjsn2FoQjqvMk7XXs
	 KKABadXuNh8Bc3tJqw+DTv9y1Y1jOITOz+YICbJ36kge/p0pY6Yds/7Mklk+M4yPrJ
	 bSDp7FcVQtmmsyVMnb/HAUXUNYqfwegM0m6q153Tn7uCfaU8wnghLajrIFxhv1895d
	 1zvTCymTBBaAkwdhOv6xjDld7Z/W+jtR44HYZOIv2QtT66b9LhR2f7lfpXjl5OY15Z
	 oUnrCmIWty9tD/98UPdFpXuq9kQ2JcXtTu4Cm24xMjjGcy1ThNCc1yjbDR/CJefIog
	 g+gOjDh/hsvQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkgTv32Xkz4wc4;
	Thu,  7 Nov 2024 22:54:27 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gautam Menghani <gautam@linux.ibm.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch/powerpc/pseries: Fix KVM guest detection for
 disabling hardlockup detector
In-Reply-To: <20241105132734.499506-1-gautam@linux.ibm.com>
References: <20241105132734.499506-1-gautam@linux.ibm.com>
Date: Thu, 07 Nov 2024 22:54:29 +1100
Message-ID: <87ed3ncl8q.fsf@mpe.ellerman.id.au>
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

Gautam Menghani <gautam@linux.ibm.com> writes:
> As per the kernel documentation[1], hardlockup detector should be
> disabled in KVM guests as it may give false positives. On PPC, hardlockup
> detector is broken inside KVM guests because disable_hardlockup_detector()
 
Isn't it the opposite? Inside KVM guests, the hardlockup detector should
be *disabled*, but it's not it's *enabled*, due to this bug.

ie. it's not broken, it's working, but that's the bug.

> is marked as early_initcall and it uses is_kvm_guest(), which is
> initialized by check_kvm_guest() later during boot as it is a
> core_initcall. check_kvm_guest() is also called in pSeries_smp_probe(),
> which is called before initcalls, but it is skipped if KVM guest does
> not have doorbell support or if the guest is launched with SMT=1.

I'm wondering how no one has noticed. Most KVM guests have SMT=1.

> Move the check_kvm_guest() call in pSeries_smp_probe() to the initial
> part of function before doorbell/SMT checks so that "kvm_guest" static
> key is initialized by the time disable_hardlockup_detector() runs.

check_kvm_guest() is safe to be called multiple times so
disable_hardlockup_detector() should just call it before it calls
is_kvm_guest(). That should avoid future breakage when the order of
calls changes, or someone refactors pSeries_smp_probe().

Can you identify the commit that broke this and include a Fixes: tag
please.

cheers

> [1]: Documentation/admin-guide/sysctl/kernel.rst
>
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/smp.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
> index c597711ef20a..516c7bfec933 100644
> --- a/arch/powerpc/platforms/pseries/smp.c
> +++ b/arch/powerpc/platforms/pseries/smp.c
> @@ -199,6 +199,13 @@ static __init void pSeries_smp_probe(void)
>  	else
>  		xics_smp_probe();
>  
> +	/*
> +	 * Make sure this is called regardless of doorbell/SMT status, as
> +	 * we disable hardlockup detector in an early_initcall where we need to
> +	 * know KVM status for disabling hardlockup detector in KVM guests.
> +	 */
> +	check_kvm_guest();
> +
>  	/* No doorbell facility, must use the interrupt controller for IPIs */
>  	if (!cpu_has_feature(CPU_FTR_DBELL))
>  		return;
> @@ -207,8 +214,6 @@ static __init void pSeries_smp_probe(void)
>  	if (!cpu_has_feature(CPU_FTR_SMT))
>  		return;
>  
> -	check_kvm_guest();
> -
>  	if (is_kvm_guest()) {
>  		/*
>  		 * KVM emulates doorbells by disabling FSCR[MSGP] so msgsndp
> -- 
> 2.47.0

