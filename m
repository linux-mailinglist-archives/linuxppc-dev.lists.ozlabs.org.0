Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0AE8127BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 07:09:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=RqNkw+CY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrMPh3BjNz3vww
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 17:09:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=RqNkw+CY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrMJc04sFz3vwm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 17:05:03 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6cedc988cf6so3500943b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 22:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702533901; x=1703138701; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvVjokEhJRkgiYQ+o9OaV0HA0xI9C7Xt69a6c2d+FcQ=;
        b=RqNkw+CYre1ZWDPEppelhJfA7zaR5Ek9XEMwx0r/p8gsWCu73zklPbSkrCV8jTzeD6
         duBGc+GUTVd6weohXltyGcG6y7ZH8l0Wtris61l00F0JuFMfYyoWHUtMHxcpdAZ2QaqI
         5jg6K6VjWzf3IWfwh/G2wQL2IGWG2UdUZ2yoxmv1IefJiQiWtDnJ66UvOH8XAyVLkqim
         qPekHJBZNhfPKXcouScvDl4uCl6Bps5mr629ZuCL7FpFctjsDZ8FmlUBGd7BmnBErlIa
         JSj3odKvpkNZ9AC2LxeYwPO19KJtrMp8p1hhd7xv6f6BOrUCl24RMIOPS+PwTkGFPu4h
         eseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702533901; x=1703138701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvVjokEhJRkgiYQ+o9OaV0HA0xI9C7Xt69a6c2d+FcQ=;
        b=nnCyGMFTjMIYxyxa1r9HL5VrxGzOM56FE4t0WDdWvxAgrTPXaQe0KFP7hXOkeCOGkH
         mWr9L9ZgbyEx42CC82ec7XCXl1BEONhgClHyx54QCfeUHVsQnXhznFLzhPLvNlxBJ/ON
         6uMObM/qBKGULzJ0cTsSnON9laWpNrNo+FYUPvEwwnKIicqrp5Kq0iq1Y5/MHHqC3bFY
         8D196pvxfh2FMk7elkXATfldUKlp90U/Bz0xwQaYOx4rx9jdHW6zPkFe+6KFo9d8UT/C
         6fdKrzaS/fzXDvrq0976cjzpqC2xB4AogOeVEJh2A2BI2Fn9UkRZNyqN5vFX3bnVxWt1
         BOnQ==
X-Gm-Message-State: AOJu0Yz7OAAIOciSjPWaZgiYEe73shU7nznDEBJVqc6ysUXsbBW5W4dx
	XHUCzuNOrYyad9CPhIRCczNiZfL8ObonI0FuXbqEqw==
X-Google-Smtp-Source: AGHT+IHIasKoIhsfkj7Yu+FMUSkaxjPll3cuawBTpXD75vrutVj6NpINC37M3K8JiCCZ1y7ffegWrPb57ZwkbEZ9v2I=
X-Received: by 2002:a17:90a:e395:b0:286:bfed:6f55 with SMTP id
 b21-20020a17090ae39500b00286bfed6f55mr4390822pjz.38.1702533901140; Wed, 13
 Dec 2023 22:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-20-seanjc@google.com>
In-Reply-To: <20230916003118.2540661-20-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 11:34:49 +0530
Message-ID: <CAAhSdy1bzQ2mxOew0iw-OuLWxzOhk3LtO+908TYw2gw+5yN3RA@mail.gmail.com>
Subject: Re: [PATCH 19/26] KVM: Standardize include paths across all architectures
To: Sean Christopherson <seanjc@google.com>
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
Cc: x86@kernel.org, kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Andrew Thornton <andrewth@google.com>, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Venkatesh Srinivas <venkateshs@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>, And
 y Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Krowiak <akrowiak@linux.ibm.com>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 16, 2023 at 6:01=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Standardize KVM's include paths across all architectures by declaring
