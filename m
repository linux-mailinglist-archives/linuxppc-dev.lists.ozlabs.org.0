Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3A74B7E79
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 04:26:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz3KR1BGLz3cVC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:26:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=riYhJ/NF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=brainfault.org
 (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=anup@brainfault.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=brainfault-org.20210112.gappssmtp.com
 header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=riYhJ/NF; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz3Jn1sp0z30R0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 14:26:15 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id n8so405533wms.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 19:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jwhFIm2pjxqH4S1QMmhp69WD0Yx/q3G7DzS41sze+Fs=;
 b=riYhJ/NFDeUTP+27duj6KaHVTshaiOQWoiNe0wD5HsocnEG4P2zjeu1WJJDyF+7tg8
 HCeN+YgLtAuAqFdXC5u5r4J1kreE47Ve+t4e9Tzc3e/bR6dW6cfCEx+AULlAjs0UFA7b
 5iYtqizK/2DbwQ3MdQzFC5ShahlfHXfxfbRTyv3sjEKEHhbO96isAQ/oJlBBafJ4RfO6
 Ik2sa+YCrQVXyZRleWwPOmZS9xfiQMBjan/DE793V7AulbEAwpf909pO0yRuMLybh51Z
 HNPSzg49iXmvLcs5NFrZBcGz1w3jwq6ATwFOagq0fPdiZtS5k3qPuXa39lc6+Ewfq3Uz
 nhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jwhFIm2pjxqH4S1QMmhp69WD0Yx/q3G7DzS41sze+Fs=;
 b=qVNAnvMUSLhDJwY1bjdxpyoa02nIZgerdcR0SqgyApOmTNW5I0lZQCmRJ5AT9k3kkk
 TnFSk6EOEyt0q9ZA7kiKhmjhDkG/QwkwOCUBMxNHqqokTqBpGlQh0UHHJXvTyHYtS13A
 lGmQ92CJoExV+3Z5iC7w8fcmOBc9I1aTX8qOnvzw1idNih81Z8sYVADoif32iG7Ue01U
 sXvVnlOLzOGVX9W82bru87PSEo8Dy7vHyZs4LFPdb3Sh2oBfuJXBn5PlrHIM/ipsmI0o
 zu5wQKaKUsc6lxobKmDzo04KKjFYNFkbGNa5l7iWVTCRzEtmZb5d83hh9lvPNbj55t+F
 eDyw==
X-Gm-Message-State: AOAM5319T8pJiPK0vVkL67tyLDKbwtz3fCxFWIseuQAorOtYltj4nMAX
 xivSeIQjFVDi/YOyOrST2iTlVRNnConZC3KZCVuYjA==
X-Google-Smtp-Source: ABdhPJyRrOhHG9NugLem/Yuo2TIr9R5jqud/r7I7SljQVLpVr4bWltjwldVI0/2cSoJTehq0BS93uj6Y8dpcZ9dYSY0=
X-Received: by 2002:a7b:cf16:0:b0:37b:c4c9:96c6 with SMTP id
 l22-20020a7bcf16000000b0037bc4c996c6mr683144wmg.59.1644981969162; Tue, 15 Feb
 2022 19:26:09 -0800 (PST)
MIME-Version: 1.0
References: <20220216031528.92558-1-chao.gao@intel.com>
 <20220216031528.92558-3-chao.gao@intel.com>
In-Reply-To: <20220216031528.92558-3-chao.gao@intel.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Feb 2022 08:55:55 +0530
Message-ID: <CAAhSdy0PfCegu9vQY76pD-cLfP_S1xnyWARdinG4jbuJ_eVQkg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] Partially revert "KVM: Pass kvm_init()'s opaque
 param to additional arch funcs"
To: Chao Gao <chao.gao@intel.com>
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
Cc: x86@kernel.org, Wanpeng Li <wanpengli@tencent.com>,
 KVM General <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, kvmarm@lists.cs.columbia.edu,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, kevin.tian@intel.com,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Atish Patra <atishp@atishpatra.org>, Thomas Gleixner <tglx@linutronix.de>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jim Mattson <jmattson@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sean Christopherson <seanjc@google.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Bharata B Rao <bharata@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Sven Schnelle <svens@linux.ibm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 16, 2022 at 8:46 AM Chao Gao <chao.gao@intel.com> wrote:
