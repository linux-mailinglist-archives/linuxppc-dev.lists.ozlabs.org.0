Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2F54231AB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 22:23:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP8Cw5FYVz2ywS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 07:23:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=MUpHCsfn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=MUpHCsfn; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP8C73p99z2yJ9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 07:22:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+8X5bhOq6FZhcb3qINVEcr3c5ULv6DfdL9C3Qj2SrpQ=; b=MUpHCsfnUDPsrJaINQKVwTGzod
 SQHHHLABNDthwLhAwW9/RsYLycFVOi5Noiv+IXx27yRs8eUSdgGaKxfB8R23ngaKH/PqrZ8lJNQ6R
 9ePe6xJjb4tTUU3t+lG6dkKRzUY807bOvyZTKXnhLW3aUs/I1dIypFanY/UXsqTYDgOywDJq/6yvJ
 N1sff/pAd8zrpF3ZwiEg/aEuU8Ut52/unlb60rMNUnsrNW244g0s+Gu9QrlcreQNSkCk9MBU2Lh/9
 OTA5WhHbUX6umVUx2LU3Lj5XaLVnIzTzdUpGwJ/scnTnn3dpddgzSKrSlrvsOitHPs3kOdBAu4eHH
 mFJh2ODw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXqv9-000EvW-TX; Tue, 05 Oct 2021 20:20:24 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 67BE0981AAA; Tue,  5 Oct 2021 22:20:15 +0200 (CEST)
Date: Tue, 5 Oct 2021 22:20:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH 2/4] perf: Add mem_hops field in perf_mem_data_src
 structure
Message-ID: <20211005202015.GC174703@worktop.programming.kicks-ass.net>
References: <20211005091837.250044-1-kjain@linux.ibm.com>
 <20211005091837.250044-2-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005091837.250044-2-kjain@linux.ibm.com>
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

On Tue, Oct 05, 2021 at 02:48:35PM +0530, Kajol Jain wrote:
> Going forward, future generation systems can have more hierarchy
> within the chip/package level but currently we don't have any data source
> encoding field in perf, which can be used to represent this level of data.
> 
> Add a new field called 'mem_hops' in the perf_mem_data_src structure
> which can be used to represent intra-chip/package or inter-chip/off-package
> details. This field is of size 3 bits where PERF_MEM_HOPS_{NA, 0..6} value
> can be used to present different hop levels data.
> 
> Also add corresponding macros to define mem_hop field values
> and shift value.
> 
> Currently we define macro for HOPS_0 which corresponds
> to data coming from another core but same chip.
> 
> For ex: Encodings for mem_hops fields with L2 cache:
> 
> L2			- local L2
> L2 | REMOTE | HOPS_0	- remote core, same chip L2

Can we do s/chip/node/ ? Hops are something NUMA related, while chips
come in a bag or something :-)

> +/* hop level */
> +#define PERF_MEM_HOPS_0		0x01 /* remote core, same chip */
> +/* 2-7 available */
> +#define PERF_MEM_HOPS_SHIFT	43
