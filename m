Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB177C50C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 13:03:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=mwMiGi4s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S58yM5xsHz3vZy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 22:03:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=mwMiGi4s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S58xW3DG9z3c5T
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 22:02:37 +1100 (AEDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-4526c6579afso550163137.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697022154; x=1697626954; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm0CdxGnQbe0GlEx3+GHVomKZQHiVEeERNIEs1qllzo=;
        b=mwMiGi4s8Bk9S6UB2UVTsWhp/VHdcgXuuupFgmk1mXLKgfIppWsZZWhWTcIiC9yOz/
         dARLuz4wBpYKWaorDJ4k21tbAzYBcuwy0ifzdiJK+mPOkNVTxzcSrHH0lC735TfA458B
         gp+F8hLuX7lPatF4LZ17h+ibAAGbqHbpED/Bjnp6THknA0LocPkT62nxyHTHVY2oqQ/3
         DggSIKIWUAunsppQgJqa613dCjV2xXtuMKwckDBgNZi2gLlrmBFWNiuoXm+o2NbErohw
         CM+bHPXpDEhE5pHGeXwFyiVQCJi/HeflH3cwGKRYpWmZZvbroBKTW61Sjs5tY3IgrCic
         aV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697022154; x=1697626954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xm0CdxGnQbe0GlEx3+GHVomKZQHiVEeERNIEs1qllzo=;
        b=NsOOuZRecWdV2z2mWBRtQ2lR7RPtdUDYLZlvp0/0QsWB0tSI1zxOs5P6cwLC00RyTu
         JI6KyFCjlKqKfGAU+o3i5yXu0U5oxhZ+BA2YHrueEPx9BEP3EpZApmxqXFZN6pEd/3x5
         bfTvYqanJp15k9dlr/jiRDKXgmQv+mbdGeE2iiCJ5TEsYZkFKcGoCealHfEecqLmo8CY
         h8+EZ7EYAsgZ3i93qLbrKRNUM2EDJNT/9NRHn5S0wYZ7EdwAfMuDici7k3bstafOzTWS
         feCSgYPQpr8YqI5YqnRS3A+M577dQ1jixp8nPkIwTrqIXrEN9tfcVDnMatcoB/DzT7ry
         YDCA==
X-Gm-Message-State: AOJu0YyAkPo+BF/CTRT8Xjx52AyjP3IIvm8AFlXypnZQe83oCL3IkwHm
	UecFlzHLkYdPDxQicsqMMuIfjxYAGPJxMVfsR+3OcQ==
X-Google-Smtp-Source: AGHT+IFIHtzjwJekUc0/aKAwYGhSo8Q1f+C4Kna6UDSuc6EpwK7D5p52+dKgEnHoF5qIkm5zUTFf99ptwfMujMMVIFQ=
X-Received: by 2002:a05:6102:27c8:b0:452:79da:94a with SMTP id
 t8-20020a05610227c800b0045279da094amr8993764vsu.4.1697022154194; Wed, 11 Oct
 2023 04:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-3-apatel@ventanamicro.com> <2023101013-overfeed-online-7f69@gregkh>
 <CAK9=C2WbW_WvoU59Ba9VrKf5GbbXmMOhB2jsiAp0a=SJYh3d7w@mail.gmail.com> <2023101107-endorse-large-ef50@gregkh>
In-Reply-To: <2023101107-endorse-large-ef50@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 16:32:22 +0530
Message-ID: <CAK9=C2XYQ0U9CbuCg6cTf79sSsy+0BxF5mBE0R+E3s9iZFzEWw@mail.gmail.com>
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

On Wed, Oct 11, 2023 at 12:57=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 11, 2023 at 11:49:14AM +0530, Anup Patel wrote:
> > On Tue, Oct 10, 2023 at 10:43=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Oct 10, 2023 at 10:34:59PM +0530, Anup Patel wrote:
> > > > We will be implementing SBI DBCN extension for KVM RISC-V so let
> > > > us change the KVM RISC-V SBI specification version to v2.0.
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > ---
> > > >  arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/inc=
lude/asm/kvm_vcpu_sbi.h
> > > > index cdcf0ff07be7..8d6d4dce8a5e 100644
> > > > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > @@ -11,7 +11,7 @@
> > > >
> > > >  #define KVM_SBI_IMPID 3
> > > >
> > > > -#define KVM_SBI_VERSION_MAJOR 1
> > > > +#define KVM_SBI_VERSION_MAJOR 2
> > >
> > > What does this number mean?  Who checks it?  Why do you have to keep
> > > incrementing it?
> >
> > This number is the SBI specification version implemented by KVM RISC-V
> > for the Guest kernel.
> >
> > The original sbi_console_putchar() and sbi_console_getchar() are legacy
> > functions (aka SBI v0.1) which were introduced a few years back along
> > with the Linux RISC-V port.
> >
> > The latest SBI v2.0 specification (which is now frozen) introduces a ne=
w
> > SBI debug console extension which replaces legacy sbi_console_putchar()
> > and sbi_console_getchar() functions with better alternatives.
> > (Refer, https://github.com/riscv-non-isa/riscv-sbi-doc/releases/downloa=
d/commit-fe4562532a9cc57e5743b6466946c5e5c98c73ca/riscv-sbi.pdf)
> >
> > This series adds SBI debug console implementation in KVM RISC-V
> > so the SBI specification version advertised by KVM RISC-V must also be
> > upgraded to v2.0.
> >
> > Regarding who checks its, the SBI client drivers in the Linux kernel
> > will check SBI specification version implemented by higher privilege
> > mode (M-mode firmware or HS-mode hypervisor) before probing
> > the SBI extension. For example, the HVC SBI driver (PATCH5)
> > will ensure SBI spec version to be at least v2.0 before probing
> > SBI debug console extension.
>
> Is this api backwards compatible, or did you just break existing
> userspace that only expects version 1.0?

The legacy sbi_console_putchar() and sbi_console_getchar()
functions have not changed so it does not break existing
user-space.

The new SBI DBCN functions to be implemented by KVM
user space are:
sbi_debug_console_write()
sbi_debug_console_read()
sbi_debug_console_write_byte()

>
> thanks,
>
> greg k-h

Regards,
Anup
