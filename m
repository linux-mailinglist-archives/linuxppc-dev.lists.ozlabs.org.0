Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 183E23332C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 02:34:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwF3t0l2Hz3cc7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 12:34:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZK7yoTO7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZK7yoTO7; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwF3S5pGrz30RR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 12:33:56 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so6306758pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 17:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=bk2gbXj7lVPQspVhwjnWs8ssO+83Zc6YrCjiO0hiGow=;
 b=ZK7yoTO7YgUN2ikGdYvBBxnFHZlkxpq4eADMqVD4AZknTxG4DhR/6WXNzfVDudcqwZ
 F8jjnKdMoVDM7Neo/fOY5tGOXHRVMkaFlh5nZI91TiTJgkRZ8PJEj+AwXJFnEAsHA0P8
 SmT2+cJ9jGCj4Zl96a4JnxB8HHdFLK1H1x5ylKrfN19rVvHyCKYv+XGLo6PYHCFAo1Zy
 3PW9xT3GWIHFiaU0DLWA8AO43RPQ96ZRjnYb6I8clypkojZfem69/CNOmOI/GuaQ5oJN
 sT+0cQcPfPvfw0kSWgNa8W2KpTDw1XkyfuAiIHcrMKfh/m2xxUg+1DjQtds9BBlSBUEU
 FNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=bk2gbXj7lVPQspVhwjnWs8ssO+83Zc6YrCjiO0hiGow=;
 b=Lp4r/Cc3Fdd8RQCYoZaWaCLJJ0m6jH+Z2OLssJ4GXCcUG9ExhvgQG6xf/flSvIh9S5
 NfGXPQtyDCplLB4bR7sTBDnBv1Rf+AwGuoGzNsgxtHT8UWgiel/y8xVlQLV57Py6mBQV
 l5xraXeXUb0XPdiBfhZxk9sTJrY36bq17ZxXyZf0xJLA5gjp1GH6IXWdc5gX8os7bpww
 UP5t8hQsZ2clJ4MAkwNk8pYh+8+4lS7SauxoyUhWsdn+Ozqz/aA/NrbugQcPeDNGaPNM
 mHk8jixvt7EjRtBT4fBBDo2PyrIUuaaD394pHnra2EgOthTeiA1wsQEbrSQkhWmha2Xs
 aZaA==
X-Gm-Message-State: AOAM532C2QwkDJHo38dMjpqOYS+rgvHpPNiUXZ1ehaYd0PSkCYnD7Lqo
 cIkurlk7oZXgmf59l7V9h1Y=
X-Google-Smtp-Source: ABdhPJy2HN27jz4a5QTummRE+dZi2bKOXRGhtGb8kVTmwRdp+g5WgQtHEmb6K/7hPGkiu4ADl8Zt9w==
X-Received: by 2002:a17:90b:3550:: with SMTP id
 lt16mr802543pjb.47.1615340033713; 
 Tue, 09 Mar 2021 17:33:53 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id s10sm14061433pgl.90.2021.03.09.17.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 17:33:53 -0800 (PST)
Date: Wed, 10 Mar 2021 11:33:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 36/43] powerpc/32: Set current->thread.regs in C
 interrupt entry
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
 <8d523f9ecee1de0515cc31d43030c12ab171a670.1615291474.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8d523f9ecee1de0515cc31d43030c12ab171a670.1615291474.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615339900.vmbtzuirqw.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of March 9, 2021 10:10 pm:
> No need to do that is assembly, do it in C.

Hmm. No issues with the patch as such, but why does ppc32 need this but=20
not 64? AFAIKS 64 sets this when a thread is created.

Thanks,
Nick

>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/interrupt.h | 4 +++-
>  arch/powerpc/kernel/entry_32.S       | 3 +--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/=
asm/interrupt.h
> index 861e6eadc98c..e6d71c2e3aa2 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -33,8 +33,10 @@ static inline void interrupt_enter_prepare(struct pt_r=
egs *regs, struct interrup
>  	if (!arch_irq_disabled_regs(regs))
>  		trace_hardirqs_off();
> =20
> -	if (user_mode(regs))
> +	if (user_mode(regs)) {
> +		current->thread.regs =3D regs;
>  		account_cpu_user_entry();
> +	}
>  #endif
>  	/*
>  	 * Book3E reconciles irq soft mask in asm
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_3=
2.S
> index 8fe1c3fdfa6e..815a4ff1ba76 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -52,8 +52,7 @@
>  prepare_transfer_to_handler:
>  	andi.	r0,r9,MSR_PR
>  	addi	r12, r2, THREAD
> -	beq	2f			/* if from user, fix up THREAD.regs */
> -	stw	r3,PT_REGS(r12)
> +	beq	2f
>  #ifdef CONFIG_PPC_BOOK3S_32
>  	kuep_lock r11, r12
>  #endif
> --=20
> 2.25.0
>=20
>=20
