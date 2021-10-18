Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6E44313D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 11:49:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXsXw172Pz2ywX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 20:49:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aj+6l2L+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=aj+6l2L+; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXsX86w8Hz2xsy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 20:48:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=54V1KnQoB6CDT102wu6F0M83i4Ai4wrcXeBm3THLwu4=; b=aj+6l2L+bEScCV3CfEXP+uvaMu
 jErIR9Py+fscLbiqDt5e048vdPHkQuepfbpyy8PD9OEYEjBzipbDqwdWyscNUauhnhvZCSmo9hsBF
 akIbMNiUHz/DRDjr6g+Fgb/DbLxT7xBg4u1LbI63SOZB5YYk6DYceJvRIQlwzXId9F6aE3c8kN9mm
 36j4f9+VFNeI6ejRAngTrZNsObQF2gp1qu7KyRWlyDHiB0yuYCngFKZUTy1/Ly9ET6BbJCfQhfZ+E
 zn9mOvu6rvSJWgIJCgjI1/vZYsHJOcsn49S8jHVKn/L2DdGOzdJglzpYDC9EFU+n3Ry8rVjD66Ax4
 Ev5FQh0g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcPFo-00AWdP-Fu; Mon, 18 Oct 2021 09:48:24 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D5BDF300242;
 Mon, 18 Oct 2021 11:48:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B17B62013A69E; Mon, 18 Oct 2021 11:48:22 +0200 (CEST)
Date: Mon, 18 Oct 2021 11:48:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 0/4] Add mem_hops field in perf_mem_data_src structure
Message-ID: <YW1C5okzq/1BSLQy@hirez.programming.kicks-ass.net>
References: <20211006140654.298352-1-kjain@linux.ibm.com>
 <20211007064933.GK174703@worktop.programming.kicks-ass.net>
 <87pms3c7w5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pms3c7w5.fsf@mpe.ellerman.id.au>
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
Cc: mark.rutland@arm.com, atrajeev@linux.vnet.ibm.com, ak@linux.intel.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com,
 alexander.shishkin@linux.intel.com, Kajol Jain <kjain@linux.ibm.com>,
 linux-kernel@vger.kernel.org, acme@kernel.org, ast@kernel.org,
 linux-perf-users@vger.kernel.org, yao.jin@linux.intel.com, mingo@redhat.com,
 paulus@samba.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org,
 songliubraving@fb.com, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 18, 2021 at 02:46:18PM +1100, Michael Ellerman wrote:
> Peter Zijlstra <peterz@infradead.org> writes:
> > On Wed, Oct 06, 2021 at 07:36:50PM +0530, Kajol Jain wrote:
> >
> >> Kajol Jain (4):
> >>   perf: Add comment about current state of PERF_MEM_LVL_* namespace and
> >>     remove an extra line
> >>   perf: Add mem_hops field in perf_mem_data_src structure
> >>   tools/perf: Add mem_hops field in perf_mem_data_src structure
> >>   powerpc/perf: Fix data source encodings for L2.1 and L3.1 accesses
> >> 
> >>  arch/powerpc/perf/isa207-common.c     | 26 +++++++++++++++++++++-----
> >>  arch/powerpc/perf/isa207-common.h     |  2 ++
> >>  include/uapi/linux/perf_event.h       | 19 ++++++++++++++++---
> >>  tools/include/uapi/linux/perf_event.h | 19 ++++++++++++++++---
> >>  tools/perf/util/mem-events.c          | 20 ++++++++++++++++++--
> >>  5 files changed, 73 insertions(+), 13 deletions(-)
> >
> > Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> >
> > How do we want this routed? Shall I take it, or does Michael want it in
> > the Power tree?
> 
> It's mostly non-powerpc, so I think you should take it.
> 
> There's a slim chance we could end up with a conflict in the powerpc
> part, but that's no big deal.

Sure thing, into perf/core it goes. Thanks!
