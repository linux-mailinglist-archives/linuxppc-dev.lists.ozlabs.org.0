Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E251C6387
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 23:58:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Gtry3mgrzDqjQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 07:58:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49GtqH6qSQzDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 07:56:57 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 045LuQx1009255;
 Tue, 5 May 2020 16:56:26 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 045LuOEl009254;
 Tue, 5 May 2020 16:56:24 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 5 May 2020 16:56:24 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: New powerpc vdso calling convention
Message-ID: <20200505215624.GP31009@gate.crashing.org>
References: <1587790194.w180xsw5be.astroid@bobo.none>
 <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
 <1587810370.tg8ym9yjpc.astroid@bobo.none>
 <976551e8-229e-54c1-8fb2-c5df94b979c3@c-s.fr>
 <1587855423.jug0f1n0b8.astroid@bobo.none>
 <20200425231119.GM11469@brightrain.aerifal.cx>
 <1587872025.rtx2ygrmn0.astroid@bobo.none>
 <e8a9d3d9-18a7-2cb9-db70-74f7b107f744@linaro.org>
 <1588126678.zjwj4d1d90.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588126678.zjwj4d1d90.astroid@bobo.none>
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
Cc: Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, musl@lists.openwall.com,
 binutils@sourceware.org, Andy Lutomirski <luto@kernel.org>,
 libc-dev@lists.llvm.org, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, Apr 29, 2020 at 12:39:22PM +1000, Nicholas Piggin wrote:
> Excerpts from Adhemerval Zanella's message of April 27, 2020 11:09 pm:
> >> Right, I'm just talking about those comments -- it seems like the kernel 
> >> vdso should contain an .opd section with function descriptors in it for
> >> elfv1 calls, rather than the hack it has now of creating one in the 
> >> caller's .data section.
> >> 
> >> But all that function descriptor code is gated by
> >> 
> >> #if (defined(__PPC64__) || defined(__powerpc64__)) && _CALL_ELF != 2
> >> 
> >> So it seems PPC32 does not use function descriptors but a direct pointer 
> >> to the entry point like PPC64 with ELFv2.
> > 
> > Yes, this hack is only for ELFv1.  The missing ODP has not been an issue 
> > or glibc because it has been using the inline assembly to emulate the 
> > functions call since initial vDSO support (INTERNAL_VSYSCALL_CALL_TYPE).
> > It just has become an issue when I added a ifunc optimization to 
> > gettimeofday so it can bypass the libc.so and make plt branch to vDSO 
> > directly.
> 
> I can't understand if it's actually a problem for you or not.
> 
> Regardless if you can hack around it, it seems to me that if we're going 
> to add sane calling conventions to the vdso, then we should also just 
> have a .opd section for it as well, whether or not a particular libc 
> requires it.

An OPD ("official procedure descriptor") is required for every function,
to have proper C semantics, so that pointers to functions (which are
pointers to descriptors, in fact) are unique.  You can "manually" make
descriptors just fine, and use those to call functions -- but you cannot
(in general) use a pointer to such a "fake" descriptor as the "id" of
the function.

The way the ABIs define the OPDs makes them guaranteed unique.


Segher
