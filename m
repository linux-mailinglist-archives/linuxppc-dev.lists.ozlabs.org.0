Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69911D34B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 18:12:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YgN35bsHzDr7V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 04:12:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="xKrPjstB"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YgBr6j3szDr5N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 04:04:36 +1100 (AEDT)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A4EB214AF;
 Thu, 12 Dec 2019 17:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576170274;
 bh=cStQM6dJAgiI/M8e5otdqNPehlU5HK8fnoGish0RYPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xKrPjstBHwTbT220UQOtLkKeCMvT6WPqTLCez8mR+Lq7UVly0+SrA5HonfG1lMuyO
 Uy6bO0rwELdpe2xXOhR9JbKXRiq4xqT6Xsi+e/OTI+9prkABIh2bIOaZcKkaGFGW5p
 YqTrrN1JrVJnnP8s94OpHruGOkFIRCOQrvvW7fz8=
Date: Thu, 12 Dec 2019 17:04:28 +0000
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
Message-ID: <20191212170427.GA16364@willie-the-truck>
References: <87blslei5o.fsf@mpe.ellerman.id.au>
 <20191206131650.GM2827@hirez.programming.kicks-ass.net>
 <875zimp0ay.fsf@mpe.ellerman.id.au>
 <20191212080105.GV2844@hirez.programming.kicks-ass.net>
 <20191212100756.GA11317@willie-the-truck>
 <20191212104610.GW2827@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212104610.GW2827@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 12, 2019 at 11:46:10AM +0100, Peter Zijlstra wrote:
> On Thu, Dec 12, 2019 at 10:07:56AM +0000, Will Deacon wrote:
> 
> > > So your proposed change _should_ be fine. Will, I'm assuming you never
> > > saw this on your ARGH64 builds when you did this code ?
> > 
> > I did see it, but (a) looking at the code out-of-line makes it look a lot
> > worse than it actually is (so the ext4 example is really helpful -- thanks
> > Michael!) and (b) I chalked it up to a crappy compiler.
> > 
> > However, see this comment from Arnd on my READ_ONCE series from the other
> > day:
> > 
> > https://lore.kernel.org/lkml/CAK8P3a0f=WvSQSBQ4t0FmEkcFE_mC3oARxaeTviTSkSa-D2qhg@mail.gmail.com
> > 
> > In which case, I'm thinking that we should be doing better in READ_ONCE()
> > for non-buggy compilers which would also keep the KCSAN folks happy for this
> > code (and would help with [1] too).
> 
> So something like this then? Although I suppose that should be moved
> into compiler-gcc.h and then guarded by #ifndef READ_ONCE or so.

Ah wait, I think we've been looking at this wrong. The volatile pointer
argument is actually the problem here, not READ_ONCE()! The use of typeof()
means that the temporary variable to which __READ_ONCE_SIZE writes ends up
being a volatile store, so it can't be optimised away. This is why we get
a stack access and why stack protector then wrecks the codegen for us.

I'll cook a patch getting rid of those volatiles.

Will
