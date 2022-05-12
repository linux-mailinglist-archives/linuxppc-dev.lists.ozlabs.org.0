Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1345250F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 17:12:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzZyf71d0z3c7L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 01:12:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sBQRfnUv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sBQRfnUv; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzZy30tLRz3br4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 May 2022 01:12:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A4C161E83;
 Thu, 12 May 2022 15:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC39CC385B8;
 Thu, 12 May 2022 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652368328;
 bh=uYvMyxzmEzgGs3lP9laB6AIOtldLOsLsxFxjFqAdLXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sBQRfnUv/ca+85vrpjesPIxdKdgiMljkmIZppAtfxQyk09MZXAbwlvvUqjcOt2n2A
 dEoXTis3MD4xnnsEaPMpa1EgKQuBHkApCeNPkNLbxdkHELHL3KI67rGzSblRcD+QV0
 FJf7Uho/8upVG7WGp9d0OPH50jm4xBuV0pw2//XGqjgaSkCKkxhzM7BQKNVfcOX/IC
 4a71yQ5fJ/PbpfUBVmnzL209EriGr+YpbR4Wbjq+XdTj/FNUVHwJ0oNntwBaXvgAE4
 AGOeYW+imMB0UgQ8F+c3VKyve3jttJYDNBYEEwb3wt6tZ6zEWnn2A0VHQ3PKJ7pn2D
 AeV6sG/T2RCoA==
Date: Thu, 12 May 2022 08:12:06 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Message-ID: <20220512151206.dphxz5jyeshwc4jb@treble>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <0b55f122-4760-c1ba-840a-0911cefec2ad@csgroup.eu>
 <20220328195920.dqlfra3lcardko6r@treble>
 <b8fac6e2-c117-86cf-2901-5ae0852ca403@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8fac6e2-c117-86cf-2901-5ae0852ca403@csgroup.eu>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Sathvika Vasireddy <sv@linux.ibm.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 12, 2022 at 02:52:40PM +0000, Christophe Leroy wrote:
> Hi Josh,
> 
> Le 28/03/2022 à 21:59, Josh Poimboeuf a écrit :
> > On Sun, Mar 27, 2022 at 09:09:20AM +0000, Christophe Leroy wrote:
> >> What are current works in progress on objtool ? Should I wait Josh's
> >> changes before starting looking at all this ? Should I wait for anything
> >> else ?
> > 
> > I'm not making any major changes to the code, just shuffling things
> > around to make the interface more modular.  I hope to have something
> > soon (this week).  Peter recently added a big feature (Intel IBT) which
> > is already in -next.
> > 
> 
> Were you able to send out something ?

Yes, the objtool rewrite is now in tip/objtool/core and linux-next.

-- 
Josh
