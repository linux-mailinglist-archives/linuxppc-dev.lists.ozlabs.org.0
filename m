Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C935A4F2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 19:52:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FH5Lb0z6Yz3c29
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 03:52:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FH5LC5PL8z3bTy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 03:52:00 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 139HjBG4002289;
 Fri, 9 Apr 2021 12:45:11 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 139Hj6hE002280;
 Fri, 9 Apr 2021 12:45:06 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 9 Apr 2021 12:45:06 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc/traps: Enhance readability for trap types
Message-ID: <20210409174506.GH26583@gate.crashing.org>
References: <20210408140750.26832-1-sxwjean@me.com>
 <70ece993-12bd-335c-d246-914564eb51dd@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70ece993-12bd-335c-d246-914564eb51dd@csgroup.eu>
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
Cc: pmladek@suse.com, peterz@infradead.org, linux-kernel@vger.kernel.org,
 paulus@samba.org, kan.liang@linux.intel.com, mikey@neuling.org,
 maddy@linux.ibm.com, haren@linux.ibm.com, aik@ozlabs.ru, kjain@linux.ibm.com,
 ravi.bangoria@linux.ibm.com, john.ogness@linutronix.de, alistair@popple.id.au,
 npiggin@gmail.com, jniethe5@gmail.com, atrajeev@linux.vnet.ibm.com,
 Xiongwei Song <sxwjean@me.com>, Xiongwei Song <sxwjean@gmail.com>,
 oleg@redhat.com, aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 09, 2021 at 06:14:19PM +0200, Christophe Leroy wrote:
> >+#define INTERRUPT_SYSTEM_RESET    0x100
> 
> INT_SRESET

SRESET exists on many PowerPC, it means "soft reset".  Not the same
thing at all.

I think "INT" is not a great prefix fwiw, there are many things you can
abbr to "INT".

> >+#define INTERRUPT_DATA_SEGMENT    0x380
> 
> INT_DSEG

exceptions-64s.S calls this "DSLB" (I remember "DSSI" though -- but neither
is a very official name).  It probably is a good idea to look at that
existing code, not make up even more new names :-)

> >+#define INTERRUPT_DOORBELL        0xa00
> 
> INT_DBELL

That saves three characters and makes it very not understandable.


Segher
