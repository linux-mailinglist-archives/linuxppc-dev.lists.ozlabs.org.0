Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 758C77CF1E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 10:02:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=h0Eia5EE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB0ZF2cwgz3vY8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 19:02:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=h0Eia5EE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB0YM4cs8z3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 19:01:59 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c50906f941so90378121fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 01:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697702515; x=1698307315; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wThBUxBh7v0znNn0ZPl0WI7OQvkdGdCrZ1lZ3b6Zyy4=;
        b=h0Eia5EE9xkA8rgg6SxK8HPRU1NyQtVsH+nV+MWYcfwzGmP7Abc/I4XFlOu1VneOSL
         2cQ3p8UnPtVdKyOKpwymgcE7Mjh/Du0EWE1b+fnB4XtUT35nxLznJZo/HXhsHPlp7/RO
         80GSCjdtccL/fDuiIIOGZE090cr3ZFRMj/O/qsHqdkm9xvfAkYFenWsJIgorJswNm7xs
         sVedDNa8z5yAN4uTwbTMijmFnTeBiwOghzEdiQ9lYIFSZMZ4KiG7yUjjmksEm8M+uRo4
         SJ+FM2OjRnea9IJVy2FgFhYuYEbAX9DzI5dvaWdnncK1yK8W46JJRoACZFzYMmVvq2C/
         In4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697702515; x=1698307315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wThBUxBh7v0znNn0ZPl0WI7OQvkdGdCrZ1lZ3b6Zyy4=;
        b=whid1TEj6Iuhn6ZASJcdYfZ11tM5XM86hJLzLI1U3tvb1glxUW/Khsqz4jK0ZR9HvP
         vtzmvzLj2srmp6kcQ35jj++aI8mZrZGF5GQ/k+nG4ylPa5gvh8VAyPtK6+CrYakcK3xZ
         wWHDESNpsMB+wyPtD9BTAhB4r0k1S2EY2yeqXiHMRFxScMU5zgitE8jl9L43OgevZ02d
         Ngwy7Rvlcm1zAe8uvGkVT1oBUFYhDLO6Ln0jJZaIkgCZl3fz5vDlnPuJXosE/EmTE+0+
         M7aoQLZO/rwH8wzR4y1tvaNnMwpnvrIXEgavw1oRS1+dh3ccAux2kOo0mVIKbLQwqPcE
         kDxQ==
X-Gm-Message-State: AOJu0YxpIBjwolvXCnbolC93ICAEQiC+U3oSZhtSReBmnj8Ovr8rdXn+
	/IGQonPdfMbdT42dO4uiN4+iYw==
X-Google-Smtp-Source: AGHT+IEkF+Ae4mUiCJOXGTWK+iVSfRk0ko7bvAOvA0qtVmbQYW0wA+W8atiyY1iQZ4X9vKJwGK3qXg==
X-Received: by 2002:a2e:bc04:0:b0:2c5:13e8:e6dc with SMTP id b4-20020a2ebc04000000b002c513e8e6dcmr1149965ljf.31.1697702515155;
        Thu, 19 Oct 2023 01:01:55 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id je6-20020a05600c1f8600b004063ea92492sm3790133wmb.22.2023.10.19.01.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:01:54 -0700 (PDT)
Date: Thu, 19 Oct 2023 10:01:53 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 4/8] RISC-V: KVM: Forward SBI DBCN extension to
 user-space
Message-ID: <20231019-5e79c16a0731f60d862ddfff@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-5-apatel@ventanamicro.com>
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
Cc: linux-serial@vger.kernel.org, kvm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Atish Patra <atishp@atishpatra.org>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 12, 2023 at 10:45:05AM +0530, Anup Patel wrote:
> The frozen SBI v2.0 specification defines the SBI debug console
> (DBCN) extension which replaces the legacy SBI v0.1 console
> functions namely sbi_console_getchar() and sbi_console_putchar().
> 
> The SBI DBCN extension needs to be emulated in the KVM user-space
> (i.e. QEMU-KVM or KVMTOOL) so we forward SBI DBCN calls from KVM
> guest to the KVM user-space which can then redirect the console
> input/output to wherever it wants (e.g. telnet, file, stdio, etc).
> 
> The SBI debug console is simply a early console available to KVM
> guest for early prints and it does not intend to replace the proper
> console devices such as 8250, VirtIO console, etc.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
>  arch/riscv/include/uapi/asm/kvm.h     |  1 +
>  arch/riscv/kvm/vcpu_sbi.c             |  4 ++++
>  arch/riscv/kvm/vcpu_sbi_replace.c     | 32 +++++++++++++++++++++++++++
>  4 files changed, 38 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index c02bda5559d7..6a453f7f8b56 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -73,6 +73,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>  
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 917d8cc2489e..60d3b21dead7 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -156,6 +156,7 @@ enum KVM_RISCV_SBI_EXT_ID {
>  	KVM_RISCV_SBI_EXT_PMU,
>  	KVM_RISCV_SBI_EXT_EXPERIMENTAL,
>  	KVM_RISCV_SBI_EXT_VENDOR,
> +	KVM_RISCV_SBI_EXT_DBCN,
>  	KVM_RISCV_SBI_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 1b1cee86efda..bb76c3cf633f 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -66,6 +66,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
>  		.ext_idx = KVM_RISCV_SBI_EXT_PMU,
>  		.ext_ptr = &vcpu_sbi_ext_pmu,
>  	},
> +	{
> +		.ext_idx = KVM_RISCV_SBI_EXT_DBCN,
> +		.ext_ptr = &vcpu_sbi_ext_dbcn,
> +	},
>  	{
>  		.ext_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
>  		.ext_ptr = &vcpu_sbi_ext_experimental,
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> index 7c4d5d38a339..23b57c931b15 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -175,3 +175,35 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst = {
>  	.extid_end = SBI_EXT_SRST,
>  	.handler = kvm_sbi_ext_srst_handler,
>  };
> +
> +static int kvm_sbi_ext_dbcn_handler(struct kvm_vcpu *vcpu,
> +				    struct kvm_run *run,
> +				    struct kvm_vcpu_sbi_return *retdata)
> +{
> +	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +	unsigned long funcid = cp->a6;
> +
> +	switch (funcid) {
> +	case SBI_EXT_DBCN_CONSOLE_WRITE:
> +	case SBI_EXT_DBCN_CONSOLE_READ:
> +	case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
> +		/*
> +		 * The SBI debug console functions are unconditionally
> +		 * forwarded to the userspace.
> +		 */
> +		kvm_riscv_vcpu_sbi_forward(vcpu, run);
> +		retdata->uexit = true;
> +		break;
> +	default:
> +		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
> +	}
> +
> +	return 0;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn = {
> +	.extid_start = SBI_EXT_DBCN,
> +	.extid_end = SBI_EXT_DBCN,
> +	.default_unavail = true,
> +	.handler = kvm_sbi_ext_dbcn_handler,
> +};
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
