Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CD42E75B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 03:35:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5FkF53DLzDqJP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 13:35:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nDaFL5lx; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5FhB4ntgzDqGb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Dec 2020 13:33:13 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id w5so10571628pgj.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Dec 2020 18:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=PfIl0EjmWMxnSF+EOk80ZAbjAPzwaEf3qyLecMl/XRc=;
 b=nDaFL5lxYCUZxEPCVotfMjioI5BLNIhicG92GYRl+bW9o7TrWxGxPe0PqDXDUdvxGL
 ovvYBF0bISGn/Zpzf1pyHYOdLFAxrz3UfAR1lXz51N/K03KuWE71VFegfMD1DDIP/drp
 KUhqJ9Fn3WcSfrmIuDfPZ/QOnNSC22L/Z/ORAmWhZN1D2xASIe52OucM/qXVfSayaGAT
 57fbAo1T7kYgyhJGZ9Evd5nqFiAIc1edFYHuzkkIxctQBFyOJMPSHfXVdoKBjZA9clIV
 kEZ8gdlTRJigmHZJrUOZzCZPE80ijU9zMl4P4nZYuEkJlMxEzvQaP8bXxzoxR5aFvcz5
 +Drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=PfIl0EjmWMxnSF+EOk80ZAbjAPzwaEf3qyLecMl/XRc=;
 b=QCDVh8NzrThiMxT4jkuJ/VQEdWYR4to6N0IUZiZD8GvSeZWV9W/XaC3v5CzkgbqYFs
 wwi5Bj9ORb5UKMDLhDt1dLn4BClFiVo05J09WQafBV9Nl+y/xLTIUMKTkSRceZZmiri6
 k3bbSV4XzGczZ2Cnk0mGE2yUNYiluCB49dsjsGG+mbmeZ/P6MCRQ6/+5SEBqD+GVxQzB
 fLWRKz5xldU7EI2Qlzat+Id4NDyy8mwizogq2SfEYz3jCk36nTDbpGlNAniXcuMDSfmv
 q0eR5F/obQ67v3y+Isca0sJWEyfj6r64sRKHyJEHuSWaCkfPw0HBj9vFsHp59Clw8/vj
 +jLQ==
X-Gm-Message-State: AOAM531uue46MVY4bVAe4/ezeWmp5mrIyfEyn3rRE6o0BVGfE33/2BXR
 NvMKaHq+Dsto8MdNKXowczI=
X-Google-Smtp-Source: ABdhPJxrOi9/gzDcjAgCtPx6FdiSP/JyedYlzSeHtVs/umobQsm2fE2URPOa8A0aW0Z8ZJFEkl2N/w==
X-Received: by 2002:a63:c04b:: with SMTP id z11mr50606521pgi.74.1609295589813; 
 Tue, 29 Dec 2020 18:33:09 -0800 (PST)
