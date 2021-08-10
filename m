Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9DA3E5583
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 10:34:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkR7v2dBzz3bWH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 18:34:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZX9kpQH2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=sxwjean@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZX9kpQH2; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkR7B3LJ3z304j
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 18:33:41 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id w20so13248645lfu.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 01:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p2Fr5BJzhcYbE5uoZF3uMydSpmFYCPWUAIM4ZDQIAO8=;
 b=ZX9kpQH2G3eesgI+qHAHL1ZSUCALh+QYm9VkNA2ZVb4n/vvxRRGVrH2bWa1vk9TrG4
 WxOt/pG3CQ1DojqpbuVR2VUvdEnpDh82SwV8LJ9fHWaqlMshBTghsuUy7R+K9Kq1I5EH
 eD5wvl1lFJ7sEiLKpGMZ84snliGClZ20x7TIZZvnTuJaGmti15gmHEEtLmmi9rpM/QYg
 mXzrXV1qeourKNTywlvA3jrQcO2M+coW+i0DxdbhOD676KkBDzhAk2zMfu5zHwUhRu/o
 Sp89C5VSXEQPSyKKGrBmI9gRUzAObj3Y29jcYXn/Cn617MSfFtEqsBJ7EoU54HxTwYBa
 d69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p2Fr5BJzhcYbE5uoZF3uMydSpmFYCPWUAIM4ZDQIAO8=;
 b=CzYQV7gFJwzxGcPe36lOlje/L82vLiHSwU0GTPR4bG6u2nQRHhuqKSlRsNqaj6YM46
 nhvs0yGm/Q431caVfdaFGFvXdr3NY8fqFxLlfK+FTzM6ynRB5APPMqxeKi7m1HBJ1YC/
 +LstLVcoFnTC8o/pEXhp0VMTAX+MJsYWUevHyGKyu3xXw5sx1ovoB9+jfyTOYfF2UyQe
 BSG7ykkSaiJTOHLNBWpLdctA1mALZEjoH5QmeJT/9XivU7jRP/9sQZMmoMI5lyx1gSRZ
 wdZL469DyhCWCWqbKuW+PkWWHl1qN7zAQBqB4/81uUEvt6quNo+gvpj2oqrliJVjnQJF
 rMPw==
X-Gm-Message-State: AOAM5317xKnA4ZKUXP46y7HZvcu+UG/NOv2yMFs7W7Fbv5Fo4GdEChN8
 KdiuOiKavTPHjTKscwIjDesF2+M2OKFrtSaYSwk=
X-Google-Smtp-Source: ABdhPJyrI9dStbUFIFtHPxBjTNID3TeK9D5oT0XbVpIxhRowhuOAkAEEEqiEYMCwd5D31/PuAwcBbvCpSVEWo7Kufs4=
X-Received: by 2002:a05:6512:53c:: with SMTP id
 o28mr21246802lfc.641.1628584414971; 
 Tue, 10 Aug 2021 01:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210807010239.416055-1-sxwjean@me.com>
 <20210807010239.416055-2-sxwjean@me.com>
 <127de0c7-5e30-6797-1e72-6414d4a60119@csgroup.eu>
In-Reply-To: <127de0c7-5e30-6797-1e72-6414d4a60119@csgroup.eu>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Tue, 10 Aug 2021 16:33:08 +0800
Message-ID: <CAEVVKH_G1GjofNU4M0mtuaOAtLyTZ+Fcjjr3ywqeXJrJVwpgrA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] powerpc: Optimize register usage for esr register
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: ravi.bangoria@linux.ibm.com, Xiongwei Song <sxwjean@me.com>,
 oleg@redhat.com, npiggin@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, efremov@linux.com,
 Paul Mackerras <paulus@samba.org>, aneesh.kumar@linux.ibm.com,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 7, 2021 at 2:57 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 07/08/2021 =C3=A0 03:02, sxwjean@me.com a =C3=A9crit :
