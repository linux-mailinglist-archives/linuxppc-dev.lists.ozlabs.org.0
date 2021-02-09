Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6CA3145B6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:38:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZQXB3KPyzDvYZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 12:38:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uTze7O0G; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZQVF6f4QzDqsG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 12:36:52 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id y10so8838766plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 17:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=k3xVH4Zf+SGPyF1+qimuYcY1j2NUQvV4+U6ixsrmmks=;
 b=uTze7O0GYArJLC7W8Zkrcp8ykioQ9iDzCecKSMXiKyWzl9Sz+m+oLQOsDHa5yyf9N6
 +LZukihtC8/sd+PCzNlnSX/Ly6zpxylQ9/Df7siV5Xw5hb48kyrXsxSx5mbrca/6BLPM
 RDXTP6JHJNQTih4cFf7XHTPi9tnCbm4D2fy5r8pif4oqELK43nmAq1YMTGTgpRpGiHku
 SuvRmIcKojTbfURY19Xty76HPDY9vXIQuieDS5QSgmcxPdVMK5uhpmYaC0x9hFu1ZBpz
 rPw2nvUXzsThsDHL9I3434y9pYbBCakRfQ2/rd0VL02+kYz20EAKt99zQi8F2qXoYrAD
 PYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=k3xVH4Zf+SGPyF1+qimuYcY1j2NUQvV4+U6ixsrmmks=;
 b=YytgetJHODOB7EMk5aocWhYIWkmckZhwuOx6ulvapLRQLGJMoQcFAFA+3Vay8mZjSP
 5GuIJobIs4mQ9xCnB2Y3a0vwze5ueMpBiIx8RP3hiytl+q5Hovn2WN3NmALethQrq5kN
 M1KSp62EYQMevVG8s5eLD9S4Me/eIO8Gadr0bIP0r4wHW/MVu3/ECQqqOGEMU8q+tV07
 eK7mRo9e/EuARPbm7jTLnhsRc2MhxR4kPxb6EDHt/OaaCJ8oXan+K/OZaXsrnwxeedh+
 EZA2G6MT1nPYKEcAc8xUAFkGR/swgDQgncV9yGCSNNgjUlO6A/rhoN28aYaskehzKbVF
 vCPg==
X-Gm-Message-State: AOAM532PJW8v3k93q+UiUdswYOtQtRTfAgNgo7+E78t6IRtnrsm5tuvc
 Hfpum4GlSoPyiDvlZJmUSPg=
X-Google-Smtp-Source: ABdhPJzofX2hr0z0krmZbUaLCq+gAfmL06ugTwSrbvT6VDdNO/wiv3TeROuGdFwlNoHO/3clJ73yow==
X-Received: by 2002:a17:90a:5287:: with SMTP id
 w7mr1670682pjh.52.1612834609161; 
 Mon, 08 Feb 2021 17:36:49 -0800 (PST)
Received: from localhost ([220.240.226.199])
 by smtp.gmail.com with ESMTPSA id o1sm19501986pgq.1.2021.02.08.17.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 17:36:48 -0800 (PST)
Date: Tue, 09 Feb 2021 11:36:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 12/22] powerpc/syscall: Change condition to check MSR_RI
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <67820fada8dd6a8fe9d7b666f175d4cc9d8de87e.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <67820fada8dd6a8fe9d7b666f175d4cc9d8de87e.1612796617.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612834209.4lzq8y2p6t.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
> In system_call_exception(), MSR_RI also needs to be checked on 8xx.
> Only booke and 40x doesn't have MSR_RI.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

...
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v5: Also in interrupt exit prepare
> ---
>  arch/powerpc/kernel/interrupt.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index 1a2dec49f811..107ec39f05cb 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -39,7 +39,7 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
> =20
>  	trace_hardirqs_off(); /* finish reconciling */
> =20
> -	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
> +	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
>  		BUG_ON(!(regs->msr & MSR_RI));
>  	BUG_ON(!(regs->msr & MSR_PR));
>  	BUG_ON(!FULL_REGS(regs));
> @@ -338,7 +338,7 @@ notrace unsigned long interrupt_exit_user_prepare(str=
uct pt_regs *regs, unsigned
>  	unsigned long flags;
>  	unsigned long ret =3D 0;
> =20
> -	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
> +	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
>  		BUG_ON(!(regs->msr & MSR_RI));
>  	BUG_ON(!(regs->msr & MSR_PR));
>  	BUG_ON(!FULL_REGS(regs));
> @@ -436,7 +436,8 @@ notrace unsigned long interrupt_exit_kernel_prepare(s=
truct pt_regs *regs, unsign
>  	unsigned long amr;
>  #endif
> =20
> -	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && unlikely(!(regs->msr & MSR_RI)))
> +	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x) &&
> +	    unlikely(!(regs->msr & MSR_RI)))
>  		unrecoverable_exception(regs);
>  	BUG_ON(regs->msr & MSR_PR);
>  	BUG_ON(!FULL_REGS(regs));
> --=20
> 2.25.0
>=20
>=20
