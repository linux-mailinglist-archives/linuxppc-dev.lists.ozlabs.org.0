Return-Path: <linuxppc-dev+bounces-5773-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB6A2520D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2025 06:43:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ymb5G4f1wz2xQD;
	Mon,  3 Feb 2025 16:43:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738561410;
	cv=none; b=mFg8QN539uPMQfIGnxLq6H8rvC31SYFN0yuLtpRzK7a0dkn2786qtymmKodpPxCw5BELcSvv/Mpwa96/Gn2EZAvCju+U5HyeHovyPS5/lUGYhssFV4S/WWMQCHkpTBYRHh0/hZ/tk/drGDkv5pa6Hm8dDhz+TJUzYlJxXFP95xi3KqPtPYSinaXYeD8FOaE2FvN9r401b/SD4PIk3a+5tKZHPC0dzh9mmpa3kHhH2lekx5HSrrSlBBTOANX5OJ9Il5FpSMnUNhI9O/hz+iiMTAOuvRk25Kg+64tqyhSlFUo08TyYvnGEZVA6SLrJsiH/KAz4hYU3uMi19LUcicKZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738561410; c=relaxed/relaxed;
	bh=Abrmc3V+wCkg7+h5ECgKA37T7F550/MzIW2BgVmGe00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ha2UZNbDGasYmGzRxJnh1NXhV7AkoCypwYo5fSjRbAfV1fHZ8g3pvUmRaVOk7T4gTC6FVeoq3ycPHsJV1XBp6ZLwBMwWpbcvYZSkj3yAJBuELL2V4F5PMXmH5pXvQMOJZcP5PJ2+hIE6400tKQOaJIZEMKdDX8B49qz94BRzfplwxOFUwRujpi3x9ZXCoXCMhXmFSDb0Xxovt4MNEefB9XEvsZ7gb5alaT+njdD1BzoSyHd5j57gAB/NQ1JCBSWhICCmLo03jqeDEIqRC3CeMmaRtY7JYgrNRXS8qJsmnFM9vFF87v0/i/ehjl3XpH1CkqNVQmLtfbtxkKOb3cilsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=diS/eTnm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org) smtp.mailfrom=sifive.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=diS/eTnm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ymb5F3SpMz2xKd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2025 16:43:28 +1100 (AEDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3cfcf8b7455so31650255ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Feb 2025 21:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1738561406; x=1739166206; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Abrmc3V+wCkg7+h5ECgKA37T7F550/MzIW2BgVmGe00=;
        b=diS/eTnmRFppuEjEwKNJ8Jfr0C197f405S9YlKZfA3mxyeTNfkM/If+55iF2mNQU9K
         assMgAXKBciQA5y9ZF5v/XfTjKSq2nnv5hnyjBiOTC86TqNOzLuo9N6Go2ZIlGyMCnab
         G3bUj5FVeQUGaEVx1eeVFyZaP8bQDRutccAHGmXLI/A5JtTrHrKlaoS14yLNllyvC17J
         HpZ9iQ0LmLNdrh15jbn2fRJo1MQbpAcV4hhjsCjAzkupOLqvJavaQrt8YHDN7yxQqPVP
         KXMSfrdUYn0IzRHv8XJfOvnw/vtbUBG8C65re7cGJSdLmnSCNIUzLOCMX0PJHSdxfqLY
         2Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738561406; x=1739166206;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Abrmc3V+wCkg7+h5ECgKA37T7F550/MzIW2BgVmGe00=;
        b=mLndjoUoyzrKS3Yplm75z45+mZ/X/8XuToqnNnJiNwstDnILQbCyGGlyyzv7cPjsmy
         YhmfPw/XESwAHL+wywmzRrrhc84TVqvYQTFfVdzw0W+oI5miuZqPFRfQrXZGdbRZbEHY
         emV0ag8D0t3YXPgmPj0w9WZv+3+2DN5Ub8u+BeZWRqEQgLeDq11+NHP45m5FfidLvb01
         +nQh3bnZDF08jyaGm1nOe1Qndmpyt/3KZFqbeHsKgGpKqGfgHxONgGo+gmo4Lm7JhLq8
         RZ13nE23jEccRD39lKmYE2brxyi7B1thaIH54z5fnNf9Mm6kpRt+eDu1LuSo1Wl8N2YW
         Xf0w==
X-Forwarded-Encrypted: i=1; AJvYcCXVm6Arh4yhtLsF7jXCjuVQuQrTHXtmjoW0ObONhX5kdNPXL50dOvGA3Bg6NrU1VM4Z0f3d9l3g4Lc6auM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwKV7OWPkdFAWAFqfnnR/gJ9/zGx/+5Ry0zkmST8ATXrVCpMe60
	JFnf64SMb/FSuf/RIr6ctlCwCacetSt/LkM5lvtSXDT8/MCWdMe9GRuWwDEWQ3E=
X-Gm-Gg: ASbGncvC8E8xn2LOh3QY033FRdKCrTJFuRlWWiWdTdGHk1YAxkDAMf9pTq0xAeTTne/
	ZjpucaSCy2P15Yz7QvDn5OcXVxfy5/1PoT1vFAWOtuppjj2oS3G2XFaTSDyEcDATAlyBbKvEPaZ
	2qZQnOdgVM2gTYupmSdNNLvurGUyNn1H6iogQ8Wb7dEwCqoujWD2yPTYLQ6pE778MUdcmq8NxLD
	28r0nfXnTaPckgDPLs+QF10jjypT7yUeyO1N9FMLwDh4RcJxOssVoQ1ukfA8HvVObapSn5dM7eX
	HYo8k1ppZRcRGCGuWDq6aglXoAWH/7dtMQXLHTI=
X-Google-Smtp-Source: AGHT+IHl4RRDfRdJ9K6Cx6v8dXThe6D880Ogx8BJ2U75l88ormi4P0wAtnHOCwaBHFLWcb6LIw7+7w==
X-Received: by 2002:a05:6e02:1fc2:b0:3ce:78ab:dcd1 with SMTP id e9e14a558f8ab-3cffe4a7bf1mr175908815ab.19.1738561406189;
        Sun, 02 Feb 2025 21:43:26 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d018c28ea5sm15310115ab.35.2025.02.02.21.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 21:43:25 -0800 (PST)
Message-ID: <44468c97-06e6-4bfe-930d-444ab7ead90d@sifive.com>
Date: Sun, 2 Feb 2025 23:43:22 -0600
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] riscv: kvm: drop 32-bit host support
To: Arnd Bergmann <arnd@kernel.org>, kvm@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>, "A. Wilcox" <AWilcox@Wilcox-Tech.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20241221214223.3046298-1-arnd@kernel.org>
 <20241221214223.3046298-3-arnd@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241221214223.3046298-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Arnd,

