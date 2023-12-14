Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075008127B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 07:08:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ehPR2Rih;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrMNf4xlQz3cZw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 17:08:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ehPR2Rih;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrMG35Dg5z3vln
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 17:02:51 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d3536cd414so12522345ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 22:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702533767; x=1703138567; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rR88+KJ4oetYgNJPPfLxYGb3zN8cHiA15JFTdJl3Cf4=;
        b=ehPR2Rih+EgoS4XwWCpmigOAcgx56tXSAcY1RSPOdNWFqFvTKZeuRp/jaiFi94rUfS
         fvuCGzdRIkFktDi/aZqrXnus/5rP0lbspEVDmFWiJNNxj1xigNGlRh86rYBPJpBRsB/A
         hfMjAPcoOuFgTDv7IMpAyR8uyr4vz2H4KGXRvok9ZmWw7Yfyrb2RvZTtapfS2issO2Fr
         E8exx5IroFewbUAPL6OoJUZh3TIxtDt9G9evpYj1T0hnc9/k487K64D/ZAQVJXWt7qXr
         6lggTGEGWJ2NVnCxD9VWDgd+gihL2oclGxxQwDbkZs46GZVOzG4yWtQLdCumKZjnSsjp
         et3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702533767; x=1703138567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rR88+KJ4oetYgNJPPfLxYGb3zN8cHiA15JFTdJl3Cf4=;
        b=I8pIK9cpzJUOwdtb8759dI3Q/E94ERWhmd70fPh/8iGnOb6itauYSCM2P7CzcEnChq
         Jub8jQXoqTzBDV0VtGF+g1SHBQ2PdD+tdeU28nZZcOno36WaCU97GNYrNTlFkNYVLLKx
         RUSxihj0v7xhQa6i9GP0iMkZZtmwnwZ7RO8w1wLryMyM3eK71ttiwtFuG5wADcIPLk+7
         I6cf9ADuWMfeCxb1ZS3UBMZq1aoZQzQHNlVVASwb/EL98ierBa/4wCbYKju8XLaY/Jpb
         kNjhWpTVqMyTI1ZCwzb5+Qa2Jv+0hrr53E6aTlyH1w+EdRe1AQVVqqui6E5hACQZMbkR
         YcPA==
X-Gm-Message-State: AOJu0YwW7GGjx2JP+AS+0tH3Tre2al459a7Rv+HV+JEqvnEQpHDe0eUW
	BKk+cpTockgNeAbKjsbZI6+HsRVg6UcF1T7Dfi0rrg==
X-Google-Smtp-Source: AGHT+IHApeJ6ArYXy3rl2+lkJnBjQtf5ZPUukPygJf2EkLx2G75ff0WSU5JG6Xt465dG74MxwoWECoutji/AYS76NKE=
X-Received: by 2002:a17:90b:3692:b0:28a:ee4d:20e4 with SMTP id
 mj18-20020a17090b369200b0028aee4d20e4mr1197143pjb.87.1702533766622; Wed, 13
 Dec 2023 22:02:46 -0800 (PST)
