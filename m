Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 877D48127CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 07:14:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PXH/XJPC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrMWp1T7Nz3vcd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 17:14:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PXH/XJPC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrMW13C0Mz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 17:14:05 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b9e07690ccso5024946b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 22:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702534442; x=1703139242; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3sMkRAMQECWLiukPZgPf+GGB55ddSK20MJ/gjXWD1s=;
        b=PXH/XJPCKG9pURsmYMbeIm0JbXntRSmJtHp9gu54E941VojqW0YkFsp8Nz3XgOCIQn
         OslaZ9K2bn0yIX8AhnwRmLcXVokp6/VhpynEd3PZVq1mdMoYLOOYVSaW/I0ZnInttG8f
         6sb4D6bVl1As27u1sM8VX3TFu8vwAgVmQZP8Xt/bXwEpUCdrWxTirt8taX5hgziCY7At
         H/FIQNlBQ8dO+Jx/s6mZ0p2eoHlHe+ad7FZgSrttEDqarRd7kUhWH5KGxZOshBDcflOg
         jZELUE4uoJb6FZYNxo7HHgwi9YmIBkjLrq1ziJCWvYkKfCp7B1ofMq3uBXjYZ8ZuhZam
         4fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702534442; x=1703139242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3sMkRAMQECWLiukPZgPf+GGB55ddSK20MJ/gjXWD1s=;
        b=F42Ptt0mc+2LIuVy1setL6aWwLayHy0i+eG5gVBg/aoZSjqJ0yWT8IugIsmW9D5AV6
         vzOKl1/ZAA1o17GZNSTTtC2zHc3KaeZk2uFmQDAs/6qeu7F4iDd1a4yuYiiNGeS5hDGI
         Ye1oGdhNTMJRNdsWo0cyNf1ocW6X9dhcfPBXYtuYmh5TDxHctliO3ivwrr+jYp/aI5Rl
         yKe+tKl8xLehoYnxkP7l4VJ9pybdQlm9Pha0uLN+JHZysHiC+P2oGi6r6N+xUE9zBEd4
         HfymIFBh9xvr89QXueWr+rB6qxAhcLYz4GfE+OZMFuJ+zVB2kznN6FgZv2v2h6sk8BPH
         7MDQ==
X-Gm-Message-State: AOJu0YzLt2K3oeAGz/sOAqo2dao3K1xh/tesguwoBbkbrbwWmDzbSUTZ
	32dIMSD4H66yB9corwFjp8mOLh0500cSJJgzXe50xA==
X-Google-Smtp-Source: AGHT+IHQd+GqK3y5tlwO2tTpsax7aS81PVJh1PsMGIYAkqaLtpj/3C4S2vBn648Rccq1W4+OEQ+fJWJGTJEaydQwxew=
X-Received: by 2002:a05:6808:2e85:b0:3ba:8d5:4009 with SMTP id
 gt5-20020a0568082e8500b003ba08d54009mr11288098oib.110.1702534442120; Wed, 13
 Dec 2023 22:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-23-seanjc@google.com>
In-Reply-To: <20230916003118.2540661-23-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 11:43:50 +0530
Message-ID: <CAAhSdy2N8PmP2+-8sFVpgduED0HU9D3dqg7sk3+R9f2wRgZ7KA@mail.gmail.com>
Subject: Re: [PATCH 22/26] entry/kvm: KVM: Move KVM details related to
 signal/-EINTR into KVM proper
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

