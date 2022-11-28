Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8434639F7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:38:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL8mK5V3dz3cJv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:38:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N8Ya5RJg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N8Ya5RJg;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8lQ68hcz2xl2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:37:54 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so11529206pjt.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 18:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dwc1axH3DTphkP6nsnokhO6H3KB9gQ0MH0EGyb5AZ8E=;
        b=N8Ya5RJg+qwkGqYQ/aTnMJyLOa61Ozga6AS9xQ2fb47qNt0JYDJ80V2n4r8btSgO+P
         78vK99lrCxw7Dd3jAlGvxZwR9Sjf3SAmy5GQO3TSFjkbfB3xTyMUSl8tCQ52Nvng4iO9
         zJZnbvDm/XGaJ0QskscVQChVDdwDKfKiwbpJJ41X+fjfTeJGIPVSjY1idEkUjHYF6jAs
         xhIuVsfDuHeFobtI/gUoRlu8fqldBQkNg8f8wlYbex5LXmduRCN0/Y5mjn0SyIsU0BSI
         Wm4jk8sULTFtN9fR9CC5sSbIoR2LSczERVTjLiZYkOF3gLXTEX3iPxmLwo/BCSEZ42J+
         OfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dwc1axH3DTphkP6nsnokhO6H3KB9gQ0MH0EGyb5AZ8E=;
        b=Y9ofXUgcrfC73aoDhg9SFTLMkkVWSl0nPTNFXiOMhng7iWkZURkXKueGGxHdXDbfKI
         e6uQh6FQKINFjtRZbMJck5JbIro+52knjR718EpCjGcuQ7EcaqDG/0jLC8XSMSY29ZbB
         bX/n/0xVgw61LZ0VRcUg0AylsrXpxA4p2aQq2UgRV8Bbk3iepSnTjADZLOLPnnUs5/Mb
         /a7/xLtLPv9KinCPD4r/X76jEqTT1OfAdUBAuTLo5POvHS0Wi3E+IpOOQ9u+8Le1WiiS
         Q5ZIOoH1X49p66hIzINvdSTFwtlcyOQmhwK6+cknoD268wZjMnty7hvwVl0gBRqwQM1V
         M7tA==
X-Gm-Message-State: ANoB5pkjkKMzfo8HEIDQy+lG/i/B+Rnf2YjxoUHOjiwLSh6idFdoyc4u
	2v4PLFmx3OinvKKliI79Tftl8hhRhgY=
X-Google-Smtp-Source: AA0mqf75MrVCIAWapmuuYfFirsbEJvyI5PzoHLjBrT4k3ovvGvWIFN9P3Ui83+jgBluWHIkpkgGeTw==
X-Received: by 2002:a17:90b:3544:b0:213:2173:f46a with SMTP id lt4-20020a17090b354400b002132173f46amr57739984pjb.103.1669603072823;
        Sun, 27 Nov 2022 18:37:52 -0800 (PST)
Received: from localhost ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id m7-20020a170902db0700b0018862b7f8besm7582430plx.160.2022.11.27.18.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 18:37:52 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Nov 2022 12:37:47 +1000
Message-Id: <CONKW4NEF2EG.D1B61G6TXI5Y@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nathan Lynch" <nathanl@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 11/13] powerpc/rtas: strengthen do_enter_rtas() type
 safety, drop inline
X-Mailer: aerc 0.13.0
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-12-nathanl@linux.ibm.com>
In-Reply-To: <20221118150751.469393-12-nathanl@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
> Make do_enter_rtas() take a pointer to struct rtas_args and do the
> __pa() conversion in one place instead of leaving it to callers. This
> also makes it possible to introduce enter/exit tracepoints that access
> the rtas_args struct fields.
>
> There's no apparent reason to force inlining of do_enter_rtas()
> either, and it seems to bloat the code a bit. Let the compiler decide.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index a88db3b3486f..198366d641d0 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -522,7 +522,7 @@ static const struct rtas_function *rtas_token_to_func=
tion(s32 token)
>  /* This is here deliberately so it's only used in this file */
>  void enter_rtas(unsigned long);
> =20
> -static inline void do_enter_rtas(unsigned long args)
> +static void do_enter_rtas(struct rtas_args *args)
>  {
>  	unsigned long msr;
> =20
> @@ -537,7 +537,7 @@ static inline void do_enter_rtas(unsigned long args)
> =20
>  	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
> =20
> -	enter_rtas(args);
> +	enter_rtas(__pa(args));
> =20
>  	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
>  }
> @@ -908,7 +908,7 @@ static char *__fetch_rtas_last_error(char *altbuf)
>  	save_args =3D rtas.args;
>  	rtas.args =3D err_args;
> =20
> -	do_enter_rtas(__pa(&rtas.args));
> +	do_enter_rtas(&rtas.args);
> =20
>  	err_args =3D rtas.args;
>  	rtas.args =3D save_args;
> @@ -955,7 +955,7 @@ va_rtas_call_unlocked(struct rtas_args *args, int tok=
en, int nargs, int nret,
>  	for (i =3D 0; i < nret; ++i)
>  		args->rets[i] =3D 0;
> =20
> -	do_enter_rtas(__pa(args));
> +	do_enter_rtas(args);
>  }
> =20
>  void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, in=
t nret, ...)
> @@ -1731,7 +1731,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, ua=
rgs)
>  	flags =3D lock_rtas();
> =20
>  	rtas.args =3D args;
> -	do_enter_rtas(__pa(&rtas.args));
> +	do_enter_rtas(&rtas.args);
>  	args =3D rtas.args;
> =20
>  	/* A -1 return code indicates that the last command couldn't
> --=20
> 2.37.1

