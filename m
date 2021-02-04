Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A0F30F2AA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 12:47:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWcGq6Yx9zDwry
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 22:47:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q3zZcDlg; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWbq61LZCzDwjs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 22:26:41 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id b145so1939420pfb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 03:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=WY0Hr6+QgFnEYB8xyIK5CBKqhZiKZMAvhEiPx8uRWG8=;
 b=q3zZcDlg9SQ0bpF/rQ/snbxp8GrQFL1gmuPADXUxo2V61+qq6o0GipNj9MosFE0XGv
 o2usrFBFoGFUUfZpyP1akesThg/EoYn264PM0R2SEBebpLqGOQ2EHPFCjvTuBPpdj/k+
 pqA+xNr9jJ12/5f4VLrYzdNBraB9wkjL161LDla7gN3v/WAlPxxBDquNijJ7BPyXUsPg
 ZX/n88aU48JtD1qT2rpIlAXzQJV6ZfDDGgeWA2WOJ9GZ4Ua95q7ZF27S0MXjVySyxL93
 WxaiQ/IaXUGB8ArVnGonA/wmtdJT0hJlBNP8Dbo7/m7zC8QOstrXL95p5dwqVR4qwWdr
 toQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=WY0Hr6+QgFnEYB8xyIK5CBKqhZiKZMAvhEiPx8uRWG8=;
 b=Ec+Y16AIxoJIdv6b46MXDmblDLjywFeN6CpVxxecguFkfDIV7Akm0YDP8cmJyvbnWz
 ezMS8cUOb03JMwQjT6FFld6lEMZA6gFgoTb955kID6calYmLLdhBwsdvnWQWm3d9h9G5
 2PuEY5Aaa+ynRMENrE2XxM0NKGEo5HBaxOsI7zJoiK16yTv5LBjig7OTiaw6TszII9oz
 zyE/fQXvg/zC1Fay4fWBa4hfst6iFH8AKM7l+e8XBSke4GmI5IALptZDYTzC7S46b96a
 hIi2WQ2AFVJmWnIDBiPJsaGh/sLE/xoCAo8VmBj7YFTWHZE4es9r55LbWYU2mrdcNBwW
 qKXA==
X-Gm-Message-State: AOAM530s178HJiBLwYXDulwUQBbUjumTmQKm2G2nNc0+OoAhWm+FeUcD
 oGiYG6CXiApXv8o7ZJtfLa1rf42+4Gk=
X-Google-Smtp-Source: ABdhPJx/74FF2BdETja/kyIbYEyzJyu7gocBrY3iXRUIBhrsU0cSrBViYGu8523cqzzxH10jW2gaIw==
X-Received: by 2002:a63:c54c:: with SMTP id g12mr8254941pgd.449.1612437998740; 
 Thu, 04 Feb 2021 03:26:38 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id d14sm5769777pfo.156.2021.02.04.03.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:26:38 -0800 (PST)
Date: Thu, 04 Feb 2021 21:26:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc64/idle: Fix SP offsets when saving GPRs
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <C90JVYFOGWU0.1C2DRATSDH0FM@geist>
 <1612429032.j2hz14yfcw.astroid@bobo.none>
 <87eehwozkj.fsf@mpe.ellerman.id.au>
In-Reply-To: <87eehwozkj.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1612437839.jynluhypyo.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of February 4, 2021 9:13 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Excerpts from Christopher M. Riedl's message of February 4, 2021 4:59 pm=
:
>>> On Sat Jan 30, 2021 at 7:44 AM CST, Nicholas Piggin wrote:
>>>> Excerpts from Michael Ellerman's message of January 30, 2021 9:32 pm:
>>>> > "Christopher M. Riedl" <cmr@codefail.de> writes:
>>>> >> The idle entry/exit code saves/restores GPRs in the stack "red zone=
"
>>>> >> (Protected Zone according to PowerPC64 ELF ABI v2). However, the of=
fset
>>>> >> used for the first GPR is incorrect and overwrites the back chain -=
 the
