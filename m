Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B52A82CC258
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 17:32:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmPdK5mYhzDr6d
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 03:32:21 +1100 (AEDT)
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
 header.s=merlin.20170209 header.b=nMLwDQ5G; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmPZX61R7zDr0k
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 03:29:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=GlOw3b7M/4i8hX4WqqCNrb13MBql3ucRIPQK5dDn1/s=; b=nMLwDQ5GVq0wfCdJBRBFD4WitS
 hcPd9A53uhlZQMAVq1dXH6tjQcVY6pI21qKQvKHspz/qVnC0v0XcnYlTplV5CSHAaGLL0EPAif2xm
 3wnzYMGe0wFR8V+k3GX8BiwFRZQnUZu9actZuVGxAFG6LzR891aaFQj8PfjXuTVLZGYN3iQA5K+ZX
 BTvarfmDZ0EPpGuqWfwcKZfa1ZgoNpKIVj8SJmXRh0w71G9MT6ycw9dx/Q1JAFLnYwNyZ51OGDkke
 x2Z9mhY06HCkOxWH7QAJTMsy4heBYrcud3ETkLY7/nyqkvJmO9sQmplh/HPQnnNcRnMTnewrA12w8
 MujyVPTg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkV0h-0004AB-Dg; Wed, 02 Dec 2020 16:29:43 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 96BE13035D4;
 Wed,  2 Dec 2020 17:29:41 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 73661201F097E; Wed,  2 Dec 2020 17:29:41 +0100 (CET)
Date: Wed, 2 Dec 2020 17:29:41 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 6/8] lazy tlb: shoot lazies, a non-refcounting lazy tlb
 option
Message-ID: <20201202162941.GB2414@hirez.programming.kicks-ass.net>
References: <20201202141957.GJ3021@hirez.programming.kicks-ass.net>
 <BA2FB4C0-55EA-481A-824C-95B94EA29FAB@amacapital.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BA2FB4C0-55EA-481A-824C-95B94EA29FAB@amacapital.net>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 02, 2020 at 06:38:12AM -0800, Andy Lutomirski wrote:
> 
> > On Dec 2, 2020, at 6:20 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > ﻿On Sun, Nov 29, 2020 at 02:01:39AM +1000, Nicholas Piggin wrote:
> >> +         * - A delayed freeing and RCU-like quiescing sequence based on
> >> +         *   mm switching to avoid IPIs completely.
> > 
> > That one's interesting too. so basically you want to count switch_mm()
> > invocations on each CPU. Then, periodically snapshot the counter on each
> > CPU, and when they've all changed, increment a global counter.
> > 
> > Then, you snapshot the global counter and wait for it to increment
> > (twice I think, the first increment might already be in progress).
> > 
> > The only question here is what should drive this machinery.. the tick
> > probably.
> > 
> > This shouldn't be too hard to do I think.
> > 
> > Something a little like so perhaps?
> 
> I don’t think this will work.  A CPU can go idle with lazy mm and nohz
> forever.  This could lead to unbounded memory use on a lightly loaded
> system.

Hurm.. quite so indeed. Fixing that seems to end up with requiring that
other proposal, such that we can tell which CPU has what active_mm
stuck.

Also, more complicated... :/
