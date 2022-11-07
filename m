Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABA461E8D5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 04:06:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5GMf6thxz3cLp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 14:06:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=O2GdYT7c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=anup@brainfault.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=O2GdYT7c;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5GLl1S5Lz3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 14:05:19 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id b2so26704617eja.6
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Nov 2022 19:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YDkpvmLdCcNS/SK5D2IL8ltTmU7MAjuwj9on9XdxjqM=;
        b=O2GdYT7cMyZAwXXzVaGGer2516sCwb8nVa+3zH1uKyisQxoW9HAvhvHCOOJeufiTbl
         F3Np7E0Q60MoiXXzv7QKKfVpPuct8EOqbYhrz0wkX1SdRI+8oB73JExLBlUhlEORndI0
         oR5Ci6Q9Zji0dGkOeDy61S11yj8qgzFtdaxDEMNt1vXTTwBDofXJXEd/zzO2opd/NDJm
         j1f/gZ4KRV3uPIBqcQXujsk4akPpTe+2a2n4m0j+UpZ//j9kycunMnHpdO3L/Ji7eqnQ
         U523Q+8cijpVSXguZZnGJMRJTHTEr5k6EgUTEZqzTJSespExVQpXPGZ+H7/pFHIEuIGk
         PlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDkpvmLdCcNS/SK5D2IL8ltTmU7MAjuwj9on9XdxjqM=;
        b=RO5x1HaTfAquo0Q1EjQq0OMnA7cUNscju9k3+R5haSMqA7Bvl8A93TxQvkxvx08VR4
         +ITjjXhrdF17gtxYSAeDvGLpfJ9U6IkF79sn5zWfTOs2uB7MYwZ2L+XfJ46VFll1R04p
         OeiMF7Gt/y3or+ebDglzK2bdyjfyL1wJiL2IiJBkS0CPrTd4PoChAzRFS61kr0PFLvxl
         AZfiFExKmMcnyejDOR7J7b0qgJBajFgELLWKi7zN2cwTKcqZLj+vYs5GONcbehl31xZ1
         o9HsnaB8J5nWiYNOirTh0abpXdpGv+o6WL4mPCeNDpBMPBFDzdpPd6Oq8EypbVJ2ALne
         5wQA==
X-Gm-Message-State: ACrzQf0rlXQhYWAcSVy1E8f4pfsGGU7jKl6mNaJgfK8e9PI1hD/hJ5Mg
	oVYTFZQDWqyTnhXfoAReiAmlpYHMANEklslbjsH/Uw==
X-Google-Smtp-Source: AMsMyM525hQagKYMIlOIdqQEy/Sx/ht089FGqr8YQw810BAnhG6hulq/sfu3BFpHCBMEkVy5m+xwSwFEwA0SvamrVJs=
X-Received: by 2002:a17:906:eec7:b0:733:189f:b07a with SMTP id
 wu7-20020a170906eec700b00733189fb07amr46182007ejb.230.1667790314965; Sun, 06
 Nov 2022 19:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com> <20221102231911.3107438-23-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-23-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Nov 2022 08:35:03 +0530
Message-ID: <CAAhSdy01NfFuHCsA1mrcxERL+=8F=PQbD_Nu7qvdKQOyQ_p9Tw@mail.gmail.com>
Subject: Re: [PATCH 22/44] KVM: RISC-V: Do arch init directly in riscv_kvm_init()
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
> Fold the guts of kvm_arch_init() into riscv_kvm_init() instead of
> bouncing through kvm_init()=>kvm_arch_init().  Functionally, this is a
> glorified nop as invoking kvm_arch_init() is the very first action
> performed by kvm_init().
>
> Moving setup to riscv_kvm_init(), which is tagged __init, will allow
> tagging more functions and data with __init and __ro_after_init.  And
> emptying kvm_arch_init() will allow dropping the hook entirely once all
> architecture implementations are nops.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/main.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index a146fa0ce4d2..cb063b8a9a0f 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -66,6 +66,15 @@ void kvm_arch_hardware_disable(void)
>  }
>
>  int kvm_arch_init(void *opaque)
> +{
> +       return 0;
> +}
> +
> +void kvm_arch_exit(void)
> +{
> +}
> +
> +static int __init riscv_kvm_init(void)
>  {
>         const char *str;
>
> @@ -110,15 +119,6 @@ int kvm_arch_init(void *opaque)
>
>         kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
>
> -       return 0;
> -}
> -
> -void kvm_arch_exit(void)
> -{
> -}
> -
> -static int __init riscv_kvm_init(void)
> -{
>         return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
>  }
>  module_init(riscv_kvm_init);
> --
> 2.38.1.431.g37b22c650d-goog
>
