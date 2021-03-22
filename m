Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B94344541
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 14:16:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3w426rQsz30CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 00:16:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sGmzVSN5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sGmzVSN5; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3w3c6cSkz2yjB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 00:15:39 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so10528947pjc.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=eWbPIX4LvCYaXMETb/NGTke/4oExib4R55S8CtxwLio=;
 b=sGmzVSN5gKsNLzmEtRylSxBhciDbMRFIuW5rYoZFUFfEL0YdJNJmTNj5QF1KE3zzJO
 806h82tnDb2JpKnGMATGhMAy9eCyjkY9+BzFNDtY8VQHDXQpSv7SPtsPz52YIOJ/0nIb
 ZKojgb/dqFbaSP+Y5+4UcnGxiiG8ZrtEl/bHL34HeGpymkyAxwSQ/QN2rqufNn0Fu117
 5telPUFzFTmNH3GNVccSFWXrWaUYztymu6pxt+ApzChBDW4lI7YbIL1n5onWhklWF7jm
 QwSJG4EVb+vd8UNxhQMJLsdFirBU4khJc1iTMr0njX1IUTIVTdZspFxJAjOwXV3K2en4
 bmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=eWbPIX4LvCYaXMETb/NGTke/4oExib4R55S8CtxwLio=;
 b=tSkTRkl+v3/w8a2gdYyVfw+hshtpMTtYZjUEjUns6ICnhudEvt5j1+x92I5oNPzPKu
 7zlNTQDPL6ic5RdkPAuj0CfS9UC3/ihNDBhOpWoN0X2Nb5/k2Rha34tDguy6Cg9FlCwt
 X0pK15dFfXv59z1riYCxQGDowhCebjQho5odMT5Plu+4MhliMRT+vIEe8d8ieFXCq6co
 dPIl8TKi9zfnyAlv39QV98Xhj/hbdkElO7UK5fKkuVBMbxLS7fXbtDQCVncmLQDNnjbY
 JxFwE0zXDwlC0bD1tXsatUw25/D+Dld0M6LkO1NqT/VaT5pzt3wW9kI7QvHJ6qaIfy7U
 SsYg==
X-Gm-Message-State: AOAM5319N0S1MrOzyyCSsHYQigXVthYgpLqDFlVl77aoGDRh3R0nxBOS
 zV+tB8t7ZLvkptHldPLBIx8=
X-Google-Smtp-Source: ABdhPJyWZpOBADRwJFux8ntisJkX9nMzCcb9dlQHwhkoPRs8mSQXwm5J1CRkMd0A/hzI7YhAr7cREg==
X-Received: by 2002:a17:90b:f15:: with SMTP id
 br21mr13469015pjb.234.1616418937853; 
 Mon, 22 Mar 2021 06:15:37 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id m4sm12224419pgu.4.2021.03.22.06.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:15:36 -0700 (PDT)
Date: Mon, 22 Mar 2021 23:15:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 19/41] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
To: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-20-npiggin@gmail.com>
 <b06ebe14-a714-c882-8bdf-ac41de9a8523@ozlabs.ru>
In-Reply-To: <b06ebe14-a714-c882-8bdf-ac41de9a8523@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1616417941.ksskhyvg3t.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Alexey Kardashevskiy's message of March 22, 2021 5:30 pm:
>=20
>=20
> On 06/03/2021 02:06, Nicholas Piggin wrote:
>> In the interest of minimising the amount of code that is run in
>> "real-mode", don't handle hcalls in real mode in the P9 path.
>>=20
>> POWER8 and earlier are much more expensive to exit from HV real mode
>> and switch to host mode, because on those processors HV interrupts get
>> to the hypervisor with the MMU off, and the other threads in the core
>> need to be pulled out of the guest, and SLBs all need to be saved,
>> ERATs invalidated, and host SLB reloaded before the MMU is re-enabled
>> in host mode. Hash guests also require a lot of hcalls to run. The
>> XICS interrupt controller requires hcalls to run.
>>=20
>> By contrast, POWER9 has independent thread switching, and in radix mode
>> the hypervisor is already in a host virtual memory mode when the HV
>> interrupt is taken. Radix + xive guests don't need hcalls to handle
>> interrupts or manage translations.
>>=20
>> So it's much less important to handle hcalls in real mode in P9.
>=20
> So acde25726bc6034b (which added if(kvm_is_radix(vcpu->kvm))return=20
> H_TOO_HARD) can be reverted, pretty much?

Yes. Although that calls attention to the fact I missed doing
a P9 h_random handler in this patch. I'll fix that, then I think
acde2572 could be reverted entirely.

[...]

