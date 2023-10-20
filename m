Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 800E07D10C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 15:48:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=bPlWy9Hf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBmBG3GZkz3dC5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Oct 2023 00:48:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=bPlWy9Hf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBm9Q2JgRz3cFL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Oct 2023 00:47:20 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6b709048f32so747434b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 06:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697809636; x=1698414436; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujFKaHWQlVUmMQlPTcdZIic60Ioy7TSqQ3nDhHoDDn0=;
        b=bPlWy9HfwRCdPVwnEQhcSVIr9lIbvNRFfDIj/w8V87hIQMoMykdYq9R2dPoaLMYcd7
         CgTm6crZ0WKg6koHtVgIocMqPv5Sd/cWOhifgwynYR2n5UYzlWgdXQAG45jBoEs9zrEq
         3uaYvGzDOKqmJAxSrbMU/BzrxeWsgZHzANEVdc1oAgV38knotZc79+Pg8vLagAtG9Vvx
         3FegQH8BMNC5+jRR+Iz+LTHMUlqoF58EWfqIeXpa9gqsHo32ZlWvPGVxF7RTlfV7Omnw
         fJfrugDdQUIOLcV0h8XclHI9n0Wdt9F1QejlJsQ/39hKQFi5Ye7JCvuzF54Rcofs5BIT
         CM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697809636; x=1698414436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujFKaHWQlVUmMQlPTcdZIic60Ioy7TSqQ3nDhHoDDn0=;
        b=akbnNEUq1KS1KySGw/PoG76CcM+CTvrCCPlo701k66wATCcFtq5jBogt0qeQlP6mG2
         RuvH+uQHC5mJrNX0KHq68H+hQKPrT/j3aUJOOFOLZ5qR1rmnGfZAKFzT09bJDmIXPVde
         o6WBhQZMasJ9iW3cQaGK49kXBhdapDG9lXGOld1BJCFwKijc1tV55rZK124Je6YDsNXc
         Cu5UxJWVFYCoIg/FGnEPVUPZ21X0NvMKku60svluU5R6gvFsTvAntM/MP4YwAo+RWUVI
         l70iTiRVxfbNkI+gPcWOQlsmrtW4VFj0+00DHfQBV59hTw5dtL9BAUBwhDKUOjkXeekG
         RMNw==
X-Gm-Message-State: AOJu0Yzj/FXwXD0UC7WybDicP55odfwJLOovnWDht3xXGLNov4+p4+Cq
	rF5B0HOJIOqnYCgsX81og23ZyiQ2qgKSGcXTQTTUxw==
X-Google-Smtp-Source: AGHT+IEe1qO4q6kLy01GbxGxRAix8XMIPBN+082Nf7nryQBHvgSvHroABh+Pz6NLehEhxMDygq9zBHrYtbpZO8gR1/0=
X-Received: by 2002:a05:6a21:66cb:b0:172:f4e:5104 with SMTP id
 ze11-20020a056a2166cb00b001720f4e5104mr1738132pzb.20.1697809636011; Fri, 20
 Oct 2023 06:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-9-apatel@ventanamicro.com> <20231020-f1ec2b7e384a4cfeae39966f@orel>
In-Reply-To: <20231020-f1ec2b7e384a4cfeae39966f@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 20 Oct 2023 19:17:03 +0530
Message-ID: <CAK9=C2Vg8O_6OaND_s1MhpBHpm1petoU7DNXOOaSOxXYUY1iAw@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] tty: Add SBI debug console support to HVC SBI driver
To: Andrew Jones <ajones@ventanamicro.com>
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
Cc: linux-serial@vger.kernel.org, kvm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 20, 2023 at 4:16=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Fri, Oct 20, 2023 at 12:51:39PM +0530, Anup Patel wrote:
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
> >  drivers/tty/hvc/hvc_riscv_sbi.c | 82 ++++++++++++++++++++++++++++++---
> >  2 files changed, 76 insertions(+), 8 deletions(-)
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
> > index 31f53fa77e4a..56da1a4b5aca 100644
> > --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> > +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> > @@ -39,21 +39,89 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *=
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
> > +     if (is_vmalloc_addr(buf)) {
> > +             pa =3D page_to_phys(vmalloc_to_page(buf)) + offset_in_pag=
e(buf);
> > +             if (PAGE_SIZE < (offset_in_page(buf) + count))
>
> I thought checkpatch complained about uppercase constants being on the
> left in comparisons.

Nope checkpatch does not complain about this.

>
> > +                     count =3D PAGE_SIZE - offset_in_page(buf);
> > +     } else {
> > +             pa =3D __pa(buf);
> > +     }
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
>
> Shouldn't we return ret.value here in case it's less than count? I see we
> already do that below in get().

Ahh, yes. Good catch, I will update.

>
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
> > +     if (is_vmalloc_addr(buf)) {
> > +             pa =3D page_to_phys(vmalloc_to_page(buf)) + offset_in_pag=
e(buf);
> > +             if (PAGE_SIZE < (offset_in_page(buf) + count))
> > +                     count =3D PAGE_SIZE - offset_in_page(buf);
> > +     } else {
> > +             pa =3D __pa(buf);
> > +     }
> > +
> > +     if (IS_ENABLED(CONFIG_32BIT))
> > +             ret =3D sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ=
,
> > +                             count, lower_32_bits(pa), upper_32_bits(p=
a),
> > +                             0, 0, 0);
> > +     else
> > +             ret =3D sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ=
,
> > +                             count, pa, 0, 0, 0, 0);
> > +     if (ret.error)
> > +             return 0;
> > +
> > +     return ret.value;
> > +}
> > +
> > +static const struct hv_ops hvc_sbi_dbcn_ops =3D {
> > +     .put_chars =3D hvc_sbi_dbcn_tty_put,
> > +     .get_chars =3D hvc_sbi_dbcn_tty_get,
> > +};
> > +
> > +static int __init hvc_sbi_init(void)
> > +{
> > +     int err;
> > +
> > +     if ((sbi_spec_version >=3D sbi_mk_version(2, 0)) &&
> > +         (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
> > +             err =3D PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops=
, 16));
>
> Why an outbuf size of only 16?

The output buffer size of 16 is a very common choice across
HVC drivers. The next best choice is 256.

I guess 256 is better so I will go with that.

>
> > +             if (err)
> > +                     return err;
> > +             hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
> > +     } else {
> > +             if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
> > +                     err =3D PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_=
v01_ops, 16));
> > +                     if (err)
> > +                             return err;
> > +                     hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
> > +             } else {
> > +                     return -ENODEV;
> > +             }
> > +     }
> >
> >       return 0;
> >  }
> > -console_initcall(hvc_sbi_console_init);
> > +device_initcall(hvc_sbi_init);
> > --
> > 2.34.1
> >
>
> Thanks,
> drew

Regards,
Anup
