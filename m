Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 300DC23B910
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 12:48:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLWhN4W9mzDqb0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 20:48:52 +1000 (AEST)
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
 header.s=merlin.20170209 header.b=YQRDXeVG; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLWf52SzQzDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 20:46:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+6Tt80sUg+tg0PdE7s0Kuf5aRtc3dDNucVqs4QUfFJo=; b=YQRDXeVGnrpdvgOV9toahm8icy
 oY5/5JySL/IwyPGKSuJ94/W3EiqpEYNbwAS2+Afrhvcq3qTwJfxbD803u4gx1jxnZ7n0/hlKb6sqJ
 5d1+q5DC0NTdCUs2yIv4/sQQ/VOjPuaN4GqytK6eKOrLx2jtNY1DjgiurB/UcJeD/PxGqsrO1iN0R
 qF43d+qNaJ9uw73bDhLTCXEPiltwEzF2GFgA+ErH8g1/0yQaw3QLrEmQMVABdQSBIpn8nWKz8ieRn
 XxOK8EJOu9X+T6284ZuLrUq2Qx+QIYuXbL8/QJm4CFT+RSOJlYo0K2088DuiVxFABe87+qcezB/9+
 aJk5+WGQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2uSz-0001Kt-Dn; Tue, 04 Aug 2020 10:46:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B9F94301631;
 Tue,  4 Aug 2020 12:46:42 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id AB51A2B94E749; Tue,  4 Aug 2020 12:46:42 +0200 (CEST)
Date: Tue, 4 Aug 2020 12:46:42 +0200
From: peterz@infradead.org
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/topology: Override cpu_smt_mask
Message-ID: <20200804104642.GC2657@hirez.programming.kicks-ass.net>
References: <20200804033307.76111-1-srikar@linux.vnet.ibm.com>
 <20200804033307.76111-2-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804033307.76111-2-srikar@linux.vnet.ibm.com>
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

On Tue, Aug 04, 2020 at 09:03:07AM +0530, Srikar Dronamraju wrote:
> On Power9 a pair of cores can be presented by the firmware as a big-core
> for backward compatibility reasons, with 4 threads per (small) core and 8
> threads per big-core. cpu_smt_mask() should generally point to the cpu mask
> of the (small)core.
> 
> In order to maintain userspace backward compatibility (with Power8 chips in
> case of Power9) in enterprise Linux systems, the topology_sibling_cpumask
> has to be set to big-core. Hence override the default cpu_smt_mask() to be
> powerpc specific allowing for better scheduling behaviour on Power.

Why does Linux userspace care about this?
