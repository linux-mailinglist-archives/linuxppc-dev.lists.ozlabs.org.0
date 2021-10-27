Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6D443C58A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 10:52:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfMrN019Mz2yQy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 19:52:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CHBG61uL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CHBG61uL; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfMqh0Hb6z2xXc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 19:51:25 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d9so2073693pfl.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 01:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=sIX7x+jsOOh5AaV+S5PO7/zC51BozSS5Rq+F5YdEC2E=;
 b=CHBG61uLzvDqfRJ/+PW1nWr4QbYXNL3OH9IqUgo1TQV2OdCDHJL35LJxNDytgZHgSD
 ZgDKIj7n6JkhUFlv1ZPMBaLePDJWpa1vN5bBoJZJ5/gPgWQb7a/4Eyo2IRJkueD/ZjMV
 v3dBzwXDOnEc+NcY8x9noBBUOk79O2+8qEybPerdpJSUbtwwuCjsU/mSrcQ9N4qOg3jG
 rsVa6VUMGfmfp1xP/euxae0Wfy5FXZJ/lQN2K4O/j8Qd+Y6ykNli8q/vm2RZD1Z9tcQl
 tA1/wnmpOEUbDzKXGUVw2jDOzzeLmDA4aH08l8Qj05swAte4/dXG1zhxf3yInQEbQQrG
 PS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=sIX7x+jsOOh5AaV+S5PO7/zC51BozSS5Rq+F5YdEC2E=;
 b=vlinObMetHTvX5gpH/jN5MsbDQiAYhdBrDISP1V+yThR+Tg5+qKsQfug8iVBEM70yN
 AquKLzygVUoqgop+b+tVBxRRdQ8gWBGzUyOYbFWeLQl1nXq2mBy+erncyjSv+Cx1RyKr
 n5aIO08XqptZ+tM+zXpYkE8mnqvFu+JZVZ2ea2s3d6wjuommjREIE4s9svoETLzvqdjo
 lluNym88UZZ94Y1Y2GmMhP8GrOpV2eYIKuCr0CT7IFiC9Vi1RL3BxLxfy2crDmMbgAWP
 o07bTRxPYWjHfCnJBNSEej2AMqrmlg0ctWb3HlrrUUQ26HnVOKsZUZ+UPw4kdJPr4WZO
 L7sA==
X-Gm-Message-State: AOAM531dD/Vt9Os9XNRniCqe9O9Fxv0fzkVMmIzyRN3PRocEw1WQsJUt
 YkndyT5/35IvQIQUGNlkc3I=
X-Google-Smtp-Source: ABdhPJzJStwG8g1rHK/ea6WbgB2QH2Oeg9CnSFm4YNIijvWtlX1WDWWt3VR8/1WOY8yJRSwbFc3nXg==
X-Received: by 2002:a63:7553:: with SMTP id f19mr18914218pgn.328.1635324682687; 
 Wed, 27 Oct 2021 01:51:22 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id n29sm4691263pfv.77.2021.10.27.01.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 01:51:22 -0700 (PDT)
Date: Wed, 27 Oct 2021 18:51:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/watchdog: prevent printk and send IPI while
 holding the wd lock
To: benh@kernel.crashing.org, Laurent Dufour <ldufour@linux.ibm.com>,
 mpe@ellerman.id.au, paulus@samba.org
References: <20211026162740.16283-1-ldufour@linux.ibm.com>
 <20211026162740.16283-2-ldufour@linux.ibm.com>
 <1635303699.wgz87uxy4c.astroid@bobo.none>
 <33e15005-d342-5270-9b9d-64750f8794a7@linux.ibm.com>
In-Reply-To: <33e15005-d342-5270-9b9d-64750f8794a7@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1635324001.1tf9yz448t.astroid@bobo.none>
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

Excerpts from Laurent Dufour's message of October 27, 2021 6:14 pm:
> Le 27/10/2021 =C3=A0 05:29, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Laurent Dufour's message of October 27, 2021 2:27 am:
>>> When handling the Watchdog interrupt, long processing should not be don=
e
>>> while holding the __wd_smp_lock. This prevents the other CPUs to grab i=
t
>>> and to process Watchdog timer interrupts. Furhtermore, this could lead =
to
>>> the following situation:
>>>
>>> CPU x detect lockup on CPU y and grab the __wd_smp_lock
>>>        in watchdog_smp_panic()
>>> CPU y caught the watchdog interrupt and try to grab the __wd_smp_lock
>>>        in soft_nmi_interrupt()
>>> CPU x wait for CPU y to catch the IPI for 1s in __smp_send_nmi_ipi()
>>=20
>> CPU y should get the IPI here if it's a NMI IPI (which will be true for
>>> =3D POWER9 64s).
>>=20
>> That said, not all platforms support it and the console lock problem
>> seems real, so okay.
>>=20
>>> CPU x will timeout and so has spent 1s waiting while holding the
>>>        __wd_smp_lock.
>>>
>>> A deadlock may also happen between the __wd_smp_lock and the console_ow=
ner
>>> 'lock' this way:
>>> CPU x grab the console_owner
>>> CPU y grab the __wd_smp_lock
>>> CPU x catch the watchdog timer interrupt and needs to grab __wd_smp_loc=
k
>>> CPU y wants to print something and wait for console_owner
>>> -> deadlock
>>>
>>> Doing all the long processing without holding the _wd_smp_lock prevents
>>> these situations.
>>=20
>> The intention was to avoid logs getting garbled e.g., if multiple
>> different CPUs fire at once.
>>=20
>> I wonder if instead we could deal with that by protecting the IPI
>> sending and printing stuff with a trylock, and if you don't get the
>> trylock then just return, and you'll come back with the next timer
>> interrupt.
>=20
> That sounds a bit risky to me, especially on large system when system goe=
s=20
> wrong, all the CPU may try lock here.

That should be okay though, one will get through and the others will=20
skip.

> Furthermore, now operation done under the lock protection are quite fast,=
 there=20
> is no more spinning like the delay loop done when sending an IPI.
>=20
> Protecting the IPI sending is a nightmare, if the target CPU is later pla=
y with=20
> the lock we are taking during the IPI processing, furthermore, if the tar=
get CPU=20
> is not responding the sending CPU is waiting for 1s, which slows all the =
system=20
> due to the lock held.
> Since I do a copy of the pending CPU mask and clear it under the lock=20
> protection, the IPI sending is safe while done without holding the lock.

Protecting IPI sending basically has all the same issues in the NMI
IPI layer.

>=20
> Regarding the interleaved traces, I don't think this has to be managed do=
wn=20
> here, but rather in the printk/console path.

It can't necessarily be because some of the problem is actually that a=20
NMI handler can be interrupted by another NMI IPI because the caller
can return only after handlers start running rather than complete.

I don't think it would be an additional nightmare to trylock.

Thanks,
Nick
