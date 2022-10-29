Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C308612442
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 17:37:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N03SZ3WxMz3cML
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 02:37:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N03Rz6fpdz3bhl
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 02:36:45 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 29TFXYnV001845;
	Sat, 29 Oct 2022 10:33:34 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 29TFXVDQ001842;
	Sat, 29 Oct 2022 10:33:31 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 29 Oct 2022 10:33:31 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
Message-ID: <20221029153331.GI25951@gate.crashing.org>
References: <87y1tfl1pt.fsf@mpe.ellerman.id.au> <BCDB3B67-48A1-45E6-806D-2501C7EA6D8C@xenosoft.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BCDB3B67-48A1-45E6-806D-2501C7EA6D8C@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, Andrew Donnellan <ajd@linux.ibm.com>, npiggin@gmail.com, rmclure@linux.ibm.com, mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 17, 2022 at 09:53:04AM +0200, Christian Zigotzky wrote:
> > On 17. Oct 2022, at 02:43, Michael Ellerman <mpe@ellerman.id.au> wrote:
> > Previously BIG_ENDIAN && GENERIC_CPU would use -mcpu=power5, now it uses
> > -mcpu=power4.
> 
> Maybe this is the issue. We will wait and not release the RC1 for testing because it is a risk for our testers to test these new kernels because of this issue.
> 
> It is really important do not to rewrite code, that is well worked before.
> Bugfixing and adding some new features is ok but rewriting of good code is expensive and doesn’t make any sense.

It was just a bugfix, and a (partial) revert.

471d7ff8b51b says it removed ISA 2.00 support (original power4, "GP").
Support for ISA 2.01 was retained it says.  That is power4+, "GQ", but
also 970 (Apple G5).  That patch actually switched to ISA 2.02 though,
unintendedly, and code generated for ISA 2.02 will not run on systems
like 970, in principle.  It is just one uncommon instruction that is
problematical, namely popcntb, because the kernel does not use floating
point at all, so that is why we got away with it for so long (most code
that does use fp will fall flat on its face in no time).  It still is a
bug fix though!

PA6T is ISA 2.04, it's not clear how this (bugfix, and revert!) change
made code not run on PA6T anymore.  Smells a lot like something indirect
(or triply indirect), a separate bug, something that was introduced in
the last two years maybe, but I'll even bet it is something *exposed* in
that time, a bug that has been here for longer!


Segher
