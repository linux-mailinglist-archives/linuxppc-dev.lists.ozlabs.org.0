Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD603568A0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 12:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFg0F6n0Rz304Q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 20:01:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=icc36pCx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=icc36pCx; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFfzp6Rggz2yyx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 20:01:10 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id a6so5739665pls.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 03:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=k14J4UEGCly6A2HZaJHsSXTboXvBtd+wJtayN8QLCHc=;
 b=icc36pCxjMvtrjtYTYdN5BHrMlrd5hQPVUHvMSa0RbsUJ+1cXP3Z1tYMnsPRonzkgy
 DLIJGrKn7ene8jxQLEn2oMAKt1AK1gROTtJb9UxKIpREOhCkp9WLIgVgp2Cbz6PmzjnO
 2AeKwqBBLNn/IpZHQHGRYt+FvPSP3d480E2+ZhJVtdOzHAIocBb+OB2nECIcD7hCzChN
 Q+3PcUqNrCXHOI4KCyr5cdZo4JwcFppowK6C28/pZKYiqEGOl4vvMUqMXLX6yM1/7ZNG
 sKaqTYElVw80NcszgBsEYLrSIGhuTGuxaFaSdSwh/nVdx+cBKw4kNwu//XVKkvXo/jMz
 cDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=k14J4UEGCly6A2HZaJHsSXTboXvBtd+wJtayN8QLCHc=;
 b=UieDrQq5UCCVAxNyK/evCgZa1zP379HiqgAYEyQjdBFW4AciFXIFRN16vJTf6OBNU2
 eEKt7jtAh7gW9YL6qhYCiRSIHUsJFAKqr6jY+6+couV8vZKBVwmV+IYG436ggoAzg3i/
 NZ5iQ3gJFPbXicvDLqYP7+0BEnYmq8344cunQGRYVwpO68vxBV/F6ZKMX4v4qdO0WXUW
 9Ktw4c3z+P+vBLa0rCRpzyDgsDja+CIuC4Z/dhAC1TQWtdoV9EaycAzY4RrAd1dQlhkt
 bBrobw0I7dhB2sbCZfMrEEnJ6M84lk1kpki02G6cNMwTJgH4zYqv50SE5VDoUV3R4Flf
 rapQ==
X-Gm-Message-State: AOAM530cR4Xk0AEdG3V4dsXrGsTrIR1SfxZFtW0coD/o5871zCxaOUx9
 TsNb/T7f2qtH94Z90dk8D/Q=
X-Google-Smtp-Source: ABdhPJyhx3OTldVphNgD236zXuBRruOYjyvS9C7kO+UCGAqG/CG7ONShw1tiJzT4cX2kv4cobRsXCQ==
X-Received: by 2002:a17:90a:9404:: with SMTP id
 r4mr2465689pjo.64.1617789667022; 
 Wed, 07 Apr 2021 03:01:07 -0700 (PDT)
Received: from localhost ([1.132.148.63])
 by smtp.gmail.com with ESMTPSA id t3sm21245588pfg.176.2021.04.07.03.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 03:01:06 -0700 (PDT)
Date: Wed, 07 Apr 2021 20:01:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: Sanitise vcpu registers in nested
 path
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210406214645.3315819-1-farosas@linux.ibm.com>
In-Reply-To: <20210406214645.3315819-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1617788184.45mdcz310i.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of April 7, 2021 7:46 am:
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

I like this direction better. Now "sanitise" may be the wrong word=20
because you aren't cleaning the data in place any more but copying a=20
cleaned version across.

Which is fine but I wouldn't call it sanitise. Actually I would
prefer if it is just done as part of the copy rather than
copy first and then apply this (explained below in the code).

> ---
> I'm taking another shot at fixing this locally without resorting to
> more complex things such as error handling and feature
> advertisement/negotiation.

That's okay, I think those are orthogonal problems. This won't help if
a nested HV tries to use some HFSCR feature it believes should be
available to a (say) POWER10 processor but got secretly masked away.
But also such negotiation doesn't help with trying to minimise L0 HV
data accessible to guests.

(As before a guest can easily find out many of these things if it is
determined to, but that does not mean I'm strongly against what you
are doing here)

