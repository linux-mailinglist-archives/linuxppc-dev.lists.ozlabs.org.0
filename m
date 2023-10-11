Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A23167C4ADF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 08:43:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=izEPBY87;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S53Bg3NyFz3vdM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 17:43:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=izEPBY87;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S52y33MXdz3w9n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 17:32:42 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-279294d94acso523591a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 23:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697005960; x=1697610760; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlCvzn9D9MWfXzyAjQXrd2l33CVlRWaoX+EsCqMd6ps=;
        b=izEPBY87QY56P9OLwQ2KUjc4utGNTIpXmrG1v/ZL/gdAXq3dfns97n9c08IVfRFDel
         T4IYnh2l+XQx7RAXmmPzLQgIIswWBYWZQPh/64GIGaV27IvF8qYbO79YwWUYT3nDecmu
         9jI+s4+RlT1SQd8FyMqYHcy5sS1G0NFDQ5Z2suUoaZVk/mfUQv4btccrYEp40XHppXdl
         EM5ktenqqx5jFCUPkaPKZGIOSmNxQUh/JAle/ckevXA7HzUgMbGXLN6X4Z8mKerc4EZ8
         /M0ybrJ/hTEBOVrkhg4HTpL1qfu5vHqdxfR7++PpWGjPduDncT5CZTQv60iAdp/zi1mg
         oHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697005960; x=1697610760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlCvzn9D9MWfXzyAjQXrd2l33CVlRWaoX+EsCqMd6ps=;
        b=jZxHd+wCl3hUEguY33RZ0mBlai4VGYhtC3zjGNs3dIkBjEwnP2aLPBjpofdOGCRjfW
         Tm6G3slIoKvXwJpdK5CBqCU9ceNBBEPj/xivGNdYeBKN9Oay9j9vOlm9kDaizuNDYYVV
         QyOrFtkef2pXGGraAs2b/53nH/YALsouCu06fw6yNQbKbywgaW9Fc9fZxGYcOYEYInCT
         06ztcwcFaac7oeKYJOxbSqgSsO/HQdc38kputvJY32DSswAqAwm//h1b3jEhaRbWpun7
         j55foutlqpnvMVY83R8sz5vNQJhZSanBOM4+gXtScb8UxmfrPu8sbj4Ztt7ONy5Dtk+Z
         3XVQ==
X-Gm-Message-State: AOJu0YyE0shq9Cr7J3j1OayjSsMI0en4+F6aMLqItdVc6SFGYe0O+4DG
	3js2/T8lC/qRPJ/e7vpETK9bVGDJc37Ie0XqxHw9MQ==
X-Google-Smtp-Source: AGHT+IH0b9pvjz2wUtu97VMbjcxmgb/lTA+sWvTdIT6U1QGtyomZxkrbbJUyvfIkk70xvT4UTjANIh9gr7AwN1M7ntI=
X-Received: by 2002:a17:90b:4a02:b0:277:61d7:78be with SMTP id
 kk2-20020a17090b4a0200b0027761d778bemr24784754pjb.14.1697005960055; Tue, 10
 Oct 2023 23:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-4-apatel@ventanamicro.com> <2023101048-attach-drift-d77b@gregkh>
In-Reply-To: <2023101048-attach-drift-d77b@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 12:02:30 +0530
Message-ID: <CAK9=C2UEcQpHg8WZM3XxLa5yCEZ6wtWJj=8g5_m_0_RkiNMkTA@mail.gmail.com>
Subject: Re: [PATCH 3/6] RISC-V: KVM: Forward SBI DBCN extension to user-space
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

On Tue, Oct 10, 2023 at 10:45=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 10, 2023 at 10:35:00PM +0530, Anup Patel wrote:
> > The SBI DBCN extension needs to be emulated in user-space
>
> Why?

The SBI debug console is similar to a console port available to
KVM Guest so the KVM user space tool (i.e. QEMU-KVM or
KVMTOOL) can redirect the input/output of SBI debug console
wherever it wants (e.g.  telnet, file, stdio, etc).

We forward SBI DBCN calls to KVM user space so that the
in-kernel KVM does not need to be aware of the guest
console devices.

>
> > so let
> > us forward console_puts() call to user-space.
>
> What could go wrong!
>
> Why does userspace have to get involved in a console message?  Why is
> this needed at all?  The kernel can not handle userspace consoles as
> obviously they have to be re-entrant and irq safe.

As mentioned above, these are KVM guest console messages which
the VMM (i.e. KVM user-space) can choose to manage on its own.

This is more about providing flexibility to KVM user-space which
allows it to manage guest console devices.

>
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
> >  arch/riscv/include/uapi/asm/kvm.h     |  1 +
> >  arch/riscv/kvm/vcpu_sbi.c             |  4 ++++
> >  arch/riscv/kvm/vcpu_sbi_replace.c     | 31 +++++++++++++++++++++++++++
> >  4 files changed, 37 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include=
/asm/kvm_vcpu_sbi.h
> > index 8d6d4dce8a5e..a85f95eb6e85 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > @@ -69,6 +69,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_e=
xt_ipi;
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> > +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
> >
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uap=
i/asm/kvm.h
> > index 917d8cc2489e..60d3b21dead7 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -156,6 +156,7 @@ enum KVM_RISCV_SBI_EXT_ID {
> >       KVM_RISCV_SBI_EXT_PMU,
> >       KVM_RISCV_SBI_EXT_EXPERIMENTAL,
> >       KVM_RISCV_SBI_EXT_VENDOR,
> > +     KVM_RISCV_SBI_EXT_DBCN,
> >       KVM_RISCV_SBI_EXT_MAX,
>
> You just broke a user/kernel ABI here, why?

The KVM_RISCV_SBI_EXT_MAX only represents the number
of entries in "enum KVM_RISCV_SBI_EXT_ID" so we are not
breaking "enum KVM_RISCV_SBI_EXT_ID" rather appending
new ID to existing enum.

>
> thanks,
>
> greg k-h

Thanks,
Anup
