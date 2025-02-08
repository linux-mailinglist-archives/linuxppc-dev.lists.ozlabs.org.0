Return-Path: <linuxppc-dev+bounces-5994-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB39A2D811
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 19:42:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yr0862kWKz2ypW;
	Sun,  9 Feb 2025 05:42:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739040166;
	cv=none; b=BVEGUSpSv4WonMIGvTcVbHTJ9gvVKSjRjM0sgi0IJ+UZk/I28DAdkslJkXn00bNxckteuNhBA2pHClaUDy8uu1e2FBWxB7zHe6uxrhk08Jr9DC0QUdSrBb6EiallgURVvRUGM4PvuLDSPYkRv4Tg8C1ExiKagC4IWEQ3fAb/q0jsByaFS6dWJ8ZOkD1O/r5f5NWE9UskkP85rQir8vOitCCRjnBFEpu42f2TTcl42bWO0c9imnKEXaOS2jLY3VmjtnQsD4y3DykY0AzjCnCPYsD6wdY8mKaPDvJ8+UsxOExPrS/vkS8wD/CjH61MOABiNUAgw9pAvaIJaV2+Ucs1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739040166; c=relaxed/relaxed;
	bh=OF3d2v/Cd40GRW7Y3SKITD/wzvp4wTLT0QafaTbIXWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cS04gtWUPaMEqPRMTdW0L2/kwu+UkqP+LJdKfqmWHfM/EVyrxn5YOg+7UTbOrHSh4LyJmVZvBEFaOAiop1aGP5UMn5twke4Yh9wLfuDvn2B/4Mm9ggKCviPYmGzqOeZN8hQyS3YPCvczBBt6I+NdFEP3A8DsxBxDiLsEphcVk2rJBwhDlP34+4q+oMAp7pjDK2HF8A93Gt8fLbhGWAXoTwbvAB1xUdj6Y8XMAA0a/RlLXWzdtdwUQKr3e+MrHBgov36CEYApeehwBPIubk8e5CydrbanIuN83JFgyJxmmXFUq4ACRJpkl2onQbFGCGmMaRHMN1wydg+3wmJ4FIJ2AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N4tZ1Mv3; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N4tZ1Mv3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yr08504z4z2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 05:42:43 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-307d9a13782so26639161fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Feb 2025 10:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739040159; x=1739644959; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF3d2v/Cd40GRW7Y3SKITD/wzvp4wTLT0QafaTbIXWQ=;
        b=N4tZ1Mv3l7r6mKHiA1eUzDPhALeTYql//JaOrjYEywLZt55PQ57MXTWwkcLNG5Wv3s
         YQdGNYGS7UrBMZZSL4gnvFjxOXBSL2eA01JoJo5CipRCN0sdNGAEdCWxp4UDsuq7Oych
         +zQOLjCOPZtxwIwAiXoUodWd00anYBoWE7wsIeFDYVf8CZWmwwql14Mhg0brBcnUi62P
         uYlU2+P52P04i3s2CU3myDs8phNwsaOeVAcbcxEpFu10AnO5cLilaVOI45J1eTqhsIng
         5I8k3yqB11cuuSnVMJMln98S6bMuJYy7ED+DzpsyiLmmG1/8ci7xvpyQPUyOayjrFOfF
         QvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739040159; x=1739644959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF3d2v/Cd40GRW7Y3SKITD/wzvp4wTLT0QafaTbIXWQ=;
        b=l7FNdKwgnkbVW9nR5lQjE196glp0BOD3LEtjgBJcu4RZgn39ZyEEoDlM8aeM5mXBJj
         f1/KprJzh6deAN5vPCai4NWND4o1wbkCATKJE+XEmau3zaCt5t+rm3fLf7MReNVAGCjK
         z4iuf62G/kamFXumyGMbBE/HEQttJO9N4+7VDEeA/8Gkoo4+KYhdyK2GmHgWKYfiorND
         xamhqUdvpgfl+CnlQvlvWNXM/sTLvj201LVY2SIe8MaEP4Ko5kmaHLvxrYvtUvcT50wS
         wJCHLs5C7F/FcDN7TcjoosEUv9KYc+yZhCTq1lSQuCjK1K3WZKHoXiLsPH9nSXaAtBwE
         6AcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcxxbj/uPF5qYbrKUnBeXP3wXGpRdbJOzxIZ2lOWsKyzjWZJ58mBvRsF+6MotY+ZqetphUJt2o8cRvFII=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxYTJzdcLkbL5T2GsAeOHZgp8ZcjBqDvyPPTdDSw1HXe+U/LGiE
	iEOxdtE21kVR6TKIMVIPB2nNf8iq8wQfJcqxOyGRZ3osUdCNDKrqv0K0r12sIwNdWI39WU9sECU
	pbM23dgo3bXnz6czrf48qmYzER3U=
