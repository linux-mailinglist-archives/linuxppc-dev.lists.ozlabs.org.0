Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0DC1F382D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 12:33:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h60x23B3zDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 20:33:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.18; helo=mail1.protonmail.ch;
 envelope-from=skirmisher@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=OC6QJ8ha; 
 dkim-atps=neutral
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h5wh5fWvzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 20:30:10 +1000 (AEST)
Date: Tue, 09 Jun 2020 10:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1591698605;
 bh=ZmI8f4NT/A8b1TcFOG0yEqbZiOaaW0E0LPZadg5Cilw=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=OC6QJ8haigdD5SCrc3TSbeRjVojoljnDm8ryomP+BnUdD8Euwchj+NeEhdldKp9li
 /gI1xJI53kV3hJTMMisxC36WOYE/5h62l7OdWwNYVQN8lleQF/VdMgAjBCUPrjkiwR
 yOXz0cLn4uPc1HKo19Cg+2RZd0COdoYj0Em5jEHw=
To: Rich Felker <dalias@libc.org>, linuxppc-dev@lists.ozlabs.org
From: Will Springer <skirmisher@protonmail.com>
Subject: Re: [musl] ppc64le and 32-bit LE userland compatibility
Message-ID: <20948555.hxa6pUQ8Du@sheen>
In-Reply-To: <14083731.JCcGWNJJiE@sheen>
References: <2047231.C4sosBPzcN@sheen>
 <20200529192426.GM1079@brightrain.aerifal.cx>
 <14083731.JCcGWNJJiE@sheen>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Will Springer <skirmisher@protonmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Saturday, May 30, 2020 3:56:47 PM PDT you wrote:
> On Friday, May 29, 2020 12:24:27 PM PDT Rich Felker wrote:
> > The argument passing for pread/pwrite is historically a mess and
> > differs between archs. musl has a dedicated macro that archs can
> > define to override it. But it looks like it should match regardless of
> > BE vs LE, and musl already defines it for powerpc with the default
> > definition, adding a zero arg to start on an even arg-slot index,
> > which is an odd register (since ppc32 args start with an odd one, r3).
> >=20
> > > [6]:
> > > https://gist.github.com/Skirmisher/02891c1a8cafa0ff18b2460933ef4f3c
> >=20
> > I don't think this is correct, but I'm confused about where it's
> > getting messed up because it looks like it should already be right.
>=20
> Hmm, interesting. Will have to go back to it I guess...
>=20
> > > This was enough to fix up the `file` bug. I'm no seasoned kernel
> > > hacker, though, and there is still concern over the right way to
> > > approach this, whether it should live in the kernel or libc, etc.
> > > Frankly, I don't know the ABI structure enough to understand why the
> > > register padding has to be different in this case, or what
> > > lower-level component is responsible for it.. For comparison, I had
> > > a
> > > look at the mips tree, since it's bi-endian and has a similar 32/64
> > > situation. There is a macro conditional upon endianness that is
> > > responsible for munging long longs; it uses __MIPSEB__ and
> > > __MIPSEL__
> > > instead of an if/else on the generic __LITTLE_ENDIAN__. Not sure
> > > what
> > > to make of that. (It also simply swaps registers for LE, unlike what
> > > I did for ppc.)
> >=20
> > Indeed the problem is probably that you need to swap registers for LE,
> > not remove the padding slot. Did you check what happens if you pass a
> > value larger than 32 bits?
> >=20
> > If so, the right way to fix this on the kernel side would be to
> > construct the value as a union rather than by bitwise ops so it's
> >=20
> > endian-agnostic:
> > =09(union { u32 parts[2]; u64 val; }){{ arg1, arg2 }}.val
> >=20
> > But the kernel folks might prefer endian ifdefs for some odd reason...
>=20
> You are right, this does seem odd considering what the other archs do.
> It's quite possible I made a silly mistake, of course...
>=20
> I haven't tested with values outside the 32-bit range yet; again, this
> is new territory for me, so I haven't exactly done exhaustive tests on
> everything. I'll give it a closer look.

I took some cues from the mips linux32 syscall setup, and drafted a new=20
patch defining a macro to compose the hi/lo parts within the function,=20
instead of swapping the args at the function definition. `file /bin/bash`=
=20
and `truncate -s 5G test` both work correctly now. This appears to be the=
=20
correct solution, so I'm not sure what silly mistake I made before, but=20
apologies for the confusion. I've updated my gist with the new patch [1].

> > > Also worth noting is the one other outstanding bug, where the
> > > time-related syscalls in the 32-bit vDSO seem to return garbage. It
> > > doesn't look like an endian bug to me, and it doesn't affect
> > > standard
> > > syscalls (which is why if you run `date` on musl it prints the
> > > correct time, unlike on glibc). The vDSO time functions are
> > > implemented in ppc asm (arch/powerpc/kernel/vdso32/ gettimeofday.S),
> > > and I've never touched the stuff, so if anyone has a clue I'm all
> > > ears.
> >=20
> > Not sure about this. Worst-case, just leave it disabled until someone
> > finds a fix.
>=20
> Apparently these asm implementations are being replaced by the generic C
> ones [1], so it may be this fixes itself on its own.
>=20
> Thanks,
> Will [she/her]
>=20
> [1]:
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D173231

I mentioned in Christophe's thread the other day, but his patchset does=20
solve the vdso32 issues, though it introduced problems in vdso64 in my=20
testing. With that solved and the syscall situation established, I think=20
the kernel state is stable enough to start looking at solidifying libc/
compiler stuff. I'll try to get a larger userland built in the near future=
=20
to try to catch any remaining problems (before rebuilding it all when=20
libc/ABI support becomes explicit).

Cheers,
Will [she/her]

[1]: https://gist.github.com/Skirmisher/02891c1a8cafa0ff18b2460933ef4f3c




