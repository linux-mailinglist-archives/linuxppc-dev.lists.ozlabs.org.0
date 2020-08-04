Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE4C23B90A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 12:47:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLWfV3XTDzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 20:47:14 +1000 (AEST)
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
 header.s=merlin.20170209 header.b=LioAvB/i; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLWcZ6zjWzDqWm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 20:45:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=w5o5IcAoNXwLVf59c401lTKK0QArdzdHQ89b1oA1ILw=; b=LioAvB/iKgUeNOGdS6342XE/WZ
 nRhe2eYGe9CGIXNs0McyJ7E1ly+G+Vj6Qe81zusLriWie0PCmW8m97VWpfGS/pBrEYsdW7z086s3O
 gKyBtV30aLLnMB5k7eOLgs0P1O/cqftYA9QcP7nFWF5eFvOpub9Dqh/ykq/tRhUl8o9+v0lq04wwM
 GVVcVmjdybTNg+ZoqfT+9FjtYyKuAAUdGSi5yCrN2mnMdL0S/U2VC22sbBHiqbYaA2QgIWuidATd2
 FQThuaXFPax0FXVcGtokbfXJleTGWpc/qyrF5J0YfFRFIGOjHOd68m0a3xDhydCeR10lLQC9/iZS6
 HCMsY0Aw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2uRf-00013s-Gz; Tue, 04 Aug 2020 10:45:23 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D8778301A66;
 Tue,  4 Aug 2020 12:45:20 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 9C5AC2B94E749; Tue,  4 Aug 2020 12:45:20 +0200 (CEST)
Date: Tue, 4 Aug 2020 12:45:20 +0200
From: peterz@infradead.org
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] sched/topology: Allow archs to override cpu_smt_mask
Message-ID: <20200804104520.GB2657@hirez.programming.kicks-ass.net>
References: <20200804033307.76111-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804033307.76111-1-srikar@linux.vnet.ibm.com>
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
 Vincent Guittot <vincent.guittot@linaro.org>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 04, 2020 at 09:03:06AM +0530, Srikar Dronamraju wrote:
> cpu_smt_mask tracks topology_sibling_cpumask. This would be good for
> most architectures. One of the users of cpu_smt_mask(), would be to
> identify idle-cores. On Power9, a pair of cores can be presented by the
> firmware as a big-core for backward compatibility reasons.
> 
> In order to maintain userspace backward compatibility with previous
> versions of processor, (since Power8 had SMT8 cores), Power9 onwards there
> is option to the firmware to advertise a pair of SMT4 cores as a fused
> cores (referred to as the big_core mode in the Linux Kernel). On Power9
> this pair shares the L2 cache as well. However, from the scheduler's point
> of view, a core should be determined by SMT4. The load-balancer already
> does this. Hence allow PowerPc architecture to override the default
> cpu_smt_mask() to point to the SMT4 cores in a big_core mode.

I'm utterly confused.

Why can't you set your regular siblings mask to the smt4 thing? Who
cares about the compat stuff, I thought that was an LPAR/AIX thing.
