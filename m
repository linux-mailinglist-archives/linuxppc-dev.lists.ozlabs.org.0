Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C1D8FAA17
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 07:44:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P1ldw0pF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtffP1fXwz3cXF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 15:43:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P1ldw0pF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vtfdj1MwWz30Wj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 15:43:19 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1f6559668e1so19006995ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 22:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717479794; x=1718084594; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cPsbNHYB/deYy9oBYDkilLDFLxslyD43geIq+u0ocg=;
        b=P1ldw0pFJEHv4kN2LnLS2TGTDvlVCDFlqjuxHhY+MT5dsLX3WXCR2D4uCf1/zBUOCI
         DTSumCRMm4Q/Hl8ysuuEQTyzmLIRr2SpjNE5KEajlbZKr/x8Lx/xKDqP/RC1EPuNAl6c
         kJlF52fda3Aiwq7Q2/pqDAVJL3BNnTHGGn3eEAPEOjrCLR/shD522rnJtWVoaTxI5JC8
         wETOLQUC3UHO7xdWMBlcvT3s8VGZccUrDohBexV5cB9+ReGV36PcvWVCkp28S2oHx/r7
         GMgdU5k2wgFJ4peuGy9Zt4ntY5eCnTMOGoHzSU1BjPQjIauXEPdpj2jUmkZ/8JSeHcLp
         huNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717479794; x=1718084594;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1cPsbNHYB/deYy9oBYDkilLDFLxslyD43geIq+u0ocg=;
        b=Qjp9nQ8U8txRo6qYShKPDTtOXRSqOnA6MtcmEUCKQdUrc0EhGATTk13+s44x4qxlr5
         bLJ8fuuHUl9Ya95VFm+Mdk6vfmv4yCX5CAtrLE6EpFtV5HS6OYAMqp0NoNWFKLmocj2F
         i4pwoWdklPtBp0kLquxAINZ3wYilevIV6crL3l7qQphCF+6hGay37vLpI72rXMSxTvjx
         iG1QFgJG8gVyxARdiwYN1FSOMeeFaEtI/a0HFGFSHuwWzikGEDrkHskr01/84mYGg7yq
         UZ8GI+nlIe4aw/YCVMwKMiLFgiT3IUC0W8tX1MLvo1BqS9WMvKzYwgFNRRULHQBndVMX
         Z5uA==
X-Forwarded-Encrypted: i=1; AJvYcCVsJquR1Bog4t2GEp5uB9xzaVShVkuEnNcd8PZRQqOH6ymSjMI25pWlOCXfVg/pFHGVGWkvsVCaBxaMkayDLNxLUajVagh/F//9++Y7Mw==
X-Gm-Message-State: AOJu0YwCdxPBI/c+JL3M/ZX1Tm6VxJLqphNwq69mOlLrbIcrVih36Cc4
	BhACTxOkSZVpVCqwJIF/Gwqu2bbSL2nqIh/W4fPYhah0KRI9XaJz
X-Google-Smtp-Source: AGHT+IHdULvM/UoX71VpmSro0BVG2S25hAJs5rPoN0XzL1Vuyeuwb3p6V/lc/pV9Udr55ns8zfQHzw==
X-Received: by 2002:a17:902:d2d2:b0:1f6:857b:b5c with SMTP id d9443c01a7336-1f6857b4df3mr34853835ad.32.1717479794361;
        Mon, 03 Jun 2024 22:43:14 -0700 (PDT)
