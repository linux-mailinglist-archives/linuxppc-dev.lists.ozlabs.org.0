Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0268A1AB655
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 05:44:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492lTx0mlkzDrD1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 13:44:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TFhYteRH; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492lQB1cyQzDr83
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 13:41:38 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id m21so1034527pff.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 20:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Z9O0pZ2p7ciHcWf3QNrxtPlkP1qSZEC8S5OBGgW/IQw=;
 b=TFhYteRHDpRvimovB/R0iOhrSXoupEpMjsur++qOeh/i5avnxQ6f638jdv2FfO7p+x
 aWyno9oxqo2EiB2GCZXcLWW8FhnEqIjdWN6DuOLKejdYQzhXtWYkWTRQ53oE21r6CqhF
 4vOsm040nKu4vx6Z01yff2S+dcGCawUNisBBMC9cEeRytvnLMzy7H0Wu+TRsyaguTirX
 Ytf1UxTbkwweGjwXpjJTi2nnKA4qnnBi+ur7g9PJNCyCXVYxJEEW5ZxfBw4PbIaNi0Tc
 5KQCxQg1RHpGCWoq3gjos0ot5YkgBy+6nbjowvb/dvE/VB9gPVVdw83KFgRNTIrUffg3
 kDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Z9O0pZ2p7ciHcWf3QNrxtPlkP1qSZEC8S5OBGgW/IQw=;
 b=F6OiWEbdoanuXAYR6dwtGskyCrm4mEnoagOIDvTo224JbJ3gQA1G6k2XLu0emHUHXY
 yFj8NScmmI5uIghdtQMH/EKnXKp6mIU5rgPT/+SKNFu5zFxL9QgZSu+DEUyXkEW0MXGh
 NOyrcdoio2gopl6mVtL/dm24kB+O2Nmsz52q52V1N5Wcwxfc4e+Xvm9NVYUksE/2cDPz
 mh9K5gXE3dua0fdanawLK/QjxD8bcjkDymXOzc274iE7jQE5WiMsSDJGxPEXqX4+c23W
 EN94tZHA7wd9xwy+olCgmfOViRgR2Buek19kR6gQBStrAIJN/K/s+hS7LVA3DZ20t77g
 gtYA==
X-Gm-Message-State: AGi0PuYFvfUaMn9kLD4DmuMAfVG5dy7OFDAvdm7peRnIY+I2AkpUchD6
 mx1s23pBxX8Xj78T8rBgYAs=
X-Google-Smtp-Source: APiQypKeMiEyos0BNu9CFePCNQutY2CaDFVyj6RZIFFZMby2BpaivbNPl5pWflF6yjbXZswcULoU3g==
X-Received: by 2002:a63:7b1a:: with SMTP id w26mr28207212pgc.298.1587008493091; 
 Wed, 15 Apr 2020 20:41:33 -0700 (PDT)
Received: from localhost ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id w13sm320882pfn.192.2020.04.15.20.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 20:41:32 -0700 (PDT)
Date: Thu, 16 Apr 2020 13:41:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Rich Felker <dalias@libc.org>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <1586994952.nnxigedbu2.astroid@bobo.none>
 <20200416004843.GO11469@brightrain.aerifal.cx>
 <1587002854.f0slo0111r.astroid@bobo.none>
 <20200416023542.GP11469@brightrain.aerifal.cx>
 <1587004907.ioxh0bxsln.astroid@bobo.none>
 <20200416030304.GQ11469@brightrain.aerifal.cx>
In-Reply-To: <20200416030304.GQ11469@brightrain.aerifal.cx>
MIME-Version: 1.0
Message-Id: <1587007359.3k5vvojlfu.astroid@bobo.none>
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
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Rich Felker's message of April 16, 2020 1:03 pm:
> On Thu, Apr 16, 2020 at 12:53:31PM +1000, Nicholas Piggin wrote:
>> > Not to mention the dcache line to access
>> > __hwcap or whatever, and the icache lines to setup access TOC-relative
>> > access to it. (Of course you could put a copy of its value in TLS at a
>> > fixed offset, which would somewhat mitigate both.)
>> >=20
>> >> And finally, the HWCAP test can eventually go away in future. A vdso
>> >> call can not.
>> >=20
>> > We support nearly arbitrarily old kernels (with limited functionality)
>> > and hardware (with full functionality) and don't intend for that to
>> > change, ever. But indeed glibc might want too eventually drop the
>> > check.
>>=20
>> Ah, cool. Any build-time flexibility there?
>>=20
>> We may or may not be getting a new ABI that will use instructions not=20
>> supported by old processors.
>>=20
>> https://sourceware.org/legacy-ml/binutils/2019-05/msg00331.html
>>=20
>> Current ABI continues to work of course and be the default for some=20
>> time, but building for new one would give some opportunity to drop
>> such support for old procs, at least for glibc.
>=20
> What does "new ABI" entail to you? In the terminology I use with musl,
> "new ABI" and "new ISA level" are different things. You can compile
> (explicit -march or compiler default) binaries that won't run on older
> cpus due to use of new insns etc., but we consider it the same ABI if
> you can link code for an older/baseline ISA level with the
> newer-ISA-level object files, i.e. if the interface surface for
> linkage remains compatible. We also try to avoid gratuitous
> proliferation of different ABIs unless there's a strong underlying
> need (like addition of softfloat ABIs for archs that usually have FPU,
> or vice versa).

Yeah it will be a new ABI type that also requires a new ISA level.
As far as I know (and I'm not on the toolchain side) there will be
some call compatibility between the two, so it may be fine to
continue with existing ABI for libc. But it just something that
comes to mind as a build-time cutover where we might be able to
assume particular features.

> In principle the same could be done for kernels except it's a bigger
> silent gotcha (possible ENOSYS in places where it shouldn't be able to
> happen rather than a trapping SIGILL or similar) and there's rarely
> any serious performance or size benefit to dropping support for older
> kernels.

Right, I don't think it'd be a huge problem whatever way we go,
compared with the cost of the system call.

Thanks,
Nick