On 2024-12-21 3:42 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> KVM support on RISC-V includes both 32-bit and 64-bit host mode, but in
> practice, all RISC-V SoCs that may use this are 64-bit:
> 
> As of linux-6.13, there is no mainline Linux support for any specific
> 32-bit SoC in arch/riscv/, although the generic qemu model should work.
> 
> The available RV32 CPU implementations are mostly built for
> microcontroller applications and are lacking a memory management
> unit. There are a few CPU cores with an MMU, but those still lack the
> hypervisor extensions needed for running KVM.
> 
> This is unlikely to change in the future, so remove the 32-bit host
> code and simplify the test matrix.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/kvm/Kconfig            |   2 +-
>  arch/riscv/kvm/aia.c              | 105 ------------------------------
>  arch/riscv/kvm/aia_imsic.c        |  34 ----------
>  arch/riscv/kvm/mmu.c              |   8 ---
>  arch/riscv/kvm/vcpu_exit.c        |   4 --
>  arch/riscv/kvm/vcpu_insn.c        |  12 ----
>  arch/riscv/kvm/vcpu_sbi_pmu.c     |   8 ---
>  arch/riscv/kvm/vcpu_sbi_replace.c |   4 --
>  arch/riscv/kvm/vcpu_sbi_v01.c     |   4 --
>  arch/riscv/kvm/vcpu_timer.c       |  20 ------
>  10 files changed, 1 insertion(+), 200 deletions(-)
> 
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 0c3cbb0915ff..7405722e4433 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -19,7 +19,7 @@ if VIRTUALIZATION
>  
>  config KVM
>  	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
> -	depends on RISCV_SBI && MMU
> +	depends on RISCV_SBI && MMU && 64BIT
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_IRQ_ROUTING
>  	select HAVE_KVM_MSI
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index 19afd1f23537..a399a5a9af0e 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -66,33 +66,6 @@ static inline unsigned long aia_hvictl_value(bool ext_irq_pending)
>  	return hvictl;
>  }
>  
> -#ifdef CONFIG_32BIT
> -void kvm_riscv_vcpu_aia_flush_interrupts(struct kvm_vcpu *vcpu)
> -{
> -	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
> -	unsigned long mask, val;
> -
> -	if (!kvm_riscv_aia_available())
> -		return;
> -
> -	if (READ_ONCE(vcpu->arch.irqs_pending_mask[1])) {
> -		mask = xchg_acquire(&vcpu->arch.irqs_pending_mask[1], 0);
> -		val = READ_ONCE(vcpu->arch.irqs_pending[1]) & mask;
> -
> -		csr->hviph &= ~mask;
> -		csr->hviph |= val;
> -	}
> -}
> -
> -void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
> -{
> -	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
> -
> -	if (kvm_riscv_aia_available())
> -		csr->vsieh = ncsr_read(CSR_VSIEH);
> -}
> -#endif
> -
>  bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>  {
>  	int hgei;
> @@ -101,12 +74,6 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>  	if (!kvm_riscv_aia_available())
>  		return false;
>  
> -#ifdef CONFIG_32BIT
> -	if (READ_ONCE(vcpu->arch.irqs_pending[1]) &
> -	    (vcpu->arch.aia_context.guest_csr.vsieh & upper_32_bits(mask)))
> -		return true;
> -#endif
> -
>  	seip = vcpu->arch.guest_csr.vsie;
>  	seip &= (unsigned long)mask;
>  	seip &= BIT(IRQ_S_EXT);
> @@ -128,9 +95,6 @@ void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
>  	if (!kvm_riscv_aia_available())
>  		return;
>  
> -#ifdef CONFIG_32BIT
> -	ncsr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
> -#endif
>  	ncsr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
>  }
>  
> @@ -147,22 +111,10 @@ void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
>  		nacl_csr_write(nsh, CSR_VSISELECT, csr->vsiselect);
>  		nacl_csr_write(nsh, CSR_HVIPRIO1, csr->hviprio1);
>  		nacl_csr_write(nsh, CSR_HVIPRIO2, csr->hviprio2);
> -#ifdef CONFIG_32BIT
> -		nacl_csr_write(nsh, CSR_VSIEH, csr->vsieh);
> -		nacl_csr_write(nsh, CSR_HVIPH, csr->hviph);
> -		nacl_csr_write(nsh, CSR_HVIPRIO1H, csr->hviprio1h);
> -		nacl_csr_write(nsh, CSR_HVIPRIO2H, csr->hviprio2h);
> -#endif

One minor cleanup: since this patch removes all accesses to these 32-bit-only
high-half CSRs, the corresponding members should also be removed from struct
kvm_vcpu_aia_csr in asm/kvm_aia.h.

Regards,
Samuel


