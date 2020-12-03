Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9E22CDC0F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 18:13:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cn2Vp3QrJzDqTw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 04:13:54 +1100 (AEDT)
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
 header.s=casper.20170209 header.b=jeeAqf55; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cn2R66d97zDrJB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 04:10:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0lhCxHLgf8TSOAvypxgyZdt6AOtyZg3i7+GSOy69WwU=; b=jeeAqf558AfAqY1ZPTR4HfNgwX
 YopjYarSwRSdQuGeGyjCSNFpvTWHEYq7+8CHvDrMVdGazF9BvP9no40RR9phvvpP85cND+YTv5ln8
 KPsTGbcRveY23zSbT4NayaXcOaWGv8eD84pD4++pebfb9TdeUpWsXFyBzsbMD+4DIqsHk8ZIrsRiW
 I7PtW3gWf5TUhQ5JidDUj/TGspfxPwztfLhtU0q/hd+wkoe4vNNFcR8XRjZIn82vi+bkd0ZTVcg/Z
 fo0RR2g2KJYGfC5KQ9XiTR/EvLYuZJdjOjJWpHZAgMtF0E4z09yRlsVs8vjqzUSCTdzo9+Ps9L8Qg
 SgThpYbg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kks7U-0000Aw-Oc; Thu, 03 Dec 2020 17:10:17 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 71A073059DD;
 Thu,  3 Dec 2020 18:10:15 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5647C2029C718; Thu,  3 Dec 2020 18:10:15 +0100 (CET)
Date: Thu, 3 Dec 2020 18:10:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH AUTOSEL 5.9 27/39] sched/idle: Fix arch_cpu_idle() vs
 tracing
Message-ID: <20201203171015.GN2414@hirez.programming.kicks-ass.net>
References: <20201203132834.930999-1-sashal@kernel.org>
 <20201203132834.930999-27-sashal@kernel.org>
 <20201203145442.GC9994@osiris>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203145442.GC9994@osiris>
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
Cc: Sasha Levin <sashal@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-csky@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 03, 2020 at 03:54:42PM +0100, Heiko Carstens wrote:
> On Thu, Dec 03, 2020 at 08:28:21AM -0500, Sasha Levin wrote:
> > From: Peter Zijlstra <peterz@infradead.org>
> > 
> > [ Upstream commit 58c644ba512cfbc2e39b758dd979edd1d6d00e27 ]
> > 
> > We call arch_cpu_idle() with RCU disabled, but then use
> > local_irq_{en,dis}able(), which invokes tracing, which relies on RCU.
> > 
> > Switch all arch_cpu_idle() implementations to use
> > raw_local_irq_{en,dis}able() and carefully manage the
> > lockdep,rcu,tracing state like we do in entry.
> > 
> > (XXX: we really should change arch_cpu_idle() to not return with
> > interrupts enabled)
> > 
> > Reported-by: Sven Schnelle <svens@linux.ibm.com>
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Reviewed-by: Mark Rutland <mark.rutland@arm.com>
> > Tested-by: Mark Rutland <mark.rutland@arm.com>
> > Link: https://lkml.kernel.org/r/20201120114925.594122626@infradead.org
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> This patch broke s390 irq state tracing. A patch to fix this is
> scheduled to be merged upstream today (hopefully).
> Therefore I think this patch should not yet go into 5.9 stable.

Agreed.
