Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC1A228343
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 17:13:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB2Ck4hQ2zDqcM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 01:13:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=rRt75ZQ6; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB24t4L9xzDqgV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 01:07:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=71NowoGixtjq18mdGDFwmexc9Svbvbn0P+0c9pBBqgg=; b=rRt75ZQ6MHmsL8Qdoi91H5eebV
 dCcz3R9DppcQ2ntNO9cFf8oqJi04KtbpTMehLI39j3dKmmhdAVRH5bVYndvxaJNpA/DqfyVinxYGN
 4wCiFh0XHZeoShMLF7IOtAT5tN7oYtFwe1J8e27ORUWy9y4nReRCdHhl7PAu9mkgYWnbz6BnP15t3
 Kv6TTWUFLONBnnoLGn0gZV0nbzrFMyD5l9wQBGJa/jZXyub+Fh2HmfHHTteNM515Rrc/d7TKsFzus
 ipKUcf4/8bBgn/bOJuQ33i8snhLjZlyWxrqpo2ZqOzuGIhrUqm3Y/WrBFzGxvivjlB5zxnARHjmHo
 d1JJ38/g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxtrA-0007WY-0P; Tue, 21 Jul 2020 15:07:00 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 40027300446;
 Tue, 21 Jul 2020 17:06:56 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2C5FB203B8783; Tue, 21 Jul 2020 17:06:56 +0200 (CEST)
Date: Tue, 21 Jul 2020 17:06:56 +0200
From: peterz@infradead.org
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
Message-ID: <20200721150656.GN119549@hirez.programming.kicks-ass.net>
References: <1594868476.6k5kvx8684.astroid@bobo.none>
 <EFAD6E2F-EC08-4EB3-9ECC-2A963C023FC5@amacapital.net>
 <20200716085032.GO10769@hirez.programming.kicks-ass.net>
 <1594892300.mxnq3b9a77.astroid@bobo.none>
 <20200716110038.GA119549@hirez.programming.kicks-ass.net>
 <1594906688.ikv6r4gznx.astroid@bobo.none>
 <1314561373.18530.1594993363050.JavaMail.zimbra@efficios.com>
 <1595213677.kxru89dqy2.astroid@bobo.none>
 <2055788870.20749.1595263590675.JavaMail.zimbra@efficios.com>
 <1595324577.x3bf55tpgu.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595324577.x3bf55tpgu.astroid@bobo.none>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-arch <linux-arch@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, linux-mm <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 08:04:27PM +1000, Nicholas Piggin wrote:

> That being said, the x86 sync core gap that I imagined could be fixed 
> by changing to rq->curr == rq->idle test does not actually exist because
> the global membarrier does not have a sync core option. So fixing the
> exit_lazy_tlb points that this series does *should* fix that. So
> PF_KTHREAD may be less problematic than I thought from implementation
> point of view, only semantics.

So I've been trying to figure out where that PF_KTHREAD comes from,
commit 227a4aadc75b ("sched/membarrier: Fix p->mm->membarrier_state racy
load") changed 'p->mm' to '!(p->flags & PF_KTHREAD)'.

So the first version:

  https://lkml.kernel.org/r/20190906031300.1647-5-mathieu.desnoyers@efficios.com

appears to unconditionally send the IPI and checks p->mm in the IPI
context, but then v2:

  https://lkml.kernel.org/r/20190908134909.12389-1-mathieu.desnoyers@efficios.com

has the current code. But I've been unable to find the reason the
'p->mm' test changed into '!(p->flags & PF_KTHREAD)'.

The comment doesn't really help either; sure we have the whole lazy mm
thing, but that's ->active_mm, not ->mm.

Possibly it is because {,un}use_mm() do not have sufficient barriers to
make the remote p->mm test work? Or were we over-eager with the !p->mm
doesn't imply kthread 'cleanups' at the time?

Also, I just realized, I still have a fix for use_mm() now
kthread_use_mm() that seems to have been lost.


