Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 487921E87BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 21:26:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YZLp48bPzDqjx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 05:26:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YZJT5jstzDqZk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 May 2020 05:24:33 +1000 (AEST)
Date: Fri, 29 May 2020 15:24:27 -0400
From: Rich Felker <dalias@libc.org>
To: Will Springer <skirmisher@protonmail.com>
Subject: Re: [musl] ppc64le and 32-bit LE userland compatibility
Message-ID: <20200529192426.GM1079@brightrain.aerifal.cx>
References: <2047231.C4sosBPzcN@sheen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2047231.C4sosBPzcN@sheen>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

On Fri, May 29, 2020 at 07:03:48PM +0000, Will Springer wrote:
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

The argument passing for pread/pwrite is historically a mess and
differs between archs. musl has a dedicated macro that archs can
define to override it. But it looks like it should match regardless of
BE vs LE, and musl already defines it for powerpc with the default
definition, adding a zero arg to start on an even arg-slot index,
which is an odd register (since ppc32 args start with an odd one, r3).

> [6]: https://gist.github.com/Skirmisher/02891c1a8cafa0ff18b2460933ef4f3c

I don't think this is correct, but I'm confused about where it's
getting messed up because it looks like it should already be right.

> This was enough to fix up the `file` bug. I'm no seasoned kernel hacker,
> though, and there is still concern over the right way to approach this,
> whether it should live in the kernel or libc, etc. Frankly, I don't know the
> ABI structure enough to understand why the register padding has to be
> different in this case, or what lower-level component is responsible for it.. 
> For comparison, I had a look at the mips tree, since it's bi-endian and has a 
> similar 32/64 situation. There is a macro conditional upon endianness that is 
> responsible for munging long longs; it uses __MIPSEB__ and __MIPSEL__ instead 
> of an if/else on the generic __LITTLE_ENDIAN__. Not sure what to make of that. 
> (It also simply swaps registers for LE, unlike what I did for ppc.)

Indeed the problem is probably that you need to swap registers for LE,
not remove the padding slot. Did you check what happens if you pass a
value larger than 32 bits?

If so, the right way to fix this on the kernel side would be to
construct the value as a union rather than by bitwise ops so it's
endian-agnostic:

	(union { u32 parts[2]; u64 val; }){{ arg1, arg2 }}.val

But the kernel folks might prefer endian ifdefs for some odd reason...

> Also worth noting is the one other outstanding bug, where the time-related
> syscalls in the 32-bit vDSO seem to return garbage. It doesn't look like an
> endian bug to me, and it doesn't affect standard syscalls (which is why if you
> run `date` on musl it prints the correct time, unlike on glibc). The vDSO time
> functions are implemented in ppc asm (arch/powerpc/kernel/vdso32/
> gettimeofday.S), and I've never touched the stuff, so if anyone has a clue I'm 
> all ears.

Not sure about this. Worst-case, just leave it disabled until someone
finds a fix.

Rich