Received: from localhost (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id 6sm39988438pfj.216.2020.12.29.18.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Dec 2020 18:33:08 -0800 (PST)
Date: Wed, 30 Dec 2020 12:33:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <20201228102537.GG1551@shell.armlinux.org.uk>
 <CALCETrWQx0qwthBc5pJBxs2PWAQo-roAz-6g=7HOs+dsiokVsg@mail.gmail.com>
 <CAG48ez0YZ_iy6qZpdGUj38wqeg_NzLHHhU-mBCBf5hcopYGVPg@mail.gmail.com>
 <20201228190852.GI1551@shell.armlinux.org.uk>
 <CALCETrVpvrBufrJgXNY=ogtZQLo7zgxQmD7k9eVCFjcdcvarmA@mail.gmail.com>
 <1086654515.3607.1609187556216.JavaMail.zimbra@efficios.com>
 <CALCETrXx3Xe+4Y6WM-mp0cTUU=r3bW6PV2b25yA8bm1Gvak6wQ@mail.gmail.com>
 <1609200902.me5niwm2t6.astroid@bobo.none>
 <CALCETrX6MOqmN5_jhyO1jJB7M3_T+hbomjxPYZLJmLVNmXAVzA@mail.gmail.com>
 <1609210162.4d8dqilke6.astroid@bobo.none>
 <20201229104456.GK1551@shell.armlinux.org.uk>
In-Reply-To: <20201229104456.GK1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Message-Id: <1609290821.wrfh89v23a.astroid@bobo.none>
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
Cc: paulmck <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, Peter Zijlstra <peterz@infradead.org>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Russell King - ARM Linux admin's message of December 29, 2020=
 8:44 pm:
> On Tue, Dec 29, 2020 at 01:09:12PM +1000, Nicholas Piggin wrote:
>> I think it should certainly be documented in terms of what guarantees
>> it provides to application, _not_ the kinds of instructions it may or
>> may not induce the core to execute. And if existing API can't be
>> re-documented sanely, then deprecatd and new ones added that DTRT.
>> Possibly under a new system call, if arch's like ARM want a range
>> flush and we don't want to expand the multiplexing behaviour of
>> membarrier even more (sigh).
>=20
> The 32-bit ARM sys_cacheflush() is there only to support self-modifying
> code, and takes whatever actions are necessary to support that.
> Exactly what actions it takes are cache implementation specific, and
> should be of no concern to the caller, but the underlying thing is...
> it's to support self-modifying code.

   Caveat
       cacheflush()  should  not  be used in programs intended to be portab=
le.
       On Linux, this call first appeared on the MIPS architecture, but  no=
wa=E2=80=90
       days, Linux provides a cacheflush() system call on some other archit=
ec=E2=80=90
       tures, but with different arguments.

What a disaster. Another badly designed interface, although it didn't=20
originate in Linux it sounds like we weren't to be outdone so
we messed it up even worse.

flushing caches is neither necessary nor sufficient for code modification
on many processors. Maybe some old MIPS specific private thing was fine,
but certainly before it grew to other architectures, somebody should=20
have thought for more than 2 minutes about it. Sigh.

>=20
> Sadly, because it's existed for 20+ years, and it has historically been
> sufficient for other purposes too, it has seen quite a bit of abuse
> despite its design purpose not changing - it's been used by graphics
> drivers for example. They quickly learnt the error of their ways with
> ARMv6+, since it does not do sufficient for their purposes given the
> cache architectures found there.
>=20
> Let's not go around redesigning this after twenty odd years, requiring
> a hell of a lot of pain to users. This interface is called by code
> generated by GCC, so to change it you're looking at patching GCC as
> well as the kernel, and you basically will make new programs
> incompatible with older kernels - very bad news for users.

For something to be redesigned it had to have been designed in the first=20
place, so there is no danger of that don't worry... But no I never=20
suggested making incompatible changes to any existing system call, I=20
said "re-documented". And yes I said deprecated but in Linux that really=20
means kept indefinitely.

If ARM, MIPS, 68k etc programs and toolchains keep using what they are=20
using it'll keep working no problem.

The point is we're growing new interfaces, and making the same mistakes.=20
It's not portable (ARCH_HAS_MEMBARRIER_SYNC_CORE), it's also specified=20
in terms of low level processor operations rather than higher level=20
intent, and also is not sufficient for self-modifying code (without=20
additional cache flush on some processors).

The application wants a call that says something like "memory modified=20
before the call will be visible as instructions (including illegal=20
instructions) by all threads in the program after the system call=20
returns, and no threads will be subject to any effects of executing the=20
previous contents of that memory.

So I think the basics are simple (although should confirm with some JIT=20
and debugger etc developers, and not just Android mind you). There are=20
some complications in details, address ranges, virtual/physical, thread=20
local vs process vs different process or system-wide, memory ordering=20
and propagation of i and d sides, etc. But that can be worked through,=20
erring on the side of sanity rather than pointless micro-optmisations.

Thanks,
Nick
