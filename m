Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB806ED38A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 19:34:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4sgG5XPlz3fSN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 03:33:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4sfl1Jqtz3bW0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 03:33:16 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 33OHT2fU012355;
	Mon, 24 Apr 2023 12:29:03 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 33OHT1xM012351;
	Mon, 24 Apr 2023 12:29:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 24 Apr 2023 12:29:00 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Boqun Feng <boqun.feng@gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Message-ID: <20230424172900.GR19790@gate.crashing.org>
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com> <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com> <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia> <20230424151351.GP19790@gate.crashing.org> <ZEagN1jJwg+rUzX4@boqun-archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEagN1jJwg+rUzX4@boqun-archlinux>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, Zhouyi Zhou <zhouzhouyi@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 24, 2023 at 08:28:55AM -0700, Boqun Feng wrote:
> On Mon, Apr 24, 2023 at 10:13:51AM -0500, Segher Boessenkool wrote:
> > At what points can r13 change?  Only when some particular functions are
> > called?
> 
> r13 is the local paca:
> 
> 	register struct paca_struct *local_paca asm("r13");
> 
> , which is a pointer to percpu data.

Yes, it is a global register variable.

> So if a task schedule from one CPU to anotehr CPU, the value gets
> changed.

But the compiler does not see that something else changes local_paca (or
r13 some other way, via assembler code perhaps)?  Or is there a compiler
bug?

If the latter is true:

Can you make a reproducer and open a GCC PR?  <https://gcc.gnu.org/bugs/>
for how to get started doing that.  We need *exact* code that shows the
problem, together with a compiler command line.  So that we can
reproduce the problem.  That is step 0 in figuring out what is going on,
and then maybe fixing the problem :-)


Segher
