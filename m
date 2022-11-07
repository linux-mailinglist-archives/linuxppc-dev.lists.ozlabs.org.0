Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F2161E943
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 04:14:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5GYH6HCbz3dtl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 14:14:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Q5Al979g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=anup@brainfault.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Q5Al979g;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5GXP2hz8z2xfV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 14:13:41 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id ud5so26778123ejc.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Nov 2022 19:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSzSSykdSUMY4z4QifNhRv3KUDv6uVGdlzhODRpQKlU=;
        b=Q5Al979g3+9Gavat8UlkB2Vleew+RmRbxdo+12K5r30eUrjF3YlGq0gOgvyYiLB3mt
         xgUU5ersVZgrB7+2jJY/bYXwsyIwwhtdWpcjxIdfzpDR5elbZNcB3K1l5DpUeR+BlciO
         idhic3khR724h6Kur7YB5I6R8BRlRfSrPOCcVMYpVLmUdl3EmI7WB0tcku7Xie02geae
         eDiGCrNsXaCEqHNBI+afAsQfH8ga4ziKwv6dMs7TpaKnqLBYnx3mO1Kmkb76PW7I4nHp
         zTYmmE0IV6+5AUD6cMBbhksIlq29dbZUxDj36O2JK9+DFGax2INM4cuyGR/ddy4VkTs8
         0+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSzSSykdSUMY4z4QifNhRv3KUDv6uVGdlzhODRpQKlU=;
        b=J54zfXiP3OtLZ2JLLS/9uAoZQG2gQeUedHuEh+TFY7mN+lL9On+6PvqT4mjUZwxeGa
         kgNgrN18SyDrpW5QGjINbWDt/x1fFZ4pNavEZyCXIgyrTjd8zVyR2nNe4sqXnvCK2e3O
         5+pi4G8pVejuE2KKqd4X5afYNNG3u/KDL62bZ13TvIpXS473PmibxA5lXO8gfZLV1yh3
         VtvxS9XeqGjT2fy0IKMyeTifHnRlYxdS+fGRqs56KZ9T9brz2xscKIVMe+zMRMAoFnQp
         bWCY6OpKfn85wis2ya6KZ/dJdXM+Ha8MiA+q3DJx6pUWu91iLlZsYGYqR2mWOO0GEzLB
         TPMA==
X-Gm-Message-State: ACrzQf0wL1OSHTRsDfFmR0bFXcScswxDmtw7XNqRCOe5w9ReNETkuf4V
	0oG08l0ITXtSPnzCrGhZMl2KSiWrST/WknclJo8dgw==
X-Google-Smtp-Source: AMsMyM7D2DoscbPAWYNYytpiXrSBqYxlapsLxGuKk8BIHT4WrARNfmGmCFDOprFU5TU26yMJOep8BKHwirYzuxZh2l8=
X-Received: by 2002:a17:906:dac8:b0:741:545b:796a with SMTP id
 xi8-20020a170906dac800b00741545b796amr45641186ejb.240.1667790817058; Sun, 06
 Nov 2022 19:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com> <20221102231911.3107438-28-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-28-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Nov 2022 08:43:25 +0530
Message-ID: <CAAhSdy0NME71v2QMBWG-OFn1LLvGVZ=Gvadfiw70+OpZ2uLdPQ@mail.gmail.com>
Subject: Re: [PATCH 27/44] KVM: Drop kvm_arch_{init,exit}() hooks
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

