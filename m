Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3403704E6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 03:59:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXC8Z12smz30Dq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 11:59:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ejGvcc1l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ejGvcc1l; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXC873NHGz2xZ2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 11:58:44 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id q2so319019pfh.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=PUjloBko2uJWnL/aut9o7iR9ZGu1lmZXNStT3ez5uvA=;
 b=ejGvcc1lCo3E1yNKoxKM3T3U4rLFQLniXz2EbyRFwamBCe9oNncSaYZduhhTUC+0AT
 9lQl/0WqQU6WkPNsXoyLmwMRepcssqH8a2o0thl49kSBKhrUJ2XRaHVQGz5hWv7Gl6CU
 pH7bKn9ueIG+Yhg4pQG3un8+egBfEu8oEpqjvbfvT52iEAni+Hwkg0gwoPWouEAwCyod
 ce4kP11R4i9c15q+75nURsPtatCQvfmUJ4Y/+N7Lf0OUqOpWN+YQGrx7kYOba9d2Cuc/
 zvRkla/isCckUfOp67UqTy1Jl1L9TzN5Gen16Rs1lRLcKSWdSGSBzdci0Y9B5x4cC3eb
 p3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=PUjloBko2uJWnL/aut9o7iR9ZGu1lmZXNStT3ez5uvA=;
 b=fAn7vu0K8LJx3oTrSdyTEfne7g27XVdLeKclkCcIkkSG2o9+0hMlFSGfDegYSedHwT
 rI8nn5h/Sc0+9QXa6T8rsQmV4VSZ9r/7eysIOvZLcAdcV7mvOK1StM9/nuQKLuTHzOd2
 GEbGcLLmpP/Zalxs20rmhSIPY0/I79kH3EBJmncXdlv68jaTBVIAXEgh9vHoMF2RC5BQ
 fUCiMMasZ5UcLZrJoKsXFhCoMQ582HE99bhtZQIA+27LMs5M9oQNXHRHRg1TOATZjRda
 mRQJPiaNR8clycsa+DsTe7MRcMnIJyYvlI12bSnRyLR33cq0d0Zf6ZXSFElZWqF18k3K
 XYWA==
X-Gm-Message-State: AOAM531K/KqJSS5lTYQLUp1THJwhdffDTJYBbOhWPeD1d0780fu4UGEI
 KIiQ/hKQ7wIr+ygTHigVoyRWluOKGkcMIw==
X-Google-Smtp-Source: ABdhPJyErRbyiz2Ki9YyqDUAijyPsrd8NKD821VVfcww0y/A5WsEEQbd9vdpCDWqySBgCzxfmvhWLA==
X-Received: by 2002:a63:4c55:: with SMTP id m21mr7559214pgl.251.1619834321749; 
 Fri, 30 Apr 2021 18:58:41 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id v2sm4103598pgs.19.2021.04.30.18.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 18:58:41 -0700 (PDT)
Date: Sat, 01 May 2021 11:58:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/2] KVM: PPC: Book3S HV: Sanitise vcpu registers in
 nested path
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210415230948.3563415-1-farosas@linux.ibm.com>
 <20210415230948.3563415-2-farosas@linux.ibm.com>
In-Reply-To: <20210415230948.3563415-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1619833560.k4eybr40bg.astroid@bobo.none>
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

Do we still have the problem here that hfac interrupts due to bits cleared
by the hfscr sanitisation would have the cause bits returned to the L1,
so in theory it could probe hfscr directly that way? I don't see a good
solution to this except either have the L0 intercept these faults and do
"something" transparent, or return error from H_ENTER_NESTED (which would
also allow trivial probing of the facilities).

Returning an hfac interrupt to a hypervisor that thought it enabled the=20
bit would be strange. But so does appearing to modify the register=20
underneath it and then returning a fault.

I think the sanest thing would actually be to return failure from the=20
hcall.

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
