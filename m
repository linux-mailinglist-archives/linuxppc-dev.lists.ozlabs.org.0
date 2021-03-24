Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6784B346E99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 02:22:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4r7c3GZSz3bp9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 12:22:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KT1Ptad8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KT1Ptad8; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4r783fhSz301k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 12:21:55 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 mz6-20020a17090b3786b02900c16cb41d63so317421pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 18:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Z2CWfinaAHstYPqMDgE5u2Q2GsiyYe8USsS+vefVmGI=;
 b=KT1Ptad8mAY8f1WSun87sGoWAvYozGZM05ghixwh3uaTrThY8bvw5dnn5xT9KwC9Yy
 WJVzmb/NNIofqCOLZfoIhlk1bomjw8ECKcfvhC3DdW7obQCUNbC3vjggZrJdRGRKnM3d
 kUTycZBf+YbbZMg6E/eFEehVDr/u8XFTSxJ7EkMTx51zQb2bVwJ1FBU4CVy8FnjufCUT
 hsVW+J/1vbLz5w1eEzdjw9V8xHkzk/A7OfvY8MxQ+7ehmlIsBy1bctlnKn0kKmV0qpq+
 B9KYxmbNDU3hHpAgqMs0FW7uJH4pZbkGd0NypoixjzXuNmx12nd25+GWG82TBa0X+aL1
 yPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Z2CWfinaAHstYPqMDgE5u2Q2GsiyYe8USsS+vefVmGI=;
 b=cI/G6Ef0eBc6s5HtTuYPFWToqKrE/9QD4bvhUkd1iXXoTEg0V+/gWhWhf1ActwqAEm
 eRONG/vvIUGM4awz0a8MAcpaZDxfj8CXp8lFh126oMX8tYVvecQx9aQy2tG4zflQpfTQ
 hH8uayzmlQz41fcib/l0SRWW7CwDQJ/13FzyYoTkou9M8snk8Po/7B9tBNyTDUhzjOlF
 /XHMVcBVJDPFjVx0Dbe8yWZT1dH4/WiPp0EjVBbKlkrux81bWRi+baG4OoexKiM+DmoP
 l14VlaYIRuarJNKSS/N76KqtpmF4wsIl6W4NNEbbLVL50T16Fml1yEbWb2CprM15QY5F
 ylSA==
X-Gm-Message-State: AOAM531fxO2khgSNBkE4Abe4fmpDWJdf8oSvHKldR4s0Qz+0EPjm8Pda
 9JTf1ZbLZ7dqS5EGTGbtQW0=
X-Google-Smtp-Source: ABdhPJxZ8uKsylT3ZfsVBgV5HHASPqu1IOPSAKj2U73WHIqXZm6lm+YDXGat+vPY0nGvbaDSy5arTQ==
X-Received: by 2002:a17:90a:e516:: with SMTP id
 t22mr821981pjy.39.1616548911221; 
 Tue, 23 Mar 2021 18:21:51 -0700 (PDT)
Received: from localhost (193-116-197-97.tpgi.com.au. [193.116.197.97])
 by smtp.gmail.com with ESMTPSA id z9sm351290pgf.87.2021.03.23.18.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 18:21:50 -0700 (PDT)
Date: Wed, 24 Mar 2021 11:21:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 22/46] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-23-npiggin@gmail.com>
 <5b1361d9-723e-1868-efb0-ab0abf217d92@kaod.org>
In-Reply-To: <5b1361d9-723e-1868-efb0-ab0abf217d92@kaod.org>
MIME-Version: 1.0
Message-Id: <1616548826.auasjz00eg.astroid@bobo.none>
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

