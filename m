Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A40F82AE7A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 05:53:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWC6s35L0zDqcN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 15:53:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ilzcLuIc; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWC2X25r5zDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 15:49:55 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id z24so681035pgk.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 20:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=O4F4zTxyf/UOLdlz8w787tSOU6/s1+sZFXyx+/2TeQU=;
 b=ilzcLuIcKEo6okio2DQAvAQmsksXA00YJ0O3fn5KZ3LmX8mpBo0F4Alz1Lt11pO36B
 kuzs931wO3iPwbnQIdUYBT/FxP/PUJ1oP6SJrqFpr3gHNsIJ4GUbQN77g24w80wpQc5q
 DM0Bevd0eSPCJLXFHVQci+THIvvPhzDgZ6RZXqsdKiB6BdLhmgU4ywG+HzuJitQm5Rsa
 Y+032hJ+l+sJN3IJ4O2DPyVLqLq9zOrTBZpUla2ebTwCvNiwypfK0imRJgaLn5F4Mjzy
 Ulz9l5x3epdOutJnDWGpz3sW/vE6OvxTiccYo2yp6IunhqbtbtknoP+kLbb+QWfiysUb
 sNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=O4F4zTxyf/UOLdlz8w787tSOU6/s1+sZFXyx+/2TeQU=;
 b=Cgm0lj0y/n195l9MevYTxvq0POSkFABJEDor/PSIkTTb8r8fOibmcZgV5E8RWFTWeZ
 m2To1b83nqoM0NkW73dhoN5wuRU4Qxh3Czj09WrOjj4ey+1KW7U59Iia/AbD+btdBEBI
 EbENNGExFiTvSGNn3VIk56yhhzjeo0y41skcVGJlq14J3Dc2ZNt7OhuULDWP75YO7M3X
 Y+aldGf2a4NfrMCcr7ylpMx2QXUKtAjFVCrX7SqoInKSQT5/9D3CadrjMIaCIsNwbUVc
 nJ000ELfAe41KlUqLndJfdT989JI/F09XpNhItN0t+bVP3AuqFkzDFq7GgMFJx35/C2f
 nJ6A==
X-Gm-Message-State: AOAM530MVBK2ojTREyF1YUsoSIwYFkPgXz3YqDqmf+ak5MRyYIQkLquI
 V7HY7F6MM3ubQcJQpcpQZM4=
X-Google-Smtp-Source: ABdhPJz7UBt2WwwWEu4z2b5l2sjr0ukG516PNqgs49w+bQOBYBdYWurKq7ux3cjogkswRzdrs0vxQw==
X-Received: by 2002:a63:5d05:: with SMTP id r5mr18094642pgb.442.1605070192374; 
 Tue, 10 Nov 2020 20:49:52 -0800 (PST)
Received: from localhost (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id b5sm776116pfr.193.2020.11.10.20.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 20:49:51 -0800 (PST)
Date: Wed, 11 Nov 2020 14:49:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 0/9] powerpc/64s: fast interrupt exit
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201106155929.2246055-1-npiggin@gmail.com>
 <fdde16b8-2bb4-f6a2-3c29-61d0169453cf@csgroup.eu>
 <1604997971.w6spl33ij0.astroid@bobo.none>
 <8217782e-1668-7af0-be59-4027eb46b49f@csgroup.eu>
In-Reply-To: <8217782e-1668-7af0-be59-4027eb46b49f@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1605070022.h7goskwvdk.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of November 10, 2020 9:31 pm:
>=20
>=20
> Le 10/11/2020 =C3=A0 09:49, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of November 7, 2020 8:35 pm:
>>>
>>>
>>> Le 06/11/2020 =C3=A0 16:59, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> This series attempts to improve the speed of interrupts and system cal=
ls
>>>> in two major ways.
>>>>
>>>> Firstly, the SRR/HSRR registers do not need to be reloaded if they wer=
e
>>>> not used or clobbered fur the duration of the interrupt.
>>>>
>>>> Secondly, an alternate return location facility is added for soft-mask=
ed
>>>> asynchronous interrupts and then that's used to set everything up for
>>>> return without having to disable MSR RI or EE.
>>>>
>>>> After this series, the entire system call / interrupt handler fast pat=
h
>>>> executes no mtsprs and one mtmsrd to enable interrupts initially, and
>>>> the system call vectored path doesn't even need to do that.
>>>
>>> Interesting series.
>>>
>>> Unfortunately, can't be done on PPC32 (at least on non bookE), because =
it would mean mapping kernel
>>> at 0 instead of 0xC0000000. Not sure libc would like it, and anyway it =
would be an issue for
>>> catching NULL pointer dereferencing, unless we use page tables instead =
of BATs to map kernel mem,
>>> which would be serious performance cut.
>>=20
>> Hmm, why would you have to map at 0?
>=20
> In real mode, physical mem is at 0. If we want to switch from real to vir=
tual mode by just writing=20
> to MSR, then we need virtuel addresses match with real addresses ?

Ah that's what I missed.

64s real mode masks out the top 2 bits of the address which is how that=20
works. But I don't usually think about that path anyway because most
iterrupts arrive with MMU on.

> We could play with chip selects to put RAM at 0xc0000000, but then we'd h=
ave a problem with=20
> exception as they have to be at 0. Or we could play with MSR[IP] and get =
the exceptions at=20
> 0xfff00000, but that would not be so easy I guess.
>=20
>>=20
>> PPC32 doesn't have soft mask interrupts, but you could still test all
>> MSR[PR]=3D0 interrupts to see if they land inside some region to see if
>> they hit in the restart table I think?
>=20
> Yes and this is already what is done at exit for the ones that handle MSR=
[RI] I think.

Interesting, I'll have to check that out.

>>=20
>> Could PPC32 skip the SRR reload at least? That's simpler.
>=20
> I think that would only be possible if real addresses where matching virt=
ual addresses, or am I=20
> missing something ?

No you're right, I was missing something.

Thanks,
Nick
