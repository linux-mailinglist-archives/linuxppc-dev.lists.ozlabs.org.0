Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 198D92E7858
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 13:02:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5VJs6jgyzDqHv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 23:02:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=czOilpTr; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5VCL54z0zDqGC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Dec 2020 22:57:31 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id t6so8594869plq.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Dec 2020 03:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=lyZez/TPJWN6sWd8vUs5LfzoEmRCXqZhMj6jVw0JL/c=;
 b=czOilpTrKnk++/HN6biw+tuZpOy1CyqfQe54Cv9eZOXtvBnV3GFIsusJj7FMJAiZgk
 BZbhSTF2fbeQgX2WSdVpy4HVUMDm0Z1KQNXuSEu+wvoe2y/FRgn77wTZeb/6AQxQlYiX
 myUHZXI9K3wvIzmnUlNDx4j9ejPFW1HeLbMexhxxCZ8/vYk4Wmt7ugM5YyZ2/yi4GqTw
 hMQSd+CPkMS+R14fOSpiExEzTlybi3a2UpaOgvFKQMnp5iD6L/0OqOwfmKxLKZX2TEhD
 5UkwfGUDdf9R4ZaltSXJyDnclPg2xX2XIwS4nUrHCDw8Mo8HgPpyO/bsbLYRNL7oQjba
 2wGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=lyZez/TPJWN6sWd8vUs5LfzoEmRCXqZhMj6jVw0JL/c=;
 b=JAAZZPi+LOkihWrID4DJxLhsMdIlWjMBeWn4k47KHSza+UmU6YmH+cVT1/FzraUYoa
 1g1a55lF4f//mH174A9//URSSA1SpQBNNEFxsKkYo0+1dXAKirkqz5xkVSjsVhZFyA7z
 3zOWyGxIaxQGtxXFhp5JOM1tKBU9sUDLZSNIrh4J2o5w3XV1NWtVL003sEYNKfEgt/ce
 IHdQzvlHNzldbhzV0nGPgTUQBHUS0CX/V7NNHv70LIBp0zDm4f9TxiIfZWG0Bahze4+b
 LOvadZEaxGNOCkP9jiIWENhGef+Ga1YnzA8yx7E+gMTNt6Kmzu+ZYxs8Dlr4QW08zrzK
 rVpg==
X-Gm-Message-State: AOAM533QTWlbyTCXZY/dFrhxsXNatOT78lZEcj2c6xm2+GUS3xLqG48Z
 Cmf82+UBTujdxCoNIWUG7rQ=
X-Google-Smtp-Source: ABdhPJze2Hr5s+OaI6p57qfWIefx8fVHgwpydEG8SuiTXCiXqCHXJZ8R8YLZ5fwL2VWdQJCmb2R3lQ==
X-Received: by 2002:a17:90a:1b66:: with SMTP id
 q93mr8219927pjq.133.1609329448436; 
 Wed, 30 Dec 2020 03:57:28 -0800 (PST)
