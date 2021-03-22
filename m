Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E724343753
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 04:18:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3fpw2kvyz304Q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 14:18:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SPyud3BE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SPyud3BE; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3fpT70ycz2xfh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 14:18:24 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id g15so10007116pfq.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 20:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=2r0iVRr6v7y/H+eGodBK0e6KBH/Q8fDpFMrbGtG/Ww8=;
 b=SPyud3BEhBQyDDx6eq3AGbtBkkGiw2QFaQUUGr0Rjn5zbG7cl6e/o6MYaUqU4aTbW8
 nia6PsNjon7654elO42HgW4yvkLhefFpyvmGyDE8uGsOXigW8nCmgwwo9E6wiQIdWK6G
 dLQi68djy8/rtEf1TJsorpsFpm68q/DHGMQiLzRtolp4ClNJJO4p+J4AVgDRgKyrO0OP
 T8iGgQ9Q1If2kHQVu2ynXqAMxelzBg4ILRu9/LidZaJ7vqNrj3g1PsZUAoMMTOS8tXcf
 ov3MDW5dCLl9O51dJ/FpjQtxKfyD+mlnW17I5FyemeSr6i0ge2+1/8WV+2MzE5mHRMUp
 S9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=2r0iVRr6v7y/H+eGodBK0e6KBH/Q8fDpFMrbGtG/Ww8=;
 b=KVcw4IdygwnyjJof0kXstpdSzm5ZYO/bR3IFCclqPh0/dHE7VCfQ0x7wUFZdca8BV8
 lBD+a/JdOpsOEXABbctcVxzufjhrC1e34dhE8jBfBFqdBOOf0Q5yVoY/pPsIzRYsYd89
 sMHu+JAq0K94hWhgEhYQuVzJJqubupuu/gnN2oqx96cNavXTfdZLpQbjYZ8asW8oh1at
 JlOUFXCAysn64FD0+SVnvzqHPXjim8T7vR+wEpg601q9IlfYTVQ4LKZxuqLF3ZJLP5iP
 Nn27c54Bg/1TrVvuStgA/kIcdxL2+kzOAE640Vo3hLDlhFWjZOMxTwVI+TbbPGnAQ3Ko
 koUQ==
X-Gm-Message-State: AOAM533hWOc28h4V4W03K3MuFaeiUees3lew1vq7/dEhUxYQGX+3Tw98
 yVipRjA0Tm7laejR3VefDIykmZeAfLU=
X-Google-Smtp-Source: ABdhPJxOq/hnYUCP8u0PcQELXswZ67ZO8DHEH9pkAbuS0s0apzr0FiHvv1lKvBE0fKLW7G1SB5bgyA==
X-Received: by 2002:a62:d414:0:b029:217:24b8:a5b9 with SMTP id
 a20-20020a62d4140000b029021724b8a5b9mr5672244pfh.41.1616383101838; 
 Sun, 21 Mar 2021 20:18:21 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e20sm10899493pgm.1.2021.03.21.20.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 20:18:21 -0700 (PDT)
Date: Mon, 22 Mar 2021 13:18:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 14/41] KVM: PPC: Book3S 64: move bad_host_intr check to
 HV handler
To: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-15-npiggin@gmail.com>
 <1f68b37c-7167-30d7-ee19-f6ebc69bd4a6@ozlabs.ru>
In-Reply-To: <1f68b37c-7167-30d7-ee19-f6ebc69bd4a6@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1616382597.zt86t19345.astroid@bobo.none>
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

Excerpts from Alexey Kardashevskiy's message of March 20, 2021 7:07 pm:
>=20
>=20
> On 06/03/2021 02:06, Nicholas Piggin wrote:
>> This is not used by PR KVM.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
>=20
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>=20
> a small tote - it probably makes sense to move this before 09/41 as this=20
> one removes what 09/41 added to book3s_64_entry.S. Thanks,

Thanks.

