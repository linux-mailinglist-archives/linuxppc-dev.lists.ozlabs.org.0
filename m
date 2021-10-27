Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8948543C3A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 09:16:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfKjk2wsYz3015
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 18:16:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TNyowIxN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TNyowIxN; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfKj33tHFz2xBw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 18:15:33 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so2800227pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 00:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=BrgA9c28QOGeeuFZcFiP9JX0d9wvOLCyQTdMEuVMSaY=;
 b=TNyowIxNgDg6fWKBNMxfF8yLZ5/E1Rwok12Gbm5pwvP/T5/iGvCAKcpzDivygE7dDx
 XNZpARfzrMjm4+57wTXA5+ph76n/YCU127thh7QcxIQ+AZYX5EptekgSqLXucaUgybd/
 ixca0yPQVbJn3E04wxhjfPHzct6xgKHgQb5P3JfeRxZ07cRX/gvf6H6/1sn3mzIHlOlg
 +R57ZqnN5MAMkFHB+jIkS2LE0rEn0DE6LP13xbUH0NpHGffbclc0WKG+Uj6G0FjqrV0E
 49jWSm5PXYXMJKlcww9vIf6W20tzbSGLLXMwW5pUfSxcWFje33x4LmmKKpQbUGZQ3xV5
 POqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=BrgA9c28QOGeeuFZcFiP9JX0d9wvOLCyQTdMEuVMSaY=;
 b=ka3ueGlDfDeGtaGeyY4WMa7WC9dX0gd9fTQAoRDS80lIdZZ3vA1RAkWbeV1Km1bbmn
 rVI16aLnKL7vdZTDLfbXuGmLORv4ObIW09/xfPVac37MlVVuyRtD5g609Iztp/Jz/8KM
 EpS5QR3lyBZUNpX7rk15W0eyaqWuFVKXPCUacujcTKCYW3GQG1xSvFzRBb5a9EcFVZBt
 0hpeuJZMyGsmrI2VEJ2mX1az2Y6VkZ47SMNmovWLTQlMm4/JFvKHIR/mtxSgEYmh/ymt
 USjXG86z+vryL1kVzTiLuqXoHRp5Eu4MGlFg0CveH2RDd1TVAdsquRbb+VHed1+k0q+P
 bQEg==
X-Gm-Message-State: AOAM5325e84RfL5jc6bn3Sz3GI6mIPJBSSLsldQt/4AMr9QstrWZXNmr
 WCSFVVO2bqO9QP0KAoqO4ZO63oxG/Mk=
X-Google-Smtp-Source: ABdhPJyODz3k88mGyXbKIDNO/njOaRcuRJguMccK5DezoXhS77F3xZrjNmMb2a5MdygFC4FEdOUz+A==
X-Received: by 2002:a17:902:b193:b029:11a:a179:453a with SMTP id
 s19-20020a170902b193b029011aa179453amr26389558plr.69.1635318931276; 
 Wed, 27 Oct 2021 00:15:31 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id f21sm27424616pfc.203.2021.10.27.00.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 00:15:30 -0700 (PDT)
Date: Wed, 27 Oct 2021 17:15:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/book3e: Fix set_memory_x() and set_memory_nx()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <922bdab3a220781bae2360ff3dd5adb7fe4d34f1.1635226743.git.christophe.leroy@csgroup.eu>
 <c41100f9c144dc5b62e5a751b810190c6b5d42fd.1635226743.git.christophe.leroy@csgroup.eu>
 <1635309296.3vv9pb80wz.astroid@bobo.none>
 <063e72e1-fc05-7783-9f42-f681dd08a4b2@csgroup.eu>
 <1635312355.da7w1oggf1.astroid@bobo.none>
 <8ccb9629-43fc-2f36-c9e4-61d6898fb80d@csgroup.eu>
In-Reply-To: <8ccb9629-43fc-2f36-c9e4-61d6898fb80d@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1635318589.wequaidvbx.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of October 27, 2021 3:50 pm:
>=20
>=20
> Le 27/10/2021 =C3=A0 07:27, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of October 27, 2021 2:55 pm:
>>>
>>>
>>> Le 27/10/2021 =C3=A0 06:44, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> Excerpts from Christophe Leroy's message of October 26, 2021 3:39 pm:
>>>>> set_memory_x() calls pte_mkexec() which sets _PAGE_EXEC.
>>>>> set_memory_nx() calls pte_exprotec() which clears _PAGE_EXEC.
>>>>>
>>>>> Book3e has 2 bits, UX and SX, which defines the exec rights
>>>>> resp. for user (PR=3D1) and for kernel (PR=3D0).
>>>>>
>>>>> _PAGE_EXEC is defined as UX only.
>>>>>
>>>>> An executable kernel page is set with either _PAGE_KERNEL_RWX
>>>>> or _PAGE_KERNEL_ROX, which both have SX set and UX cleared.
>>>>>
>>>>> So set_memory_nx() call for an executable kernel page does
>>>>> nothing because UX is already cleared.
>>>>>
>>>>> And set_memory_x() on a non-executable kernel page makes it
>>>>> executable for the user and keeps it non-executable for kernel.
>>>>>
>>>>> Also, pte_exec() always returns 'false' on kernel pages, because
>>>>> it checks _PAGE_EXEC which doesn't include SX, so for instance
>>>>> the W+X check doesn't work.
>>>>>
>>>>> To fix this:
>>>>> - change tlb_low_64e.S to use _PAGE_BAP_UX instead of _PAGE_USER
>>>>> - sets both UX and SX in _PAGE_EXEC so that pte_user() returns
>>>>> true whenever one of the two bits is set
>>>>
>>>> I don't understand this change. Which pte_user() returns true after
>>>> this change? Or do you mean pte_exec()?
>>>
>>> Oops, yes, I mean pte_exec()
>>>
>>> Unless I have to re-spin, can Michael eventually fix that typo while
>>> applying ?
>>>
>>>>
>>>> Does this filter through in some cases at least for kernel executable
>>>> PTEs will get both bits set? Seems cleaner to distinguish user and
>>>> kernel exec for that but maybe it's a lot of churn?
>>>
>>> Didn't understand what you mean.
>>>
>>> I did it like that to be able to continue using _PAGE_EXEC for checking
>>> executability regardless of whether this is user or kernel, and then
>>> continue using the generic nohash pte_exec() helper.
>>>
>>> Other solution would be to get rid of _PAGE_EXEC completely for book3e
>>> and implement both pte_exec() and pte_mkexec() with _PAGE_BAP_UX and
>>> _PAGE_BAP_SX, but I'm not sure it is worth the churn as you say. It
>>> would also mean different helpers for book3s/32 when it is using 32 bit=
s
>>> PTE (CONFIG_PTE_64BIT=3Dn)
>>=20
>> That's basically what I mean. And _PAGE_KERNEL_ROX etc would then not
>> set the UX bit. But at least for now it seems to be an improvement.
>>=20
>=20
> That's already the case:
>=20
> #define _PAGE_KERNEL_RWX	(_PAGE_BAP_SW | _PAGE_BAP_SR | _PAGE_DIRTY |=20
> _PAGE_BAP_SX)
> #define _PAGE_KERNEL_ROX	(_PAGE_BAP_SR | _PAGE_BAP_SX)

So it is, I was looking at the wrong header.

Looks okay to me then, for what it's worth.

Thanks,
Nick
