Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4F672EDC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 23:17:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=zQ7R5o0c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QghG15fCVz30fT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 07:17:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=zQ7R5o0c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3otyizaykdkkbnjwslpxxpun.lxvurwdgyyl-mneurbcb.xiujkb.xap@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QghF35Qn0z2xpy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 07:16:21 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-661fcfbafdaso3510772b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 14:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686690978; x=1689282978;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zoXsbeVfXLLEsjLQrLANrMHnuV7SIcBeWtBPaSlJE0U=;
        b=zQ7R5o0craf7u+8BFUd0XqKzaiFd07QQ12Eidv2oX82/8xpvNaNd5d3F1TCTk6N0Hu
         7fMAmHEwJDyPmDip2pmYEeWftlaTmP5dIu41ZGeOFz45S21m6tXwg30hbcF3thUzi676
         vzpD724q+62Lf8U9Gs9MKk4E/8JtwMR99WvwZB1LR98kFvEt6ayHb9QgvMry583OCgJV
         lblJoGrE/X04cAdDQliEfEc/u/0GX09ErJvgFy+LvpVV5l8d0IOk2DTITEBHELAeAkNh
         50M+uJ4OhYkQVSE9h6BW4mKFbmJK1/oUtMREUc0flhuMb3gVbi/lwRS/0faB5gRn/RtF
         ddZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686690978; x=1689282978;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zoXsbeVfXLLEsjLQrLANrMHnuV7SIcBeWtBPaSlJE0U=;
        b=JyqHWCqaxRpNT66zQuPUkbexOWp63Gew6/IW7UwTPWOr4PFdA2atNY6EIpwK1exYQc
         FbBmJ0lmt+cjwf7ERy79moIWyMxOvpIzBtzJ2oqQ7soVGrx3wqbzC1Z0p/2M32WiJuVj
         WfZ9PresHLtG1/FAin1Go2t1AqLDxUZdkXjvfiBEXN/i3yDyx6CNZaTho2O3ZWJJrHjb
         uFt02XJGNkWwJyp9EEJt46InFPQFOtp0FkWTZH0yQ8rHtFa5diaTLwZZ6N3P2rqjKjsj
         SwK4l+q3B+uYAL4jQXtYg2jtA8z2ag2W2PRAVhGuTIzAupAsar4CKo6HLuH3lx9QDXux
         ru6g==
X-Gm-Message-State: AC+VfDxhMuD83SCboqAX71WHldtf7yU1hxeO5SLSz294EoVAeGiMsTEO
	2A0JqjRd1acXqm4LQCdu6U1lSx/f67c=
X-Google-Smtp-Source: ACHHUZ7p7HWyWa7uo6JIcTCl2qEWne7t8Z1pA5sTVB2E6o4i4fbc3cAgW8yVZwQOXwCLEQAIaBcF/pXVJrY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2d1d:b0:63a:ff2a:bf9f with SMTP id
 fa29-20020a056a002d1d00b0063aff2abf9fmr9201pfb.2.1686690978636; Tue, 13 Jun
 2023 14:16:18 -0700 (PDT)
Date: Tue, 13 Jun 2023 14:16:16 -0700
In-Reply-To: <20230315101606.10636-1-wei.w.wang@intel.com>
Mime-Version: 1.0
References: <20230315101606.10636-1-wei.w.wang@intel.com>
Message-ID: <ZIjcoOaexz5YAyWT@google.com>
Subject: Re: [PATCH RESEND v2] KVM: move KVM_CAP_DEVICE_CTRL to the generic check
From: Sean Christopherson <seanjc@google.com>
To: Wei Wang <wei.w.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, pbonzini@redhat.com, linux-riscv@lists.infradead.org, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+<everyone else>

Please use scripts/get_maintainer.pl to generate the To/Cc lists.  This may be
trivial, but it still needs eyeballs from the relevant maintainers.

On Wed, Mar 15, 2023, Wei Wang wrote:
> KVM_CAP_DEVICE_CTRL allows userspace to check if the kvm_device
> framework (e.g. KVM_CREATE_DEVICE) is supported by KVM. Move
> KVM_CAP_DEVICE_CTRL to the generic check for the two reasons:
> 1) it already supports arch agnostic usages (i.e. KVM_DEV_TYPE_VFIO).
> For example, userspace VFIO implementation may needs to create
> KVM_DEV_TYPE_VFIO on x86, riscv, or arm etc. It is simpler to have it
> checked at the generic code than at each arch's code.
> 2) KVM_CREATE_DEVICE has been added to the generic code.
> 
> Link: https://lore.kernel.org/all/20221215115207.14784-1-wei.w.wang@intel.com
> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> Reviewed-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/arm64/kvm/arm.c       | 1 -
>  arch/powerpc/kvm/powerpc.c | 1 -
>  arch/riscv/kvm/vm.c        | 1 -
>  arch/s390/kvm/kvm-s390.c   | 1 -
>  virt/kvm/kvm_main.c        | 1 +
>  5 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 3bd732eaf087..96329e675771 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -202,7 +202,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		r = vgic_present;
>  		break;
>  	case KVM_CAP_IOEVENTFD:
> -	case KVM_CAP_DEVICE_CTRL:
>  	case KVM_CAP_USER_MEMORY:
>  	case KVM_CAP_SYNC_MMU:
>  	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 4c5405fc5538..185efed23896 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -526,7 +526,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_ENABLE_CAP:
>  	case KVM_CAP_ONE_REG:
>  	case KVM_CAP_IOEVENTFD:
> -	case KVM_CAP_DEVICE_CTRL:
>  	case KVM_CAP_IMMEDIATE_EXIT:
>  	case KVM_CAP_SET_GUEST_DEBUG:
>  		r = 1;
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 65a964d7e70d..6efe93b282e1 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -57,7 +57,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  
>  	switch (ext) {
>  	case KVM_CAP_IOEVENTFD:
> -	case KVM_CAP_DEVICE_CTRL:
>  	case KVM_CAP_USER_MEMORY:
>  	case KVM_CAP_SYNC_MMU:
>  	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 39b36562c043..7b097b5253ca 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -556,7 +556,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_ENABLE_CAP:
>  	case KVM_CAP_S390_CSS_SUPPORT:
>  	case KVM_CAP_IOEVENTFD:
> -	case KVM_CAP_DEVICE_CTRL:
>  	case KVM_CAP_S390_IRQCHIP:
>  	case KVM_CAP_VM_ATTRIBUTES:
>  	case KVM_CAP_MP_STATE:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index d255964ec331..71cc63640173 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4523,6 +4523,7 @@ static long kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>  #endif
>  	case KVM_CAP_BINARY_STATS_FD:
>  	case KVM_CAP_SYSTEM_EVENT_DATA:
> +	case KVM_CAP_DEVICE_CTRL:
>  		return 1;
>  	default:
>  		break;
> -- 
> 2.27.0
> 
