Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0F8725673
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 09:52:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbfhj6PJJz3dwv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 17:52:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FA05Gbtv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FA05Gbtv;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbfgw4J46z3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 17:52:10 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d24136685so253264b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 00:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686124327; x=1688716327;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mhp2wj5QHYHX/tbTaW/QE4o8bTMsuyekb6g3V9VIy+I=;
        b=FA05Gbtv1t22Yegpf5jEWcy9V2Elkk0LF97S+AS4uvtY8qdVx/6q+wBLJnLCXiniIl
         s+oSBta56DBAmLUEDGzmnYLUvNifXep35iLe6EuQe9yAJIGAHeokY6mvfwAAEQHjF/RV
         ytEXqMYPFvGZ4LtCBPRpgNFrmFYNZ8/i3zofNdqHCW94KVfg0cdiqFZaBrHpQdHn5JXx
         pZCD2BNaBkdzyX+NK8lnWCOLy4APU/4v7JwFleVlHcA18ggg2sFd+wV0tKS0/Z9BOHCh
         o7bvR/UhQNJKdl7G/5ShEnV/AalarP+/ajcyj2Qn0gfCDFiD2GdpPLPVqIla3a50wBy4
         hN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686124327; x=1688716327;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mhp2wj5QHYHX/tbTaW/QE4o8bTMsuyekb6g3V9VIy+I=;
        b=J+cYSjlv2iJRioIvkdH3SADTlT4R7cBRzDXrhw/H12tAtRwfMS16IQeJq4yiGLsKDi
         OnbUZJxp22xgFAYeKgqlQzF/IiyFsIXA71XsaGS/iDiiPH2f0MqDApk6INlbmnzxhrVU
         y3UDq6RLUPDcwHP6UWAvP0BlYL4hGMCFFYCQl/aA+BNs3xfzFdOr2mJpvRH39ivD8xDO
         Dcd80q4N/njA9wsQELa+ukk4v2tDiPGO+n3NFmtLJomri1n/9U00a8YAzuzIQVEA+6aN
         PVNEhWmiFxTEQmclcztNtkCryavjheb1WbKdY87mSl9JD/htNePxIAc6Qnk5Nb956LHw
         RFrQ==
X-Gm-Message-State: AC+VfDx/ASFz3IXAwAgauLWsdWATjveynKCnWdoiJKFfd68oYynsZXHV
	GThHUoPnyjD4Aul19WarjtU=
X-Google-Smtp-Source: ACHHUZ6HLG6/8KOzaJmG6TPRJ/qkcziNJ1UwLJugx3E+VzFgCsBzjTgjgOc2lLc0sIDpi8pUNKYCwQ==
X-Received: by 2002:aa7:8104:0:b0:65e:1d92:c0cc with SMTP id b4-20020aa78104000000b0065e1d92c0ccmr5172405pfi.10.1686124327310;
        Wed, 07 Jun 2023 00:52:07 -0700 (PDT)
Received: from localhost (193-116-206-233.tpgi.com.au. [193.116.206.233])
        by smtp.gmail.com with ESMTPSA id e3-20020a62ee03000000b0065379c6d549sm7542884pfi.215.2023.06.07.00.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:52:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jun 2023 17:51:59 +1000
Message-Id: <CT696R4C69N1.1OZKTR1A9D3X1@wheely>
Subject: Re: [RFC PATCH v2 1/6] KVM: PPC: Use getters and setters for vcpu
 register state
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jpn@linux.vnet.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
 <20230605064848.12319-2-jpn@linux.vnet.ibm.com>