I do realise there's a bit of shuffling around in this part of the=20
series, I'm trying to see if that can be improved a bit. But 9/41
is just moving the code without change which I prefer to do first.
This one changes the calling convention for PR which I think is
better to do after we have the entry point in a common file.

Thanks,
Nick


>=20
>=20
>> ---
>>   arch/powerpc/kvm/book3s_64_entry.S      | 3 ---
>>   arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 +++-
>>   arch/powerpc/kvm/book3s_segment.S       | 7 +++++++
>>   3 files changed, 10 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3=
s_64_entry.S
>> index d06e81842368..7a6b060ceed8 100644
>> --- a/arch/powerpc/kvm/book3s_64_entry.S
>> +++ b/arch/powerpc/kvm/book3s_64_entry.S
>> @@ -78,11 +78,8 @@ do_kvm_interrupt:
>>   	beq-	.Lmaybe_skip
>>   .Lno_skip:
>>   #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>> -	cmpwi	r9,KVM_GUEST_MODE_HOST_HV
>> -	beq	kvmppc_bad_host_intr
>>   #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>>   	cmpwi	r9,KVM_GUEST_MODE_GUEST
>> -	ld	r9,HSTATE_SCRATCH2(r13)
>>   	beq	kvmppc_interrupt_pr
>>   #endif
>>   	b	kvmppc_interrupt_hv
>> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/=
book3s_hv_rmhandlers.S
>> index f976efb7e4a9..75405ef53238 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> @@ -1265,6 +1265,7 @@ hdec_soon:
>>   kvmppc_interrupt_hv:
>>   	/*
>>   	 * Register contents:
>> +	 * R9		=3D HSTATE_IN_GUEST
>>   	 * R12		=3D (guest CR << 32) | interrupt vector
>>   	 * R13		=3D PACA
>>   	 * guest R12 saved in shadow VCPU SCRATCH0
>> @@ -1272,6 +1273,8 @@ kvmppc_interrupt_hv:
>>   	 * guest R9 saved in HSTATE_SCRATCH2
>>   	 */
>>   	/* We're now back in the host but in guest MMU context */
>> +	cmpwi	r9,KVM_GUEST_MODE_HOST_HV
>> +	beq	kvmppc_bad_host_intr
>>   	li	r9, KVM_GUEST_MODE_HOST_HV
>>   	stb	r9, HSTATE_IN_GUEST(r13)
>>  =20
>> @@ -3272,7 +3275,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_P9_TM_HV_ASSIST)
>>    * cfar is saved in HSTATE_CFAR(r13)
>>    * ppr is saved in HSTATE_PPR(r13)
>>    */
>> -.global kvmppc_bad_host_intr
>>   kvmppc_bad_host_intr:
>>   	/*
>>   	 * Switch to the emergency stack, but start half-way down in
>> diff --git a/arch/powerpc/kvm/book3s_segment.S b/arch/powerpc/kvm/book3s=
_segment.S
>> index 1f492aa4c8d6..ef1d88b869bf 100644
>> --- a/arch/powerpc/kvm/book3s_segment.S
>> +++ b/arch/powerpc/kvm/book3s_segment.S
>> @@ -167,8 +167,15 @@ kvmppc_interrupt_pr:
>>   	 * R12             =3D (guest CR << 32) | exit handler id
>>   	 * R13             =3D PACA
>>   	 * HSTATE.SCRATCH0 =3D guest R12
>> +	 *
>> +	 * If HV is possible, additionally:
>> +	 * R9              =3D HSTATE_IN_GUEST
>> +	 * HSTATE.SCRATCH2 =3D guest R9
>>   	 */
>>   #ifdef CONFIG_PPC64
>> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>> +	ld	r9,HSTATE_SCRATCH2(r13)
>> +#endif
>>   	/* Match 32-bit entry */
>>   	rotldi	r12, r12, 32		  /* Flip R12 halves for stw */
>>   	stw	r12, HSTATE_SCRATCH1(r13) /* CR is now in the low half */
>>=20
>=20
> --=20
> Alexey
>=20
