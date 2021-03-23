Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A07C2345C06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 11:37:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4SVM4qLPz3bmf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 21:37:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=J0EXEIMG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J0EXEIMG; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4STy3ntMz3022
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 21:36:53 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id gb6so9901376pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Zy4Lsebf4U9tDEG2NTT8UKOvjnIFpxNqf841zIhhRxs=;
 b=J0EXEIMGFMlRPQ2VNtjXkh7O71Y4v+eWToFpaAZ8q5ZQ0uaCwdL7BIDk8NMZtuBmXV
 kp1bi6rMGobTw5eyp2sn9yKGMBUJ19EGSaCg7D9SD/yZH45D2KeG62tsKNf2KSdiOa60
 yAWQCQEOTokTSBCm9sQPA+wRNH5JBdP0XqVIZiHY2eP5zvnFOoVwLGMpoFgLwv8XF9qH
 TIc4hhUS9/hWTx9IQvlz+Bs4ff9ViRzQH5JJJpdMYFrlY24umOYCeO4fOl9ymawNdyXH
 XLMFhLGSUEehJlm6GB/2UAEFmk5BRmODsqzhbKI8gGaJeL9R7AegBW+zxd9ROXZULVLf
 Gang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Zy4Lsebf4U9tDEG2NTT8UKOvjnIFpxNqf841zIhhRxs=;
 b=tQRCNvI3L0NBDf5QWLWBC+Et2gsP5dFqCMf/TYkFVyQqzrRFnZz7yJ/sAyEAVYmJu8
 clHHIQUWZSKd/aCmSklTXNfUz932acXDjT8062N4BEFW64tB/ipXMpK2Vm2dgWxmAk3Q
 D+RUaLsZqOXKwgdwjd85tJrOl9UvfVCh/wh6plJnKtkzGWQ4M3xfu/kNJwWsnTJe4D/k
 /IyYVmtunxrbyjqVbQwJ9UTZEepeC6Hni+hchYinyZVf64XDijVPDYALTKdb33btiQ59
 J7itIgVfh0xksyVRBdYHqwLcbJJVGBLv1Wv6mg4Dm5WA4rFYtTYnoQF+o+fHXlnh2uiL
 7oYg==
X-Gm-Message-State: AOAM532q6o1yckiaOenChit4uRaNaJdJFzusa7UT9OW021wZ65XNlNOe
 AVfbGWvcZ6hWa9Y9Fcy7L00=
X-Google-Smtp-Source: ABdhPJyENyyZjqyChHgnp5OQUD4sJWDRB5LVETYT8qYS1zyh363VbQ7c9ouAgbrVV+ngn4SVE3z7Sg==
X-Received: by 2002:a17:90a:fd0a:: with SMTP id
 cv10mr3756762pjb.167.1616495811395; 
 Tue, 23 Mar 2021 03:36:51 -0700 (PDT)
Received: from localhost ([1.132.171.141])
 by smtp.gmail.com with ESMTPSA id v27sm16536610pfi.89.2021.03.23.03.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 03:36:50 -0700 (PDT)
Date: Tue, 23 Mar 2021 20:36:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 28/46] KVM: PPC: Book3S HV P9: Reduce irq_work vs guest
 decrementer races
To: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-29-npiggin@gmail.com>
 <3ca0e504-70df-2a25-12af-a1addac842b6@ozlabs.ru>
In-Reply-To: <3ca0e504-70df-2a25-12af-a1addac842b6@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1616495617.6070udmp89.astroid@bobo.none>
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

Excerpts from Alexey Kardashevskiy's message of March 23, 2021 8:13 pm:
>=20
>=20
> On 23/03/2021 12:02, Nicholas Piggin wrote:
>> irq_work's use of the DEC SPR is racy with guest<->host switch and guest
>> entry which flips the DEC interrupt to guest, which could lose a host
>> work interrupt.
>>=20
>> This patch closes one race, and attempts to comment another class of
>> races.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 1f38a0abc611..989a1ff5ad11 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -3745,6 +3745,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *=
vcpu, u64 time_limit,
>>   	if (!(vcpu->arch.ctrl & 1))
>>   		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
>>  =20
>> +	/*
>> +	 * When setting DEC, we must always deal with irq_work_raise via NMI v=
s
>> +	 * setting DEC. The problem occurs right as we switch into guest mode
>> +	 * if a NMI hits and sets pending work and sets DEC, then that will
>> +	 * apply to the guest and not bring us back to the host.
>> +	 *
>> +	 * irq_work_raise could check a flag (or possibly LPCR[HDICE] for
>> +	 * example) and set HDEC to 1? That wouldn't solve the nested hv
>> +	 * case which needs to abort the hcall or zero the time limit.
>> +	 *
>> +	 * XXX: Another day's problem.
>> +	 */
>>   	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
>>  =20
>>   	if (kvmhv_on_pseries()) {
>> @@ -3879,7 +3891,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *v=
cpu, u64 time_limit,
>>   	vc->entry_exit_map =3D 0x101;
>>   	vc->in_guest =3D 0;
>>  =20
>> -	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - tb);
>> +	set_dec_or_work(local_paca->kvm_hstate.dec_expires - tb);
>=20
>=20
> set_dec_or_work() will write local_paca->kvm_hstate.dec_expires - tb - 1=20
> to SPRN_DEC which is not exactly the same, is this still alright?
>=20
> I asked in v3 but it is probably lost :)

Oh I did see that then forgot.

It will write dec_expires - tb, then it will write 1 if it found irq_work
was pending.

The change is intentional to fixes one of the lost irq_work races.

Thanks,
Nick