> > From: Xiongwei Song <sxwjean@gmail.com>
> >
> > Create an anonymous union for dsisr and esr regsiters, we can reference
> > esr to get the exception detail when CONFIG_4xx=3Dy or CONFIG_BOOKE=3Dy=
.
> > Otherwise, reference dsisr. This makes code more clear.
> >
> > Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> > ---
> >   arch/powerpc/include/asm/ptrace.h          | 5 ++++-
> >   arch/powerpc/kernel/process.c              | 2 +-
> >   arch/powerpc/kernel/ptrace/ptrace.c        | 2 ++
> >   arch/powerpc/kernel/traps.c                | 2 +-
> >   arch/powerpc/platforms/44x/machine_check.c | 4 ++--
> >   arch/powerpc/platforms/4xx/machine_check.c | 2 +-
> >   6 files changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/a=
sm/ptrace.h
> > index 3e5d470a6155..c252d04b1206 100644
> > --- a/arch/powerpc/include/asm/ptrace.h
> > +++ b/arch/powerpc/include/asm/ptrace.h
> > @@ -44,7 +44,10 @@ struct pt_regs
> >   #endif
> >                       unsigned long trap;
> >                       unsigned long dar;
> > -                     unsigned long dsisr;
> > +                     union {
> > +                             unsigned long dsisr;
> > +                             unsigned long esr;
> > +                     };
> >                       unsigned long result;
> >               };
> >       };
> > diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/proces=
s.c
> > index 185beb290580..f74af8f9133c 100644
> > --- a/arch/powerpc/kernel/process.c
> > +++ b/arch/powerpc/kernel/process.c
> > @@ -1499,7 +1499,7 @@ static void __show_regs(struct pt_regs *regs)
> >           trap =3D=3D INTERRUPT_DATA_STORAGE ||
> >           trap =3D=3D INTERRUPT_ALIGNMENT) {
> >               if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
> > -                     pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, reg=
s->dsisr);
> > +                     pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, reg=
s->esr);
> >               else
> >                       pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, re=
gs->dsisr);
> >       }
> > diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/=
ptrace/ptrace.c
> > index 0a0a33eb0d28..a222fd4d6334 100644
> > --- a/arch/powerpc/kernel/ptrace/ptrace.c
> > +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> > @@ -375,6 +375,8 @@ void __init pt_regs_check(void)
> >                    offsetof(struct user_pt_regs, dar));
> >       BUILD_BUG_ON(offsetof(struct pt_regs, dsisr) !=3D
> >                    offsetof(struct user_pt_regs, dsisr));
> > +     BUILD_BUG_ON(offsetof(struct pt_regs, esr) !=3D
> > +                  offsetof(struct user_pt_regs, dsisr));
>
> esr and dsisr are the same, so checking the same thing a second time is p=
ointless.

Hmm...it's better to check if the changes on pt_regs structure is
expected I think.

Regards,
Xiongwei

>
> >       BUILD_BUG_ON(offsetof(struct pt_regs, result) !=3D
> >                    offsetof(struct user_pt_regs, result));
> >
> > diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> > index dfbce527c98e..2164f5705a0b 100644
> > --- a/arch/powerpc/kernel/traps.c
> > +++ b/arch/powerpc/kernel/traps.c
> > @@ -562,7 +562,7 @@ static inline int check_io_access(struct pt_regs *r=
egs)
> >   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
> >   /* On 4xx, the reason for the machine check or program exception
> >      is in the ESR. */
> > -#define get_reason(regs)     ((regs)->dsisr)
> > +#define get_reason(regs)     ((regs)->esr)
> >   #define REASON_FP           ESR_FP
> >   #define REASON_ILLEGAL              (ESR_PIL | ESR_PUO)
> >   #define REASON_PRIVILEGED   ESR_PPR
> > diff --git a/arch/powerpc/platforms/44x/machine_check.c b/arch/powerpc/=
platforms/44x/machine_check.c
> > index a5c898bb9bab..5d19daacd78a 100644
> > --- a/arch/powerpc/platforms/44x/machine_check.c
> > +++ b/arch/powerpc/platforms/44x/machine_check.c
> > @@ -11,7 +11,7 @@
> >
> >   int machine_check_440A(struct pt_regs *regs)
> >   {
> > -     unsigned long reason =3D regs->dsisr;
> > +     unsigned long reason =3D regs->esr;
> >
> >       printk("Machine check in kernel mode.\n");
> >       if (reason & ESR_IMCP){
> > @@ -48,7 +48,7 @@ int machine_check_440A(struct pt_regs *regs)
> >   #ifdef CONFIG_PPC_47x
> >   int machine_check_47x(struct pt_regs *regs)
> >   {
> > -     unsigned long reason =3D regs->dsisr;
> > +     unsigned long reason =3D regs->esr;
> >       u32 mcsr;
> >
> >       printk(KERN_ERR "Machine check in kernel mode.\n");
> > diff --git a/arch/powerpc/platforms/4xx/machine_check.c b/arch/powerpc/=
platforms/4xx/machine_check.c
> > index a71c29892a91..a905da1d6f41 100644
> > --- a/arch/powerpc/platforms/4xx/machine_check.c
> > +++ b/arch/powerpc/platforms/4xx/machine_check.c
> > @@ -10,7 +10,7 @@
> >
> >   int machine_check_4xx(struct pt_regs *regs)
> >   {
> > -     unsigned long reason =3D regs->dsisr;
> > +     unsigned long reason =3D regs->esr;
> >
> >       if (reason & ESR_IMCP) {
> >               printk("Instruction");
> >
