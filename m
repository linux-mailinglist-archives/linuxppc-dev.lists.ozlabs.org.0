Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9E663BD42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 10:49:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLyGv615Qz3bNs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 20:49:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EVPb4JZL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EVPb4JZL;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLyG10hCvz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 20:48:40 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id x13-20020a17090a46cd00b00218f611b6e9so12864481pjg.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 01:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UHTkYPMoYj0v++jtiTUgE+7oLMhLxgaC7MSn9zRQ9E=;
        b=EVPb4JZLGi5fEnqQneKZztiltKXmbl3JcJZi9Y++aXpC/jg9HMs15Z2Fl9P8hVw+vp
         5Z+kacHOxhT6d/3yj4qCf6T7T/oKDYPbg9UKqloN6pJvmzoj2iqPgTu7jOmJUUcgrVm7
         tbEJiMRwkqqXkELlalSjH1AO5TgtXRlEDGCeMgaf2j7RkEoK8ilK9Hc7eCMo3GzGxX9n
         O09gAM+oq7Y/IEvqIg1Ms+50I0+U+A/2W3vhHM1sJntW7poYjtA8AVx6fD3Q0/OEHuRR
         30tH32YL3Owv6yPYccNp5O8PW7nL4wGOVNL3GpAZ3zLdGvMnAYe6gTromvadrchrY9G9
         1tBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2UHTkYPMoYj0v++jtiTUgE+7oLMhLxgaC7MSn9zRQ9E=;
        b=vQhpa/EiPXay82JFlZEQyC+/xrcDbdOSCLHgWFWiKqVC8zxesHt7JvAoVeG7pu8Rnq
         ++OCYX2KlttjVw7NeaKtA9jqaptyprgGgRiIf+6ou3908WcndLxWOW5PmlAEKdMYlsHk
         6w5Fzsh5cKvudX3O0yRr+0GisCNiwXPv/C+x/EupA49HflppqG+vKUFhQOhNyKHtMvr+
         cwHPssqxLS5AHGaq9psu/3auMLjrcsHuCOLF78V2L9Vw4O8b8rk1Y5sey/biBgbnRbwZ
         tcks7eHYCHHqwrAfNZVV7Mf1HCEmKl6PSPB4V8hhfemqgtEA7b8twYWMpNdYZo7kBU4x
         nmAw==
X-Gm-Message-State: ANoB5pnb33gK96Cn5N6ZVgOMNYeSOyv/0JRWU0i9YuH7kA8MYScm6MKo
	v7DTeei0mcuNNmFeNQycIVs=
X-Google-Smtp-Source: AA0mqf7lMXMQlJSUNce5cOGSeswJcDnYeYVDDaugBvI4pJSOjBOcNVKPQuRQBB9JHZwOJu2xFWn0Eg==
X-Received: by 2002:a17:903:93:b0:189:5c4d:6046 with SMTP id o19-20020a170903009300b001895c4d6046mr24306300pld.4.1669715319022;
        Tue, 29 Nov 2022 01:48:39 -0800 (PST)
Received: from localhost (193-116-112-94.tpgi.com.au. [193.116.112.94])
        by smtp.gmail.com with ESMTPSA id d13-20020a63fd0d000000b00477def759cbsm6848584pgh.58.2022.11.29.01.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 01:48:38 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Nov 2022 19:48:34 +1000
Message-Id: <COOOOI7S3TPI.1DW4KMM8NP70B@bobo>
Subject: Re: [PATCH v4 4/7] powerpc/64s: IOption for MSR stored in r12
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221129044354.1836018-1-rmclure@linux.ibm.com>
 <20221129044354.1836018-4-rmclure@linux.ibm.com>
In-Reply-To: <20221129044354.1836018-4-rmclure@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Nov 29, 2022 at 2:43 PM AEST, Rohan McLure wrote:
> Interrupt handlers in asm/exceptions-64s.S contain a great deal of common
> code produced by the GEN_COMMON macros. Currently, at the exit point of
> the macro, r12 will contain the contents of the MSR. A future patch will
> cause these macros to zeroise architected registers to avoid potential
> speculation influence of user data.
>
> Provide an IOption that signals that r12 must be retained, as the
> interrupt handler assumes it to hold the contents of the MSR.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> v4: Split 64s register sanitisation commit to establish this IOption
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index 5381a43e50fe..58d72db1d484 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -111,6 +111,7 @@ name:
>  #define ISTACK		.L_ISTACK_\name\()	/* Set regular kernel stack */
>  #define __ISTACK(name)	.L_ISTACK_ ## name
>  #define IKUAP		.L_IKUAP_\name\()	/* Do KUAP lock */
> +#define IMSR_R12	.L_IMSR_R12_\name\()	/* Assumes MSR saved to r12 */
> =20
>  #define INT_DEFINE_BEGIN(n)						\
>  .macro int_define_ ## n name
> @@ -176,6 +177,9 @@ do_define_int n
>  	.ifndef IKUAP
>  		IKUAP=3D1
>  	.endif
> +	.ifndef IMSR_R12
> +		IMSR_R12=3D0
> +	.endif
>  .endm
> =20
>  /*
> @@ -1751,6 +1755,7 @@ INT_DEFINE_BEGIN(fp_unavailable)
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>  	IKVM_REAL=3D1
>  #endif
> +	IMSR_R12=3D1
>  INT_DEFINE_END(fp_unavailable)
> =20
>  EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
> @@ -2372,6 +2377,7 @@ INT_DEFINE_BEGIN(altivec_unavailable)
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>  	IKVM_REAL=3D1
>  #endif
> +	IMSR_R12=3D1
>  INT_DEFINE_END(altivec_unavailable)
> =20
>  EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
> @@ -2421,6 +2427,7 @@ INT_DEFINE_BEGIN(vsx_unavailable)
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>  	IKVM_REAL=3D1
>  #endif
> +	IMSR_R12=3D1
>  INT_DEFINE_END(vsx_unavailable)
> =20
>  EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
> --=20
> 2.37.2

