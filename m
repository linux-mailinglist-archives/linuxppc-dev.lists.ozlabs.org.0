Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 525945BA642
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:08:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTMYC1p3Jz3c6t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:08:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=yAWumhze;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=anup@brainfault.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=yAWumhze;
	dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTMXX0Pl8z2xrH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:08:09 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id x13so1388125ilp.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 22:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yP5XHXLcK+UX9e2N5YzbTl9a4h8ihKkfwEUan36DPrg=;
        b=yAWumhzewMa3eEP3CnaMNUvAKmgC8eanQ3L4jWiwdGCcIzPkhFrQzQw0wwV9+O9C/s
         pWA8px3RR32jSQRkZ724RUliMw1N1pJV7uypHBZtXw/s45KvAkUFFBkjDay0fezO6Q1H
         n/OjWEaMaEvHTgl1WjFIQhvNgjxtHZeYZXfVlqejl77Y0na9OV31a8qO4TRydLDh9b1J
         NF1Fubd/swhKTWFgEXpw3HK96R4pCPPNOYmiQOe7Bp9RLaM6/LZ/umsF8xY1IvG5Kb40
         CBEv7FTQftTVcumiWuAZRwOn7ym/68hjz6J2lRqkwYLZ2FbLbPgjYRH/Tm0ZHhOzbqfn
         INxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yP5XHXLcK+UX9e2N5YzbTl9a4h8ihKkfwEUan36DPrg=;
        b=Tw4G9UtCeCt+AUKJhudF5AnC01/hnxUfo5tR7G1WjvtqTDAE/UXr3n9MPwAPsuQqRL
         MWuBaOpUxjA6CE6+Sdh5uQnfLaSbAdS3M9muCPfvCyDjWB09jzyxiN3iKJSuXGYEKcTG
         myRp4eAi7tdiYg/Ww66kdWhzHRXs+eMNOO75Wsf4bMkakdTgX55bPSfuQfCRImQV48Sq
         rRbutASL4GCbuZbTI6w87R1mwYH2M2hhUrq5zjLJ2VjUEVG37pAAbs+jW0k/weoHglC7
         KaCznAZ8jI/XTzsYemvsV6NihUi0hJccY0l3hXEsyTgqNzbupYhOWCay7vw7bHwTxnOQ
         90VQ==
X-Gm-Message-State: ACrzQf0S5PRIBksflkvFCBPskU3J/nftyN5e7tS4jhVNFBKdz0v2y/nA
	fyGCVQyerqHOQDxa5TDMX3rfFizqE6+oc4IrRLU/qw==
X-Google-Smtp-Source: AMsMyM5GqgO04FmX/wur2Jt+8ypcoEU8eotcYd1jKm89jw9hQAj1ZhLfSUj5pD6zTUMTtw3xNbjyMSejcFd/JFYW8jo=
X-Received: by 2002:a05:6e02:164d:b0:2f1:869c:c45b with SMTP id
 v13-20020a056e02164d00b002f1869cc45bmr1488365ilu.212.1663304885797; Thu, 15
 Sep 2022 22:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220504074807.3616813-1-aik@ozlabs.ru>
In-Reply-To: <20220504074807.3616813-1-aik@ozlabs.ru>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Sep 2022 10:37:53 +0530
Message-ID: <CAAhSdy0hxHjQkVj8TLPh4j=vBrX1QoZcJXNeRBPtf5ozdjQaTQ@mail.gmail.com>
Subject: Re: [PATCH kernel] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE platform dependent
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 4, 2022 at 1:18 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> When introduced, IRQFD resampling worked on POWER8 with XICS. However
> KVM on POWER9 has never implemented it - the compatibility mode code
> ("XICS-on-XIVE") misses the kvm_notify_acked_irq() call and the native
> XIVE mode does not handle INTx in KVM at all.
>
> This moved the capability support advertising to platforms and stops
> advertising it on XIVE, i.e. POWER9 and later.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>
>
> Or I could move this one together with KVM_CAP_IRQFD. Thoughts?

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

>
> ---
>  arch/arm64/kvm/arm.c       | 3 +++
>  arch/mips/kvm/mips.c       | 3 +++
>  arch/powerpc/kvm/powerpc.c | 6 ++++++
>  arch/riscv/kvm/vm.c        | 3 +++
>  arch/s390/kvm/kvm-s390.c   | 3 +++
>  arch/x86/kvm/x86.c         | 3 +++
>  virt/kvm/kvm_main.c        | 1 -
>  7 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 523bc934fe2f..092f0614bae3 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -210,6 +210,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_SET_GUEST_DEBUG:
>         case KVM_CAP_VCPU_ATTRIBUTES:
>         case KVM_CAP_PTP_KVM:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +       case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>                 r = 1;
>                 break;
>         case KVM_CAP_SET_GUEST_DEBUG2:
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a25e0b73ee70..0f3de470a73e 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -1071,6 +1071,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_READONLY_MEM:
>         case KVM_CAP_SYNC_MMU:
>         case KVM_CAP_IMMEDIATE_EXIT:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +       case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>                 r = 1;
>                 break;
>         case KVM_CAP_NR_VCPUS:
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 875c30c12db0..87698ffef3be 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -591,6 +591,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>                 break;
>  #endif
>
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +       case KVM_CAP_IRQFD_RESAMPLE:
> +               r = !xive_enabled();
> +               break;
> +#endif
> +
>         case KVM_CAP_PPC_ALLOC_HTAB:
>                 r = hv_enabled;
>                 break;
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index c768f75279ef..b58579b386bb 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -63,6 +63,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_READONLY_MEM:
>         case KVM_CAP_MP_STATE:
>         case KVM_CAP_IMMEDIATE_EXIT:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +       case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>                 r = 1;
>                 break;
>         case KVM_CAP_NR_VCPUS:
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 156d1c25a3c1..85e093fc8d13 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -564,6 +564,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_SET_GUEST_DEBUG:
>         case KVM_CAP_S390_DIAG318:
>         case KVM_CAP_S390_MEM_OP_EXTENSION:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +       case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>                 r = 1;
>                 break;
>         case KVM_CAP_SET_GUEST_DEBUG2:
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 0c0ca599a353..a0a7b769483d 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -4273,6 +4273,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_SYS_ATTRIBUTES:
>         case KVM_CAP_VAPIC:
>         case KVM_CAP_ENABLE_CAP:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +       case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>                 r = 1;
>                 break;
>         case KVM_CAP_EXIT_HYPERCALL:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 70e05af5ebea..885e72e668a5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4293,7 +4293,6 @@ static long kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>  #endif
>  #ifdef CONFIG_HAVE_KVM_IRQFD
>         case KVM_CAP_IRQFD:
> -       case KVM_CAP_IRQFD_RESAMPLE:
>  #endif
>         case KVM_CAP_IOEVENTFD_ANY_LENGTH:
>         case KVM_CAP_CHECK_EXTENSION_VM:
> --
> 2.30.2
>
