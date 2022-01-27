Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A660149DBC6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:39:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jkstd3l5qz3ckj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:39:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jWEbid/g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jWEbid/g; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jkssy4wkKz2xKT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:39:18 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id d5so2085869pjk.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 23:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zDcFsjc/U+z2NtNNk1kzLD8WhIBKmJn7Y8FtuClVBJ0=;
 b=jWEbid/gXo4AluxUVLAARpRKKQsvdVN4wF0XQeUziprTfS/XnaTMwk4XjAhCMr7I5l
 vVDXApcgJkDUTeJL9TrVweTmsDTxgdC0u8tcCmL2BIFvkglNgOqcErp0pDqQbkuPkq8Z
 khNilgPmME0W7XJL4+o3SS3lZ8ro9WDlwD27/MPs19sfSuMbeTESChv0P9naZu6bzalN
 Jd6xO/gGCVfaeoDWajOIIN3Czik3z6r7kJOuSBKZWODReapdNxFsSjFeJirv4/+Vaqvl
 dn842ASfiJWzGvcSDmk1Ec7KRJyDM9lZzZyGvKSMdbWLGXCaVbrDn073mHtMNkuxkAyn
 vpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zDcFsjc/U+z2NtNNk1kzLD8WhIBKmJn7Y8FtuClVBJ0=;
 b=HVfEtpUzfEkQWb2jwA4LbM4oPCInoWpkGICklnRU5c4E88KH3ixUn9+wvNHRNnfq3I
 YNniiH0GLsffNk/m5eUHknElW9ZzMv3lkecPZzi4jF9dzVgAjDJrO7IUzAHBMY8uVurP
 hvd0KyJnxhBJm0C5zqz0SPG7KXsfWvLVMl5vGrtMFxwxb680iX5HVu+ZJB8ppeHzlomL
 DDpR+9cfEKYz26rDz5bouX1IMA/W9KVDp6OgiefdLUzUmjf0waRl2o4nHP6eWGf3jQ6E
 Bnvs9qjrj3LQgc1+djXG5hhBkqfxWhCH8464dAH+fRwrLuApCK3GE8NOYQdQhrCzeEPH
 8cww==
X-Gm-Message-State: AOAM5305MA6umJVRSl/uidUzlVzDguZqbHZddA6TI7v4MB4pEoBRq8X9
 dQY+5b8+G4y03XDoJ0CmK1E=
X-Google-Smtp-Source: ABdhPJw5MoGxrbhsqMpz8+20oi68+hmH9kZCnBkqzwvUo6wwivxBaeFrh4gtFXgjj3SZ/E9AwXE3gA==
X-Received: by 2002:a17:90b:1c89:: with SMTP id
 oo9mr2910138pjb.146.1643269155613; 
 Wed, 26 Jan 2022 23:39:15 -0800 (PST)
Received: from localhost (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id n4sm7043315pjf.0.2022.01.26.23.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 23:39:15 -0800 (PST)
Date: Thu, 27 Jan 2022 17:39:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Disable syscall emulation and stepping
To: Christophe Leroy <christophe.leroy@csgroup.eu>, naverao1
 <naverao1@imap.linux.ibm.com>
References: <20220124055741.3686496-1-npiggin@gmail.com>
 <d3ab1142-5f62-6cbc-067c-6a34f4f28ef2@csgroup.eu>
 <1643079479.32j7nee5j0.astroid@bobo.none>
 <d352c741-baaf-3be3-ef31-81ce6250876c@csgroup.eu>
 <52b03748fdeff1bb2eb67f6038311e26@imap.linux.ibm.com>
In-Reply-To: <52b03748fdeff1bb2eb67f6038311e26@imap.linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1643268944.tltfmyu1ey.astroid@bobo.none>
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from naverao1's message of January 25, 2022 8:48 pm:
> On 2022-01-25 11:23, Christophe Leroy wrote:
>> Le 25/01/2022 =C3=A0 04:04, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> +Naveen (sorry missed cc'ing you at first)
>>>=20
>>> Excerpts from Christophe Leroy's message of January 24, 2022 4:39 pm:
>>>>=20
>>>>=20
>>>> Le 24/01/2022 =C3=A0 06:57, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>>> As discussed previously
>>>>>=20
>>>>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/238946.h=
tml
>>>>>=20
>>>>> I'm wondering whether PPC32 should be returning -1 for syscall
>>>>> instructions too here? That could be done in another patch anyway.
>>>>>=20
>>>>=20
>>>> The 'Programming Environments Manual for 32-Bit Implementations of=20
>>>> the
>>>> PowerPC=E2=84=A2 Architecture' says:
>>>>=20
>>>> The following are not traced:
>>>> =E2=80=A2 rfi instruction
>>>> =E2=80=A2 sc and trap instructions that trap
>>>> =E2=80=A2 Other instructions that cause interrupts (other than trace=20
>>>> interrupts)
>>>> =E2=80=A2 The first instruction of any interrupt handler
>>>> =E2=80=A2 Instructions that are emulated by software
>>>>=20
>>>>=20
>>>> So I think PPC32 should return -1 as well.
>>>=20
>>> I agree.
>>>=20
>>> What about the trap instructions? analyse_instr returns 0 for them
>>> which falls through to return 0 for emulate_step, should they
>>> return -1 as well or am I missing something?
>=20
> Yeah, good point about the trap instructions.
>=20
>>>=20
>>=20
>> For the traps I don't know. The manual says "trap instructions that
>> trap" are not traced. It means that "trap instructions that _don't_
>> trap" are traced. Taking into account that trap instructions don't trap
>> at least 99.9% of the time, not sure if returning -1 is needed.
>>=20
>> Allthought that'd probably be the safest.
>=20
> 'trap' is a special case since it is predominantly used by debuggers
> and/or tracing infrastructure. Kprobes and Uprobes do not allow probes
> on a trap instruction. But, xmon can be asked to step on a trap
> instruction and that can interfere with kprobes in weird ways.
>=20
> So, I think it is best if we also exclude trap instructions from being
> single stepped.
>=20
>>=20
>> But then what happens with other instruction that will sparsely=20
>> generate
>> an exception like a DSI or so ? If we do it for the traps then we=20
>> should
>> do it for this as well, and then it becomes a non ending story.
>=20
> For a DSI, we restart the same instruction after handling the page=20
> fault.
> The single step exception is raised on the subsequent successful
> completion of the instruction.

Although it can cause a signal, and the signal handler can decide
to resume somewhere else. Or kernel mode equivalent it can go to a
fixup handler and resume somewhere else.

How are those handled?

Thanks,
Nick

> For most other interrupts (alignment, vsx
> unavailable, ...), we end up emulating the single step exception itself
> (see emulate_single_step()). So, those are ok if caused by an=20
> instruction
> being stepped.
>=20
>=20
> - Naveen
>=20
