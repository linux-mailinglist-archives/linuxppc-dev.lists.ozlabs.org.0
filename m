Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDEE331C24
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 02:12:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvccw1QS9z3cLn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 12:12:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TEHlyRja;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TEHlyRja; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvccT5KcGz30Ht
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 12:11:53 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id q204so8256004pfq.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 17:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=28UX9SAuxr7c4RCVjVztfqjfgvnWTWbckeqpqgfmyyM=;
 b=TEHlyRjazhbLO4H4XX0uw/laMvz/dYImGsb/GVkDJDwkPWccAC4ZgtWm8jyZx82gB9
 KLNPQ6Tvb2aWQQtCiZVeklCs1Guo3oQydsnAqfw8/0Nn6XekdhX2rz126Mk1n9hHKIMR
 eaqSoBZv65xYmbQGbA8eZXAAfdyG3jrOS7JX3l0xBK7A83xQQjHpe5P68oUy8eNEyMcm
 Y5RqG3GsXZpGJHWiCszwrMWOS84df57J9Tbj4r3WvRFmogABOTj4IbukwxKiIngLTqAG
 BlOdTY8cJdq4O7C2YqtlznmFzG6ft1sEiS4Dxk8EkayKU922yMDUxpLvCwgoMsBEN2ia
 1HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=28UX9SAuxr7c4RCVjVztfqjfgvnWTWbckeqpqgfmyyM=;
 b=iNYF65Ricl2iHuxgMInmbqdbqmNJzVE0HPz8IFMbMj5tJzTbnk9Kj34W0W0L/fm2z3
 W4Wt568lmlUZLuCjO7AsSsZKlk3FXrespWTNIgnbJJQXvbjYAzUUD/LrO0QNFIZKLg29
 nf/NRz85vKxhqSgGz7hF6/YnINkreIn9JioLEbPggmbz/ivwozCB0ldyJ6zQk8n3Q6xP
 4EY9iMjfLa+5rpvDVm1uFe3mNXZhpMj/CUNQsArH+Xa/jZ3rjjZp+Oyv8UJZnFEXdNdN
 +8gb+NaICX1E5JxAypKL2But80RuegV1R6l5/AUyFka/TVGejrh1WSu28aIcWqDxDiAB
 S3sQ==
X-Gm-Message-State: AOAM530RqsKBQwPpXEtfuLvoqNIMWgDq6iyfRWRLDKmhXc8foN05QxIa
 81lZmlZhOALhn+qDtIWELO4=
X-Google-Smtp-Source: ABdhPJxZYWBgTRo/fO2yuha3hT89j9eKXmOPLNfjUM5yskDJJWrzQAaqu4/GpdfMDBt54YfUtYPBEQ==
X-Received: by 2002:a62:cd:0:b029:1ef:55e:e374 with SMTP id
 196-20020a6200cd0000b02901ef055ee374mr23949772pfa.31.1615252310457; 
 Mon, 08 Mar 2021 17:11:50 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a24sm12176735pff.18.2021.03.08.17.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 17:11:49 -0800 (PST)
Date: Tue, 09 Mar 2021 11:11:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 01/41] KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be
 set to 1 or 2
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-2-npiggin@gmail.com> <87blbtmzt2.fsf@linux.ibm.com>
In-Reply-To: <87blbtmzt2.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1615252103.bthxs4rnq2.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of March 9, 2021 1:26 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> These are already disallowed by H_SET_MODE from the guest, also disallow
>> these by updating LPCR directly.
>>
>> AIL modes can affect the host interrupt behaviour while the guest LPCR
>> value is set, so filter it here too.
>>
>> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv.c        | 11 +++++++++--
>>  arch/powerpc/kvm/book3s_hv_nested.c |  7 +++++--
>>  2 files changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 13bad6bf4c95..c40eeb20be39 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -803,7 +803,10 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu,=
 unsigned long mflags,
>>  		vcpu->arch.dawrx1 =3D value2;
>>  		return H_SUCCESS;
>>  	case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
>> -		/* KVM does not support mflags=3D2 (AIL=3D2) */
>> +		/*
>> +		 * KVM does not support mflags=3D2 (AIL=3D2) and AIL=3D1 is reserved.
>> +		 * Keep this in synch with kvmppc_set_lpcr.
>> +		 */
>>  		if (mflags !=3D 0 && mflags !=3D 3)
>>  			return H_UNSUPPORTED_FLAG_START;
>>  		return H_TOO_HARD;
>> @@ -1667,8 +1670,12 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu=
, u64 new_lpcr,
>>  	 * On POWER8 and POWER9 userspace can also modify AIL (alt. interrupt =
loc.).
>>  	 */
>>  	mask =3D LPCR_DPFD | LPCR_ILE | LPCR_TC;
>> -	if (cpu_has_feature(CPU_FTR_ARCH_207S))
>> +	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
>>  		mask |=3D LPCR_AIL;
>> +		/* LPCR[AIL]=3D1/2 is disallowed */
>> +		if ((new_lpcr & LPCR_AIL) && (new_lpcr & LPCR_AIL) !=3D LPCR_AIL_3)
>> +			new_lpcr &=3D ~LPCR_AIL;
>> +	}
>>  	/*
>>  	 * On POWER9, allow userspace to enable large decrementer for the
>>  	 * guest, whether or not the host has it enabled.
>> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book=
3s_hv_nested.c
>> index 2fe1fea4c934..b496079e02f7 100644
>> --- a/arch/powerpc/kvm/book3s_hv_nested.c
>> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
>> @@ -139,9 +139,12 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu,=
 struct hv_guest_state *hr)
>=20
> We're missing the patch that moves the lpcr setting into
> sanitise_hv_regs.

Oh yes sorry, mistyped the format-patch command.

>> =20
>>  	/*
>>  	 * Don't let L1 change LPCR bits for the L2 except these:
>> +	 * Keep this in sync with kvmppc_set_lpcr.
>>  	 */
>> -	mask =3D LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
>> -		LPCR_LPES | LPCR_MER;
>> +	mask =3D LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_LD | LPCR_LPES | LPCR_M=
ER;
>=20
> I think this line's change belongs in patch 33 doesn't it? Otherwise you
> are clearing a bit below that is not present in the mask so it would
> never be used anyway.

Ah yes, thank you. Will fix.

>=20
>> +	/* LPCR[AIL]=3D1/2 is disallowed */
>> +	if ((hr->lpcr & LPCR_AIL) && (hr->lpcr & LPCR_AIL) !=3D LPCR_AIL_3)
>> +		hr->lpcr &=3D ~LPCR_AIL;
>>  	hr->lpcr =3D (vc->lpcr & ~mask) | (hr->lpcr & mask);
>> =20
>>  	/*
>=20
