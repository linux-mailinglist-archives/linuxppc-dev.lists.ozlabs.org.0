Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E541B7AA5DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 02:01:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EUj1hKtv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsC9S5Bwxz3cgB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:01:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EUj1hKtv;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsC8b7076z3byP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 10:00:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1695340847;
	bh=R/VgVhr9X0HDtbhByU19PzH3x9CzJFuyVh93BLbm8XY=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=EUj1hKtv69g+9+nHaOHHtRLCs4SHBdba41Ptbk8nE0yB2aVWS47UCVmbCiEPRl3OS
	 OOOmwbvjXOGRW4+l+Fl5Db4/dr1OmHm7MrwulVHxJbKTdyEHQ3NTGcdOMdEgeyjp8x
	 Bnhvsybnbj7XLRupXWsVSvlbZl5l0MkRPAmNgCHLopPgDW88Klsc03QWfixcsMp1ds
	 +aTlrZPTdD+D3j3dxUqa8Amstg4Jm6Ls7tDlHjwAmIJRs0+hlsAiHuqOW6oF7u3daV
	 6pJaAyNaWqCjBOraN+K5IIYx7vpYRHJKUfWFE2ALkjnpNdro2udTrbfcUvW8kYfIQr
	 Wz7OBF1jOw3AQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RsC8Y0yCxz4x2b;
	Fri, 22 Sep 2023 10:00:45 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Janosch Frank
 <frankja@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, James Morse <james.morse@arm.com>,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Marc Zyngier <maz@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Oliver Upton
 <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, Sean
 Christopherson <seanjc@google.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 x86@kernel.org, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH rc] kvm: Prevent compiling virt/kvm/vfio.c unless VFIO
 is selected
In-Reply-To: <0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com>
References: <0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com>
Date: Fri, 22 Sep 2023 10:00:44 +1000
Message-ID: <87leczm5zn.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jason Gunthorpe <jgg@nvidia.com> writes:
> There are a bunch of reported randconfig failures now because of this,
> something like:
>
>>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning: attribute declaration must precede definition [-Wignored-attributes]
>            fn = symbol_get(vfio_file_iommu_group);
>                 ^
>    include/linux/module.h:805:60: note: expanded from macro 'symbol_get'
>    #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
>
> It happens because the arch forces KVM_VFIO without knowing if VFIO is
> even enabled.
>
> Split the kconfig so the arch selects the usual HAVE_KVM_ARCH_VFIO and
> then KVM_VFIO is only enabled if the arch wants it and VFIO is turned on.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308251949.5IiaV0sz-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202309030741.82aLACDG-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202309110914.QLH0LU6L-lkp@intel.com/
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Fixes: c1cce6d079b8 ("vfio: Compile vfio_group infrastructure optionally")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/arm64/kvm/Kconfig   | 2 +-
>  arch/powerpc/kvm/Kconfig | 2 +-
>  arch/s390/kvm/Kconfig    | 2 +-
>  arch/x86/kvm/Kconfig     | 2 +-
>  virt/kvm/Kconfig         | 7 ++++++-
>  5 files changed, 10 insertions(+), 5 deletions(-)
>
> Sean's large series will also address this:
>
> https://lore.kernel.org/kvm/20230916003118.2540661-7-seanjc@google.com/
>
> I don't know if it is sever enough to fix in the rc cycle, but here is the
> patch.

Thanks for debugging this, I had seen it but hadn't got around to it.

I think it's definitely worth fixing now. It's a pretty simple patch and
it's still early in the rc cycle.

Tested-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 83c1e09be42e5b..7c43eaea51ce05 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -28,7 +28,7 @@ menuconfig KVM
>  	select KVM_MMIO
>  	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>  	select KVM_XFER_TO_GUEST_WORK
> -	select KVM_VFIO
> +	select HAVE_KVM_ARCH_VFIO
>  	select HAVE_KVM_EVENTFD
>  	select HAVE_KVM_IRQFD
>  	select HAVE_KVM_DIRTY_RING_ACQ_REL
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index 902611954200df..b64824e4cbc1eb 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -22,7 +22,7 @@ config KVM
>  	select PREEMPT_NOTIFIERS
>  	select HAVE_KVM_EVENTFD
>  	select HAVE_KVM_VCPU_ASYNC_IOCTL
> -	select KVM_VFIO
> +	select HAVE_KVM_ARCH_VFIO
>  	select IRQ_BYPASS_MANAGER
>  	select HAVE_KVM_IRQ_BYPASS
>  	select INTERVAL_TREE
> diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
> index 45fdf2a9b2e326..d206ad3a777d5d 100644
> --- a/arch/s390/kvm/Kconfig
> +++ b/arch/s390/kvm/Kconfig
> @@ -31,7 +31,7 @@ config KVM
>  	select HAVE_KVM_IRQ_ROUTING
>  	select HAVE_KVM_INVALID_WAKEUPS
>  	select HAVE_KVM_NO_POLL
> -	select KVM_VFIO
> +	select HAVE_KVM_ARCH_VFIO
>  	select INTERVAL_TREE
>  	select MMU_NOTIFIER
>  	help
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index ed90f148140dfe..8e70e693f90e30 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -45,7 +45,7 @@ config KVM
>  	select HAVE_KVM_NO_POLL
>  	select KVM_XFER_TO_GUEST_WORK
>  	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
> -	select KVM_VFIO
> +	select HAVE_KVM_ARCH_VFIO
>  	select INTERVAL_TREE
>  	select HAVE_KVM_PM_NOTIFIER if PM
>  	select KVM_GENERIC_HARDWARE_ENABLING
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 484d0873061ca5..0bf34809e1bbfe 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -59,9 +59,14 @@ config HAVE_KVM_MSI
>  config HAVE_KVM_CPU_RELAX_INTERCEPT
>         bool
>  
> -config KVM_VFIO
> +config HAVE_KVM_ARCH_VFIO
>         bool
>  
> +config KVM_VFIO
> +       def_bool y
> +       depends on HAVE_KVM_ARCH_VFIO
> +       depends on VFIO
> +
>  config HAVE_KVM_INVALID_WAKEUPS
>         bool
>  
>
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> -- 
> 2.42.0
