Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B538C1B385A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 08:58:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496WVP15r7zDqP2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 16:58:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YDBiU1fW; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496WSh2ZrjzDqQW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 16:56:51 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y25so606915pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=McFY1qmfP9otNM9K4ThqnjSfg4IHXwK59iAZ0RpC3/0=;
 b=YDBiU1fWRxyj0yw5PMoz4K6spGqX8NJLH0izSdv0BeEoavGlDM4FaLH7kc8wlbBlsM
 xv/uOutJelLuLut7MiNOTYrHCSu1d/CObgcbujiQHc6YeOS9LYtu6BFJGjF2//B+aQSZ
 6wnyOokBJ2H42WtcwxZEGU2725Q63pKsR4PDVByhJX25RZsu0+hCUeZts88Ox13UnCKN
 FdH9RuOOiY7A/3VE+lFBiRkd9ITCCPioNRVG/m7JMdlV6NT+Pfac9lvjovXZE/xl0zyH
 U/avIlgd54AFU1QZ6MTuUDiSPKZc+sVqS5k5+fWHnQcTYGupTjp4VBmIB8Fytk7XGSR9
 mtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=McFY1qmfP9otNM9K4ThqnjSfg4IHXwK59iAZ0RpC3/0=;
 b=UoWyGA6/sU03/AFUI8Rj3MzbCojQ4G42mPDhhAUYO9UDD5n2zOqtAbzGbh6tnGp50s
 i4/JETAVZRRZHHyVVNi5h8Ks2KM8z3gghgKdI+EQUOev4hHW4GBQXLp6Yv4vWDvmuQZw
 wOVpaOi3UhuI5MkKz4fsVnPhjmstrHkE7vMEUhwod/YLfZq3q33KCepyZWqUejFn8VYQ
 elBdbTMthA6w8+HCPN3neacxQLj6UJMSuil5fuJr4CJKjbj4/AWLFeGS6dbyyaLvy78K
 GYafPSaTYFtzIsNBLV3zrcNudMZ6yuSD5Low9s+DUcS2HTveQt73HBOq34plJKjU95hN
 WQBQ==
X-Gm-Message-State: AGi0Pua1n7eIwHbPZveHjoALAf8Ali/hep4Pz/eZKfMMiv5/rzYvXscF
 TP+iYCxwoXJ2Dop87r/D09k=
X-Google-Smtp-Source: APiQypL2bvrJpMnUAGbe1Gdl7oeNveEtwNKWNpmIrUM5eIUx+uqLrvcBGD43Q3+qdWvb232bkHIJ+w==
X-Received: by 2002:a63:e03:: with SMTP id d3mr18039918pgl.47.1587538607940;
 Tue, 21 Apr 2020 23:56:47 -0700 (PDT)
Received: from localhost ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id d14sm4516503pfr.35.2020.04.21.23.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 23:56:47 -0700 (PDT)
Date: Wed, 22 Apr 2020 16:54:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Powerpc Linux 'scv' system call ABI proposal take 2
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>, Rich Felker
 <dalias@libc.org>, David Laight <David.Laight@ACULAB.COM>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
 <b77fa2dc769d42e1a3e68f5edf90d250@AcuMS.aculab.com>
 <20200421143941.GJ11469@brightrain.aerifal.cx>
 <960127e0-57a0-55b4-f309-ae0a675c7756@linaro.org>
In-Reply-To: <960127e0-57a0-55b4-f309-ae0a675c7756@linaro.org>
MIME-Version: 1.0
Message-Id: <1587536988.ivnp421w2w.astroid@bobo.none>
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
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let me try to summarise what we have.

- vdso style call is ruled out as unnecessary with possible security=20
  concerns. Caller can internally use indirect branch to select variant=20
  if it wants to use that mechanism to select.

- LR clobber seems to handled okay by gcc. It can increase size of small=20
  leaf wrapper functions, but they can use the caller stack frame for=20
  this (and even red zone for saving other things if necessary), but not=20
  a huge amount.

- -ve error return seems to be favoured by everyone. Experimentally,=20
  it's better for musl (but musl could probably improve cr0[SO] error=20
  handling a bit 'asm goto').

- Preserving syscall args and volatiles up to r8 is a small but=20
  noticable help for cases that inline the call rather than always call=20
  wrappers. This is unlikely to be helpful unless 'sc' support is=20
  compiled out but I'll consider doing it for the long term. Next step=20
  is to trace and test on real hardware.

- One thing that nobody has really asked about is error handling for=20
  unsupported scv vectors, so I would like to just go over it:

Today, the scv facility is disabled by the kernel (FSCR[SCV] is=20
cleared), which makes any `scv` instruction take a facility
unavailable, which ends up printing a kernel message about SCV
facility unavilable, and SIGILL's the process with ILL_ILLOPC.

Enabling 'scv 0' will enable 1-127 as well, so the kernel has to handle=20
those somehow.

What we are saying is that we will allocate HWCAP bits in future if we=20
implement more scv vectors, so userspace is not *supposed* to rely on=20
this, but kernel has to choose some behaviour for invalid vectors.

My proposal was to do the same SIGILL (with no kernel facility message),
so it appears to behave the same way to userspace as it does now. There=20
is also the ILL_ILLOPN code that could be used as invalid operand, but
powerpc does not use this much, and e.g., the static instruction=20
coded operands e.g., invalid mfspr generate ILL_ILLOPC so we could=20
consider the entire instruction as the opcode, and input register values=20
as operands.

Now I don't know why a process would want to distinguish between=20
FSCR[SCV]=3D0 and the case where it is enabled but kernel doesn't=20
implement the vector, but maybe it does?

Another option would be to use a different signal. I don't see that any=20
are more suitable.

Or return without a signal but -ENOSYS or something in r3. This doesn't=20
seem so good because an invalid scv vector is not a system call, and a=20
failure ABI would constrain any future implementation just a little bit.

Any objections to SIGILL ILL_ILLOPC?

Thanks,
Nick
