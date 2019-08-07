Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 157B683EAF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 03:15:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463D8k6ymNzDqWL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 11:15:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463D6T6vxyzDqwr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 11:13:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 463D6T4c5rz9sNF;
 Wed,  7 Aug 2019 11:13:52 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linuxppc-dev\@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "christophe.leroy\@c-s.fr" <christophe.leroy@c-s.fr>,
 "npiggin\@gmail.com" <npiggin@gmail.com>
Subject: Re: SMP lockup at boot on Freescale/NXP T2080 (powerpc 64)
In-Reply-To: <1565135404.16914.5.camel@alliedtelesis.co.nz>
References: <1564970785.27215.29.camel@alliedtelesis.co.nz>
 <4525a16cd3e65f89741b50daf2ec259b6baaab78.camel@alliedtelesis.co.nz>
 <87wofqv8a0.fsf@concordia.ellerman.id.au>
 <1565135404.16914.5.camel@alliedtelesis.co.nz>
Date: Wed, 07 Aug 2019 11:13:46 +1000
Message-ID: <87o911vktx.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Grant McEwan <grant.mcewan@alliedtelesis.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Chris Packham <Chris.Packham@alliedtelesis.co.nz> writes:
> On Tue, 2019-08-06 at 21:32 +1000, Michael Ellerman wrote:
>> Chris Packham <Chris.Packham@alliedtelesis.co.nz> writes:
>> > On Mon, 2019-08-05 at 14:06 +1200, Chris Packham wrote:
>> > >=20
>> > > Hi All,
>> > >=20
>> > > I have a custom board that uses the Freescale/NXP T2080 SoC.
>> > >=20
>> > > The board boots fine using v4.19.60 but when I use v5.1.21 it
>> > > locks
>> > > up
>> > > waiting for the other CPUs to come online (earlyprintk output
>> > > below).
>> > > If I set maxcpus=3D0 then the system boots all the way through to
>> > > userland. The same thing happens with 5.3-rc2.
>> > >=20
>> > > The defconfig I'm using is=C2=A0
>> > > https://gist.github.com/cpackham/f24d0b426f3
>> > > de0eaaba17b82c3528a9d it was updated from the working v4.19.60
>> > > defconfig using make olddefconfig.
>> > >=20
>> > > Does this ring any bells for anyone?
>> > >=20
>> > > I haven't dug into the differences between the working an non-
>> > > working
>> > > versions yet. I'll start looking now.
>> > I've bisected this to the following commit
>> Thanks that's super helpful.
>>=20
>> >=20
>> > commit ed1cd6deb013a11959d17a94e35ce159197632da
>> > Author: Christophe Leroy <christophe.leroy@c-s.fr>
>> > Date:=C2=A0=C2=A0=C2=A0Thu Jan 31 10:08:58 2019 +0000
>> >=20
>> > =C2=A0=C2=A0=C2=A0=C2=A0powerpc: Activate CONFIG_THREAD_INFO_IN_TASK
>> > =C2=A0=C2=A0=C2=A0=C2=A0
>> > =C2=A0=C2=A0=C2=A0=C2=A0This patch activates CONFIG_THREAD_INFO_IN_TAS=
K which
>> > =C2=A0=C2=A0=C2=A0=C2=A0moves the thread_info into task_struct.
>> >=20
>> > I'll be the first to admit this is well beyond my area of knowledge
>> > so
>> > I'm unsure what about this patch is problematic but I can be fairly
>> > sure that a build immediately before this patch works while a build
>> > with this patch hangs.
>> It makes a pretty fundamental change to the way the kernel stores
>> some
>> information about each task, moving it off the stack and into the
>> task
>> struct.
>>=20
>> It definitely has the potential to break things, but I thought we had
>> reasonable test coverage of the Book3E platforms, I have a p5020ds
>> (e5500) that I boot as part of my CI.
>>=20
>> Aha. If I take your config and try to boot it on my p5020ds I get the
>> same behaviour, stuck at SMP bringup. So it seems it's something in
>> your
>> config vs corenet64_smp_defconfig that is triggering the bug.
>>=20
>> Can you try bisecting what in the config triggers it?
>>=20
>> To do that you checkout ed1cd6deb013a11959d17a94e35ce159197632da,
>> then
>> you build/boot with corenet64_smp_defconfig to confirm it works. Then
>> you use tools/testing/ktest/config-bisect.pl to bisect the changes in
>> the .config.
>>=20
>
> The difference between a working and non working defconfig is
> CONFIG_PREEMPT specifically CONFIG_PREEMPT=3Dy makes my system hang at
> boot.
>
> Is that now intentionally prohibited on 64-bit powerpc?

It's not prohibitied, but it probably should be because no one really
tests it properly. I have a handful of IBM machines where I boot a
PREEMPT kernel but that's about it.

The corenet configs don't have PREEMPT enabled, which suggests it was
never really supported on those machines.

But maybe someone from NXP can tell me otherwise.

cheers