Received: from localhost (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id e13sm44423131pfj.63.2020.12.30.03.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 03:57:27 -0800 (PST)
Date: Wed, 30 Dec 2020 21:57:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <20201228190852.GI1551@shell.armlinux.org.uk>
 <CALCETrVpvrBufrJgXNY=ogtZQLo7zgxQmD7k9eVCFjcdcvarmA@mail.gmail.com>
 <1086654515.3607.1609187556216.JavaMail.zimbra@efficios.com>
 <CALCETrXx3Xe+4Y6WM-mp0cTUU=r3bW6PV2b25yA8bm1Gvak6wQ@mail.gmail.com>
 <1609200902.me5niwm2t6.astroid@bobo.none>
 <CALCETrX6MOqmN5_jhyO1jJB7M3_T+hbomjxPYZLJmLVNmXAVzA@mail.gmail.com>
 <1609210162.4d8dqilke6.astroid@bobo.none>
 <20201229104456.GK1551@shell.armlinux.org.uk>
 <1609290821.wrfh89v23a.astroid@bobo.none>
 <20201230100028.GP1551@shell.armlinux.org.uk>
 <20201230105847.GQ1551@shell.armlinux.org.uk>
In-Reply-To: <20201230105847.GQ1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Message-Id: <1609327110.c18a3h158t.astroid@bobo.none>
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

Excerpts from Russell King - ARM Linux admin's message of December 30, 2020=
 8:58 pm:
> On Wed, Dec 30, 2020 at 10:00:28AM +0000, Russell King - ARM Linux admin =
wrote:
>> On Wed, Dec 30, 2020 at 12:33:02PM +1000, Nicholas Piggin wrote:
>> > Excerpts from Russell King - ARM Linux admin's message of December 29,=
 2020 8:44 pm:
>> > > On Tue, Dec 29, 2020 at 01:09:12PM +1000, Nicholas Piggin wrote:
>> > >> I think it should certainly be documented in terms of what guarante=
es
>> > >> it provides to application, _not_ the kinds of instructions it may =
or
>> > >> may not induce the core to execute. And if existing API can't be
>> > >> re-documented sanely, then deprecatd and new ones added that DTRT.
>> > >> Possibly under a new system call, if arch's like ARM want a range
>> > >> flush and we don't want to expand the multiplexing behaviour of
>> > >> membarrier even more (sigh).
>> > >=20
>> > > The 32-bit ARM sys_cacheflush() is there only to support self-modify=
ing
>> > > code, and takes whatever actions are necessary to support that.
>> > > Exactly what actions it takes are cache implementation specific, and
>> > > should be of no concern to the caller, but the underlying thing is..=
.
>> > > it's to support self-modifying code.
>> >=20
>> >    Caveat
>> >        cacheflush()  should  not  be used in programs intended to be p=
ortable.
>> >        On Linux, this call first appeared on the MIPS architecture, bu=
t  nowa=E2=80=90
>> >        days, Linux provides a cacheflush() system call on some other a=
rchitec=E2=80=90
>> >        tures, but with different arguments.
>> >=20
>> > What a disaster. Another badly designed interface, although it didn't=20
>> > originate in Linux it sounds like we weren't to be outdone so
>> > we messed it up even worse.
>> >=20
>> > flushing caches is neither necessary nor sufficient for code modificat=
ion
>> > on many processors. Maybe some old MIPS specific private thing was fin=
e,
>> > but certainly before it grew to other architectures, somebody should=20
>> > have thought for more than 2 minutes about it. Sigh.
>>=20
>> WARNING: You are bordering on being objectionable and offensive with
>> that comment.
>>=20
>> The ARM interface was designed by me back in the very early days of
>> Linux, probably while you were still in dypers, based on what was
>> known at the time.  Back in the early 2000s, ideas such as relaxed
>> memory ordering were not known.  All there was was one level of
>> harvard cache.

I wasn't talking about memory ordering at all, and I assumed it
came earlier and was brought to Linux for portability reasons -

CONFORMING TO
       Historically, this system call was available on all MIPS UNIX  varia=
nts
       including RISC/os, IRIX, Ultrix, NetBSD, OpenBSD, and FreeBSD (and a=
lso
       on some non-UNIX MIPS operating systems), so that the existence of t=
his
       call in MIPS operating systems is a de-facto standard.

I don't think the call was totally unreasonable for incoherent virtual=20
caches or incoherent i/d caches etc. Although early unix system call interf=
ace
demonstrates that people understood how to define good interfaces that deal=
t
with intent at an abstract level rather than implementation -- munmap=20
doesn't specify anywhere that a TLB flush instruction must be executed,=20
for example. So "cacheflush" was obviously never a well designed interface=20
but rather the typical hardware-centric hack to get their stuff working
(which was fine for its purpose I'm sure).

>=20
> Sorry, I got that slightly wrong. Its origins on ARM were from 12 Dec
> 1998:
>=20
> http://www.armlinux.org.uk/developer/patches/viewpatch.php?id=3D88/1
>=20
> by Philip Blundell, and first appeared in the ARM
> pre-patch-2.1.131-19981214-1.gz. It was subsequently documented in the
> kernel sources by me in July 2001 in ARM patch-2.4.6-rmk2.gz. It has
> a slightly different signature: the third argument on ARM is a flags
> argument, whereas the MIPS code, it is some undocumented "cache"
> parameter.
>=20
> Whether the ARM version pre or post dates the MIPS code, I couldn't say.
> Whether it was ultimately taken from the MIPS implementation, again, I
> couldn't say.

I can, it was in MIPS in late 1.3 kernels at least. I would guess it
came from IRIX.

> However, please stop insulting your fellow developers ability to think.

Sorry, I was being melodramatic. Everyone makes mistakes or decisions
which with hindsight could have been better or were under some=20
constraint that isn't apparent. I shouldn't have suggested it indicated=20
thoughtlessness.

Thanks,
Nick
