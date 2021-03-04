Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A7232D18D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 12:05:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drp1n3W5vz3dBx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 22:05:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=szfEARUZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=szfEARUZ; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drp1N4zSsz3cZF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 22:05:12 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id kx1so512588pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 03:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Tq2nq7WrALsOgtkcDYwaRGhknpqw7Hbjv0+Mq9NsCng=;
 b=szfEARUZejT+shgrVSVvd6pBUSxxHx7/REhP11TUEa6AC2x7sBnpLRGUqanKgxx85F
 gHTwVa795ejaXFLLsO8EsGGmseyZpBV8ru0FdE4/LULB5SGnLVmWxKl7ZIdJ7LUf75aK
 3DL1oH9zyoaZBGzn8QK1aC4ga2k2B42iPr4g0Mj0JOUTSdt2h18wzs/ZVm+Om9k0E/FX
 N4nluylMMKPLRLlneKbLE7TdmiQ4HiZ2YMeYHu17nUs2njYPeNU5Yq1XWaI2DW87OiJf
 csnJlC5cfmYNfSdQVVKTDg9ypOcrllxnQmpLjNsfRY2BrPbLl8hwHJ/xLSKjbGkyBARj
 mpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Tq2nq7WrALsOgtkcDYwaRGhknpqw7Hbjv0+Mq9NsCng=;
 b=sKrTZEsC4T7R5Lw1UVcVpdIDR5L0GYP/HDScxJ/FH/WEUzCO5Vxep78M8z57HiVfcS
 uO+ioWBaambnsX0knsR/g2Ld7VHk2zxam+VQV4+6b9crCMhMKY/VPj87H+NhAVTnnQFO
 ozFhcZgbDtWZ+GFA7ReBcUy4ZCu1/UbykCzfe5BZ1p9eBi2YuTz6aaP15zR6A9GHxUHg
 E0Q5cAnAu3d28KaKJGRBm+jIkz53zQuMXl2l8EPIelTCYj5B/Or9pu7r5vtTy+2IeqHY
 SNHBFlGjQ3Q/fgjYhNiebng0AM8/+nvFPerYZVTc7PjPWZ9U5jrp+BHFhY/bTXlcVCV2
 Bv/A==
X-Gm-Message-State: AOAM533NXXkZbZ3WofwhtyOFNtIBUFOmnJQXGSu3X+mI+j2yOUu5+ATY
 oOL39MnWift3hACFR8qgI78=
X-Google-Smtp-Source: ABdhPJz7R/zAv9IuKrAibwPptRDk0skfxZZiu6GdApirC10BIf+S9eDHJuPinNR+OK2g/oY9BGYPZQ==
X-Received: by 2002:a17:902:ac82:b029:e3:bca2:cca7 with SMTP id
 h2-20020a170902ac82b02900e3bca2cca7mr3280153plr.43.1614855910247; 
 Thu, 04 Mar 2021 03:05:10 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id mm12sm9363213pjb.49.2021.03.04.03.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 03:05:09 -0800 (PST)
