Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A267C5837
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 17:39:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=FZbkECB4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5H4k5ftWz3cSQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 02:39:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=FZbkECB4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5H3k6g7wz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 02:38:25 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-27d1373f631so226845a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 08:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697038701; x=1697643501; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bZpkRgovz51AKO2Ok87+Y9u7MeLQt0Mw3B5ANlnfec=;
        b=FZbkECB43kQBOtSrBZpfKMaItOHhyC/ELW4PITAdxju+0XRJ2YyvagqeA8trhAz3sq
         UfzDQAUBxsfZiCvVWgcRvpmOXr7FAWpNuddyHS1u4ASDK4zxeH69oOr75so2SAYwcTwY
         swropsK7FhBRvPy3uua+6hy4lK+QTA4LfN4nL4argb8p6Be8TM4OO6m4CZmZ5rNmnGcn
         stBhdUROnzXPxBY3yq/rgh9V2rYRcFEwO8LL6mwdNhiLy3DO08++Z9j8w1sYv40s+li4
         j00Bbhol9MUir5XxA5rKvl60xlo8MxIi02AvY/xFC7rCTvQIaG6smb45VTda/xTmdhjV
         DluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697038701; x=1697643501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bZpkRgovz51AKO2Ok87+Y9u7MeLQt0Mw3B5ANlnfec=;
        b=d4DbLZ7Fpy8rtbZsXMinrKKqLYEEpeh95duHbN+Ai6W/ff0Zo2vwJCjhIZ2tuRbhM6
         jKY+1oBlZDmUjZbj2NCk+FEbLwmpjaTopXS5PHK1sLd6zfsSaWLSAoAUrjzz6RyMg5LF
         vJ1a865gVH6rdq39+M5dsJE7tNGwoEQL9cXg0T9taZ6RhlcKZ8iCwwaXvBKrIsvDRZbs
         oNV5P5pEtir3ViRcLB2HbHazCN47tzeoRwSUvIsGgWB2GMTW0npn+G4sbzyw+oU17MlC
         33SWVBHjyRZT05Cwhk64nXtxI5bQaxvS/VsY6QIhOB9zfXiAzGeB1P02JZLlEwTcKSaw
         tdSA==
X-Gm-Message-State: AOJu0YwzZMv0+d+EXMQDSJhYA4jrFJnnvokxwrqttv3+E/ZzqnmjHrQQ
	/NbXf5B9SGF9SR3XR26F5QKAN1BGC8ZWwdF5PY5k+5JFoIhSaASEyTc=
X-Google-Smtp-Source: AGHT+IH+Duhf61q+4YQ+h+trrczoreLWiVAuNX7LPf/svKzSeewv2TIyrBxClNtHOHej4LGq2AeV1O2tRvRwJwp6muo=
X-Received: by 2002:a17:90a:5383:b0:27c:ea4c:d8c5 with SMTP id
 y3-20020a17090a538300b0027cea4cd8c5mr5192162pjh.19.1697038701054; Wed, 11 Oct
 2023 08:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-3-apatel@ventanamicro.com> <2023101013-overfeed-online-7f69@gregkh>
 <CAK9=C2WbW_WvoU59Ba9VrKf5GbbXmMOhB2jsiAp0a=SJYh3d7w@mail.gmail.com>
 <2023101107-endorse-large-ef50@gregkh> <CAK9=C2XYQ0U9CbuCg6cTf79sSsy+0BxF5mBE0R+E3s9iZFzEWw@mail.gmail.com>
 <2023101148-anatomy-mantis-a0f5@gregkh>
In-Reply-To: <2023101148-anatomy-mantis-a0f5@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 21:08:10 +0530
Message-ID: <CAK9=C2XpfQc2eoBmrd5ZicR+HO34-2BZdvrNu_CQ5qC47WKBVw@mail.gmail.com>
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

On Wed, Oct 11, 2023 at 8:56=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 11, 2023 at 04:32:22PM +0530, Anup Patel wrote:
> > On Wed, Oct 11, 2023 at 12:57=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Oct 11, 2023 at 11:49:14AM +0530, Anup Patel wrote:
> > > > On Tue, Oct 10, 2023 at 10:43=E2=80=AFPM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Tue, Oct 10, 2023 at 10:34:59PM +0530, Anup Patel wrote:
> > > > > > We will be implementing SBI DBCN extension for KVM RISC-V so le=
t
> > > > > > us change the KVM RISC-V SBI specification version to v2.0.
> > > > > >
> > > > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > > > ---
> > > > > >  arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv=
/include/asm/kvm_vcpu_sbi.h
> > > > > > index cdcf0ff07be7..8d6d4dce8a5e 100644
> > > > > > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > > > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > > > @@ -11,7 +11,7 @@
> > > > > >
> > > > > >  #define KVM_SBI_IMPID 3
> > > > > >
> > > > > > -#define KVM_SBI_VERSION_MAJOR 1
> > > > > > +#define KVM_SBI_VERSION_MAJOR 2
> > > > >
> > > > > What does this number mean?  Who checks it?  Why do you have to k=
eep
> > > > > incrementing it?
> > > >
> > > > This number is the SBI specification version implemented by KVM RIS=
C-V
> > > > for the Guest kernel.
> > > >
> > > > The original sbi_console_putchar() and sbi_console_getchar() are le=
gacy
> > > > functions (aka SBI v0.1) which were introduced a few years back alo=
ng
> > > > with the Linux RISC-V port.
> > > >
> > > > The latest SBI v2.0 specification (which is now frozen) introduces =
a new
> > > > SBI debug console extension which replaces legacy sbi_console_putch=
ar()
> > > > and sbi_console_getchar() functions with better alternatives.
> > > > (Refer, https://github.com/riscv-non-isa/riscv-sbi-doc/releases/dow=
nload/commit-fe4562532a9cc57e5743b6466946c5e5c98c73ca/riscv-sbi.pdf)
> > > >
> > > > This series adds SBI debug console implementation in KVM RISC-V
> > > > so the SBI specification version advertised by KVM RISC-V must also=
 be
> > > > upgraded to v2.0.
> > > >
> > > > Regarding who checks its, the SBI client drivers in the Linux kerne=
l
> > > > will check SBI specification version implemented by higher privileg=
e
> > > > mode (M-mode firmware or HS-mode hypervisor) before probing
> > > > the SBI extension. For example, the HVC SBI driver (PATCH5)
> > > > will ensure SBI spec version to be at least v2.0 before probing
> > > > SBI debug console extension.
> > >
> > > Is this api backwards compatible, or did you just break existing
> > > userspace that only expects version 1.0?
> >
> > The legacy sbi_console_putchar() and sbi_console_getchar()
> > functions have not changed so it does not break existing
> > user-space.
> >
> > The new SBI DBCN functions to be implemented by KVM
> > user space are:
> > sbi_debug_console_write()
> > sbi_debug_console_read()
> > sbi_debug_console_write_byte()
>
> And where exactly is that code for us to review that this is tested?

The KVM selftests for KVM RISC-V are under development. Eventually,
we will have dedicated KVM selftests for the SBI extensions implemented
by KVM RISC-V.

Until then we have KVMTOOL implementation for SBI DBCN, which is
available in riscv_sbi_dbcn_v1 branch at:
https://github.com/avpatel/kvmtool.git

>
> thanks,
>
> greg k-h

Regards,
Anup
