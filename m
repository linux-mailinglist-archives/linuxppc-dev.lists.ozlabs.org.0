Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4CA9275BC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 14:10:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PVAGHKMm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFFpz286nz3fnr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 22:10:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PVAGHKMm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFFpH2G5Rz3cVb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 22:10:13 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7065a2f4573so395019b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jul 2024 05:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720095012; x=1720699812; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS8912iTY0xW9afn3Y1NFj6von6GR2I+TxZx9FsjCOo=;
        b=PVAGHKMmWazd9aU8B9FV12N+jb49ijndidJLOr8y/qnZYF1VfOUVatxW8RowTKnnB6
         2BDl274zt7G07oIr9KjHprWx+4A3+TFdxXxQaVmpqbuwddopfD/u+zsSWfyvzZFOetDR
         ffIIySffNgSIciRTpB5BeuT9319oikLU2END1t6gWYABCmhif2HVWDA+Vgl8364bf/+b
         ZMtunlD3rlC6w2vX5LkGyZV+23fej6xuSm5FNKli4GbpLxxdiU79dVG20AS25IEYgkSV
         P1gxTVSxxEe7oRAge78PduSqzCwKltAKv01S6CZJmwAh76lrbKxHI2n2GqwVOedcMDES
         DSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720095012; x=1720699812;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KS8912iTY0xW9afn3Y1NFj6von6GR2I+TxZx9FsjCOo=;
        b=DvrpzCgP9LLV3++OMHntd/IlBj3rPGVUXTP0bimWfHnR3yN5IQf1zad+ot1TkrpFqw
         Cf15EojWU93teaAwSQ8U5SmXlfDt7wiBw6ZhQBxPHibIzqkXMBYSjM86vuPNAVAOv4FU
         ITL4qPIiGhX3ri0Rq4EWzj2zvtSI/EWD4p1Au7ahA/F7Z3wK78hkazTxvy3Okkbd54q3
         jiRXb5Grbl+1FbzT0EtqHJ6FnosNAv0+xrMSr8kw0kmwzAQ5+LCwF7ZGQx3WqxtnN4/y
         ZRY5dl8pGZY5sBokDuZeM7lFluhZ9l84ycGUHj2xLJ/6MpbAI6FQi4wNiFZtR8u6Pp3S
         EHwQ==
X-Gm-Message-State: AOJu0Yxs2TgWBhNJEroeAzzm9QKI1eXkrjEEYj9qNQSU/F6d3M2rEpRk
	P8OV3Hg2/I+/xWMfORYTRb+mqA1D9u01K2pbgbWKfyXoPxmE+8Kc
X-Google-Smtp-Source: AGHT+IGcWrJqtZ43V+s8BIoH/VOJWFVfMjaAJrAMjYxsFFcshcsaLm5j7uSV+h6i+eHEuIvhwXgutA==
X-Received: by 2002:a05:6a20:6a11:b0:1be:cbe9:f765 with SMTP id adf61e73a8af0-1c0cc73ea5dmr1319914637.18.1720095012149;
        Thu, 04 Jul 2024 05:10:12 -0700 (PDT)
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c999e13eedsm758458a91.1.2024.07.04.05.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 05:10:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jul 2024 22:10:05 +1000
Message-Id: <D2GQSGNWNGX4.2R8TH3M64POGJ@gmail.com>
Subject: Re: [RFC PATCH 2/2] arch/powerpc/kvm: Fix doorbells for nested KVM
 guests on PowerNV
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Gautam Menghani" <gautam@linux.ibm.com>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>, <naveen.n.rao@linux.ibm.com>
X-Mailer: aerc 0.17.0
References: <20240627180342.110238-1-gautam@linux.ibm.com>
 <20240627180342.110238-3-gautam@linux.ibm.com>
In-Reply-To: <20240627180342.110238-3-gautam@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jun 28, 2024 at 4:03 AM AEST, Gautam Menghani wrote:
> commit 6398326b9ba1("KVM: PPC: Book3S HV P9: Stop using vc->dpdes")
> introduced an optimization to use only vcpu->doorbell_request for SMT
> emulation for Power9 and above guests, but the code for nested guests=20
> still relies on the old way of handling doorbells, due to which an L2
> guest cannot be booted with XICS with SMT>1. The command to repro
> this issue is:
>
> qemu-system-ppc64 \
> 	-drive file=3Drhel.qcow2,format=3Dqcow2 \
> 	-m 20G \
> 	-smp 8,cores=3D1,threads=3D8 \
> 	-cpu  host \
> 	-nographic \
> 	-machine pseries,ic-mode=3Dxics -accel kvm
>
> Fix the plumbing to utilize vcpu->doorbell_request instead of vcore->dpde=
s=20
> on P9 and above.
>
> Fixes: 6398326b9ba1 ("KVM: PPC: Book3S HV P9: Stop using vc->dpdes")
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c        |  9 ++++++++-
>  arch/powerpc/kvm/book3s_hv_nested.c | 20 ++++++++++++++++----
>  2 files changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index cea28ac05923..0586fa636707 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4178,6 +4178,9 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vc=
pu *vcpu, u64 time_limit, uns
>  	}
>  	hvregs.hdec_expiry =3D time_limit;
> =20
> +	// clear doorbell bit as hvregs already has the info
> +	vcpu->arch.doorbell_request =3D 0;
> +
>  	/*
>  	 * When setting DEC, we must always deal with irq_work_raise
>  	 * via NMI vs setting DEC. The problem occurs right as we
> @@ -4694,6 +4697,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u6=
4 time_limit,
>  	struct kvm_nested_guest *nested =3D vcpu->arch.nested;
>  	unsigned long flags;
>  	u64 tb;
> +	bool doorbell_pending;
> =20
>  	trace_kvmppc_run_vcpu_enter(vcpu);
> =20
> @@ -4752,6 +4756,9 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u6=
4 time_limit,
>  	 */
>  	smp_mb();
> =20
> +	doorbell_pending =3D !cpu_has_feature(CPU_FTR_ARCH_300) &&
> +				vcpu->arch.doorbell_request;

