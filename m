Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B977D0CB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 12:07:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=XJbJHUEd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBgHf3Xrtz3vYQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 21:07:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=XJbJHUEd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBgGq09Phz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 21:06:42 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso506785b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697796398; x=1698401198; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0YOpu7rT/QqTy8iuI5dRazXgRC1Ukab7cBL+9gy4Ic=;
        b=XJbJHUEdZ4Msj5aNp3uJmietQ8N21XMcaxcptjkUNfXpAIW07+L2tMDNSIyL3CtIwN
         GSWHo72exdPInGHHLXkrDzNV69ckYzuXtZCtaH/Bqa41+MfOlpVRPJUogeOvHMcFbaN2
         y8/Z8k7qHbAJw83i1JWrdO5aZE/sO8hmJMcs96LaBnz/MjphWhMz8lg8T2E3Rm+HIGog
         PnhUMpynkECjuiFXkhgqScPksQhM/KUmdLgItcGmhwRlhRiyuo+MrA/Y+mKW6Fuqbyuy
         DQM9yDC0wcOD4641eCpauD4pMC9oqNOf5NUbQcNUaUb/paPzoSVL8XZMdT7QDN4yH6bH
         n3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697796398; x=1698401198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0YOpu7rT/QqTy8iuI5dRazXgRC1Ukab7cBL+9gy4Ic=;
        b=MYi4p9YUveHPO3q7Eeuq64HnX3K0hZZvGpE9DVOq+IhPtTN74r9HHnhMB6ZEnLjeSr
         AV5E0idU41rhLqaSViI0Kxfzv0NECjtBWHi+vEDK4KnzH7ru4xz+NPQQHGIHNElvdfUA
         kuZ44OU0A7Px75OV1GNkfWsY5CTvkXZ/KTUVy7NbGcZMKuiein7o1xWEcqlfiqs2Jm5d
         ifBEp3ebtg2od4h1VvhGj9PuVDvdmzprLQTKL+vUkLY0MRJqCEsVoWeFlMzauetEkchS
         RHToO23I99Rdq/i13ZERXmYDjuEUWYRsU1khtTD++cX3ol8fk2+I28DUN95SMCwkrAIf
         zGqA==
X-Gm-Message-State: AOJu0Yx74vkoWKGr7UXpXBh7zfJP84y8A+A6pZ1Yd7/cmqDzI0f8sK21
	jYKvB6fb8KAy+KHbN3Jef8SWMxIwIPa5ekSNq0lUrQ==
X-Google-Smtp-Source: AGHT+IEBzXt8JfC9x1TW5x5JgWjODdGFRcged+43rxtT/zbYgt03X8xn6eJrhjX3Tc0jf12JuE1HThvuDkHZ4TvXIUs=
X-Received: by 2002:a05:6a21:1a5:b0:17a:e981:817e with SMTP id
 le37-20020a056a2101a500b0017ae981817emr1962557pzb.3.1697796398116; Fri, 20
 Oct 2023 03:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-9-apatel@ventanamicro.com> <87mswdbot2.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87mswdbot2.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 20 Oct 2023 15:36:25 +0530
Message-ID: <CAK9=C2XrDCpq6cGCJu2CVowiksxunGwfF4JxwEZ_k85+3bU1+Q@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] tty: Add SBI debug console support to HVC SBI driver
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

On Fri, Oct 20, 2023 at 3:25=E2=80=AFPM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
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
> > +                     count =3D PAGE_SIZE - offset_in_page(buf);
>
> Thanks for fixing the cross-page issue. Now you're cutting the buffer
> off. What about doing two SBI calls instead? (Dito on the get side)

We don't need to handle that because the hvc_console framework
will ensure remaining characters are sent-out. Same applies to
get side as well.

Regards,
Anup
