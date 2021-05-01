Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 497EA3705A3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 06:48:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXGwS2TCFz30Cr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 14:48:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=aYMb0Fic;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aYMb0Fic; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXGw06TVpz2yhr
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 14:48:30 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id v13so58575ple.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 21:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Vve40T7v4v8sPBu5ZCJti+LTma9Wj/95l94bxGIOxwQ=;
 b=aYMb0FicCqqAY2CBZS7UN9m57q78PA4YYBWswN9i8Dcl+uGScrayqt25tJ5fFcpPuJ
 obaahCy/PTXHbZucyrGGwgp4exclGiK5BBWP4NDNSHDq6V1Yp/3SeWwxLW1ks6YU+17T
 Bd+ZffFmu6UZadwthE+KcKaOSL62UWX5/Y6vACFLXOYjyGJktr2U57CkzotFT6kAx3Hk
 20ZbY4HyeDtH+zeGUvsVstVJpVrJOSJ/ySVUZcsX9Q1mEecWbriZ5zTj6+KJCKzWzYGO
 oC4mSbrZ7tpBOjxKQGspOVhP28g8hBTbq7IW9usImHqa0K3cP00z4q6elny2JFsKxpWW
 7djA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Vve40T7v4v8sPBu5ZCJti+LTma9Wj/95l94bxGIOxwQ=;
 b=F/Rq3Ampq7tnKCr+jcklL2LXDD2MNG/MQnyqJaS52O1rSL3w62VN8sx6lyQjF8Edeq
 kfrwcnUuzyFKdlkFMlVmysxLTheWBAFa2qMKBfxXVKgpJ1TUuYYoCpDzNnEgLAwBNRmr
 Ywoi7b94hcL7lydmh033Ih0vnwvskpr9fwk+5Y1sxQXsTcZ8eIVim990opP7/f2lNqeZ
 GSl0DWNbct1Y7nWawP5JOILnsp6L8ccQWzeVFVyP4oElICIudjfuHoJxSPCAJ8PTjRbp
 hPlpdcmMc8oXe9TM9chl+lvDgHggpXbUN64/RHMuvAa8cQ4+xCUm0t8SGWOdlRtkquux
 DpZQ==
X-Gm-Message-State: AOAM5306de+uP4Kx2AGu7J+h1PN7hcpcyS4mN0iyQ32z/ZnEF8abvUY+
 osFDKv3lLfI1l1Nm3v3MmZg=
X-Google-Smtp-Source: ABdhPJyOFe9iA+1R8quHO2lV+HuAcLeerjAKwAuBtc4DTr68hFVUALTTvde42YCpEPiuELD2sHbNtQ==
X-Received: by 2002:a17:90a:4748:: with SMTP id
 y8mr8620782pjg.31.1619844504683; 
 Fri, 30 Apr 2021 21:48:24 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id 23sm3662091pfz.91.2021.04.30.21.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 21:48:24 -0700 (PDT)
Date: Sat, 01 May 2021 14:48:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/2] KVM: PPC: Book3S HV: Sanitise vcpu registers in
 nested path
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210415230948.3563415-1-farosas@linux.ibm.com>
 <20210415230948.3563415-2-farosas@linux.ibm.com>
