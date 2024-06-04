Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CAC8FAA1A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 07:44:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OLEY6Xk7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtfg92gbGz3cyd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 15:44:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OLEY6Xk7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vtfdp0ffTz3cTD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 15:43:26 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f68834bfdfso5676795ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 22:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717479804; x=1718084604; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMZI3zkaSwcqdd78+yzxe31y+FOMl2y7kr8jaeztLAE=;
        b=OLEY6Xk7nZh6Wta1PyidrEI6hcNpIUd2kZxlPDjj2bGF2R1IrshBXzGYRN3nV1aq18
         c0QQquqyDSUGhirwo/evAko0Vie+kX13jg451RKyxuu5Nmkck4vO+0cEzgCH1tixbpA6
         niyv5qvBq2KU3KEo2d9q+fDzn+2T8Wka2zytn2hX71K+t+2hV/67LlDyY7jegImzC6fn
         E1oggNb31+fixxZwHXz9w9Dimi+45uyGS1JVewN30PZ/5lFvEc1XN2x4rs/XSAPM+knH
         7scYf53nloF27uDStCAbsbC4iT3Mi7YeV2diNFyvfC27od+SnPdRcVmGfujpghx9d7Ac
         5tbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717479804; x=1718084604;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hMZI3zkaSwcqdd78+yzxe31y+FOMl2y7kr8jaeztLAE=;
        b=vwRVE2wUlDfdrEC2JNNipJ91QHCfQr5cX2KEXWFZJD/4kEDsJRtO2MCoZzaFwRctz2
         yk5XKjbEQUvSR48PrUj56poihnz1sm/EVoVYmlvbltDP+fydgLb2gC9GghKq2PC78dZg
         AgNEFR4VkO4ufr/BazN6ddA4ANcPZzzT9BAaNMXLQyCy0HtagRXDzyEBYg1Dkie1Qa3f
         smnQ9bfsTK35Xd6GB0/Ck2H6CDzPVxvWAJlSFlm9yuVXWp1tPNPyxbG8vw5cs48C98lJ
         WnsENBmrRXnQVDYs+96gXEvHxRzdM/G7X+ltFPW1Kuka3b3Wx73DYUzIu2mkvWP2X2rf
         4V0A==
X-Forwarded-Encrypted: i=1; AJvYcCUoFqyLbM+2/8XR5JG9aFQc+ZuyXT4oS4VWlDrpq9K8n+YxScFmY8qCmycjxT8+thFP991FVkqP77TrZmaxYqC75s17k+x8TgBxAMmXnQ==
X-Gm-Message-State: AOJu0YyLYrU8F6f5HAU/P3uWOe+CLlkubw9RDddVckExrdCKucy+1UyA
	Lib6dNgIqBAkx5K6tXWQJErerRjnWzF/vWsPSXgheoc5lbTzwG/3
X-Google-Smtp-Source: AGHT+IGM8f/is09yOrScZQFiLhzRjIF8KXB5oZ0fJ6eQPy8HEQtZ3rnCf8+ghDsA/19r/3L7vU6BCA==
X-Received: by 2002:a17:903:1cc:b0:1f6:74f3:ac0a with SMTP id d9443c01a7336-1f674f3b0b9mr65335635ad.64.1717479803719;
        Mon, 03 Jun 2024 22:43:23 -0700 (PDT)
