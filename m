Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D5A1E935A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 21:24:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZBF90WbwzDqnv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 05:23:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 49ZBCY4Yj6zDqgp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 05:22:32 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 04UJMFmm021064;
 Sat, 30 May 2020 14:22:15 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 04UJMCov021061;
 Sat, 30 May 2020 14:22:12 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sat, 30 May 2020 14:22:12 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Will Springer <skirmisher@protonmail.com>
Subject: Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200530192212.GG31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2047231.C4sosBPzcN@sheen>
User-Agent: Mutt/1.4.2.3i
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, daniel@octaforge.org,
 musl@lists.openwall.com, binutils@sourceware.org, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Fri, May 29, 2020 at 07:03:48PM +0000, Will Springer wrote:
> Hey all, a couple of us over in #talos-workstation on freenode have been
> working on an effort to bring up a Linux PowerPC userland that runs in 32-bit
> little-endian mode, aka ppcle. As far as we can tell, no ABI has ever been
> designated for this

https://www.polyomino.org.uk/publications/2011/Power-Arch-32-bit-ABI-supp-1.0-Embedded.pdf

> (unless you count the patchset from a decade ago [1]), so

The original sysv PowerPC supplement
http://refspecs.linux-foundation.org/elf/elfspec_ppc.pdf
supports LE as well, and most powerpcle ports use that.  But, the
big-endian Linux ABI differs in quite a few places, and it of course
makes a lot better sense if powerpcle-linux follows that.

> it's pretty much uncharted territory as far as Linux is concerned. We want to
> sync up with libc and the relevant kernel folks to establish the best path
> forward.
> 
> The practical application that drove these early developments (as you might
> expect) is x86 emulation. The box86 project [2] implements a translation layer
> for ia32 library calls to native architecture ones; this way, emulation
> overhead is significantly reduced by relying on native libraries where
> possible (libc, libGL, etc.) instead of emulating an entire x86 userspace.
> box86 is primarily targeted at ARM, but it can be adapted to other
> architectures—so long as they match ia32's 32-bit, little-endian nature. Hence
> the need for a ppcle userland; modern POWER brought ppc64le as a supported
> configuration, but without a 32-bit equivalent there is no option for a 32/64
> multilib environment, as seen with ppc/ppc64 and arm/aarch64.
> 
> Surprisingly, beyond minor patching of gcc to get crosscompile going,

What patches did you need?  I regularly build >30 cross compilers (on
both BE and LE hosts; I haven't used 32-bit hosts for a long time, but
in the past those worked fine as well).  I also cross-built
powerpcle-linux-gcc quite a few times (from powerpc64le, from powerpc64,
from various x86).

> bootstrapping the initial userland was not much of a problem. The work has
> been done on top of the Void Linux PowerPC project [3], and much of that is
> now present in its source package tree [4].
> 
> The first issue with running the userland came from the ppc32 signal handler 
> forcing BE in the MSR, causing any 32LE process receiving a signal (such as a 
> shell receiving SIGCHLD) to terminate with SIGILL. This was trivially patched, 

Heh :-)

> along with enabling the 32-bit vDSO on ppc64le kernels [5]. (Given that this 
> behavior has been in place since 2006, I don't think anyone has been using the 
> kernel in this state to run ppcle userlands.)

Almost no project that used 32-bit PowerPC in LE mode has sent patches
to the upstreams.

> The next problem concerns the ABI more directly. The failure mode was `file`
> surfacing EINVAL from pread64 when invoked on an ELF; pread64 was passed a
> garbage value for `pos`, which didn't appear to be caused by anything in 
> `file`. Initially it seemed as though the 32-bit components of the arg were
> getting swapped, and we made hacky fixes to glibc and musl to put them in the
> "right order"; however, we weren't sure if that was the correct approach, or
> if there were knock-on effects we didn't know about. So we found the relevant
> compat code path in the kernel, at arch/powerpc/kernel/sys_ppc32.c, where
> there exists this comment:
> 
> > /*
> >  * long long munging:
> >  * The 32 bit ABI passes long longs in an odd even register pair.
> >  */
> 
> It seems that the opposite is true in LE mode, and something is expecting long
> longs to start on an even register. I realized this after I tried swapping hi/
> lo `u32`s here and didn't see an improvement. I whipped up a patch [6] that
> switches which syscalls use padding arguments depending on endianness, while
> hopefully remaining tidy enough to be unobtrusive. (I took some liberties with
> variable names/types so that the macro could be consistent.)

The ABI says long longs are passed in the same order in registers as it
would be in memory; so the high part and the low part are swapped between
BE and LE.  Which registers make up a pair is exactly the same between
the two.  (You can verify this with an existing powerpcle-* compiler, too;
I did, and we implement it correctly as far as I can see).

> This was enough to fix up the `file` bug. I'm no seasoned kernel hacker,
> though, and there is still concern over the right way to approach this,
> whether it should live in the kernel or libc, etc. Frankly, I don't know the
> ABI structure enough to understand why the register padding has to be
> different in this case, or what lower-level component is responsible for it. 
> For comparison, I had a look at the mips tree, since it's bi-endian and has a 
> similar 32/64 situation. There is a macro conditional upon endianness that is 
> responsible for munging long longs; it uses __MIPSEB__ and __MIPSEL__ instead 
> of an if/else on the generic __LITTLE_ENDIAN__. Not sure what to make of that. 
> (It also simply swaps registers for LE, unlike what I did for ppc.)

But you should :-)

> Also worth noting is the one other outstanding bug, where the time-related
> syscalls in the 32-bit vDSO seem to return garbage. It doesn't look like an
> endian bug to me, and it doesn't affect standard syscalls (which is why if you
> run `date` on musl it prints the correct time, unlike on glibc). The vDSO time
> functions are implemented in ppc asm (arch/powerpc/kernel/vdso32/
> gettimeofday.S), and I've never touched the stuff, so if anyone has a clue I'm 
> all ears.
> 
> Again, I'd appreciate feedback on the approach to take here, in order to 
> touch/special-case only the minimum necessary, while keeping the kernel/libc 
> folks happy.

A huge factor in having good GCC support for powerpcle-linux (or anything
else) is someone needs to regularly test it, and share test results with
us (via gcc-testresults@).  Hint hint hint :-)

That way we know it is in good shape, know when we are regressing it,
know there is interest in it.

gl;hf,


Segher
