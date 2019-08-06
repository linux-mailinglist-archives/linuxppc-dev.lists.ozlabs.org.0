Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C898360C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 17:59:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462zpS3tDRzDr7l
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 01:59:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462zmP2gxxzDr1f
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 01:57:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 462zmL5VKrz8tPq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 01:57:22 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 462zmL577mz9sN1; Wed,  7 Aug 2019 01:57:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 462zmL1DwGz9sMr
 for <linuxppc-dev@ozlabs.org>; Wed,  7 Aug 2019 01:57:21 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x76Fv12L016606;
 Tue, 6 Aug 2019 10:57:01 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x76Fv0d8016605;
 Tue, 6 Aug 2019 10:57:00 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 6 Aug 2019 10:57:00 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 3/3] powerpc/spinlocks: Fix oops in shared-processor
 spinlocks
Message-ID: <20190806155700.GP31406@gate.crashing.org>
References: <20190802042233.20835-1-cmr@informatik.wtf>
 <20190802042233.20835-4-cmr@informatik.wtf>
 <877e7vlruk.fsf@concordia.ellerman.id.au>
 <850780620.61430.1564758724962@privateemail.com>
 <87r25yv6cc.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r25yv6cc.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, Christopher M Riedl <cmr@informatik.wtf>,
 ajd@linux.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 06, 2019 at 10:14:27PM +1000, Michael Ellerman wrote:
> Christopher M Riedl <cmr@informatik.wtf> writes:
> > Yep, and that's no good. Hmm, executing the barrier() in the non-shared-processor
> > case probably hurts performance here?
> 
> It's only a "compiler barrier", so it shouldn't generate any code.
> 
> But it does have the effect of telling the compiler it can't optimise
> across that barrier, which can be important.

This is

#define barrier() __asm__ __volatile__("": : :"memory")

It doesn't tell the compiler "not to optimise" across the barrier.  It
tells the compiler that all memory accesses before the barrier should
stay before it, and all accesses after the barrier should stay after it,
because it says the "barrier" can access and/or change any memory.

This does not tell the hardware not to move those accesses around.  It
also doesn't say anything about things that are not in memory.  Not
everything you think is in memory, is.  What is and isn't in memory can
change during compilation.


[ This message brought to you by the "Stamp Out Optimisation Barrier"
  campaign. ]


Segher
