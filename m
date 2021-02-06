Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7463D311838
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 03:30:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXbq10tmCzDwmr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 13:30:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ic1WNYyW; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXbnC4BFMzDwg2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 13:28:28 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id g3so4507183plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Feb 2021 18:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=gqbgix3Y0ePe1rMZLvPp+CTMyeDE0eZ/CQbXPb1D+mw=;
 b=ic1WNYyWLYGTRwENgD0AybEvWKRL+s/vebufvlQa+GpNx8HD4Ivm6FIMCIRnXjIDE5
 NLroWxeorCSjklLnSr3qU39vRKq4fPI3fVNCzRbsMz95chs7awbhlHs415SJ231+35J5
 HKyD5OwxBe6SFiYOrlMgkPVygbtBxwp9+qxN1kZDQxuEEPOzwhTSVz6i8qY1ePXCrwwF
 N6l8NHAosycMmnwQEfyZ1Uc7pZfp5FgrvxwXI6O9XbZdhpvNQwSUZrLATWv3meqx+zoO
 TS1NDLMrTco48oNXIgjJCFXTx1+Yx/E4KXSzbGf9YjdowNz04YgIaW8LdOeyeulrWOe1
 TJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gqbgix3Y0ePe1rMZLvPp+CTMyeDE0eZ/CQbXPb1D+mw=;
 b=newq2dqwnKcm4ZzpDC2PqhBRsWzkE/sfuDeAP0rNWvPJmY23NdqEkBFRMHWrC0Cmsb
 5HNhb7OhtPCuT4FOazY5Z7zHk1kiynOoySxQ1KG44Nu3fLNkbbTuW02pterT2I1SutOt
 e8z5tkNNdUsmnrOnTcmZZ59gGb/jeW7/RAZFMTdzKhiuUH9CB9B+fvaKLvICFV/d9Amv
 ZqHTjPqXWAdmTGflJS5zz75BJPnZwXkoJmAUt0yWN8ntcrkbRJAlVH1GHh4wWE6Hg/ZF
 HHQXlWZl2z+oiyS4X1G9CugH8ZA1Vmak1/tHChpdezpWFLqDu6hUzf6Myo4gTW/fw46r
 hHEA==
X-Gm-Message-State: AOAM532ZfUz/BpiJrbojh6vNFXhQ7qzUNHHAmz0Xwprgm99tmzuImHGi
 lKlVQnFipzBik+WAIBcaaBw=
X-Google-Smtp-Source: ABdhPJyaH3QGE1saG/o0dNh3yGO22JT0CcCj9vrP8kJtiBB5jr4duFT6GrfmJZhc9nc2C0r7mn+Ncw==
X-Received: by 2002:a17:90a:c503:: with SMTP id
 k3mr6785996pjt.165.1612578505046; 
 Fri, 05 Feb 2021 18:28:25 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id u20sm9312644pjy.36.2021.02.05.18.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 18:28:24 -0800 (PST)
Date: Sat, 06 Feb 2021 12:28:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 28/32] powerpc/64s: interrupt implement exit logic in C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-29-npiggin@gmail.com>
 <37c2a8e1-2c4b-2e55-6753-0a804ce00cac@csgroup.eu>
 <1612409077.fadt3kvld9.astroid@bobo.none>
 <65686b53-feb4-2788-88e1-76c3714d3e97@csgroup.eu>
 <1612428699.u023r42mj3.astroid@bobo.none>
 <87blczpdm3.fsf@mpe.ellerman.id.au>
 <1612491261.by5b8gr97g.astroid@bobo.none>
 <d8e6b971-c783-fb5f-f9f2-24e7d8d0726d@csgroup.eu>
In-Reply-To: <d8e6b971-c783-fb5f-f9f2-24e7d8d0726d@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612578476.fkcwuu4e9e.astroid@bobo.none>
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
Cc: Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 5, 2021 4:04 pm:
>=20
>=20
> Le 05/02/2021 =C3=A0 03:16, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Michael Ellerman's message of February 5, 2021 10:22 am:
>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>> Excerpts from Christophe Leroy's message of February 4, 2021 6:03 pm:
>>>>> Le 04/02/2021 =C3=A0 04:27, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>>>> Excerpts from Christophe Leroy's message of February 4, 2021 2:25 am=
:
>>>>>>> Le 25/02/2020 =C3=A0 18:35, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> ...
>>>>>>>> +
>>>>>>>> +	/*
>>>>>>>> +	 * We don't need to restore AMR on the way back to userspace for=
 KUAP.
>>>>>>>> +	 * The value of AMR only matters while we're in the kernel.
>>>>>>>> +	 */
>>>>>>>> +	kuap_restore_amr(regs);
>>>>>>>
>>>>>>> Is that correct to restore KUAP state here ? Shouldn't we have it a=
t lower level in assembly ?
>>>>>>>
>>>>>>> Isn't there a risk that someone manages to call interrupt_exit_kern=
el_prepare() or the end of it in
>>>>>>> a way or another, and get the previous KUAP state restored by this =
way ?
>>>>>>
>>>>>> I'm not sure if there much more risk if it's here rather than the
>>>>>> instruction being in another place in the code.
>>>>>>
>>>>>> There's a lot of user access around the kernel too if you want to fi=
nd a
>>>>>> gadget to unlock KUAP then I suppose there is a pretty large attack
>>>>>> surface.
>>>>>
>>>>> My understanding is that user access scope is strictly limited, for i=
nstance we enforce the
>>>>> begin/end of user access to be in the same function, and we refrain f=
rom calling any other function
>>>>> inside the user access window. x86 even have 'objtool' to enforce it =
at build time. So in theory
>>>>> there is no way to get out of the function while user access is open.
>>>>>
>>>>> Here with the interrupt exit function it is free beer. You have a pla=
ce where you re-open user
>>>>> access and return with a simple blr. So that's open bar. If someone m=
anages to just call the
>>>>> interrupt exit function, then user access remains open
>>>>
>>>> Hmm okay maybe that's a good point.
>>>
>>> I don't think it's a very attractive gadget, it's not just a plain blr,
>>> it does a full stack frame tear down before the return. And there's no
>>> LR reloads anywhere very close.
>>>
>>> Obviously it depends on what the compiler decides to do, it's possible
>>> it could be a usable gadget. But there are other places that are more
>>> attractive I think, eg:
>>>
>>> c00000000061d768:	a6 03 3d 7d 	mtspr   29,r9
>>> c00000000061d76c:	2c 01 00 4c 	isync
>>> c00000000061d770:	00 00 00 60 	nop
>>> c00000000061d774:	30 00 21 38 	addi    r1,r1,48
>>> c00000000061d778:	20 00 80 4e 	blr
>>>
>>>
>>> So I don't think we should redesign the code *purely* because we're
>>> worried about interrupt_exit_kernel_prepare() being a useful gadget. If
>>> we can come up with a way to restructure it that reads well and is
>>> maintainable, and also reduces the chance of it being a good gadget the=
n
>>> sure.
>>=20
>> Okay. That would be good if we can keep it in C, the pkeys + kuap combo
>> is fairly complicated and we might want to something cleverer with it,
>> so that would make it even more difficult in asm.
>>=20
>=20
> Ok.
>=20
> For ppc32, I prefer to keep it in assembly for the time being and move ev=
erything from ASM to C at=20
> once after porting syscall and interrupts to C and wrappers.
>=20
> Hope this is OK for you.

I don't see a problem with that.

Thanks,
Nick
