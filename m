Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE87F5C9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 11:39:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=Jr7qQETC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbZP62zqCz3dT4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 21:39:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=Jr7qQETC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbZND5mQjz2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 21:38:52 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5c2139492d9so470347a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 02:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700735929; x=1701340729; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtWJos9eJonIZMcnZ3qHTztIEX4OrKTTJCiVLASavc8=;
        b=Jr7qQETCB1sJ/xLhiG31/Su/32OYQA/yYc2c8ggpEExc49gOY0rhGMni4q22gCoqKU
         7+NN0FlheGRfQeVyw4SVn57UihxSx4SYOURHrMWE+hPKIg+hDchmJKtjVuymR97mzDd6
         mPqEW+5IZG6GBVgEtX0piOO2Fcm8SP5Kd+IP3U4NjBCx/RxzDwntq5Fd67CI+2W2dgtR
         C0gdmek7wkQGsH0IuSLNmL8x2k2fH80Ru9hjPmDBdyCNs24tjA8XeaW9MqxR3FhKmGDI
         NLnUpWCUM5nSyUJRMaYxi+vGjy+JTBOXViq+gO5Ir50hWVEuOUb71iIYPt2ecSrdXZ+C
         yG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700735929; x=1701340729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtWJos9eJonIZMcnZ3qHTztIEX4OrKTTJCiVLASavc8=;
        b=SSqlrJ9hRJNkb7HUBYL57LZ5mdJYiqBuaHa4r7wN+sBkzcJoTWN1QoKOQOF7WX7EXw
         BQqaFzx8+5txIJqZBUAdkI/vnn+7qvSQjLlCn5hJl6xaQOcp0PykdC1zjIKwU0Pja98Z
         dm9/tO2ihq9odCZkdVCmPDWViKCaO1e9FnKLN8G01fivG1hap2kZSEtEtWkirplrEWD3
         yQyk8Tk2x6gyzRxoDci3TBDG4mLVwOnKYB1yeR1pscifASLwEHWI+ILIZLLQH6nrZztQ
         z1exk8eEEVn5vBXfdbe87wETKyemw694A5dSucWLe4ZhQn6k5L5voiRaHBkPkDcuhHKG
         r3mQ==
X-Gm-Message-State: AOJu0YzfPjm+jn5RK0YNaJnIe7XixPY98iEJFkfybMXLJvMvATTfTc51
	UE/XffnWQsa/0LW2TEEA9XAwKiAuDO9BE+E8qHR+l0k2hRoR0Do2JBQ=
X-Google-Smtp-Source: AGHT+IHvryOzXWmfb9qEZWfYxLmtqn4CX5rtr/8r6s4TMLtNZgUWu2Uht2WYKwskvoiWScCKfk/YfcsxnyZ6UyDhj40=
X-Received: by 2002:a05:6a20:be9c:b0:187:200a:713f with SMTP id
 gf28-20020a056a20be9c00b00187200a713fmr3721171pzb.23.1700735928664; Thu, 23
 Nov 2023 02:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-2-apatel@ventanamicro.com> <70ff59ea-378c-4d53-899a-eafffcad22fd@sifive.com>
In-Reply-To: <70ff59ea-378c-4d53-899a-eafffcad22fd@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Nov 2023 16:08:36 +0530
Message-ID: <CAK9=C2U9aJDDd0JUhRqyLCF3dfyY5QBUrgyH+PKsT+pUKiB1xQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
To: Samuel Holland <samuel.holland@sifive.com>
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
Cc: Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 22, 2023 at 4:06=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Anup,
>
> On 2023-11-17 9:38 PM, Anup Patel wrote:
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
> > index 0892f4421bc4..66f3933c14f6 100644
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
> > +static inline int sbi_console_getchar(void) { return -ENOENT; }
>
> "The SBI call returns the byte on success, or -1 for failure."
>
> So -ENOENT is not really an appropriate value to return here.

Actually, I had -1 over here previously but based on GregKH's
suggestion, we are now returning proper Linux error code here.

Also, all users of sbi_console_getchar() onlyl expect a negative
value upon error so better to return proper Linux error code.

>
> Regards,
> Samuel
>
> > +#endif
> >  long sbi_get_mvendorid(void);
> >  long sbi_get_marchid(void);
> >  long sbi_get_mimpid(void);
>

Regards,
Anup
