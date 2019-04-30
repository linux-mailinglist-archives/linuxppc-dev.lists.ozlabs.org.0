Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C063F87A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 14:10:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tgMT1Rw3zDqHZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 22:10:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tgJj6DhSzDq62
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 22:07:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ljvGw8ePwJU1BtvdBb7R72Czky3RJZItJhHXPlJxdKk=; b=Nk7xzAVf7JNy+7UJHbgBIyoht
 HgdUW3DVhipn0yyCVQhcoCtcE/Zfu5epcbiL6N6PUwNm6fV5RKdD1rzjWt4bckbO4dl4ZSqRavLeO
 ZBRGfsPBLkdlpiAsQL+wWFNpFLsGp7EFssmhhr9pSXtEoAQqZ2NZSWghOoTm9BuwqHb6AIChJbhQN
 P7XoEGEjJG0iME3GZoe9QbnFRLSjOyv8polIT/OhzZ5WF8G0BI1DBVlPLv1vu/xlSQ0XEgJpp3riY
 RhReKLQGUb+4yKW+U79uGDYaf7u1gjzXJFzCeIwAESYJVRj4Mhf7uRroQno5+DghOyq/doC/9J37t
 7mvIbUZFw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLRXy-0005J6-9F; Tue, 30 Apr 2019 12:07:46 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C22AE203C05DB; Tue, 30 Apr 2019 14:07:40 +0200 (CEST)
Date: Tue, 30 Apr 2019 14:07:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/5] Allow CPU0 to be nohz full
Message-ID: <20190430120740.GU2623@hirez.programming.kicks-ass.net>
References: <20190411033448.20842-1-npiggin@gmail.com>
 <20190425120427.GS4038@hirez.programming.kicks-ass.net>
 <1556592099.38esq4uhhz.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556592099.38esq4uhhz.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 30, 2019 at 12:46:40PM +1000, Nicholas Piggin wrote:
> Peter Zijlstra's on April 25, 2019 10:04 pm:
> > On Thu, Apr 11, 2019 at 01:34:43PM +1000, Nicholas Piggin wrote:
> >> Since last time, I added a compile time option to opt-out of this
> >> if the platform does not support suspend on non-zero, and tried to
> >> improve legibility of changelogs and explain the justification
> >> better.
> >> 
> >> I have been testing this on powerpc/pseries and it seems to work
> >> fine (the firmware call to suspend can be called on any CPU and
> >> resumes where it left off), but not included here because the
> >> code has some bitrot unrelated to this series which I hacked to
> >> fix. I will discuss it and either send an acked patch to go with
> >> this series if it is small, or fix it in powerpc tree.
> >> 
> > 
> > Rafael, Frederic, any comments?
> > 
> 
> Sorry to ping again, I guess people are probably busy after vacation.
> Any chance we could get this in next merge window? Peter are you okay
> with the config option as it is, then we can look at adapting it to
> what x86 needs as a follow up (e.g., allow nohz CPU0 for
> cpu0_hotpluggable case)?

Yeah, let me just queue these here patches. Not sure they'll still make
the upcoming merge window, but we can try.
