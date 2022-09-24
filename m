Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6F55E8F5E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 20:33:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZd1r0g8Qz3dtW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Sep 2022 04:33:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZd1N2jJ8z3bbP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 04:32:55 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28OIUpan005575;
	Sat, 24 Sep 2022 13:30:51 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 28OIUoYF005572;
	Sat, 24 Sep 2022 13:30:50 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 24 Sep 2022 13:30:50 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/irq: Modernise inline assembly in irq_soft_mask_{set,return}
Message-ID: <20220924183050.GP25951@gate.crashing.org>
References: <178f30ff62c0317061f019b3dbbc079073f104c3.1663656058.git.christophe.leroy@csgroup.eu> <CN3LB8F3D9LM.3W1RQRVS64UXU@bobo> <20220923121829.GL25951@gate.crashing.org> <CN3X6YN1FRQ3.1Z9BVD6WYQY3M@bobo> <20220923221543.GN25951@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923221543.GN25951@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 23, 2022 at 05:15:43PM -0500, Segher Boessenkool wrote:
> On Sat, Sep 24, 2022 at 02:26:52AM +1000, Nicholas Piggin wrote:
> > I still don't see what clauses guarantees asm("%0" ::"r"(foo)) to give
> > 13. It doesn't say access via inline assembly is special,
> 
> But it is.  It is for all register variables, local and global.  I agree
> this isn't documented clearly.  For local register variables this is the
> *only* thing guaranteed; for global register vars there is more (it
> changes the ABI, there are safe/restore effects, that kind of thing).

I filed <https://gcc.gnu.org/PR107027> to improve the docs.  Thanks for
bringing this to our attention!


Segher
