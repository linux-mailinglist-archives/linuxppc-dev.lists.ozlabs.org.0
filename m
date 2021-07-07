Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4153BE59C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 11:29:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKYzY5G33z3bhw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 19:29:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VkxD7jFU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VkxD7jFU; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKYz40962z3033
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 19:29:19 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id fs7so1189718pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jul 2021 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=jchZkw+FKZli49Idov1A0qv/d0edmDmo36x/4w2EWgs=;
 b=VkxD7jFUHmONoxu5GZbfLBi9nRIJhxf16ID1aYK6PwjkbUsmB9wNl5T1f8raW+0GJl
 bB7/iQdVyEgsS2ch1+JvvlPTsiROwBYS3/Nain3jg/RdgRwIHAQ/819KdcyH+nbgVaq6
 iqaQ0tYEbuYyCTPBrxBguVCNaZEZQYDeXCxB5FmgyyYt03R/Ybw8KViwishtD6uw2sha
 KxFmjVnkOsCXk1nveEk2o6KCrqVnSbCgeIkLhuDwrZ033HPN/RhoCyOvl54nHLFgMagc
 4PtVvHVBrKGPj8B4bt1EIbgE3ht6RJW9gmP/jEETF2PHgy18/Uo8/mzDuFscmSBzPGGH
 gPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=jchZkw+FKZli49Idov1A0qv/d0edmDmo36x/4w2EWgs=;
 b=dB4rDQQ5NrUMtbOIC2+9c1a/iDvI5CTkSgf2JQ3V5WYh+kY1DyNINH8YvETsANZJ8D
 AnOBTRfryjmt1LKICAJbn6FKjAPp1wThi9Rnrve4ZGtZSDfKtM+nxwm+Zh5+lk30dl99
 KZ2YfPYVaQRr3tXMKW7ufBdpbTWJdh26IecxBtYT2vfS8iHpHZHWNCXtD3st88ovfQa5
 YC8fLzMOlx4Xq8oXdaOo8UowGSBbLc/AlMSW3JaKfX1jxYXfpHopXAC+3jGgEmMvy5sU
 y9dlHA6wRZDCx9b6HaGv7SGJre1mDVNjGSG5Pm0B0ZBZmlG1Jwsy+6ojxxe0EUjEvU4b
 KEuw==
X-Gm-Message-State: AOAM530MfWcu5xjpep5zQT1Lxa1/uNNzPdYvXz8u70swQeiYc8SkKk8G
 01zChP4Ha+EXDPpvGXGI4ro=
X-Google-Smtp-Source: ABdhPJzu2P2o6nW8AyL5Iv95K1fV5hjbPuLgawKBe5rgFiu4HtQftA0qTz9YGYR5uLjFVszCVj7SMA==
X-Received: by 2002:a17:90a:7e16:: with SMTP id
 i22mr5192502pjl.12.1625650155425; 
 Wed, 07 Jul 2021 02:29:15 -0700 (PDT)
Received: from localhost (14-203-186-173.tpgi.com.au. [14.203.186.173])
 by smtp.gmail.com with ESMTPSA id x26sm3316540pfu.37.2021.07.07.02.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 02:29:15 -0700 (PDT)
Date: Wed, 07 Jul 2021 19:29:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [FSL P50xx] IRQ issues
To: Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
References: <20210509224926.GA31035@embeddedor>
 <CADnq5_OWk+rXK5xrwu0YOMVC45WyQgFQBTUNkcF8oO3ucp+=XQ@mail.gmail.com>
 <ba5f2a73-58e8-6b3e-4048-bb19f238be51@embeddedor.com>
 <4e0a3130-4c20-aa8a-f32a-6c3f0d9cd6f8@xenosoft.de>
 <86de3024-c025-ec65-a45a-264585730c4a@xenosoft.de>
 <cc1b16c0-47d5-2c50-fba0-9e1aa014ee8a@xenosoft.de>
 <1625527692.m58rsysc62.astroid@bobo.none>
 <8ba2f5a3-5fc8-042b-a738-7545f8fbcf4d@xenosoft.de>
 <74509635-f4e2-d6e7-311f-dbdab8fe317f@xenosoft.de>