>=20
> Changes since v1:
>=20
> - made the change more generic, not only applies to hfscr anymore;
> - sanitisation is now done directly on the vcpu struct, l2_hv is left unc=
hanged;
>=20
> v1:
>=20
> https://lkml.kernel.org/r/20210305231055.2913892-1-farosas@linux.ibm.com
> ---
>  arch/powerpc/kvm/book3s_hv_nested.c | 33 +++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index 0cd0e7aad588..a60fccb2c4f2 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -132,21 +132,37 @@ static void save_hv_return_state(struct kvm_vcpu *v=
cpu, int trap,
>  	}
>  }
> =20
> -static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_stat=
e *hr)
> +static void sanitise_vcpu_entry_state(struct kvm_vcpu *vcpu,
> +				      const struct hv_guest_state *l2_hv,
> +				      const struct hv_guest_state *l1_hv)
>  {
>  	/*
>  	 * Don't let L1 enable features for L2 which we've disabled for L1,
>  	 * but preserve the interrupt cause field.
>  	 */
> -	hr->hfscr &=3D (HFSCR_INTR_CAUSE | vcpu->arch.hfscr);
> +	vcpu->arch.hfscr =3D l2_hv->hfscr & (HFSCR_INTR_CAUSE | l1_hv->hfscr);
> =20
>  	/* Don't let data address watchpoint match in hypervisor state */
> -	hr->dawrx0 &=3D ~DAWRX_HYP;
> -	hr->dawrx1 &=3D ~DAWRX_HYP;
> +	vcpu->arch.dawrx0 =3D l2_hv->dawrx0 & ~DAWRX_HYP;
> +	vcpu->arch.dawrx1 =3D l2_hv->dawrx1 & ~DAWRX_HYP;
> =20
>  	/* Don't let completed instruction address breakpt match in HV state */
> -	if ((hr->ciabr & CIABR_PRIV) =3D=3D CIABR_PRIV_HYPER)
> -		hr->ciabr &=3D ~CIABR_PRIV;
> +	if ((l2_hv->ciabr & CIABR_PRIV) =3D=3D CIABR_PRIV_HYPER)
> +		vcpu->arch.ciabr =3D l2_hv->ciabr & ~CIABR_PRIV;
> +}
> +
> +
> +/*
> + * During sanitise_vcpu_entry_state() we might have used bits from L1
> + * state to restrict what the L2 state is allowed to be. Since L1 is
> + * not allowed to read the HV registers, do not include these
> + * modifications in the return state.
> + */
> +static void sanitise_vcpu_return_state(struct kvm_vcpu *vcpu,
> +				       const struct hv_guest_state *l2_hv)
> +{
> +	vcpu->arch.hfscr =3D ((~HFSCR_INTR_CAUSE & l2_hv->hfscr) |
> +			(HFSCR_INTR_CAUSE & vcpu->arch.hfscr));
>  }
> =20
>  static void restore_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state=
 *hr)
> @@ -324,9 +340,10 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  	mask =3D LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
>  		LPCR_LPES | LPCR_MER;
>  	lpcr =3D (vc->lpcr & ~mask) | (l2_hv.lpcr & mask);
> -	sanitise_hv_regs(vcpu, &l2_hv);
>  	restore_hv_regs(vcpu, &l2_hv);
> =20
> +	sanitise_vcpu_entry_state(vcpu, &l2_hv, &saved_l1_hv);

So instead of doing this, can we just have one function that does
load_hv_regs_for_l2()?

> +
>  	vcpu->arch.ret =3D RESUME_GUEST;
>  	vcpu->arch.trap =3D 0;
>  	do {
> @@ -338,6 +355,8 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  		r =3D kvmhv_run_single_vcpu(vcpu, hdec_exp, lpcr);
>  	} while (is_kvmppc_resume_guest(r));
> =20
> +	sanitise_vcpu_return_state(vcpu, &l2_hv);

And this could be done in save_hv_return_state().

I think?

Question about HFSCR. Is it possible for some interrupt cause bit
reaching the nested hypervisor for a bit that we thought we had
enabled but was secretly masked off? I.e., do we have to filter
HFSCR causes according to the facilities we secretly disabled?

Thanks,
Nick
