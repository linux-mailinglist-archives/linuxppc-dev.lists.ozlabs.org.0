Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E34B7EF354
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 14:05:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gVF++t3j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWxw93bxTz3dHf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 00:05:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gVF++t3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWxvH47qVz30LM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 00:04:41 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-280109daaaaso1520110a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 05:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1700226279; x=1700831079; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/F1OxU0rX7/2Awza+ieBvlQ9jwzfprHoNUntAoYQeA=;
        b=gVF++t3jnLfMeqW/du92tbLMQHrVTJfZXSTh+IEE2o2jLKSz7dhnQs3SWeoyZMZPw1
         xkwvzlDDlALHzRodPCf2f7xmda82pXiy+n06dYoLuRJGR0juK7JrelObADHqmhmrg9Po
         laVJBtxnb9MMN0nurhkU4ejx1227QDP/DNxl8vahKFBDrcsXn/a7CL+sM9YGDt5Vvl6j
         qkE+nVaRf5TUZauEnRipLE7EN0Cu+O2ra6G8pxwk9EXpFoZ2180OqDlGxAUS5Kn1aUwD
         A2DMdXhOSkGZfDt26M8EihiQIMonYvb0T09LvOiaCiS0Gt6YHfqJLuNuLsdWwhrPbKHQ
         XZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700226279; x=1700831079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/F1OxU0rX7/2Awza+ieBvlQ9jwzfprHoNUntAoYQeA=;
        b=lYZmYHvgIqnGgOad1ocMY+phyuzvT+3vH7RV/oIEJizxzo+QUHG0P9JRvTnUan5LtS
         2s7/j2Yv6YaWh5gQbUEHIXw0DR6FWAu08XHoFEKM56f0yptttXeMPALViEMZIWJ12YU+
         B31Biu/BRx6y5PRyPTb+zUNstqk6QQdY6BW/Rc3Utw+HYgGUhCEwsCJiJ7BhWoq2Bf0d
         vQGCDhHFJ7sFoFuYBZXR7VW3HQTZQfbi4xpn6MA3YflsNkFNiZ90LBFnOfsgN6ruVGFK
         EI7TeU3hKC/uW4K6sx5LYQ0Hsv6bVkIcnsQTBCCgFKai8Vcl24XMUYTILcCxYVwYV0mm
         I5VQ==
X-Gm-Message-State: AOJu0YxigVWqOrPkFw49Q7RGFQS7G7mzAgFRw2dcUIuIjoNmjRKwN2UP
	Td9OfsrUEexKKbP4zk3zel4VfaiXNe9wgVC/rPfjJg==
X-Google-Smtp-Source: AGHT+IEtPzE7lEOx2d7Ysp4LwrL/GBmShcmNUU9lJo3FtmpAf6sriMDVi9emlG1mMx8Yan2mKYsw1q3eMsjqCt3Pm70=
X-Received: by 2002:a17:90b:3904:b0:274:8949:d834 with SMTP id
 ob4-20020a17090b390400b002748949d834mr13014202pjb.49.1700226278671; Fri, 17
 Nov 2023 05:04:38 -0800 (PST)
MIME-Version: 1.0
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-7-apatel@ventanamicro.com> <2023102113-harsh-trout-be8f@gregkh>
In-Reply-To: <2023102113-harsh-trout-be8f@gregkh>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 18:34:27 +0530
Message-ID: <CAAhSdy1Beq-Qnio3E+Am0jVQ7ECaWa1HH2A1JkWRPN5y8tsgAQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] RISC-V: Add stubs for sbi_console_putchar/getchar()
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-serial@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 21, 2023 at 10:05=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 20, 2023 at 12:51:37PM +0530, Anup Patel wrote:
> > The functions sbi_console_putchar() and sbi_console_getchar() are
> > not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
> > stub of these functions to avoid "#ifdef" on user side.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/sbi.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.=
h
> > index 12dfda6bb924..cbcefa344417 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -271,8 +271,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned=
 long arg0,
> >                       unsigned long arg3, unsigned long arg4,
> >                       unsigned long arg5);
> >
> > +#ifdef CONFIG_RISCV_SBI_V01
> >  void sbi_console_putchar(int ch);
> >  int sbi_console_getchar(void);
> > +#else
> > +static inline void sbi_console_putchar(int ch) { }
> > +static inline int sbi_console_getchar(void) { return -1; }
>
> Why not return a real error, "-1" isn't that :)

As-per SBI spec, the legacy sbi_console_getchar() returns
-1 upon failure hence the code.

Refer, section 5.3 of the latest SBI spec
https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/commit-fe4=
562532a9cc57e5743b6466946c5e5c98c73ca/riscv-sbi.pdf

Although, the users of this function only expect a negative
value upon failure so better to return proper error code here.

I will update.

>
> thanks,
>
> greg k-h
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

Regards,
Anup