> the KVM-specific includes in the common Makefile.kvm.  Having common KVM
> "own" the included paths reduces the temptation to unnecessarily add
> virt/kvm to arch include paths, and conversely if allowing arch code to
> grab headers from virt/kvm becomes desirable, virt/kvm can be added to
> all architecture's include path with a single line update.
>
> Having the common KVM makefile append to ccflags also provides a
> convenient location to append other things, e.g. KVM-specific #defines.
>
> Note, this changes the behavior of s390 and PPC, as s390 and PPC
> previously overwrote ccflags-y instead of adding on.  There is no evidenc=
e
> that overwriting ccflags-y was necessary or even deliberate, as both s390
> and PPC switched to the overwrite behavior without so much as a passing
> mention when EXTRA_CFLAGS was replaced with ccflags-y (commit c73028a0288=
7
> ("s390: change to new flag variable") and commit 4108d9ba9091
> ("powerpc/Makefiles: Change to new flag variables")).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/arm64/kvm/Makefile   | 2 --
>  arch/mips/kvm/Makefile    | 2 --
>  arch/powerpc/kvm/Makefile | 2 --
>  arch/riscv/kvm/Makefile   | 2 --
>  arch/s390/kvm/Makefile    | 2 --
>  arch/x86/kvm/Makefile     | 1 -
>  virt/kvm/Makefile.kvm     | 2 ++
>  7 files changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index c0c050e53157..3996489baeef 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -3,8 +3,6 @@
>  # Makefile for Kernel-based Virtual Machine module
>  #
>
> -ccflags-y +=3D -I $(srctree)/$(src)
> -
>  include $(srctree)/virt/kvm/Makefile.kvm
>
>  obj-$(CONFIG_KVM) +=3D kvm.o
> diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
> index 96a7cd21b140..d198e1addea7 100644
> --- a/arch/mips/kvm/Makefile
> +++ b/arch/mips/kvm/Makefile
> @@ -4,8 +4,6 @@
>
>  include $(srctree)/virt/kvm/Makefile.kvm
>
> -ccflags-y +=3D -Iarch/mips/kvm
> -
>  kvm-$(CONFIG_CPU_HAS_MSA) +=3D msa.o
>
>  kvm-y +=3D    mips.o emulate.o entry.o \
> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
> index 08a0e53d58c7..d6c6678ddf65 100644
> --- a/arch/powerpc/kvm/Makefile
> +++ b/arch/powerpc/kvm/Makefile
> @@ -3,8 +3,6 @@
>  # Makefile for Kernel-based Virtual Machine module
>  #
>
> -ccflags-y :=3D -Iarch/powerpc/kvm
> -
>  include $(srctree)/virt/kvm/Makefile.kvm
>
>  common-objs-y +=3D powerpc.o emulate_loadstore.o
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 4c2067fc59fc..ff7d5f67e229 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -3,8 +3,6 @@
>  # Makefile for RISC-V KVM support
>  #
>
> -ccflags-y +=3D -I $(srctree)/$(src)
> -
>  include $(srctree)/virt/kvm/Makefile.kvm
>
>  obj-$(CONFIG_KVM) +=3D kvm.o
> diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
> index f17249ab2a72..f8153189e003 100644
> --- a/arch/s390/kvm/Makefile
> +++ b/arch/s390/kvm/Makefile
> @@ -5,8 +5,6 @@
>
>  include $(srctree)/virt/kvm/Makefile.kvm
>
> -ccflags-y :=3D -Iarch/s390/kvm
> -
>  kvm-y +=3D kvm-s390.o intercept.o interrupt.o priv.o sigp.o
>  kvm-y +=3D diag.o gaccess.o guestdbg.o vsie.o pv.o
>
> diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
> index 80e3fe184d17..d13f1a7b7b3d 100644
> --- a/arch/x86/kvm/Makefile
> +++ b/arch/x86/kvm/Makefile
> @@ -1,6 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -ccflags-y +=3D -I $(srctree)/arch/x86/kvm
>  ccflags-$(CONFIG_KVM_WERROR) +=3D -Werror
>
>  ifeq ($(CONFIG_FRAME_POINTER),y)
> diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
> index 29373b59d89a..e85079ad245d 100644
> --- a/virt/kvm/Makefile.kvm
> +++ b/virt/kvm/Makefile.kvm
> @@ -3,6 +3,8 @@
>  # Makefile for Kernel-based Virtual Machine module
>  #
>
> +ccflags-y +=3D -I$(srctree)/$(src)
> +
>  KVM ?=3D ../../../virt/kvm
>
>  kvm-y :=3D $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
> --
> 2.42.0.459.ge4e396fd5e-goog
>
