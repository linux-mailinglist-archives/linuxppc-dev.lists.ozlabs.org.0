Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FF27C4AD2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 08:42:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=I7SdvZWA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S539C19LFz3wL7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 17:42:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=I7SdvZWA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S52fl1rVvz3vdb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 17:19:26 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-69af8a42066so3969122b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 23:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697005164; x=1697609964; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcqMB30naFRgYdHZVjh4rWtjXZPaceEDVeZe+D6ZGQM=;
        b=I7SdvZWA9EPcERjTj9B6wKD+Gx8SdoiYmwBFWxQClojHSHQpy9MseJ396aeIU5X28P
         LoZ8gNmHFhuawB8AIQP4HphcpvqBb/UN8swzcXWkrKvKo2O1vlZOqq0QuevwE1YHHD+n
         dHcsurx1+t6JivLTvsWdRjWzZzG6V2pSLMyVa18cN5ODZ48YSfWx9fL7uQ4wzdrWIv+4
         CFJFMQagavp6oJFDDwQpab0KJnSXEli8UFLRGo3+dbpVOkDxO4qxAutCv8mljwldHaCX
         Tw2De+GY+omfeonCxOzgIGnh+oR8OG534DoDhLelohofS3YIycqUX2TxGQUyk6b5mMk1
         43fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697005164; x=1697609964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcqMB30naFRgYdHZVjh4rWtjXZPaceEDVeZe+D6ZGQM=;
        b=OQSQVnxR982Mrfh2a6zD4AA7Wr/Lgs32DVckmM5HfPBnIapvfT1mwh+vwqn9TXbW+W
         iaoi3EEDGiPVZ3A8EZ2Nsd9CPix/+2Tj4DX+bm3DUwFdfKZ82HfHtk6DdhattrQ0BRa/
         EqmM2AQrkqFewvithnRWjSSZyU4f/ivMty64VlUW0mCagwpJZLBiYbQCOZbVS5CFb4/Q
         a70gRj7QHUFHU0+pZJqIm1P8KJjnYdkhGbeY/egqha3VYX475mdfLHPM660NCxQb9KYp
         gMQPheZJfU60ztKo/QEjaq+Vmt2VyxTRZI5+n+2Mj2O+tTzrdSwkH1mGhdZk+6KzAsiI
         e+bA==
X-Gm-Message-State: AOJu0YxtVzYTn3yGaog21qVKrr6roI2NriAzt9cXah5uZKKjeYoHLUEX
	YwGsliw9LwpMfuXHyidtHelMIDbh6S6I4291nu8M6g==
X-Google-Smtp-Source: AGHT+IH0dVQdsDAFTukx58Mm4npJdNbm0bLcgPLvVKj0AVOxI4yYVZT6FxUGUblbjBF7BjO/DvhKeANQ/axsKvXGtw8=
X-Received: by 2002:a05:6a20:4305:b0:15e:2d9f:cae0 with SMTP id
 h5-20020a056a20430500b0015e2d9fcae0mr20933619pzk.10.1697005164547; Tue, 10
 Oct 2023 23:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-3-apatel@ventanamicro.com> <2023101013-overfeed-online-7f69@gregkh>
In-Reply-To: <2023101013-overfeed-online-7f69@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 11:49:14 +0530
Message-ID: <CAK9=C2WbW_WvoU59Ba9VrKf5GbbXmMOhB2jsiAp0a=SJYh3d7w@mail.gmail.com>
Subject: Re: [PATCH 2/6] RISC-V: KVM: Change the SBI specification version to v2.0
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
Cc: linux-serial@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 10, 2023 at 10:43=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 10, 2023 at 10:34:59PM +0530, Anup Patel wrote:
> > We will be implementing SBI DBCN extension for KVM RISC-V so let
> > us change the KVM RISC-V SBI specification version to v2.0.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include=
/asm/kvm_vcpu_sbi.h
> > index cdcf0ff07be7..8d6d4dce8a5e 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > @@ -11,7 +11,7 @@
> >
> >  #define KVM_SBI_IMPID 3
> >
> > -#define KVM_SBI_VERSION_MAJOR 1
> > +#define KVM_SBI_VERSION_MAJOR 2
>
> What does this number mean?  Who checks it?  Why do you have to keep
> incrementing it?

This number is the SBI specification version implemented by KVM RISC-V
for the Guest kernel.

The original sbi_console_putchar() and sbi_console_getchar() are legacy
functions (aka SBI v0.1) which were introduced a few years back along
with the Linux RISC-V port.

The latest SBI v2.0 specification (which is now frozen) introduces a new
SBI debug console extension which replaces legacy sbi_console_putchar()
and sbi_console_getchar() functions with better alternatives.
(Refer, https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/co=
mmit-fe4562532a9cc57e5743b6466946c5e5c98c73ca/riscv-sbi.pdf)

This series adds SBI debug console implementation in KVM RISC-V
so the SBI specification version advertised by KVM RISC-V must also be
upgraded to v2.0.

Regarding who checks its, the SBI client drivers in the Linux kernel
will check SBI specification version implemented by higher privilege
mode (M-mode firmware or HS-mode hypervisor) before probing
the SBI extension. For example, the HVC SBI driver (PATCH5)
will ensure SBI spec version to be at least v2.0 before probing
SBI debug console extension.

>
> thanks,
>
> greg k-h

Regards,
Anup
