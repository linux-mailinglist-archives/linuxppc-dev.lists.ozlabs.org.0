Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED7C559D62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 17:35:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV1Qn0QGRz3cjF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 01:35:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV1QP2Wggz3bwk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 01:34:52 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25OFVaCv017983;
	Fri, 24 Jun 2022 10:31:37 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 25OFVYlh017982;
	Fri, 24 Jun 2022 10:31:34 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 24 Jun 2022 10:31:34 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 4/4] watchdog/pseries-wdt: initial support for H_WATCHDOG-based watchdog timers
Message-ID: <20220624153134.GV25951@gate.crashing.org>
References: <20220602175353.68942-1-cheloha@linux.ibm.com> <20220602175353.68942-5-cheloha@linux.ibm.com> <87wnd642f7.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wnd642f7.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, linux-watchdog@vger.kernel.org, aik@ozlabs.ru, Scott Cheloha <cheloha@linux.ibm.com>, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 24, 2022 at 11:27:24PM +1000, Michael Ellerman wrote:
> Scott Cheloha <cheloha@linux.ibm.com> writes:
> > + * - For the "Query Watchdog Capabilities" operation, a 64-bit
> > + *   value structured as follows:
> > + *
> > + *       Bits  0-15: The minimum supported timeout in milliseconds.
> > + *       Bits 16-31: The number of watchdogs supported.
> > + *       Bits 32-63: Reserved.
> > + */
> > +#define PSERIES_WDTQ_MIN_TIMEOUT(cap)	GETFIELD((cap), 0, 15)
> 
> This one is less obviously better, but I still think it's clearer as all
> the logic is there in front of you, rather than hidden in the macro. It
> is clearer that we're only returning a 16-bit value.
> 
> #define PSERIES_WDTQ_MIN_TIMEOUT(cap)	(((cap) >> 48) & 0xffff)

Or even
  ((cap) >> 48)
since it is a 64-bit value.  If you want better defences you should not
use macros here at all, anyway (but inline functions, instead).

I could rant about the 1000UL being meaningless and/or misleading, or
that 0x1 is just silly, but it is a sunny day :-)


Segher
