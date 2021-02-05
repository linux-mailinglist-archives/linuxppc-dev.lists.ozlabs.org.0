Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 778203102A0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 03:18:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWzbz5jS1zDwZr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 13:18:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nQKAArmy; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWzZF19WBzDvYk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 13:16:52 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id f63so3310114pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 18:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=xuOWiRRxskX3MchIMujV/w8I6l0jsqiIlk1ulJJq5y8=;
 b=nQKAArmy++Sei3vYKuXSPvascMIIJVflNwTsO53917N4lyPINyWXgpt4S2hJv7rIO9
 rZKLYVve4hyPOUqJlvfYv4oRUauaPqV19sjryJfWogE0XDz5B+13ihVLk70mvUywhF0F
 eM0NT8wESNcMLlz6xBBG97MO2Sza+gPnGfMK4QhkNSodaxiPD9uFWe5tNFtLNfoNl4Mb
 1ncqsOUFM8pUHkrMmgB6SDy9pzuWMIlpnLXwmm2ZyIUqHR+YKDjabNwfeC9krieh0WFL
 dlglxkbMFsprLM7S1d3ezrkg/yST0R04JC193YDd82HLLUYwGRV3MDNP5l8MLzDRdMur
 +I7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=xuOWiRRxskX3MchIMujV/w8I6l0jsqiIlk1ulJJq5y8=;
 b=tlvO8GKfWIABfs1JX3jT7zx2XnD8mEjn/yZoPtdmkMSdqaGp2U7+bTmhieKFyRfK7k
 2MBtrAJJff/maspvj1jkB9uOxtO7tpMnwH1GXxECwua24fWbMadkjj8Th67F9xerwAke
 sT766yaSuAzMMguCC/zcGXiA5GKVLjjShMSbBI/xdHc8fSt4R9N2Ib7dv3U88cXM2C1m
 tn3cFtXYqHeBg4ZR0M0QHPhnPUi0d8kzzYMuvyc/mze5MBZJ4qDFPFpixEld//IoupBc
 C6y2uaAD/nFT7qGa1c74kYobxFAn8edfloftRqU8je2CIVk1LxAZkmPdBRqLoYeZvidF
 ZDMA==
X-Gm-Message-State: AOAM531ZmgFqUs+ZC44K7y67sZWV3nwmq4KCUlITeBnxwSpnHiQ8W4Ry
 bZElwT8rDf7qcUXylFzb0ns=
X-Google-Smtp-Source: ABdhPJzpC0fErHwFRKqvXvAqnYS9/yj2fz0UXGqsFy/QWiPUnsuFxbWh50qcaSgYrhwTqTmbA+PU5A==
X-Received: by 2002:a62:14cb:0:b029:1d1:f512:f686 with SMTP id
 194-20020a6214cb0000b02901d1f512f686mr1997780pfu.11.1612491409056; 
 Thu, 04 Feb 2021 18:16:49 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id l1sm7258247pgt.26.2021.02.04.18.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 18:16:48 -0800 (PST)
Date: Fri, 05 Feb 2021 12:16:39 +1000
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
In-Reply-To: <87blczpdm3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1612491261.by5b8gr97g.astroid@bobo.none>
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

Excerpts from Michael Ellerman's message of February 5, 2021 10:22 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Excerpts from Christophe Leroy's message of February 4, 2021 6:03 pm:
>>> Le 04/02/2021 =C3=A0 04:27, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> Excerpts from Christophe Leroy's message of February 4, 2021 2:25 am:
>>>>> Le 25/02/2020 =C3=A0 18:35, Nicholas Piggin a =C3=A9crit=C2=A0:
> ...
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * We don't need to restore AMR on the way back to userspace for K=
UAP.
>>>>>> +	 * The value of AMR only matters while we're in the kernel.
>>>>>> +	 */
>>>>>> +	kuap_restore_amr(regs);
>>>>>
>>>>> Is that correct to restore KUAP state here ? Shouldn't we have it at =
lower level in assembly ?
>>>>>
>>>>> Isn't there a risk that someone manages to call interrupt_exit_kernel=
_prepare() or the end of it in
>>>>> a way or another, and get the previous KUAP state restored by this wa=
y ?
>>>>=20
>>>> I'm not sure if there much more risk if it's here rather than the
>>>> instruction being in another place in the code.
>>>>=20
>>>> There's a lot of user access around the kernel too if you want to find=
 a
>>>> gadget to unlock KUAP then I suppose there is a pretty large attack
>>>> surface.
>>>=20
>>> My understanding is that user access scope is strictly limited, for ins=
tance we enforce the=20
>>> begin/end of user access to be in the same function, and we refrain fro=
m calling any other function=20
>>> inside the user access window. x86 even have 'objtool' to enforce it at=
 build time. So in theory=20
>>> there is no way to get out of the function while user access is open.
>>>=20
>>> Here with the interrupt exit function it is free beer. You have a place=
 where you re-open user=20
>>> access and return with a simple blr. So that's open bar. If someone man=
ages to just call the=20
>>> interrupt exit function, then user access remains open
>>
>> Hmm okay maybe that's a good point.
>=20
> I don't think it's a very attractive gadget, it's not just a plain blr,
> it does a full stack frame tear down before the return. And there's no
> LR reloads anywhere very close.
>=20
> Obviously it depends on what the compiler decides to do, it's possible
> it could be a usable gadget. But there are other places that are more
> attractive I think, eg:
>=20
> c00000000061d768:	a6 03 3d 7d 	mtspr   29,r9
> c00000000061d76c:	2c 01 00 4c 	isync
> c00000000061d770:	00 00 00 60 	nop
> c00000000061d774:	30 00 21 38 	addi    r1,r1,48
> c00000000061d778:	20 00 80 4e 	blr
>=20
>=20
> So I don't think we should redesign the code *purely* because we're
> worried about interrupt_exit_kernel_prepare() being a useful gadget. If
> we can come up with a way to restructure it that reads well and is
> maintainable, and also reduces the chance of it being a good gadget then
> sure.

Okay. That would be good if we can keep it in C, the pkeys + kuap combo
is fairly complicated and we might want to something cleverer with it,=20
so that would make it even more difficult in asm.

Thanks,
Nick