Excerpts from C=C3=A9dric Le Goater's message of March 23, 2021 11:23 pm:
> On 3/23/21 2:02 AM, Nicholas Piggin wrote:
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
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/kvm_ppc.h      |  5 ++
>>  arch/powerpc/kvm/book3s_hv.c            | 57 ++++++++++++++++----
>>  arch/powerpc/kvm/book3s_hv_rmhandlers.S |  5 ++
>>  arch/powerpc/kvm/book3s_xive.c          | 70 +++++++++++++++++++++++++
>>  4 files changed, 127 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/a=
sm/kvm_ppc.h
>> index 73b1ca5a6471..db6646c2ade2 100644
>> --- a/arch/powerpc/include/asm/kvm_ppc.h
>> +++ b/arch/powerpc/include/asm/kvm_ppc.h
>> @@ -607,6 +607,7 @@ extern void kvmppc_free_pimap(struct kvm *kvm);
>>  extern int kvmppc_xics_rm_complete(struct kvm_vcpu *vcpu, u32 hcall);
>>  extern void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu);
>>  extern int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd);
>> +extern int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req);
>>  extern u64 kvmppc_xics_get_icp(struct kvm_vcpu *vcpu);
>>  extern int kvmppc_xics_set_icp(struct kvm_vcpu *vcpu, u64 icpval);
>>  extern int kvmppc_xics_connect_vcpu(struct kvm_device *dev,
>> @@ -639,6 +640,8 @@ static inline int kvmppc_xics_enabled(struct kvm_vcp=
u *vcpu)
>>  static inline void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu) { }
>>  static inline int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd)
>>  	{ return 0; }
>> +static inline int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req=
)
>> +	{ return 0; }
>>  #endif
>> =20
>>  #ifdef CONFIG_KVM_XIVE
>> @@ -673,6 +676,7 @@ extern int kvmppc_xive_set_irq(struct kvm *kvm, int =
irq_source_id, u32 irq,
>>  			       int level, bool line_status);
>>  extern void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu);
>>  extern void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu);
>> +extern void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu);
>> =20
>>  static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>>  {
>> @@ -714,6 +718,7 @@ static inline int kvmppc_xive_set_irq(struct kvm *kv=
m, int irq_source_id, u32 ir
>>  				      int level, bool line_status) { return -ENODEV; }
>>  static inline void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu) { }
>>  static inline void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu) { }
>> +static inline void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu) { }
>> =20
>>  static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>>  	{ return 0; }
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index fa7614c37e08..17739aaee3d8 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -1142,12 +1142,13 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcp=
u)
>>  }
>> =20
>>  /*
>> - * Handle H_CEDE in the nested virtualization case where we haven't
>> - * called the real-mode hcall handlers in book3s_hv_rmhandlers.S.
>> + * Handle H_CEDE in the P9 path where we don't call the real-mode hcall
>> + * handlers in book3s_hv_rmhandlers.S.
>> + *
>>   * This has to be done early, not in kvmppc_pseries_do_hcall(), so
>>   * that the cede logic in kvmppc_run_single_vcpu() works properly.
>>   */
>> -static void kvmppc_nested_cede(struct kvm_vcpu *vcpu)
>> +static void kvmppc_cede(struct kvm_vcpu *vcpu)
>>  {
>>  	vcpu->arch.shregs.msr |=3D MSR_EE;
>>  	vcpu->arch.ceded =3D 1;
>> @@ -1403,9 +1404,15 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu =
*vcpu,
>>  		/* hcall - punt to userspace */
>>  		int i;
>> =20
>> -		/* hypercall with MSR_PR has already been handled in rmode,
>> -		 * and never reaches here.
>> -		 */
>> +		if (unlikely(vcpu->arch.shregs.msr & MSR_PR)) {
>> +			/*
>> +			 * Guest userspace executed sc 1, reflect it back as a
>> +			 * privileged program check interrupt.
>> +			 */
>> +			kvmppc_core_queue_program(vcpu, SRR1_PROGPRIV);
>> +			r =3D RESUME_GUEST;
>> +			break;
>> +		}
>> =20
>>  		run->papr_hcall.nr =3D kvmppc_get_gpr(vcpu, 3);
>>  		for (i =3D 0; i < 9; ++i)
>> @@ -3663,6 +3670,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_v=
cpu *vcpu, u64 time_limit,
>>  	return trap;
>>  }
>> =20
>> +static inline bool hcall_is_xics(unsigned long req)
>> +{
>> +	return (req =3D=3D H_EOI || req =3D=3D H_CPPR || req =3D=3D H_IPI ||
>> +		req =3D=3D H_IPOLL || req =3D=3D H_XIRR || req =3D=3D H_XIRR_X);
>> +}
>> +
>>  /*
>>   * Virtual-mode guest entry for POWER9 and later when the host and
>>   * guest are both using the radix MMU.  The LPIDR has already been set.
>> @@ -3774,15 +3787,36 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu =
*vcpu, u64 time_limit,
>>  		/* H_CEDE has to be handled now, not later */
>>  		if (trap =3D=3D BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
>>  		    kvmppc_get_gpr(vcpu, 3) =3D=3D H_CEDE) {
>> -			kvmppc_nested_cede(vcpu);
>> +			kvmppc_cede(vcpu);
>>  			kvmppc_set_gpr(vcpu, 3, 0);
>>  			trap =3D 0;
>>  		}
>>  	} else {
>>  		kvmppc_xive_push_vcpu(vcpu);
>>  		trap =3D kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
>> +		if (trap =3D=3D BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
>> +		    !(vcpu->arch.shregs.msr & MSR_PR)) {
>> +			unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
>> +
>> +			/* H_CEDE has to be handled now, not later */
>> +			if (req =3D=3D H_CEDE) {
>> +				kvmppc_cede(vcpu);
>> +				kvmppc_xive_cede_vcpu(vcpu); /* may un-cede */> +				kvmppc_set_gpr=
(vcpu, 3, 0);
>> +				trap =3D 0;
>> +
>> +			/* XICS hcalls must be handled before xive is pulled */
>> +			} else if (hcall_is_xics(req)) {
>> +				int ret;
>> +
>> +				ret =3D kvmppc_xive_xics_hcall(vcpu, req);
>> +				if (ret !=3D H_TOO_HARD) {
>> +					kvmppc_set_gpr(vcpu, 3, ret);
>> +					trap =3D 0;
>> +				}
>> +			}
>> +		}
>>  		kvmppc_xive_pull_vcpu(vcpu);
>> -
>>  	}
>> =20
>>  	vcpu->arch.slb_max =3D 0;
>> @@ -4442,8 +4476,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vc=
pu)
>>  		else
>>  			r =3D kvmppc_run_vcpu(vcpu);
>> =20
>> -		if (run->exit_reason =3D=3D KVM_EXIT_PAPR_HCALL &&
>> -		    !(vcpu->arch.shregs.msr & MSR_PR)) {
>> +		if (run->exit_reason =3D=3D KVM_EXIT_PAPR_HCALL) {
>> +			if (WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_PR)) {
>> +				r =3D RESUME_GUEST;
>> +				continue;
>> +			}
>>  			trace_kvm_hcall_enter(vcpu);
>>  			r =3D kvmppc_pseries_do_hcall(vcpu);
>>  			trace_kvm_hcall_exit(vcpu, r);
>> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/=
book3s_hv_rmhandlers.S
>> index c11597f815e4..2d0d14ed1d92 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> @@ -1397,9 +1397,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>  	mr	r4,r9
>>  	bge	fast_guest_return
>>  2:
>> +	/* If we came in through the P9 short path, no real mode hcalls */
>> +	lwz	r0, STACK_SLOT_SHORT_PATH(r1)
>> +	cmpwi	r0, 0
>> +	bne	no_try_real
>>  	/* See if this is an hcall we can handle in real mode */
>>  	cmpwi	r12,BOOK3S_INTERRUPT_SYSCALL
>>  	beq	hcall_try_real_mode
>> +no_try_real:
>> =20
>>  	/* Hypervisor doorbell - exit only if host IPI flag set */
>>  	cmpwi	r12, BOOK3S_INTERRUPT_H_DOORBELL
>> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xi=
ve.c
>> index 741bf1f4387a..dcc07ceaf5ca 100644
>> --- a/arch/powerpc/kvm/book3s_xive.c
>> +++ b/arch/powerpc/kvm/book3s_xive.c
>> @@ -158,6 +158,40 @@ void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu)
>>  }
>>  EXPORT_SYMBOL_GPL(kvmppc_xive_pull_vcpu);
>> =20
>> +void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu)
>=20
> kvmppc_xive_rearm_escalation() may be ? It has more meaning to me. =20

