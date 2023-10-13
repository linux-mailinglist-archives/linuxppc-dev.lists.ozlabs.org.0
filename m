Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1467C88F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 17:42:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=POZZ/bkr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6W3s1Yh9z3vXF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 02:42:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=POZZ/bkr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6W2z2nZFz3c4y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 02:42:01 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6c644a1845cso1409333a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 08:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697211718; x=1697816518; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58F4pC3mBDu8F+pvcYNIm1FByUJEAPva6M9hCs3f/vs=;
        b=POZZ/bkrHvcctQ1Y/qWD3yKXAMaXLucxuVxXgBD1tPZs7uVEI+6V1Gg4UeB0Xf0x5P
         jxUDjdbybhMCUxFLNe44XFxodExmCN2oKRJjLcUvGI+mNV3oGOI5tdAGakD45Rzcp8oP
         ubkCHCh243bmX9fqn8/xCOOnozw0dOtxKCltx5OLZNEIOCrIL04hrxEXwYfRui4lAwcP
         lkXIhuv07RHEByYpYNVBbrfnv1dUT1RUNsvLL67KKWzan2o8WNuNKr1VI1FUNJf0rKv1
         vgaH9d8GrFTaKoRKKx4mdgYTMKHV7IhYqRmyi5if7+MldLogqzCgBEJSs/AXZgS9kqky
         QdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211718; x=1697816518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58F4pC3mBDu8F+pvcYNIm1FByUJEAPva6M9hCs3f/vs=;
        b=NVG0rdV9dmP5YNwgp+yubTpWuiMPURP56Ks43PvoM3gJHuCMaKQrR6AKgonVcKJ67r
         7Y2ZL+hnmW4hi6I6pUSZOe9HfokSq0KI8NBiPgGSt8C19qlZuKw8cxMGtZQeJWY3uxYF
         dKVKEB5iLbzqF4xDXShp9fckY3PYExh9/BWm6O+H9u5nQDplsVCtPuGsk8gA6zGFRXtz
         5U/KET3elq/7ciPrYc+uh/cepALMoUxLkslinchaDwLTH7gzkgvCjVc1LwaF5JlWLwTH
         w5mcZoJn+tnuI4l9zvCQjxXwzrbqBQZkxhAtbGSED4nkpzlYQ5IeXOxIWR/ICHhlAzjt
         aH5g==
X-Gm-Message-State: AOJu0YyzJOz3rcdYMb8bjGwqdzhTgbUzAbS+xyD89UFipl4p2XTX/onc
	nPwbRvBqwwl8dP0iwYXeAIzESigkgEh+wxi+9BXakw==
X-Google-Smtp-Source: AGHT+IEzcIYsSKMe5bsbRMbzf4xh1PED9ixUfbd1o7ixVah0VHZj9arKWffuv9/jPa1nkBsBkAGklSaRf41sshg9uSY=
X-Received: by 2002:a05:6870:6587:b0:1e9:b7a7:8efe with SMTP id
 fp7-20020a056870658700b001e9b7a78efemr5211668oab.2.1697211718067; Fri, 13 Oct
 2023 08:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-8-apatel@ventanamicro.com> <87fs2ghxyz.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87fs2ghxyz.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 13 Oct 2023 21:11:46 +0530
Message-ID: <CAK9=C2XFTULtQ6YoNHDb7WJwm8p3wkG_pJA8h+XYGEOzt18Ctg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] tty: Add SBI debug console support to HVC SBI driver
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
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
Cc: linux-serial@vger.kernel.org, kvm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 12, 2023 at 5:08=E2=80=AFPM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> Anup Patel <apatel@ventanamicro.com> writes:
>
> > From: Atish Patra <atishp@rivosinc.com>
> >
> > RISC-V SBI specification supports advanced debug console
> > support via SBI DBCN extension.
> >
> > Extend the HVC SBI driver to support it.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  drivers/tty/hvc/Kconfig         |  2 +-
> >  drivers/tty/hvc/hvc_riscv_sbi.c | 76 ++++++++++++++++++++++++++++++---
> >  2 files changed, 70 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
> > index 4f9264d005c0..6e05c5c7bca1 100644
> > --- a/drivers/tty/hvc/Kconfig
> > +++ b/drivers/tty/hvc/Kconfig
> > @@ -108,7 +108,7 @@ config HVC_DCC_SERIALIZE_SMP
> >
> >  config HVC_RISCV_SBI
> >       bool "RISC-V SBI console support"
> > -     depends on RISCV_SBI_V01
> > +     depends on RISCV_SBI
> >       select HVC_DRIVER
> >       help
> >         This enables support for console output via RISC-V SBI calls, w=
hich
> > diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_risc=
v_sbi.c
> > index 31f53fa77e4a..da318d7f55c5 100644
> > --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> > +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> > @@ -39,21 +39,83 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *=
buf, int count)
> >       return i;
> >  }
> >
> > -static const struct hv_ops hvc_sbi_ops =3D {
> > +static const struct hv_ops hvc_sbi_v01_ops =3D {
> >       .get_chars =3D hvc_sbi_tty_get,
> >       .put_chars =3D hvc_sbi_tty_put,
> >  };
> >
> > -static int __init hvc_sbi_init(void)
> > +static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int=
 count)
> >  {
> > -     return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
> > +     phys_addr_t pa;
> > +     struct sbiret ret;
> > +
> > +     if (is_vmalloc_addr(buf))
> > +             pa =3D page_to_phys(vmalloc_to_page(buf)) + offset_in_pag=
e(buf);
>
> What is assumed from buf here? If buf is crossing a page, you need to
> adjust the count, no?

I never saw a page crossing buffer but I will certainly address this
in the next revision.

>
> > +     else
> > +             pa =3D __pa(buf);
> > +
> > +     if (IS_ENABLED(CONFIG_32BIT))
> > +             ret =3D sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRIT=
E,
> > +                             count, lower_32_bits(pa), upper_32_bits(p=
a),
> > +                             0, 0, 0);
> > +     else
> > +             ret =3D sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRIT=
E,
> > +                             count, pa, 0, 0, 0, 0);
> > +     if (ret.error)
> > +             return 0;
> > +
> > +     return count;
> >  }
> > -device_initcall(hvc_sbi_init);
> >
> > -static int __init hvc_sbi_console_init(void)
> > +static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count=
)
> >  {
> > -     hvc_instantiate(0, 0, &hvc_sbi_ops);
> > +     phys_addr_t pa;
> > +     struct sbiret ret;
> > +
> > +     if (is_vmalloc_addr(buf))
> > +             pa =3D page_to_phys(vmalloc_to_page(buf)) + offset_in_pag=
e(buf);
>
> And definitely adjust count here, if we're crossing a page!

Sure, I will update here as well.

Thanks,
Anup
