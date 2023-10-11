Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CEF7C4BAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 09:26:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vvUjAcwi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S548X269Bz3dDT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 18:26:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vvUjAcwi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S547c5JXsz2yQ8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 18:26:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9F0D2B81F46;
	Wed, 11 Oct 2023 07:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CD2C433C7;
	Wed, 11 Oct 2023 07:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697009159;
	bh=I+hjt1PIAmeTlSR8yMwMC5kINnpTg7kd2uxBgq828hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vvUjAcwiuU1Y7Tj7a0D35EZe0SxqN+mW7fhJhdPKPZHsA7bkpi+kq6XyZgKWRJkuv
	 wFoBLopdpeV8uJrtE3LTjN5hQ4GGXvHKw8zhDirGSmsdZTrIVkOmuPDRDKHXj1+LnL
	 4btIOyNUCM+4qGWuJA+oAlJPtLbETjMO8IeYC9sw=
Date: Wed, 11 Oct 2023 09:25:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 3/6] RISC-V: KVM: Forward SBI DBCN extension to user-space
Message-ID: <2023101105-oink-aerospace-989e@gregkh>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-4-apatel@ventanamicro.com>
 <2023101048-attach-drift-d77b@gregkh>
 <CAK9=C2UEcQpHg8WZM3XxLa5yCEZ6wtWJj=8g5_m_0_RkiNMkTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK9=C2UEcQpHg8WZM3XxLa5yCEZ6wtWJj=8g5_m_0_RkiNMkTA@mail.gmail.com>
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

On Wed, Oct 11, 2023 at 12:02:30PM +0530, Anup Patel wrote:
> On Tue, Oct 10, 2023 at 10:45 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Oct 10, 2023 at 10:35:00PM +0530, Anup Patel wrote:
> > > The SBI DBCN extension needs to be emulated in user-space
> >
> > Why?
> 
> The SBI debug console is similar to a console port available to
> KVM Guest so the KVM user space tool (i.e. QEMU-KVM or
> KVMTOOL) can redirect the input/output of SBI debug console
> wherever it wants (e.g.  telnet, file, stdio, etc).
> 
> We forward SBI DBCN calls to KVM user space so that the
> in-kernel KVM does not need to be aware of the guest
> console devices.

Hint, my "Why" was attempting to get you to write a better changelog
description, which would include the above information.  Please read the
kernel documentation for hints on how to do this so that we know what
why changes are being made.

> > > so let
> > > us forward console_puts() call to user-space.
> >
> > What could go wrong!
> >
> > Why does userspace have to get involved in a console message?  Why is
> > this needed at all?  The kernel can not handle userspace consoles as
> > obviously they have to be re-entrant and irq safe.
> 
> As mentioned above, these are KVM guest console messages which
> the VMM (i.e. KVM user-space) can choose to manage on its own.

If it chooses not to, what happens?

> This is more about providing flexibility to KVM user-space which
> allows it to manage guest console devices.

Why not use the normal virtio console device interface instead of making
a riscv-custom one?

Where is the userspace side of this interface at?  Where are the patches
to handle this new api you added?

> 
> >
> > >
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > ---
> > >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
> > >  arch/riscv/include/uapi/asm/kvm.h     |  1 +
> > >  arch/riscv/kvm/vcpu_sbi.c             |  4 ++++
> > >  arch/riscv/kvm/vcpu_sbi_replace.c     | 31 +++++++++++++++++++++++++++
> > >  4 files changed, 37 insertions(+)
> > >
> > > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > index 8d6d4dce8a5e..a85f95eb6e85 100644
> > > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > @@ -69,6 +69,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
> > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
> > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
> > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> > > +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
> > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
> > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
> > >
> > > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > > index 917d8cc2489e..60d3b21dead7 100644
> > > --- a/arch/riscv/include/uapi/asm/kvm.h
> > > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > > @@ -156,6 +156,7 @@ enum KVM_RISCV_SBI_EXT_ID {
> > >       KVM_RISCV_SBI_EXT_PMU,
> > >       KVM_RISCV_SBI_EXT_EXPERIMENTAL,
> > >       KVM_RISCV_SBI_EXT_VENDOR,
> > > +     KVM_RISCV_SBI_EXT_DBCN,
> > >       KVM_RISCV_SBI_EXT_MAX,
> >
> > You just broke a user/kernel ABI here, why?
> 
> The KVM_RISCV_SBI_EXT_MAX only represents the number
> of entries in "enum KVM_RISCV_SBI_EXT_ID" so we are not
> breaking "enum KVM_RISCV_SBI_EXT_ID" rather appending
> new ID to existing enum.

So you are sure that userspace never actually tests or sends that _MAX
value anywhere?  If not, why is it even needed?

thanks,

greg k-h