On Sat, Sep 16, 2023 at 6:02=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Move KVM's morphing of pending signals into exits to userspace into KVM
> proper, and drop the @vcpu param from xfer_to_guest_mode_handle_work().
> How KVM responds to -EINTR is a detail that really belongs in KVM itself,
> and removing the non-KVM call to kvm_handle_signal_exit() will allow
> hiding said API and the definition of "struct kvm_vcpu" from the kernel.
>
> Alternatively, entry/kvm.c could be treated as part of KVM, i.e. be given
> access to KVM internals, but that's not obviously better than having KVM
> react to -EINTR (though it's not obviously worse either).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/arm64/kvm/arm.c      |  3 +--
>  arch/riscv/kvm/vcpu.c     |  2 +-
>  arch/x86/kvm/vmx/vmx.c    |  1 -
>  arch/x86/kvm/x86.c        |  3 +--
>  include/linux/entry-kvm.h |  3 +--
>  include/linux/kvm_host.h  | 13 ++++++++++++-
>  kernel/entry/kvm.c        | 11 ++++-------
>  7 files changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 6480628197b4..641df091e46b 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -6,7 +6,6 @@
>
>  #include <linux/bug.h>
>  #include <linux/cpu_pm.h>
> -#include <linux/entry-kvm.h>
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/kvm_host.h>
> @@ -929,7 +928,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                 /*
>                  * Check conditions before entering the guest
>                  */
> -               ret =3D xfer_to_guest_mode_handle_work(vcpu);
> +               ret =3D kvm_xfer_to_guest_mode_handle_work(vcpu);
>                 if (!ret)
>                         ret =3D 1;
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 82229db1ce73..c313f4e90e70 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -667,7 +667,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>         run->exit_reason =3D KVM_EXIT_UNKNOWN;
>         while (ret > 0) {
>                 /* Check conditions before entering the guest */
> -               ret =3D xfer_to_guest_mode_handle_work(vcpu);
> +               ret =3D kvm_xfer_to_guest_mode_handle_work(vcpu);
>                 if (ret)
>                         continue;
>                 ret =3D 1;
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index faf0071566ef..43b87ad5fde8 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -28,7 +28,6 @@
>  #include <linux/slab.h>
>  #include <linux/tboot.h>
>  #include <linux/trace_events.h>
> -#include <linux/entry-kvm.h>
>
>  #include <asm/apic.h>
>  #include <asm/asm.h>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 6c9c81e82e65..aab095f89d9e 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -59,7 +59,6 @@
>  #include <linux/sched/stat.h>
>  #include <linux/sched/isolation.h>
>  #include <linux/mem_encrypt.h>
> -#include <linux/entry-kvm.h>
>  #include <linux/suspend.h>
>  #include <linux/smp.h>
>
> @@ -10987,7 +10986,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
>
>                 if (__xfer_to_guest_mode_work_pending()) {
>                         kvm_vcpu_srcu_read_unlock(vcpu);
> -                       r =3D xfer_to_guest_mode_handle_work(vcpu);
> +                       r =3D kvm_xfer_to_guest_mode_handle_work(vcpu);
>                         kvm_vcpu_srcu_read_lock(vcpu);
>                         if (r)
>                                 return r;
> diff --git a/include/linux/entry-kvm.h b/include/linux/entry-kvm.h
> index e7d90d06e566..e235a91d28fc 100644
> --- a/include/linux/entry-kvm.h
> +++ b/include/linux/entry-kvm.h
> @@ -42,11 +42,10 @@ static inline int arch_xfer_to_guest_mode_handle_work=
(unsigned long ti_work)
>  /**
>   * xfer_to_guest_mode_handle_work - Check and handle pending work which =
needs
>   *                                 to be handled before going to guest m=
ode
> - * @vcpu:      Pointer to current's VCPU data
>   *
>   * Returns: 0 or an error code
>   */
> -int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu);
> +int xfer_to_guest_mode_handle_work(void);
>
>  /**
>   * xfer_to_guest_mode_prepare - Perform last minute preparation work tha=
t
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index fb6c6109fdca..d520d6801070 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2,7 +2,7 @@
>  #ifndef __KVM_HOST_H
>  #define __KVM_HOST_H
>
> -
> +#include <linux/entry-kvm.h>
>  #include <linux/types.h>
>  #include <linux/hardirq.h>
>  #include <linux/list.h>
> @@ -2293,6 +2293,17 @@ static inline void kvm_handle_signal_exit(struct k=
vm_vcpu *vcpu)
>         vcpu->run->exit_reason =3D KVM_EXIT_INTR;
>         vcpu->stat.signal_exits++;
>  }
> +
> +static inline int kvm_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vc=
pu)
> +{
> +       int r =3D xfer_to_guest_mode_handle_work();
> +
> +       if (r) {
> +               WARN_ON_ONCE(r !=3D -EINTR);
> +               kvm_handle_signal_exit(vcpu);
> +       }
> +       return r;
> +}
>  #endif /* CONFIG_KVM_XFER_TO_GUEST_WORK */
>
>  /*
> diff --git a/kernel/entry/kvm.c b/kernel/entry/kvm.c
> index c2fc39824157..872617468b4a 100644
> --- a/kernel/entry/kvm.c
> +++ b/kernel/entry/kvm.c
> @@ -1,17 +1,14 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/entry-kvm.h>
> -#include <linux/kvm_host.h>
>
> -static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long =
ti_work)
> +static int xfer_to_guest_mode_work(unsigned long ti_work)
>  {
>         do {
>                 int ret;
>
> -               if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
> -                       kvm_handle_signal_exit(vcpu);
> +               if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
>                         return -EINTR;
> -               }
>
>                 if (ti_work & _TIF_NEED_RESCHED)
>                         schedule();
> @@ -28,7 +25,7 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcp=
u, unsigned long ti_work)
>         return 0;
>  }
>
> -int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
> +int xfer_to_guest_mode_handle_work(void)
>  {
>         unsigned long ti_work;
>
> @@ -44,6 +41,6 @@ int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcp=
u)
>         if (!(ti_work & XFER_TO_GUEST_MODE_WORK))
>                 return 0;
>
> -       return xfer_to_guest_mode_work(vcpu, ti_work);
> +       return xfer_to_guest_mode_work(ti_work);
>  }
>  EXPORT_SYMBOL_GPL(xfer_to_guest_mode_handle_work);
> --
> 2.42.0.459.ge4e396fd5e-goog
>
