Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C99DF3550F4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 12:32:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF3kk6LCnz30Dl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 20:32:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.178;
 helo=mail-vk1-f178.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF3kP3TZKz301B
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 20:32:28 +1000 (AEST)
Received: by mail-vk1-f178.google.com with SMTP id s136so3079332vks.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Apr 2021 03:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ad26/T6d/ZnNr0Tc5NnJUf1s5ObiAcmgTWkpXBwrq1s=;
 b=USMoFUm2FyNJKKkm8vG53gDBb+nVkxIw5EhWVfmLqsXl8BzStxZte6xSXZiVjuAdbF
 Aj/KV7ukIrYiMqAkuZqnRz4xXlK5Ll3oIdSEBbrTkpvFsjtNZmQcE1fHZyDaK1PqSg87
 Eg7d7WoQOEPq/gzYfGjFmiZ1t9HxZhg3UWqxd0MpnVM5XOdMm64MhDRe5jx9zj67MIxA
 y9X4hm45fmFMQUmx3ANYq8rUjwEIJLkqTsLWhLy7rFMKhSMugNJNPcTTqQoDjlVAI3Za
 F5BKYEcOtMlx+BBekflWj8fMxfDIvWLBEbNonI3v8z5UydRdN4svtg51knpycuxs5Ej3
 s5VA==
X-Gm-Message-State: AOAM530VhNwhKldKwyub7nVx1rhj1LSxmGRLcZxJz0EMAIezHzxrO6U+
 WGFPm10J/8Ff/UgAlQMwD8sCeES4KCQR0gRMOxg=
X-Google-Smtp-Source: ABdhPJy1swYAK/t2TkG9rGJSNoiYM20SgQO0c4AaA+qpOekp59c92sXbMIYRR9yEXm+63bCKT7TrhAbrySdgxepVyHQ=
X-Received: by 2002:ac5:ce04:: with SMTP id j4mr15807523vki.1.1617705144686;
 Tue, 06 Apr 2021 03:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210406093557.1073423-1-maz@kernel.org>
 <20210406093557.1073423-5-maz@kernel.org>
In-Reply-To: <20210406093557.1073423-5-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Apr 2021 12:32:13 +0200
Message-ID: <CAMuHMdU3vo1AWuDr69WK8-1w38+Q7KturAoL=cFpspZiYr2ssA@mail.gmail.com>
Subject: Re: [PATCH 4/9] sh: intc: Drop the use of
 irq_create_identity_mapping()
To: Marc Zyngier <maz@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Marc,

On Tue, Apr 6, 2021 at 11:44 AM Marc Zyngier <maz@kernel.org> wrote:
> Instead of playing games with using irq_create_identity_mapping()
> and irq_domain_associate(), drop the use of the former and only
> use the latter, together with the allocation of the irq_desc
> as needed.
>
> It doesn't make the code less awful, but at least the intent
> is clearer.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Thanks for your patch!

> --- a/drivers/sh/intc/core.c
> +++ b/drivers/sh/intc/core.c
> @@ -179,6 +179,23 @@ static unsigned int __init save_reg(struct intc_desc=
_int *d,
>         return 0;
>  }
>
> +static bool __init intc_map(struct irq_domain *domain, int irq)
> +{
> +       int res;

warning: unused variable =E2=80=98res=E2=80=99 [-Wunused-variable]

> +
> +       if (!irq_to_desc(irq) && irq_alloc_desc_at(irq, NUMA_NO_NODE) !=
=3D irq) {
> +               pr_err("uname to allocate IRQ %d\n", irq);
> +               return false;
> +       }
> +
> +       if (irq_domain_associate(domain, irq, irq)) {
> +               pr_err("domain association failure\n");
> +               return false;
> +       }
> +
> +       return true;
> +}
> +
>  int __init register_intc_controller(struct intc_desc *desc)
>  {
>         unsigned int i, k, smp;
> @@ -316,19 +333,8 @@ int __init register_intc_controller(struct intc_desc=
 *desc)

warning: unused variable =E2=80=98res=E2=80=99 [-Wunused-variable]

>                 if (!vect->enum_id)
>                         continue;
>
> -               res =3D irq_create_identity_mapping(d->domain, irq);


> -               if (unlikely(res)) {
> -                       if (res =3D=3D -EEXIST) {
> -                               res =3D irq_domain_associate(d->domain, i=
rq, irq);
> -                               if (unlikely(res)) {
> -                                       pr_err("domain association failur=
e\n");
> -                                       continue;
> -                               }
> -                       } else {
> -                               pr_err("can't identity map IRQ %d\n", irq=
);
> -                               continue;
> -                       }
> -               }
> +               if (!intc_map(d->domain, irq))
> +                       continue;
>
>                 intc_irq_xlate_set(irq, vect->enum_id, d);
>                 intc_register_irq(desc, d, vect->enum_id, irq);

Otherwise this seems to work fine on real hardware (landisk) and qemu
(rts7751r2d).  I did verify that the new function intc_map() is called.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