Hmm... is the feature test flipped here?

> +
>  	if (!nested) {
>  		kvmppc_core_prepare_to_enter(vcpu);
>  		if (test_bit(BOOK3S_IRQPRIO_EXTERNAL,
> @@ -4769,7 +4776,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u6=
4 time_limit,
>  				lpcr |=3D LPCR_MER;
>  		}
>  	} else if (vcpu->arch.pending_exceptions ||
> -		   vcpu->arch.doorbell_request ||
> +		   doorbell_pending ||
>  		   xive_interrupt_pending(vcpu)) {
>  		vcpu->arch.ret =3D RESUME_HOST;
>  		goto out;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index 05f5220960c6..b34eefa6b268 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -32,7 +32,10 @@ void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct =
hv_guest_state *hr)
>  	struct kvmppc_vcore *vc =3D vcpu->arch.vcore;
> =20
>  	hr->pcr =3D vc->pcr | PCR_MASK;
> -	hr->dpdes =3D vc->dpdes;
> +	if (cpu_has_feature(CPU_FTR_ARCH_300))
> +		hr->dpdes =3D vcpu->arch.doorbell_request;
> +	else
> +		hr->dpdes =3D vc->dpdes;
>  	hr->hfscr =3D vcpu->arch.hfscr;
>  	hr->tb_offset =3D vc->tb_offset;
>  	hr->dawr0 =3D vcpu->arch.dawr0;

Great find.

Nested is all POWER9 and later only, so I think you can just
change to using doorbell_request always.

And probably don't have to do anything for book3s_hv.c unless
I'm mistaken about the feature test.

Thanks,
Nick

> @@ -105,7 +108,10 @@ static void save_hv_return_state(struct kvm_vcpu *vc=
pu,
>  {
>  	struct kvmppc_vcore *vc =3D vcpu->arch.vcore;
> =20
> -	hr->dpdes =3D vc->dpdes;
> +	if (cpu_has_feature(CPU_FTR_ARCH_300))
> +		hr->dpdes =3D vcpu->arch.doorbell_request;
> +	else
> +		hr->dpdes =3D vc->dpdes;
>  	hr->purr =3D vcpu->arch.purr;
>  	hr->spurr =3D vcpu->arch.spurr;
>  	hr->ic =3D vcpu->arch.ic;
> @@ -143,7 +149,10 @@ static void restore_hv_regs(struct kvm_vcpu *vcpu, c=
onst struct hv_guest_state *
>  	struct kvmppc_vcore *vc =3D vcpu->arch.vcore;
> =20
>  	vc->pcr =3D hr->pcr | PCR_MASK;
> -	vc->dpdes =3D hr->dpdes;
> +	if (cpu_has_feature(CPU_FTR_ARCH_300))
> +		vcpu->arch.doorbell_request =3D hr->dpdes;
> +	else
> +		vc->dpdes =3D hr->dpdes;
>  	vcpu->arch.hfscr =3D hr->hfscr;
>  	vcpu->arch.dawr0 =3D hr->dawr0;
>  	vcpu->arch.dawrx0 =3D hr->dawrx0;
> @@ -170,7 +179,10 @@ void kvmhv_restore_hv_return_state(struct kvm_vcpu *=
vcpu,
>  {
>  	struct kvmppc_vcore *vc =3D vcpu->arch.vcore;
> =20
> -	vc->dpdes =3D hr->dpdes;
> +	if (cpu_has_feature(CPU_FTR_ARCH_300) && !vcpu->arch.doorbell_request)
> +		vcpu->arch.doorbell_request =3D hr->dpdes;
> +	else
> +		vc->dpdes =3D hr->dpdes;
>  	vcpu->arch.hfscr =3D hr->hfscr;
>  	vcpu->arch.purr =3D hr->purr;
>  	vcpu->arch.spurr =3D hr->spurr;

