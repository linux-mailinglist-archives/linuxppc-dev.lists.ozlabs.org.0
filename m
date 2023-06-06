Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C920E723CE2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 11:17:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb4cl4F09z3f8G
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 19:17:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ryrCzJG3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ryrCzJG3;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb4bw41MYz3cgv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 19:16:44 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b01bd7093aso30694745ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686043001; x=1688635001;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah2zhbL7HyNfNMLyCJlZsl1+8Ty4BOz43t9+LJgTCHg=;
        b=ryrCzJG30j61sGFl6c7bZZF4wXWpbxoPEcD26ngT1SxTpoyPc6VR0oPv+08gWU+cSu
         mhvgCVcu0KlLlKhfMXL8rXT6CRwQVh+doXz3yqrth1+yWsL+EQ9yGeO2LtHLXCGh8ZPz
         T0DezVLAE3CiBc0agNM5CyzLd+BkXeB91nYWVTUYBaIV1mxlXJ7g1ePEgSmRY/TuMgDZ
         af7JPAjrjPSiTmOqSLR2RUTlp4mgZVVqKYWZ2HDr0skp29j0TaGQDlA5I4YhiWwCDeWF
         iCGYvW2NW8qvkKma8uQhgaLJG1rx/NvBlsWKcnN+qOazoFTn5YiW0LqeFS34GNTIdLBQ
         H1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043001; x=1688635001;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ah2zhbL7HyNfNMLyCJlZsl1+8Ty4BOz43t9+LJgTCHg=;
        b=KKVKVwiR1PpkiIhQPWko/veRJee4tnbn27swCx386R1SbRtWJbbRoFL+ZMxE+2tsOS
         fiNPc19oP+Bye/6lKhiaHZ5vyvG3CFtaWx6+sjiYDXpEGqawhz6jtthvuXVtnTBhy2jK
         pXgOW+P/mHfmtyLCt8chNpfcVi2lTJx/ma0DQIwwFo0V1tZGvPlujWfRSB07gbLDoAQN
         xNw/VuRz6SExwlTU+pLhpZcOYUTD+C54kdiIfrfQVBS/aKumyILM+t6GVlPu8x33FTyT
         zPPY5shMgLdGBXsqTaY7p5dG2aMwv0fzmI9vh1FuYl+qNgBq0SkOcN04WF1Fxyon7D4E
         DMlQ==
X-Gm-Message-State: AC+VfDzwnHoRmvQCtqvCel22caORQlNzJ64nPnLaKWBvKxDz+FUMMw0W
	J3JPeoZIZZQzb4gaOspdRRg=
X-Google-Smtp-Source: ACHHUZ6SERKFytLvIZERSMLk/IwvxuJKwbZjn3t2jyy1qwOa9lZVAlJGduBPqky8qiUl82UmebzqpA==
X-Received: by 2002:a17:903:1c9:b0:1a9:86ca:38cd with SMTP id e9-20020a17090301c900b001a986ca38cdmr870663plh.2.1686043001430;
        Tue, 06 Jun 2023 02:16:41 -0700 (PDT)
Received: from localhost (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm7997002plb.256.2023.06.06.02.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:16:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jun 2023 19:16:36 +1000
Message-Id: <CT5GCZLAL3QC.URC3KKG0M0WR@wheely>
Subject: Re: [PATCH 3/4] powerpc/kuap: Refactor static branch for disabling
 kuap
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.14.0
References: <1a3c69e38349b687c6c65240d7c09a7817a797d8.1685963081.git.christophe.leroy@csgroup.eu> <4d775047675e9f8ae2a9db9cb8a0cc8216a309b8.1685963081.git.christophe.leroy@csgroup.eu>
In-Reply-To: <4d775047675e9f8ae2a9db9cb8a0cc8216a309b8.1685963081.git.christophe.leroy@csgroup.eu>
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
> All but book3s/64 use a static branch key for disabling kuap.
> book3s/64 uses a memory feature.
>
> Refactor all targets except book3s/64.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/book3s/32/kup.h     |  7 -------
>  arch/powerpc/include/asm/book3s/64/kup.h     |  1 +
>  arch/powerpc/include/asm/kup.h               | 15 +++++++++++++++
>  arch/powerpc/include/asm/nohash/32/kup-8xx.h |  7 -------
>  arch/powerpc/include/asm/nohash/kup-booke.h  |  7 -------
>  arch/powerpc/mm/book3s32/kuap.c              |  3 ---
>  arch/powerpc/mm/init-common.c                |  3 +++
>  arch/powerpc/mm/nohash/kup.c                 |  3 ---
>  8 files changed, 19 insertions(+), 27 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/incl=
ude/asm/book3s/32/kup.h
> index 466a19cfb4df..8da9997a67ba 100644
> --- a/arch/powerpc/include/asm/book3s/32/kup.h
> +++ b/arch/powerpc/include/asm/book3s/32/kup.h
> @@ -11,8 +11,6 @@
> =20
>  #include <linux/jump_label.h>
> =20
> -extern struct static_key_false disable_kuap_key;
> -
>  static __always_inline bool kuep_is_disabled(void)
>  {
>  	return !IS_ENABLED(CONFIG_PPC_KUEP);
> @@ -25,11 +23,6 @@ static __always_inline bool kuep_is_disabled(void)
>  #define KUAP_NONE	(~0UL)
>  #define KUAP_ALL	(~1UL)
> =20
> -static __always_inline bool kuap_is_disabled(void)
> -{
> -	return static_branch_unlikely(&disable_kuap_key);
> -}
> -
>  static inline void kuap_lock_one(unsigned long addr)
>  {
>  	mtsr(mfsr(addr) | SR_KS, addr);
> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/incl=
ude/asm/book3s/64/kup.h
> index 1b0215ff3710..f8b8e93c488c 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
> @@ -233,6 +233,7 @@ static __always_inline bool kuap_is_disabled(void)
>  {
>  	return !mmu_has_feature(MMU_FTR_BOOK3S_KUAP);
>  }
> +#define kuap_is_disabled kuap_is_disabled

Is there any point to doing this pattern since the code is in places
that have ifdef PPC6 S etc?

> diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.=
c
> index 119ef491f797..74e140b1efef 100644
> --- a/arch/powerpc/mm/init-common.c
> +++ b/arch/powerpc/mm/init-common.c
> @@ -32,6 +32,9 @@ EXPORT_SYMBOL_GPL(kernstart_virt_addr);
>  bool disable_kuep =3D !IS_ENABLED(CONFIG_PPC_KUEP);
>  bool disable_kuap =3D !IS_ENABLED(CONFIG_PPC_KUAP);
> =20
> +struct static_key_false disable_kuap_key;
> +EXPORT_SYMBOL(disable_kuap_key);
> +

That's going to define it on 64s?

Nice refactoring though.

Thanks,
Nick