>>>> >> Protected Zone actually starts below the current SP. In practice th=
is is
>>>> >> probably not an issue, but it's still incorrect so fix it.
>>>> >=20
>>>> > Nice catch.
>>>> >=20
>>>> > Corrupting the back chain means you can't backtrace from there, whic=
h
>>>> > could be confusing for debugging one day.
>>>>
>>>> Yeah, we seem to have got away without noticing because the CPU will
>>>> wake up and return out of here before it tries to unwind the stack,
>>>> but if you tried to walk it by hand if the CPU got stuck in idle or
>>>> something, then we'd get confused.
>>>>
>>>> > It does make me wonder why we don't just create a stack frame and us=
e
>>>> > the normal macros? It would use a bit more stack space, but we shoul=
dn't
>>>> > be short of stack space when going idle.
>>>> >=20
>>>> > Nick, was there a particular reason for using the red zone?
>>>>
>>>> I don't recall a particular reason, I think a normal stack frame is
>>>> probably a good idea.
>>>=20
>>> I'll send a version using STACKFRAMESIZE - I assume that's the "normal"
>>> stack frame :)
>>>=20
>>
>> I think STACKFRAMESIZE is STACK_FRAME_OVERHEAD + NVGPRs. LR and CR can=20
>> be saved in the caller's frame so that should be okay.
>=20
> TBH I didn't know/had forgotten we had STACKFRAMESIZE.
>=20
> The safest is SWITCH_FRAME_SIZE, because it's calculated based on
> pt_regs (which can change size):
>=20
> 	DEFINE(SWITCH_FRAME_SIZE, STACK_FRAME_OVERHEAD + sizeof(struct pt_regs))=
;
>=20
> But the name is obviously terrible for your usage, and it will allocate
> a bit more space than you need, because pt_regs has more than just the GP=
Rs.

I don't see why that's safer if we're not using pt_regs.

>=20
>>> I admit I am a bit confused when I saw the similar but much smaller
>>> STACK_FRAME_OVERHEAD which is also used in _some_ cases to save/restore
>>> a few registers.
>>
>> Yeah if you don't need to save all nvgprs you can use caller's frame=20
>> plus a few bytes in the minimum frame as volatile storage.
>>
>> STACK_FRAME_OVERHEAD should be 32 on LE, but I think the problem is a=20
>> lot of asm uses it and hasn't necessarily been audited to make sure it's=
=20
>> not assuming it's bigger.
>=20
> Yeah it's a total mess. See this ~3.5 year old issue :/
>=20
> https://github.com/linuxppc/issues/issues/113
>=20
>> You could actually use STACK_FRAME_MIN_SIZE for new code, maybe we add
>> a STACK_FRAME_MIN_NVGPR_SIZE to match and use that.
>=20
> Something like that makes me nervous because it's so easy to
> accidentally use one of the macros that expects a full pt_regs.
>=20
> I think ideally you have just two options.
>=20
> Option 1:
>=20
> You use:
>   STACK_FRAME_WITH_PT_REGS =3D STACK_FRAME_MIN_SIZE + sizeof(struct pt_re=
gs)
>=20
> And then you can use all the macros in asm-offsets.c generated with
> STACK_PT_REGS_OFFSET.

I don't see a good reason to use pt_regs here, but in general sure this=20
would be good to have and begin using.

> Option 2:
>=20
> If you want to be fancy you manually allocate your frame with just
> the right amount of space, but with the size there in the code, so for
> example the idle code that wants 19 GPRs would do:
>=20
> 	stdu	r1, -(STACK_FRAME_MIN_SIZE + 8 * 19)(r1)
>=20
> And then it's very obvious that you have a non-standard frame size and
> need to be more careful.

I would be happy with this for the idle code.

Thanks,
Nick