In-Reply-To: <20230605064848.12319-2-jpn@linux.vnet.ibm.com>
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
Cc: mikey@neuling.org, kautuk.consul.1980@gmail.com, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, sbhat@linux.ibm.com, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 5, 2023 at 4:48 PM AEST, Jordan Niethe wrote:
> There are already some getter and setter functions used for accessing
> vcpu register state, e.g. kvmppc_get_pc(). There are also more
> complicated examples that are generated by macros like
> kvmppc_get_sprg0() which are generated by the SHARED_SPRNG_WRAPPER()
> macro.
>
> In the new PAPR API for nested guest partitions the L1 is required to
> communicate with the L0 to modify and read nested guest state.
>
> Prepare to support this by replacing direct accesses to vcpu register
> state with wrapper functions. Follow the existing pattern of using
> macros to generate individual wrappers. These wrappers will
> be augmented for supporting PAPR nested guests later.
>
> Signed-off-by: Jordan Niethe <jpn@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/kvm_book3s.h  |  68 +++++++-
>  arch/powerpc/include/asm/kvm_ppc.h     |  48 ++++--
>  arch/powerpc/kvm/book3s.c              |  22 +--
>  arch/powerpc/kvm/book3s_64_mmu_hv.c    |   4 +-
>  arch/powerpc/kvm/book3s_64_mmu_radix.c |   9 +-
>  arch/powerpc/kvm/book3s_64_vio.c       |   4 +-
>  arch/powerpc/kvm/book3s_hv.c           | 222 +++++++++++++------------
>  arch/powerpc/kvm/book3s_hv.h           |  59 +++++++
>  arch/powerpc/kvm/book3s_hv_builtin.c   |  10 +-
>  arch/powerpc/kvm/book3s_hv_p9_entry.c  |   4 +-
>  arch/powerpc/kvm/book3s_hv_ras.c       |   5 +-
>  arch/powerpc/kvm/book3s_hv_rm_mmu.c    |   8 +-
>  arch/powerpc/kvm/book3s_hv_rm_xics.c   |   4 +-
>  arch/powerpc/kvm/book3s_xive.c         |   9 +-
>  arch/powerpc/kvm/powerpc.c             |   4 +-
>  15 files changed, 322 insertions(+), 158 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include=
/asm/kvm_book3s.h
> index bbf5e2c5fe09..4e91f54a3f9f 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -392,6 +392,16 @@ static inline ulong kvmppc_get_pc(struct kvm_vcpu *v=
cpu)
>  	return vcpu->arch.regs.nip;
>  }
> =20
> +static inline void kvmppc_set_pid(struct kvm_vcpu *vcpu, u32 val)
> +{
> +	vcpu->arch.pid =3D val;
> +}
> +
> +static inline u32 kvmppc_get_pid(struct kvm_vcpu *vcpu)
> +{
> +	return vcpu->arch.pid;
> +}
> +
>  static inline u64 kvmppc_get_msr(struct kvm_vcpu *vcpu);
>  static inline bool kvmppc_need_byteswap(struct kvm_vcpu *vcpu)
>  {
> @@ -403,10 +413,66 @@ static inline ulong kvmppc_get_fault_dar(struct kvm=
_vcpu *vcpu)
>  	return vcpu->arch.fault_dar;
>  }
> =20
> +#define BOOK3S_WRAPPER_SET(reg, size)					\
> +static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	=
\
> +{									\
> +									\
> +	vcpu->arch.reg =3D val;						\
> +}
> +
> +#define BOOK3S_WRAPPER_GET(reg, size)					\
> +static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
> +{									\
> +	return vcpu->arch.reg;						\
> +}
> +
> +#define BOOK3S_WRAPPER(reg, size)					\
> +	BOOK3S_WRAPPER_SET(reg, size)					\
> +	BOOK3S_WRAPPER_GET(reg, size)					\
> +
> +BOOK3S_WRAPPER(tar, 64)
> +BOOK3S_WRAPPER(ebbhr, 64)
> +BOOK3S_WRAPPER(ebbrr, 64)
> +BOOK3S_WRAPPER(bescr, 64)
> +BOOK3S_WRAPPER(ic, 64)
> +BOOK3S_WRAPPER(vrsave, 64)
> +
> +
> +#define VCORE_WRAPPER_SET(reg, size)					\
> +static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, u##size=
 val)	\
> +{									\
> +	vcpu->arch.vcore->reg =3D val;					\
> +}
> +
> +#define VCORE_WRAPPER_GET(reg, size)					\
> +static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu)	\
> +{									\
> +	return vcpu->arch.vcore->reg;					\
> +}
> +
> +#define VCORE_WRAPPER(reg, size)					\
> +	VCORE_WRAPPER_SET(reg, size)					\
> +	VCORE_WRAPPER_GET(reg, size)					\
> +
> +
> +VCORE_WRAPPER(vtb, 64)
> +VCORE_WRAPPER(tb_offset, 64)
> +VCORE_WRAPPER(lpcr, 64)

