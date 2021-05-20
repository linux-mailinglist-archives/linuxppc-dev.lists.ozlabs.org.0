Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2205738AE16
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 14:23:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm86f0qCQz3bs7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 22:23:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Fm86J0LL1z2xfY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 22:23:35 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14KCHI5W000535;
 Thu, 20 May 2021 07:17:18 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 14KCHAfi000527;
 Thu, 20 May 2021 07:17:10 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 20 May 2021 07:17:10 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines to
 take a page walk cache flush argument
Message-ID: <20210520121710.GR10366@gate.crashing.org>
References: <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
 <20210515163525.GA1106462@roeck-us.net>
 <e0eba73a-c2df-71c3-e03d-d4074d908fca@linux.ibm.com>
 <d830fce9-c00a-e879-4115-94a2346a806f@roeck-us.net>
 <87pmxpqxb1.fsf@linux.ibm.com>
 <a7dd34f3-7d79-c933-fb62-eaad5c83d37a@roeck-us.net>
 <87a6ork1qp.fsf@mpe.ellerman.id.au>
 <20210519004514.GC10366@gate.crashing.org>
 <20210519120306.GD10366@gate.crashing.org>
 <87y2c9j1ov.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y2c9j1ov.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, May 20, 2021 at 05:37:20PM +1000, Michael Ellerman wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> > On Tue, May 18, 2021 at 07:45:14PM -0500, Segher Boessenkool wrote:
> >> On Wed, May 19, 2021 at 10:26:22AM +1000, Michael Ellerman wrote:
> >> > Guenter Roeck <linux@roeck-us.net> writes:
> >> > > Ah, sorry. I wasn't aware that the following is valid C code
> >> > >
> >> > > void f1()
> >> > > {
> >> > >      return f2();
> >> > >      ^^^^^^
> >> > > }
> >> > >
> >> > > as long as f2() is void as well. Confusing, but we live and learn.
> >> > 
> >> > It might be valid, but it's still bad IMHO.
> >> > 
> >> > It's confusing to readers, and serves no useful purpose.
> >> 
> >> And it actually explicitly is undefined behaviour in C90 already
> >> (3.6.6.4 in C90, 6.8.6.4 in C99 and later).
> 
> We use gnu89, which presumably does not make it UB.

Indeed.  That is kind of implied by the "as a GNU extension" below, but
some explicit statement would be better, yup.

> > ... but there is a GCC extension that allows this by default:
> > <https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wreturn-type>
> >   For C only, warn about a 'return' statement with an expression in a
> >   function whose return type is 'void', unless the expression type is
> >   also 'void'.  As a GNU extension, the latter case is accepted
> >   without a warning unless '-Wpedantic' is used.
> 
> There's no chance we'll ever enable -Wpedantic,

Good, because -pedantic adds a lot of much more annoying warnings as
well.  I find this extension questionable (like Guenter says it is
confusing and has no purpose), so the only thing it is "good" for is it
causes long email threads ;-)

Other than those things it is harmless though.

> so I guess it's allowed
> for practical purposes. I guess clang must accept it too or we'd be
> seeing warnings from it.

Yup.


Segher
