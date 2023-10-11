Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AAF7C4971
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:52:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=iSbeW8NL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S523Q5TbTz3vgJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 16:52:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=iSbeW8NL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S522Z3P5zz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 16:51:33 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-694f75deb1aso484066b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 22:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697003488; x=1697608288; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgOOUrxhrQpKc0UcO6mj9tBnrpY40gn5l4EwRcu1NOI=;
        b=iSbeW8NLqZMbm0sPhLXlC//HGU7DHtuElJm7Cn2S8w91FP6aV0vkixiYvuRs/c+RSS
         t82xALgV0BtQ7JQ/0BBTtLjSv28aX1WXxEb4G21g1Pm4xaD074OCzUdhnhCIgQ7nHMLr
         S83OpADfMNurMCxYvIaUFqLBttD5TNlb4l1pcq4daXOHS3elYoQyUJHJaC5unonSkTrp
         lP6XHs819wQSAEyP6a9gzqtIwxXfE4Wa/f4EsDfaAQXp8Y/FUoAdJW/c6Ir2v1GJy3zI
         pR6gno7//MvB8gMq9NwthNs2tOIhHLGhW8JKZwMkQFvfkVq4/D6Q15uezMQ4lVE8DFXk
         /2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697003488; x=1697608288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgOOUrxhrQpKc0UcO6mj9tBnrpY40gn5l4EwRcu1NOI=;
        b=kt9MrW8yBbcaIz0YTPx2JAGZKUGo1anFxRmRjLym3hZyxAuKGeX1ovr7oPLx0RIXTf
         ps+GKtJQoAwI2S6WHPYMAYgGIlrYPQYsfq88LmzK5fApzrNHNBWzkOx3hOXrw+z7KO4O
         WfdywV5nv7z1ou4hoRDGf5wJfyCQ0meGkIXgGarrzc/NeHt/0XIfqIvjD2SLXtEbhtou
         cNwogO5RJvmbFlN1WPKBBdCDPivJrqOzKalVCrlT18ekQy3WkIYxNSEH0+KJPQ06npc/
         QepE3dsDO6Yq2ihulg2GdhqNMRnT0bHdT1aWmNmnKlIA/ZAYlTTwEqFYM8r1th92aeOU
         SwXQ==
X-Gm-Message-State: AOJu0YwNfV8QVpFEQnDtFhNFtg4kOgtWLSNlP8uvnq0PbyuUd+d/gVkv
	QW72CCFunmkjggnjyFpi9IWamkdp1OVcq4qIejaXbw==
X-Google-Smtp-Source: AGHT+IEAxE7QdFbbOPuVcJD52vAqLrqPEDqxTXMyXoDEBFNSRVwd6lB/XppSiIl4XgAPPxR1exDjPPNx2wJzk6+Jr1M=
X-Received: by 2002:a17:90a:af86:b0:277:4be4:7a84 with SMTP id
 w6-20020a17090aaf8600b002774be47a84mr25295223pjq.19.1697003487902; Tue, 10
 Oct 2023 22:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-6-apatel@ventanamicro.com> <2023101045-hazard-popcorn-7d19@gregkh>
In-Reply-To: <2023101045-hazard-popcorn-7d19@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 11:21:17 +0530
Message-ID: <CAK9=C2WvfPg1tCpNLgDteaQGBVAsPL3S+vdvgEsBb8PCx2W8xw@mail.gmail.com>
Subject: Re: [PATCH 5/6] tty: Add SBI debug console support to HVC SBI driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: linux-serial@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 10, 2023 at 10:42=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 10, 2023 at 10:35:02PM +0530, Anup Patel wrote:
> > --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> > +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> > @@ -15,6 +15,7 @@
> >
> >  #include "hvc_console.h"
> >
> > +#ifdef CONFIG_RISCV_SBI_V01
>
> Please no #ifdef in a .c file, that's not a good style for Linux code at
> all.
>
> And what if you want to build the driver for both options here?  What
> will happen?

Okay, I will remove all #ifdef from .c file

>
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
> > +     else
> > +             pa =3D __pa(buf);
> > +
> > +     ret =3D sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> > +#ifdef CONFIG_32BIT
> > +               count, pa, (u64)pa >> 32,
> > +#else
> > +               count, pa, 0,
> > +#endif
>
> This is not how to do an api, sorry, again, please no #ifdef if you want
> to support this code for the next 20+ years.

Sure, I will update like you suggested.

>
> thanks,
>
> gre gk-h

Thanks,
Anup