Date: Thu, 04 Mar 2021 21:05:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 34/37] KVM: PPC: Book3S HV: add virtual mode handlers
 for HPT hcalls and page faults
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-35-npiggin@gmail.com> <87im68vw16.fsf@linux.ibm.com>
In-Reply-To: <87im68vw16.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1614855872.kftnn1redt.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of March 4, 2021 6:09 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> In order to support hash guests in the P9 path (which does not do real
>> mode hcalls or page fault handling), these real-mode hash specific
>> interrupts need to be implemented in virt mode.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv.c | 118 +++++++++++++++++++++++++++++++++--
>>  1 file changed, 113 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 9d2fa21201c1..1bbc46f2cfbf 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -935,6 +935,52 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>>  		return RESUME_HOST;
>>
>>  	switch (req) {
>> +	case H_REMOVE:
>> +		ret =3D kvmppc_h_remove(vcpu, kvmppc_get_gpr(vcpu, 4),
>> +					kvmppc_get_gpr(vcpu, 5),
>> +					kvmppc_get_gpr(vcpu, 6));
>> +		if (ret =3D=3D H_TOO_HARD)
>> +			return RESUME_HOST;
>> +		break;
>> +	case H_ENTER:
>> +		ret =3D kvmppc_h_enter(vcpu, kvmppc_get_gpr(vcpu, 4),
>> +					kvmppc_get_gpr(vcpu, 5),
>> +					kvmppc_get_gpr(vcpu, 6),
>> +					kvmppc_get_gpr(vcpu, 7));
>> +		if (ret =3D=3D H_TOO_HARD)
>> +			return RESUME_HOST;
>> +		break;
>> +	case H_READ:
>> +		ret =3D kvmppc_h_read(vcpu, kvmppc_get_gpr(vcpu, 4),
>> +					kvmppc_get_gpr(vcpu, 5));
>> +		if (ret =3D=3D H_TOO_HARD)
>> +			return RESUME_HOST;
>> +		break;
>> +	case H_CLEAR_MOD:
>> +		ret =3D kvmppc_h_clear_mod(vcpu, kvmppc_get_gpr(vcpu, 4),
>> +					kvmppc_get_gpr(vcpu, 5));
>> +		if (ret =3D=3D H_TOO_HARD)
>> +			return RESUME_HOST;
>> +		break;
>> +	case H_CLEAR_REF:
>> +		ret =3D kvmppc_h_clear_ref(vcpu, kvmppc_get_gpr(vcpu, 4),
>> +					kvmppc_get_gpr(vcpu, 5));
>> +		if (ret =3D=3D H_TOO_HARD)
>> +			return RESUME_HOST;
>> +		break;
>> +	case H_PROTECT:
>> +		ret =3D kvmppc_h_protect(vcpu, kvmppc_get_gpr(vcpu, 4),
>> +					kvmppc_get_gpr(vcpu, 5),
>> +					kvmppc_get_gpr(vcpu, 6));
>> +		if (ret =3D=3D H_TOO_HARD)
>> +			return RESUME_HOST;
>> +		break;
>> +	case H_BULK_REMOVE:
>> +		ret =3D kvmppc_h_bulk_remove(vcpu);
>> +		if (ret =3D=3D H_TOO_HARD)
>> +			return RESUME_HOST;
>> +		break;
>> +
>=20
> Some of these symbols need to be exported.
>=20
> ERROR: modpost: "kvmppc_h_bulk_remove" [arch/powerpc/kvm/kvm-hv.ko] undef=
ined!
> ERROR: modpost: "kvmppc_h_clear_mod" [arch/powerpc/kvm/kvm-hv.ko] undefin=
ed!
> ERROR: modpost: "kvmppc_xive_xics_hcall" [arch/powerpc/kvm/kvm-hv.ko] und=
efined!
> ERROR: modpost: "kvmppc_h_remove" [arch/powerpc/kvm/kvm-hv.ko] undefined!
> ERROR: modpost: "decrementers_next_tb" [arch/powerpc/kvm/kvm-hv.ko] undef=
ined!
> ERROR: modpost: "kvmppc_hpte_hv_fault" [arch/powerpc/kvm/kvm-hv.ko] undef=
ined!
> ERROR: modpost: "kvmppc_h_protect" [arch/powerpc/kvm/kvm-hv.ko] undefined=
!
> ERROR: modpost: "kvmppc_h_enter" [arch/powerpc/kvm/kvm-hv.ko] undefined!
> ERROR: modpost: "kvmppc_h_clear_ref" [arch/powerpc/kvm/kvm-hv.ko] undefin=
ed!
> ERROR: modpost: "kvmppc_h_read" [arch/powerpc/kvm/kvm-hv.ko] undefined!

Yeah sorry about that there's a few issues there, I'll try polish that=20
up a bit before the next post.

Thanks,
Nick
