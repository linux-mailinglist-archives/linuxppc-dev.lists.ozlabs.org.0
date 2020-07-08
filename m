Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CE42182C0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 10:43:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1tB63ycVzDr2r
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 18:43:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=90.155.50.34; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=s35D4xLy; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1t8D3gxRzDqwl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 18:41:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=S32XUF0JR40sOoi2lYA1Jt2WlEew0VlzGuJ1gwYbhcU=; b=s35D4xLyvnkYZU4YcWf+9NjRFK
 qAGphMcWSVhYkoJc8aLz2jh51DodnUkao4ypjVVvtlh5fcEIsMpk6UdXCby8V2qdZA2gSM5VTx11d
 ejcgbzpQUBqwaR783SFDpecCm7eKgFdgoL4fECk9Qy30bGquxIr924rnywePvDNug5/GOl4mBqpIf
 yhYDUhFAoVr+rZtcrUHltrwRK7hN7qpv20iSjblFycKsMdUlki/Rvlx96bthlu203IRbVK2rv+Qyz
 fe6lVWcbvlapeHkqUU1cRfS5tDsGg7qLw6HfdJdLjRTuWghNE1CJUhLCA2Q5UKIbSoK08YZTIcjeG
 XvtIgbgA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jt5df-0008Ee-Rc; Wed, 08 Jul 2020 08:41:16 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BAE6F304D58;
 Wed,  8 Jul 2020 10:41:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A7CDA203D34DE; Wed,  8 Jul 2020 10:41:06 +0200 (CEST)
Date: Wed, 8 Jul 2020 10:41:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
Message-ID: <20200708084106.GE597537@hirez.programming.kicks-ass.net>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594101082.hfq9x5yact.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 07, 2020 at 03:57:06PM +1000, Nicholas Piggin wrote:
> Yes, powerpc could certainly get more performance out of the slow
> paths, and then there are a few parameters to tune.

Can you clarify? The slow path is already in use on ARM64 which is weak,
so I doubt there's superfluous serialization present. And Will spend a
fair amount of time on making that thing guarantee forward progressm, so
there just isn't too much room to play.

> We don't have a good alternate patching for function calls yet, but
> that would be something to do for native vs pv.

Going by your jump_label implementation, support for static_call should
be fairly straight forward too, no?

  https://lkml.kernel.org/r/20200624153024.794671356@infradead.org
