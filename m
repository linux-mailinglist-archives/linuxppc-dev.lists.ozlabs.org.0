Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F7F723D4D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 11:27:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb4rp6JQwz3dsr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 19:27:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nzO5P+tA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nzO5P+tA;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb4qz24jHz3cdy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 19:27:10 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2566ed9328eso5009302a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 02:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686043628; x=1688635628;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fj5cfddeuLbFxFPU3j4YyWVdfQSP61amx4yxE5TB5b8=;
        b=nzO5P+tABXIgVwKbob6pzJjXU5AmQ/Ntk0CjOjXWHCi3pdq4rC8ZTx/rqiY9TwGbpc
         UXR9O3p9HoMQuIsMvJmKKhmoReR+tC69I8rDe7evM7zfhZC1zmol4znhri/PZi4YZWUz
         olbOO8qtJ3xTbJzPbJ20Vn8pAOqOQEr3SwYqcXsVWAdcBK4J5oWMCFeTHck+Mrvl0CiQ
         RbU57GTLqaF8uCPMsV62tnvvwRnUPsQIQfeY0ISGcdzwIsFFi7Z/HujuilCDy9sxwEqH
         ScGhC9cvh+0Zbkfp2VEwJ8lZfVwI9bWCLonow31f32cdQCqELPnml/6M0hcCtuRyHbfu
         pDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043628; x=1688635628;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fj5cfddeuLbFxFPU3j4YyWVdfQSP61amx4yxE5TB5b8=;
        b=a/jw3SlEA7jagccfSi1ewbd6zUwNeH8WygitknBEnz7bR/KBL9Ont0I13EJSfgZNV3
         JPram20Zz0bl/Wr3oCTbY17/uQVTZ6wpirO91041rBbC/UxWmF+BwFjggsfO+OSCvMnT
         RJwsCSI8xbeCoZKXgH2Oty3jWRKD+C8zFGqX3hm+g7VSIKmTv581W1bQSuaEXdOhQZ4P
         WU2ZsGwCoPQDqgoxV+OB1lR59WXSE400YNmkrDS41ncfbw3sxfSe6jrIaenqkFAYUy2R
         4l214bZPqwDG5fGoXe1/JZD7vaacmFmP9t8MmbVye8IGGqvNPicnmN7xrYb1csR7d/fv
         H/Gw==
X-Gm-Message-State: AC+VfDxgAzC5kUxzT2w5A0KRZpFUmYd5FXwzSDq8iAG0cbybDxVhCTuw
	YhY47Db1gzWV8lh7fhHLZgc=
X-Google-Smtp-Source: ACHHUZ69dTB14PGDXn+rLlYLlncYLqzKXJX1kqbwLbJrAGPR8YOis4ZN98koiW32GjQZcGxEIlte/Q==
X-Received: by 2002:a17:90a:540d:b0:259:17ba:e89a with SMTP id z13-20020a17090a540d00b0025917bae89amr1416109pjh.34.1686043628235;
        Tue, 06 Jun 2023 02:27:08 -0700 (PDT)
Received: from localhost (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id nk23-20020a17090b195700b00256dff5f8e3sm7153055pjb.49.2023.06.06.02.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:27:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jun 2023 19:27:03 +1000
Message-Id: <CT5GKZN6D21R.3US3D2GZWGLS2@wheely>
Subject: Re: [PATCH 4/4] powerpc/kuap: Make disabling KUAP at boottime
 optional
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.14.0
References: <1a3c69e38349b687c6c65240d7c09a7817a797d8.1685963081.git.christophe.leroy@csgroup.eu> <8d5438da7174ecb32e1c28cdb49987648df6ef15.1685963081.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8d5438da7174ecb32e1c28cdb49987648df6ef15.1685963081.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 5, 2023 at 9:04 PM AEST, Christophe Leroy wrote:
> It is possible to disable KUAP at boottime with 'nosmap' parameter.
>
> That is implemented with jump_label hence adds a 'nop' in front
> of each open/close of userspace access.
>
> From a security point of view it makes sence to disallow disabling
> KUAP. And on processors like the 8xx where 'nop' is not seamless,
> it saves a few cycles.
>
> So add a CONFIG item to make it optionnal.

I love counting cycles, but a CONFIG option for one nop... I think
you have me beat.

Is that sustainable? What if instead of the static branch you patched in
nops to the lock/unlock asm? AFAIKS there does not look like much (any?)
C code in the kuap enabled branches.

Thanks,
Nick

>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/kup.h         |  2 +-
>  arch/powerpc/mm/init-common.c          |  3 +++
>  arch/powerpc/platforms/Kconfig.cputype | 10 ++++++++++
>  3 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/ku=
p.h
> index 74b7f4cee2ed..f3280169aeec 100644
> --- a/arch/powerpc/include/asm/kup.h
> +++ b/arch/powerpc/include/asm/kup.h
> @@ -53,7 +53,7 @@ extern struct static_key_false disable_kuap_key;
> =20
>  static __always_inline bool kuap_is_disabled(void)
>  {
> -	return static_branch_unlikely(&disable_kuap_key);
> +	return IS_ENABLED(CONFIG_PPC_KUAP_BOOTTIME) && static_branch_unlikely(&=
disable_kuap_key);
>  }
>  #endif
>  #else
> diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.=
c
> index 74e140b1efef..994ee58f0092 100644
> --- a/arch/powerpc/mm/init-common.c
> +++ b/arch/powerpc/mm/init-common.c
> @@ -48,6 +48,9 @@ early_param("nosmep", parse_nosmep);
> =20
>  static int __init parse_nosmap(char *p)
>  {
> +	if (!IS_ENABLED(CONFIG_PPC_KUAP_BOOTTIME))
> +		return 0;
> +
>  	disable_kuap =3D true;
>  	pr_warn("Disabling Kernel Userspace Access Protection\n");
>  	return 0;
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platfo=
rms/Kconfig.cputype
> index 45fd975ef521..f75c2d5cd182 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -502,6 +502,16 @@ config PPC_KUAP
> =20
>  	  If you're unsure, say Y.
> =20
> +config PPC_KUAP_BOOTTIME
> +	bool "Allow disabling Kernel Userspace Access Protection at boottime"
> +	depends on PPC_KUAP
> +	default y
> +	help
> +	  Allow the user to disable Kernel Userspace Access Protection (KUAP)
> +	  at boot time using 'nosmap' kernel parameter.
> +
> +	  If you're unsure, say Y.
> +
>  config PPC_KUAP_DEBUG
>  	bool "Extra debugging for Kernel Userspace Access Protection"
>  	depends on PPC_KUAP
> --=20
> 2.40.1

