Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4452C346EA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 02:27:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4rFn1hbQz30Mj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 12:27:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=o9jdf0Ua;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o9jdf0Ua; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4rFN14jGz2yxw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 12:27:18 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id v8so7068289plz.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 18:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=nzpqaVMQ3IUMG30sPJ4iVSoB4g0F5+nzjHooZaW9EYU=;
 b=o9jdf0UaH4iqgysLoFQBtvAxyJfnWn7+yiETn9HREIvvcG388uTFwirj4zIFo/l+hd
 F8tZwyLBbu+RjSWm0ciry23PEyNCCJ+Uv3nNGpid4T7taxoLEsad3aFEnGMLtyf5PDaX
 JhhRUXbJGRy/80zULMBAHrafLb72/576E+qmGWPVN1rG68RQy0wzMbd0U0POsparqH8j
 x6VUEpnd1wXQchAKYOXHB811UdhIoy85v1SCsnQXklkJXitD19/TZ4x7McNP47ElCvbf
 YCkN8+TF46Gk8/N6RegAJhSklDXAvBJvjKu3yBzBcn9ZNosVy5FuA8qg5v1EamSVh+3W
 D8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=nzpqaVMQ3IUMG30sPJ4iVSoB4g0F5+nzjHooZaW9EYU=;
 b=o8fUk6q12aZFy0AcaK23UkzwvmeRllWyFY+rm0KMiVo/yo3L5+n80wL6uo6BjG78lJ
 Skc6Vttr9P/QkHe/05RKft0SSpoz4OJsWa8CUxjjlSQigzAl/yFZjAuNl5B4E+b6fR3A
 DJpK9z4PbHBLGspNN0Nwz5nXRqm+KmV2WTMw7ibUw3uFAfhpp7z3GIfCXGOYtn4EjbFU
 JuodZ5j5B2ad/3D7lGJ6E1HaPCkJE3wsw3nY2FFSWjU5v8/YSM/nt3JbJKRNU9RC/pfV
 G92NWa6LdkIyyQbB8LQNXE2MlWk+2r9qdUrmIQwUrM2nQ6MI5XbxPSom/Q5LGNBVQiew
 yGkw==
X-Gm-Message-State: AOAM531tEKY9sVwrsyUpVTKFqEtf0bQzIKmDn7pLyUITgisoObLqIYRb
 +QAH+wEK9MA9+p7k5izU+bk=
X-Google-Smtp-Source: ABdhPJwlnb/0C1Upjp5GyaOwv9VkE9QbE7AYqUqpNbtyCDRoHVEOKqD+YO5IYQCVyEFHZ7WmqWIFjQ==
X-Received: by 2002:a17:90b:1044:: with SMTP id
 gq4mr816183pjb.232.1616549235640; 
 Tue, 23 Mar 2021 18:27:15 -0700 (PDT)
Received: from localhost (193-116-197-97.tpgi.com.au. [193.116.197.97])
 by smtp.gmail.com with ESMTPSA id v1sm366370pjt.1.2021.03.23.18.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 18:27:14 -0700 (PDT)
Date: Wed, 24 Mar 2021 11:27:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 22/46] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-23-npiggin@gmail.com> <87y2ed5vi0.fsf@linux.ibm.com>
In-Reply-To: <87y2ed5vi0.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1616548948.qjnut0qf3h.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of March 24, 2021 8:57 am:
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
>> index fa7614c37e08..17739aaee3d8 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -1142,12 +1142,13 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcp=
u)
>>  }
>>
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
>=20
> This patch bypasses sc_1_fast_return so it breaks KVM-PR. L1 loops with
> the following output:
>=20
> [    9.503929][ T3443] Couldn't emulate instruction 0x4e800020 (op 19 xop=
 16)
> [    9.503990][ T3443] kvmppc_exit_pr_progint: emulation at 48f4 failed (=
4e800020)
> [    9.504080][ T3443] Couldn't emulate instruction 0x4e800020 (op 19 xop=
 16)
> [    9.504170][ T3443] kvmppc_exit_pr_progint: emulation at 48f4 failed (=
4e800020)
>=20
> 0x4e800020 is a blr after a sc 1 in SLOF.
>=20
> For KVM-PR we need to inject a 0xc00 at some point, either here or
> before branching to no_try_real in book3s_hv_rmhandlers.S.

Ah, I didn't know about that PR KVM (I suppose I should test it but I=20
haven't been able to get it running in the past).

Should be able to deal with that. This patch probably shouldn't change=20
the syscall behaviour like this anyway.

Thanks,
Nick
