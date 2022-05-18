Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 961C352B24E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 08:28:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L332y3Pm7z3c8G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 16:28:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rU4jPYNN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=rU4jPYNN; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L332J4Q92z3bb0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 16:27:49 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id ev18so1059218pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 23:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=75xfyRYdtbbnySXqxmJnPbT1F8O/OC516UJoNDb3t+I=;
 b=rU4jPYNN5+avyZvAhBPhq7YZ6GjdV3WB7hpSv3vUe8rapXH3vJwLu4MUdpNlxV7Vc7
 AV8lrXHmL8UpJxDY3siQzlIi1kvlEXBUds9/aloM3MCUVjIMrI4iBAGYA3gy0JSQINos
 J2NLdYng7g+nuuokCoIgmaPM+rIZ4qqyHTrVrqikCReYskpXMfmVSw50Tuf7ydEKBM2g
 PUMz0bT1ksqn8xtF4/6i6km4yBy40ueQ2nK1Qg8YPCIwQ/sBVS9ZuWg1r+69cmGh3Cvg
 9pioG246hcisDKCTphyRZWV73OSMQekwe7OZpLnVyClkygpRM+XSdD6zw+4AQbzOaROG
 Zvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=75xfyRYdtbbnySXqxmJnPbT1F8O/OC516UJoNDb3t+I=;
 b=ay8Y2f6Rl0qVvprukZtlxKbbFVUqvysMHMnJ+WIKxXAPx4hFPFg11oXhf0dYqj0bbe
 yHwpfpR+dbvHYzcN0fARpLo1390XOr25iLo6oirjAICrtg8aEhSh67dvo5clZDTH+pU7
 aaEUDI7Xf9xKTy2hs2ApBxwXRhnAuDeFgw7oh1q1J/yBg0TJw75Nm9Fd9xPC+ZE1+W4Y
 5c22HKaSo4DzsjrM61M5UzM5CVSv7aKrvyYpZQNzyPmgHFVPqef5oHDgd0n1MxygqyHv
 7TuakwKPLcLZVqyrhHIGqf3x0g4u+7q9svR0T/69APkr5Z4XhjCzqBCleOS148Msltqe
 vP/g==
X-Gm-Message-State: AOAM533fwNDwu5s9HEOdX6+9RDM2K3X/T31KOjPSgNHOWfJbBHmR3pez
 XWSMwCZsiqN5p6UakwuFgPYPIg==
X-Google-Smtp-Source: ABdhPJw8YU30pDANG+wArZ1ct34zmOOlVc4nOxwpHMfezBscu5qQRFfree+bbOiz/rSK3BWzuNhG2w==
X-Received: by 2002:a17:90b:4f87:b0:1dd:100b:7342 with SMTP id
 qe7-20020a17090b4f8700b001dd100b7342mr39908296pjb.64.1652855267956; 
 Tue, 17 May 2022 23:27:47 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 g3-20020a62f943000000b0050dc762815dsm895132pfm.55.2022.05.17.23.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 23:27:47 -0700 (PDT)
Message-ID: <0d4bb0fa-10c6-3f5a-34c8-293144b3fdbb@ozlabs.ru>
Date: Wed, 18 May 2022 16:27:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH kernel] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE platform
 dependent
Content-Language: en-US
To: kvm-ppc@vger.kernel.org
References: <20220504074807.3616813-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220504074807.3616813-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 Fabiano Rosas <farosas@linux.ibm.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, kvm-riscv@lists.infradead.org,
 Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/4/22 17:48, Alexey Kardashevskiy wrote:
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


Ping?

> 
> ---
>   arch/arm64/kvm/arm.c       | 3 +++
>   arch/mips/kvm/mips.c       | 3 +++
>   arch/powerpc/kvm/powerpc.c | 6 ++++++
>   arch/riscv/kvm/vm.c        | 3 +++
>   arch/s390/kvm/kvm-s390.c   | 3 +++
>   arch/x86/kvm/x86.c         | 3 +++
>   virt/kvm/kvm_main.c        | 1 -
>   7 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 523bc934fe2f..092f0614bae3 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -210,6 +210,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_SET_GUEST_DEBUG:
>   	case KVM_CAP_VCPU_ATTRIBUTES:
>   	case KVM_CAP_PTP_KVM:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +	case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>   		r = 1;
>   		break;
>   	case KVM_CAP_SET_GUEST_DEBUG2:
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a25e0b73ee70..0f3de470a73e 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -1071,6 +1071,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_READONLY_MEM:
>   	case KVM_CAP_SYNC_MMU:
>   	case KVM_CAP_IMMEDIATE_EXIT:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +	case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>   		r = 1;
>   		break;
>   	case KVM_CAP_NR_VCPUS:
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 875c30c12db0..87698ffef3be 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -591,6 +591,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   		break;
>   #endif
>   
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +	case KVM_CAP_IRQFD_RESAMPLE:
> +		r = !xive_enabled();
> +		break;
> +#endif
> +
>   	case KVM_CAP_PPC_ALLOC_HTAB:
>   		r = hv_enabled;
>   		break;
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index c768f75279ef..b58579b386bb 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -63,6 +63,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_READONLY_MEM:
>   	case KVM_CAP_MP_STATE:
>   	case KVM_CAP_IMMEDIATE_EXIT:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +	case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>   		r = 1;
>   		break;
>   	case KVM_CAP_NR_VCPUS:
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 156d1c25a3c1..85e093fc8d13 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -564,6 +564,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_SET_GUEST_DEBUG:
>   	case KVM_CAP_S390_DIAG318:
>   	case KVM_CAP_S390_MEM_OP_EXTENSION:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +	case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>   		r = 1;
>   		break;
>   	case KVM_CAP_SET_GUEST_DEBUG2:
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 0c0ca599a353..a0a7b769483d 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -4273,6 +4273,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_SYS_ATTRIBUTES:
>   	case KVM_CAP_VAPIC:
>   	case KVM_CAP_ENABLE_CAP:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +	case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>   		r = 1;
>   		break;
>   	case KVM_CAP_EXIT_HYPERCALL:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 70e05af5ebea..885e72e668a5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4293,7 +4293,6 @@ static long kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>   #endif
>   #ifdef CONFIG_HAVE_KVM_IRQFD
>   	case KVM_CAP_IRQFD:
> -	case KVM_CAP_IRQFD_RESAMPLE:
>   #endif
>   	case KVM_CAP_IOEVENTFD_ANY_LENGTH:
>   	case KVM_CAP_CHECK_EXTENSION_VM:

-- 
Alexey