Received: from localhost ([1.146.11.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632358519sm75196065ad.82.2024.06.03.22.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 22:43:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Jun 2024 15:43:16 +1000
Message-Id: <D1QZRY6L192K.12B6FYKGAHZH8@gmail.com>
Subject: Re: [PATCH 6/6] KVM: PPC: Book3S HV: Add one-reg interface for
 HASHKEYR register
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Shivaprasad G Bhat" <sbhat@linux.ibm.com>, <kvm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
 <171741330411.6631.10739157625274499060.stgit@linux.ibm.com>
In-Reply-To: <171741330411.6631.10739157625274499060.stgit@linux.ibm.com>
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
Cc: atrajeev@linux.vnet.ibm.com, corbet@lwn.net, linux-kernel@vger.kernel.org, namhyung@kernel.org, naveen.n.rao@linux.ibm.com, pbonzini@redhat.com, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 3, 2024 at 9:15 PM AEST, Shivaprasad G Bhat wrote:
> The patch adds a one-reg register identifier which can be used to
> read and set the virtual HASHKEYR for the guest during enter/exit
> with KVM_REG_PPC_HASHKEYR. The specific SPR KVM API documentation
> too updated.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
>  Documentation/virt/kvm/api.rst            |    1 +
>  arch/powerpc/include/uapi/asm/kvm.h       |    1 +
>  arch/powerpc/kvm/book3s_hv.c              |    6 ++++++
>  tools/arch/powerpc/include/uapi/asm/kvm.h |    1 +
>  4 files changed, 9 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index 81077c654281..0c22cb4196d8 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -2439,6 +2439,7 @@ registers, find a list below:
>    PPC     KVM_REG_PPC_PSSCR               64
>    PPC     KVM_REG_PPC_DEC_EXPIRY          64
>    PPC     KVM_REG_PPC_PTCR                64
> +  PPC     KVM_REG_PPC_HASHKEYR            64
>    PPC     KVM_REG_PPC_DAWR1               64
>    PPC     KVM_REG_PPC_DAWRX1              64
>    PPC     KVM_REG_PPC_DEXCR               64
> diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/u=
api/asm/kvm.h
> index fcb947f65667..23a0af739c78 100644
> --- a/arch/powerpc/include/uapi/asm/kvm.h
> +++ b/arch/powerpc/include/uapi/asm/kvm.h
> @@ -646,6 +646,7 @@ struct kvm_ppc_cpu_char {
>  #define KVM_REG_PPC_DAWR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc4)
>  #define KVM_REG_PPC_DAWRX1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc5)
>  #define KVM_REG_PPC_DEXCR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc6)
> +#define KVM_REG_PPC_HASHKEYR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc7)
> =20
>  /* Transactional Memory checkpointed state:
>   * This is all GPRs, all VSX regs and a subset of SPRs
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 1294c6839d37..ccc9564c5a31 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -2352,6 +2352,9 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *v=
cpu, u64 id,
>  	case KVM_REG_PPC_DEXCR:
>  		*val =3D get_reg_val(id, kvmppc_get_dexcr_hv(vcpu));
>  		break;
> +	case KVM_REG_PPC_HASHKEYR:
> +		*val =3D get_reg_val(id, kvmppc_get_hashkeyr_hv(vcpu));
> +		break;
>  	case KVM_REG_PPC_CIABR:
>  		*val =3D get_reg_val(id, kvmppc_get_ciabr_hv(vcpu));
>  		break;
> @@ -2598,6 +2601,9 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *v=
cpu, u64 id,
>  	case KVM_REG_PPC_DEXCR:
>  		kvmppc_set_dexcr_hv(vcpu, set_reg_val(id, *val));
>  		break;
> +	case KVM_REG_PPC_HASHKEYR:
> +		kvmppc_set_hashkeyr_hv(vcpu, set_reg_val(id, *val));
> +		break;
>  	case KVM_REG_PPC_CIABR:
>  		kvmppc_set_ciabr_hv(vcpu, set_reg_val(id, *val));
>  		/* Don't allow setting breakpoints in hypervisor code */
> diff --git a/tools/arch/powerpc/include/uapi/asm/kvm.h b/tools/arch/power=
pc/include/uapi/asm/kvm.h
> index fcb947f65667..23a0af739c78 100644
> --- a/tools/arch/powerpc/include/uapi/asm/kvm.h
> +++ b/tools/arch/powerpc/include/uapi/asm/kvm.h
> @@ -646,6 +646,7 @@ struct kvm_ppc_cpu_char {
>  #define KVM_REG_PPC_DAWR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc4)
>  #define KVM_REG_PPC_DAWRX1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc5)
>  #define KVM_REG_PPC_DEXCR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc6)
> +#define KVM_REG_PPC_HASHKEYR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc7)
> =20
>  /* Transactional Memory checkpointed state:
>   * This is all GPRs, all VSX regs and a subset of SPRs

