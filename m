Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D360D388C70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 13:13:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlVbT5gQGz30B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 21:13:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tpVWgGTA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tpVWgGTA; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlVb14lmYz2xty
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 21:12:45 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id p6so6820623plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 04:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=kdQAEAu76INNncaho8Bt0bdchs3rDGFoPptw8O5fZ+g=;
 b=tpVWgGTA4m2hNOvhlCU5yRq1j46tosc/esW4axep8ee0UqBruPl/LtBbT0vktDzlb8
 RfAMxKLMvJdbrH0bMfJit6+1ob5zha/3FTdym+4E8DrDm0MdRPtH5ypvMOuSDJqAUOfN
 y6tB9utCHbDDoH253iYXn4t/RJ0Fm+c513E5wrLqxb4bX0OOLABmlbYA1f+3VD+ZQ5BK
 JOQjPL9MVq08k1ysMoed06xeTUbZp9S73KsUN34NhLyeyxI+/Y3DJ7tACVepzNr6r8vX
 c4DsxCR9c5Cqa6+ieRLRT9KT7cI5oMY+/Qf2t30P//dvh8tiAz7WDNYMI0/FrTN7VYBn
 kkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=kdQAEAu76INNncaho8Bt0bdchs3rDGFoPptw8O5fZ+g=;
 b=BatLyGvzVU5bSGS/Xe+b7Kxj1ekNwkrtCXaCCmZmEl++ymacWH0xrkUIEyHOY+2JhW
 8UcLqQy2V2ODJyuh5Bi6xRkYNMbWM9fmuucsZUc+VMEldICuQP2E0KJr7Em63iXwJp+m
 eF2eMW3bOUg1kLv/O48AQjogzchNnFacqnYMGNujEGHIh+1lE2fOc29K1D+YfJZQtjmK
 t+eQlDZuuSumda2u+eSb2DyqCFrGvpqd57r82vbdgq5u0hGWQI55l8U4f76JJTMpHbUI
 MK59fvv04scdP8pl8cnp0g1KsXZvEpuobBGqHyRSft0d6tOGrpwE2Nq8IEtuZ2jNmvqI
 pCBA==
X-Gm-Message-State: AOAM532aBM4rk1h816cRW0LrRVjRrUuakcrDnc/oDAqs9FgNH/8WjfPb
 +696D0s1CNCB12JDeX09l+s=
X-Google-Smtp-Source: ABdhPJw7V3xAbm9WRiDnAy2CSI5boC9catqyT3n26FSZl9aoWuFPkpEQmN7mgJUwOoadbbwf1M7Ojw==
X-Received: by 2002:a17:903:49:b029:f1:75c4:3eb3 with SMTP id
 l9-20020a1709030049b02900f175c43eb3mr10341165pla.76.1621422762320; 
 Wed, 19 May 2021 04:12:42 -0700 (PDT)
Received: from localhost (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id 3sm13956232pff.132.2021.05.19.04.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 04:12:42 -0700 (PDT)
Date: Wed, 19 May 2021 21:12:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "ldv@altlinux.org"
 <ldv@altlinux.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <9b5ea7059c5a5d4e9ccccd7d73ce2c66b2203f52.camel@infinera.com>
 <1621410291.c7si38sa9q.astroid@bobo.none>
 <fb9b6a6099855bd00efc6ffe540ccad14dd9a365.camel@infinera.com>
 <1621413143.oec64jaci5.astroid@bobo.none>
In-Reply-To: <1621413143.oec64jaci5.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1621422559.vsmpjhjqzq.astroid@bobo.none>
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
Cc: "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of May 19, 2021 6:42 pm:
> Excerpts from Joakim Tjernlund's message of May 19, 2021 6:08 pm:
>> On Wed, 2021-05-19 at 17:55 +1000, Nicholas Piggin wrote:
>>> Excerpts from Joakim Tjernlund's message of May 19, 2021 5:33 pm:
>>> > On Wed, 2021-05-19 at 02:13 +0300, Dmitry V. Levin wrote:
>>> > > Hi,
>>> > >=20
>>> > > On Thu, Jun 11, 2020 at 06:12:01PM +1000, Nicholas Piggin wrote:
>>> > > [...]
>>> > > > - Error handling: The consensus among kernel, glibc, and musl is =
to move to
>>> > > > =C2=A0=C2=A0using negative return values in r3 rather than CR0[SO=
]=3D1 to indicate error,
>>> > > > =C2=A0=C2=A0which matches most other architectures, and is closer=
 to a function call.
>>> >=20
>>> > What about syscalls like times(2) which can return -1 without it bein=
g an error?
>>>=20
>>> They do become errors / indistinguishable and have to be dealt with by=20
>>> libc or userspace. Which does follow what most architectures do (all=20
>>> except ia64, mips, sparc, and powerpc actually).
>>>=20
>>> Interesting question though, it should have been noted.
>>>=20
>>> Thanks,
>>> Nick
>>=20
>> I always figured the ppc way was superior. It begs the question if not t=
he other archs should
>> change instead?
>=20
> It is superior in some ways, not enough to be worth being different.
>=20
> Other archs are unlikely to change because it would be painful for
> not much benefit. New system calls just should be made to not return
> error numbers. If we ever had a big new version of syscall ABI in
> Linux, we can always use another scv vector number for it.

Or... is it possible at syscall entry to peek the address of
the instruction which caused the call and see if that was a
scv instruction? That would be about as reliable as possible
without having that new flag bit.

Thanks,
Nick
