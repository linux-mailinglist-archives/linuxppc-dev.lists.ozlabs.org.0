Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 391B47F5CD1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 11:48:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=Y1iPTYYo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbZZm0t3jz3dTR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 21:48:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=Y1iPTYYo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbZYw4dJ4z2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 21:47:16 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5c2139492d9so474779a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 02:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700736434; x=1701341234; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pMzVl5pf9UJJ+Fo0I8VraoGZ78XJdMnoApdVbnPwyI=;
        b=Y1iPTYYogOvzVqd7N7cLQf9WY9a+Aaq6gyqp4U99dQ935VGRsQ5s8cMJcryjV4uhII
         tnHfDKqEqbm8lArRQMzIVkhTBrtdmXIiCggyEXQs9lNj5AKN6INvLDkr4QxQaIgO5q+z
         unTpwRomZV4DsF3x4ADxjppYn34VOnLrg4r5MhABHK4Sskl6YbmWcgAjDCRUCR4s/Th7
         mYQnX68SK7aclzou7rUZaz9Vv9LGbSibsa+oSvIVFfUJL76wXohJOQBlJdoT9zKkAOBi
         Z1eNHmG2e6ru1vLn8Fn5NfUXy3IkMUAJmzcpWUZZGpCu82BP7x0J62e4T+4lVcRB1kJF
         gunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700736434; x=1701341234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pMzVl5pf9UJJ+Fo0I8VraoGZ78XJdMnoApdVbnPwyI=;
        b=tmk80buJQbigjF8nrDx5sJRkAmNI5HhxBXJE4eTjHXToWvSjkEm2bcSstUHAV3171O
         ps6SMk0vdrXuZ2bBrdnmPKTmbFyj9CYnygppHJBmrJYPfs3kMCBjnUv3X54JX+PJncxS
         tzfjjZX+lHWpN9iSxxm+MULF8H1K93N/pz4qq58+hadN+kJpQt2ed63U3dv0XUqYAheP
         CnA7e1CU1ZTnokagwgoLvJg0MqAG+KUjK6kbIbWc1GdN5LJtqbAsfX8fYit5L/4JrQ4j
         tUjYxQPA7YNVKFacPYHkLPsi8Aj5T0FBpN38fVxbR1ARGjmXc0OTuZ8UBrmYSOqNicZt
         5BTg==
X-Gm-Message-State: AOJu0YzD++3Z1jvSpLaW+5h+I9d9tF2iz58zGD6tqkFIpZyTOMcilC/V
	xhaFtV/0JSx/hMyCvkOJx9/MYpf5rVeuwNz1SnFP2A==
X-Google-Smtp-Source: AGHT+IENrREiF3sbwAjZt4xq30LW7CVvB2qLXvby7KV+9pgnoiYgGJgV8HcyQnZIfEDxokjnV5oOnnGUF3CBvrBWEKk=
X-Received: by 2002:a17:90a:187:b0:27d:3fa4:9d9a with SMTP id
 7-20020a17090a018700b0027d3fa49d9amr5082578pjc.29.1700736434399; Thu, 23 Nov
 2023 02:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-3-apatel@ventanamicro.com> <20231120-639982716fbfd33a6fc144d6@orel>
In-Reply-To: <20231120-639982716fbfd33a6fc144d6@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Nov 2023 16:17:02 +0530
Message-ID: <CAK9=C2X-cOxjJ-fBLrcvWvP+K8fD=PGucmrWN+m1ZK3j7ae_zg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] RISC-V: Add SBI debug console helper routines
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 20, 2023 at 1:35=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Sat, Nov 18, 2023 at 09:08:56AM +0530, Anup Patel wrote:
> > Let us provide SBI debug console helper routines which can be
> > shared by serial/earlycon-riscv-sbi.c and hvc/hvc_riscv_sbi.c.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/sbi.h |  5 +++++
> >  arch/riscv/kernel/sbi.c      | 43 ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 48 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.=
h
> > index 66f3933c14f6..ee7aef5f6233 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -334,6 +334,11 @@ static inline unsigned long sbi_mk_version(unsigne=
d long major,
> >  }
> >
> >  int sbi_err_map_linux_errno(int err);
> > +
> > +extern bool sbi_debug_console_available;
> > +int sbi_debug_console_write(unsigned int num_bytes, phys_addr_t base_a=
ddr);
> > +int sbi_debug_console_read(unsigned int num_bytes, phys_addr_t base_ad=
dr);
> > +
> >  #else /* CONFIG_RISCV_SBI */
> >  static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) {=
 return -1; }
> >  static inline void sbi_init(void) {}
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index 5a62ed1da453..73a9c22c3945 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -571,6 +571,44 @@ long sbi_get_mimpid(void)
> >  }
> >  EXPORT_SYMBOL_GPL(sbi_get_mimpid);
> >
> > +bool sbi_debug_console_available;
> > +
> > +int sbi_debug_console_write(unsigned int num_bytes, phys_addr_t base_a=
ddr)
> > +{
> > +     struct sbiret ret;
> > +
> > +     if (!sbi_debug_console_available)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (IS_ENABLED(CONFIG_32BIT))
> > +             ret =3D sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRIT=
E,
> > +                             num_bytes, lower_32_bits(base_addr),
> > +                             upper_32_bits(base_addr), 0, 0, 0);
> > +     else
> > +             ret =3D sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRIT=
E,
> > +                             num_bytes, base_addr, 0, 0, 0, 0);
> > +
> > +     return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value=
;
>
> We can't get perfect mappings, but I wonder if we can do better than
> returning ENOTSUPP for "Failed to write the byte due to I/O errors."
>
> How about
>
>  if (ret.error =3D=3D SBI_ERR_FAILURE)
>      return -EIO;
>
>  return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;

Seems overkill but I will update anyway.

>
>
> > +}
> > +
> > +int sbi_debug_console_read(unsigned int num_bytes, phys_addr_t base_ad=
dr)
> > +{
> > +     struct sbiret ret;
> > +
> > +     if (!sbi_debug_console_available)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (IS_ENABLED(CONFIG_32BIT))
> > +             ret =3D sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ=
,
> > +                             num_bytes, lower_32_bits(base_addr),
> > +                             upper_32_bits(base_addr), 0, 0, 0);
> > +     else
> > +             ret =3D sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ=
,
> > +                             num_bytes, base_addr, 0, 0, 0, 0);
> > +
> > +     return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value=
;
>
> Same comment as above.

Okay.

>
> > +}
> > +
> >  void __init sbi_init(void)
> >  {
> >       int ret;
> > @@ -612,6 +650,11 @@ void __init sbi_init(void)
> >                       sbi_srst_reboot_nb.priority =3D 192;
> >                       register_restart_handler(&sbi_srst_reboot_nb);
> >               }
> > +             if ((sbi_spec_version >=3D sbi_mk_version(2, 0)) &&
> > +                 (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
> > +                     pr_info("SBI DBCN extension detected\n");
> > +                     sbi_debug_console_available =3D true;
> > +             }
> >       } else {
> >               __sbi_set_timer =3D __sbi_set_timer_v01;
> >               __sbi_send_ipi  =3D __sbi_send_ipi_v01;
> > --
> > 2.34.1
> >
>
> Otherwise,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> Thanks,
> drew

Regards,
Anup
