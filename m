Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 560693F47C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 11:39:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtRzP2DHcz2yJ9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 19:39:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kSkRM+Ll;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=kSkRM+Ll; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtRyF4fQ5z2xtM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 19:38:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TFmRCKg4zXF97Z6BgErRkb8Iycca9xXXxIRl12/WHgg=; b=kSkRM+LlJJrTsSvfM6O/7XH1Tz
 Ci3sp3o7sH6IKjlsicobpfxSPyEeMfpXnArHbkefEJF2Q29bAGCkeVGrZxZ00i5Ss9dkR6qeO04zY
 +WtCnQlwHA7stH2WCpaf4bMAkw5MEoL2Z6JwtYV1lW2N4MNElr0rAo/azyGIlWKOwWhSdnGzRsrFX
 itE5xwH0nBbNlt6ecP134A5E2Iai0zu59/BEFcgfoC+lpMtjoUJX0gOTm33t3/LPrm7kQ4QHllPZp
 NzJ2vFtruTSN+pGNTBuFtxA24L5vbWM2VYfdZpm8SrQg57PSIthkMKP99J5xu1l0UB+A27wgIs6kl
 cMdIAgIQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI6OP-009YNm-5D; Mon, 23 Aug 2021 09:37:34 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5169C300399;
 Mon, 23 Aug 2021 11:37:19 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2FE8F202294B8; Mon, 23 Aug 2021 11:37:19 +0200 (CEST)
Date: Mon, 23 Aug 2021 11:37:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/3] Updates to powerpc for robust CPU online/offline
Message-ID: <YSNsT1Mr1hcNr6iz@hirez.programming.kicks-ass.net>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
 <YSNdWhxVWtMJKAWi@hirez.programming.kicks-ass.net>
 <20210823093437.GJ21942@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823093437.GJ21942@linux.vnet.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 23, 2021 at 03:04:37PM +0530, Srikar Dronamraju wrote:
> * Peter Zijlstra <peterz@infradead.org> [2021-08-23 10:33:30]:
> 
> > On Sat, Aug 21, 2021 at 03:55:32PM +0530, Srikar Dronamraju wrote:
> > > Scheduler expects unique number of node distances to be available
> > > at boot. It uses node distance to calculate this unique node
> > > distances. On Power Servers, node distances for offline nodes is not
> > > available. However, Power Servers already knows unique possible node
> > > distances. Fake the offline node's distance_lookup_table entries so
> > > that all possible node distances are updated.
> > > 
> > > For example distance info from numactl from a fully populated 8 node
> > > system at boot may look like this.
> > > 
> > > node distances:
> > > node   0   1   2   3   4   5   6   7
> > >   0:  10  20  40  40  40  40  40  40
> > >   1:  20  10  40  40  40  40  40  40
> > >   2:  40  40  10  20  40  40  40  40
> > >   3:  40  40  20  10  40  40  40  40
> > >   4:  40  40  40  40  10  20  40  40
> > >   5:  40  40  40  40  20  10  40  40
> > >   6:  40  40  40  40  40  40  10  20
> > >   7:  40  40  40  40  40  40  20  10
> > > 
> > > However the same system when only two nodes are online at boot, then
> > > distance info from numactl will look like
> > > node distances:
> > > node   0   1
> > >   0:  10  20
> > >   1:  20  10
> > > 
> > > With the faked numa distance at boot, the node distance table will look
> > > like
> > > node   0   1   2
> > >   0:  10  20  40
> > >   1:  20  10  40
> > >   2:  40  40  10
> > > 
> > > The actual distance will be populated once the nodes are onlined.
> > 
> > How did you want all this merged? I picked up Valentin's patch, do you
> > want me to pick up these PowerPC patches in the same tree, or do you
> > want to route them seperately?
> 
> While both (the patch you accepted and this series) together help solve the
> problem, I think there is no hard dependency between the two. Hence I would
> think it should be okay to go through the powerpc tree.
> 

OK, works for me, thanks!
