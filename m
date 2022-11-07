Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 064B061E8C6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 04:02:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5GH86j8Fz3cdy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 14:02:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=wH7KmpU7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=anup@brainfault.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=wH7KmpU7;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5GGB4N3Qz2x9C
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 14:01:20 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id b2so26690343eja.6
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Nov 2022 19:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JlY2OstXwROXIDpT6VsXnJfzUqv1irH1Acsts2GGjpg=;
        b=wH7KmpU7jVwmAquM9Wvk3ttImj9+lvZI8Rxq1i6YYsElC8cWksh48ZwROArAULlZ7C
         tWe8M8ahyJHdHwo2Ck68YVw1aHJ/MLoYcQlrnfABVok8QpmzXxG1ffcBMZXcH6h5LAvm
         0tBbIsqoRxCX/KnzpT+CYyHXfKhw4foQW6+Ax6UY2aF+XO4GKByYk/PtdVxGB2RT0Fbu
         ysRYJ78VJd30TMAFhUzwFf/xZ7AJ2g1baQLCe9iqAVhA1Yqqkk67FLLNxduytkqwDB7v
         JP5zJ/Gyoc7JfJxpc+R8WHDqVMk2NzGLLCgzvKh3qN6XuvMHVMMnDXEN4atLvrkjLInL
         jZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlY2OstXwROXIDpT6VsXnJfzUqv1irH1Acsts2GGjpg=;
        b=KPopjECmIScfFovE4hfcwS9AziWpl/nTilY64c9JK3MZM2UJMbJy8T0io5W8CwITrG
         ELq2GKFzF8ogqoDEjfVrHMTiGilgm9KbH7OetcspCQtbr7fEuejrY3/qqxAr8WwAR4C/
         3KvZkMFSMhmiF/UbITLBDkoEJmw7oQ1Y1UG2WdbbZhUAf5cDpR+RFSZvypmrmy4HCHSb
         +VXPIbAX4Yqxi3ZmRLuOOqEIFgCiZ7JeffvjFlnkiHZySJZqZ5vIt4o/0xqzU/BoW1jB
         bPmj1owIv1HQLk24Bs9nLKSvzUKi79yEcWwuNkEJ4NwIk8xtFfsGJQJlOwtzQ7inPZD1
         kzKg==
X-Gm-Message-State: ACrzQf2GgJ0W2l23kcg2hQ17xl6G1W7PWsR03N6pBplfGAW/vA2qNj6n
	3IHDlDxwRivd3h4is7frXIpu2UxH9uSDwtLg4O1GVw==
X-Google-Smtp-Source: AMsMyM6JBSnXu9W+mu2GHeFQ3pcqBebFarC8BvVQZEanz3Zu4tMlcAMijwZHL0jNoTpD/MpfGKS3dVLLizMbV1pDGog=
X-Received: by 2002:a17:906:dac8:b0:741:545b:796a with SMTP id
 xi8-20020a170906dac800b00741545b796amr45605430ejb.240.1667790073283; Sun, 06
 Nov 2022 19:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com> <20221102231911.3107438-10-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-10-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Nov 2022 08:31:01 +0530
