Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D231D8E80
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 06:07:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R2QG3fFJzDqkS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 14:07:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f2U7A2kA; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R2N23zxkzDqnZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 14:05:06 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id w22so10083980otp.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 21:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Y9yr+TvYDq1O01kh7dG8GZRFS/Ru5NhSemTIyDi0Zw=;
 b=f2U7A2kAGyWMvevfUQItrU/1NDuGq5qD7hWqNguyWojr22gFajPI3Q/0mvRPUGfX3v
 jOietqvh+B7HLZ48MhYO49n27+cE7XZtcZUqpqCulbKJNt3wT7OlTa2bTdp4zxgKpeo3
 Gqq5TRy00B5G0HcLteFDFWMKghrSXuANlm+2Gf2b41jhg4+Y+ond/YZJaxzTlm0GEkiP
 1XvcDGtqt3aZW39uwNgMWW15DpvwdTPYQ0g0jigxaY2uW6PpVtt27shSTjPoBajsMzDA
 K+HLxJQTCpzfIJa46fTJ5sorigaJYJkaxytjFd+Zqj039Csfos/A4PdiGbT70Ml0hqLS
 8ySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Y9yr+TvYDq1O01kh7dG8GZRFS/Ru5NhSemTIyDi0Zw=;
 b=pqcCBBQmBBm8EL90ufxcG4bcRM8Sst/PVutk1TPBmy3J5eUIyauv+HX+S4uAdFmxo5
 kA26yC4TMoc3BmY6nLRenGH3c5sQ6TL0/V/5c4PM0Y4BWZIixXC0+kLbzxZPyPSF8AKo
 Kp12VMn4iDno9iFGhcQuq7nUNGfcAnZarqM0VGQ6Qs+GB3pN7Qw0aR5AvtZWr7QVjTJZ
 mgmLMSpm6h+iHawuN2jGs7Je01y7ethgAVwx8sGh50ae0/NHGbhOCrztuqMo+bHOL6aa
 A1/MRpvKxalAFlRf9i29GRR8SNf79SxXC3FshVpaO04eCejK1r13GsHcbHf0rXvnRLqQ
 dQ+g==
X-Gm-Message-State: AOAM532DhO31hh4mtS7+wp/ZKQhl0ysVbYTPZAQNN8eu6Oj1YmG0ebNl
 12WaYwvzNxJhnoizmRsb5tPe8nSsc1kBUu19CXJSYr5ATn0=
X-Google-Smtp-Source: ABdhPJwwral3OtgNUzMYyIncwYlxxNkatp1KJOkQxZ3zO4SpaIQP42LKQ2rv/kS15CPCdIe0fKd1BgvRj8RiBOrKcsY=
X-Received: by 2002:a9d:220c:: with SMTP id o12mr7791086ota.155.1589861103259; 
 Mon, 18 May 2020 21:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200519003157.31946-1-alistair@popple.id.au>
 <20200519003157.31946-3-alistair@popple.id.au>
In-Reply-To: <20200519003157.31946-3-alistair@popple.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 19 May 2020 14:04:51 +1000
Message-ID: <CACzsE9pF6Q01eMtzM1esnGC1k=BWZuq8gPMRZC4uaHNoQ=VdzA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] powerpc: Add support for ISA v3.1
To: Alistair Popple <alistair@popple.id.au>
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
Cc: aneesh.kumar@linux.ibm.com, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 19, 2020 at 10:39 AM Alistair Popple <alistair@popple.id.au> wrote:
>
> Newer ISA versions are enabled by clearing all bits in the PCR
> associated with previous versions of the ISA. Enable ISA v3.1 support
> by updating the PCR mask to include ISA v3.0. This ensures all PCR
> bits corresponding to earlier architecture versions get cleared
> thereby enabling ISA v3.1 if supported by the hardware.
>
> Signed-off-by: Alistair Popple <alistair@popple.id.au>
> ---
>  arch/powerpc/include/asm/cputable.h | 1 +
>  arch/powerpc/include/asm/reg.h      | 3 ++-
>  arch/powerpc/kvm/book3s_hv.c        | 3 ---
>  3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
> index 40a4d3c6fd99..36f894dea9e7 100644
> --- a/arch/powerpc/include/asm/cputable.h
> +++ b/arch/powerpc/include/asm/cputable.h
> @@ -213,6 +213,7 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTR_P9_TIDR                        LONG_ASM_CONST(0x0000800000000000)
>  #define CPU_FTR_P9_TLBIE_ERAT_BUG      LONG_ASM_CONST(0x0001000000000000)
>  #define CPU_FTR_P9_RADIX_PREFETCH_BUG  LONG_ASM_CONST(0x0002000000000000)
> +#define CPU_FTR_ARCH_31                        LONG_ASM_CONST(0x0004000000000000)
>
>  #ifndef __ASSEMBLY__
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 773f76402392..1931b1142599 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -485,10 +485,11 @@
>   * determine both the compatibility level which we want to emulate and the
>   * compatibility level which the host is capable of emulating.
>   */
> +#define   PCR_ARCH_300 0x10            /* Architecture 3.00 */
>  #define   PCR_ARCH_207 0x8             /* Architecture 2.07 */
>  #define   PCR_ARCH_206 0x4             /* Architecture 2.06 */
>  #define   PCR_ARCH_205 0x2             /* Architecture 2.05 */
> -#define   PCR_LOW_BITS (PCR_ARCH_207 | PCR_ARCH_206 | PCR_ARCH_205)
> +#define   PCR_LOW_BITS (PCR_ARCH_207 | PCR_ARCH_206 | PCR_ARCH_205 | PCR_ARCH_300)
>  #define   PCR_MASK     ~(PCR_HIGH_BITS | PCR_LOW_BITS) /* PCR Reserved Bits */
>  #define        SPRN_HEIR       0x153   /* Hypervisor Emulated Instruction Register */
>  #define SPRN_TLBINDEXR 0x154   /* P7 TLB control register */
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 93493f0cbfe8..532215040f3e 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -344,9 +344,6 @@ static void kvmppc_set_pvr_hv(struct kvm_vcpu *vcpu, u32 pvr)
>         vcpu->arch.pvr = pvr;
>  }
>
> -/* Dummy value used in computing PCR value below */
> -#define PCR_ARCH_300   (PCR_ARCH_207 << 1)
> -
Later will we need
+/* Dummy value used in computing PCR value below */
+#define PCR_ARCH_310   (PCR_ARCH_300 << 1)
?
>  static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
>  {
>         unsigned long host_pcr_bit = 0, guest_pcr_bit = 0;
> --
> 2.20.1
>
