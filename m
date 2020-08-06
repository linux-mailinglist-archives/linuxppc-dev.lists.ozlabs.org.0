Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C1623DAA5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 15:19:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMpxG5gFKzDqNk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 23:19:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=hvCFPwav; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMpsR2Qk3zDqGx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 23:16:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cOTbQsNE4Og+7v4i6+VKDw9s40FCqKihoprFB/Z7nt8=; b=hvCFPwavzhUN+ZIogP2sMOZQlR
 ldTroAQ1ISrql6nxZpb0nEf4gN8Fxz94Lc+EK7Cv32LXLhU9UxovKAKLvqDFx577e91UBb9M3Vkc1
 uhd6LiOkRaw/MadIv8c+2h7qQ6GD7W67I5NCQCYtMbIE45KhgOcKTU3KseZBXf0XKKaYswdd0YWQl
 sI6Ddf0X27dLDWKYa33hew5wjNxo1fVvwOfS+NMZ3FohiFw0dDcEOr15JDGRAV/AdpsXS0qMwRECs
 ZpivDAKjhPWCs/nczc8EnzDTjHNcHnpgphZ1mMrLPFyREGDpvAlnHeexNyOSdfs/NgDBnHbnl95Qw
 w5I8myLQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3fkO-0002VI-16; Thu, 06 Aug 2020 13:15:52 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 99ADE3010D2;
 Thu,  6 Aug 2020 15:15:47 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 74607213C48A6; Thu,  6 Aug 2020 15:15:47 +0200 (CEST)
Date: Thu, 6 Aug 2020 15:15:47 +0200
From: peterz@infradead.org
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] sched/topology: Allow archs to override cpu_smt_mask
Message-ID: <20200806131547.GC2674@hirez.programming.kicks-ass.net>
References: <20200804033307.76111-1-srikar@linux.vnet.ibm.com>
 <20200804104520.GB2657@hirez.programming.kicks-ass.net>
 <20200804121007.GJ24375@linux.vnet.ibm.com>
 <20200804124755.GJ2674@hirez.programming.kicks-ass.net>
 <87ft90z6dy.fsf@mpe.ellerman.id.au>
 <20200806085429.GX2674@hirez.programming.kicks-ass.net>
 <87d044yn9z.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d044yn9z.fsf@mpe.ellerman.id.au>
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Ingo Molnar <mingo@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 06, 2020 at 10:25:12PM +1000, Michael Ellerman wrote:
> peterz@infradead.org writes:
> > On Thu, Aug 06, 2020 at 03:32:25PM +1000, Michael Ellerman wrote:
> >
> >> That brings with it a bunch of problems, such as existing software that
> >> has been developed/configured for Power8 and expects to see SMT8.
> >> 
> >> We also allow LPARs to be live migrated from Power8 to Power9 (and back), so
> >> maintaining the illusion of SMT8 is considered a requirement to make that work.
> >
> > So how does that work if the kernel booted on P9 and demuxed the SMT8
> > into 2xSMT4? If you migrate that state onto a P8 with actual SMT8 you're
> > toast again.
> 
> The SMT mask would be inaccurate on the P8, rather than the current case
> where it's inaccurate on the P9.
> 
> Which would be our preference, because the backward migration case is
> not common AIUI.
> 
> Or am I missing a reason we'd be even more toast than that?

Well, the scheduler might do a wee bit funny. We just had a patch that
increase load-balancing opportunities between SMT siblings because they
all share L1 anyway.

But yeah, nothing terminal.

> Under PowerVM the kernel does know it's being migrated, so we could
> actually update the mask, but I'm not sure if that's really feasible.

As long as you get a notification, rebuilding the sched domains isn't
terribly hard to do, there's more code that does that.

> >> Yeah I agree the naming is confusing.
> >> 
> >> Let's call them "SMT4 cores" and "SMT8 cores"?
> >
> > Works for me, thanks!
> >
> >> The problem is we are already lying to userspace, because firmware lies to us.
> >> 
> >> ie. the firmware on these systems shows us an SMT8 core, and so current kernels
> >> show SMT8 to userspace. I don't think we can realistically change that fact now,
> >> as these systems are already out in the field.
> >> 
> >> What this patch tries to do is undo some of the mess, and at least give the
> >> scheduler the right information.
> >
> > What a mess... I think it depends on what you do with that P9 to P8
> > migration case. Does it make sense to have a "p8_compat" boot arg for
> > the case where you want LPAR migration back onto P8 systems -- in which
> > case it simply takes the firmware's word as gospel and doesn't untangle
> > things, because it can actually land on a P8.
> 
> We already get told by firmware that we're running in "p8 compat" mode,
> because we have to pretend to userspace that it's running on a P8. So we
> could use that as a signal to leave things alone.
> 
> But my understanding is most LPARs don't get migrated back and forth,
> they'll start life on a P8 and only get migrated to a P9 once when the
> customer gets a P9. They might then run for a long time (months to
> years) on the P9 in P8 compat mode, not because they ever want to
> migrate back to a real P8, but because the software in the LPAR is still
> expecting to be on a P8.
> 
> I'm not a real expert on all the Enterprisey stuff though, so someone
> else might be able to give us a better picture.
> 
> But the point of mentioning the migration stuff was mainly just to
> explain why we feel we need to present SMT8 to userspace even on P9.

OK, fair enough. The patch wasn't particularly onerous, I was just
wondering why etc..

The case of starting on a P8 and being migrated to a P9 makes sense to
me; in that case you'd like to rebuild your sched domains, but can't go
about changing user visible topolofy information.

I suppose:

Acked-by; Peter Zijlstra (Intel) <peterz@infradead.org>

An updated Changelog that recaps some of this discussion might also be
nice.