Message-ID: <CAAhSdy10dC+_S5PZ=QziYqVJKHh6Gi6D0H0C7GSsxWdFVrTQjA@mail.gmail.com>
Subject: Re: [PATCH 09/44] KVM: Drop arch hardware (un)setup hooks
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, 
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 3, 2022 at 4:49 AM Sean Christopherson <seanjc@google.com> wrote:
>
> Drop kvm_arch_hardware_setup() and kvm_arch_hardware_unsetup() now that
> all implementations are nops.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/arm64/include/asm/kvm_host.h   |  1 -
>  arch/arm64/kvm/arm.c                |  5 -----
>  arch/mips/include/asm/kvm_host.h    |  1 -
>  arch/mips/kvm/mips.c                |  5 -----
>  arch/powerpc/include/asm/kvm_host.h |  1 -
>  arch/powerpc/kvm/powerpc.c          |  5 -----
>  arch/riscv/include/asm/kvm_host.h   |  1 -
>  arch/riscv/kvm/main.c               |  5 -----
>  arch/s390/kvm/kvm-s390.c            | 10 ----------
>  arch/x86/kvm/x86.c                  | 10 ----------
>  include/linux/kvm_host.h            |  2 --
>  virt/kvm/kvm_main.c                 |  7 -------
>  12 files changed, 53 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 45e2136322ba..5d5a887e63a5 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -859,7 +859,6 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
>
>  void kvm_arm_vcpu_ptrauth_trap(struct kvm_vcpu *vcpu);
>
> -static inline void kvm_arch_hardware_unsetup(void) {}
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 94d33e296e10..2ee729f54ce0 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -63,11 +63,6 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>         return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
>  }
>
> -int kvm_arch_hardware_setup(void *opaque)
> -{
> -       return 0;
> -}
> -
>  int kvm_arch_check_processor_compat(void *opaque)
>  {
>         return 0;
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index 5cedb28e8a40..28f0ba97db71 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -888,7 +888,6 @@ extern unsigned long kvm_mips_get_ramsize(struct kvm *kvm);
>  extern int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu,
>                              struct kvm_mips_interrupt *irq);
>
> -static inline void kvm_arch_hardware_unsetup(void) {}
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_free_memslot(struct kvm *kvm,
>                                          struct kvm_memory_slot *slot) {}
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a25e0b73ee70..af29490d9740 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -135,11 +135,6 @@ void kvm_arch_hardware_disable(void)
>         kvm_mips_callbacks->hardware_disable();
>  }
>
> -int kvm_arch_hardware_setup(void *opaque)
> -{
> -       return 0;
> -}
> -
>  int kvm_arch_check_processor_compat(void *opaque)
>  {
>         return 0;
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index caea15dcb91d..5d2c3a487e73 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -877,7 +877,6 @@ struct kvm_vcpu_arch {
>  #define __KVM_HAVE_CREATE_DEVICE
>
>  static inline void kvm_arch_hardware_disable(void) {}
> -static inline void kvm_arch_hardware_unsetup(void) {}
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index b850b0efa201..74ea5687ecbc 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -441,11 +441,6 @@ int kvm_arch_hardware_enable(void)
>         return 0;
>  }
>
> -int kvm_arch_hardware_setup(void *opaque)
> -{
> -       return 0;
> -}
> -
>  int kvm_arch_check_processor_compat(void *opaque)
>  {
>         return kvmppc_core_check_processor_compat();
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index dbbf43d52623..8c771fc4f5d2 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -229,7 +229,6 @@ struct kvm_vcpu_arch {
>         bool pause;
>  };
>
> -static inline void kvm_arch_hardware_unsetup(void) {}
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index df2d8716851f..a146fa0ce4d2 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -25,11 +25,6 @@ int kvm_arch_check_processor_compat(void *opaque)
>         return 0;
>  }
>
> -int kvm_arch_hardware_setup(void *opaque)
> -{
> -       return 0;
> -}
> -
>  int kvm_arch_hardware_enable(void)
>  {
>         unsigned long hideleg, hedeleg;
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 1aaee15211f2..7fcd2d3b3558 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -321,16 +321,6 @@ static struct notifier_block kvm_clock_notifier = {
>         .notifier_call = kvm_clock_sync,
>  };
>
> -int kvm_arch_hardware_setup(void *opaque)
> -{
> -       return 0;
> -}
> -
> -void kvm_arch_hardware_unsetup(void)
> -{
> -
> -}
> -
>  static void allow_cpu_feat(unsigned long nr)
>  {
>         set_bit_inv(nr, kvm_s390_available_cpu_feat);
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 80ee580a9cd4..40d4bfaa17a4 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -11985,16 +11985,6 @@ void kvm_arch_hardware_disable(void)
>         drop_user_return_notifiers();
>  }
>
> -int kvm_arch_hardware_setup(void *opaque)
> -{
> -       return 0;
> -}
> -
> -void kvm_arch_hardware_unsetup(void)
> -{
> -
> -}
> -
>  int kvm_arch_check_processor_compat(void *opaque)
>  {
>         struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 18592bdf4c1b..9b52bd40be56 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1447,8 +1447,6 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
>
>  int kvm_arch_hardware_enable(void);
>  void kvm_arch_hardware_disable(void);
> -int kvm_arch_hardware_setup(void *opaque);
> -void kvm_arch_hardware_unsetup(void);
>  int kvm_arch_check_processor_compat(void *opaque);
>  int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
>  bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index f592dd4ce8f2..27ce263a80e4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5843,10 +5843,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>         if (r)
>                 return r;
>
> -       r = kvm_arch_hardware_setup(opaque);
> -       if (r < 0)
> -               goto err_hw_setup;
> -
>         if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
>                 r = -ENOMEM;
>                 goto err_hw_enabled;
> @@ -5939,8 +5935,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  out_free_2:
>         free_cpumask_var(cpus_hardware_enabled);
>  err_hw_enabled:
> -       kvm_arch_hardware_unsetup();
> -err_hw_setup:
>         kvm_arch_exit();
>         return r;
>  }
> @@ -5969,7 +5963,6 @@ void kvm_exit(void)
>         on_each_cpu(hardware_disable_nolock, NULL, 1);
>         kvm_irqfd_exit();
>         free_cpumask_var(cpus_hardware_enabled);
> -       kvm_arch_hardware_unsetup();
>         kvm_arch_exit();
>  }
>  EXPORT_SYMBOL_GPL(kvm_exit);
> --
> 2.38.1.431.g37b22c650d-goog
>
