Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B68831456E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 14:39:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482mhx5Py1zDqF1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 00:39:13 +1100 (AEDT)
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
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482mf00qcxzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 00:36:39 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00MDaRhu012507;
 Wed, 22 Jan 2020 07:36:27 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00MDaQfO012505;
 Wed, 22 Jan 2020 07:36:26 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 22 Jan 2020 07:36:26 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: GCC bug ? Re: [PATCH v2 10/10] powerpc/32s: Implement Kernel
 Userspace Access Protection
Message-ID: <20200122133626.GL3191@gate.crashing.org>
References: <cover.1552292207.git.christophe.leroy@c-s.fr>
 <a2847248a92cb1641b1740fa121c5a30593ae662.1552292207.git.christophe.leroy@c-s.fr>
 <87ftqfu7j1.fsf@concordia.ellerman.id.au>
 <a008a182-f1db-073c-7d38-27bfd1fd8676@c-s.fr>
 <20200121195501.GJ3191@gate.crashing.org>
 <af9ad296-401c-cb5c-868a-7a6f91d1e8bc@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af9ad296-401c-cb5c-868a-7a6f91d1e8bc@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 22, 2020 at 07:52:02AM +0100, Christophe Leroy wrote:
> Le 21/01/2020 à 20:55, Segher Boessenkool a écrit :
> >On Tue, Jan 21, 2020 at 05:22:32PM +0000, Christophe Leroy wrote:
> >>g1() should return 3, not 5.
> >
> >What makes you say that?
> 
> What makes me say that is that NULL is obviously a constant pointer and 
> I think we are all expecting gcc to see it as a constant during kernel 
> build, ie at -O2

But apparently at the point where the builtin was checked it did not
yet know it is passed a null pointer.

Please make a self-contained test case if we need further investigation?

> >"A return of 0 does not indicate that the
> >  value is _not_ a constant, but merely that GCC cannot prove it is a
> >  constant with the specified value of the '-O' option."
> >
> >(And the rules it uses for this are *not* the same as C "constant
> >expressions" or C "integer constant expression" or C "arithmetic
> >constant expression" or anything like that -- which should be already
> >obvious from that it changes with different -Ox).
> >
> >You can use builtin_constant_p to have the compiler do something better
> >if the compiler feels like it, but not anything more.  Often people
> >want stronger guarantees, but when they see how much less often it then
> >returns "true", they do not want that either.

> If GCC doesn't see NULL as a constant, then the above doesn't work as 
> expected.

That's not the question.  Of course GCC sees it as a null pointer
constant, because it is one.  But this builtin does its work very
early, during preprocessing already.  Its concept of "constant" is
very different.

Does it work if you write just "0" instead of "NULL", btw?  "0" is
also a null pointer constant eventually (here, that is).

The question is why (and if, it still needs verification after all)
builtin_constant_p didn't return true.


Segher
