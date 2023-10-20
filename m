Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A73D57D0798
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 07:27:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=i45AijkL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBY4N484Nz3cdM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 16:27:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=i45AijkL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBY3V31BVz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 16:26:28 +1100 (AEDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-457c057bdb5so170553137.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 22:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697779581; x=1698384381; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVgRisShFqd7EiamTTw+bWWTirWYsFZ+qCSq/HGAIy0=;
        b=i45AijkLlpmEj+rYRoMYOdQX2IPQcSn/uq/0/cNs6R2gMGdw8CpTuQ4jSb04H3nHpA
         moUPqJrz5uj1a+ACGjcjsl/EkZlSJpc05ersw6lSSgLZXS214Pxddaw95bV4xW5ktUs5
         MGU+uu+SCB860uliTaEmFJ3yq+ozWDYefQ8E4xALc16tdy3iV8Zsqz1LgHlLWrdZiBRJ
         SQrgI21Ligx2bpTJK+/mHLeerbSyNY+M8PCIHP08wh8ORYELU8hsg7Lxtxix3Ekqbk7B
         SJivUZEeBq3XXu7xLoDoAYdFmfMZ2qlg2vJ2TzTygEqe/I4+TM+/1/9ZNZTyGu0+AH7r
         3Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697779581; x=1698384381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVgRisShFqd7EiamTTw+bWWTirWYsFZ+qCSq/HGAIy0=;
        b=PLUbuS6Ai+eVDt9zPFmYOzVSdbJBDR6jc69t9caKkMKq6je/43yboxQyXuUCdF+MK/
         DswTSkvyZvAWKJ1oossd56iF5kix5fq8sxalv55tFyV1e04h7ck9LR67s0fo+87fvnHT
         9hh+zXPhb1kvitYo+Jmube9F1RfShzPOs7DWko5d2nZFKSPEB0dqZwNoN19ZJSG9H67r
         xVFzeJvF19IwtM38Xsj0/n2XkDkGYvsDXaJfFOd24a17V6OmcWInDKsfJfSrxbLrbUfl
         rTP/KsgfVcybJx7iinWsdpqXN8obKFqnQNYBsi+DUmTG6Dax4g5Oepy2dmT10N0gBQ0H
         cTug==
X-Gm-Message-State: AOJu0YxzaUi4rvpgpvm/hXxLnyZfDUD6pct15ts7YyqOoF9HzCsY0U86
	C5W9kk2+qZN2Ecq0+FPRdLEBV2fDf1A8T4pwI6N4kQ==
X-Google-Smtp-Source: AGHT+IHo8erdk2AN0cF2HUMClMRLyNwghQbHQC1m7KfJFjkcJhqBzh3HXIExQo07E3k6BH9SqTyX3KGslOi9ibHfP8c=
X-Received: by 2002:a67:ef51:0:b0:457:dbe3:ef45 with SMTP id
 k17-20020a67ef51000000b00457dbe3ef45mr1085001vsr.19.1697779581093; Thu, 19
 Oct 2023 22:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-4-apatel@ventanamicro.com> <20231019-1e6f411e1cbc4a3b0fbff3f5@orel>
In-Reply-To: <20231019-1e6f411e1cbc4a3b0fbff3f5@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 20 Oct 2023 10:56:09 +0530
Message-ID: <CAK9=C2XSdrOSTp7skR4btGFkfL==0E+Su71d4bgJGXB80x6rBw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] RISC-V: KVM: Allow some SBI extensions to be
 disabled by default
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
Cc: linux-serial@vger.kernel.org, kvm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Atish Patra <atishp@atishpatra.org>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 19, 2023 at 1:27=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Thu, Oct 12, 2023 at 10:45:04AM +0530, Anup Patel wrote:
> > Currently, all SBI extensions are enabled by default which is
> > problematic for SBI extensions (such as DBCN) which are forwarded
> > to the KVM user-space because we might have an older KVM user-space
> > which is not aware/ready to handle newer SBI extensions. Ideally,
> > the SBI extensions forwarded to the KVM user-space must be
> > disabled by default.
> >
> > To address above, we allow certain SBI extensions to be disabled
> > by default so that KVM user-space must explicitly enable such
> > SBI extensions to receive forwarded calls from Guest VCPU.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 +++
> >  arch/riscv/kvm/vcpu.c                 |  6 ++++
> >  arch/riscv/kvm/vcpu_sbi.c             | 45 ++++++++++++++++-----------
> >  3 files changed, 36 insertions(+), 19 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include=
/asm/kvm_vcpu_sbi.h
> > index 8d6d4dce8a5e..c02bda5559d7 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > @@ -35,6 +35,9 @@ struct kvm_vcpu_sbi_return {
> >  struct kvm_vcpu_sbi_extension {
> >       unsigned long extid_start;
> >       unsigned long extid_end;
> > +
> > +     bool default_unavail;
> > +
> >       /**
> >        * SBI extension handler. It can be defined for a given extension=
 or group of
> >        * extension. But it should always return linux error codes rathe=
r than SBI
> > @@ -59,6 +62,7 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *v=
cpu,
> >  const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
> >                               struct kvm_vcpu *vcpu, unsigned long exti=
d);
> >  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *ru=
n);
> > +void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
> >
> >  #ifdef CONFIG_RISCV_SBI_V01
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index c061a1c5fe98..e087c809073c 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -141,6 +141,12 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> >       if (rc)
> >               return rc;
> >
> > +     /*
> > +      * Setup SBI extensions
> > +      * NOTE: This must be the last thing to be initialized.
> > +      */
> > +     kvm_riscv_vcpu_sbi_init(vcpu);
>
> With this, we no longer defer probing to the first access (whether that's
> by the guest or KVM userspace). With our current small set of SBI
> extensions where only a single one has a probe function, then this
> simpler approach is good enough. We can always go back to the lazy
> approach later if needed.

I agree. We can fallback to lazy probing in the future if required.

>
> > +
> >       /* Reset VCPU */
> >       kvm_riscv_reset_vcpu(vcpu);
> >
> > diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> > index 9cd97091c723..1b1cee86efda 100644
> > --- a/arch/riscv/kvm/vcpu_sbi.c
> > +++ b/arch/riscv/kvm/vcpu_sbi.c
> > @@ -155,14 +155,8 @@ static int riscv_vcpu_set_sbi_ext_single(struct kv=
m_vcpu *vcpu,
> >       if (!sext)
> >               return -ENOENT;
> >
> > -     /*
> > -      * We can't set the extension status to available here, since it =
may
> > -      * have a probe() function which needs to confirm availability fi=
rst,
> > -      * but it may be too early to call that here. We can set the stat=
us to
> > -      * unavailable, though.
> > -      */
> > -     if (!reg_val)
> > -             scontext->ext_status[sext->ext_idx] =3D
> > +     scontext->ext_status[sext->ext_idx] =3D (reg_val) ?
> > +                     KVM_RISCV_SBI_EXT_AVAILABLE :
> >                       KVM_RISCV_SBI_EXT_UNAVAILABLE;
>
> We're missing the change to riscv_vcpu_get_sbi_ext_single() which should
> also drop the comment block explaining the limits to status knowledge
> without initial probing (which we now do) and then just check for
> available, i.e.
>
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index bb76c3cf633f..92c42d9aba1c 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -186,15 +186,8 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_=
vcpu *vcpu,
>         if (!sext)
>                 return -ENOENT;
>
> -       /*
> -        * If the extension status is still uninitialized, then we should=
 probe
> -        * to determine if it's available, but it may be too early to do =
that
> -        * here. The best we can do is report that the extension has not =
been
> -        * disabled, i.e. we return 1 when the extension is available and=
 also
> -        * when it only may be available.
> -        */
> -       *reg_val =3D scontext->ext_status[sext->ext_idx] !=3D
> -                               KVM_RISCV_SBI_EXT_UNAVAILABLE;
> +       *reg_val =3D scontext->ext_status[sext->ext_idx] =3D=3D
> +                               KVM_RISCV_SBI_EXT_AVAILABLE;
>
>         return 0;
>  }

Thanks, I will include this change in the next revision.

>
> >
> >       return 0;
> > @@ -337,18 +331,8 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_=
find_ext(
> >                           scontext->ext_status[entry->ext_idx] =3D=3D
> >                                               KVM_RISCV_SBI_EXT_AVAILAB=
LE)
> >                               return ext;
> > -                     if (scontext->ext_status[entry->ext_idx] =3D=3D
> > -                                             KVM_RISCV_SBI_EXT_UNAVAIL=
ABLE)
> > -                             return NULL;
> > -                     if (ext->probe && !ext->probe(vcpu)) {
> > -                             scontext->ext_status[entry->ext_idx] =3D
> > -                                     KVM_RISCV_SBI_EXT_UNAVAILABLE;
> > -                             return NULL;
> > -                     }
> >
> > -                     scontext->ext_status[entry->ext_idx] =3D
> > -                             KVM_RISCV_SBI_EXT_AVAILABLE;
> > -                     return ext;
> > +                     return NULL;
> >               }
> >       }
> >
> > @@ -419,3 +403,26 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu=
, struct kvm_run *run)
> >
> >       return ret;
> >  }
> > +
> > +void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
> > +{
> > +     struct kvm_vcpu_sbi_context *scontext =3D &vcpu->arch.sbi_context=
;
> > +     const struct kvm_riscv_sbi_extension_entry *entry;
> > +     const struct kvm_vcpu_sbi_extension *ext;
> > +     int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(sbi_ext); i++) {
> > +             entry =3D &sbi_ext[i];
> > +             ext =3D entry->ext_ptr;
> > +
> > +             if (ext->probe && !ext->probe(vcpu)) {
> > +                     scontext->ext_status[entry->ext_idx] =3D
> > +                             KVM_RISCV_SBI_EXT_UNAVAILABLE;
> > +                     continue;
> > +             }
> > +
> > +             scontext->ext_status[entry->ext_idx] =3D ext->default_una=
vail ?
> > +                                     KVM_RISCV_SBI_EXT_UNAVAILABLE :
> > +                                     KVM_RISCV_SBI_EXT_AVAILABLE;
> > +     }
> > +}
> > --
> > 2.34.1
> >
>
> Thanks,
> drew

Regards,
Anup
