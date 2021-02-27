Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 994C2326AB6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 01:21:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnRz648cXz3d2v
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 11:21:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iW4ASJaO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iW4ASJaO; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnRyh03PSz3cGP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 11:21:13 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id f8so6151556plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 16:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=xcdCvk++FhL5dTYPMVJw74OPQNVdGiysk10DggN/IM4=;
 b=iW4ASJaO6Kz61l6MKrtPG03YZZMzqz9GZkMK30MfMevzi0onxiLMLsDQoOTK3xS7vx
 hauu8OC9G4T1xmXpQLrGvnqiroGPrsQRxuPUGXJkNCKxcOxufupG0VLQKiX9/AZF8Xdt
 3P8oBRrMQkbX/QXG6IFXrudX9rQ31naCrCwbsb+BvCWYfmkhOGubJxisqYMlgzkirUu/
 DlQRIEz7CCtBW1iOmn9Py/0EKgSV7MCxSEsiU0vfiex5txK/PSbra/54qKQpRAqPAnDW
 uXxxFD97TlIiKzi0Tl8wAQNNHZ9XUhaFNly3lvO8PBPnk/80HRxngE22X/c521mvYT5U
 rPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=xcdCvk++FhL5dTYPMVJw74OPQNVdGiysk10DggN/IM4=;
 b=lFV6rBEPg4jnAf1oV+ihpIZ4vb7khIc3uXxTvgCtb/UXqNAclhb6s70+5+i3dt8cZ9
 3wBbSxOVKQzmHkg1yBtZk/6JFAKezWArYvOsLQRKYDnSBAUvE8iqNjJOp20foYyn4J+v
 aeUlO0re/gsxgSL8GGC3lPTjOCxae6d1eu4vwe4v0rary59NaTrFwgBPEUXLFpxetEDG
 HNywnCwyi3ZFkCWh2L8Iw7kjl7SzwuLIDVkPYQ4j2xYjYBXleTRdiEz6uv5pwzXFzuXU
 Kc7N90GlKsu8PjoBhShTJQ41nL+ltYaW+hwxtYBoh0oEH16N+tHLis3V0KMTnkv4ThDC
 pawg==
X-Gm-Message-State: AOAM530tVEmj8eKbVi8yQdxErE9l1JLvGW4gcjV12lMH61h6kx8hwMES
 KYrVmBC0G6nSHGzfCmkzvV8UgvBPudM=
X-Google-Smtp-Source: ABdhPJwTWBJEocEys2GJoa10jK/ynZ506b1WZDj7SiDXmLGmdaPwY56/ktwAzNOImlVLTfPmBN3+5Q==
X-Received: by 2002:a17:902:f781:b029:e4:419b:e891 with SMTP id
 q1-20020a170902f781b02900e4419be891mr5382178pln.10.1614385270436; 
 Fri, 26 Feb 2021 16:21:10 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id w3sm9769033pjt.24.2021.02.26.16.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 16:21:09 -0800 (PST)
Date: Sat, 27 Feb 2021 10:21:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 23/37] KVM: PPC: Book3S HV P9: Implement the rest of
 the P9 path in C
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-24-npiggin@gmail.com> <87y2fawj4n.fsf@linux.ibm.com>
In-Reply-To: <87y2fawj4n.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1614384320.mv2klmakck.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of February 27, 2021 8:37 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
> Hi, thanks for this. It helped me clarify a bunch of details that I
> haven't understood while reading the asm code.

Yes, me too :)

>> +/*
>> + * void kvmppc_p9_enter_guest(struct vcpu *vcpu);
>> + *
>> + * Enter the guest on a ISAv3.0 or later system where we have exactly
>> + * one vcpu per vcore, and both the host and guest are radix, and threa=
ds
>> + * are set to "indepdent mode".
>> + */
>> +.balign	IFETCH_ALIGN_BYTES
>> +_GLOBAL(kvmppc_p9_enter_guest)
>> +EXPORT_SYMBOL_GPL(kvmppc_p9_enter_guest)
>> +	mflr	r0
>> +	std	r0,PPC_LR_STKOFF(r1)
>> +	stdu	r1,-SFS(r1)
>> +
>> +	std	r1,HSTATE_HOST_R1(r13)
>> +	std	r3,STACK_SLOT_VCPU(r1)
>=20
> The vcpu was stored on the paca previously. I don't get the change,
> could you explain?

The stack is a nicer place to keep things. We only need one place to=20
save the stack, then most things can come from there. There's actually=20
more paca stuff we could move into local variables or onto the stack
too.

It was probably done like this because PR KVM which probably can't=20
access the stack in real mode when running in an LPAR, and came across=20
to the HV code that way. New path doesn't require it.

