Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B21654680B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 16:08:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKN966rMKz3fBt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 00:08:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKN8g6rmDz2yjS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 00:08:02 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25AE5n6C008179;
	Fri, 10 Jun 2022 09:05:49 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 25AE5nmO008178;
	Fri, 10 Jun 2022 09:05:49 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 10 Jun 2022 09:05:48 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Rohan McLure <rmclure@linux.ibm.com>
Subject: Re: [PATCH 1/6] powerpc: Add ZERO_GPRS macros for register clears
Message-ID: <20220610140548.GQ25951@gate.crashing.org>
References: <20220601054850.250287-1-rmclure@linux.ibm.com> <20220601160023.GV25951@gate.crashing.org> <88BD925A-D6A8-4983-A573-7D9CEE51CDE7@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88BD925A-D6A8-4983-A573-7D9CEE51CDE7@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Fri, Jun 10, 2022 at 01:32:58PM +1000, Rohan McLure wrote:
> > On 2 Jun 2022, at 2:00 am, Segher Boessenkool <segher@kernel.crashing.org> wrote:
> > This is for unary operations, not binary operations (there is only one
> > item on the RHS).  You can in principle put a string "a,b" in the rhs
> > parameter, but in practice you need a or b to depend on the loop counter
> > as well, so even such trickiness won't do.  Make the naming less
> > confusing, maybe?  Or don't have an unused extra level of abstraction in
> > the first place :-)

> Yep I see how having a macro to perform rX = rX <> Y for arbitrary infix <> and operand
> is unlikely to find much use outside of ZERO_GPRS.

Aha.  On PowerPC (like on most RISC-like architectures) all the normal
instructions are rD := rA OP rB, not rD := rD OP rA.  It looks like
that is our disconnect :-)


Segher
