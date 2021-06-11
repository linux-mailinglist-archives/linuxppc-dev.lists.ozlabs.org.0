Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC663A39CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 04:33:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1Pyn0dmTz3bvq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 12:33:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=soK2L6Bb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=soK2L6Bb; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1PyM1p7Rz3034
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 12:32:43 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id u126so3205218pfu.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 19:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=UOW92aC6DkTa48QgwUGsp3h2g6ZPsQbasSzlvBgjQLY=;
 b=soK2L6BbXZVKYT6oA2EzWgCP9hBQeaKJ7XGF2nyly4PCKroZgSzoJHJjRNDtnPofC1
 IKPpc8haDqSsqL36iPERWU3bPoQzG9NeQngwMWEH29Xqu39t0lWZYLUe9bNwxv2Yd3v1
 eCkTbjOPWG2KY7ZT6q3r+VzogSmValMR6uJpPliS32pqdYi3egSOjYMAlgyDMYO52Mc9
 pkZP0Th3cvp+Vtr2cWeE7WnEVKf57IM0yyUbdgHF02S0LUNlbXN6BMeQPh6BJUz0Ruwv
 CiIo+WZTC1yqcfzOJSVELjsXR71FmPuAqXVIIK8OnqZ9jUrPvWRPCVsh6Lu6hfwwhH3g
 GcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=UOW92aC6DkTa48QgwUGsp3h2g6ZPsQbasSzlvBgjQLY=;
 b=XrCwjnvo8FpEgwr7RToYmPt55dPgVTx/tWMuJitmwDCKWuOnUezdPcoe3QGK0oSmNX
 fbldnE+41XQxf3n3jfrKR+1+UFlbAuBKslYRIN6Ppph9XmCScucrj6ARH2ig62CwW/HV
 MTPjuFzbpt+qJcYTgWrRZ+l5iE0g6qV8x1SL57AkOb4Qs174Gn1gh1/s1XhVvqFGCEEx
 mtG8LlsdiYOf+iHfx2z8TOEUa3eIF9jg1GYtvmsvQzcmcDb3L3JDS3iSBUQeA1eveU+c
 eAujJmztP1MBlICzW0LLvTmcR8a9nIYSy7sojZPW/VY4OAbVCGRoQ/w0yHIHHWpO5yED
 FpWw==
X-Gm-Message-State: AOAM530fzVdse1RZNIc8ZDtvKHFXP7vJe8xcqIjtcY5440C41X2J1ZG0
 E6tC84eFNwqMzB0+vuqF69RbkfHTWlo=
X-Google-Smtp-Source: ABdhPJwgfmWBVfBMAJSTfEk7UoGj8K6Twg7sGzqbjVToujODcjt2zObXKzxTHUOLAMJm6evNOoIfYA==
X-Received: by 2002:a63:62c2:: with SMTP id w185mr1380250pgb.76.1623378759533; 
 Thu, 10 Jun 2021 19:32:39 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id p16sm3580523pgl.60.2021.06.10.19.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 19:32:39 -0700 (PDT)
Date: Fri, 11 Jun 2021 12:32:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 3/4] powerpc/interrupt: Rename and lightly change
 syscall_exit_prepare_main()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <809d316bf5f1a81acdd69e220c13e716dac24f53.1622818556.git.christophe.leroy@csgroup.eu>
 <f46e330d3db9ac2567b5a12d170ba8375aa80c1b.1622818556.git.christophe.leroy@csgroup.eu>
In-Reply-To: <f46e330d3db9ac2567b5a12d170ba8375aa80c1b.1622818556.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1623378700.koj918a90m.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of June 5, 2021 12:56 am:
> Rename syscall_exit_prepare_main() into interrupt_exit_prepare_main()
>=20
> Make it static as it is not used anywhere else.
>=20
> Pass it the 'ret' so that it can 'or' it directly instead of
> oring twice, once inside the function and once outside.
>=20
> And remove 'r3' parameter which is not used.
>=20
> Also fix a typo where CONFIG_PPC_BOOK3S should be CONFIG_PPC_BOOK3S_64.

This all looks good I think. I need to grab this fix from your series.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/interrupt.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index b6aa80930733..bc3c1892ed80 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -228,11 +228,10 @@ static notrace void booke_load_dbcr0(void)
>  #endif
>  }
> =20
> -notrace unsigned long syscall_exit_prepare_main(unsigned long r3,
> -						struct pt_regs *regs)
> +static notrace unsigned long
> +interrupt_exit_user_prepare_main(struct pt_regs *regs, unsigned long ret=
)
>  {
>  	unsigned long ti_flags;
> -	unsigned long ret =3D 0;
> =20
>  again:
>  	ti_flags =3D READ_ONCE(current_thread_info()->flags);
> @@ -254,7 +253,7 @@ notrace unsigned long syscall_exit_prepare_main(unsig=
ned long r3,
>  		ti_flags =3D READ_ONCE(current_thread_info()->flags);
>  	}
> =20
> -	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && IS_ENABLED(CONFIG_PPC_FPU)) {
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
>  		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
>  				unlikely((ti_flags & _TIF_RESTORE_TM))) {
>  			restore_tm_state(regs);
> @@ -350,7 +349,7 @@ notrace unsigned long syscall_exit_prepare(unsigned l=
ong r3,
>  	}
> =20
>  	local_irq_disable();
> -	ret |=3D syscall_exit_prepare_main(r3, regs);
> +	ret =3D interrupt_exit_user_prepare_main(regs, ret);
> =20
>  #ifdef CONFIG_PPC64
>  	regs->exit_result =3D ret;
> @@ -378,7 +377,7 @@ notrace unsigned long syscall_exit_restart(unsigned l=
ong r3, struct pt_regs *reg
> =20
>  	BUG_ON(!user_mode(regs));
> =20
> -	regs->exit_result |=3D syscall_exit_prepare_main(r3, regs);
> +	regs->exit_result =3D interrupt_exit_user_prepare_main(regs, regs->exit=
_result);
> =20
>  	return regs->exit_result;
>  }
> --=20
> 2.25.0
>=20
>=20
