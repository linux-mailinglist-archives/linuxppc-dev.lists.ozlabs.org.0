Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC1B3A5B35
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 02:48:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3CVc0CD1z308g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 10:48:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=aTry94Aa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aTry94Aa; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3CV96Bfkz2xZk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 10:48:01 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id x19so5672042pln.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 17:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=I9o79Ax23RjK94o2pRJMKn7lcC2m0JsvGAzGpKesFLY=;
 b=aTry94Aa9XyfSdqhvs11JioAEHH5Mj9+e8Qsvo7aQ+xVCGK7dSo9AjF3Uyu+rfcxOH
 RZtf1TfXLn+tOqBfp26FX7s+GAdHGN3uJXrH36zLXExsl+Nb3RwtfdvpGYpOpU2/Mrs5
 9dWvmF9mb4nrchiUbZCy2bqBJA1ol5MQ4lUSXwwleLc12ZLckbkTNWjOFuPtmSA1zt7x
 LzOW7ysdinrOXmiErpCvxbmx38CsDjiuUf94Cx1uuzZ7fKbVzWLSNxExNbWMIhunDqdG
 U2qVAeAZMXIGFstce58iOg1ATNx9thI7P6vtTNpWJGjw/gM2oN4DIfJ8mTpjcxDwW0tb
 OL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=I9o79Ax23RjK94o2pRJMKn7lcC2m0JsvGAzGpKesFLY=;
 b=IUB8YJcgDjrudWBWnAcaaMnQSGDfC/mJFROg2z+1ApzvIgahzPs889YxayHOTkmEZp
 VX4z80ZWvXao2CkDvNBSomyRhl9VEf3Vkjai4UYhiohMYFYV/r6pBVyQsn1pdfdCxMCL
 JUUrn8Lc2xkfCRp8Zzjenz5Bl73vQxWHvtLlrOB6swWroRPPKbiAn7zotzQOc5G0jrgY
 7s7mG6673vjoHpuxsWrLASzUnl6naQyz6Hql7ZgJaLzUBdCH+2AdEN80GvSIvG9qqw/D
 9GuTeeNnvTgtH1QRbYtnHCZQYGzdwnd/6Vlsjt37xShL39Cbf8X61saTjus/OcfGFM3m
 f03w==
X-Gm-Message-State: AOAM531dsAOvo6qo3dh0ntmCG9x0EgkQkNo6QsYALkRicyhwfnpOpEYQ
 sKlsiHLcUQqX5TsfcnOrChgBifxBYCk=
X-Google-Smtp-Source: ABdhPJzeIfTcpR7H+hXdZjMALEpXKvj211rT+pLE1txpQKJPE3Ns/OBf9u6gvvuqvpEW8EkCHDNVJA==
X-Received: by 2002:a17:902:7598:b029:ff:655e:f0c8 with SMTP id
 j24-20020a1709027598b02900ff655ef0c8mr14279470pll.50.1623631677537; 
 Sun, 13 Jun 2021 17:47:57 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id d12sm10503848pfo.113.2021.06.13.17.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 17:47:57 -0700 (PDT)
Date: Mon, 14 Jun 2021 10:47:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/signal64: Copy siginfo before changing regs->nip
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210608134605.2783677-1-mpe@ellerman.id.au>
In-Reply-To: <20210608134605.2783677-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1623631623.jvh0hlk56m.astroid@bobo.none>
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
Cc: dja@axtens.net, cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of June 8, 2021 11:46 pm:
> In commit 96d7a4e06fab ("powerpc/signal64: Rewrite handle_rt_signal64()
> to minimise uaccess switches") the 64-bit signal code was rearranged to
> use user_write_access_begin/end().
>=20
> As part of that change the call to copy_siginfo_to_user() was moved
> later in the function, so that it could be done after the
> user_write_access_end().
>=20
> In particular it was moved after we modify regs->nip to point to the
> signal trampoline. That means if copy_siginfo_to_user() fails we exit
> handle_rt_signal64() with an error but with regs->nip modified, whereas
> previously we would not modify regs->nip until the copy succeeded.
>=20
> Returning an error from signal delivery but with regs->nip updated
> leaves the process in a sort of half-delivered state. We do immediately
> force a SEGV in signal_setup_done(), called from do_signal(), so the
> process should never run in the half-delivered state.
>=20
> However that SEGV is not delivered until we've gone around to
> do_notify_resume() again, so it's possible some tracing could observe
> the half-delivered state.
>=20
> There are other cases where we fail signal delivery with regs partly
> updated, eg. the write to newsp and SA_SIGINFO, but the latter at least
> is very unlikely to fail as it reads back from the frame we just wrote
> to.
>=20
> Looking at other arches they seem to be more careful about leaving regs
> unchanged until the copy operations have succeeded, and in general that
> seems like good hygenie.
>=20
> So although the current behaviour is not cleary buggy, it's also not
> clearly correct. So move the call to copy_siginfo_to_user() up prior to
> the modification of regs->nip, which is closer to the old behaviour, and
> easier to reason about.

Good catch, should it still have a Fixes: tag though? Even if it's not
clearly buggy we want it to be patched.

Thanks,
Nick

>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/signal_64.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal=
_64.c
> index dca66481d0c2..f9e1f5428b9e 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -902,6 +902,10 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_=
t *set,
>  	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badframe_=
block);
>  	user_write_access_end();
> =20
> +	/* Save the siginfo outside of the unsafe block. */
> +	if (copy_siginfo_to_user(&frame->info, &ksig->info))
> +		goto badframe;
> +
>  	/* Make sure signal handler doesn't get spurious FP exceptions */
>  	tsk->thread.fp_state.fpscr =3D 0;
> =20
> @@ -915,11 +919,6 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_=
t *set,
>  		regs->nip =3D (unsigned long) &frame->tramp[0];
>  	}
> =20
> -
> -	/* Save the siginfo outside of the unsafe block. */
> -	if (copy_siginfo_to_user(&frame->info, &ksig->info))
> -		goto badframe;
> -
>  	/* Allocate a dummy caller frame for the signal handler. */
>  	newsp =3D ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
>  	err |=3D put_user(regs->gpr[1], (unsigned long __user *)newsp);
> --=20
> 2.25.1
>=20
>=20
