Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A76A7C4BB6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 09:27:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sM6P/GYL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S549k1GQ1z3dxN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 18:27:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sM6P/GYL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S548r40Dtz300f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 18:27:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E195661811;
	Wed, 11 Oct 2023 07:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03683C433C7;
	Wed, 11 Oct 2023 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697009225;
	bh=wdBRBWPG1q+slhhNVCbJyKyr4zxhG5iWNoRBaC45st0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sM6P/GYLthcfQbXg4JirQV4bK0QZKxkEghoQcQYgs8kX/K4EDu95Wcn6L8UQnSDWW
	 rZf7pdAcvMFZONtoU2fTHSUZHnC60MjoaJkIYNcuGZQyH3EmdflPgP4Jl75eTej5di
	 KYtj+i110e2I/lBBebrafdiPPzsNzo4mviAIPdOE=
Date: Wed, 11 Oct 2023 09:27:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/6] RISC-V: KVM: Change the SBI specification version to
 v2.0
Message-ID: <2023101107-endorse-large-ef50@gregkh>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-3-apatel@ventanamicro.com>
 <2023101013-overfeed-online-7f69@gregkh>
 <CAK9=C2WbW_WvoU59Ba9VrKf5GbbXmMOhB2jsiAp0a=SJYh3d7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK9=C2WbW_WvoU59Ba9VrKf5GbbXmMOhB2jsiAp0a=SJYh3d7w@mail.gmail.com>
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

On Wed, Oct 11, 2023 at 11:49:14AM +0530, Anup Patel wrote:
> On Tue, Oct 10, 2023 at 10:43 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Oct 10, 2023 at 10:34:59PM +0530, Anup Patel wrote:
> > > We will be implementing SBI DBCN extension for KVM RISC-V so let
> > > us change the KVM RISC-V SBI specification version to v2.0.
> > >
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > ---
> > >  arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > index cdcf0ff07be7..8d6d4dce8a5e 100644
> > > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > @@ -11,7 +11,7 @@
> > >
> > >  #define KVM_SBI_IMPID 3
> > >
> > > -#define KVM_SBI_VERSION_MAJOR 1
> > > +#define KVM_SBI_VERSION_MAJOR 2
> >
> > What does this number mean?  Who checks it?  Why do you have to keep
> > incrementing it?
> 
> This number is the SBI specification version implemented by KVM RISC-V
> for the Guest kernel.
> 
> The original sbi_console_putchar() and sbi_console_getchar() are legacy
> functions (aka SBI v0.1) which were introduced a few years back along
> with the Linux RISC-V port.
> 
> The latest SBI v2.0 specification (which is now frozen) introduces a new
> SBI debug console extension which replaces legacy sbi_console_putchar()
> and sbi_console_getchar() functions with better alternatives.
> (Refer, https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/commit-fe4562532a9cc57e5743b6466946c5e5c98c73ca/riscv-sbi.pdf)
> 
> This series adds SBI debug console implementation in KVM RISC-V
> so the SBI specification version advertised by KVM RISC-V must also be
> upgraded to v2.0.
> 
> Regarding who checks its, the SBI client drivers in the Linux kernel
> will check SBI specification version implemented by higher privilege
> mode (M-mode firmware or HS-mode hypervisor) before probing
> the SBI extension. For example, the HVC SBI driver (PATCH5)
> will ensure SBI spec version to be at least v2.0 before probing
> SBI debug console extension.

Is this api backwards compatible, or did you just break existing
userspace that only expects version 1.0?

thanks,

greg k-h