>> +kvmppc_p9_exit_interrupt:
>> +	std     r1,HSTATE_SCRATCH1(r13)
>> +	std     r3,HSTATE_SCRATCH2(r13)
>> +	ld	r1,HSTATE_HOST_R1(r13)
>> +	ld	r3,STACK_SLOT_VCPU(r1)
>> +
>> +	std	r9,VCPU_CR(r3)
>> +
>> +1:
>> +	std	r11,VCPU_PC(r3)
>> +	std	r12,VCPU_MSR(r3)
>> +
>> +	reg =3D 14
>> +	.rept	18
>> +	std	reg,__VCPU_GPR(reg)(r3)
>> +	reg =3D reg + 1
>> +	.endr
>> +
>> +	/* r1, r3, r9-r13 are saved to vcpu by C code */
>=20
> If we just saved r1 and r3, why don't we put them in the vcpu right now?
> That would avoid having the C code knowing about scratch areas.

Putting it in C avoids having the asm code know about scratch areas.

>> @@ -4429,11 +4432,19 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *v=
cpu)
>>  		else
>>  			r =3D kvmppc_run_vcpu(vcpu);
>>
>> -		if (run->exit_reason =3D=3D KVM_EXIT_PAPR_HCALL &&
>> -		    !(vcpu->arch.shregs.msr & MSR_PR)) {
>> -			trace_kvm_hcall_enter(vcpu);
>> -			r =3D kvmppc_pseries_do_hcall(vcpu);
>> -			trace_kvm_hcall_exit(vcpu, r);
>> +		if (run->exit_reason =3D=3D KVM_EXIT_PAPR_HCALL) {
>> +			if (unlikely(vcpu->arch.shregs.msr & MSR_PR)) {
>> +				/*
>> +				 * Guest userspace executed sc 1, reflect it
>> +				 * back as a privileged program check interrupt.
>> +				 */
>> +				kvmppc_core_queue_program(vcpu, SRR1_PROGPRIV);
>> +				r =3D RESUME_GUEST;
>=20
> This is in conflict with this snippet in kvmppc_handle_exit_hv:
>=20
> 	case BOOK3S_INTERRUPT_SYSCALL:
> 	{
> 		/* hcall - punt to userspace */
> 		int i;
>=20
> 		/* hypercall with MSR_PR has already been handled in rmode,
> 		 * and never reaches here.
> 		 */
>=20
> That function already queues some 0x700s so maybe we could move this one
> in there as well.

I don't think it conflicts, but I think perhaps it should go in the=20
patch which removed the real mode handlers.

kvmppc_handle_exit_hv is used by both HV paths so for now it's a bit=20
neater to try get things into the same state, but we could do this in a=20
later patch perhaps.

>> +	 *
>> +	 * To work around this we put a canary value into the HDSISR before
>> +	 * returning to a guest and then check for this canary when we take a
>> +	 * HDSI. If we find the canary on a HDSI, we know the hardware didn't
>> +	 * update the HDSISR. In this case we return to the guest to retake th=
e
>> +	 * HDSI which should correctly update the HDSISR the second time HDSI
>> +	 * entry.
>> +	 *
>> +	 * Just do this on all p9 processors for now.
>> +	 */
>> +	mtspr(SPRN_HDSISR, HDSISR_CANARY);
>> +
>> +	accumulate_time(vcpu, &vcpu->arch.guest_time);
>> +
>> +	local_paca->kvm_hstate.in_guest =3D KVM_GUEST_MODE_GUEST_HV_FAST;
>> +	kvmppc_p9_enter_guest(vcpu);
>> +	// Radix host and guest means host never runs with guest MMU state
>> +	local_paca->kvm_hstate.in_guest =3D KVM_GUEST_MODE_NONE;
>> +
>> +	accumulate_time(vcpu, &vcpu->arch.rm_intr);
>> +
>> +	/* Get these from r11/12 and paca exsave */
>> +	vcpu->arch.shregs.srr0 =3D mfspr(SPRN_SRR0);
>> +	vcpu->arch.shregs.srr1 =3D mfspr(SPRN_SRR1);
>> +	vcpu->arch.shregs.dar =3D mfspr(SPRN_DAR);
>> +	vcpu->arch.shregs.dsisr =3D mfspr(SPRN_DSISR);
>> +
>> +	trap =3D local_paca->kvm_hstate.scratch0 & ~0x2;
>=20
> Couldn't we return the trap from kvmppc_p9_enter_guest? Seems like a
> nice pattern to have and avoids exposing the IVEC+0x2 magic which is hidd=
en
> in asm already.

I use the 0x2 test in C in a later patch.

The IVEC+0x2 thing might just go away entirely though for new HV path,=20
but we'd still clear it in C on the principle of minimal asm code.

>> +	radix_clear_slb();
>> +
>> +	__mtmsrd(msr, 0);
>=20
> Isn't this the same as mtmsr(msr) ?

Yes. For 64s you can use the __ variant though. We use it in other=20
places in this function with L=3D1 so it doesn't make sense to mix=20
variants.

Thanks,
Nick

>=20
>> +
>> +	accumulate_time(vcpu, &vcpu->arch.rm_exit);
>> +
>> +	end_timing(vcpu);
>> +
>> +	return trap;
>> +}
>> +EXPORT_SYMBOL_GPL(__kvmhv_vcpu_entry_p9);
>=20
> <snip>
>=20
