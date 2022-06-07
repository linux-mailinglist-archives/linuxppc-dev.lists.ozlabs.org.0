Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C554024A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 17:20:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHYvX4KWrz3c8T
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 01:20:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHYv62Bvbz3bkJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 01:20:01 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 257FFidN003178;
	Tue, 7 Jun 2022 10:15:44 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 257FFfLo003176;
	Tue, 7 Jun 2022 10:15:41 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 7 Jun 2022 10:15:41 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: outside array bounds error on ppc64_defconfig, GCC 12.1.0
Message-ID: <20220607151541.GG25951@gate.crashing.org>
References: <YpbUcPrm61RLIiZF@debian.me> <87mtepns81.fsf@mpe.ellerman.id.au> <d38aeb0d6f2040369256ee640b44fafe@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d38aeb0d6f2040369256ee640b44fafe@AcuMS.aculab.com>
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Yang Li <yang.lee@linux.alibaba.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 07, 2022 at 02:23:25PM +0000, David Laight wrote:
> > I don't see a really simple fix. I tried clamping the size parameter to
> > do_byte_reverse() with max(), but that didn't work :/
> 
> I had a quick look at the code - it is somewhat horrid!
> Not really surprising the compiler is confused.
> Although it shouldn't be outputting that error message
> unless it is certain.

No.  It is a warning message, and the compiler should output it for all
code it finds suspicious.  The conditions for this could be improved for
sure, but it is and will remain a heuristic affair, so using -Werror
with is is akin to self-flagellation.

It is not an error, it is a warning.  The correct response to it when
you determine it is not an error, or even you do not want to deal with
it now, is to ignore it.  Which -Werror prevents, one of the ways that
that warning flag is counterproductive to use.

> Could it be re-written to read the data into an __u128
> (or whatever the compiler type is).
> Optionally byteswap the entire thing (swap the words and
> then byteswap each word).
> The do a put_user_8/16/32/64() to write out the value.
> 
> I think that would remove all the memory accesses and make
> it a lot faster as well.

Yes, the warning sometimes fires for correct code that is "merely" next
to impossible to read.  It may well improve even the performance of the
code if the code is rewritten.

But it also may introduce new bugs, or anything else detrimental.  It
is yakshaving extraordinaire to do this every time a compiler warning
points out something doesn't smell quite right :-)


Segher
