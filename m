Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 885403A5B59
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 03:33:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3DVW0fPHz308C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 11:33:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dm7jPVDC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dm7jPVDC; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3DV62pZwz2xb6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 11:33:02 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 w14-20020a17090aea0eb029016e9e0e7983so2558358pjy.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 18:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Nye1y/AyIZ0pmRlUYU/uGsFMWRSoEzPxHDduw+pCTv0=;
 b=dm7jPVDCCKbSIpJp8TXVyuqvocKWYx5DcigjFNjJsM0rP1a7njmlAvy/Vbuz2MMkJM
 QdoFfo/4hBiXqjcT2K2dcdvFNzNe29sw5XuEN2KFp0KvTKKgxE1QT8V6hKmd/O/JNg5O
 yp8q4rqgkrnG9++A0nHb8HF5y1obePpLUyM05PRwl7k96j3meePXUsIqEFBwVWJQqtF2
 hrdgdLSysQDgwENJSvypT7DvM1HxRgGHXPTa4y175/MbUnCxCVyfA1xZkB/LMD6m8xl8
 CrKrTGoi+DLPnVccG6JgUUtHtytEG46Gkwqd4hccv4FxT/NomQHY8UqSxsw5hCWpk57C
 ZUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Nye1y/AyIZ0pmRlUYU/uGsFMWRSoEzPxHDduw+pCTv0=;
 b=NEJipY8Kb36N/jGS+11aLo0dUIZNjVdw9UYMqNs95FGhDkx1QYU1W8h/jnpw/+HZeI
 Te2ppqwMKj/bAbcckmRoWr2PW/lOdm7nYWitF+C4feiNKqQ7xLTm8J/Pi4032wTUtHNz
 02zApKgn7KDTXGOdQw2jWAwD0CpiazxwGM02KiFJFSfhSzcNu4RCrfy/ITjIv6t3ktqP
 bmRDArJ9ic/yN96WZptKn0hYMDfphqzsmo7T3xFOz+fCH3eTyORz2z3QMsNO5BocMJtp
 7ShYoozT843P6BOEZtUf6Tc+ctbpmuBkYwsILsfRprw2V7yo78EaBepqvnAvEpAhbQgE
 zzdA==
X-Gm-Message-State: AOAM5302s2Ut55OZxHrTSzCQ+aferD50n/14RcFjy9kme7b4DDa6H1EQ
 ekKbvQqLG/LnGWecVGk3nXh7v88fL3M=
X-Google-Smtp-Source: ABdhPJwXOeKAynlJ3+PsvsEjugJr3HGLX5TLglK9HlbkcpJa40Q5blNeEhgvimbOPnxtepJqX7f5Gg==
X-Received: by 2002:a17:90a:540d:: with SMTP id
 z13mr16843687pjh.159.1623634378530; 
 Sun, 13 Jun 2021 18:32:58 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id 22sm10572342pfo.80.2021.06.13.18.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 18:32:58 -0700 (PDT)
Date: Mon, 14 Jun 2021 11:32:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/signal64: Don't read sigaction arguments back
 from user memory
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210610072949.3198522-1-mpe@ellerman.id.au>
In-Reply-To: <20210610072949.3198522-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1623633444.p3rmbd7eti.astroid@bobo.none>
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
Cc: cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of June 10, 2021 5:29 pm:
> When delivering a signal to a sigaction style handler (SA_SIGINFO), we
> pass pointers to the siginfo and ucontext via r4 and r5.
>=20
> Currently we populate the values in those registers by reading the
> pointers out of the sigframe in user memory, even though the values in
> user memory were written by the kernel just prior:
>=20
>   unsafe_put_user(&frame->info, &frame->pinfo, badframe_block);
>   unsafe_put_user(&frame->uc, &frame->puc, badframe_block);
>   ...
>   if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
>   	err |=3D get_user(regs->gpr[4], (unsigned long __user *)&frame->pinfo)=
;
>   	err |=3D get_user(regs->gpr[5], (unsigned long __user *)&frame->puc);
>=20
> ie. we write &frame->info into frame->pinfo, and then read frame->pinfo
> back into r4, and similarly for &frame->uc.
>=20
> The code has always been like this, since linux-fullhistory commit
> d4f2d95eca2c ("Forward port of 2.4 ppc64 signal changes.").
>=20
> There's no reason for us to read the values back from user memory,
> rather than just setting the value in the gpr[4/5] directly. In fact
> reading the value back from user memory opens up the possibility of
> another user thread changing the values before we read them back.
> Although any process doing that would be racing against the kernel
> delivering the signal, and would risk corrupting the stack, so that
> would be a userspace bug.
>=20
> Note that this is 64-bit only code, so there's no subtlety with the size
> of pointers differing between kernel and user. Also the frame variable
> is not modified to point elsewhere during the function.
>=20
> In the past reading the values back from user memory was not costly, but
> now that we have KUAP on some CPUs it is, so we'd rather avoid it for
> that reason too.
>=20
> So change the code to just set the values directly, using the same
> values we have written to the sigframe previously in the function.
>=20
> Note also that this matches what our 32-bit signal code does.
>=20
> Using a version of will-it-scale's signal1_threads that sets SA_SIGINFO,
> this results in a ~4% increase in signals per second on a Power9, from
> 229,777 to 239,766.

Good find, nice improvement. Will make it possible to make the error
handling much nicer too I think.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

You've moved copy_siginfo_to_user right up to the user access unlock,
could save 2 more KUAP lock/unlocks if we had an unsafe_clear_user. If
we can move the other user access stuff up as well, the stack frame
put_user could use unsafe_put_user as well, saving 1 more. Another few
percent?


>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/signal_64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal=
_64.c
> index dca66481d0c2..f58e7a98d0df 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -948,8 +948,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t=
 *set,
>  	regs->gpr[3] =3D ksig->sig;
>  	regs->result =3D 0;
>  	if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
> -		err |=3D get_user(regs->gpr[4], (unsigned long __user *)&frame->pinfo)=
;
> -		err |=3D get_user(regs->gpr[5], (unsigned long __user *)&frame->puc);
> +		regs->gpr[4] =3D (unsigned long)&frame->info;
> +		regs->gpr[5] =3D (unsigned long)&frame->uc;
>  		regs->gpr[6] =3D (unsigned long) frame;
>  	} else {
>  		regs->gpr[4] =3D (unsigned long)&frame->uc.uc_mcontext;
> --=20
> 2.25.1
>=20
>=20
