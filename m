Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B79424D6D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 08:51:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ26N1GT0z3bX0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 17:51:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=N+CikdAs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=N+CikdAs; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ25d4MhCz2yLV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 17:50:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=r7RxJJsMsG57QM8OssME2T//95638Yr+53YLvxiUMPo=; b=N+CikdAsaH/XyP+DtK2BYK0ngf
 26yBIimbP939gKxyWwaB6Ai3vMCeNCbOGem354X/5uRDiwlSpBLJ4QQI9cSwk/eyf6rd0cErjeBnu
 dJsGBT1D4TzrSly45cZ/gOEzWvMPf7dipk1tGjlPKUJ+J9/UIzhePpZ9+stfkO3G9AUOfn1CGtVBl
 3W9wCJtJx3boVHSsG70iOjPB4Y+vOiPCrxnzYgnUAHJBmPXDaA7RKIBD8GkrSO0MzXWZGPCpPTtLK
 /U/gMKbPCjVeKkmrgAKIZu6UghiS5GrMiWriHvI2FZKkhBI+lFU8dgh/uiRPYc5+4CwwGiLE0ntWA
 92lCycdw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNDi-001bQI-Da; Thu, 07 Oct 2021 06:49:41 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id C9EE998623A; Thu,  7 Oct 2021 08:49:33 +0200 (CEST)
Date: Thu, 7 Oct 2021 08:49:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v3 0/4] Add mem_hops field in perf_mem_data_src structure
Message-ID: <20211007064933.GK174703@worktop.programming.kicks-ass.net>
References: <20211006140654.298352-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006140654.298352-1-kjain@linux.ibm.com>
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
 alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 acme@kernel.org, ast@kernel.org, linux-perf-users@vger.kernel.org,
 yao.jin@linux.intel.com, mingo@redhat.com, paulus@samba.org,
 maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org,
 songliubraving@fb.com, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 06, 2021 at 07:36:50PM +0530, Kajol Jain wrote:

> Kajol Jain (4):
>   perf: Add comment about current state of PERF_MEM_LVL_* namespace and
>     remove an extra line
>   perf: Add mem_hops field in perf_mem_data_src structure
>   tools/perf: Add mem_hops field in perf_mem_data_src structure
>   powerpc/perf: Fix data source encodings for L2.1 and L3.1 accesses
> 
>  arch/powerpc/perf/isa207-common.c     | 26 +++++++++++++++++++++-----
>  arch/powerpc/perf/isa207-common.h     |  2 ++
>  include/uapi/linux/perf_event.h       | 19 ++++++++++++++++---
>  tools/include/uapi/linux/perf_event.h | 19 ++++++++++++++++---
>  tools/perf/util/mem-events.c          | 20 ++++++++++++++++++--
>  5 files changed, 73 insertions(+), 13 deletions(-)

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

How do we want this routed? Shall I take it, or does Michael want it in
the Power tree?
