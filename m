Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E607F289C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 10:21:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=y54Eeyqq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZJmH5GS7z3dSC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 20:21:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=y54Eeyqq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=atishp@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZHQh73jvz3w4X
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 19:21:32 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso7425081e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 00:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700554882; x=1701159682; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eigScL5e5mup7Z3+ShdJXrR842NJQMOChPfOYWt/3l8=;
        b=y54EeyqqMsn7PGMe+1d7KMGa8MeT6TGc6kf7W82uqXro2LkwREFXJAU6JEVUuVYdWO
         ezGswI0id42TEBqJ1jlFF8ZAMYjR/iDTj/ojp8grOY+hdAsl+2pO8WhMHIhKTnztYzyH
         RNpuEXINOnLEz/CL8fYAyhlz/dJn1qONLd3Z97ksrEYHWPKM6oHL6Xoau7LjGgDc7xQx
         OKt+B0eLCaUnCmxs+JL7Pwk/9Xwl1aLijEnhUaxakS4i5fBVgrfBkCf9iFl3V+ef5ioC
         ZXuPS5L7d//peCHwLG/I9yAbHsqgOwb1T1Cxk02aiZC4ViiD9kYMK9c5ePxs8SbjFwg+
         3Iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700554882; x=1701159682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eigScL5e5mup7Z3+ShdJXrR842NJQMOChPfOYWt/3l8=;
        b=fmbqGyU3oxBxKbwwqoC0oeS+/sE2jyz38+UAjXlFkd3nOcZ9YS1Vt9LXKcuFJ2Gp3J
         u/1a/cDUReEphBU427lPfJzGvuv07mHCZ//O+4WfXVUP78rXigYMH3vg/u90s1hA1XI8
         v7gIJaTysCkXaTTr4U9QakIfjVSUFpSMoIMv9y0/FMLy2vzUGa7MZoib4Pfwt5o3r5Vw
         l+/sjALL/iGYKgiCeGTehBndrFzQyGi5kckGlytGtXj+niFYPmr3gVbsPTKoC8tEmtRU
         PiB1nbTtNZQyEAJEH7B7x/UndwKkx0TLc10A/FjRkpHRTHMkjcB/M89hkHnTFYaOlA4R
         /Sfw==
X-Gm-Message-State: AOJu0Yzlm60JJcVPlXN9kWgH8tiTGHmWLg0l6cAUEoy2ys2yzW4sGW1h
	/0o3K05hgS2IiENqKWPcnQev6NyjwWZoozHQ25Cbbg==
X-Google-Smtp-Source: AGHT+IGbr2XYSRwYN9sWNDSkKbTgz7fmIbWZKQo/3+nZwrm2DQiOQ819Z3adb6Rl/lF0tqkEzzFHe3gA2gKk/dP5AMM=
X-Received: by 2002:a05:6512:398c:b0:50a:aa8d:1a60 with SMTP id
 j12-20020a056512398c00b0050aaa8d1a60mr6848280lfu.48.1700554882341; Tue, 21
 Nov 2023 00:21:22 -0800 (PST)
MIME-Version: 1.0
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-5-apatel@ventanamicro.com> <1dd7f7b4-d2ba-4216-ac3f-3552c2bee24b@kernel.org>
In-Reply-To: <1dd7f7b4-d2ba-4216-ac3f-3552c2bee24b@kernel.org>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 21 Nov 2023 00:21:11 -0800
Message-ID: <CAHBxVyG-DK9cDqPedJcR2W2=LQFumQQ_0Z0UUdbbzgju7BaAtg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] tty: Add SBI debug console support to HVC SBI driver
To: Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 21 Nov 2023 20:20:18 +1100
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
Cc: Anup Patel <apatel@ventanamicro.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 19, 2023 at 11:16=E2=80=AFPM Jiri Slaby <jirislaby@kernel.org> =
wrote:
>
> On 18. 11. 23, 4:38, Anup Patel wrote:
> > diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_risc=
v_sbi.c
> > index 31f53fa77e4a..697c981221b5 100644
> > --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> > +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> ...
> > -static int __init hvc_sbi_console_init(void)
> > +static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count=
)
> >   {
> > -     hvc_instantiate(0, 0, &hvc_sbi_ops);
> > +     phys_addr_t pa;
> > +
> > +     if (is_vmalloc_addr(buf)) {
>
> I wonder, where does this buf come from, so that you have to check for
> vmalloc?
>

When VMAP_STCK is enabled, stack allocation depends on the vmalloc.
That's why we have to if the buf is allocated using vmalloc.

> > +             pa =3D page_to_phys(vmalloc_to_page(buf)) + offset_in_pag=
e(buf);
> > +             if (PAGE_SIZE < (offset_in_page(buf) + count))
>
> Am I the only one who would prefer:
>    if (count + offset_in_page(buf) > PAGE_SIZE)
> ?
>
> > +                     count =3D PAGE_SIZE - offset_in_page(buf);
> > +     } else {
> > +             pa =3D __pa(buf);
> > +     }
> > +
> > +     return sbi_debug_console_read(count, pa);
> > +}
>
>
> thanks,
> --
> js
> suse labs
>
