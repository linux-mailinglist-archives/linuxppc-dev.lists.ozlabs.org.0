Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23993207365
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 14:34:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sMyr6jKlzDqkG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 22:34:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=PP2H5yDL; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sMwW557lzDqQh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 22:32:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=it9VsGosZwW2AP+pfNnE7lbVlyMIxAC0ndaAV7moVK0=; b=PP2H5yDL6sw2rzJ9wwDgYU5npx
 DegwUhHRBC74l2k/7QgLFXzQ5D+rkWEwAvKbR1I5BlI3E3ORsNoJvAslgybSzD5AK5rhJzXFD9sm3
 mt64QM+6t3xLhYJDfrIEQpnM0hDmOYoIVcwI8VD8r0PDAcNUZuwgBIVdbWNDkDXIJQOxE1FsInSLv
 Sf+tHA7qRjaCnJTY/+JKlEIEsbrcHXeyfpbpuBdU/2wzslLrG1aUsGLBJWajvVmeAXZX600RE+BpO
 OFaoNN3K7C/ocakwoK8OLA1wyT8a/7ZWsuYQfmNbVvXBJzgiVQ1+T+wiZ9xpB65R7HiUVOMsvyoCB
 Z12SiQnw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo4ZB-000677-UW; Wed, 24 Jun 2020 12:31:50 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 51910301A7A;
 Wed, 24 Jun 2020 14:31:47 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3D90821211CCA; Wed, 24 Jun 2020 14:31:47 +0200 (CEST)
Date: Wed, 24 Jun 2020 14:31:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200624123147.GH4781@hirez.programming.kicks-ass.net>
References: <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
 <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
 <20200623163730.GA4800@hirez.programming.kicks-ass.net>
 <20200623175957.GA106514@elver.google.com>
 <20200623181232.GB4800@hirez.programming.kicks-ass.net>
 <20200623202404.GE2483@worktop.programming.kicks-ass.net>
 <20200624090033.GD4800@hirez.programming.kicks-ass.net>
 <CANpmjNMj8FZuBrZsH62V3bZEhFvT2zXwLusVOLwNuH_-kLhp2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNMj8FZuBrZsH62V3bZEhFvT2zXwLusVOLwNuH_-kLhp2g@mail.gmail.com>
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "Paul E. McKenney" <paulmck@kernel.org>, bigeasy@linutronix.de,
 the arch/x86 maintainers <x86@kernel.org>, heiko.carstens@de.ibm.com,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 "David S. Miller" <davem@davemloft.net>,
 "Ahmed S. Darwish" <a.darwish@linutronix.de>, sparclinux@vger.kernel.org,
 linux@armlinux.org.uk, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 24, 2020 at 12:17:56PM +0200, Marco Elver wrote:
> On Wed, 24 Jun 2020 at 11:01, Peter Zijlstra <peterz@infradead.org> wrote:

> > And I figured a quick way to get rid of that would be something like the
> > below, seeing how volatile gets auto annotated... but that doesn't seem
> > to actually work.
> >
> > What am I missing?
> 
> There's one more in include/linux/rcupdate.h. I suggested this at some point:
> 
>     https://lore.kernel.org/lkml/20200220213317.GA35033@google.com/
> 
> To avoid volatiles as I don't think they are needed here.

Urgghh.. local_t is very expensive for this. The current code is
actually fine, even on load-store architectures. Using local_t will only
result in it being more expensive for no gain.

I'll go put data_race() around it.