>
> This partially reverts commit b99040853738 ("KVM: Pass kvm_init()'s opaque
> param to additional arch funcs") remove opaque from
> kvm_arch_check_processor_compat because no one uses this opaque now.
> Address conflicts for ARM (due to file movement) and manually handle RISC-V
> which comes after the commit.
>
> And changes about kvm_arch_hardware_setup() in original commit are still
> needed so they are not reverted.
>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  arch/arm64/kvm/arm.c       |  2 +-
>  arch/mips/kvm/mips.c       |  2 +-
>  arch/powerpc/kvm/powerpc.c |  2 +-
>  arch/riscv/kvm/main.c      |  2 +-
>  arch/s390/kvm/kvm-s390.c   |  2 +-
>  arch/x86/kvm/x86.c         |  2 +-
>  include/linux/kvm_host.h   |  2 +-
>  virt/kvm/kvm_main.c        | 16 +++-------------
>  8 files changed, 10 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index ecc5958e27fe..0165cf3aac3a 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -73,7 +73,7 @@ int kvm_arch_hardware_setup(void *opaque)
>         return 0;
>  }
>
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>         return 0;
>  }
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a25e0b73ee70..092d09fb6a7e 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -140,7 +140,7 @@ int kvm_arch_hardware_setup(void *opaque)
>         return 0;
>  }
>
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>         return 0;
>  }
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 2ad0ccd202d5..30c817f3fa0c 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -423,7 +423,7 @@ int kvm_arch_hardware_setup(void *opaque)
>         return 0;
>  }
>
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>         return kvmppc_core_check_processor_compat();
>  }
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 2e5ca43c8c49..992877e78393 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -20,7 +20,7 @@ long kvm_arch_dev_ioctl(struct file *filp,
>         return -EINVAL;
>  }
>
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>         return 0;
>  }
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 577f1ead6a51..0053b81c6b02 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -252,7 +252,7 @@ int kvm_arch_hardware_enable(void)
>         return 0;
>  }
>
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>         return 0;
>  }
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 9b484ed61f37..ffb88f0b7265 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -11509,7 +11509,7 @@ void kvm_arch_hardware_unsetup(void)
>         static_call(kvm_x86_hardware_unsetup)();
>  }
>
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>         struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f11039944c08..2ad78e729bf7 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1413,7 +1413,7 @@ int kvm_arch_hardware_enable(void);
>  void kvm_arch_hardware_disable(void);
>  int kvm_arch_hardware_setup(void *opaque);
>  void kvm_arch_hardware_unsetup(void);
> -int kvm_arch_check_processor_compat(void *opaque);
> +int kvm_arch_check_processor_compat(void);
>  int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
>  bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
>  int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 83c57bcc6eb6..ee47d33d69e1 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5643,22 +5643,14 @@ void kvm_unregister_perf_callbacks(void)
>  }
>  #endif
>
> -struct kvm_cpu_compat_check {
> -       void *opaque;
> -       int *ret;
> -};
> -
> -static void check_processor_compat(void *data)
> +static void check_processor_compat(void *rtn)
>  {
> -       struct kvm_cpu_compat_check *c = data;
> -
> -       *c->ret = kvm_arch_check_processor_compat(c->opaque);
> +       *(int *)rtn = kvm_arch_check_processor_compat();
>  }
>
>  int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>                   struct module *module)
>  {
> -       struct kvm_cpu_compat_check c;
>         int r;
>         int cpu;
>
> @@ -5686,10 +5678,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>         if (r < 0)
>                 goto out_free_1;
>
> -       c.ret = &r;
> -       c.opaque = opaque;
>         for_each_online_cpu(cpu) {
> -               smp_call_function_single(cpu, check_processor_compat, &c, 1);
> +               smp_call_function_single(cpu, check_processor_compat, &r, 1);
>                 if (r < 0)
>                         goto out_free_2;
>         }
> --
> 2.25.1
>