MIME-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-16-seanjc@google.com>
In-Reply-To: <20230916003118.2540661-16-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 11:32:35 +0530
Message-ID: <CAAhSdy2aW0vUsaA_sVKROv8tr9ixuY+RZQt6XFs86bzy++AegA@mail.gmail.com>
Subject: Re: [PATCH 15/26] KVM: Move include/kvm/iodev.h to include/linux as kvm_iodev.h
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
> Move iodev.h, the last remaining holdout in include/kvm, to the standard
> include/linux directory as kvm_iodev.h and delete include/kvm.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  MAINTAINERS                                | 1 -
>  arch/arm64/include/asm/kvm_vgic.h          | 2 +-
>  arch/arm64/kvm/vgic/vgic-mmio-v2.c         | 2 +-
>  arch/arm64/kvm/vgic/vgic-mmio-v3.c         | 2 +-
>  arch/arm64/kvm/vgic/vgic-mmio.c            | 2 +-
>  arch/mips/include/asm/kvm_host.h           | 3 +--
>  arch/powerpc/kvm/mpic.c                    | 2 +-
>  arch/riscv/kvm/aia_aplic.c                 | 2 +-
>  arch/riscv/kvm/aia_imsic.c                 | 2 +-
>  arch/x86/kvm/i8254.h                       | 2 +-
>  arch/x86/kvm/ioapic.h                      | 2 +-
>  arch/x86/kvm/irq.h                         | 2 +-
>  arch/x86/kvm/lapic.h                       | 2 +-
>  include/{kvm/iodev.h =3D> linux/kvm_iodev.h} | 0
>  virt/kvm/coalesced_mmio.c                  | 3 +--
>  virt/kvm/eventfd.c                         | 2 +-
>  virt/kvm/kvm_main.c                        | 3 +--
>  17 files changed, 15 insertions(+), 19 deletions(-)
>  rename include/{kvm/iodev.h =3D> linux/kvm_iodev.h} (100%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..ddc8375d536c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11498,7 +11498,6 @@ W:      http://www.linux-kvm.org
>  T:     git git://git.kernel.org/pub/scm/virt/kvm/kvm.git
>  F:     Documentation/virt/kvm/
>  F:     include/asm-generic/kvm*
> -F:     include/kvm/iodev.h
>  F:     include/linux/kvm*
>  F:     include/trace/events/kvm.h
>  F:     include/uapi/asm-generic/kvm*
> diff --git a/arch/arm64/include/asm/kvm_vgic.h b/arch/arm64/include/asm/k=
vm_vgic.h
> index 5b27f94d4fad..2ca52888bc75 100644
> --- a/arch/arm64/include/asm/kvm_vgic.h
> +++ b/arch/arm64/include/asm/kvm_vgic.h
> @@ -13,7 +13,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/static_key.h>
>  #include <linux/types.h>
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>  #include <linux/list.h>
>  #include <linux/jump_label.h>
>
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v2.c b/arch/arm64/kvm/vgic/vgi=
c-mmio-v2.c
> index bba0cfeefffe..646053ee892f 100644
> --- a/arch/arm64/kvm/vgic/vgic-mmio-v2.c
> +++ b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
> @@ -6,9 +6,9 @@
>  #include <linux/irqchip/arm-gic.h>
>  #include <linux/kvm.h>
>  #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>  #include <linux/nospec.h>
>
> -#include <kvm/iodev.h>
>  #include <asm/kvm_vgic.h>
>
>  #include "vgic.h"
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgi=
c-mmio-v3.c
> index d54a90beef61..b79a2e860415 100644
> --- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> +++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> @@ -7,8 +7,8 @@
>  #include <linux/irqchip/arm-gic-v3.h>
>  #include <linux/kvm.h>
>  #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>  #include <linux/interrupt.h>
> -#include <kvm/iodev.h>
>
>  #include <asm/kvm_emulate.h>
>  #include <asm/kvm_arm.h>
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-m=
mio.c
> index 68a3d8062473..4feca3b1d915 100644
> --- a/arch/arm64/kvm/vgic/vgic-mmio.c
> +++ b/arch/arm64/kvm/vgic/vgic-mmio.c
> @@ -9,7 +9,7 @@
>  #include <linux/irq.h>
>  #include <linux/kvm.h>
>  #include <linux/kvm_host.h>
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>  #include <asm/kvm_arch_timer.h>
>  #include <asm/kvm_vgic.h>
>
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm=
_host.h
> index 54a85f1d4f2c..f8f63d0aa399 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -16,6 +16,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/types.h>
>  #include <linux/kvm.h>
> +#include <linux/kvm_iodev.h>
>  #include <linux/kvm_types.h>
>  #include <linux/threads.h>
>  #include <linux/spinlock.h>
> @@ -24,8 +25,6 @@
>  #include <asm/inst.h>
>  #include <asm/mipsregs.h>
>
> -#include <kvm/iodev.h>
> -
>  /* MIPS KVM register ids */
>  #define MIPS_CP0_32(_R, _S)                                    \
>         (KVM_REG_MIPS_CP0 | KVM_REG_SIZE_U32 | (8 * (_R) + (_S)))
> diff --git a/arch/powerpc/kvm/mpic.c b/arch/powerpc/kvm/mpic.c
> index 23e9c2bd9f27..b25a03251544 100644
> --- a/arch/powerpc/kvm/mpic.c
> +++ b/arch/powerpc/kvm/mpic.c
> @@ -26,6 +26,7 @@
>  #include <linux/slab.h>
>  #include <linux/mutex.h>
>  #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>  #include <linux/errno.h>
>  #include <linux/fs.h>
>  #include <linux/anon_inodes.h>
> @@ -33,7 +34,6 @@
>  #include <asm/mpic.h>
>  #include <asm/kvm_para.h>
>  #include <asm/kvm_ppc.h>
> -#include <kvm/iodev.h>
>
>  #define MAX_CPU     32
>  #define MAX_SRC     256
> diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
> index 39e72aa016a4..b49e747f2bad 100644
> --- a/arch/riscv/kvm/aia_aplic.c
> +++ b/arch/riscv/kvm/aia_aplic.c
> @@ -11,7 +11,7 @@
>  #include <linux/math.h>
>  #include <linux/spinlock.h>
>  #include <linux/swab.h>
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>  #include <asm/kvm_aia_aplic.h>
>
>  struct aplic_irq {
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index 6cf23b8adb71..586e466a1c6d 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -10,10 +10,10 @@
>  #include <linux/atomic.h>
>  #include <linux/bitmap.h>
>  #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>  #include <linux/math.h>
>  #include <linux/spinlock.h>
>  #include <linux/swab.h>
> -#include <kvm/iodev.h>
>  #include <asm/csr.h>
>  #include <asm/kvm_aia_imsic.h>
>
> diff --git a/arch/x86/kvm/i8254.h b/arch/x86/kvm/i8254.h
> index a768212ba821..4de7a0b88e4f 100644
> --- a/arch/x86/kvm/i8254.h
> +++ b/arch/x86/kvm/i8254.h
> @@ -4,7 +4,7 @@
>
>  #include <linux/kthread.h>
>
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>
>  struct kvm_kpit_channel_state {
>         u32 count; /* can be 65536 */
> diff --git a/arch/x86/kvm/ioapic.h b/arch/x86/kvm/ioapic.h
> index 539333ac4b38..2beec2daf1a3 100644
> --- a/arch/x86/kvm/ioapic.h
> +++ b/arch/x86/kvm/ioapic.h
> @@ -3,7 +3,7 @@
>  #define __KVM_IO_APIC_H
>
>  #include <linux/kvm_host.h>
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>  #include "irq.h"
>
>  struct kvm;
> diff --git a/arch/x86/kvm/irq.h b/arch/x86/kvm/irq.h
> index c2d7cfe82d00..f9530e9a66f8 100644
> --- a/arch/x86/kvm/irq.h
> +++ b/arch/x86/kvm/irq.h
> @@ -13,9 +13,9 @@
>  #include <linux/mm_types.h>
>  #include <linux/hrtimer.h>
>  #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>  #include <linux/spinlock.h>
>
> -#include <kvm/iodev.h>
>  #include "lapic.h"
>
>  #define PIC_NUM_PINS 16
> diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
> index 0a0ea4b5dd8c..bfd99ad1882e 100644
> --- a/arch/x86/kvm/lapic.h
> +++ b/arch/x86/kvm/lapic.h
> @@ -2,7 +2,7 @@
>  #ifndef __KVM_X86_LAPIC_H
>  #define __KVM_X86_LAPIC_H
>
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>
>  #include <linux/kvm_host.h>
>
> diff --git a/include/kvm/iodev.h b/include/linux/kvm_iodev.h
> similarity index 100%
> rename from include/kvm/iodev.h
> rename to include/linux/kvm_iodev.h
> diff --git a/virt/kvm/coalesced_mmio.c b/virt/kvm/coalesced_mmio.c
> index 1b90acb6e3fe..cfcb4b84d632 100644
> --- a/virt/kvm/coalesced_mmio.c
> +++ b/virt/kvm/coalesced_mmio.c
> @@ -9,8 +9,7 @@
>   *
>   */
>
> -#include <kvm/iodev.h>
> -
> +#include <linux/kvm_iodev.h>
>  #include <linux/kvm_host.h>
>  #include <linux/slab.h>
>  #include <linux/kvm.h>
> diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
> index 89912a17f5d5..4d7cfb1095fd 100644
> --- a/virt/kvm/eventfd.c
> +++ b/virt/kvm/eventfd.c
> @@ -26,7 +26,7 @@
>  #include <linux/irqbypass.h>
>  #include <trace/events/kvm.h>
>
> -#include <kvm/iodev.h>
> +#include <linux/kvm_iodev.h>
>
>  #ifdef CONFIG_HAVE_KVM_IRQFD
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 486800a7024b..f585a159b4f5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -13,9 +13,8 @@
>   *   Yaniv Kamay  <yaniv@qumranet.com>
>   */
>
> -#include <kvm/iodev.h>
> -
>  #include <linux/kvm_host.h>
> +#include <linux/kvm_iodev.h>
>  #include <linux/kvm.h>
>  #include <linux/module.h>
>  #include <linux/errno.h>
> --
> 2.42.0.459.ge4e396fd5e-goog
>
