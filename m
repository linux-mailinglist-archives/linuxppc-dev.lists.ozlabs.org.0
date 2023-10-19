Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F07CF3DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 11:18:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=SiLkIQ7Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB2FN29rMz3cVR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 20:18:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=SiLkIQ7Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB2DX5SrJz3cDS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 20:17:32 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3296b49c546so5953491f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 02:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697707048; x=1698311848; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bcsnYpAdLM0em0FjxCCFcChvrh3CN3lWApFF37wa+JE=;
        b=SiLkIQ7QRjpxZGC/uHVOZGV/6+0OnJXnsOf96ecRZ+cwLftqM69PTlL9JvhC/mdru4
         06LqUL+OigHVFM/83f5u/4yLCD/1gbQzAi5PC5IGZFRkTJlW1pBWs8sN2fBLcd6z4B9s
         uRzNHyBVFsOeWIqtOXsqMVlFQu91CINPi9ybiqLJpmebmeMXFP++lw0QNLSXKGH1ygVv
         C7FX+7/nRIzsuic5PK6ko8hh60rRC6CCUnHkC0S9ezzQqigouQHMPyz8bNz7iNfsbArT
         j6zN+K+bcfctUK18VKWmi58Wvq68KfyubpcZR1EPtbmytDK0sSzrQ2zQLLsA1PP2eHb9
         kUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697707048; x=1698311848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcsnYpAdLM0em0FjxCCFcChvrh3CN3lWApFF37wa+JE=;
        b=loEYG8uLy2cywHzAFqZiB8o6aDWtdEmNcdGAe4SyQBwbOnb0cNns8Fo2cje0N29x11
         9kZUH0ARkoaSgoK5mO317Fy8+fLTi4s8j/I+ZzbRCDgA78DqXevclJX13BYNcJyD7iZF
         u1isqvMQns3nTPIDILOR1OX2QjldvRFmEtkaEzaa71S7Tr1y/CPLiqyeFjNEBR9bl7zG
         YrN6oH4VZx7X86kFL8fQuPu+NExF+VGSQzRevZLmfU/IvfGt+vrNLKyisSSnSLRv4Dw1
         joOKGGa8Z3eOqZA8OsMgPwHcB5A3YFzNrfPY9sLthTM9ahWWaWdH1dVp+sARj8UuF/Y9
         ye3A==
X-Gm-Message-State: AOJu0YxhZkpuHxB+gHXFktB7h4H6zR1aNZUmWAr8D2FJv9WDbvX82cqP
	jEDpTLMaMG8qPTn4z2JUmbebrL6Fs0tT5ohXv8E=
X-Google-Smtp-Source: AGHT+IG8jOCLnI027DgY6Yx/fVy/qYUq7DqIReW1lUlcofpdY/Llx77hEFpM5sP3dOt6SenXND9+/w==
X-Received: by 2002:adf:f74d:0:b0:32d:8da0:48d0 with SMTP id z13-20020adff74d000000b0032d8da048d0mr923979wrp.68.1697707048600;
        Thu, 19 Oct 2023 02:17:28 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id x8-20020adfec08000000b0032dbf6bf7a2sm3994451wrn.97.2023.10.19.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 02:17:27 -0700 (PDT)
Date: Thu, 19 Oct 2023 11:17:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 4/8] RISC-V: KVM: Forward SBI DBCN extension to
 user-space
Message-ID: <20231019-7471d3927d94ab7158d61c6b@orel>
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

We should add this new register to the get-reg-list kselftest, i.e.

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 234006d035c9..4a0f8a8cfbf8 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -565,6 +565,7 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SRST,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_EN | 0,

Thanks,
drew
