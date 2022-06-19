Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D284550901
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 08:44:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQjtp0QQ6z3cfB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 16:44:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kJD923+N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=jrdr.linux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kJD923+N;
	dkim-atps=neutral
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQjtD5C5Gz3bY8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 16:44:03 +1000 (AEST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-101dc639636so665522fac.6
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 23:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2+quER5NGMegKQ2+a39UbWGtXnOF3tbSBum9vtozUG4=;
        b=kJD923+NNXgRdj9ITc6HK/8zea4glsSQJyxeZybzDnV6Fwwd/EmO1Zwt+3PDZxnWKv
         zBECdRIOXoTiRbcRPuc3wOSwJJduSkaz8AQe8cIbNYioAhorYJklD9byuNE0LIvaIAnu
         NH25uW1nEmUi/xsprhoWiuFsgmjqw49D+BZKPSA5rNRHuXS6AmYWEpkUXik23O6dyfQc
         QKqU+PO/wqAv++hB9LXcFOSZhI6HfpkDQ2pewrKOm2vbasqdJgrun9VGHr0Hrwqh3QdX
         WeoO0thiML3gwr8TDMjC/pMGW0Km6JsJlOZ5dUYARommebEhfnbaV6eA62C2Rv61Kdhr
         p3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2+quER5NGMegKQ2+a39UbWGtXnOF3tbSBum9vtozUG4=;
        b=SYkUT9YTOwdIDd1BuYHEhtRqXEx3w13w2xaFS1QE9OkELG6G1e6KsGR5ahVT8qMruh
         ZVLf2InA/pm8Jrql7fysaeBZpcURyv9JauyxXqlw/fvUU14PeOCx1DNZzXgjgdJ6NCT2
         7yo0E0gf8JLOH4ixW/Z3FQyTWAT295SgFekz0uFRySuUO1HIY7+xIaOTekYJlRCx+JMe
         VMmIxpG+dBCSOQcJTfjC2Z88WXsbchm8I3a+2tX3TZhUhU2GrxKQD7Rt35ACeGRgxXi0
         28Sx8HUPEc93/4rg3iMKZ46ymxC2/PVpcdmzZVJiklyiNFGSObxNs7t2lwZjtWcpAG7m
         MEdQ==
X-Gm-Message-State: AJIora9+f9Fai6XLi65SirbHXjUqWYcFaFuTLpEF7fraUybLim33o6Gf
	lbv8uJzxZ5aBZ642a9GorkGHhPaY+VYx7xPgHu4=
X-Google-Smtp-Source: AGRyM1trT5fOCkOF2Xj81BWd4Le2VqPCN13/dmgpGUSBE9QY+VGplhzdvJAyDeDeyBriwZHmXZd1cVKJd3KTUpMU8QI=
X-Received: by 2002:a05:6870:d582:b0:fe:4131:6dbb with SMTP id
 u2-20020a056870d58200b000fe41316dbbmr15585590oao.76.1655621040271; Sat, 18
 Jun 2022 23:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220619031114.92060-1-jrdr.linux@gmail.com> <48034eb1-3f37-f4fd-24b3-0eb7e517b35e@infradead.org>
In-Reply-To: <48034eb1-3f37-f4fd-24b3-0eb7e517b35e@infradead.org>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Sun, 19 Jun 2022 12:13:47 +0530
Message-ID: <CAFqt6zYZk43k7deHth3RZHgkD48EaN-et38fCtV97b_qKpy7QA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/interrupt: Put braces around empty body in an
 'if' statement
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kernel test robot <lkp@intel.com>, Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Nick Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 19, 2022 at 11:13 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 6/18/22 20:11, Souptick Joarder wrote:
> > From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>
> >
> > Kernel test robot throws warning ->
> >
> > arch/powerpc/kernel/interrupt.c:
> > In function 'interrupt_exit_kernel_prepare':
> >
> >>> arch/powerpc/kernel/interrupt.c:542:55: warning: suggest
> > braces around empty body in an 'if' statement [-Wempty-body]
> >      542 |                 CT_WARN_ON(ct_state() == CONTEXT_USER);
>
> That must be when CONFIG_CONTEXT_TRACKING_USER is not set/enabled.
> Can you confirm that?

Yes, CONFIG_CONTEXT_TRACKING_USER is not set.
>
> Then the preferable fix would be in <linux/context_tracking.h>:
>
> change
> #define CT_WARN_ON(cond)
>
> to either an empty do-while loop or a static inline function.
>
> (adding Frederic to Cc:)
>
> >
> > Fix it by adding braces.
> >
> > Reported-by: Kernel test robot <lkp@intel.com>
> > Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
> > ---
> >  arch/powerpc/kernel/interrupt.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> > index 784ea3289c84..b8a918bab48f 100644
> > --- a/arch/powerpc/kernel/interrupt.c
> > +++ b/arch/powerpc/kernel/interrupt.c
> > @@ -538,8 +538,9 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
> >        * CT_WARN_ON comes here via program_check_exception,
> >        * so avoid recursion.
> >        */
> > -     if (TRAP(regs) != INTERRUPT_PROGRAM)
> > +     if (TRAP(regs) != INTERRUPT_PROGRAM) {
> >               CT_WARN_ON(ct_state() == CONTEXT_USER);
> > +     }
> >
> >       kuap = kuap_get_and_assert_locked();
> >
>
> --
> ~Randy