>>   	} else {
>>   		kvmppc_xive_push_vcpu(vcpu);
>>   		trap =3D kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
>> -		kvmppc_xive_pull_vcpu(vcpu);
>> +		/* H_CEDE has to be handled now, not later */
>> +		/* XICS hcalls must be handled before xive is pulled */
>> +		if (trap =3D=3D BOOK3S_INTERRUPT_SYSCALL &&
>> +		    !(vcpu->arch.shregs.msr & MSR_PR)) {
>> +			unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
>>  =20
>> +			if (req =3D=3D H_CEDE) {
>> +				kvmppc_cede(vcpu);
>> +				kvmppc_xive_cede_vcpu(vcpu); /* may un-cede */
>> +				kvmppc_set_gpr(vcpu, 3, 0);
>> +				trap =3D 0;
>> +			}
>> +			if (req =3D=3D H_EOI || req =3D=3D H_CPPR ||
>=20
> else if (req =3D=3D H_EOI ... ?

Hummm, sure.

[...]

>> +void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu)
>> +{
>> +	void __iomem *esc_vaddr =3D (void __iomem *)vcpu->arch.xive_esc_vaddr;
>> +
>> +	if (!esc_vaddr)
>> +		return;
>> +
>> +	/* we are using XIVE with single escalation */
>> +
>> +	if (vcpu->arch.xive_esc_on) {
>> +		/*
>> +		 * If we still have a pending escalation, abort the cede,
>> +		 * and we must set PQ to 10 rather than 00 so that we don't
>> +		 * potentially end up with two entries for the escalation
>> +		 * interrupt in the XIVE interrupt queue.  In that case
>> +		 * we also don't want to set xive_esc_on to 1 here in
>> +		 * case we race with xive_esc_irq().
>> +		 */
>> +		vcpu->arch.ceded =3D 0;
>> +		/*
>> +		 * The escalation interrupts are special as we don't EOI them.
>> +		 * There is no need to use the load-after-store ordering offset
>> +		 * to set PQ to 10 as we won't use StoreEOI.
>> +		 */
>> +		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_10);
>> +	} else {
>> +		vcpu->arch.xive_esc_on =3D true;
>> +		mb();
>> +		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_00);
>> +	}
>> +	mb();
>=20
>=20
> Uff. Thanks for cut-n-pasting the comments, helped a lot to match this c=20
> to that asm!

Glad it helped.

>> +}
>> +EXPORT_SYMBOL_GPL(kvmppc_xive_cede_vcpu);
>> +
>>   /*
>>    * This is a simple trigger for a generic XIVE IRQ. This must
>>    * only be called for interrupts that support a trigger page
>> @@ -2106,6 +2140,32 @@ static int kvmppc_xive_create(struct kvm_device *=
dev, u32 type)
>>   	return 0;
>>   }
>>  =20
>> +int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
>> +{
>> +	struct kvmppc_vcore *vc =3D vcpu->arch.vcore;
>=20
>=20
> Can a XIVE enabled guest issue these hcalls? Don't we want if=20
> (!kvmppc_xics_enabled(vcpu)) and
>   if (xics_on_xive()) here, as kvmppc_rm_h_xirr() have? Some of these=20
> hcalls do write to XIVE registers but some seem to change=20
> kvmppc_xive_vcpu. Thanks,

Yes I think you're right, good catch. I'm not completely sure about all=20
the xive and xics modes but a guest certainly can make any kind of hcall=20
it likes and we have to sanity check it.

We want to take the hcall here (in replacement of the real mode hcalls)
with the same condition. So it would be:

        if (!kvmppc_xics_enabled(vcpu))
                return H_TOO_HARD;
        if (!xics_on_xive())
		return H_TOO_HARD;
=09
	[ ... process xive_vm_h_xirr / cppr / eoi / etc ]

Right?

Thanks,
Nick

>=20
>=20
>=20
>=20
>> +
>> +	switch (req) {
>> +	case H_XIRR:
>> +		return xive_vm_h_xirr(vcpu);
>> +	case H_CPPR:
>> +		return xive_vm_h_cppr(vcpu, kvmppc_get_gpr(vcpu, 4));
>> +	case H_EOI:
>> +		return xive_vm_h_eoi(vcpu, kvmppc_get_gpr(vcpu, 4));
>> +	case H_IPI:
>> +		return xive_vm_h_ipi(vcpu, kvmppc_get_gpr(vcpu, 4),
>> +					  kvmppc_get_gpr(vcpu, 5));
>> +	case H_IPOLL:
>> +		return xive_vm_h_ipoll(vcpu, kvmppc_get_gpr(vcpu, 4));
>> +	case H_XIRR_X:
>> +		xive_vm_h_xirr(vcpu);
>> +		kvmppc_set_gpr(vcpu, 5, get_tb() + vc->tb_offset);
>> +		return H_SUCCESS;
>> +	}
>> +
>> +	return H_UNSUPPORTED;
>> +}
>> +EXPORT_SYMBOL_GPL(kvmppc_xive_xics_hcall);
>> +
>>   int kvmppc_xive_debug_show_queues(struct seq_file *m, struct kvm_vcpu =
*vcpu)
>>   {
>>   	struct kvmppc_xive_vcpu *xc =3D vcpu->arch.xive_vcpu;
>>=20
>=20
> --=20
> Alexey
>=20
