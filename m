Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE12AE79A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 05:47:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWBzk4cp2zDqV4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 15:47:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sFvPZ5K7; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWBy03sXczDqTw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 15:45:59 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id 10so878819pfp.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 20:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=C0J+QwPsnlOynYUCwR2+mmJvkS3NHQtxi+FgysKrHK4=;
 b=sFvPZ5K7HFuCHQHkHpPRHDwc7ma2PE2ucEBH4dd8w7uc9r03fuaRzpeKarovbIHTGy
 DseBDvACti3HP3GdW0CkfA9oYaZGC5UfN96L1B1gMGo9qRoALqKy2LIZ2rXwuW7Fhdyj
 GZ70SVgK0A5Tx3XMopwoCURwrg2BjIQFCpM4LgeTrIYlG8iy8VdVnKJduC/q7z8CvSb5
 DSvXOHjQrea5HDQXl4rPtfuVRhoFCz1Fj626TKM4DKJaGqiW4M803ykVshANQOfspTx6
 yV554IrVJc/zrkKyqlTcDleU0+AQpRlqHda9MEN7kcH7lJboJKDbtsmmYNfhzsGl4EC0
 LpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=C0J+QwPsnlOynYUCwR2+mmJvkS3NHQtxi+FgysKrHK4=;
 b=rive16S3svMVBcXEnnMk3rJG3Cq3Pt4bgD/jWthDSt9tnTmHxO7WzsVLiknl1YrlFv
 nUwivwMUXwAVCqK1eEDB8J/544jmlvAIgh43hh+nq47EUduDqblpkfMyhSJIbQQYFAYY
 hq3deY52e9+4E9ntd20yNABWKT4IJxqkPsp3PE7xGABVStV3XAVm2xkgRNU9fu+MxRc1
 uNCG6Wwr6HEnstFHbVNDxjPTuze6K+3I+W7n1wfOimW56mBYuR6hUXAY9vheutOa6vQD
 jHCpkaBGAeLe9FlxCEZTQkKNimKl73F/qiJwfwEWud8eL3uv+BDjQBmK67RlbPBn1vhn
 G5Gw==
X-Gm-Message-State: AOAM532PFm6gAh6KrO1TaVMLWWJG0YXA76U5Mgg+nzVu5T3Yr9KUwqV8
 2TCJPqxUec+CtQvFTUTRNPk=
X-Google-Smtp-Source: ABdhPJwLmeNPL3DGsuUzwEbReC4WwX1DjKEX6noIG/zIfKSY6DQnRblTSBkr+mtQFzqGM4EXDvjOnw==
X-Received: by 2002:a63:b55e:: with SMTP id u30mr19340955pgo.381.1605069954897; 
 Tue, 10 Nov 2020 20:45:54 -0800 (PST)
Received: from localhost (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id b16sm688789pju.16.2020.11.10.20.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 20:45:54 -0800 (PST)
Date: Wed, 11 Nov 2020 14:45:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 02/18] powerpc: remove arguments from fault handler
 functions
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201105143431.1874789-1-npiggin@gmail.com>
 <20201105143431.1874789-3-npiggin@gmail.com>
 <6af9a488-3816-9744-db4b-5a3bceb1f0f0@csgroup.eu>
 <1604996406.ltcjkqarcr.astroid@bobo.none>
 <3872d710-97e2-80c3-991c-7f1ffe790a3d@csgroup.eu>
In-Reply-To: <3872d710-97e2-80c3-991c-7f1ffe790a3d@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1605069878.ohfaq5qrth.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of November 10, 2020 9:15 pm:
>=20
>=20
> Le 10/11/2020 =C3=A0 09:29, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of November 6, 2020 5:59 pm:
>>>
>>>
>>> Le 05/11/2020 =C3=A0 15:34, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> Make mm fault handlers all just take the pt_regs * argument and load
>>>> DAR/DSISR from that. Make those that return a value return long.
>>>>
>>>> This is done to make the function signatures match other handlers, whi=
ch
>>>> will help with a future patch to add wrappers. Explicit arguments coul=
d
>>>> be added for performance but that would require more wrapper macro
>>>> variants.
>>>>
>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>> ---
>=20
> [...]
>=20
>>=20
>>>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>>>> index e65a49f246ef..390a296b16a3 100644
>>>> --- a/arch/powerpc/mm/fault.c
>>>> +++ b/arch/powerpc/mm/fault.c
>>>> @@ -549,11 +549,12 @@ static int __do_page_fault(struct pt_regs *regs,=
 unsigned long address,
>>>>    }
>>>>    NOKPROBE_SYMBOL(__do_page_fault);
>>>>   =20
>>>> -int do_page_fault(struct pt_regs *regs, unsigned long address,
>>>> -		  unsigned long error_code)
>>>> +long do_page_fault(struct pt_regs *regs)
>>>>    {
>>>>    	enum ctx_state prev_state =3D exception_enter();
>>>> -	int err;
>>>> +	unsigned long address =3D regs->dar;
>>>> +	unsigned long error_code =3D regs->dsisr;
>>>> +	long err;
>>>
>>> By doing something more or less like this (need to be tuned for bookE a=
s well):
>>>
>>> +	int is_exec =3D TRAP(regs) =3D=3D 0x400;
>>> +	unsigned long address =3D is_exec ? regs->ssr0 : regs->dar;
>>> +	unsigned long error_code =3D is_exec ? (regs->ssr1 & DSISR_SRR1_MATCH=
_32S) : regs->dsisr;
>>=20
>> Ah, I didn't see that you saved these in srr0/1 already. Hmm, not in
>> pt_regs though. thread_struct (VMAP_STACK only)? exception_regs (booke
>> only)? Doesn't seem so easy.
>=20
> Oops yes you are right, SRR0/SRR1 are not in pt_regs. And their validity =
in thread struct is rather=20
> short ... So forget my comment.

So, are you happy to go with this for now? I guess things can
later be cleaned up to avoid double saving on cases like VMAP.

Thanks,
Nick
