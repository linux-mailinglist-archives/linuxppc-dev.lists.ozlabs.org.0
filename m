Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1FF33FB5C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 23:42:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F14sf2DCRz3bsy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 09:42:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hIclouWk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hIclouWk; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F14s96HkXz302X
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 09:41:48 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id s21so1902262pjq.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 15:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=5qKr02K2bVnhllOe/YqQUhLLbS1J4T73+XfowCUwmbA=;
 b=hIclouWkKwCuj4QwesNd+0mocymmv26Je+stRMT6oAgJTH+bZWM+YIuJsnqHB4wOyG
 elC1UUrOANGredWQM0wtBWuepfloL/NSZFOnYs7HBUrvKvk85mBnh/PhZ81imOxWYOkb
 kbYS452r+i6BKM0pocqzGpeGxQVwGjD8LS7bFA5nDAm1ltMChq2VwQOZbPRQdn0Q4P9o
 kxjIdZ+wr0Je/UxfsgEXSgI+s+ZigjB1SkJCP0/nTNNgBYI+eTnea1QoWLxOdZp0KDwq
 zyxurQDoybtslzgc7KBXO0BsUBo88PCPF9tjJKxhkL3NACWK/+1ScD+1RztGldCye2P+
 apIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5qKr02K2bVnhllOe/YqQUhLLbS1J4T73+XfowCUwmbA=;
 b=Ta1tYFlwFRD5LZ0dk11PqAA6Lw0MoCbgRa6jAWgZg6dJ1aDUiGNIE39AfVbp1S7Crl
 0a2L7N2C58Lp/f5yOJLqYe6hWyHRyOY9ht1ZpIwEhSBRPViK6WLCRDJIuHL0Ix9fa+rN
 +48j+ioUkShBmwIGMlKeIHzaRF6jS/40v6j5wQq5KzQKRv2z1/hiNKmSYyInVN8xwyK+
 SWluVH0NWEq2CEbVIDeBcu1/6eIp+ReN+LVyrI2XimXD4b43BugbK2gI3Zo0cDmdCLJc
 G4VbmVQpquCnDKGwxX4n/V+semfsBIJtpm++9MSemhfrukNmu59iYlkF+wbh/NGij6a2
 51qA==
X-Gm-Message-State: AOAM532kWP7nFaLjLfcfl4rnY8eX7CM85G2l0FKv86pcB99LdiCgdiep
 4VQ3ds+8Pezwu/GRFwr5tuE=
X-Google-Smtp-Source: ABdhPJx6Vv1i7uXKO5DM5+94Xn4Njg4d8rF3eAIABwO7ZB5MAjgOxtvQuzZ3FRljqxpTAXAeG0/Lpg==
X-Received: by 2002:a17:902:9894:b029:e5:ce48:5808 with SMTP id
 s20-20020a1709029894b02900e5ce485808mr6471434plp.31.1616020903609; 
 Wed, 17 Mar 2021 15:41:43 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id z1sm116831pfn.127.2021.03.17.15.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 15:41:42 -0700 (PDT)
Date: Thu, 18 Mar 2021 08:41:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 19/41] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-20-npiggin@gmail.com> <87o8fh21iq.fsf@linux.ibm.com>
In-Reply-To: <87o8fh21iq.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1616019796.miv3so0mq8.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of March 18, 2021 2:22 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> In the interest of minimising the amount of code that is run in
>> "real-mode", don't handle hcalls in real mode in the P9 path.
>>
>> POWER8 and earlier are much more expensive to exit from HV real mode
>> and switch to host mode, because on those processors HV interrupts get
>> to the hypervisor with the MMU off, and the other threads in the core
>> need to be pulled out of the guest, and SLBs all need to be saved,
>> ERATs invalidated, and host SLB reloaded before the MMU is re-enabled
>> in host mode. Hash guests also require a lot of hcalls to run. The
>> XICS interrupt controller requires hcalls to run.
>>
>> By contrast, POWER9 has independent thread switching, and in radix mode
>> the hypervisor is already in a host virtual memory mode when the HV
>> interrupt is taken. Radix + xive guests don't need hcalls to handle
>> interrupts or manage translations.
>>
>> So it's much less important to handle hcalls in real mode in P9.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>=20
> <snip>
>=20
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 497f216ad724..1f2ba8955c6a 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -1147,7 +1147,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>>   * This has to be done early, not in kvmppc_pseries_do_hcall(), so
>>   * that the cede logic in kvmppc_run_single_vcpu() works properly.
>>   */
>> -static void kvmppc_nested_cede(struct kvm_vcpu *vcpu)
>> +static void kvmppc_cede(struct kvm_vcpu *vcpu)
>=20
> The comment above needs to be updated I think.
>=20
>>  {
>>  	vcpu->arch.shregs.msr |=3D MSR_EE;
>>  	vcpu->arch.ceded =3D 1;
>> @@ -1403,9 +1403,15 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu =
*vcpu,
>>  		/* hcall - punt to userspace */
>>  		int i;
>>
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
>>
>>  		run->papr_hcall.nr =3D kvmppc_get_gpr(vcpu, 3);
>>  		for (i =3D 0; i < 9; ++i)
>> @@ -3740,15 +3746,36 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu =
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
>> -		kvmppc_xive_pull_vcpu(vcpu);
>> +		/* H_CEDE has to be handled now, not later */
>> +		/* XICS hcalls must be handled before xive is pulled */
>> +		if (trap =3D=3D BOOK3S_INTERRUPT_SYSCALL &&
>> +		    !(vcpu->arch.shregs.msr & MSR_PR)) {
>> +			unsigned long req =3D kvmppc_get_gpr(vcpu, 3);
>>
>> +			if (req =3D=3D H_CEDE) {
>> +				kvmppc_cede(vcpu);
>> +				kvmppc_xive_cede_vcpu(vcpu); /* may un-cede */
>> +				kvmppc_set_gpr(vcpu, 3, 0);
>> +				trap =3D 0;
>> +			}
>> +			if (req =3D=3D H_EOI || req =3D=3D H_CPPR ||
>> +			    req =3D=3D H_IPI || req =3D=3D H_IPOLL ||
>> +			    req =3D=3D H_XIRR || req =3D=3D H_XIRR_X) {
>> +				unsigned long ret;
>> +
>> +				ret =3D kvmppc_xive_xics_hcall(vcpu, req);
>> +				kvmppc_set_gpr(vcpu, 3, ret);
>> +				trap =3D 0;
>> +			}
>> +		}
>=20
> I tried running L2 with xive=3Doff and this code slows down the boot
> considerably. I think we're missing a !vcpu->arch.nested in the
> conditional.

You might be right, the real mode handlers never run if nested is set
so none of these should run I think.

>=20
> This may also be missing these checks from kvmppc_pseries_do_hcall:
>=20
> 		if (kvmppc_xics_enabled(vcpu)) {
> 			if (xics_on_xive()) {
> 				ret =3D H_NOT_AVAILABLE;
> 				return RESUME_GUEST;
> 			}
> 			ret =3D kvmppc_xics_hcall(vcpu, req);
>                         (...)

Well this is the formerly real-mode part of the hcall, whereas=20
pseries_do_hcall is the virt-mode handler so it expects the real mode=20
has already run.

Hmm, probably it shouldn't be setting trap =3D 0 if it did not handle the
hcall. I don't know if that's the problem you have or if it's the nested
test but probably should test for this anyway.

> For H_CEDE there might be a similar situation since we're shadowing the
> code above that runs after H_ENTER_NESTED by setting trap to 0 here.

Yes.

Thanks,
Nick
