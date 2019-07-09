Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABC2639EA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 19:06:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jpd65TYwzDqWK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 03:06:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jpZz4G9JzDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 03:04:43 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x69H4Oop012194;
 Tue, 9 Jul 2019 12:04:24 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x69H4Mr9012191;
 Tue, 9 Jul 2019 12:04:22 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 9 Jul 2019 12:04:22 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 4/4] powerpc/64: reuse PPC32 static inline
 flush_dcache_range()
Message-ID: <20190709170422.GM30355@gate.crashing.org>
References: <239d1c8f15b8bedc161a234f9f1a22a07160dbdf.1557824379.git.christophe.leroy@c-s.fr>
 <d6f628ffdeb9c7863da722a8f6ef2949e57bb360.1557824379.git.christophe.leroy@c-s.fr>
 <87y318d2th.fsf@linux.ibm.com>
 <CAOSf1CG-oxpSDsAPw8xHV5367MrMn2Ty_yDpPY9TvA6wMrMZHA@mail.gmail.com>
 <c0461069-8ef8-cb56-6807-71cc79793ac4@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0461069-8ef8-cb56-6807-71cc79793ac4@linux.ibm.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 09, 2019 at 08:21:54AM +0530, Aneesh Kumar K.V wrote:
> On 7/9/19 7:50 AM, Oliver O'Halloran wrote:
> >I don't think it's that, there's some magic in flush_icache_range() to
> >handle dropping prefetched instructions on 970.
> >
> >>So overall wondering why we need that extra barriers there.
> >
> >I think the isync is needed there because the architecture only
> >requires sync to provide ordering. A sync alone doesn't guarantee the
> >dcbfs have actually completed so the isync is necessary to ensure the
> >flushed cache lines are back in memory. That said, as far as I know
> >all the IBM book3s chips from power4 onwards will wait for pending
> >dcbfs when they hit a sync, but that might change in the future.
> >
> 
> ISA doesn't list that as the sequence. Only place where isync was 
> mentioned was w.r.t  icbi where want to discards the prefetch.

You need an isync to guarantee all icbi insns before the isync have been
performed before any code after the isync is fetched.  Killing the
prefetch is just part of it.

> >If it's a problem we could add a cpu-feature section around the isync
> >to no-op it in the common case. However, when I had a look with perf
> >it always showed that the sync was the hotspot so I don't think it'll
> >help much.
> 
> What about the preceding barriers (sync; isync;) before dcbf? Why are 
> they needed?

This isn't very generic code.  The code seems to be trying to do
coherency in software.  Like you needed to do for DART on U3/U4, or for
some of the PMU/SMU communication -- both are through main memory, but
both are not cache coherent.  Which means all rules go out of the
window.

To do this properly you need some platform-specific code, for example
to kill hardware and software prefetch streams.  Or hope^Wguarantee
those never touch your communication buffers.


I recommend you keep the original function, maybe with a more specific
name, for the DART etc. code; and have all normal(*) dcbf users use a
new more normal function, with just a single sync instruction.


Segher


(*) As far as anything using dcbf can be called "normal"!
