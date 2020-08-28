Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0521255937
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 13:17:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdHB307YszDqpq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 21:17:15 +1000 (AEST)
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
 header.s=merlin.20170209 header.b=NfCCiLf0; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdH8C1GrQzDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 21:15:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vIhwCesJTseG3yB623ZttocnuTn6e3tnM3q7J6zZ9Kg=; b=NfCCiLf0zc5PcQJaZCCJsN4tCi
 2CY6IwnecyFSbp6lPV8ze1xb1XBG8QfJS+RdwfRMOUnxfiJQ1RLugGon18Dym+KeLYaWPT07BXRSE
 XO3OCsaiEsU4YK1f0HeJgmcDRhF9/QLxNm5aElYdGB3PcitsmpLCjjjKr52xghLl4P+G/PFTnBQ7r
 udW0s+yDs+pLSFrhILeJk9e3uETXurfC2LOSwa0Mm1GfqkUhWVKKyC5Xbp5UdMyoPKKICHetVEZOw
 b/8Kg0HeUqMJYd8H5jqBgU7WA+lCIg4Lk8QjTLcmb1sz0tiB+mR9yOgygok6g+Yu1FPVY9EuHhfgq
 wE45mhiA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBcLv-0003dw-E1; Fri, 28 Aug 2020 11:15:27 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 81649300238;
 Fri, 28 Aug 2020 13:15:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 331F52C56DB14; Fri, 28 Aug 2020 13:15:25 +0200 (CEST)
Date: Fri, 28 Aug 2020 13:15:25 +0200
From: peterz@infradead.org
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/4] mm: fix exec activate_mm vs TLB shootdown and lazy
 tlb switching race
Message-ID: <20200828111525.GX1362448@hirez.programming.kicks-ass.net>
References: <20200828100022.1099682-1-npiggin@gmail.com>
 <20200828100022.1099682-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828100022.1099682-2-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 28, 2020 at 08:00:19PM +1000, Nicholas Piggin wrote:

> Closing this race only requires interrupts to be disabled while ->mm
> and ->active_mm are being switched, but the TLB problem requires also
> holding interrupts off over activate_mm. Unfortunately not all archs
> can do that yet, e.g., arm defers the switch if irqs are disabled and
> expects finish_arch_post_lock_switch() to be called to complete the
> flush; um takes a blocking lock in activate_mm().

ARM at least has activate_mm() := switch_mm(), so it could be made to
work.