In-Reply-To: <20210415230948.3563415-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1619844035.sdrijkoiu4.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of April 16, 2021 9:09 am:
> As one of the arguments of the H_ENTER_NESTED hypercall, the nested
> hypervisor (L1) prepares a structure containing the values of various
> hypervisor-privileged registers with which it wants the nested guest
> (L2) to run. Since the nested HV runs in supervisor mode it needs the
> host to write to these registers.
>=20
> To stop a nested HV manipulating this mechanism and using a nested
> guest as a proxy to access a facility that has been made unavailable
> to it, we have a routine that sanitises the values of the HV registers
> before copying them into the nested guest's vcpu struct.
>=20
> However, when coming out of the guest the values are copied as they
> were back into L1 memory, which means that any sanitisation we did
> during guest entry will be exposed to L1 after H_ENTER_NESTED returns.
>=20
> This patch alters this sanitisation to have effect on the vcpu->arch
> registers directly before entering and after exiting the guest,
> leaving the structure that is copied back into L1 unchanged (except
> when we really want L1 to access the value, e.g the Cause bits of
> HFSCR).
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_nested.c | 55 ++++++++++++++++++-----------
>  1 file changed, 34 insertions(+), 21 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index 0cd0e7aad588..270552dd42c5 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -102,8 +102,17 @@ static void save_hv_return_state(struct kvm_vcpu *vc=
pu, int trap,
>  {
>  	struct kvmppc_vcore *vc =3D vcpu->arch.vcore;
> =20
> +	/*
> +	 * When loading the hypervisor-privileged registers to run L2,
> +	 * we might have used bits from L1 state to restrict what the
> +	 * L2 state is allowed to be. Since L1 is not allowed to read
> +	 * the HV registers, do not include these modifications in the
> +	 * return state.
> +	 */
> +	hr->hfscr =3D ((~HFSCR_INTR_CAUSE & hr->hfscr) |
> +		     (HFSCR_INTR_CAUSE & vcpu->arch.hfscr));
> +
>  	hr->dpdes =3D vc->dpdes;
> -	hr->hfscr =3D vcpu->arch.hfscr;
>  	hr->purr =3D vcpu->arch.purr;
>  	hr->spurr =3D vcpu->arch.spurr;
>  	hr->ic =3D vcpu->arch.ic;

The below parts of the patch I have no problem with, I think it's good to=20
be able to restore the hv_guest_state for return, e.g., for cases where=20
the L0 might emulate some HV behaviour transparently it will be useful,
at least.

Thanks,
Nick

> @@ -132,24 +141,7 @@ static void save_hv_return_state(struct kvm_vcpu *vc=
pu, int trap,
>  	}
>  }
> =20
> -static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_stat=
e *hr)
> -{
> -	/*
> -	 * Don't let L1 enable features for L2 which we've disabled for L1,
> -	 * but preserve the interrupt cause field.
> -	 */
> -	hr->hfscr &=3D (HFSCR_INTR_CAUSE | vcpu->arch.hfscr);
> -
> -	/* Don't let data address watchpoint match in hypervisor state */
> -	hr->dawrx0 &=3D ~DAWRX_HYP;
> -	hr->dawrx1 &=3D ~DAWRX_HYP;
> -
> -	/* Don't let completed instruction address breakpt match in HV state */
> -	if ((hr->ciabr & CIABR_PRIV) =3D=3D CIABR_PRIV_HYPER)
> -		hr->ciabr &=3D ~CIABR_PRIV;
> -}
> -
> -static void restore_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state=
 *hr)
> +static void restore_hv_regs(struct kvm_vcpu *vcpu, const struct hv_guest=
_state *hr)
>  {
>  	struct kvmppc_vcore *vc =3D vcpu->arch.vcore;
> =20
> @@ -261,6 +253,27 @@ static int kvmhv_write_guest_state_and_regs(struct k=
vm_vcpu *vcpu,
>  				     sizeof(struct pt_regs));
>  }
> =20
> +static void load_l2_hv_regs(struct kvm_vcpu *vcpu,
> +			    const struct hv_guest_state *l2_hv,
> +			    const struct hv_guest_state *l1_hv)
> +{
> +	restore_hv_regs(vcpu, l2_hv);
> +
> +	/*
> +	 * Don't let L1 enable features for L2 which we've disabled for L1,
> +	 * but preserve the interrupt cause field.
> +	 */
> +	vcpu->arch.hfscr =3D l2_hv->hfscr & (HFSCR_INTR_CAUSE | l1_hv->hfscr);
> +
> +	/* Don't let data address watchpoint match in hypervisor state */
> +	vcpu->arch.dawrx0 =3D l2_hv->dawrx0 & ~DAWRX_HYP;
> +	vcpu->arch.dawrx1 =3D l2_hv->dawrx1 & ~DAWRX_HYP;
> +
> +	/* Don't let completed instruction address breakpt match in HV state */
> +	if ((l2_hv->ciabr & CIABR_PRIV) =3D=3D CIABR_PRIV_HYPER)
> +		vcpu->arch.ciabr =3D l2_hv->ciabr & ~CIABR_PRIV;
> +}
> +
>  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  {
>  	long int err, r;
> @@ -324,8 +337,8 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  	mask =3D LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
>  		LPCR_LPES | LPCR_MER;
>  	lpcr =3D (vc->lpcr & ~mask) | (l2_hv.lpcr & mask);
> -	sanitise_hv_regs(vcpu, &l2_hv);
> -	restore_hv_regs(vcpu, &l2_hv);
> +
> +	load_l2_hv_regs(vcpu, &l2_hv, &saved_l1_hv);
> =20
>  	vcpu->arch.ret =3D RESUME_GUEST;
>  	vcpu->arch.trap =3D 0;
> --=20
> 2.29.2
>=20
>=20
