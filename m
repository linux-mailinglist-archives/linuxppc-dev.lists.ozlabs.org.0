Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F8C242850
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 12:39:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRR5J2QztzDqXM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 20:39:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRR391lWczDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 20:37:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=a6/dAk8hzb0WYY+kQF71Fgx1O3nwOedWBapk4f0aaOE=; b=KA3A4rKfqtBkAolbpGhZQn0gae
 rIqsIfEejxM64L+YMTBJUSvg9fEFIfvHxwctOuhc9kOyfSdozptYsA0jAOiKaRSfUdNi72MKP9/pK
 nkS/znp2LKbSteLjA3WozUbWSHli0WpEytH2VWZvz/eAOBqRX+XYtpWzwnEOCloZYCLFOC3afCNHm
 rkq0HuJB3Rc7Zw8PRD3F29LxE2f6cEgqiZbZbThXq4+UEfKq9D08M/+swMXJRha+LvkLztxW2QGL2
 ViWxhZVhOuYLHsAyeFHBmHL/uIcJ0MWeVdzlotQr4696vPqatWO8tc8k9EQnzrdgHJJkzsiPQxZg3
 zd6QAwzg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5o6c-0008Cw-Cp; Wed, 12 Aug 2020 10:36:12 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 911FF300DAE;
 Wed, 12 Aug 2020 12:35:30 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 787BB2B412CB6; Wed, 12 Aug 2020 12:35:30 +0200 (CEST)
Date: Wed, 12 Aug 2020 12:35:30 +0200
From: peterz@infradead.org
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] lockdep: improve current->(hard|soft)irqs_enabled
 synchronisation with actual irq state
Message-ID: <20200812103530.GL2674@hirez.programming.kicks-ass.net>
References: <20200723105615.1268126-1-npiggin@gmail.com>
 <20200807111126.GI2674@hirez.programming.kicks-ass.net>
 <1597220073.mbvcty6ghk.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597220073.mbvcty6ghk.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 12, 2020 at 06:18:28PM +1000, Nicholas Piggin wrote:
> Excerpts from peterz@infradead.org's message of August 7, 2020 9:11 pm:
> > 
> > What's wrong with something like this?
> > 
> > AFAICT there's no reason to actually try and add IRQ tracing here, it's
> > just a hand full of instructions at the most.
> 
> Because we may want to use that in other places as well, so it would
> be nice to have tracing.
> 
> Hmm... also, I thought NMI context was free to call local_irq_save/restore
> anyway so the bug would still be there in those cases?

NMI code has in_nmi() true, in which case the IRQ tracing is disabled
(except for x86 which has CONFIG_TRACE_IRQFLAGS_NMI).
