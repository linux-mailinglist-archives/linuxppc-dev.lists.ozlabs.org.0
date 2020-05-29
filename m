Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 214621E8BCB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 01:12:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YgLv5mT4zDqrM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 09:12:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.18; helo=mail1.protonmail.ch;
 envelope-from=skirmisher@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
X-Greylist: delayed 431 seconds by postgrey-1.36 at bilbo;
 Sat, 30 May 2020 05:11:10 AEST
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YZ0t5s75zDqY0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 May 2020 05:11:08 +1000 (AEST)
Date: Fri, 29 May 2020 19:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1590779032;
 bh=gd3/oH63GsrB2xeFy31+b/fYRJd7zjJlDD/gAk6cuWo=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=ONOFxu3h1/F6AVVCAodx2j/Yg4tGbsPVMcjGtJN2T8KpvRc+jrxkm5FozXNvDFU51
 S1BQ5H/yxlxxphl9Md6MVGrVwFBER3IR1lpjLdkvxld5sSQ9MNixBSZq8W7H6lHp6B
 OhBJs0Cs3VgmnpkQl4g0hJF9oxXLLwTi7TIuf1o0=
To: linuxppc-dev@lists.ozlabs.org
From: Will Springer <skirmisher@protonmail.com>
Subject: ppc64le and 32-bit LE userland compatibility
Message-ID: <2047231.C4sosBPzcN@sheen>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-Mailman-Approved-At: Sat, 30 May 2020 09:10:26 +1000
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, daniel@octaforge.org,
 musl@lists.openwall.com, binutils@sourceware.org, libc-dev@lists.llvm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hey all, a couple of us over in #talos-workstation on freenode have been
working on an effort to bring up a Linux PowerPC userland that runs in 32-b=
it
little-endian mode, aka ppcle. As far as we can tell, no ABI has ever been
designated for this (unless you count the patchset from a decade ago [1]), =
so
it's pretty much uncharted territory as far as Linux is concerned. We want =
to
sync up with libc and the relevant kernel folks to establish the best path
forward.

The practical application that drove these early developments (as you might
expect) is x86 emulation. The box86 project [2] implements a translation la=
yer
for ia32 library calls to native architecture ones; this way, emulation
overhead is significantly reduced by relying on native libraries where
possible (libc, libGL, etc.) instead of emulating an entire x86 userspace.
box86 is primarily targeted at ARM, but it can be adapted to other
architectures=E2=80=94so long as they match ia32's 32-bit, little-endian na=
ture. Hence
the need for a ppcle userland; modern POWER brought ppc64le as a supported
configuration, but without a 32-bit equivalent there is no option for a 32/=
64
multilib environment, as seen with ppc/ppc64 and arm/aarch64.

Surprisingly, beyond minor patching of gcc to get crosscompile going,
bootstrapping the initial userland was not much of a problem. The work has
been done on top of the Void Linux PowerPC project [3], and much of that is
now present in its source package tree [4].

The first issue with running the userland came from the ppc32 signal handle=
r=20
forcing BE in the MSR, causing any 32LE process receiving a signal (such as=
 a=20
shell receiving SIGCHLD) to terminate with SIGILL. This was trivially patch=
ed,=20
along with enabling the 32-bit vDSO on ppc64le kernels [5]. (Given that thi=
s=20
behavior has been in place since 2006, I don't think anyone has been using =
the=20
kernel in this state to run ppcle userlands.)

The next problem concerns the ABI more directly. The failure mode was `file=
`
surfacing EINVAL from pread64 when invoked on an ELF; pread64 was passed a
garbage value for `pos`, which didn't appear to be caused by anything in=20
`file`. Initially it seemed as though the 32-bit components of the arg were
getting swapped, and we made hacky fixes to glibc and musl to put them in t=
he
"right order"; however, we weren't sure if that was the correct approach, o=
r
if there were knock-on effects we didn't know about. So we found the releva=
nt
compat code path in the kernel, at arch/powerpc/kernel/sys_ppc32.c, where
there exists this comment:

> /*
>  * long long munging:
>  * The 32 bit ABI passes long longs in an odd even register pair.
>  */

It seems that the opposite is true in LE mode, and something is expecting l=
ong
longs to start on an even register. I realized this after I tried swapping =
hi/
lo `u32`s here and didn't see an improvement. I whipped up a patch [6] that
switches which syscalls use padding arguments depending on endianness, whil=
e
hopefully remaining tidy enough to be unobtrusive. (I took some liberties w=
ith
variable names/types so that the macro could be consistent.)

This was enough to fix up the `file` bug. I'm no seasoned kernel hacker,
though, and there is still concern over the right way to approach this,
whether it should live in the kernel or libc, etc. Frankly, I don't know th=
e
ABI structure enough to understand why the register padding has to be
different in this case, or what lower-level component is responsible for it=
.=20
For comparison, I had a look at the mips tree, since it's bi-endian and has=
 a=20
similar 32/64 situation. There is a macro conditional upon endianness that =
is=20
responsible for munging long longs; it uses __MIPSEB__ and __MIPSEL__ inste=
ad=20
of an if/else on the generic __LITTLE_ENDIAN__. Not sure what to make of th=
at.=20
(It also simply swaps registers for LE, unlike what I did for ppc.)

Also worth noting is the one other outstanding bug, where the time-related
syscalls in the 32-bit vDSO seem to return garbage. It doesn't look like an
endian bug to me, and it doesn't affect standard syscalls (which is why if =
you
run `date` on musl it prints the correct time, unlike on glibc). The vDSO t=
ime
functions are implemented in ppc asm (arch/powerpc/kernel/vdso32/
gettimeofday.S), and I've never touched the stuff, so if anyone has a clue =
I'm=20
all ears.

Again, I'd appreciate feedback on the approach to take here, in order to=20
touch/special-case only the minimum necessary, while keeping the kernel/lib=
c=20
folks happy.

Cheers,
Will [she/her]

(p.s. there is ancillary interest in a ppcle-native kernel as well; that's =
a=20
good deal more work and not the focus of this message at all, but it is a=
=20
topic of interest)

[1]: https://lwn.net/Articles/408845/
[2]: https://github.com/ptitSeb/box86
[3]: https://voidlinux-ppc.org/
[4]: https://github.com/void-ppc/void-packages
[5]: https://gist.github.com/eerykitty/01707dc6bca2be32b4c5e30d15d15dcf
[6]: https://gist.github.com/Skirmisher/02891c1a8cafa0ff18b2460933ef4f3c