Received: from localhost ([1.146.11.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f683d1a770sm21936025ad.13.2024.06.03.22.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 22:43:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Jun 2024 15:43:06 +1000
Message-Id: <D1QZRTRK2WWI.20TJKC3RK1K9C@gmail.com>
Subject: Re: [PATCH 4/6] KVM: PPC: Book3S HV: Add one-reg interface for
 DEXCR register
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Shivaprasad G Bhat" <sbhat@linux.ibm.com>, <kvm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
 <171741327891.6631.10339033341166150910.stgit@linux.ibm.com>
In-Reply-To: <171741327891.6631.10339033341166150910.stgit@linux.ibm.com>
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

On Mon Jun 3, 2024 at 9:14 PM AEST, Shivaprasad G Bhat wrote:
> The patch adds a one-reg register identifier which can be used to
> read and set the DEXCR for the guest during enter/exit with
> KVM_REG_PPC_DEXCR. The specific SPR KVM API documentation
> too updated.

I wonder if the uapi and documentation parts should go in their
own patch in a ppc kvm uapi topic branch? Otherwise looks okay.

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
> index a71d91978d9e..81077c654281 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -2441,6 +2441,7 @@ registers, find a list below:
>    PPC     KVM_REG_PPC_PTCR                64
>    PPC     KVM_REG_PPC_DAWR1               64
>    PPC     KVM_REG_PPC_DAWRX1              64
> +  PPC     KVM_REG_PPC_DEXCR               64
>    PPC     KVM_REG_PPC_TM_GPR0             64
>    ...
>    PPC     KVM_REG_PPC_TM_GPR31            64
> diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/u=
api/asm/kvm.h
> index 1691297a766a..fcb947f65667 100644
> --- a/arch/powerpc/include/uapi/asm/kvm.h
> +++ b/arch/powerpc/include/uapi/asm/kvm.h
> @@ -645,6 +645,7 @@ struct kvm_ppc_cpu_char {
>  #define KVM_REG_PPC_SIER3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc3)
>  #define KVM_REG_PPC_DAWR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc4)
>  #define KVM_REG_PPC_DAWRX1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc5)
> +#define KVM_REG_PPC_DEXCR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc6)
> =20
>  /* Transactional Memory checkpointed state:
>   * This is all GPRs, all VSX regs and a subset of SPRs
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index b576781d58d5..1294c6839d37 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -2349,6 +2349,9 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *v=
cpu, u64 id,
>  	case KVM_REG_PPC_DAWRX1:
>  		*val =3D get_reg_val(id, kvmppc_get_dawrx1_hv(vcpu));
>  		break;
> +	case KVM_REG_PPC_DEXCR:
> +		*val =3D get_reg_val(id, kvmppc_get_dexcr_hv(vcpu));
> +		break;
>  	case KVM_REG_PPC_CIABR:
>  		*val =3D get_reg_val(id, kvmppc_get_ciabr_hv(vcpu));
>  		break;
> @@ -2592,6 +2595,9 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *v=
cpu, u64 id,
>  	case KVM_REG_PPC_DAWRX1:
>  		kvmppc_set_dawrx1_hv(vcpu, set_reg_val(id, *val) & ~DAWRX_HYP);
>  		break;
> +	case KVM_REG_PPC_DEXCR:
> +		kvmppc_set_dexcr_hv(vcpu, set_reg_val(id, *val));
> +		break;
>  	case KVM_REG_PPC_CIABR:
>  		kvmppc_set_ciabr_hv(vcpu, set_reg_val(id, *val));
>  		/* Don't allow setting breakpoints in hypervisor code */
> diff --git a/tools/arch/powerpc/include/uapi/asm/kvm.h b/tools/arch/power=
pc/include/uapi/asm/kvm.h
> index 1691297a766a..fcb947f65667 100644
> --- a/tools/arch/powerpc/include/uapi/asm/kvm.h
> +++ b/tools/arch/powerpc/include/uapi/asm/kvm.h
> @@ -645,6 +645,7 @@ struct kvm_ppc_cpu_char {
>  #define KVM_REG_PPC_SIER3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc3)
>  #define KVM_REG_PPC_DAWR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc4)
>  #define KVM_REG_PPC_DAWRX1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc5)
> +#define KVM_REG_PPC_DEXCR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc6)
> =20
>  /* Transactional Memory checkpointed state:
>   * This is all GPRs, all VSX regs and a subset of SPRs

