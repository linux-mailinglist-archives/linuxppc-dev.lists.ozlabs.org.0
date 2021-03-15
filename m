Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 082A033CA3A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 01:01:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dztjv0bvpz309n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 11:01:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DztjY4s2zz2yyt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 11:01:05 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 12FNxmMm004591;
 Mon, 15 Mar 2021 18:59:48 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 12FNxlbU004590;
 Mon, 15 Mar 2021 18:59:47 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 15 Mar 2021 18:59:47 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH] powerpc/vdso32: Add missing _restgpr_31_x to fix build
 failure
Message-ID: <20210315235947.GD16691@gate.crashing.org>
References: <a7aa198a88bcd33c6e35e99f70f86c7b7f2f9440.1615270757.git.christophe.leroy@csgroup.eu>
 <20210312022940.GO29191@gate.crashing.org>
 <023afd0c-dc61-5891-5145-5bcdce8227be@prevas.dk>
 <14e2cfb8c3f141aaba8fe0fb2d8f1885@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14e2cfb8c3f141aaba8fe0fb2d8f1885@AcuMS.aculab.com>
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
Cc: Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 'Rasmus Villemoes' <rasmus.villemoes@prevas.dk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 15, 2021 at 04:38:52PM +0000, David Laight wrote:
> From: Rasmus Villemoes
> > Sent: 15 March 2021 16:24
> > On 12/03/2021 03.29, Segher Boessenkool wrote:
> > > On Tue, Mar 09, 2021 at 06:19:30AM +0000, Christophe Leroy wrote:
> > >> With some defconfig including CONFIG_CC_OPTIMIZE_FOR_SIZE,
> > >> (for instance mvme5100_defconfig and ps3_defconfig), gcc 5
> > >> generates a call to _restgpr_31_x.
> > >
> > >> I don't know if there is a way to tell GCC not to emit that call, because at the end we get more
> > instructions than needed.
> > >
> > > The function is required by the ABI, you need to have it.
> > >
> > > You get *fewer* insns statically, and that is what -Os is about: reduce
> > > the size of the binaries.
> > 
> > Is there any reason to not just always build the vdso with -O2? It's one
> > page/one VMA either way, and the vdso is about making certain system
> > calls cheaper, so if unconditional -O2 could save a few cycles compared
> > to -Os, why not? (And if, as it seems, there's only one user within the
> > DSO of _restgpr_31_x, yes, the overall size of the .text segment
> > probably increases slightly).
> 
> Sometimes -Os generates such horrid code you really never want to use it.
> A classic is on x86 where it replaces 'load register with byte constant'
> with 'push byte' 'pop register'.
> The code is actually smaller but the execution time is horrid.
> 
> There are also cases where -O2 actually generates smaller code.

Yes, as with all heuristics it doesn't always work out.  But usually -Os
is smaller.

> Although you may need to disable loop unrolling (often dubious at best)
> and either force or disable some function inlining.

The cases where GCC does loop unrolling at -O2 always help quite a lot.
Or, do you have a counter-example?  We'd love to see one.

And yup, inlining is hard.  GCC's heuristics there are very good
nowadays, but any single decision has big effects.  Doing the important
spots manually (always_inline or noinline) has good payoff.


Segher
