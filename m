Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C9B37D387
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 20:23:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgNTW3cz8z309S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 04:23:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FgNTB5ZZQz2yYD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 04:23:26 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14CIL4bD009429;
 Wed, 12 May 2021 13:21:04 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 14CIL4PD009428;
 Wed, 12 May 2021 13:21:04 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 12 May 2021 13:21:03 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Force inlining of csum_add()
Message-ID: <20210512182103.GX10366@gate.crashing.org>
References: <f7f4d4e364de6e473da874468b903da6e5d97adc.1620713272.git.christophe.leroy@csgroup.eu>
 <20210511105154.GJ10366@gate.crashing.org>
 <e996ef13-c25c-5e9c-edd2-444eded88802@csgroup.eu>
 <20210512143105.GW10366@gate.crashing.org>
 <2623fe98-7a73-f7a2-bcba-2d668d00ffd0@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2623fe98-7a73-f7a2-bcba-2d668d00ffd0@csgroup.eu>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 12, 2021 at 04:43:33PM +0200, Christophe Leroy wrote:
> Le 12/05/2021 � 16:31, Segher Boessenkool a �crit�:
> >On Wed, May 12, 2021 at 02:56:56PM +0200, Christophe Leroy wrote:
> >>Le 11/05/2021 � 12:51, Segher Boessenkool a �crit�:
> >>>Something seems to have decided this asm is more expensive than it is.
> >>>That isn't always avoidable -- the compiler cannot look inside asms --
> >>>but it seems it could be improved here.
> >>>
> >>>Do you have (or can make) a self-contained testcase?
> >>
> >>I have not tried, and I fear it might be difficult, because on a kernel
> >>build with dozens of calls to csum_add(), only ip6_tunnel.o exhibits such
> >>an issue.
> >
> >Yeah.  Sometimes you can force some of the decisions, but that usually
> >requires knowing too many GCC internals :-/
> >
> >>>>And there is even one completely unused instance of csum_add().
> >>>
> >>>That is strange, that should never happen.
> >>
> >>It seems that several .o include unused versions of csum_add. After the
> >>final link, one remains (in addition to the used one) in vmlinux.
> >
> >But it is a static function, so it should not end up in any object file
> >where it isn't used.
> 
> Well .... did I dream ?
> 
> Now I only find one extra .o with unused csum_add() : That's 
> net/ipv6/exthdrs.o
> It matches the one found in vmlinux.
> 
> Are you interested in -fdump-tree-einline-all for that one as well ?

Sure.  Hopefully it will show more :-)


Segher
