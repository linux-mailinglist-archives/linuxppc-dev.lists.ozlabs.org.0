Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DFC6A4352
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 14:51:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQMNC4Zlmz3c41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 00:51:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=pjNHlWPf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=pjNHlWPf;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQMMH0DB0z3bTc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:50:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EhR9H533iLJtMrWDRv6QbWK1xC5aZF5Krew4cuVbhkY=; b=pjNHlWPfx/mT2hbu+ptXuX0Bfl
	6zxwF35vF7M+uOcH6tkINiOev6YsMPaubnFo73g9CYU3Ll3T9vll1nI0RNIz3WNlOYgiQa0tIVuKA
	B74bpcIknADwNfdW3qiqy/LodWENLcXyHOE5GDwPy8SDC2sGnAK8XRozKiqv3/orCAw1mdFzv6HIi
	4Fd5+VtHusrJQM9si0oyzylM6PKjlqGcBBcB0+w8I4L93cScTcRI07ARzhig2+xcpAnwonlHY3QlK
	3t2CJ+UJ429TvOFTkQzXQL9J1jWkm2YGGPGX0C52K8tzDWANXamImjRh/q37GBZi3LXqJmVgYbqO9
	qyPvOYaw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdt1-00093q-0o; Mon, 27 Feb 2023 13:49:51 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7835530030B;
	Mon, 27 Feb 2023 14:49:49 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 56A33200AAFE3; Mon, 27 Feb 2023 14:49:49 +0100 (CET)
Date: Mon, 27 Feb 2023 14:49:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
Message-ID: <Y/y0/VoPAVCXGKp3@hirez.programming.kicks-ass.net>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <Y/ZLH5F8LA3H10aL@hirez.programming.kicks-ass.net>
 <17f40b7c-f98d-789d-fa19-12ec077b756a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17f40b7c-f98d-789d-fa19-12ec077b756a@intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org, intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023 at 10:24:19PM +0100, Andrzej Hajda wrote:
> On 22.02.2023 18:04, Peter Zijlstra wrote:
> > On Wed, Jan 18, 2023 at 04:35:22PM +0100, Andrzej Hajda wrote:
> > 
> > > Andrzej Hajda (7):
> > >    arch: rename all internal names __xchg to __arch_xchg
> > >    linux/include: add non-atomic version of xchg
> > >    arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
> > >    llist: simplify __llist_del_all
> > >    io_uring: use __xchg if possible
> > >    qed: use __xchg if possible
> > >    drm/i915/gt: use __xchg instead of internal helper
> > 
> > Nothing crazy in here I suppose, I somewhat wonder why you went through
> > the trouble, but meh.
> 
> If you are asking why I have proposed this patchset, then the answer is
> simple, 1st I've tried to find a way to move internal i915 helper to core
> (see patch 7).
> Then I was looking for possible other users of this helper. And apparently
> there are many of them, patches 3-7 shows some.
> 
> 
> > 
> > You want me to take this through te locking tree (for the next cycle,
> > not this one) where I normally take atomic things or does someone else
> > want this?
> 
> If you could take it I will be happy.

OK, I'll go queue it in tip/locking/core after -rc1. Thanks!
