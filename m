Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E511AFFE6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 04:35:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4959lk4cKqzDqlD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 12:35:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=buXwYOSY; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4959k31xR2zDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 12:33:44 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id t16so3386440plo.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 19:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=L1slcAQ03yqr0UgkJFkFmizJ4fWCDEfRZtw4Be329Kk=;
 b=buXwYOSYxE+h5aZAv9blpmsTpPOohphn2LAIgNaT5eTkAKR7HOC2DMvfGQrC49O457
 6Zvm+gcTo8AczZVCiY0gBBRm0jVisqVWYNE5PfbIIculaiEiZ3IW5gXyxtbHaajXgwkg
 mCDSdNQDfP6okK5tRWsmBUMyoWzFc+4BHvx78XtYwh0jIVmfvO4CSZ+nCbZEplCo5w7p
 9ZwYIcMJPLotl21b7SdTgf8+OHhioK8eRunV70D7rpKwFmr4zIhI7OYriirPBtOU9lP7
 QFFdQB+d6IybAJGDdaFcidtfgZx0dsKm3KkaveVe0QaSsWE5ZJAC8jQwVWpkjHsMw44E
 d1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=L1slcAQ03yqr0UgkJFkFmizJ4fWCDEfRZtw4Be329Kk=;
 b=jFruYvbPXWmtCgyw9hUaxpWT5ErFgD2oB1eYDRyVOMtXtRpekI7V4qX7FN0N/3hAa1
 IX0jVvWp3y1Hey9HqYdafIMfZVNNrmuUwsEzbznFs5VwLqduID34ag3H977MwfLYxBRo
 2W0UwjRglihp3mTF1WWSsAjfpXKqIWf6iXpk578sxuTm075StJCqzkVJTpR2WT3Gg6tL
 5IUby+QBaSoD+ZtOya9n6n0mSJmS1tOkAL9invh5LMnWjFW6rt8pGxmM/TKwafFpv8jH
 +d6CiajeyAnTZoMCIp0pBQYCwG053E2erBmNPjfyxrc87XW0+sEYjvUM6eypPzxQ9FfN
 n4XQ==
X-Gm-Message-State: AGi0PubtyygJNrigUVyCKxz7ltUGNc4kYfAHz0aKEeP6ijND7DLCjf2v
 /g2wMEaRGfE12SB8tKqcPyCm9YW6
X-Google-Smtp-Source: APiQypJ/fxob5JBsPtiGvBjdl3sbaFaLamwPooRSb3w6a4QKOelVokoK+IfhuAvRHxhKXhoRIksQqQ==
X-Received: by 2002:a17:90a:e7c5:: with SMTP id
 kb5mr18119517pjb.187.1587350021346; 
 Sun, 19 Apr 2020 19:33:41 -0700 (PDT)
Received: from localhost ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id v4sm25710207pfb.31.2020.04.19.19.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2020 19:33:40 -0700 (PDT)
Date: Mon, 20 Apr 2020 12:32:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Rich Felker <dalias@libc.org>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
 <20200420013412.GZ11469@brightrain.aerifal.cx>
In-Reply-To: <20200420013412.GZ11469@brightrain.aerifal.cx>
MIME-Version: 1.0
Message-Id: <1587348538.l1ioqml73m.astroid@bobo.none>
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
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Rich Felker's message of April 20, 2020 11:34 am:
> On Mon, Apr 20, 2020 at 11:10:25AM +1000, Nicholas Piggin wrote:
>> Excerpts from Rich Felker's message of April 17, 2020 4:31 am:
>> > Note that because lr is clobbered we need at least once normally
>> > call-clobbered register that's not syscall clobbered to save lr in.
>> > Otherwise stack frame setup is required to spill it.
>>=20
>> The kernel would like to use r9-r12 for itself. We could do with fewer=20
>> registers, but we have some delay establishing the stack (depends on a
>> load which depends on a mfspr), and entry code tends to be quite store
>> heavy whereas on the caller side you have r1 set up (modulo stack=20
>> updates), and the system call is a long delay during which time the=20
>> store queue has significant time to drain.
>>=20
>> My feeling is it would be better for kernel to have these scratch=20
>> registers.
>=20
> If your new kernel syscall mechanism requires the caller to make a
> whole stack frame it otherwise doesn't need and spill registers to it,
> it becomes a lot less attractive. Some of those 90 cycles saved are
> immediately lost on the userspace side, plus you either waste icache
> at the call point or require the syscall to go through a
> userspace-side helper function that performs the spill and restore.

You would be surprised how few cycles that takes on a high end CPU. Some=20
might be a couple of %. I am one for counting cycles mind you, I'm not=20
being flippant about it. If we can come up with something faster I'd be=20
up for it.

>=20
> The right way to do this is to have the kernel preserve enough
> registers that userspace can avoid having any spills. It doesn't have
> to preserve everything, probably just enough to save lr. (BTW are

Again, the problem is the kernel doesn't have its dependencies=20
immediately ready to spill, and spilling (may be) more costly=20
immediately after the call because we're doing a lot of stores.

I could try measure this. Unfortunately our pipeline simulator tool=20
doesn't model system calls properly so it's hard to see what's happening=20
across the user/kernel horizon, I might check if that can be improved
or I can hack it by putting some isync in there or something.

> syscall arg registers still preserved? If not, this is a major cost on
> the userspace side, since any call point that has to loop-and-retry
> (e.g. futex) now needs to make its own place to store the original
> values.)

Powerpc system calls never did. We could have scv preserve them, but=20
you'd still need to restore r3. We could make an ABI which does not
clobber r3 but puts the return value in r9, say. I'd like to see what
the user side code looks like to take advantage of such a thing though.

Thanks,
Nick