X-Gm-Gg: ASbGnctGPc8vsmye6uFyPsfZhQTfdeqdhApvVxkMqm3Pb+fWSRIjvMIwu9i3LrvD9LC
	Uhxza9DSMLygQX/O2R+8oivU/2HQPnKsnoO4t+mzo8WWA+yFa3UWAXg6ZOGuUFu5DInuQ1FvpP/
	Qgf2cORIa61iv5kPj6mJiMZRelIiyL3Oo=
X-Google-Smtp-Source: AGHT+IE5yIE5Ue/y+RzFKL8z9km0wUX+8BN+VY4C0BGBjE9wQybUdFtxMRSR6CK8CWLDtOvu3dWumbmGNC9v45fv/pQ=
X-Received: by 2002:a05:651c:199f:b0:307:dc1f:e469 with SMTP id
 38308e7fff4ca-307e580c5d1mr26440881fa.20.1739040158468; Sat, 08 Feb 2025
 10:42:38 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com> <Z6eaDuXnT_rjVSNS@thinkpad>
In-Reply-To: <Z6eaDuXnT_rjVSNS@thinkpad>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 8 Feb 2025 13:42:02 -0500
X-Gm-Features: AWEUYZka1JKrPSYInI4GKv2M2y8rfwixxdFsdqTGcwpCPpsY53i6WsWMtdiDkWA
Message-ID: <CAJ-ks9=f8d7jh=15bHc28Z37p9rA-Kg4J2mQ++VBcsesVvezUA@mail.gmail.com>
Subject: Re: [PATCH 0/3] bitmap: convert self-test to KUnit
To: Yury Norov <yury.norov@gmail.com>
Cc: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Feb 8, 2025 at 12:53=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> [...]
>
> Take over means that you'd at least add the Co-developed-by tag.

I didn't use their code - the thing being "taken over" is the work of
having these debates with the maintainers.

> [...]
>
> KUNIT is disabled in defconfig, at least on x86_64. It is also disabled
> on my Ubuntu 24.04 machine. If I take your patches, I'll be unable to
> boot-test bitmaps. Even worse, I'll be unable to build the standalone
> test from sources as a module and load it later.
>
> Or I misunderstand it, and there's a way to build some particular KUNIT
> test without enabling KUNIT in config and/or re-compiling the whole kerne=
l?
> Please teach me, if so
>
> Unless you give me a way to build and run the test in true
> production environment, I'm not going with KUNITs. Sorry.

This is a question for David -- I don't know if this is possible.

> [...]
>
> This is my evidence: sometimes people report performance or whatever
> issues on their systems, suspecting bitmaps guilty. I ask them to run
> the bitmap or find_bit test to narrow the problem. Sometimes I need to
> test a hardware I have no access to, and I have to (kindly!) ask people
> to build a small test and run it. I don't want to ask them to rebuild
> the whole kernel, or even to build something else.
>
> https://lore.kernel.org/all/YuWk3titnOiQACzC@yury-laptop/

This is compelling evidence, and it was not previously raised. Thank you.

I notice that two things are true about the performance test part of
test_bitmap.c:
- It's a minority of the code in the file (48 lines out of 1462).
- There are no assertions in it.

Do you also find value in running the testing portion on other
people's machines, to which you don't have access?

> [...]
>
> Nice summary for the discussion. Unfortunately you missed my concerns.
> Which are:
>
> Pros:
>  - Now we switch to KUNITs because KUNITs are so good
>
> Cons:
>  - Wipes git history;

I was very careful to minimize churn, and the result is 249 lines on
which I'd now own the blame (228 with `-w`). Still, it's a valid con.

>  - Bloats the test's source code;

The test is 74 lines shorter after this series.

>  - Adds dependencies;
>  - Doesn't run on most popular distros and defconfig;

Yep, I understand your concerns much better now - and I'm grateful for
your having taken the time to explain and show receipts. Still, I
wonder if we can get the best of both worlds - either by finding what
you need in KUnit, or by moving the testing bit to KUnit and keeping
the performance bit where it is.

Thanks.
Tamir