On Thu, Nov 3, 2022 at 4:50 AM Sean Christopherson <seanjc@google.com> wrote:
>
> Drop kvm_arch_init() and kvm_arch_exit() now that all implementations
> are nops.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/arm64/kvm/arm.c                | 11 -----------
>  arch/mips/kvm/mips.c                | 10 ----------
>  arch/powerpc/include/asm/kvm_host.h |  1 -
>  arch/powerpc/kvm/powerpc.c          |  5 -----
>  arch/riscv/kvm/main.c               |  9 ---------
>  arch/s390/kvm/kvm-s390.c            | 10 ----------
>  arch/x86/kvm/x86.c                  | 10 ----------
>  include/linux/kvm_host.h            |  3 ---
>  virt/kvm/kvm_main.c                 | 19 ++-----------------
>  9 files changed, 2 insertions(+), 76 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 6e0061eac627..75c5125b0dd3 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2284,17 +2284,6 @@ static __init int kvm_arm_init(void)
>         return err;
>  }
>
> -int kvm_arch_init(void *opaque)
> -{
> -       return 0;
> -}
> -
> -/* NOP: Compiling as a module not supported */
> -void kvm_arch_exit(void)
> -{
> -
> -}
> -
>  static int __init early_kvm_mode_cfg(char *arg)
>  {
>         if (!arg)
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index ae7a24342fdf..3cade648827a 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -1010,16 +1010,6 @@ long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>         return r;
>  }
>
> -int kvm_arch_init(void *opaque)
> -{
> -       return 0;
> -}
> -
> -void kvm_arch_exit(void)
> -{
> -
> -}
> -
>  int kvm_arch_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu,
>                                   struct kvm_sregs *sregs)
>  {
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 5d2c3a487e73..0a80e80c7b9e 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -881,7 +881,6 @@ static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
> -static inline void kvm_arch_exit(void) {}
>  static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 36c27381a769..34278042ad27 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -2525,11 +2525,6 @@ void kvmppc_init_lpid(unsigned long nr_lpids_param)
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_init_lpid);
>
> -int kvm_arch_init(void *opaque)
> -{
> -       return 0;
> -}
> -
>  EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_ppc_instr);
>
>  void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index cb063b8a9a0f..4710a6751687 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -65,15 +65,6 @@ void kvm_arch_hardware_disable(void)
>         csr_write(CSR_HIDELEG, 0);
>  }
>
> -int kvm_arch_init(void *opaque)
> -{
> -       return 0;
> -}
> -
> -void kvm_arch_exit(void)
> -{
> -}
> -
>  static int __init riscv_kvm_init(void)
>  {
>         const char *str;
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index f6ae845bc1c1..7c1c6d81b5d7 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -533,16 +533,6 @@ static void __kvm_s390_exit(void)
>         debug_unregister(kvm_s390_dbf_uv);
>  }
>
> -int kvm_arch_init(void *opaque)
> -{
> -       return 0;
> -}
> -
> -void kvm_arch_exit(void)
> -{
> -
> -}
> -
>  /* Section: device related */
>  long kvm_arch_dev_ioctl(struct file *filp,
>                         unsigned int ioctl, unsigned long arg)
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 218707597bea..2b4530a33298 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9271,16 +9271,6 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
>         kvm_pmu_ops_update(ops->pmu_ops);
>  }
>
> -int kvm_arch_init(void *opaque)
> -{
> -       return 0;
> -}
> -
> -void kvm_arch_exit(void)
> -{
> -
> -}
> -
>  static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
>  {
>         u64 host_pat;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 9b52bd40be56..6c2a28c4c684 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1423,9 +1423,6 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
>                                         struct kvm_guest_debug *dbg);
>  int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
>
> -int kvm_arch_init(void *opaque);
> -void kvm_arch_exit(void);
> -
>  void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu);
>
>  void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 27ce263a80e4..17c852cb6842 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5833,20 +5833,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>         int r;
>         int cpu;
>
> -       /*
> -        * FIXME: Get rid of kvm_arch_init(), vendor code should call arch code
> -        * directly.  Note, kvm_arch_init() _must_ be called before anything
> -        * else as x86 relies on checks buried in kvm_arch_init() to guard
> -        * against multiple calls to kvm_init().
> -        */
> -       r = kvm_arch_init(opaque);
> -       if (r)
> -               return r;
> -
> -       if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
> -               r = -ENOMEM;
> -               goto err_hw_enabled;
> -       }
> +       if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL))
> +               return -ENOMEM;
>
>         c.ret = &r;
>         c.opaque = opaque;
> @@ -5934,8 +5922,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>         cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
>  out_free_2:
>         free_cpumask_var(cpus_hardware_enabled);
> -err_hw_enabled:
> -       kvm_arch_exit();
>         return r;
>  }
>  EXPORT_SYMBOL_GPL(kvm_init);
> @@ -5963,7 +5949,6 @@ void kvm_exit(void)
>         on_each_cpu(hardware_disable_nolock, NULL, 1);
>         kvm_irqfd_exit();
>         free_cpumask_var(cpus_hardware_enabled);
> -       kvm_arch_exit();
>  }
>  EXPORT_SYMBOL_GPL(kvm_exit);
>
> --
> 2.38.1.431.g37b22c650d-goog
>
