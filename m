Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA5F7C50A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 12:57:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=QE2j5XcY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S58q85cpFz3vfS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 21:57:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=QE2j5XcY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S58mP3yPZz3vXm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 21:54:45 +1100 (AEDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7ab8696d047so2662520241.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 03:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697021680; x=1697626480; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4nF6PEutWJBQPD4LIT1skkD09xa4qGsBtRI6mZk9kM=;
        b=QE2j5XcYEKyMwo1OTgesGcmqQL1D7o1tNL3GhnDB1dO8Ae338X9/75w03U88qJWGqC
         pOTlr3cIpneLG1fkpz2SSerjBde/K9VJAcsPNtc8yuL/Gc6XEbzj1ykAMq274JRaVzUa
         dYI05cYN4uUMn0NQ59cYNEfyJ0Slt8f2ta7XB6UUVpUtKrEcdcF4xFQRd/aruL8q7a0r
         4rOI2t/wB16sc8RcwzrQXeGfKj4KxVrKNFehsw7JjHESjpHCKivzgNmzQzl57WxRJTxP
         iKhwFzEGgxbuOwbav0q0vfBM8PFT7ds6YGuv1fmkMRaKyMyEj2wU2vZs/aNLSWlq+gwu
         qQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697021680; x=1697626480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4nF6PEutWJBQPD4LIT1skkD09xa4qGsBtRI6mZk9kM=;
        b=PHRZjumyJgn5xtifMy8wvl6rMRfLDIxo5fWvIV66xnIDPANxjjt+L7jetE0iodpbIj
         aP0SM9iUNDF7aLRarOtFzH42MnoKC7xb/IusSJdz/f845qe2U3XUM1lmv2bYeqQ/CLY1
         OICjlSbtfkFUxxQHyCumiUQjpVDWCDE5ZczDxWI5PU37FR3YkGx7FygFQOQ+1mrCMnwc
         oAuqRyva4NsW7RWM+XiuBCr22y1f//YynNJIsNmapl5rTxNleF7Jmzz3NOUrv5X97+hT
         s6Cbtq5+qsy1kL3Nf+qp8G+aHhJpIxTGkrGmbpoPKAwB1/Jf7kOpmc4O4IAsiP+0x+yN
         9x1Q==
X-Gm-Message-State: AOJu0Yz4fAqWdnIoTOfFmU0dSLb2W+ojVWtqYGieIWRpqPftjO73uTTF
	aRcFF2I+MdpxP1dvjel+mCeBXeVl1hKEecqIkv2WmQ==
X-Google-Smtp-Source: AGHT+IFDs94V/aDo55pKyEF+KYMg17r2BTEWfhXQjYPz6s8btDK4mBkRCwVsJWRGGrp60X5u0qqqHYxCDBabIc6c5JU=
X-Received: by 2002:a67:cd11:0:b0:450:8e58:2de4 with SMTP id
 u17-20020a67cd11000000b004508e582de4mr18396034vsl.7.1697021679643; Wed, 11
 Oct 2023 03:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-4-apatel@ventanamicro.com> <2023101048-attach-drift-d77b@gregkh>
 <CAK9=C2UEcQpHg8WZM3XxLa5yCEZ6wtWJj=8g5_m_0_RkiNMkTA@mail.gmail.com> <2023101105-oink-aerospace-989e@gregkh>
In-Reply-To: <2023101105-oink-aerospace-989e@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 16:24:28 +0530
Message-ID: <CAK9=C2V3VzCgaJ_dWExvS3mf3QRgeV5tU9t3LsMaHv7xO3wwzA@mail.gmail.com>
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

On Wed, Oct 11, 2023 at 12:56=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 11, 2023 at 12:02:30PM +0530, Anup Patel wrote:
> > On Tue, Oct 10, 2023 at 10:45=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Oct 10, 2023 at 10:35:00PM +0530, Anup Patel wrote:
> > > > The SBI DBCN extension needs to be emulated in user-space
> > >
> > > Why?
> >
> > The SBI debug console is similar to a console port available to
> > KVM Guest so the KVM user space tool (i.e. QEMU-KVM or
> > KVMTOOL) can redirect the input/output of SBI debug console
> > wherever it wants (e.g.  telnet, file, stdio, etc).
> >
> > We forward SBI DBCN calls to KVM user space so that the
> > in-kernel KVM does not need to be aware of the guest
> > console devices.
>
> Hint, my "Why" was attempting to get you to write a better changelog
> description, which would include the above information.  Please read the
> kernel documentation for hints on how to do this so that we know what
> why changes are being made.

Okay, I will improve the commit description and cover-letter.

>
> > > > so let
> > > > us forward console_puts() call to user-space.
> > >
> > > What could go wrong!
> > >
> > > Why does userspace have to get involved in a console message?  Why is
> > > this needed at all?  The kernel can not handle userspace consoles as
> > > obviously they have to be re-entrant and irq safe.
> >
> > As mentioned above, these are KVM guest console messages which
> > the VMM (i.e. KVM user-space) can choose to manage on its own.
>
> If it chooses not to, what happens?

If KVM user-space chooses not to handle SBI DBCN calls then it can
disable SBI DBCN extension for Guest VCPUs using the ONE_REG
ioctl() interface.

>
> > This is more about providing flexibility to KVM user-space which
> > allows it to manage guest console devices.
>
> Why not use the normal virtio console device interface instead of making
> a riscv-custom one?

The SBI DBCN (or debug console) is only an early console used for
early prints and bootloaders.

Once the proper console (like virtio console) is detected by the Guest
kernel, it will switch the debug console to proper console.

>
> Where is the userspace side of this interface at?  Where are the patches
> to handle this new api you added?

As mentioned in the cover letter, I have implemented it in KVMTOOL first.

The patches can be found in riscv_sbi_dbcn_v1 branch at:
https://github.com/avpatel/kvmtool.git

More precisely, this commit:
https://github.com/avpatel/kvmtool/commit/06a373ee8991f882ef79de3845a4c8d63=
cb189a6

>
> >
> > >
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > ---
> > > >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
> > > >  arch/riscv/include/uapi/asm/kvm.h     |  1 +
> > > >  arch/riscv/kvm/vcpu_sbi.c             |  4 ++++
> > > >  arch/riscv/kvm/vcpu_sbi_replace.c     | 31 +++++++++++++++++++++++=
++++
> > > >  4 files changed, 37 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/inc=
lude/asm/kvm_vcpu_sbi.h
> > > > index 8d6d4dce8a5e..a85f95eb6e85 100644
> > > > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > @@ -69,6 +69,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_s=
bi_ext_ipi;
> > > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
> > > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
> > > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> > > > +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
> > > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experiment=
al;
> > > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
> > > >
> > > > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include=
/uapi/asm/kvm.h
> > > > index 917d8cc2489e..60d3b21dead7 100644
> > > > --- a/arch/riscv/include/uapi/asm/kvm.h
> > > > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > > > @@ -156,6 +156,7 @@ enum KVM_RISCV_SBI_EXT_ID {
> > > >       KVM_RISCV_SBI_EXT_PMU,
> > > >       KVM_RISCV_SBI_EXT_EXPERIMENTAL,
> > > >       KVM_RISCV_SBI_EXT_VENDOR,
> > > > +     KVM_RISCV_SBI_EXT_DBCN,
> > > >       KVM_RISCV_SBI_EXT_MAX,
> > >
> > > You just broke a user/kernel ABI here, why?
> >
> > The KVM_RISCV_SBI_EXT_MAX only represents the number
> > of entries in "enum KVM_RISCV_SBI_EXT_ID" so we are not
> > breaking "enum KVM_RISCV_SBI_EXT_ID" rather appending
> > new ID to existing enum.
>
> So you are sure that userspace never actually tests or sends that _MAX
> value anywhere?  If not, why is it even needed?
>
> thanks,
>
> greg k-h

Regards,
Anup
