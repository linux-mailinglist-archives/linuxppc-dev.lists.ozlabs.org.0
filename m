Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483861E8E8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 04:11:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5GTc2m38z3cd2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 14:11:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=gQpUBAHa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=anup@brainfault.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=gQpUBAHa;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5GSk28Rvz2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 14:10:29 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id ud5so26768165ejc.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Nov 2022 19:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H1pcoCub6KdV/gUz+piTr4fdj2mnlqaFRmHq36k4mN4=;
        b=gQpUBAHaNtCtn8GOZM6K3nOKU9i/513DHG6kPmdKabejoExXLL0yKmZoHWD5IqrYnl
         BaH7/MlZuQ3cd3geild3XN0vIjfsuogd3DRyazx76rKFD1GxN2z2p5a1MMzxdPc3wvTw
         RxZD99Kfh6hz1mjWaldEvMgnh1z6ZDZqqXsSWsYVIgeKGUPakiXDa4BTKTMvzBMhceI0
         p+2o9fYelNd1OGlcY0c89OLh4mpaR3Ph8Z8pNTcesJ5e6yXb/WhpmYapUPDUZmdETGBa
         YNDaSceGSYjG/bGEYOqsAJz81Hj8vvE+0OhEFfMoxQFcd4iiMCUDxLdOXI4/qhCe4BWK
         wETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1pcoCub6KdV/gUz+piTr4fdj2mnlqaFRmHq36k4mN4=;
        b=FVGPL6xrRUAFneJAtDKp31xW4cf1u2EM2StbMUC+u/8ZkmZXi1nSnS4iKeEoUzFs4x
         WKaLC0zd0KCTqyRpGZgT0YGCL1P8iQVCTDIaEk4q7NyQoKP8AKGONT8KE43s0uaj15Cu
         rRQyL6Om7N1XT9wzl2GbfdpQuHtGHeRBmsR8C5OUGiuQgaNmjl8E30/H7xEN2jiv6oQ7
         a7S4bLH7+XFBo1Pg8iMhV6xlUictEPECFz+cPYZVV1s/lCId4+UcAC503qFNMEiExgFZ
         5qFZU6Ml0/fIixy0NgY2Wxm/MgykaoyifwP2GZm/tsGcMvgBFqonOvH13Ru/nfyCrXIb
         jwoA==
X-Gm-Message-State: ACrzQf12gDCvu9h8FfFW9dTtf6//a7OUFZwCmK/Uf36U2fttw1UvwuIV
	fvDfZiYMACZPKTAsftTSNR0/8Qc7Y7JBur+NbSACfA==
X-Google-Smtp-Source: AMsMyM7XCgJtPlnLGfYx3eSoncGi1AE82N9qaj+trfvM6WmHPWkeWUQhOX2da2jCOnZnugZUPvknpt/SuEsv4imbUmY=
X-Received: by 2002:a17:906:eec7:b0:733:189f:b07a with SMTP id
 wu7-20020a170906eec700b00733189fb07amr46196816ejb.230.1667790626379; Sun, 06
 Nov 2022 19:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com> <20221102231911.3107438-24-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-24-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Nov 2022 08:40:14 +0530
Message-ID: <CAAhSdy1XSv+yNHyhPf44H3f7oaz+7Ku6COkKAQt7Zy7ahdC7jA@mail.gmail.com>
Subject: Re: [PATCH 23/44] KVM: RISC-V: Tag init functions and data with
 __init, __ro_after_init
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
> Now that KVM setup is handled directly in riscv_kvm_init(), tag functions
> and data that are used/set only during init with __init/__ro_after_init.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_host.h |  6 +++---
>  arch/riscv/kvm/mmu.c              | 12 ++++++------
>  arch/riscv/kvm/vmid.c             |  4 ++--
>  3 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 8c771fc4f5d2..778ff0f282b7 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -295,11 +295,11 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
>  void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
>  void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
> -void kvm_riscv_gstage_mode_detect(void);
> -unsigned long kvm_riscv_gstage_mode(void);
> +void __init kvm_riscv_gstage_mode_detect(void);
> +unsigned long __init kvm_riscv_gstage_mode(void);
>  int kvm_riscv_gstage_gpa_bits(void);
>
> -void kvm_riscv_gstage_vmid_detect(void);
> +void __init kvm_riscv_gstage_vmid_detect(void);
>  unsigned long kvm_riscv_gstage_vmid_bits(void);
>  int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
>  bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 3620ecac2fa1..f42a34c7879a 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -20,12 +20,12 @@
>  #include <asm/pgtable.h>
>
>  #ifdef CONFIG_64BIT
> -static unsigned long gstage_mode = (HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
> -static unsigned long gstage_pgd_levels = 3;
> +static unsigned long gstage_mode __ro_after_init = (HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
> +static unsigned long gstage_pgd_levels __ro_after_init = 3;
>  #define gstage_index_bits      9
>  #else
> -static unsigned long gstage_mode = (HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
> -static unsigned long gstage_pgd_levels = 2;
> +static unsigned long gstage_mode __ro_after_init = (HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
> +static unsigned long gstage_pgd_levels __ro_after_init = 2;
>  #define gstage_index_bits      10
>  #endif
>
> @@ -760,7 +760,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
>                 kvm_riscv_local_hfence_gvma_all();
>  }
>
> -void kvm_riscv_gstage_mode_detect(void)
> +void __init kvm_riscv_gstage_mode_detect(void)
>  {
>  #ifdef CONFIG_64BIT
>         /* Try Sv57x4 G-stage mode */
> @@ -784,7 +784,7 @@ void kvm_riscv_gstage_mode_detect(void)
>  #endif
>  }
>
> -unsigned long kvm_riscv_gstage_mode(void)
> +unsigned long __init kvm_riscv_gstage_mode(void)
>  {
>         return gstage_mode >> HGATP_MODE_SHIFT;
>  }
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index 6cd93995fb65..5246da1c9167 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -17,10 +17,10 @@
>
>  static unsigned long vmid_version = 1;
>  static unsigned long vmid_next;
> -static unsigned long vmid_bits;
> +static unsigned long vmid_bits __ro_after_init;
>  static DEFINE_SPINLOCK(vmid_lock);
>
> -void kvm_riscv_gstage_vmid_detect(void)
> +void __init kvm_riscv_gstage_vmid_detect(void)
>  {
>         unsigned long old;
>
> --
> 2.38.1.431.g37b22c650d-goog
>
