Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 459DD97916
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 14:18:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D6CF2YsRzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 22:18:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D67W0QsczDr1C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 22:15:33 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7LCFHgj004071;
 Wed, 21 Aug 2019 07:15:18 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x7LCFHnI004070;
 Wed, 21 Aug 2019 07:15:17 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 21 Aug 2019 07:15:17 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/vdso64: inline __get_datapage()
Message-ID: <20190821121517.GD31406@gate.crashing.org>
References: <6662919bd80773aaf339e85b14af1ea1ddbfd841.camel@kernel.crashing.org>
 <20190821092959.16066-1-santosh@fossix.org>
 <20190821114423.GC31406@gate.crashing.org>
 <b7cc5d77-dfca-1cf7-f316-636a4f603b04@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7cc5d77-dfca-1cf7-f316-636a4f603b04@c-s.fr>
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 21, 2019 at 01:50:52PM +0200, Christophe Leroy wrote:
> Le 21/08/2019 à 13:44, Segher Boessenkool a écrit :
> >Calls are cheap, in principle...  It is the LR stuff that can make it
> >slower on some cores, and a lot of calling sequence stuff may have
> >considerable overhead of course.
> 
> On an 8xx, a taken branch is 2 cycles and a non taken branch in 1 cycle 
> (+ the refetch if that was not the anticipate branch).

Yup.  And on the big cores they are all 0 cycles, if correctly predicted.
(Taken branches end your fetch group, of course, there are small
inefficiencies everywhere, but that's about the gist of it).

> >>+.macro get_datapage ptr, tmp
> >>+	bcl	20,31,888f
> >>+888:
> >>+	mflr	\ptr
> >>+	addi	\ptr, \ptr, __kernel_datapage_offset - 888b
> >>+	lwz	\tmp, 0(\ptr)
> >>+	add	\ptr, \tmp, \ptr
> >>+.endm
> >
> >(You can just write that as
> >	bcl 20,31,$+4
> >	mflr \ptr
> >etc.  Useless labels are useless :-) )
> 
> Nice trick. Will use that.

Or .+4 if you like that syntax better...  It's all the same thing.

> >One thing you might want to do to improve performance is to do this without
> >the bcl etc., because you cannot really hide the LR latency of that.  But
> >that isn't very many ns either...  Superscalar helps, OoO helps, but it is
> >mostly just that >100MHz helps ;-)
> 
> Good idea. Did you have a look at my vdso32 similar patch ? 
> https://patchwork.ozlabs.org/patch/1148274/

Yes, I saw it.

> Do you have any idea on how to avoid that bcl/mflr stuff ?

Do a load from some fixed address?  Maybe an absolute address, even?
lwz r3,-12344(0)  or similar (that address is in kernel space...)

There aren't many options, and certainly not many *good* options!


Segher
