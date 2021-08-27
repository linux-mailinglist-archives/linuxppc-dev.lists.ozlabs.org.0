Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 811483F9C18
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 18:07:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx4PC2w7vz3c4b
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 02:07:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Gx4Nk3dXHz2ypP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 02:07:17 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17RG4ccs010710;
 Fri, 27 Aug 2021 11:04:38 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17RG4ajV010707;
 Fri, 27 Aug 2021 11:04:36 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 27 Aug 2021 11:04:36 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH] powerpc: Investigate static_call concept
Message-ID: <20210827160436.GQ1583@gate.crashing.org>
References: <8077899fee81f08a7dffbf185569d3a1f7a2ab68.1630057495.git.christophe.leroy@csgroup.eu>
 <YSj0R6g6HeboSk9n@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSj0R6g6HeboSk9n@hirez.programming.kicks-ass.net>
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
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Jason Baron <jbaron@akamai.com>, Paul Mackerras <paulus@samba.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 27, 2021 at 04:18:47PM +0200, Peter Zijlstra wrote:
> On Fri, Aug 27, 2021 at 09:45:37AM +0000, Christophe Leroy wrote:
> > This RFC is to validate the concept of static_call on powerpc.
> > 
> > Highly copied from x86.
> > 
> > It replaces ppc_md.get_irq() which is called at every IRQ, by
> > a static call.
> 
> The code looks saner, but does it actually improve performance? I'm
> thinking the double branch also isn't free.

It isn't, but it is very cheap, while the branch-to-count is not, even
*if* it is correctly predicted.

> The paranoid in me would've made it:
> 
> 	BUG_ON(patch_branch(...));
> 
> just to make sure to notice the target not fitting. Ohh, patch_branch()
> doesn't return the create_branch() error, perhaps that wants to be
> fixed?

Should that be allowed to fail ever?  I.e., should a failure be a fatal
error?  Sounds very fragile otherwise.


Segher