The general idea is fine, some of the names could use a bit of
improvement. What's a BOOK3S_WRAPPER for example, is it not a
VCPU_WRAPPER, or alternatively why isn't a VCORE_WRAPPER Book3S
as well?

> +
> +static inline u64 kvmppc_get_dec_expires(struct kvm_vcpu *vcpu)
> +{
> +	return vcpu->arch.dec_expires;
> +}
> +
> +static inline void kvmppc_set_dec_expires(struct kvm_vcpu *vcpu, u64 val=
)
> +{
> +	vcpu->arch.dec_expires =3D val;
> +}
> +
>  /* Expiry time of vcpu DEC relative to host TB */
>  static inline u64 kvmppc_dec_expires_host_tb(struct kvm_vcpu *vcpu)
>  {
> -	return vcpu->arch.dec_expires - vcpu->arch.vcore->tb_offset;
> +	return kvmppc_get_dec_expires(vcpu) - kvmppc_get_tb_offset_hv(vcpu);
>  }
> =20
>  static inline bool is_kvmppc_resume_guest(int r)
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/as=
m/kvm_ppc.h
> index 79a9c0bb8bba..fbac353ac46b 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -936,7 +936,7 @@ static inline ulong kvmppc_get_##reg(struct kvm_vcpu =
*vcpu)		\
>  #define SPRNG_WRAPPER_SET(reg, bookehv_spr)				\
>  static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, ulong val)	\
>  {									\
> -	mtspr(bookehv_spr, val);						\
> +	mtspr(bookehv_spr, val);					\
>  }									\
> =20
>  #define SHARED_WRAPPER_GET(reg, size)					\

Stray hunk I think.

> @@ -957,10 +957,32 @@ static inline void kvmppc_set_##reg(struct kvm_vcpu=
 *vcpu, u##size val)	\
>  	       vcpu->arch.shared->reg =3D cpu_to_le##size(val);		\
>  }									\
> =20
> +#define SHARED_CACHE_WRAPPER_GET(reg, size)				\
> +static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
> +{									\
> +	if (kvmppc_shared_big_endian(vcpu))				\
> +	       return be##size##_to_cpu(vcpu->arch.shared->reg);	\
> +	else								\
> +	       return le##size##_to_cpu(vcpu->arch.shared->reg);	\
> +}									\
> +
> +#define SHARED_CACHE_WRAPPER_SET(reg, size)				\
> +static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	=
\
> +{									\
> +	if (kvmppc_shared_big_endian(vcpu))				\
> +	       vcpu->arch.shared->reg =3D cpu_to_be##size(val);		\
> +	else								\
> +	       vcpu->arch.shared->reg =3D cpu_to_le##size(val);		\
> +}									\
> +
>  #define SHARED_WRAPPER(reg, size)					\
>  	SHARED_WRAPPER_GET(reg, size)					\
>  	SHARED_WRAPPER_SET(reg, size)					\
> =20
> +#define SHARED_CACHE_WRAPPER(reg, size)					\
> +	SHARED_CACHE_WRAPPER_GET(reg, size)				\
> +	SHARED_CACHE_WRAPPER_SET(reg, size)				\

SHARED_CACHE_WRAPPER that does the same thing as SHARED_WRAPPER.

I know some of the names are a but crufty but it's probably a good time
to rethink them a bit.

KVMPPC_VCPU_SHARED_REG_ACCESSOR or something like that. A few
more keystrokes could help imensely.

> diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/boo=
k3s_hv_p9_entry.c
> index 34f1db212824..34bc0a8a1288 100644
> --- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
> +++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
> @@ -305,7 +305,7 @@ static void switch_mmu_to_guest_radix(struct kvm *kvm=
, struct kvm_vcpu *vcpu, u6
>  	u32 pid;
> =20
>  	lpid =3D nested ? nested->shadow_lpid : kvm->arch.lpid;
> -	pid =3D vcpu->arch.pid;
> +	pid =3D kvmppc_get_pid(vcpu);
> =20
>  	/*
>  	 * Prior memory accesses to host PID Q3 must be completed before we

Could add some accessors for get_lpid / get_guest_id which check for the
correct KVM mode maybe.

Thanks,
Nick