In-Reply-To: <74509635-f4e2-d6e7-311f-dbdab8fe317f@xenosoft.de>
MIME-Version: 1.0
Message-Id: <1625650049.uh1jm4qzw5.astroid@bobo.none>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nice, thanks for reporting and testing. I submitted a qemu patch to=20
hopefully avoid this happening again in future.

Thanks,
Nick

Excerpts from Christian Zigotzky's message of July 7, 2021 1:22 am:
> Hi Nick,
>=20
> Your patch works (see patch below)! Many thanks for your help! We tested=20
> it on an A-EON AmigaOne X5000/20 and in a virtual e5500 QEMU machine toda=
y.
>=20
> Screenshots:
>=20
> -=20
> http://www.skateman.nl/wp-content/uploads/2021/07/Screenshot-at-2021-07-0=
6-113237.png
> - https://i.ibb.co/h813RRp/Kernel-5-14-alpha3-Power-PC.png
>=20
> Thanks,
> Christian
>=20
> On 06 July 2021 at 06:07 am, Christian Zigotzky wrote:
>> Hi Nick,
>>
>> Thanks a lot for your patch! We will test it as soon as possible.=20
>> You're right that this issue doesn't exist in a virtual e5500 QEMU=20
>> machine.
>>
>> Have a nice day,
>> Christian
>>
>> On 06 July 2021 at 01:36 am, Nicholas Piggin wrote:
>>> Excerpts from Christian Zigotzky's message of July 6, 2021 4:49 am:
>>>> Hi All,
>>>>
>>>> Our FSL P50xx machines don't boot anymore because of IRQ issues. [1]
>>>>
>>>> Please check the IRQ changes in the latest PowerPC updates 5.14-1. [2]
>>>>
>>>> Thanks,
>>>> Christian
>>>>
>>>> [1]
>>>> https://forum.hyperion-entertainment.com/download/file.php?id=3D2592&m=
ode=3Dview=20
>>>>
>>>> [2]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3D019b3fd94ba73d3ac615f0537440b81f129821f6=20
>>>>
>>> This looks like mtmsrd in the 64e code. I think this should fix it.
>>>
>>> QEMU does not seem to trap on this, maybe something to improve.
>>>
>>> Thanks,
>>> Nick
>>> --=20
>>>
>>> diff --git a/arch/powerpc/kernel/interrupt_64.S=20
>>> b/arch/powerpc/kernel/interrupt_64.S
>>> index 4063e8a3f704..d4212d2ff0b5 100644
>>> --- a/arch/powerpc/kernel/interrupt_64.S
>>> +++ b/arch/powerpc/kernel/interrupt_64.S
>>> @@ -311,9 +311,13 @@ END_BTB_FLUSH_SECTION
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * trace_hardirqs_off().
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0 r11,IRQS_ALL_DISABL=
ED
>>> -=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0 r12,-1 /* Set MSR_EE and MSR_R=
I */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stb=C2=A0=C2=A0=C2=A0 r11,PACAIRQSOFTMAS=
K(r13)
>>> +#ifdef CONFIG_PPC_BOOK3S
>>> +=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0 r12,-1 /* Set MSR_EE and MSR_R=
I */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtmsrd=C2=A0=C2=A0=C2=A0 r12,1
>>> +#else
>>> +=C2=A0=C2=A0=C2=A0 wrteei=C2=A0=C2=A0=C2=A0 1
>>> +#endif
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Calling convention has r9 =3D =
orig r0, r10 =3D regs */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mr=C2=A0=C2=A0=C2=A0 r9,r0
>>
>=20
>=20