Sure whatever you prefer.

>=20
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
>> +		vcpu->arch.xive_esc_on =3D true;> +		mb();
>> +		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_00);
>> +	}
>> +	mb();
>> +}
>> +EXPORT_SYMBOL_GPL(kvmppc_xive_cede_vcpu);
>> +
>>  /*
>>   * This is a simple trigger for a generic XIVE IRQ. This must
>>   * only be called for interrupts that support a trigger page
>> @@ -2106,6 +2140,42 @@ static int kvmppc_xive_create(struct kvm_device *=
dev, u32 type)
>>  	return 0;
>>  }
>> =20
>> +int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
>> +{
>> +	struct kvmppc_vcore *vc =3D vcpu->arch.vcore;
>> +
>> +	/*
>> +	 * This test covers the case in which a vCPU does XICS hcalls without
>> +	 * QEMU having connected the vCPU to a XICS ICP. The ICP is the KVM
>> +	 * XICS device on P8 or XICS-on-XIVE on P9. It catches QEMU errors whe=
n
>> +	 * the interrupt mode is negotiated, we don't want the OS to do XICS
>> +	 * hcalls after having negotiated the XIVE interrupt mode.
>> +	 */
>=20
> I think a comment like the following should be enough.
>=20
>   The VM should have configured XICS mode before doing XICS hcalls.

I'll change it.

> No need to resend for that though.
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,
Nick

