Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455D14964E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:19:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgSMQ0HBgz3cFq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 05:19:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JgSLy6zzkz30RD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 05:19:06 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 20LIFjdK029046;
 Fri, 21 Jan 2022 12:15:45 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 20LIFiiO029045;
 Fri, 21 Jan 2022 12:15:44 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 21 Jan 2022 12:15:44 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] powerpc: Add missing SPDX license identifiers
Message-ID: <20220121181544.GH614@gate.crashing.org>
References: <d2c52284244d6dcb3472d2041abe43b456d116df.1642762977.git.christophe.leroy@csgroup.eu>
 <YerEuE6XlslE3Goo@kroah.com>
 <24829c2f-6855-c8d6-7ae4-17c5517f890d@csgroup.eu>
 <YerO8MjbXlvbMEsZ@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YerO8MjbXlvbMEsZ@kroah.com>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 21, 2022 at 04:19:12PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Jan 21, 2022 at 03:13:50PM +0000, Christophe Leroy wrote:
> > >> - * This file is free software; you can redistribute it and/or modify it
> > >> - * under the terms of the GNU General Public License as published by the
> > >> - * Free Software Foundation; either version 2, or (at your option) any
> > >> - * later version.

[ ... ]

> > >>    *    As a special exception, if you link this library with files
> > >>    *    compiled with GCC to produce an executable, this does not cause
> > >>    *    the resulting executable to be covered by the GNU General Public License.

The "as a special exception" refers to "This file is free software;
you can redistribute it and/or modify it".  It is meaningless without
having anything it is an exception *to* :-)

In general, you should never edit licence texts.

> > > Look at that "special exception", why are you ignoring it here?  You
> > > can't do that :(
> > 
> > I'm not ignoring it, that's the reason why I left it.
> 
> You ignore that part of the license in the SPDX line, why?
> 
> > Isn't it the correct way to do ? How should it be done ?
> 
> You need to properly describe this in the SPDX line.  You did not do so
> here, which means that any tool just looking at the SPDX line would get
> this license wrong.

A new label needs to be defined and documented.  Should be pretty
mechanical to do, but that should see a wider audience than the powerpc
hackers :-)


Segher
